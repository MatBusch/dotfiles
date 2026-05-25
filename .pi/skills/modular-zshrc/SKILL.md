---
name: modular-zshrc
description: Maintain this repo's modular zsh setup. Use when editing zshrc/dot-zshrc, zshrc/.config/zshrc/*, or syncing those modules to ~/.zshrc and ~/.config/zshrc on a machine.
---

# Modular zshrc

## Read first

- `zshrc/dot-zshrc`
- `zshrc/.config/zshrc/*`
- if working on a deployed machine, also read:
  - `~/.zshrc`
  - `~/.config/zshrc/*`
  - `~/.config/zshrc/custom/*`

## Structure rules

- Keep `zshrc/dot-zshrc` as a loader only.
- Shared modules belong in `zshrc/.config/zshrc/`.
- Machine-specific behavior belongs in `~/.config/zshrc/custom/` on the target machine, not in shared repo modules, unless the change should apply everywhere.
- Preserve numeric ordering:
  - `00-init`
  - `20-customisation`
  - `25-aliases`
  - `30-autostart`

## Editing guidance

1. Decide whether the change is shared or machine-specific.
2. Prefer guards like `command -v` or file checks for optional tools.
3. Avoid flattening the modular layout into one `.zshrc`.
4. When syncing from a machine back to this repo, update the matching file under `zshrc/`.
5. Keep prompt config in `ohmyposh/.config/ohmyposh/randalls-posh-prompt.json`.

## Validate

Run after changes:

```bash
zsh -n zshrc/dot-zshrc
zsh -n zshrc/.config/zshrc/00-init
zsh -n zshrc/.config/zshrc/20-customisation
zsh -n zshrc/.config/zshrc/25-aliases
zsh -n zshrc/.config/zshrc/30-autostart
```
