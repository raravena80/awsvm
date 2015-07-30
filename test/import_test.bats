#!/usr/bin/env bats

setup() {
  touch $(awsvm prefix)/configurations/example/knife.rb
  touch $(awsvm prefix)/configurations/example/myuser.pem
  awsvm export example > /dev/null
}

teardown() {
  awsvm delete new_example > /dev/null
}

@test "should be able to import a configuration" {
  run awsvm import $(awsvm prefix)/exports/example.tar.gz new_example

  [ "$status" -eq 0 ]
  [ "$output" = "Importing '$(awsvm prefix)/exports/example.tar.gz' as 'new_example'" ]

  run awsvm list
  [ "${lines[0]}" = "*= example" ]
  [ "${lines[1]}" = "   new_example" ]
}
