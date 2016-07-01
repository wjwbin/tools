#!/bin/bash

usage ()
{
	echo "==============================="
	echo "Usage: $0 -p root_path -a (apply|push) -f|c (filename| changes)"
	echo "==============================="
}

changes=
if [ $# -lt 6 ]; then
	echo "Error:please check your arguments"
	usage
	exit 1 
fi

if [ "$1" = "-p"  -a \( -d "$2" -a -w "$4" \) ]; then
	echo "Error:please check your root path"
	usage
	exit 1
fi
root_path=$2
shift
shift
if [ ! "$1" = "-a" ] && [ ! \( "$2" = "push" -o "$2" = "apply" \) ]; then
	echo "Error:please check your action and parameter"
	usage
	exit 1
fi
shift
shift

if [ "$1" = "-f" -a \( -f "$2" -a -r "$4" \) ] || [ "$1" = "-c" -a "$2" != "" ]; then
	shift
	changes=$@
else
	echo "Error:please check your changes and parameter"
	usage
	exit 1
fi
#check the local have the repo dir
pushd $root_path 2>&1 >/dev/null
if [ ! -f ./.repo/manifest.xml ];then
	echo "Error: can not find the repo dir"
	exit 1
fi
for change in $changes
do 
	echo "--------https://review-android.quicinc.com/#/c/$change---------"
	project_name=$(ssh -p 29418 $USER@review-android.quicinc.com gerrit query $change --current-patch-set | grep project | awk '{print $2}')
#	project_path=$(.repo/repo/repo forall $project_name -c 'echo $REPO_PATH' 2>/dev/null)
#	project_path=$(.repo/repo/repo list $(project_name) | awk '{print $1}')
	project_path=$(.repo/repo/repo list $project_name | awk '{print $1}')
	pushd $project_path 2>&1 >/dev/null
	change_refs=$(ssh -p 29418 $USER@review-android.quicinc.com gerrit query $change --current-patch-set | grep "ref:" | awk '{print $2}')
	echo "++ git fetch ssh://review-android.quicinc.com:29418/$project_name $change_refs"
	fetch_info=$(git fetch ssh://review-android.quicinc.com:29418/$project_name $change_refs)
	fetch_status=$?
	if [ $fetch_status -ne 0 ]; then
		echo "+++ ERROR: ================================"
		echo "+++        you changes $change fetch failed, retrun code($fetch_status)"
		echo "+++        message: $fetch_info"
		echo "+++ ERROR: ================================"
		echo "--------------------------------------------------------------"
		echo ""
		continue
	fi
	echo "++ git cherry-pick FETCH_HEAD"
	cherrypick_info=$(git cherry-pick FETCH_HEAD 2>&1 >/dev/null)
	cherrypick_status=$?
	if [ $cherrypick_status -ne 0 ]; then
		echo "$cherrypick_info" | grep "allow-empty" 2>&1 >/dev/null
		if [ $? -eq 0 ];then
			echo "++++ Warning: this change is allow-empty"
		else
			echo "++++ ERROR: ================================"
			echo "++++ you changes $change cherrypick failed, return code($cherrypick_status)"
			echo "++++ Message: $cherrypick_info"
			conflict=$(git status -s)
			echo "++++ $conflict"
			echo "++++ ERROR: ================================"
		fi
	fi
	git reset --hard
	popd 2>&1 >/dev/null
	echo "--------------------------------------------------------------"
	echo ""
done
