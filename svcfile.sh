#!/bin/bash

#flo=`echo ${floor}|awk 'gsub(/^ *| *$/,"")'|sed $'s/\'//g'`
#hot=`echo $hotelid|awk 'gsub(/^ *| *$/,"")'`
#echo roslaunch blackpearl bp_web.launch map_file:=/opt/bp/maps/$hot/$flo/map.yaml

#envpath
CURRENT_DIR=$(cd $(dirname $0); pwd)
PARENT_DIR=$(cd $(dirname $0);cd ..; pwd)
filetime=`date +%Y%m%d-%H%M%S`
dateyezip=`date +%Y%m`
lenght=${#dateyezip}
dateyear=${dateyezip:lenght-4}

#makefile相对路径
if [ $1 == "test_"$dateyear ]   #2207
  then  
  mkfilepath=asvcoach2022/test_$dateyear/sim 
  echo "do start"
  echo ${mkfilepath} >> alogsv.txt

  log_dir=${CURRENT_DIR}/log_sv/svzx.log 

  echo "====="$filetime"==sucessful==="  >> alogsv.txt   
  echo "====="$filetime"====="  >> $log_dir
  echo $$ >> $log_dir   #输出当前进程PID

  #/opt/git2022t/asvcoach2022/test_2207/sim
  cd ${CURRENT_DIR}/${mkfilepath}
  make run  >> "makefile"$filetime.log &
  
  echo "make run ok"

  #elif [ $1 == "stop" ]
  #then
  #echo "do stop"
  else
  echo "Please make sure the makeilepath variable."$filetime >> alogsv.txt
  echo "Please make sure the makeilepath"
  echo $dateyear
fi


#mkfilepath=asvcoach2022/test_2207/sim 

