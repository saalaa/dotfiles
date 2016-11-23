Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/xenial64"

  config.vm.provision "shell", privileged: false, inline: <<-SHELL
    sudo apt-get update
    sudo apt-get upgrade
    sudo apt-get install -y zsh tmux vim git silversearcher-ag curl wget \
      mercurial sloccount sqlite3 mutt gpg

    sudo locale-gen

    sudo chsh ubuntu -s /usr/bin/zsh

    sudo chmod -x /etc/update-motd.d/10-help-text
    sudo chmod -x /etc/update-motd.d/51-cloudguest

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

    mkdir ~/projects

    (cd ~/projects
      git clone https://github.com/saalaa/dotfiles)

    (cd ~/projects/dotfiles
      ./install zsh
      ./install tmux
      ./install vim
      ./install git
      ./install hg
      ./install mutt)

    (cd ~/.vim
      ./fetch-bundles)
  SHELL
end
