#!/usr/bin/env node

const { prompt } = require("inquirer");
const shell = require("shelljs");
const option = [
  {
    type: "confirm",
    name: "typescript",
    message: "是否添加typescript?",
  },
  {
    type: "confirm",
    name: "styleFormat",
    message: "是否添加eslint与prettier(airbnb风格)?",
  },
  {
    type: "confirm",
    name: "test",
    message: "是否添加jest进行单元测试?",
  },
  {
    type: "confirm",
    name: "husky",
    message: "是否添加husky,lint-staged与git-action",
  },
  {
    type: "confirm",
    name: "husky",
    message: "是否添加husky,lint-staged与git-action",
  },
  {
    type: "confirm",
    name: "sdk",
    message: "是否生成SDK模板",
  },
];

prompt(option).then(answers => {
  initGit();
  changeWindowsCharset();
  const selected = Object.entries(answers)
    .filter(x => x[1])
    .map(x => x[0]);
  selected.forEach(key => {
    funcs[key]();
  });
});

const changeWindowsCharset = () => {
  if (process.platform === "win32") {
    shell.exec(`chcp 65001`);
  }
};
const initGit = () => {
  isGitInit = shell.find(process.cwd() + "\\.git").stdout !== "";
  if (!isGitInit) {
    shell.exec("git init", { silent: true });
  }
};
const initNpm = () => {
  isGitInit = shell.find(process.cwd() + "\\package.json").stdout !== "";
  if (!isGitInit) {
    shell.exec("npm init", { silent: true });
  }
};
const funcs = {
  styleFormat: () => {
    shell.exec(`bash ${__dirname}\\shell\\init-eslint.sh`);
  },
  typescript: () => {
    shell.exec(`bash ${__dirname}\\shell\\init-typescript.sh`);
  },
  test: () => {
    shell.exec(`bash ${__dirname}\\shell\\init-jest.sh`);
  },
  husky: () => {
    shell.exec(`bash ${__dirname}\\shell\\init-github.sh`);
  },
  sdk: () => {
    prompt([
      {
        name: "sdkName",
        type: "input",
        message: "SDK模板名称",
      },
    ]).then(({ sdkName }) => {
      shell.exec(`bash ${__dirname}\\shell\\init-SDK-project.sh ${sdkName}`);
    });
  },
};
