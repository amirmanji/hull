## Puller - Code Review helper using GitHub's Pull Requests

### Installation

http://rubygems.org/gems/puller

    gem install puller

### Setup

Config GitHub API key from https://github.com/account/admin:

    $ git config github.token <api_token>

(Optional) Config Github user name, if different from user.name

    $ git config github.username <github_username>

### Usage

List all pull requests for this project:

    $ puller list

Show details about pull request number <number>:

    $ puller show <number>

Check out the contents of pull request number <number> and switch to that branch:

    $ puller checkout <number>

    or

    $ puller co <number>

    or

    $ puller pull <number>

Remove contents of pull request <number> that has been checked out:

    $ puller rm <number>

    or

    $ puller remove <number>

    or

    $ puller delete <number>
