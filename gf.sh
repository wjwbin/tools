#!/bin/bash

si_out="file.txt"
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
  "kernel/msm-4.4/drivers/media/platform/msm/camera_v2"
  "kernel/msm-4.4/include/media"
  "frameworks/av/include/camera"
  "frameworks/av/camera"
  "frameworks/av/services/camera/libcameraservice"
  "system/media/camera"
  "hardware/libhardware"
  "mm-camera/mm-camera2"
  "mm-3a-core"
  "mm-camera-lib"
  "mm-camera-core"
  "mm-camerasdk"
  "camx-lib-3a"
  "camx-lib-stats"
  "camx"
  "chi-cdk"
)

#specify the file that need to be excluded
#EXU_FILE="/chromatix/03|test|eztune"
EXU_FILE="tuning"

for dir in ${Dirs[@]}
do
  if [ $dir = ${Dirs[0]} ]
  then
    if [ -d $dir ]
    then
      find ${dir} -name "*.cpp" -o -name "*.h" -o -name "*.c" -o -name "*.xml" | egrep -v ${EXU_FILE} > ${si_out}
    else
      echo "dir: " $dir "not exist"
      echo "" > ${si_out}
    fi
  else
    if [ -d $dir ]
    then
      find ${dir} -name "*.cpp" -o -name "*.h" -o -name "*.c" -o -name "*.xml" | egrep -v ${EXU_FILE} >> ${si_out}
    else
      echo "dir: " $dir " not found"
    fi
  fi
done

