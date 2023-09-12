#!/bin/bash

#Wait for kwallet
kwallet-query -l kdewallet > /dev/null

#Loop through all keys in the home/.ssh directory and add them to the SSH_ASKPASS keyring
#Only keys conforming to the naming convention *_rsa will be considered
#Loop ignores the public keys (.pub extension)

for KEY in $(ls $HOME/.ssh/*_rsa | grep -v \.pub); do
        ssh-add -q ${KEY} </dev/null
done
