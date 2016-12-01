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
            ext_url = 'platform/vendor/qcom-proprietary/mm-camera'
        elif cwd == 'mm-camera-core':
            ext_url = 'platform/vendor/qcom-proprietary/ship/mm-camera-core'
        elif cwd == 'mm-3a-core':
            ext_url = 'platform/vendor/qcom-proprietary/ship/mm-3a-core'
        elif cwd == 'camera':
            ext_url = 'platform/hardware/qcom/camera'
        elif cwd == 'mm-still':
            ext_url = 'platform/vendor/qcom-proprietary/mm-still'
        elif cwd == 'mm-camera-lib':
            ext_url = 'platform/vendor/qcom-proprietary/mm-camera-lib'
        else:
            print 'current cwd %s is not support' %cwd
            exit()

        branch_name = param
        if command == 'push':
            gitcmd = 'git push ' + base_url + ext_url + ' HEAD:refs/for/' + branch_name
        if command == 'clone':
            gitcmd = 'git clone ' + base_url + ext_url + '.git -b ' + branch_name
        if command == 'add':
            gitcmd = 'git remote add ' + branch_name + " ssh://review-android.quicinc.com:29418/" + ext_url
        else:
            print "Cur command: %s not support" %command
            exit()

        print gitcmd
        os.system(gitcmd)
