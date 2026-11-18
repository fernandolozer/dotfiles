# Keymaps

Symlink these files into each IDE's config directory so the IDE reads them directly from this repo.

## Paths reference

| IDE | Windows | Linux |
|---|---|---|
| Rider | `%APPDATA%\JetBrains\Rider<version>\keymaps\` | `~/.config/JetBrains/Rider<version>/keymaps/` |
| WebStorm | `%APPDATA%\JetBrains\WebStorm<version>\keymaps\` | `~/.config/JetBrains/WebStorm<version>/keymaps/` |
| Zed | `%APPDATA%\Zed\keymap.json` | `~/.config/zed/keymap.json` |

---

## Windows (PowerShell — requires Admin or Developer Mode enabled)

```powershell
$DOTFILES = "$env:USERPROFILE\Documents\dotfiles"

# Rider
$riderDir = (Get-ChildItem "$env:APPDATA\JetBrains" -Filter "Rider*" | Sort-Object Name -Descending | Select-Object -First 1).FullName
New-Item -Path "$riderDir\keymaps" -ItemType Directory -Force
New-Item -ItemType SymbolicLink -Path "$riderDir\keymaps\rider_keymap.xml" -Target "$DOTFILES\keymaps\rider_keymap.xml"

# WebStorm
$wsDir = (Get-ChildItem "$env:APPDATA\JetBrains" -Filter "WebStorm*" | Sort-Object Name -Descending | Select-Object -First 1).FullName
New-Item -Path "$wsDir\keymaps" -ItemType Directory -Force
New-Item -ItemType SymbolicLink -Path "$wsDir\keymaps\webstorm_keymap.xml" -Target "$DOTFILES\keymaps\webstorm_keymap.xml"

# Zed
New-Item -ItemType SymbolicLink -Path "$env:APPDATA\Zed\keymap.json" -Target "$DOTFILES\keymaps\zed_keymap.json"
```

> **Note:** Symlink creation requires either running PowerShell as Administrator or having [Developer Mode](https://learn.microsoft.com/en-us/windows/apps/get-started/enable-your-device-for-development) enabled.

---

## Linux (Fedora KDE)

```bash
DOTFILES="$HOME/dotfiles"  # adjust if cloned elsewhere

# Rider
RIDER_VERSION=$(ls ~/.config/JetBrains/ | grep -i "^Rider" | sort -V | tail -1)
mkdir -p ~/.config/JetBrains/$RIDER_VERSION/keymaps
ln -sf "$DOTFILES/keymaps/rider_keymap.xml" ~/.config/JetBrains/$RIDER_VERSION/keymaps/rider_keymap.xml

# WebStorm
WS_VERSION=$(ls ~/.config/JetBrains/ | grep -i "^WebStorm" | sort -V | tail -1)
mkdir -p ~/.config/JetBrains/$WS_VERSION/keymaps
ln -sf "$DOTFILES/keymaps/webstorm_keymap.xml" ~/.config/JetBrains/$WS_VERSION/keymaps/webstorm_keymap.xml

# Zed
ln -sf "$DOTFILES/keymaps/zed_keymap.json" ~/.config/zed/keymap.json
```

> **Note:** The JetBrains version directory (e.g. `Rider2025.1`) is auto-detected by picking the latest. Run `ls ~/.config/JetBrains/` first to verify the directory exists before linking.
