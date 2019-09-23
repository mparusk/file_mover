#!/bin/bash	

#create new directory in the parent folder
#for each directory, move all the contents to the new directory
#print $(totaldirs) - $(deleted dirs)  out of $(totaldirs) done
#delete directory (or even better, move to trash?)
#in the end print all files (should probably be 144)

mkdir ./extracted 
#echo $(ls):
counter=0
directories_found=$(ls -dq *drive* | wc -l)
echo $directories_found
#why doesnt /~/Downloads/extracter/ work?
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
	let "counter++"
	#trash -v -F $directory 
	fi
done

echo $counter
echo 'finished'
