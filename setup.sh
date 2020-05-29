#!/bin/bash


#***********************************************************************************
#	UBUNTU INSTALL
#***********************************************************************************
ubuntu_install()
{
    sudo apt update && sudo apt upgrade -y 
    echo 'Install essential tools' 
    sudo apt-get install build-essential git curl xclip libssl-dev -y

    echo 'Installing zsh' 
    sudo apt-get install zsh -y
    h -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
    chsh -s /bin/zsh

    # install nvm and node
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

    export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
    ) && \. "$NVM_DIR/nvm.sh"

    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


}

#***********************************************************************************
#	ARCH INSTALL
#***********************************************************************************
arch_install()
{
    echo 'installing on arch...'
}


echo "What's your distro?"

options=("Ubuntu" "Arch" "Quit")
select opt in "${options[@]}"
do
    case $opt in 
        "Ubuntu")
            ubuntu_install
            break
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

