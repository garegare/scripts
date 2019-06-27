#!/bin/bash

src=/opt/samba/photo/import/
dist=/opt/samba/photo/

echo old file num : `ls -l ${src} | wc -l`

list=($(ls $src))
count=0

for file in ${list[@]}; do
  case "$file" in
  *.JPG )
    d=`identify -format "%[Exif:DateTime]\n" ${src}${file} | awk -F'[ :'] '{print $1$2$3}'`
    if [ ! -d ${dist}${d} ]; then
      mkdir ${dist}${d}
    fi
    cp ${src}${file} ${dist}${d}/
    count=$((count += 1));;
  *.CR2 | *.MOV )
    d=`date +%Y%m%d -r ${src}${file}`
    if [ ! -d ${dist}${d} ]; then
      mkdir ${dist}${d}
    fi
    cp ${src}${file} ${dist}${d}/
    count=$((count += 1));;
  * ) echo "other";;
  esac
done

echo ${count}


