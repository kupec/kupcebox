alias gitbrd='git branch -d $(git branch | fzf -m)'
alias gitco='git checkout $(git branch | fzf)'
alias gitpud='git push origin :$(git branch | fzf)'
