#!/usr/bin/python

import sys
import os

def myGitHelp():
	print "Usage: mygit <command> [<args>]"
	print ""
	print "The most commonly used commands are:"
	print "  push:   push the current commit id to remote gerrit server"
	print "  clone:  clone a specific branch"
	pass


if __name__ == '__main__':
	argc = len(sys.argv)

	if argc == 1:
		myGitHelp()


	if argc == 2:
		command = sys.argv[1]
		if command == 'help' or command == '--help':
			myGitHelp()
		else:
			print 'command "mygit %s" not support yet' %command

	if argc == 3:
		command = sys.argv[1]
		param = sys.argv[2]
		cwd = os.getcwd().split('/')[-1]
		base_url = 'ssh://wenbinw@review-android.quicinc.com:29418/'
		if cwd == 'mm-camera':
			url = base_url + 'platform/vendor/qcom-proprietary/mm-camera'
		elif cwd == 'mm-camera-core':
			url = base_url + 'platform/vendor/qcom-proprietary/ship/mm-camera-core'
		elif cwd == 'mm-3a-core':
			url = base_url + 'platform/vendor/qcom-proprietary/ship/mm-3a-core'
		elif cwd == 'camera':
			url = base_url + 'platform/hardware/qcom/camera'
		elif cwd == 'mm-still':
			url = base_url + 'platform/vendor/qcom-proprietary/mm-still'
		elif cwd == 'mm-camera-lib':
			url = base_url + 'platform/vendor/qcom-proprietary/mm-camera-lib'
		else:
			print 'current cwd %s is not support' %cwd
		if command == 'push':
			branch_name = param
			gitcommand = 'git push ' + url + ' HEAD:refs/for/' + branch_name
			print gitcommand
			os.system(gitcommand)
		if command == 'clone':
			branch_name = param
			gitcommand = 'git clone ' + url + '.git -b ' + branch_name
			print gitcommand
			os.system(gitcommand)
