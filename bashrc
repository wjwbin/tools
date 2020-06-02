if [ -f /etc/bash_completion ] &&! shopt -oq posix; then
. /etc/bash_completion
fi

name=`hostname`;
if [ $name = 'wenbinw-linux' ]
then
  workPath='/local/mnt/workspace'
elif [ $name = 'qcamera-3a-linux2' ]
then
  workPath='/local/mnt2/workspace2/wenbinw'
elif [ $name = 'cam-stats-linux' ]
then
  workPath='/local/mnt2/workspace2/wenbinw_temp_use_dont_delete'
fi

alias ls='ls --color'
export PATH=~/tools:$PATH
alias adb='sudo adb'
alias fastboot='sudo fastboot'
alias lsusb='sudo lsusb'
alias mount='sudo mount'
alias work='cd ~/workspace/code'
alias gl='~/tools/gl.sh'
alias gcs='. ~/tools/gc.sh'
alias gf='. ~/tools/gf.sh'
alias exit='. ~/tools/myexit.sh'
alias lcs='export CSCOPE_DB=${ANDROID_BUILD_TOP}"/cscope.out"'
alias myrepo='~/tools/myrepo.py'
alias mygit='~/tools/mygit.py'
alias ccore='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera-core'
alias c3a='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/camx-lib-3a'
alias chal='cd $ANDROID_BUILD_TOP/hardware/qcom/camera'
alias clib='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/camx-lib'
alias csdk='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camerasdk'
alias cmx='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/camx'
alias csts='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/camx-lib-stats'
alias cout='cd $OUT'
alias rm='rm -rf'
alias mm='mm -j8'
alias chome='cd $workPath'
http_proxy=http://secure-proxy2.qualcomm.com:9090
export http_proxy
alias cse='export CSCOPE_DB=${ANDROID_BUILD_TOP}"/cscope.out"'
alias gchid='scp -p -P 29418 wenbinw@review-android.quicinc.com:hooks/commit-msg .git/hooks/ '
alias scn='screen'
export JACK_SERVER=false
export JACK_REPOSITORY=prebuilts/sdk/tools/jacks 

chome
clear
scn -ls
