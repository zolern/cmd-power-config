@ECHO OFF

REM cc.cmd - Claude Code environment switcher (Command Prompt entry)
REM   cc ollama (cc o)  - use Ollama models from ollama-claude.conf
REM   cc claude (cc c)  - use original Anthropic API (clears all conf variables)
REM   cc help   (cc h)  - show this help
REM Optional: --file:<path> - use a custom config instead of ollama-claude.conf
REM   (may be placed before or after the mode)
REM NOTE: no SETLOCAL here on purpose - the SET changes must persist in the session.

SET "CC_CONF=%~dp0ollama-claude.conf"
SET "CC_MODE="

REM Scan the first two arguments for --file:<path> and the mode
SET "CC_ARG=%~1"
IF NOT DEFINED CC_ARG GOTO arg2
IF /I "%CC_ARG:~0,7%"=="--file:" (
    SET "CC_CONF=%CC_ARG:~7%"
) ELSE (
    SET "CC_MODE=%CC_ARG%"
)
:arg2
SET "CC_ARG=%~2"
IF NOT DEFINED CC_ARG GOTO argdone
IF /I "%CC_ARG:~0,7%"=="--file:" (
    SET "CC_CONF=%CC_ARG:~7%"
) ELSE (
    SET "CC_MODE=%CC_ARG%"
)
:argdone

IF /I "%CC_MODE%"=="o" SET "CC_MODE=ollama"
IF /I "%CC_MODE%"=="c" SET "CC_MODE=claude"
IF /I "%CC_MODE%"=="h" SET "CC_MODE=help"
IF "%CC_MODE%"=="" SET "CC_MODE=help"

IF /I "%CC_MODE%"=="ollama" GOTO ollama
IF /I "%CC_MODE%"=="claude" GOTO claude
GOTO help

:ollama
IF NOT EXIST "%CC_CONF%" GOTO noconf
ECHO Setting Claude Code to use Ollama models from "%CC_CONF%"
FOR /F "usebackq eol=# tokens=1,* delims==" %%A IN ("%CC_CONF%") DO (
    SET "%%A=%%B"
    SETX %%A "%%B" >NUL 2>&1
)
GOTO end

:claude
IF NOT EXIST "%CC_CONF%" GOTO noconf
ECHO Setting Claude Code to use original Anthropic API, clearing variables from "%CC_CONF%"
FOR /F "usebackq eol=# tokens=1,* delims==" %%A IN ("%CC_CONF%") DO (
    SET "%%A="
    REG DELETE HKCU\Environment /F /V %%A >NUL 2>&1
)
GOTO end

:help
ECHO.
ECHO Claude Code environment switcher
ECHO.
ECHO Usage: cc [options] ^<mode^>
ECHO.
ECHO   cc ollama  (cc o)   use Ollama models from ollama-claude.conf
ECHO   cc claude  (cc c)   use the original Anthropic API - clears all conf variables
ECHO   cc help    (cc h)   show this help
ECHO.
ECHO Options:
ECHO   --file:^<path^>   use a custom config file instead of ollama-claude.conf
ECHO.
GOTO end

:noconf
ECHO cc: config file not found: "%CC_CONF%"
ECHO cc: nothing changed.
SET "CC_ARG="
SET "CC_CONF="
SET "CC_MODE="
EXIT /B 1

:end
SET "CC_ARG="
SET "CC_CONF="
SET "CC_MODE="