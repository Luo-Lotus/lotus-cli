#!/bin/bash
npm install -D jest @babel/core @babel/preset-env @babel/preset-typescript @types/jest @babel/cli @babel/runtime babel-jest jest-cli
cat>babel.config.json<<EOF
{
    "presets": [
        [
            "@babel/preset-env",
            {
                "targets": {
                    "node": "current"
                }
            }
        ],
        "@babel/preset-typescript"
    ]
}
EOF
cat>.jest.config.json<<EOF
{
    "transformIgnorePatterns": [
        "/node_modules/(?!rn_request_ability)"
    ],
    "transform": {
        "^.+\\.[t|j]sx?$": "babel-jest"
    },
    "testEnvironment": "node",
    "testTimeout": 20000,
    "verbose": true,
    "bail": 0
}
EOF
npm set-script test "jest"