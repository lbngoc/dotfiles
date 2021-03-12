#!/usr/bin/env bash

## My custom
alias dc="docker-compose"
alias cat="bat -p"
mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" }

## ADB
alias adb:i="adb install"
alias adb:ui="adb uninstall"
alias adb:restart="adb kill-server && adb start-server"
alias adb:sh:stop="adb shell am force-stop"
alias adb:sh:ifconfig="adb shell ifconfig"
alias adb:sh:packages="adb shell pm list packages | awk -F \":\" '{print \$2}'"
alias adb:sh:select_home="adb shell am start -a android.intent.action.MAIN"
adb:sh:restart() {
	if [[ -z $1 ]]; then
		echo "Restart remote application on device"
		echo "Usage: adb:sh:restart <app.package.id>"
	else
		adb shell am force-stop $1
		adb shell monkey -p $1 -v 500
	fi
}

### Automatically call `nvm use`
# place this after nvm initialization!
autoload -U add-zsh-hook
load-nvmrc() {
	local node_version="$(nvm version)"
	local nvmrc_path="$(nvm_find_nvmrc)"

	if [ -n "$nvmrc_path" ]; then
		local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

		if [ "$nvmrc_node_version" = "N/A" ]; then
			nvm install
		elif [ "$nvmrc_node_version" != "$node_version" ]; then
			nvm use
		fi
	elif [ "$node_version" != "$(nvm version default)" ]; then
		echo "Reverting to nvm default version"
		nvm use default
	fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
