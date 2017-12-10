#!/bin/sh
dir="/opt/dummy-smtp/mail"
outDir="$dir/new"
if [ ! -f $dir/id_file ]; then
echo "10000" > $dir/id_file
fi
now=`date '+%Y%m%d-%H%M%S'`
num=`cat $dir/id_file`
num=$(($num + 1))
echo $num > $dir/id_file
name="$outDir/msg-$num-$now.eml"
while IFS= read line
do
echo "$line" >> $name
done
chmod 666 $name
/bin/true
