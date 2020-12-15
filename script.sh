#!/bin/bash
# + ------------------------------------------------------------------------- +
# ┏━┓┏━┓┏━┓╻┏ ┏━╸┏━┓ | Parker Oakes                                           +
# ┣━┛┃ ┃┣━┫┣┻┓┣╸ ┗━┓ | alan.p.oakes@gmail.com                                 +
# ╹  ┗━┛╹ ╹╹ ╹┗━╸┗━┛ | github.com/alanoakes | parkeroakes.io                  +
# + ------------------------------------------------------------------------- +
# File Description:
# Automate SDLC Project setup with secure ID's 


echo 'Initiating new software project...'
while :; do
	# que script to declare project name var
	read -r -p 'Enter your new project name (no spaces): ' SoftwareProj
	# determine if a bash variable is empty
	if [[ -z "$SoftwareProj" ]]
	then 
		echo "Your entry has no characters. Please re-enter project name or press Ctrl + c to exit project setup."
	else

    # Generate encrypted project id:
    ProjDate="P$(date +%Y%m%d%H%M)_"
    ProjId=""
    until [ ${#ProjId} -eq '10' ]; do
      for x in $(echo {a..z}$(shuf -i 1-10 -r -n 1) | tr -d '\n' | tr -d ' '); do
        for y in ${x:$((RANDOM%52+1)):1}; do
          ProjId="$ProjId$y"
        done
      done
    done
    ProjectId="+$ProjDate$ProjId"

    echo "Building $SoftwareProj in taskwarrior with project ID: $ProjDate$ProjId"

    # Generate new software project
		cmd01=`task add pro:$SoftwareProj $ProjectId 'Planning'`
		id01=`echo $cmd01 | grep -o -E '[0-9]+'`
		cmd02=`task add pro:$SoftwareProj $ProjectId 'Design' depends:$id01`
		id02=`echo $cmd02 | grep -o -E '[0-9]+'`
		cmd03=`task add pro:$SoftwareProj $ProjectId 'Development' depends:$id02`
		id03=`echo $cmd03 | grep -o -E '[0-9]+'`
		cmd04=`task add pro:$SoftwareProj $ProjectId 'Testing' depends:$id03`
		id04=`echo $cmd04 | grep -o -E '[0-9]+'`
		cmd05=`task add pro:$SoftwareProj $ProjectId 'Deployment' depends:$id04`
		id05=`echo $cmd05 | grep -o -E '[0-9]+'`
		cmd06=`task add pro:$SoftwareProj $ProjectId 'Maintenance' depends:$id05`
		id06=`echo $cmd06 | grep -o -E '[0-9]+'`

    # clear (unset) project variables so they are not incorrectly reassigned
		SoftwareProj=""

	fi
	# que to build another project
	read -r -p 'Do you want to build another software project? (type "n" to exit or "y" to resume): '
	[[ "${REPLY}" == 'n' ]] && break
done
