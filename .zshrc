function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}

setopt PROMPT_SUBST
export PROMPT='%S %m %~ $(parse_git_branch) %D{%H:%M} %s
$ '
# export PROMPT='%S%F{cyan}%~%f $(parse_git_branch) %F{yellow}%D{%H:%M}%f%s
# %F{green}❯%f '

export PATH=$PATH:/usr/local/mysql/bin

alias la="ls -lah"
alias ll="ls -lh"
alias lt="ls -lath"
alias ld="ls -lah -d */"

alias gitlog="git log -10 --oneline --graph --decorate"
alias gl="gitlog"
alias gs="git status"
alias gd="git diff"
alias gcan="git commit --amend --no-edit"
alias ga="git add"
alias gaa="git add ."
alias gp="git push"
alias gc="git commit"

alias nr="npm run"

alias serve="python3 -m http.server 8000"

export PATH=$PATH:/Users/aleshhh/.toolbox/bin
export JAVA_HOME="/Library/Java/JavaVirtualMachines/amazon-corretto-17.jdk/Contents/Home"

#   export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


# Created by `pipx` on 2025-08-21 18:29:31
export PATH="$PATH:/Users/alesh/.local/bin"


# 2026-05-19 Added to run `psql`
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

mkcd () {
  mkdir -p "$1" && cd "$1"
}

dumptext() {
  local outfile="$1"
  shift || true

  if [[ -z "$outfile" ]]; then
    print -u2 "usage: dumptext <output-file> [files/globs...]"
    return 1
  fi

  local -a files
  local f

  files=(${@:-*(.)})

  # Exclude the output file (basename match)
  files=(${files:#${outfile:t}})

  # Truncate output file up front
  : > "$outfile" || return 1

  for f in $files; do
    if [[ $(file --mime --brief -- "$f") == text/* ]]; then
      {
        print -r -- "===== $f ====="
        cat -- "$f"
      } >> "$outfile"
    fi
  done
}

[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
