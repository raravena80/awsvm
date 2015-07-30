#!/usr/bin/env bats

@test "should show the current version of awsvm" {
  run awsvm version

  [ "$status" -eq 0 ]
  [[ "$output" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]
}
