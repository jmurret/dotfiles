# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:$HOME/go/bin:/usr/local/bin:/opt/homebrew/bin:/Applications/GoLand.app/Contents/MacOS:$PATH
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="eastwood"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# cd
alias cdh="cd ~/Documents/github/hashicorp"
alias cdj="cd ~/Documents/github/jmurret"
alias cdi="cd ~/Documents/github/hashicorp/cloud-infragraph"

# git
alias g="git"

# helm
alias h="helm"

# hcloud
source '/Users/jmurret/Library/Application Support/hcloud/hashistack/aliases.bash'
source '/Users/jmurret/Library/Application Support/hcloud/hashistack/aliases.zsh'

# k8s
alias k="kubectl"

# terraform
alias tf="terraform"

# commands
art_login () {
    doormat login && eval $(doormat aws export --account ${AWS_ACCOUNT_ID}) && echo "$(doormat artifactory create-token | jq -r '.access_token')" | docker login -u "john.murret@hashicorp.com" --password-stdin cloud-services-docker-virtual.artifactory.hashicorp.engineering
}

refresh_kind () {
    kind delete cluster --name $1
    kind create cluster --name $1
}

export DOCKER_HOST='unix:///var/folders/qx/v55872bj377d4pjsmymty0040000gn/T/podman/podman-machine-default-api.sock'
export GOLANG_PROTOBUF_REGISTRATION_CONFLICT=ignore
export AWS_ACCOUNT_ID=216329762767
export ANTHROPIC_DEFAULT_SONNET_MODEL="us.anthropic.claude-sonnet-4-6"
export ANTHROPIC_DEFAULT_HAIKU_MODEL="us.anthropic.claude-haiku-4-5-20251001-v1:0"
export ANTHROPIC_DEFAULT_OPUS_MODEL="us.anthropic.claude-opus-4-6-v1"
export ANTHROPIC_MODEL="us.anthropic.claude-opus-4-6-v1"
export AWS_PROFILE=${AWS_PROFILE:-sandbox_bedrock}
export CLAUDE_CODE_USE_BEDROCK=1
export DISABLE_PROMPT_CACHING=0
export CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
export GOPRIVATE="github.com/hashicorp/*,github.com/hashicorp-forge/*"

# The following lines were added by compinstall
# case insensitive path-completion
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*'
zstyle ':completion:*' list-suffixeszstyle ':completion:*' expand prefix suffix
zstyle :compinstall filename '/Users/jmurret/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

PROMPT='%F{226}[%D{%m/%d/%y %H:%M:%S}]%f '$PROMPT

export GITHUB_TOKEN="$(gh auth token)"

eval "$(direnv hook zsh)"


