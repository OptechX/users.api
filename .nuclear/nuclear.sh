#!/bin/zsh

rm -rf .git
git init
git add .
git commit -m 'Reset git repo'
git remote add origin git@github.com:OptechX/users.api.git
git push -u --force origin main