#!/bin/bash

#***********************************************************************************
#	CREATE TEMPORARY FOLDER
#***********************************************************************************
function ubuntu_install()
{
    sudo apt-get update
    echo 'Install essential tools' 
    sudo apt-get install build-essential git curl xclip libssl-dev -y

    sudo apt-get install zsh -y

    # install node
}

function arch_install()
{
    echo 'installing on arch...'
}


echo 'Choose your OS'

options=("Ubuntu" "Arch" "Quit")
select opt in "${options[@]}"
do
    case $opt in 
        "Ubuntu")
            ubuntu_install
            ;;            
        "Arch")
            arch_install
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done

