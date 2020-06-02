#!/bin/sh

repodirname=".repo"
curpath=`pwd`
rootpath="/"
CS_TOP=""

while [ $curpath != $rootpath ]; do
  if [ -d $curpath/$repodirname ]; then
    CS_TOP=$curpath
    echo "repo dir found, set current path $curpath as android build top dir"
    break
  else
    curpath=$(cd "$curpath/..";pwd)
    echo "current dir name is "$curpath
  fi
done

if [ -z "$CS_TOP" ]; then
  echo "no CS_TOP set, exit!!!"
  return
fi

if [ -a ${CS_TOP}"/cscope.files" ]; then
  if [ $# -ge 1 ] && [ $1 == "new" ]; then
      echo "New CS files required"
  else
    echo "cs file exists, just the env and return"
    export CSCOPE_DB=${CS_TOP}"/cscope.out"
    return
  fi
fi

cscope_out=${CS_TOP}"/cscope.files"

Dirs=(
  "vendor/qcom/proprietary/mm-camera/mm-camera2"
  "vendor/qcom/proprietary/mm-3a-core"
  "vendor/qcom/proprietary/mm-camera-lib"
  "vendor/qcom/proprietary/mm-camera-core"
  "vendor/qcom/proprietary/mm-camerasdk"
  "vendor/qcom/proprietary/camx"
  "vendor/qcom/proprietary/chi-cdk"
  "vendor/qcom/proprietary/camx-lib-stats"
  "vendor/qcom/proprietary/camx-lib-3a"
  "hardware/qcom/camera/QCamera2"
  "kernel/drivers/media/platform/msm/camera_v2"
  "kernel/include/media"
  "mm-camera-lib"
  "mm-camera"
  "mm-3a-core"
  "mm-camerasdk"
  "camx-lib-3a"
  "camx-lib-stats"
  "chi-cdk"
  "camx"
)

i=0
for dir in ${Dirs[@]}
do
  absdir=${CS_TOP}"/"${dir}
  if [ -d $absdir ]
  then
    if [ $i = 0 ]
    then
      find ${absdir} -name "*.cpp" -o -name "*.h" -o -name "*.c" -o -name "*.xml" |egrep -v "/chromatix/03|test" > ${cscope_out}
    else
      find ${absdir} -name "*.cpp" -o -name "*.h" -o -name "*.c" -o -name "*.xml" |egrep -v "/chromatix/03|test" >> ${cscope_out}
    fi
  i=$((i+1))
  fi
done

cscope -bkq -i ${cscope_out}
ctags  -L ${cscope_out}

curpath=`pwd`
if [ $curpath != $CS_TOP ]
then
  mv cscope* ${CS_TOP}
  mv tags ${CS_TOP}
fi

export CSCOPE_DB=${CS_TOP}"/cscope.out"
