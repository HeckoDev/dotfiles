# Add custom bin to PATH
export PATH="$HOME/.oh-my-zsh/custom/bin:$PATH"

alias path="echo $PATH | sed 's/:/\n\g'"
alias zshrc="$EDITOR ~/.zshrc; exec zsh"
alias p='python3'
alias l='eza -1 -F -l --git'
alias cat='bat -p'

# Chezmoi shortcuts
alias cm='chezmoi'
alias cme='chezmoi edit'
alias cma='chezmoi apply'
alias cmd='chezmoi diff'
alias cms='chezmoi status'
