dotZSH
======

INSTALL
-------

	sudo apt-get install curl

	curl -L http://install.ohmyz.sh | sh
	sed -i "/robbyrussel/gianu/" .zshrc

	git clone https://github.com/spelle/dotBashRC.d .bashrc.d

	cat << EOF >> .zshrc 
	
	for f in ~/.bashrc.d/*.sh ; do source \$f ; done
	EOF

