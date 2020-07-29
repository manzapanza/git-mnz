#!zsh
local version='1.2.0'
local GIT_MNZ=$ZSH_CUSTOM/plugins/git-mnz

alias gmnzv='echo "git-mnz v.${version}"'

function _gmnzu() {
  git -C $GIT_MNZ fetch --all
  git -C $GIT_MNZ reset origin/master --hard
  source ~/.zshrc
  gmnzv
}

alias gmnzu='_gmnzu'

alias gcfix='git commit -v --fixup'

alias grbma='git rebase master --autostash'
alias grbca='git rebase canary --autostash'
alias grbda='git rebase develop --autostash'
alias grbia='git rebase -i --autosquash'
alias grbiaa='git rebase -i --autosquash --autostash'

function _gcfixa() {
  gcfix "$1"
  grbia "$1~1"
}

alias gcfixa='_gcfixa'

function _gcfixaa() {
  gcfix "$1"
  grbiaa "$1~1"
}

alias gcfixaa='_gcfixaa'

alias gpt='git push && git push --tags'

alias gcca='git checkout canary'

alias gai='git add -i'

alias gpf\?='gf && glol HEAD..$(git rev-parse --abbrev-ref $(current_branch)@{upstream})'

alias gtd='git tag --delete ${1}'
alias gtD='git push --delete origin ${1}'

function _gtdD() {
  git tag --delete "$1"
  git push --delete origin "$1"
}

alias gtdD='_gtdD'

function _glolc() {
  local tag1="$1"
  local tag2="$1~1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
    tag2="HEAD"
  fi

  if [[ ${tag2} == "HEAD~1" ]]; then
    tag2="HEAD"
  fi

  glods $(git describe --tags --abbrev=0 "$tag2").."$tag1" $2
}

function _glolcfeat() {
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^feat"
}

function _glolcrefactor() {
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^refactor"
}

function _glolcchore(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^chore"
}

function _glolcfix(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^fix"
}

function _glolcstyle(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^style"
}

function _glolcperf(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^perf"
}

function _glolcdocs(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1" --grep="^docs"
}

function _glolctest(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _glolc "$tag1"  --grep="^test"
}

function _gch() {
  local feat=`glolcfeat $1`
  local refactor=`glolcrefactor $1`
  local chore=`glolcchore $1`
  local fix=`glolcfix $1`
  local style=`glolcstyle $1`
  local perf=`glolcperf $1`
  local docs=`glolcdocs $1`
  local test=`glolctest $1`

  if [ -n "${feat}" ]; then
    printf "\nFEATURES:\n\n"
    echo "$feat"
  fi;

  if [ -n "${refactor}" ]; then
    printf "\nREFACTOR:\n\n"
    echo "$refactor"
  fi;

  if [ -n "${chore}" ]; then
    printf "\nCHORE:\n\n"
    echo "$chore"
  fi;

  if [ -n "${fix}" ]; then
    printf "\nFIXES:\n\n"
    echo "$fix"
  fi;

  if [ -n "${style}" ]; then
    printf "\nSTYLE:\n\n"
    echo "$style"
  fi;

  if [ -n "${perf}" ]; then
    printf "\nPERFS:\n\n"
    echo "$perf"
  fi;

  if [ -n "${docs}" ]; then
    printf "\nDOCS:\n\n"
    echo "$docs"
  fi;

  if [ -n "${test}" ]; then
    printf "\nTESTS:\n\n"
    echo "$test"
  fi;
}

alias glolc='_glolc'
alias glolcfeat='_glolcfeat'
alias glolcrefactor='_glolcrefactor'
alias glolcchore='_glolcchore'
alias glolcfix='_glolcfix'
alias glolcstyle='_glolcstyle'
alias glolcperf='_glolcperf'
alias glolcdocs='_glolcdocs'
alias glolctest='_glolctest'
alias gch='_gch'