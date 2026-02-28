# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# ============================================================================
# Oh My Zsh Configuration - Enhanced Setup
# ============================================================================

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ============================================================================
# Theme Configuration
# ============================================================================
# Powerlevel10k is a fast and highly customizable theme
# If not installed, falls back to agnoster
ZSH_THEME="powerlevel10k/powerlevel10k"
# Fallback themes: agnoster, spaceship, essembeh

# ============================================================================
# Oh My Zsh Update Configuration
# ============================================================================
zstyle ':omz:update' mode auto      # update automatically without asking
zstyle ':omz:update' frequency 7    # update every 7 days

# ============================================================================
# Plugins Configuration
# ============================================================================
plugins=(
    # Essential plugins
    git
    z                           # Jump to frequently used directories
    zsh-autosuggestions        # Fish-like autosuggestions
    zsh-syntax-highlighting    # Syntax highlighting for commands
    zsh-completions           # Additional completions

    # Utility plugins
    extract                    # Extract any archive with 'extract' command
    colored-man-pages         # Colorize man pages
    command-not-found         # Suggest packages for unknown commands
    sudo                      # ESC ESC to add sudo to current/previous command
    web-search               # Google search from terminal
    copyfile                 # Copy file contents to clipboard
    copypath                 # Copy current path to clipboard

    # Development plugins
    docker                   # Docker completion and aliases
    docker-compose          # Docker-compose completion
    npm                     # npm completion and aliases
    nvm                     # Node Version Manager
    rust                    # Rust development
    golang                  # Go development
    python                  # Python development
    pip                     # pip completion

    # System plugins
    systemd                 # systemctl shortcuts
    archlinux              # Arch Linux specific aliases (if applicable)
)

source $ZSH/oh-my-zsh.sh

# ============================================================================
# History Configuration
# ============================================================================
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_EXPIRE_DUPS_FIRST  # Remove oldest duplicates first
setopt HIST_IGNORE_DUPS        # Don't record identical consecutive commands
setopt HIST_IGNORE_ALL_DUPS    # Remove all previous duplicates
setopt HIST_FIND_NO_DUPS       # Don't display duplicates when searching
setopt HIST_SAVE_NO_DUPS       # Don't save duplicates
setopt HIST_REDUCE_BLANKS      # Remove unnecessary blank lines
setopt HIST_VERIFY             # Show command before executing from history
setopt INC_APPEND_HISTORY      # Append to history immediately
setopt SHARE_HISTORY           # Share history between sessions

# ============================================================================
# Directory Navigation
# ============================================================================
setopt AUTO_PUSHD              # Push directories to stack automatically
setopt PUSHD_IGNORE_DUPS       # Don't push duplicates to stack
setopt PUSHD_SILENT            # Don't print directory stack
setopt AUTO_CD                 # cd by just typing directory name
setopt CDABLE_VARS             # cd to variables

# ============================================================================
# Completion Configuration
# ============================================================================
setopt COMPLETE_ALIASES        # Complete aliases
setopt LIST_PACKED             # Use variable column widths for completions
# setopt MENU_COMPLETE         # Cycle through completions with TAB (disabled for traditional behavior)
setopt AUTO_MENU               # Show completion menu on successive tab press
setopt ALWAYS_TO_END           # Move cursor to end after completion
setopt COMPLETE_IN_WORD        # Complete from both ends of a word

# Load completions
autoload -U compinit && compinit -C

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# ============================================================================
# Environment Variables
# ============================================================================
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export BROWSER='firefox'
export LANG=en_US.UTF-8

# Path enhancements
export PATH="$HOME/.local/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin:$PATH"

# ============================================================================
# Basic Command Aliases
# ============================================================================
# ls enhancements
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -altr'          # Sort by time, newest last
alias lh='ls -alth'          # Human readable sizes with time sort

# Navigation shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ~='cd ~'
alias -- -='cd -'

# Directory operations
alias md='mkdir -p'
alias rd='rmdir'

# File operations
alias cp='cp -i'             # Interactive copy
alias mv='mv -i'             # Interactive move
alias ln='ln -i'             # Interactive link

# Safe rm: use trash-put if available, otherwise rm -i
if command -v trash-put >/dev/null; then
  alias rm='trash-put'       # Move to trash (use \rm for real delete)
  # Trash management aliases
  alias trash-ls='trash-list'
  alias trash-restore='trash-restore'
  alias trash-clear='trash-empty'
else
  alias rm='rm -i'           # Interactive remove (fallback)
fi

# ============================================================================
# System Information Aliases
# ============================================================================
alias df='df -h'             # Human readable disk usage
alias du='du -h'             # Human readable directory sizes
alias dus='du -sh'           # Summary of directory size
alias free='free -h'         # Human readable memory info
alias ps='ps aux'            # Full process list
alias top='htop'             # Better top
alias mount='mount | column -t'  # Pretty mount output

# ============================================================================
# Text Processing Aliases
# ============================================================================
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias less='less -R'         # Raw control characters for colors

