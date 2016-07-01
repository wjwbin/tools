#!/usr/bin/python

import sys
import os
import re

if __name__ == '__main__':
	type = raw_input('''Please input init type\n\t1. Branch\n\t2. AU\n''')
	command_prefix = 'repo init -u git://git.quicinc.com/platform/manifest.git -b '

	if  type == '1' or re.match(type, 'branch', re.IGNORECASE):
		branch_name = raw_input('''Please input branch name \n''')
		command = command_prefix + branch_name + ' --repo-url=~/bin/git-repo/'
	elif type == '2' or re.match(type, 'au', re.IGNORECASE):
		au_name = raw_input('''Please input AU name \n''')
		command = command_prefix + ' refs/tags/' + au_name + ' -m versioned.xml --repo-url=~/bin/git-repo/'
	else:
		print "Wrong command"

	print '\n\n'
	print command
	print '\n\n'
	os.system(command)
