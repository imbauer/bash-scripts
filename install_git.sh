#!/usr/bin/env bash

echo "Script running to install Git on Linux Machine"
apt-get install git -y

echo "Configuring git"
echo "Enter global name for git: "
read NAME
git config --global user.name "${NAME}"
echo "Enter global email for git: "
read EMAIL
git config --global user.email "${EMAIL}"

echo "Git has been set up"
git config --list


if [ -d "${HOME}/.ssh" ]
then
    echo "~/.ssh folder already exists"
else
    echo "Making .ssh folder"
    mkdir ~/.ssh
fi

if [ -f "${HOME}/.ssh/id_rsa" ] && [ -f "${HOME}/.ssh/id_rsa.pub" ]
then
    echo "ssh keys already exist"
else
    echo "Storing ssh keys in ${HOME}/.ssh"
    echo -e "\n" | ssh-keygen -t rsa -b 4096 -C "${EMAIL}" -f $HOME/.ssh/id_rsa

    echo "Set permissions to both keys for accessibility"
    chmod +rwx "${HOME}/.ssh/id_rsa.pub"
    chmod +rwx "${HOME}/.ssh/id_rsa"
fi

