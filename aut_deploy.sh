#!/bin/bash
REMOTE_USER="vboxuser"
REMOTE_HOST="192.168.1.8"
REMOTE_DIR="/home/vboxuser/deployments/"
GIT_REPO="https://github.com/agarwalstuti/remoterepo.git"
git clone $GIT_REPO /tmp/deployment_repo

scp -r /tmp/deployment_repo $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

rm -rf /tmp/deployment_repo
