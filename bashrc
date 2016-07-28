if [ -f /etc/bash_completion ] &&! shopt -oq posix; then
. /etc/bash_completion
fi

cd /local/mnt/workspace
alias ls='ls --color'
export PATH=~/tools:$PATH
alias adb='sudo adb'
alias fastboot='sudo fastboot'
alias lsusb='sudo lsusb'
alias mount='sudo mount'
alias stl='cd ~/workspace/personal/study/cplusplus/cplusplus_stl'
alias work='cd ~/workspace/code'
alias gl='~/tools/gl.sh'
alias gcs='. ~/tools/gc.sh'
alias gf='. ~/tools/gf.sh'
alias exit='. ~/tools/myexit.sh'
alias lcs='export CSCOPE_DB=${ANDROID_BUILD_TOP}"/cscope.out"'
alias myrepo='~/tools/myrepo.py'
alias mygit='~/tools/mygit.py'
alias cmm='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera'
alias ccore='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera-core'
alias c3a='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-3a-core'
alias chal='cd $ANDROID_BUILD_TOP/hardware/qcom/camera'
alias clib='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera-lib'
alias csdk='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camerasdk'
alias cout='cd $OUT'
alias sync='repo sync -j8'
alias rm='rm -rf'
alias mm='mm -j8'
http_proxy=http://secure-proxy2.qualcomm.com:9090
export http_proxy
alias cse='export CSCOPE_DB=${ANDROID_BUILD_TOP}"/cscope.out"'
alias tnf='touch_new_file.sh'
alias gchid='scp -p -P 29418 wenbinw@review-android.quicinc.com:hooks/commit-msg .git/hooks/ '
alias scn='screen'
alias ap02='ssh chiz@10.231.212.23'
clear
scn -ls
