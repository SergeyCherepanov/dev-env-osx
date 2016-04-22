#!/bin/bash

# Initialize script dir
pushd `dirname $0` > /dev/null;DIR=`pwd -P`;popd > /dev/null
echo ""
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo "!!!!! WARNING !!!!! Please finish XCODE installation before continue !!!!!"
echo "!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
echo ""
xcode-select --install
sudo easy_install pip
sudo pip install ansible --quiet
ansible-playbook --ask-sudo-pass -i "localhost," -c local "$DIR/main.yml"