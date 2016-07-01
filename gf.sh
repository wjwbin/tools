#!/bin/sh

si_out="file.txt"
Dirs=(
  "vendor/qcom/proprietary/mm-camera/mm-camera2"
  "vendor/qcom/proprietary/mm-3a-core"
  "vendor/qcom/proprietary/mm-camera-lib"
  "vendor/qcom/proprietary/mm-camera-core"
  "vendor/qcom/proprietary/mm-camerasdk"
  "hardware/qcom/camera/QCamera2"
  "kernel/drivers/media/platform/msm/camera_v2"
  "kernel/include/media"
  "frameworks/av/include/camera"
  "frameworks/av/camera"
  "frameworks/av/services/camera/libcameraservice"
  "system/media/camera"
  "hardware/libhardware"
)

for dir in ${Dirs[@]}
do
  if [ $dir = ${Dirs[0]} ]
  then
    if [ -d $dir ]
    then
      find ${dir} -name "*.cpp" -o -name "*.h" -o -name "*.c" | egrep -v "/chromatix/03|test|eztune" > ${si_out}
    else
      echo "dir: " $dir "not exist"
      echo "" > ${si_out}
    fi
  else
    if [ -d $dir ]
    then
      find ${dir} -name "*.cpp" -o -name "*.h" -o -name "*.c" | egrep -v "/chromatix/03]|test|eztune" >> ${si_out}
    else
      echo "dir: " $dir " not found"
    fi
  fi
done

