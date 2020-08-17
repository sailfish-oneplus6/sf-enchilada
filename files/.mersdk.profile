PS1="PlatformSDK $PS1"
echo $PS1
if [ -d /etc/bash_completion.d ]; then
   for i in /etc/bash_completion.d/*;
   do
      . $i
   done
fi

export RELEASE=`cat /etc/os-release | grep VERSION_ID | cut -d"=" -f2`
export PLATFORM_SDK_ROOT="/srv/mer"
export ANDROID_ROOT=$HOME/sfos/hadk

remote="https://github.com/sailfish-oneplus6"

alias ubu="ubu-chroot -r $PLATFORM_SDK_ROOT/sdks/ubuntu"
alias bp="rpm/dhd/helpers/build_packages.sh"
alias build_all_packages="bp"

hadk() {
	echo
	source $HOME/.hadk.env
	echo "Env setup for $DEVICE"
	cd $ANDROID_ROOT
}

clone_src() {
	path="$ANDROID_ROOT/$3/"
	mkdir -p "$path"
	git clone --recurse -b $2 $remote/$1 "$path" # &> /dev/null
}

update_src() {
	path="$ANDROID_ROOT/$1/"
	echo $path
	[ ! -d "$path" ] && echo "Something bad" && exit 1
	# TODO: Fix updating properly; force all unless local changes detected?
	cd "$path" && git fetch &> /dev/null && git pull --recurse-submodules &> /dev/null
}

choose_target() {
	echo -e "\nWhich device would you like to build for?"
	echo -e "\n  1. enchilada (OnePlus 6)"
	echo -e "  2. fajita    (OnePlus 6T)\n"``
	read -p "Choice: (1/2) " target

	# Setup variables
   [ -f "$ANDROID_ROOT/.last_device" ] && last_device="$(<$ANDROID_ROOT/.last_device)"

   if [ -z $target ]; then
     device="$(<$ANDROID_ROOT/.last_device)"
   else
     device="enchilada"
     [ "$target" = "2" ] && device="fajita"
   fi

	sed "s/DEVICE=.*/DEVICE=\"$device\"/" -i $HOME/.hadk.env
	hadk
}

hadk
# Only run this after repo sync to prevent weird issues
[[ -d $ANDROID_ROOT/hybris ]] && choose_target
