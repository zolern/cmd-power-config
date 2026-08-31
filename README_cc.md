# cmd-power-config

Windows CMD / Git Bash helper scripts. This folder is on `PATH`.

## cc — Claude Code environment switcher

Switches Claude Code between the original Anthropic API and a local Ollama
instance. Works the same in Command Prompt and Git Bash. One command, one
config file — no more keeping four scripts in sync.

### Usage

```text
cc ollama  (cc o)   configure Claude Code to use Ollama models
cc claude  (cc c)   configure Claude Code for the original Anthropic API
cc help    (cc h)   show usage
cc --file:<path>    optional: use a custom config file instead of
                    ollama-claude.conf (works in both shells)
```

Both modes apply to the current session AND persist in the user environment
(`HKCU\Environment`), so new terminals inherit the setting.

### Configuration — `ollama-claude.conf`

The single source of truth, located next to `cc.cmd`. One `KEY=VALUE` per
line; the keys are the actual environment variables Claude Code reads.
`#` comments and blank lines are ignored; empty values are allowed. Comments must start in column 1 — leading whitespace before `#` is not recognized.

To change an Ollama model, edit **this file only** — e.g. to make Sonnet
use a different model, change `ANTHROPIC_DEFAULT_SONNET_MODEL`. Both shells
pick it up on the next `cc ollama`. `cc claude` needs no maintenance: it
simply clears every key defined in the config.

Note: if you remove a key from the config, `cc claude` will no longer clear it (it clears exactly the keys the config defines). If you previously ran `cc ollama` with that key present, run `cc claude` once *before* removing the key — or clear it via System Properties → Environment Variables.

### How it works

- **Command Prompt:** `cc.cmd` — `SET` + `SETX` (ollama) or `SET` +
  `REG DELETE` (claude).
- **Git Bash:** `cc()` function in `gitbash/extra.sh` (sourced via
  `~/.bash_profile` → `.bash_profile` → `extra.sh`) — `export` + `setx`
  (ollama) or `unset` + `reg delete` (claude).

Note: `cc` used to be a Git Bash alias that started Claude Code. Start it
with `claude` directly instead.

### Legacy scripts (deprecated, kept for compatibility)

`oclaude.cmd`, `oclaude.sh`, `cclaude.cmd`, `cclaude.sh` and their bash
wrappers `oclaude()` / `cclaude()` are superseded by `cc` and are no longer
maintained — they will drift from `ollama-claude.conf`. Retire them when
`cc` has proven itself.
