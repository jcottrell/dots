# Simple setup for Ubuntu servers
* Clone this repo `git clone https://github.com/jcottrell/dots.git`
* `cd dots`
* `chmod +x setup.sh`
* Run either `./setup.sh --server` or `./setup.sh --mac` depending on the system

## Set Editor to something useful
    sudo apt-get install vim  
    sudo update-alternatives --install /usr/bin/editor editor /usr/bin/vim 200  
    sudo update-alternatives –config editor  

## Sudo without password
1. `sudo visudo`
2. Go to the end of the file
3. Add `username ALL=(ALL) NOPASSWD: ALL` replace `username` with your username

## Add authorized key to server
1. From home machine's terminal
2. `ssh-copy-id -i ./ssh/id_rsa.pub loginName@server.path`
