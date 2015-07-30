#!/usr/bin/env bats

setup() {
  touch $(awsvm prefix)/configurations/example/knife.rb
  touch $(awsvm prefix)/configurations/example/myuser.pem
  touch $(awsvm prefix)/configurations/example/myvalidator.pem
}

@test "should have the exports directory" {
  awsvm_root=$(awsvm prefix)

  [ -d "$awsvm_root/exports" ]
}

@test "should create a tar file for the export" {
  awsvm_root=$(awsvm prefix)
  run awsvm export example

  [ "$status" -eq 0 ]
  [ "$output" = "Exporting: example" ]
  [ -f "$awsvm_root/exports/example.tar.gz" ]
}

@test "should ignore key files by default" {
  awsvm_root=$(awsvm prefix)
  run awsvm export example

  [ "$status" -eq 0 ]

  tempfile=$(mktemp -t awsvm-export-ignore-keys.XXXXXXXXXX)
  rm $tempfile
  mkdir -p $tempfile
  pushd $tempfile > /dev/null
  tar xzf $awsvm_root/exports/example.tar.gz

  [ -f "knife.rb" ]
  [ ! -f "myuser.pem" ]
  [ ! -f "myvalidator.pem" ]

  popd > /dev/null
  rm -rf $tempfile
}

@test "should be able to include key files" {
  awsvm_root=$(awsvm prefix)
  run awsvm export example --include-keys

  [ "$status" -eq 0 ]

  tempfile=$(mktemp -t awsvm-export-ignore-keys.XXXXXXXXXX)
  rm $tempfile
  mkdir -p $tempfile
  pushd $tempfile > /dev/null
  tar xzf $awsvm_root/exports/example.tar.gz

  [ -f "knife.rb" ]
  [ -f "myuser.pem" ]
  [ -f "myvalidator.pem" ]

  popd > /dev/null
  rm -rf $tempfile
}
