@echo off
:: @prompt $p$_$g$s

rem Simple "ver" prints empty line before Windows version
rem Use this construction to print just a version info
cmd /d /c ver | "%windir%\system32\find.exe" "Windows"

rem Now we form the command prompt

rem Followed by colored `Path`
set ConEmuPrompt1=$E[92m$P$E[90m
if NOT "%PROCESSOR_ARCHITECTURE%" == "AMD64" (
  if "%PROCESSOR_ARCHITEW6432%" == "AMD64" if "%PROCESSOR_ARCHITECTURE%" == "x86" (
    rem Use another text color if cmd was run from SysWow64
    set ConEmuPrompt1=%ConEmuPrompt0%$E[93m$P$E[90m
  )
)

rem Carriage return and `$` or `#`
if /I "%ConEmuPromptNL%" == "NO" (set ConEmuPrompt2=) else (set ConEmuPrompt2=$_)
rem Spare `$E[90m` was specially added because of GitShowBranch.cmd
if "%ConEmuIsAdmin%" == "ADMIN" (
  set ConEmuPrompt2=%ConEmuPrompt2%$E[90m#
) else (
  set ConEmuPrompt2=%ConEmuPrompt2%$E[90m$g
)

rem Finally reset color and add notify ConEmu about prompt input start coords
set ConEmuPrompt3=$E[?25h$E[m$S$E]9;12$E\

rem Set new prompt
PROMPT %ConEmuPrompt1%%ConEmuPrompt2%%ConEmuPrompt3%

rem Support additional batch execution as `{cmd} "path\to\batch.cmd" <arguments>`
rem Due to parsing rules of cmd.exe last argument must NOT ends with "
if "%~1" == "" goto clean
rem We can't call here %* unfortunately
call %1 %2 %3 %4 %5 %6 %7 %8 %9

:clean
set ConEmuPrompt1=
set ConEmuPrompt2=
set ConEmuPrompt3=
