# AwsVM [![Build Status](https://travis-ci.org/raravena80/awsvm.svg?branch=master)](https://travis-ci.org/raravena80/awsvm) [![Apache Licensed](https://img.shields.io/badge/license-Apache2.0-blue.svg)](https://raw.githubusercontent.com/raravena80/awsvm/master/LICENSE)

Simple AWS environment manager, inspired by [rvm](https://rvm.io/).

`awsvm` helps you manage multiple AWS configurations and switch between them easily.

## Installation

1.  **Backup your existing AWS configuration (if any):**
    ```bash
    mv ~/.aws ~/.aws.bak
    ```

2.  **Clone the repository:**
    ```bash
    git clone https://github.com/raravena80/awsvm.git ~/.awsvm
    ```

3.  **Initialize `awsvm`:**
    ```bash
    ~/.awsvm/bin/awsvm init
    ```
    Follow the instructions on the screen to add `awsvm` to your shell's startup file (e.g., `~/.bash_profile` or `~/.zshrc`).

4.  **Reload your shell:**
    Open a new terminal window or source your profile file (e.g., `source ~/.bash_profile`).

5.  **(Optional) Import your old configuration:**
    ```bash
    awsvm create old_config
    mv ~/.aws.bak/* ~/.awsvm/configurations/old_config/
    rm -rf ~/.aws.bak
    ```

## Usage

`awsvm` works by maintaining a set of configurations in the `~/.awsvm/configurations` directory. Each configuration is a directory containing your AWS config files.

### `awsvm use {config_name}`
Switch to a different AWS configuration. This command works by creating a symlink from `~/.aws` to the selected configuration directory (`~/.awsvm/configurations/{config_name}`).

**Shortcut:** You can also just type `awsvm {config_name}`.

### `awsvm export {config_name} [profile]`
Export AWS credentials as environment variables. This is useful for tools that do not read the `~/.aws` configuration files directly. The default profile is `default`.

To use it, run the following command in your shell:
```bash
eval $(awsvm export my_config)
```
This will set `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_SESSION_TOKEN` (if available), and `AWS_DEFAULT_REGION` in your current shell session.

### `awsvm list`
List all available configurations. The current and default configurations are marked.

### `awsvm create {config_name}`
Create a new, empty configuration directory.

### `awsvm delete {config_name}`
Delete a configuration.

### `awsvm copy {source} {destination}`
Copy an existing configuration to a new one.

### `awsvm rename {old_name} {new_name}`
Rename a configuration.

### `awsvm default {config_name}`
Set the default configuration. This configuration will be used when you open a new shell.

### `awsvm edit {config_name}`
Open a configuration directory in your default editor (`$EDITOR`).

### `awsvm current`
Display the name of the current configuration.

### `awsvm update`
Update `awsvm` to the latest version from the git repository.

## Configuration
Each configuration is a directory inside `~/.awsvm/configurations/`. When you switch to a configuration with `awsvm use`, this directory is symlinked to `~/.aws`.

A typical configuration directory can contain:
*   `credentials`: A file in INI format containing your AWS access keys.
    ```ini
    [default]
    aws_access_key_id = YOUR_ACCESS_KEY
    aws_secret_access_key = YOUR_SECRET_KEY
    ```
*   `config`: A file in INI format for other settings, like the default region.
    ```ini
    [default]
    region = us-east-1
    ```
*   Other files, like PEM keys for EC2 instances.

`awsvm` also supports named profiles within your configuration files. For example, when using `awsvm export my_config personal`, it will look for the `[personal]` profile in the `credentials` file and the `[profile personal]` section in the `config` file.

## Handy Prompt Function
You can use `awsvm current` in your `PS1` to see your current config in your prompt:
```bash
PS1="\$(awsvm current) $ "
```

## Contributing

Fork the repository and send a pull request.

## Running Tests

The project uses `bats` for testing. To run the tests, you can use the provided Vagrant setup.

1.  **Start the Vagrant VM:**
    ```shell
    vagrant up
    ```
    This will bring up an Ubuntu VM, install `awsvm`, and run the tests.

2.  **Re-run tests:**
    To re-run the tests on the running VM:
    ```shell
    vagrant provision
    ```

3.  **Shutdown the VM:**
    ```shell
    vagrant destroy
    ```
