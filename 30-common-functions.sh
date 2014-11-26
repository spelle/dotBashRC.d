#!/bin/sh

function tti { # tti = ssh +1
	host=$1
	[[ -S ~/.ssh/.${host} ]] || ssh -M -S ~/.ssh/.${host} $host
	[[ -S ~/.ssh/.${host} ]] && ssh -S ~/.ssh/.${host} $host
}

function sshM {
    ssh -A $1 -M -S ~/.ssh/%r_%h_%p
}

function sshS {
    ssh -A $1 -S ~/.ssh/%r_%h_%p
}

function mkcd {
    mkdir $1
    cd $1
}
