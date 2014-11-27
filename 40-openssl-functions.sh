#!/usr/bin/sh

# OpenSSL Functions
#-------------------

function pem2text {
	openssl x509 -in $1 -noout -text 
}

function pem_verify {
	openssl verify -CAfile $1 $2
}

function pem_get_OU {
	openssl x509 -noout -subject -in $1 | awk -F'/' '{print $3}' | awk -F'=' '{print $2}'
}

function pem_get_CN {
	openssl x509 -noout -subject -in $1 | awk -F'/' '{print $2}' | awk -F'=' '{print $2}'
}

function pem_get_EndDate {
	openssl x509 -noout -enddate -in $1 | awk -F '=' '{print $2}'
}

function pem_NormalizeName {
	varOU=$(pem_get_OU $1)
	varCN=$(pem_get_CN $1)
	varEndDate=$(date -d "$(pem_get_EndDate $1)" +%Y-%m-%d)

	mv $1 $varOU.$varCN.$varEndDate.pem
}
