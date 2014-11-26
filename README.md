dotZSH
======

INSTALL
-------

sudo apt-get install curl

curl -L http://install.ohmyz.sh | sh
sed -i "/robbyrussel/gianu/" .zshrc

git clone https://github.com/spelle/dotZSH .zsh

cat << EOF >> .zshrc 
for f in ~/.zsh/*.sh ; do source $f ; done
EOF

