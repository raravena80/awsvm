#!/usr/bin/env fish

if test -n "$TRAVIS_BUILD_DIR"
  set CODE_PATH $TRAVIS_BUILD_DIR

  # clean the path on travis
  for val in $PATH
    if test -d $val
      set path $path $val
    end
  end
  set -x PATH $path
else
  set CODE_PATH $HOME/.awsvm
end

function awsvm_init
  eval $CODE_PATH/bin/awsvm init -
end

echo $PATH
eval (awsvm_init)

bats $CODE_PATH/test
