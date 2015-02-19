#!/bin/sh

git clone https://github.com/spelle/dotBashRC.d .bashrc.d

cat << EOF >> .bashrc 

for f in ~/.bashrc.d/S*.sh ; do source \$f ; done
EOF
