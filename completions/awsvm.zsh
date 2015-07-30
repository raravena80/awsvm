if [[ ! -o interactive ]]; then
    return
fi

compctl -K _awsvm awsvm

_awsvm() {
  local word words completions
  read -cA words
  word="${words[2]}"

  if [ "${#words}" -eq 2 ]; then
    completions="$(awsvm commands) $(awsvm completions use)"
  else
    completions="$(awsvm completions "${word}")"
  fi

  reply=("${(ps:\n:)completions}")
}
