#!/usr/bin/python

import sys
import os
import re
import readline
import shelve
import subprocess


GITQUIC = "git://git.quicinc.com"
MFGITPRJ = "platform/manifest.git"
REPOURL = "~/git-repo"
CFGFILE = "~/bin/.myrepo_config"
GIT = 'git'
branch = 'stable'

def get_cmd_result(command):
    result = os.popen(command).read()
    if result != "":
        return result[:-1]
    else:
        return None

def check_validate(repo_url):
    cwd = get_cmd_result("echo " + repo_url)
    cmd = [GIT, 'describe', 'origin/%s' % branch]
    try:
        proc = subprocess.Popen(cmd,
                            stdout=subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            cwd = cwd)
        cur = proc.stdout.read().strip()
        proc.stdout.close()
        proc.stderr.read()
        proc.stderr.close()
    except:
        return False
    if proc.wait() != 0 or not cur:
        return False
    else:
        return True

def write_to_persist(repo_url):
    cfgfile = get_cmd_result("echo " + CFGFILE)
    shelf = shelve.open(cfgfile)
    shelf["repourl"] = repo_url
    shelf.close()

def specify_url():
    input = raw_input('''please specify the repo-url address\n''')
    if check_validate(input):
        write_to_persist(input)
        return input
    else:
        print "Invalid repo url address, exit!!!"
        exit(0)

if __name__ == '__main__':
    repourl = get_cmd_result("echo " + REPOURL)
    cfgfile = get_cmd_result("echo " + CFGFILE)
    repo_url = ""
    if os.path.isfile(cfgfile):
        shelf = shelve.open(cfgfile)
        if 'repourl' in shelf.keys():
            repo_url = shelf["repourl"]
    elif os.path.isdir(repourl):
        repo_url = repourl
    if not check_validate(repo_url):
        repo_url = specify_url();

    type = raw_input('''Please input init type\n\t1. Branch\n\t2. AU\n''')
    cmdPfx = "repo init -u " + GITQUIC + '/' + MFGITPRJ + ' -b '
    if  type == '1' or re.match(type, 'branch', re.IGNORECASE):
        branch_name = raw_input('''Please input branch name \n''')
        command = cmdPfx + branch_name + ' --repo-url=' + repo_url
    elif type == '2' or re.match(type, 'au', re.IGNORECASE):
        au_name = raw_input('''Please input AU name \n''')
        command = cmdPfx + ' refs/tags/' + au_name + ' -m versioned.xml --repo-url=' + repo_url
    else:
        print "Wrong command"

    print '\n\n'
    print command
    print '\n\n'
    os.system(command)
