#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
source $DIR/env.sh
rsync -e "ssh -i $DIR/$MC_KEY -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null" -a $DIR/../data/world $MC_USER_HOST:/var/lib/minecraft 