# Modern replacements (if available)
command -v bat >/dev/null && alias cat='bat'
command -v exa >/dev/null && alias ls='exa' && alias ll='exa -la' && alias la='exa -a'
command -v fd >/dev/null && alias find='fd'
command -v rg >/dev/null && alias grep='rg'

# ============================================================================
# Git Aliases
# ============================================================================
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gp='git push'
alias gpu='git push -u origin'
alias gl='git pull'
alias gf='git fetch'
alias gd='git diff'
alias gdc='git diff --cached'
alias gb='git branch'
alias gba='git branch -a'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gm='git merge'
alias gr='git reset'
alias glog='git log --oneline --graph --decorate'
alias gloga='git log --oneline --graph --decorate --all'
alias glogp='git log --graph --pretty=format:"%C(yellow)%h%Creset - %s %C(green)(%cr) %C(blue)<%an>%Creset"'
alias gst='git stash'
alias gstp='git stash pop'
alias gstl='git stash list'

# ============================================================================
# Network Aliases
# ============================================================================
alias ping='ping -c 5'       # Limit ping to 5 packets
alias myip='curl ifconfig.me' # Get external IP
alias ports='netstat -tulpn' # Show open ports

# ============================================================================
# Development Aliases
# ============================================================================
# npm/yarn shortcuts
alias ni='npm install'
alias nid='npm install --save-dev'
alias nig='npm install -g'
alias nr='npm run'
alias ns='npm start'
alias nt='npm test'
alias nb='npm run build'

# Docker shortcuts
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpsa='docker ps -a'
alias di='docker images'
alias drm='docker rm'
alias drmi='docker rmi'

# Python shortcuts
alias py='python3'
alias pip='pip3'
alias venv='python3 -m venv'

# ============================================================================
# Custom Functions
# ============================================================================

# Create directory and navigate to it
mkcd() {
    mkdir -p "$@" && cd "$_"
}

# Find files by name
ff() {
    find . -name "*$1*" 2>/dev/null
}

# Search for text in files
ftext() {
    grep -r "$1" . 2>/dev/null
}

# Process search
psgrep() {
    ps aux | grep -v grep | grep "$@"
}

# Kill process by name
killp() {
    ps aux | grep -v grep | grep "$1" | awk '{print $2}' | xargs kill -9
}

# Check which process is using a port
port() {
    lsof -i :$1
}

# Extract various archive formats
extract() {
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Create backup of file
backup() {
    cp "$1" "$1.backup-$(date +%Y%m%d-%H%M%S)"
}

# Show directory size sorted
ducks() {
    du -cks * | sort -rn | head -11
}

# Find and replace in files
fар() {
    if [ $# -ne 3 ]; then
        echo "Usage: fар <search> <replace> <file_pattern>"
        return 1
    fi
    find . -name "$3" -type f -exec sed -i "s/$1/$2/g" {} \;
}

# Weather function (requires curl)
weather() {
    local city="$1"
    if [ -z "$city" ]; then
        curl wttr.in
    else
        curl "wttr.in/$city"
    fi
}

# ============================================================================
# Key Bindings
# ============================================================================
# Ctrl+left/right for word navigation
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

# Ctrl+up/down for history search
bindkey "^[[1;5A" history-search-backward
bindkey "^[[1;5B" history-search-forward

# Home/End keys
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

# Delete key
bindkey "^[[3~" delete-char

# Alt+Backspace to delete word
bindkey "^[^?" backward-kill-word

# ============================================================================
# Performance Optimizations
# ============================================================================
# Disable Oh My Zsh auto-update checking (handled by zstyle above)
DISABLE_UPDATE_PROMPT=true

# Skip verification of insecure completions
ZSH_DISABLE_COMPFIX=true

# ============================================================================
# Additional Customizations
# ============================================================================

# Enable command correction
ENABLE_CORRECTION="false"  # Set to "true" if you want command correction

# Completion waiting dots
COMPLETION_WAITING_DOTS="true"

# Mark untracked files under VCS as dirty (set to "true" for better performance in large repos)
DISABLE_UNTRACKED_FILES_DIRTY="false"

# History timestamp format
HIST_STAMPS="yyyy-mm-dd"

# ============================================================================
# Load Local Configuration
# ============================================================================
# Source local configuration file if it exists
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

# ============================================================================
# Final Setup
# ============================================================================
# Original aliases from the user's config
alias vim="nvim"

# Load any additional scripts
if [ -d ~/.config/zsh ]; then
    for file in ~/.config/zsh/*.zsh; do
        [ -r "$file" ] && source "$file"
    done
fi

# Initialize completion system
autoload -U +X bashcompinit && bashcompinit

# ============================================================================
# Welcome Message (Optional)
# ============================================================================
# Uncomment the following lines for a welcome message
# echo "🚀 Enhanced Zsh loaded successfully!"
# echo "💡 Type 'alias' to see all available shortcuts"

# End of configuration

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
