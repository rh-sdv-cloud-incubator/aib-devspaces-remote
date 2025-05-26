#!/bin/sh

USER=$(cat /projects/.code-workspace | grep '"username":' | sed 's/.*: "\(.*\)".*/\1/')
HOST=$(cat /projects/.code-workspace | grep '"host":' | sed 's/.*: "\(.*\)".*/\1/')

DEST=$USER@$HOST
KEY=$HOME/autosd-dev.pem

ssh -i $KEY $DEST -t 'mkdir -p ~/.jumpstarter/clients/' && scp -i $KEY /home/user/.jumpstarter/clients/default.yaml $DEST:~/.jumpstarter/clients/

