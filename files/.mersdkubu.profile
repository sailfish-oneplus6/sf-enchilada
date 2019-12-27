function hadk() { source $HOME/.hadk.env; echo "Env setup for $DEVICE"; }
export PS1="HABUILD_SDK [\${DEVICE}] $PS1"
hadk

cd $ANDROID_ROOT
. build/envsetup.sh
breakfast $DEVICE

export USE_CCACHE=1

alias hh="mka hybris-hal"
alias hb="mka hybris-boot"
alias clean="mka clean"
