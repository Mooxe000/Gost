#!/usr/bin/env bash

task_version=3.24.0
task_file=task_linux_amd64.tar.gz
git_host=download.fastgit.org
git_repo=go-task/task
url_fix=releases/download

# https://kgithub.com/go-task/task/releases/download/v3.24.0/task_linux_amd64.tar.gz
task_url=https://${git_host}/${git_repo}/${url_fix}/v${task_version}/${task_file}

mkdir -p ./Task
pushd Task
axel $task_url
tar xvf task_linux_amd64.tar.gz
mv task /usr/local/bin/task
popd
rm -rf ./Task
