_awsvm() {
  COMPREPLY=()
  local word="${COMP_WORDS[COMP_CWORD]}"

  if [ "$COMP_CWORD" -eq 1 ]; then
    COMPREPLY=( $(compgen -W "$(awsvm commands) $(awsvm completions use)" -- "$word") )
  else
    local command="${COMP_WORDS[1]}"
    local completions="$(awsvm completions "$command")"
    COMPREPLY=( $(compgen -W "$completions" -- "$word") )
  fi
}

complete -F _awsvm awsvm
