$profileDir = Split-Path -parent $profile
$componentDir = Join-Path $profileDir "components"

New-Item $profileDir -ItemType Directory -Force -ErrorAction SilentlyContinue
New-Item $componentDir -ItemType Directory -Force -ErrorAction SilentlyContinue

Copy-Item -Path ./*.ps1 -Destination $profileDir -Exclude "bootstrap.ps1"
Copy-Item -Path ./components/** -Destination $componentDir -Include **
Copy-Item -Path ./home/** -Destination $home -Include **

$destDir = "$HOME/.config/fastfetch"
New-Item -ItemType Directory -Path $destDir -Force | Out-Null

Copy-Item -Path "./home/fastfetch.config.jsonc" -Destination "$destDir/config.jsonc" -Force

$nvimDir = Join-Path $env:LOCALAPPDATA "nvim"
New-Item -ItemType Directory -Path "$nvimDir/lua/plugins" -Force | Out-Null
Copy-Item -Path ./nvim/* -Destination $nvimDir -Recurse -Force
Copy-Item -Path ../dotfiles-linux/nvim/lua/plugins/* -Destination "$nvimDir/lua/plugins" -Recurse -Force

# copy yazi folder to %appData%/yazi/config
$yaziDestDir = Join-Path $env:APPDATA "\yazi\config"
New-Item -ItemType Directory -Path $yaziDestDir -Force | Out-Null

Copy-Item -Path ./yazi/** -Destination $yaziDestDir -Recurse -Force

$zedDestDir = Join-Path $env:APPDATA "Zed"
New-Item -ItemType Directory -Path $zedDestDir -Force | Out-Null

Copy-Item -Path "../zed/keymap.json" -Destination "$zedDestDir/keymap.json" -Force

Remove-Variable componentDir
Remove-Variable profileDir
