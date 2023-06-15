pkg update -y
pkg upgrade -y
pkg install git -y
pkg install wget -y
pkg install php -y
pkg install ruby -y
pkg install python3 -y
pkg install python2 -y
pkg install perl -y
pkg install python3-pip -y
pip install requests
pip install mechanize
pip install bs4
pip install user-agent
pip install python-nmap
pkg install tar -y
pkg install tor -y
pkg install netcat-openbsd -y
pkg install openssh -y
pkg install nmap -y
pkg install graphviz -y
pkg install figlet -y
pkg install cmatrix -y
pkg install sl -y
pkg install c-script -y
pkg install coreutils -y
pkg install ed -y
pkg install electric-fence -y
pkg install et -y
pkg install kona -y
pkg install ne -y
pkg install o-editor -y
pkg install q-dns-client -y
pkg install vim-gtk -y
pkg install xorg-server -y
pkg install iw -y
pkg install rw -y
pkg install wireguard-tools -y
pkg install binutils -y
pkg install binutils-is-llvm -y
pkg install d8 -y
pkg install hr -y
pkg install lr -y
pkg install myrepos -y
pkg install radare2 -y
pkg install rcshell -y
pkg install ripgrep -y
pkg install rq -y
pkg install ruby-ri -y
pkg install surfraw -y
pkg install at -y
pkg install iproute2 -y
pkg install moreutils -y
pkg install st -y
pkg install task-spooler -y
pkg install tcllib -y
pkg install texlive-bin -y
pkg install tinyfugue -y
pkg install virustotal-cli -y
pkg install yq -y
pkg install mtools -y
pkg install mu -y
pkg install nushell -y
pkg install termux-tools -y
pkg install ugrep -y
pkg install up -y
pkg install util-linux -y
pkg install uucp -y
pkg install i3 -y
pkg install i3-gaps -y
pkg install rcs -y
pkg install cups -y
pkg install libgnustep-base -y
pkg install nss-utils -y
pkg install pari -y
pkg install pb -y
pkg install procps -y
pkg install pv -y
pkg install apache2 -y
pkg install binutils-bin -y
pkg install mono -y
pkg install parallel -y
pkg install mariadb -y
pkg install silversearcher-ag -y
pkg install termux-am -y
pkg install dash -y
pkg install ghostscript -y
pkg install n-t-roff-sc -y
pkg install runit -y
pkg install sc -y
pkg install sd -y
pkg install sl -y
pkg install tin-summer -y
pkg install bc -y
pkg install dx -y
pkg install fd -y
pkg install gatling -y
pkg install fm -y
pkg install fx -y
pkg install lf -y
pkg install gh -y
pkg install gn -y
pkg install golang -y
pkg install graphicsmagick -y
pkg install graphviz -y
pkg install mg -y
pkg install helix -y
pkg install hstr -y
pkg install hz -y
pkg install libuber-h3 -y
pkg install xh -y
pkg install jo -y
pkg install jq -y
pkg install mercury -y
pkg install ol -y
pkg install p7zip -y
pkg install xz-utils -y
pkg install z3 -y
pkg install nxengine -y
pkg install bk -y
pkg install netcat-openbsd -y
pkg install m4 -y
pkg install mc -y
pkg install wget curl openssh git -y
apt install ncurses-utils
cd ~
wget https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.tgz
tar -xf ngrok-v3-stable-linux-arm.tgz
rm -rif ngrok-v3-stable-linux-arm.tgz
chmod +x ngrok
mv ngrok /data/data/com.termux/files/usr/bin
cd ~
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~
#source <(curl -fsSL https://kutt.it/msf)
#!/data/data/com.termux/files/usr/bin/bash

