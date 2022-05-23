#!/usr/bin/env node

const program = require("commander");

program.usage("<command>");

program.version(require("./package").version);

program
  .command("init")
  .description("init a project")
  .action(() => {
    require("./commands/init.js");
  });

program.parse(process.argv);
