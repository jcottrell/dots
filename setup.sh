#!/bin/sh
dotsDir=`pwd`
home=$HOME

makeLink()
{
    ln -s $dotsDir/$1 $home/$2
    echo "  Created $2"
}

addLink()
{
    # sort out parameters of the function
    dotsName="$1"
    if [ -z "$2" ]; then
        homeName="$1"
    else
        homeName="$2"
    fi

    echo "Processing $dotsDir/$dotsName ==> $home/$homeName"
    if [ -f $home/$homeName ] || [ -d $home/$homeName ] || [ -L $home/$homeName ] || [ -h $home/$homeName ]; then
        echo "  $home/$homeName already exists"
        # but it could just be a link (file or directory)
        if [ -L $home/$homeName ] || [ -h $home/$homeName ]; then
            echo "  Deleting link $home/$homeName so it can be replaced..."
            rm $home/$homeName
            makeLink $dotsName $homeName
        fi
    else
        echo "  Adding $home/$homeName"
        makeLink $dotsName $homeName
    fi
}
# main
# # eventually needs full argument handling: only add certain things;
# # remove .bashrc, etc.
if [ "$1" = "--server" ] || [ "$1" = "--mac" ]; then
    # if server then connect up .bashrc-server and .vimrc-server
    if [ $1 = "--server" ]; then
        addLink ".bashrc-server" ".bashrc"
        addLink ".vimrc-server" ".vimrc"
        addLink ".bash_aliases"
    else
    # else connect up .bash_profile-maxosx and .vimrc-macvim
        addLink ".bash_profile-macosx" ".bash_profile"
        addLink ".vimrc-macvim" ".vimrc"
    fi
    addLink ".bash_prompt_colors"
    addLink ".ctags"
    addLink ".dircolors"
    # addLink ".editorconfig" # ?? for vim-jsbeautify
    addLink ".git_template"
    addLink ".gitconfig"
    addLink ".vim"
    addLink "bin"
else
    echo "Please supply either --server or --mac as the first parameter"
    echo "$1"
fi
