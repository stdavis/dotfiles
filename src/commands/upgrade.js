const {Command} = require('@oclif/command')
const {execSync} = require('child_process')

class UpgradeCommand extends Command {
  run() {
    this.log('upgrading this project to the latest version...')
    execSync('npm install -g @stdavis/dotfiles@latest', {
      stdio: 'inherit',
    })
  }
}

UpgradeCommand.description = 'Upgrades this project to it\'s most current version'

module.exports = UpgradeCommand
