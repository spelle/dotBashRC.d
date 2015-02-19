#!/bin/sh

git clone https://github.com/spelle/dotBashRC.d .bashrc.d

cat << EOF >> .zshrc 

for f in ~/.bashrc.d/*.sh ; do source \$f ; done
EOF
