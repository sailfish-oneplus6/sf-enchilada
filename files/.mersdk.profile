PS1="PlatformSDK $PS1"
if [ -d /etc/bash_completion.d ]; then
   for i in /etc/bash_completion.d/*;
   do
      . $i
   done
fi

function hadk() { source $HOME/.hadk.env; echo "Env setup for $DEVICE"; }
hadk

cd $ANDROID_ROOT

alias ubu="ubu-chroot -r $PLATFORM_SDK_ROOT/sdks/ubuntu"
alias bp="rpm/dhd/helpers/build_packages.sh"
alias build_all_packages="bp"
