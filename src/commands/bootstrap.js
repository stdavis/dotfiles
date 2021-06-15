const { Command, flags } = require('@oclif/command');
const { execSync } = require('child_process');

class BootstrapCommand extends Command {
  run() {
    const { flags } = this.parse(BootstrapCommand);

    this.log('running base bootstrap script...');
    execSync(`bash ${__dirname}/../scripts/bootstrap_mac.sh ${flags.slim ? 1 : 0}`, {
      stdio: 'inherit',
    });

    if (flags.dev) {
      this.log('running dev bootstrap script...');
      execSync(`bash ${__dirname}/../scripts/bootstrap_dev_mac.sh ${flags.slim ? 1 : 0}`, {
        stdio: 'inherit',
      });
    }
  }
}

BootstrapCommand.description = 'Runs the bootstrap scripts to set up this machine.';
BootstrapCommand.flags = {
  slim: flags.boolean({
    char: 's',
    description: 'skip some of the larger components',
  }),
  dev: flags.boolean({
    char: 'd',
    description: 'bootstrap a machine that will be used for development',
  }),
};

module.exports = BootstrapCommand;
