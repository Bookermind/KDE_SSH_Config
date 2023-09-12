#!/bin/bash

#Make the SSH_ASKPASS environment variable hold the location of ksshaskpass
#This path is specific to OpenSuse Tumbleweed
#Will need altering for other Linux distro's
#The more common location is /usr/bin/ksshaskpass

export SSH_ASKPASS="/usr/libexec/ssh/ksshaskpass"

if ! pgrep -u $USER ssh-agent > /dev/null; then
        ssh-agent > ~/.ssh-agent-info
fi

if [[ "$SSH_AGENT_PID" == "" ]]; then
        eval $(<~/.ssh-agent-info)
fi