center() {
  termwidth=$(stty size | cut -d" " -f2)
  padding="$(printf '%0.1s' ={1..500})"
  printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Loading spinner
center " Loading..."
## Remove not working repositories
rm $PREFIX/etc/apt/sources.list.d/*

## Install gnupg required to sign repository
# pkg install -y gnupg

## Sign gushmazuko repository
# curl -fsSL https://raw.githubusercontent.com/gushmazuko/metasploit_in_termux/master/gushmazuko-gpg.pubkey | gpg --dearmor | tee $PREFIX/etc/apt/trusted.gpg.d/gushmazuko-repo.gpg

## Add gushmazuko repository to install ruby 2.7.2 version
# echo 'deb https://github.com/gushmazuko/metasploit_in_termux/raw/master gushmazuko main'  | tee $PREFIX/etc/apt/sources.list.d/gushmazuko.list

## Set low priority for all gushmazuko repository (for security purposes)
## Set highest priority for ruby package from gushmazuko repository
# echo '## Set low priority for all gushmazuko repository (for security purposes)
# Package: *
# Pin: release gushmazuko
# Pin-Priority: 100

## Set highest priority for ruby package from gushmazuko repository
# Package: ruby
# Pin: release gushmazuko
# Pin-Priority: 1001' | tee $PREFIX/etc/apt/preferences.d/preferences

# Purge installed ruby
apt purge ruby -y
rm -fr $PREFIX/lib/ruby/gems

pkg upgrade -y -o Dpkg::Options::="--force-confnew"

# needs binutils
pkg install -y binutils python autoconf bison clang coreutils curl findutils apr apr-util postgresql openssl readline libffi libgmp libpcap libsqlite libgrpc libtool libxml2 libxslt ncurses make ncurses-utils ncurses git wget unzip zip tar termux-tools termux-elf-cleaner pkg-config git ruby -o Dpkg::Options::="--force-confnew"

python3 -m pip install --upgrade pip
python3 -m pip install requests


# if any weird warning occurs maybe its becoze of bigdecimal & pg_ext.so . try comment those lines if problem persist

echo
center "*** Fix ruby BigDecimal"
source <(curl -sL https://github.com/termux/termux-packages/files/2912002/fix-ruby-bigdecimal.sh.txt)

echo
center "*** Erasing old metasploit folder..."
rm -rf $PREFIX/opt/metasploit-framework

echo
center "*** Downloading..."
cd $PREFIX/opt
git clone https://github.com/rapid7/metasploit-framework.git --depth=1

echo
center "*** Installation..."
cd $PREFIX/opt/metasploit-framework
# sed '/rbnacl/d' -i Gemfile.lock
# sed '/rbnacl/d' -i metasploit-framework.gemspec

#sed -i "277,\$ s/2.8.0/2.2.0/" Gemfile.lock

gem install bundler
declare NOKOGIRI_VERSION=$(cat Gemfile.lock | grep -i nokogiri | sed 's/nokogiri [\(\)]/(/g' | cut -d ' ' -f 5 | grep -oP "(.).[[:digit:]][\w+]?[.].")
#sed 's|nokogiri (1.*)|nokogiri (1.8.0)|g' -i Gemfile.lock

gem install nokogiri -v $NOKOGIRI_VERSION -- --use-system-libraries

# for aarch64 if nokogiri problem persist do this 

bundle config build.nokogiri "--use-system-libraries --with-xml2-include=$PREFIX/include/libxml2"; bundle install

gem install actionpack
bundle update activesupport
bundle update --bundler
bundle install -j$(nproc --all)

#$PREFIX/bin/find -type f -executable -exec termux-fix-shebang \{\} \;
# rm ./modules/auxiliary/gather/http_pdf_authors.rb
if [ -e $PREFIX/bin/msfconsole ];then
	rm $PREFIX/bin/msfconsole
fi
if [ -e $PREFIX/bin/msfvenom ];then
	rm $PREFIX/bin/msfvenom
fi
if [ -e $PREFIX/bin/msfrpcd ];then
	rm $PREFIX/bin/msfrpcd
fi
ln -s $PREFIX/opt/metasploit-framework/msfconsole $PREFIX/bin/
ln -s $PREFIX/opt/metasploit-framework/msfvenom $PREFIX/bin/
ln -s $PREFIX/opt/metasploit-framework/msfrpcd $PREFIX/bin/

termux-elf-cleaner $PREFIX/lib/ruby/gems/*/gems/pg-*/lib/pg_ext.so

echo
center "*"
echo -e "\033[32m Suppressing Warnings\033[0m"

# sed -i '355 s/::Exception, //' $PREFIX/bin/msfvenom
# sed -i '481, 483 {s/^/#/}' $PREFIX/bin/msfvenom


# sed -Ei "s/(\^\\\c\s+)/(\^\\\C-\\\s)/" $PREFIX/opt/metasploit-framework/lib/msf/core/exploit/remote/vim_soap.rb

# Warning occurs during payload generation
sed -i '86 {s/^/#/};96 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/concurrent-ruby-1.0.5/lib/concurrent/atomic/ruby_thread_local_var.rb
sed -i '442, 476 {s/^/#/};436, 438 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/logging-2.3.1/lib/logging/diagnostic_context.rb

## openssl issue has been fixed 

#sed -i '13,15 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/encryption_algorithm/functionable.rb
#sed -i '14 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp256.rb
#sed -i '14 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp384.rb
#sed -i '14 {s/^/#/}' $PREFIX/lib/ruby/gems/3.1.0/gems/hrr_rb_ssh-0.4.2/lib/hrr_rb_ssh/transport/server_host_key_algorithm/ecdsa_sha2_nistp521.rb

echo
center "*"
echo -e "\033[32m Installation complete. \n Launch metasploit by executing: msfconsole\033[0m"
center "*"

cd ~
cd metasploit-framework && gem install bundle && bundle install 
cd ~ 
git clone https://github.com/vanhauser-thc/thc-hydra
cd ~















