if [[ "EFR00575-VM" == $(uname -n) ]]
then
	function bast {
		bastion=gateway-fr
		# user=$(awk 'f;/Host $bastion/{f=1}' ~/.ssh/config | awk '/User/{ print $2 ; exit }' )
		#[[ -z $user ]] || user=$(whoami)

		#[[ -S ~/.ssh/${user}_${bastion} ]] || sshpass -p $(cat ~/.ssh/awl_pw) ssh -t -A gateway-fr -M -S ~/.ssh/${user}_${bastion} ssh $1
		#[[ -S ~/.ssh/${user}_${bastion} ]] && sshpass -p $(cat ~/.ssh/awl_pw) ssh -t -A gateway-fr -S ~/.ssh/${user}_${bastion} ssh $1
		[[ 0 == $# ]] && sshpass -f ~/.ssh/awl_pw ssh ${bastion}
		[[ 1 == $# ]] && sshpass -f ~/.ssh/awl_pw ssh -t ${bastion} ssh $1
	}

	function kazan_push {
		~/.zsh/awl_kazan_push_autofill	$(who am i | awk '{ print $1 }') $(cat ~/.ssh/awl_pw)
	}

	alias mount_SARA2='sshfs td0sro02b:/SARA2 ~/mnt/td0sro02b/SARA2'
	alias mount_int1='sshfs td0sro02b:/int1 ~/mnt/td0sro02b/int1'
	alias mount_int2='sshfs td0sro02b:/int2 ~/mnt/td0sro02b/int2'
	alias mount_home_sro='sshfs td0sro02b:/home/a127590 ~/mnt/td0sro02b/a127590'
	alias mount_all='mount_home_sro ; mount_int2 ; mount_int1 ; mount_SARA2'

	alias umount_SARA2='fusermount -u ~/mnt/td0sro02b/SARA2'
	alias umount_int1='fusermount -u ~/mnt/td0sro02b/int1'
	alias umount_int2='fusermount -u ~/mnt/td0sro02b/int2'
	alias umount_home_sro='fusermount -u ~/mnt/td0so02b/a127590'
	alias umount_all='umount_home_sro ; umount_int2 ; umount_int1 ; umount_SARA2'

	[[ -n $(ssh-add -l | grep ".ssh/id_rsa") ]] && echo "IDRSA SSH Key already added"
	[[ -n $(ssh-add -l | grep ".ssh/id_rsa") ]] || ~/.zsh/awl_pssphrs_autofill $(cat ~/.ssh/awl_pssphrs) ~/.ssh/id_rsa
	[[ -n $(ssh-add -l | grep ".ssh/id_svn") ]] && echo "IDSVN SSH Key already added"
	[[ -n $(ssh-add -l | grep ".ssh/id_svn") ]] || ~/.zsh/awl_pssphrs_autofill $(cat ~/.ssh/awl_pssphrs) ~/.ssh/id_svn
	[[ -n $(ssh-add -l | grep "Public Key") ]] && echo "IDENTITY SSH Key already added"
	[[ -n $(ssh-add -l | grep "Public Key") ]] || ~/.zsh/awl_pssphrs_autofill $(cat ~/.ssh/awl_pssphrs) ~/.ssh/identity

	[[ 0 == $(grep "search priv.atos.fr" /etc/resolv.conf | wc -l) ]] && sudo su -c 'echo "search priv.atos.fr" >> /etc/resolv.conf'

#	[[ -n $( mount | grep "td0sro02b:/SARA2 on /SARA2") ]] && echo "td0sro02b:/SARA2 allready mounted on /SARA2"
#	[[ -n $( mount | grep "td0sro02b:/SARA2 on /SARA2") ]] || mount_SARA2

#	[[ -n $( mount | grep "td0sro02b:/int1 on /int1") ]] && echo "td0sro02b:/int1 allready mounted on /int1"
#	[[ -n $( mount | grep "td0sro02b:/int1 on /int1") ]] || mount_int1

#	[[ -n $( mount | grep "td0sro02b:/int2 on /int2") ]] && echo "td0sro02b:/int2 allready mounted on /int2"
#	[[ -n $( mount | grep "td0sro02b:/int2 on /int2") ]] || mount_int2
	
#	[[ -n $( mount | grep "td0sro02b:/home/a127590 on /home/a127590/home_sro") ]] && echo "td0sro02b:/home/a127590 allready mounted on /home/a127590/home_sro"
#	[[ -n $( mount | grep "td0sro02b:/home/a127590 on /home/chakung/home_sro") ]] || mount_home_sro
fi
