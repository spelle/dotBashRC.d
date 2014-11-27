#!/bin/sh

# SSH Functions
#---------------

function tti { # tti = ssh +1
	host=$1
	[[ -S ~/.ssh/.${host} ]] || ssh -M -S ~/.ssh/.${host} $host
	[[ -S ~/.ssh/.${host} ]] && ssh -S ~/.ssh/.${host} $host
}
