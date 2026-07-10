# Add custom bin to PATH
export PATH="$HOME/.oh-my-zsh/custom/bin:$PATH"

alias path="echo $PATH | sed 's/:/\n\g'"
alias zshrc="$EDITOR ~/.zshrc; exec zsh"
alias p='python3'
alias l='eza -1 -F -l --git'
alias cat='bat -p'
alias flog='git log --graph --color=always --abbrev-commit --decorate --date=relative --format=format:"%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)-%an%C(reset)%C(bold yellow)%d%C(reset)" --all | fzf --ansi --no-sort --reverse --tiebreak=index --preview="echo {} | grep -o \"[a-f0-9]\\{7,\\}\" | head -1 | xargs -I@ bash -c \"git show --color=always @\"" --preview-window=bottom:60%:wrap'

# Chezmoi shortcuts
alias cm='chezmoi'
alias cme='chezmoi edit'
alias cma='chezmoi apply'
alias cmd='chezmoi diff'
alias cms='chezmoi status'

# Vim shortcuts
alias vimhelp='bat ~/.local/share/chezmoi/VIM_CHEATSHEET.md'
alias vh='bat ~/.local/share/chezmoi/VIM_CHEATSHEET.md'
alias vimconfig='vim ~/.vimrc'

# Neovim shortcuts
alias nv='nvim'
alias nvimhelp='bat ~/.local/share/chezmoi/NEOVIM_CHEATSHEET.md'
alias nvh='bat ~/.local/share/chezmoi/NEOVIM_CHEATSHEET.md'
alias nvimconfig='nvim ~/.config/nvim/init.lua'
