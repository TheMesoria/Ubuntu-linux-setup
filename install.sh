echo "#####################" >> install_output.txt
echo "#  New run started  #" >> install_output.txt
echo "#####################" >> install_output.txt

colorize(){
    GREEN="\033[0;32m"
    RED="\033[0;31m"
    CYAN="\033[0;36m"
    GRAY="\033[0;37m"
    BLUE="\033[0;34m"
    YELLOW="\033[0;33m"
    NORMAL="\033[m"
    color=\$${1:-NORMAL}
    # activate color passed as argument
    echo -ne "`eval echo ${color}`"
    # read stdin (pipe) and print from it:
    cat
    # Note: if instead of reading from the pipe, you wanted to print
    # the additional parameters of the function, you could do:
    # shift; echo $*
    # back to normal (no color)
    echo -ne "${NORMAL}"
}

function install()
{
	if sudo apt install ${1} -y | tee dump.out; then
		echo "Sucessfuly installed: ${1}" | colorize GREEN >> install_output.txt
	else
		echo "Failed while installing: ${1}" | colorize RED >> install_output.txt
	fi
}

wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - 

sudo apt update
sudo apt upgrade -y
sudo snap refresh

install neovim
install git
install subversion
install htop
install powertop
install tlp
install cargo
install zsh
install llvm
install clang
install gcc
install g++
install cmake
install tmux
install clang-format
install default-jdk
install python3
install speedtest-cli
install gnome-tweaks
install google-chrome-stable
install chrome-gnome-shell
install curl

cargo install bat

sudo apt autoremove -y

sudo tlp start

git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

sudo snap install clion --classic
sudo snap install intellij-idea-ultimate --classic
sudo snap install pycharm-professional --classic
sudo snap install datagrip --classic
sudo snap install rider --classic
sudo snap install telegram-desktop --classic
sudo snap install android-studio --classic

