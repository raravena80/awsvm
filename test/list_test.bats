#!/usr/bin/env bats

setup() {
  awsvm create test
  awsvm use example
}

teardown() {
  awsvm delete test
  awsvm default example
}

@test "should list all the configurations" {
  run awsvm list

  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "   test" ]
  [ "${lines[0]}" = "*= example" ]
}

@test "should show the active and default configuration" {
  awsvm use test

  run awsvm list
  [ "$status" -eq 0 ]
  [ "${lines[1]}" = "=> test" ]
  [ "${lines[0]}" = "*  example" ]
}
