#!/usr/bin/env bats

@test "should print the awsvm root" {
  run awsvm prefix

  [ "$status" -eq 0 ]
  if [ ! -z $TRAVIS_BUILD_DIR ]; then
    [ "$output" = "$TRAVIS_BUILD_DIR" ]
  else
    [ "$output" = "/root/.awsvm" ]
  fi
}
