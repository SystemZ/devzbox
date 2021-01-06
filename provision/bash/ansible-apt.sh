#!/bin/bash
# this still doesn't work for Ubuntu 20.04 @ 2020.01.06
# https://github.com/ansible/ansible/issues/68645
apt-get install -y software-properties-common
apt-add-repository --yes --update ppa:ansible/ansible
apt-get install -y ansible
