dotBashRC.d
======

INSTALL
-------

	curl -L https://raw.githubusercontent.com/spelle/dotBashRC.d/master/K00-Install.sh | sh

or

	git clone https://github.com/spelle/dotBashRC.d .bashrc.d

	cat << EOF >> .bashrc 
	
	for f in ~/.bashrc.d/*.sh ; do source \$f ; done
	EOF

