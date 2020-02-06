PS1="PlatformSDK $PS1"
if [ -d /etc/bash_completion.d ]; then
   for i in /etc/bash_completion.d/*;
   do
      . $i
   done
fi

function hadk() { source $HOME/.hadk.env; echo "Env setup for $DEVICE"; }

cd $ANDROID_ROOT

alias ubu="ubu-chroot -r $PLATFORM_SDK_ROOT/sdks/ubuntu"
alias bp="rpm/dhd/helpers/build_packages.sh"
alias build_all_packages="bp"

clone_src() {
	path="$ANDROID_ROOT/$3/"
	mkdir -p "$path"
	git clone --recurse -b $2 https://github.com/sailfishos-oneplus5/$1 "$path" &> /dev/null
}

update_src() {
	path="$ANDROID_ROOT/$1/"
	[ ! -d "$path" ] && exit 1
	# TODO: Fix updating properly; force all unless local changes detected?
	cd "$path" && git fetch &> /dev/null && git pull --recurse-submodules &> /dev/null
}

choose_target() {
	echo -e "\nWhich hybris-15.1 device would you like to build for?"
	echo -e "\n  1. enchilada (OnePlus 6)"
	echo -e "  2. fajita     (OnePlus 6T)\n"
	read -p "Choice: (1/2) " target

	# Setup variables
   if [ -z $target ]; then
     device="$(<$ANDROID_ROOT/.last_device)"
   else
     device="enchilada"
     [ "$target" = "2" ] && device="fajita"
     branch="hybris-16.0"
     [ "$device" = "fajita" ] && branch="fajita-16.0"
     [ -f "$ANDROID_ROOT/.last_device" ] && last_device="$(<$ANDROID_ROOT/.last_device)"
   fi

	if [ "$device" != "$last_device" ]; then
		if [ ! -z "$last_device" ]; then
			echo "WARNING: All current changes in SFOS local droid repos WILL be discarded if you continue!"
			read -p "Would you like to continue? (y/N) " ans
			ans=`echo "$ans" | xargs | tr "[y]" "[Y]"`
			if [ "$ans" != "Y" ]; then
				hadk
				return 1
			fi

			echo "Discarded local droid HAL & configs for $last_device!"
			rm -rf $ANDROID_ROOT/rpm* $ANDROID_ROOT/hybris/droid-{configs,hal-version-}*
		fi

		printf "Cloning droid HAL & configs for $device..."
		clone_src "droid-hal-cheeseburger" "$branch" "rpm" &&
		clone_src "droid-config-cheeseburger" "$branch" "hybris/droid-configs" &&
		clone_src "droid-hal-version-cheeseburger" "$branch" "hybris/droid-hal-version-$device"
		(( $? == 0 )) && echo " done!" || echo " fail! exit code: $?"

		echo "$device" > "$ANDROID_ROOT/.last_device"
	else
		printf "Updating droid HAL & configs for $device..."
		update_src "rpm" &&
		update_src "hybris/droid-configs" &&
		update_src "hybris/droid-hal-version-$device"
		(( $? == 0 )) && echo " done!" || echo " fail! exit code: $?"
	fi

	sed "s/DEVICE=.*/DEVICE=\"$device\"/" -i $HOME/.hadk.env
	hadk
}

choose_target
