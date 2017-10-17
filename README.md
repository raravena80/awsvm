# AwsVM

[![Build Status](https://travis-ci.org/raravena80/awsvm.png?branch=master)](https://travis-ci.org/raravena80/awsvm) [![Apache Licensed](https://img.shields.io/badge/license-Apache2.0-blue.svg)](https://raw.githubusercontent.com/raravena80/awsvm/master/LICENSE)

Simple AWS environment manager, usage inspired by wayneeseguin/rvm

Also modified from a fork of chefvm trobrock/chefvm

## Installation

    # Awsvm will create a symlink between (~/.awsvm -> ~/.aws ), make sure you have no ~/.aws directory before installing
    mv ~/.aws ~/.aws.bak
    git clone git://github.com/trobrock/awsvm.git ~/.awsvm
    ~/.awsvm/bin/awsvm init # Follow these instructions
    
After following these instructions reload your terminal, then

    awsvm create old_config
    mv ~/.aws.bak/* ~/.awsvm/configurations/old_config
    rm -rf ~/.aws.bak

## Usage

Put the files (knife.rb, pem keys, etc...) that you would normally have in `~/.aws` into a folder named whatever you want in the configurations folder, then you can use that name in place of `YOUR_AWS_CONFIG` in the below commands

    # Use a specific config
    awsvm use {YOUR_AWS_CONFIG|default}
    # or
    awsvm YOUR_AWS_CONFIG

    # Set your default config
    awsvm default YOUR_AWS_CONFIG

    # List your configurations, including current and default
    awsvm list

    # Create a new config
    awsvm create YOUR_AWS_CONFIG

    # Delete a config
    awsvm delete YOUR_AWS_CONFIG

    # Copy a config
    awsvm copy SRC_CONFIG DEST_CONFIG

    # Rename a config
    awsvm rename OLD_CONFIG NEW_CONFIG

    # Open a config directory in $EDITOR
    awsvm edit YOUR_AWS_CONFIG

    # Update awsvm to the latest
    awsvm update


## Handy Prompt function
You can use `awsvm current` in PS1 in bash to see your current config in your prompt

    PS1="\$(awsvm current)" $

## Contributing

Fork and send a pull request.

# Running tests

The following will bring up an ubuntu based vm, install awsvm, and run the bats tests against it.

```shell
vagrant up
```

While the vm is up you can run the following to re-run tests without rebuilding the vm.

```shell
vagrant provision
```

When you are done.

```shell
vagrant down
```

# Contributors
