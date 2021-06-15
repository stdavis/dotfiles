# @stdavis/dotfiles

bootstrap and keep up-to-date my macOS machines

[![oclif](https://img.shields.io/badge/cli-oclif-brightgreen.svg)](https://oclif.io)
[![Version](https://img.shields.io/npm/v/@stdavis/dotfiles.svg)](https://npmjs.org/package/@stdavis/dotfiles)
[![License](https://img.shields.io/npm/l/@stdavis/dotfiles.svg)](https://github.com/stdavis/dotfiles/blob/master/package.json)

## Usage

```sh-session
$ npm install -g @stdavis/dotfiles
$ dotfiles --help
USAGE
...
```

## Installation

`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/stdavis/dotfiles/src/scripts/install.sh)`

## Development Notes

### Running development version

`./bin/run`

### Finding macOS preference plist settings

1. Open `~/Library/Preferences` and switch to list view
1. Toggle the setting via the system preferences UI
1. Check for the most recently modified file
