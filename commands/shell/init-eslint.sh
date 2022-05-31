#!/bin/bash
npm install -D eslint prettier eslint-config-airbnb-base eslint-config-prettier eslint-plugin-import eslint-plugin-prettier
cat>.eslintrc<<EOF
{
    "env": {
        "browser": true,
        "es2021": true,
        "jest": true
    },
    "extends": ["airbnb-base", "prettier"],
    "plugins": ["prettier"],
    "parserOptions": {
        "ecmaVersion": 12,
        "sourceType": "module"
    },
    "rules": {
        "prettier/prettier": [
            "error",
            {
                "endOfLine": "auto"
            }
        ],
        "indent": ["error", 4]
    }
}
EOF
cat>.prettierrc<<EOF
{
    "printWidth": 80,
    "singleQuote": true,
    "tabWidth": 4
}
EOF