#PROMPT="%{$fg[cyan]%}%c%{$reset_color%} %(?:%{$fg_bold[green]%}❱%{$reset_color%} :%{$fg_bold[red]%}❱%{$reset_color%} )"
function prompt_dir_icon() {
  local dir="${PWD/#$HOME/~}"

  case "$PWD" in
    "$HOME")
      echo " ~"
      ;;
    "$HOME/Pictures")
      echo " ~/Pictures"
      ;;
    "$HOME/Videos")
      echo "󰃽 ~/Videos"
      ;;
    "$HOME/library")
      echo " ~/library"
      ;;
    "$HOME/Music")
      echo " ~/Music"
      ;;
    "$HOME/.config")
      echo " ~/.config"
      ;;
    "$HOME/Documents")
      echo "󰈙 ~/Documents"
      ;;
    "$HOME/Downloads")
      echo "󱃩 ~/Downloads"
      ;;
    "$HOME/Projects")
      echo "󰲋 ~/Projects"
      ;;
    *)
      if git rev-parse --is-inside-work-tree &>/dev/null; then
        echo " $dir"
      else
        echo " $dir"
      fi
      ;;
  esac
}

PROMPT='%{$fg[cyan]%}$(prompt_dir_icon)%{$reset_color%} %(?:%{$fg_bold[green]%}❱%{$reset_color%} :%{$fg_bold[red]%}❱%{$reset_color%} )'
PROMPT+=' $(git_prompt_info)'

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg_bold[blue]%}git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%} "
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}%1{✗%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"
