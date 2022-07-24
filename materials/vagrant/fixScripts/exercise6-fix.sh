#!/bin/bash
#add fix to exercise6-fix here


host="$(hostname)"
if [[ "$host" == "server1" ]]
then
        dest="server2"
else
        dest="server1"
fi

for i in $*; do test $i ;done
lastp= $i

sizeall=0
filesize=0

array=( "$@" )
unset "array[${#array[@]}-1]"    # Removes last element 
for i in "${array[@]}"; do
        scp $i $dest:$lastp
        filesize=$(ls -lh $i | awk '{print  $5}')
        sizeall=$(($sizeall+$filesize))
done

echo $sizeall