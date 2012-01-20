## Hull - Code Review helper using GitHub's Pull Requests

### Installation

http://rubygems.org/gems/hull

    gem install hull

### Setup

Config Github user name:

    $ git config github.username <github_username>

Config GitHub API key (https://github.com/account/admin):

    $ git config github.token <api_token>

### Usage

List all pull requests for this project:

    $ hull list

### Unimplemented Features

Show details about pull request number <number>:

    $ hull show <number>

Check out the contents of pull request number <number> and switch to that branch:

    $ hull checkout <number>

    or

    $ hull co <number>

    or

    $ hull pull <number>

Remove contents of pull request <number> that has been checked out:

    $ hull rm <number>

    or

    $ hull remove <number>

    or

    $ hull delete <number>

### Why Hull?

Originally it was called puller, but @natekross pushed a gem with the same name to rubygems.org, literally the day I started working on Hull. (╯°□°）╯︵ ┻━┻
