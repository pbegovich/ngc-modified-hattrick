#!/usr/bin/env bash


while true; do
    read -p "Do you wish to shutdown the kvm host? " yn
    case $yn in
        [Yy]* ) shutdown_rhel_kvm=true; break;;
        [Nn]* ) shutdown_rhel_kvm=false; break;;
        * ) echo "Please answer yes or no.";;
    esac
done

#echo $shutdown_rhel_kvm

ansible-playbook --ask-vault-pass debug.yml --extra-vars "shutdown_rhel_kvm=$shutdown_rhel_kvm"
