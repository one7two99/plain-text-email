Plain Text Email
================
This repository contains notes and config how to setup/use plain text email clients like mu4e.

Status:
03/2023 just a draft with different config notes, needs some cleanup.

Installation Notes
------------------
```
# Install nano
#sudo apt-get install nano

#Add testing sources
sudo nano /etc/apt/sources.list
#comment out everything and add:
# Unstable
# https://www.debian.org/doc/manuals/debian-handbook/apt.de.html#sect.apt-sources.list.testing
deb https://deb.debian.org/debian unstable main contrib non-free
deb-src https://deb.debian.org/debian unstable main contrib non-free

#upgrade everything
#this will download ~245MBm upgrade 433 and install 71 new packages
sudo apt update
sudo apt full-upgrade
sudo apt autoremove
sudo apt-get install mc emacs mlocate git nmap
sudo apt-get install build-essential autoconf automake autotools-dev

#additional productivity apps# Install additional apps
sudo apt-get install chromium libreoffice thunar notepadqq

#configure connection to github
#Create SSH keypair
ssh-keygen
#Copy public key (for example to it to github for simple ssh access)
cat ~/.ssh/id_rsa.pub
#add public key to github: https://github.com/settings/keys
#configure git settings
git config --global core.editor nano
git config --global user.name "<USERNAME>"
git config --global user.email <EMAIL>
#show git settings
git config --list --show-origin

#compile mu4e
sudo apt-get install libgmime-3.0-0 libgpgme11 libxapian30 xapian-tools \
  pkg-config libtool libglib2.0-dev libgmime-3.0-dev libxapian-dev gettext \
  texi2html texinfo
sudo apt-get install maildir-utils 
git clone https://github.com/djcb/mu.git
cd mu
./autogen.sh 
sudo make install
#will install to: /usr/local/share/emacs/site-lisp/
#add the following lines to ~/.emacs
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e")
(require 'mu4e)

#compile org-mode
git clone https://code.orgmode.org/bzg/org-mode.git
make autoloads
sudo make install
#will install to /usr/share/emacs/site-lisp/org
#add the following lines to ~/.emacs:
(add-to-list 'load-path "/usr/share/emacs/site-lisp/org")

#configure user setting
# copy .configure from github repository to ~/
# create symlinks for config files
cd
ln -s .config/emacs/.emacs .emacs
ln -s .config/mbsync/.mbsyncrc .mbsyncrc
ln -s .config/msmtp/.msmtprc .msmtprc
# edit/finalize config files
chmod 600 .msmtprc
chmod 600 .mbsyncrc

# Install tools to receive / send email
sudo apt-get install isync msmtp
sudo nano /etc/mail.rc
  #set mstp as default mailclient
  set sendmail="/usr/bin/msmtp -t
#sync Mail from imap-server
mbsync -a
#send testmail
echo "Hello this is sending email using msmtp" | msmtp <MAILADDRESS>
echo "Body of Testmail" | mail -s "Testmail Subject" <MAILADDRESS>

#setup web browser
#install some webbrowsers
sudo apt-get install w3m w3m-imgcat elinks chromium
#choose a default browser
#See also: https://askubuntu.com/questions/16621/how-to-set-the-default-browser-from-the-command-line
sudo update-alternatives --config www-browser
# choose w3m
sudo update-alternatives --config x-www-browser
# choose Chromium
sudo update-alternatives --config gnome-www-browser
# choose Chromium
# See default browsers:
ls -lah /usr/bin/*-browser /etc/alternatives/*browser
#Test with
sensible-browser https://google.com

#Emacs tips
#http://irfu.cea.fr/Pisp/vianney.lebouteiller/emacs.html

# One day maybe
## davmail
# http://davmail.sourceforge.net/faq.html

## khard und khal
# https://opensource.com/article/20/1/open-source-calendar
https://blog.datentraeger.li/?p=615

# vdirsyncer
```
