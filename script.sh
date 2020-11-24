#!/bin/bash

echo 'Initiating new software project...'
while :; do
	# que script to declare project name var
	read -r -p 'Enter your new project name (no spaces): ' SoftwareProj
	# determine if a bash variable is empty
	if [[ -z "$SoftwareProj" ]]
	then 
		echo 'Your entry has no characters. Please re-enter project name or press Ctrl + c to exit project setup.'
	else
		echo 'Building \$SoftwareProj project in taskwarrior ...'

		cmd01=`task add pro:$SoftwareProj +Software 'Planning'`
		id01=`echo $cmd01 | grep -o -E '[0-9]+'`
		cmd02=`task add pro:$SoftwareProj +Software 'Design' depends:$id01`
		id02=`echo $cmd02 | grep -o -E '[0-9]+'`
		cmd03=`task add pro:$SoftwareProj +Software 'Development' depends:$id02`
		id03=`echo $cmd03 | grep -o -E '[0-9]+'`
		cmd04=`task add pro:$SoftwareProj +Software 'Testing' depends:$id03`
		id04=`echo $cmd04 | grep -o -E '[0-9]+'`
		cmd05=`task add pro:$SoftwareProj +Software 'Deployment' depends:$id04`
		id05=`echo $cmd05 | grep -o -E '[0-9]+'`
		cmd06=`task add pro:$SoftwareProj +Software 'Maintenance' depends:$id05`
		id06=`echo $cmd06 | grep -o -E '[0-9]+'`
		# clear (unset) project variables so they are not incorrectly reassigned
		SoftwareProj=""

	fi
	# que to build another project
	read -r -p 'Do you want to build another software project? (type "e" to exit or "n" to resume): '
	[[ "${REPLY}" == 'e' ]] && break
done
