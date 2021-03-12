export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="dst"
HIST_STAMPS="yyyy-mm-dd"

export UPDATE_ZSH_DAYS=30

# For Solarized
export TERM="xterm-256color"

# Biding some keys
bindkey '\e[1~' beginning-of-line #Home
bindkey '\e[4~' end-of-line #End
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line

# Default editor
export EDITOR="vi"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=$HOME/.oh-my-zsh/custom

# Install more useful plugins
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# brew install fzf && /usr/local/opt/fzf/install

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
plugins=(adb brew command-not-found debian docker docker-compose direnv fasd fancy-ctrl-z fzf git-extras gnu-utils npm nvm yarn pip python wp-cli sudo zsh_reload z zsh-syntax-highlighting zsh-autosuggestions)
# custom plugins: drall drs
# plugin common-aliases breaks execution of php scripts with shebang, why?

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Auto load
[ -f "/opt/homebrew/bin/brew" ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[[ -r "$HOME/.bash_profile" ]] && source "$HOME/.bash_profile"
[[ -r "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
