#!/bin/bash	

#create new directory in the parent folder
#for each directory, move all the contents to the new directory
#print $(totaldirs) - $(deleted dirs)  out of $(totaldirs) done
#delete directory (or even better, move to trash?)
#in the end print all files (should probably be 144)

counter=0
directories_found=$(ls -d *drive*| wc -l |xargs)

#Doing some dodgy stuff for better visuals
echo "Welcome to Maria's file mover."
echo ""
echo ""

sleep 1
echo "Total extractable directories found: ${directories_found}"
sleep 1

mkdir ./extracted
for directory in ./*
do	
	#echo 'outer loop'
	#echo $directory
	if [[ $directory =~ .*drive.* ]]
	then
		for file in ./$directory/*
			do 	
				#echo $file
				mv $file ./extracted/
						
			done

	#if isempty - delete, if isn't, show err
	(wc -l $directory/* | xargs) > error.txt
	
	if [ cat error.txt -eq 0 ]
	then
    		echo "caught"
	fi

	

	
	let "counter++"
	difference=$((directories_found-counter))
	echo "${counter} directories done, ${difference} directories to go"
	sleep 1
	#trash -v -F $directory 
	fi
done

echo "Finished moving"
sleep 1
echo "${counter} out of ${directories_found} moved to extracted."
