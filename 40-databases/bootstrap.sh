#!/bin/bash

component=mongodb
dnf install ansible -y
ansible-pull -U https://github.com/keshavvenisetty/ansible-roboshop-roles.git -e component=mongodb main.yaml