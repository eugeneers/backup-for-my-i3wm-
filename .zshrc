
# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="apple"
#ZSH_THEME=""

# For a full list of active aliases, run `alias`.
#
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gimp='flatpak run org.gimp.GIMP'
alias sunshine='flatpak run dev.lizardbyte.app.Sunshine'
export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.local/kitty.app/bin:$PATH"

export PATH="/opt/nvim/bin:$PATH"
alias vi="nvim"
alias vim="nvim"

alias "kooha=flatpak run io.github.seadve.Kooha"
alias "zen=flatpak run app.zen_browser.zen"
alias 'obsidian=flatpak run md.obsidian.Obsidian'
neofetch
