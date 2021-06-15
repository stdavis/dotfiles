const { Command, flags } = require('@oclif/command');
const { execSync } = require('child_process');

class UpdateEverythingCommand extends Command {
  run() {
    execSync(`bash ${__dirname}/../scripts/update_everything.sh`, {
      stdio: 'inherit',
    });
  }
}

UpdateEverythingCommand.description = 'Update all apps and packages installed by the bootstrap command';

module.exports = UpdateEverythingCommand;
