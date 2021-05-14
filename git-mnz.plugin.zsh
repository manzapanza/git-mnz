#!zsh
local version='1.6.0'
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

function _gchl() {
  local tag1="$1"
  local tag2="$1~1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
    tag2="HEAD"
  fi

  if [[ ${tag2} == "HEAD~1" ]]; then
    tag2="HEAD"
  fi

  git log --graph --pretty='%s (%Cred%h%Creset)' $(git describe --tags --abbrev=0 "$tag2").."$tag1" $2
}

regexReplace='s/^\* (feat|refactor|chore|fix|style|perf|docs|test):? ?(\((.+)\)(:))?(.+)/* \3\4\5/'

function _gchfeat() {
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^feat" | sed -E "$regexReplace"
}

function _gchrefactor() {
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^refactor" | sed -E "$regexReplace"
}

function _gchchore(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^chore" | sed -E "$regexReplace"
}

function _gchfix(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^fix" | sed -E "$regexReplace"
}

function _gchstyle(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^style" | sed -E "$regexReplace"
}

function _gchperf(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^perf" | sed -E "$regexReplace"
}

function _gchdocs(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1" --grep="^docs" | sed -E "$regexReplace"
}

function _gchtest(){
  local tag1="$1"

  if [ -z "${tag1}" ]; then
    tag1="HEAD"
  fi

  _gchl "$tag1"  --grep="^test" | sed -E "$regexReplace"
}

function _gch() {
  local feat=`gchfeat $1`
  local refactor=`gchrefactor $1`
  local chore=`gchchore $1`
  local fix=`gchfix $1`
  local style=`gchstyle $1`
  local perf=`gchperf $1`
  local docs=`gchdocs $1`
  local test=`gchtest $1`

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

alias gchl='_gchl'
alias gchfeat='_gchfeat'
alias gchrefactor='_gchrefactor'
alias gchchore='_gchchore'
alias gchfix='_gchfix'
alias gchstyle='_gchstyle'
alias gchperf='_gchperf'
alias gchdocs='_gchdocs'
alias gchtest='_gchtest'
alias gch='_gch'

alias gsfm='grb HEAD && grh --soft $(git merge-base --fork-point master) && gc'
alias gsfd='grb HEAD && grh --soft $(git merge-base --fork-point develop) && gc'