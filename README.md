# tools
tools on linux server

apply_changes: script to apply patch automatically, run apply_patch.sh
               to see the usage
gc.sh:         generate cscope/ctrlp source file for camera project in any
               android directory
gf.sh:         generate sourceinsight source file for camera project, need
               to be run in android root directory, it will generate file.txt
               which can be loaded in source insight
git-repo:      local repo-url tools
gl.sh:         generate window bat file to load newly generate so/xml file and
               reboot the daemon/mediaserver/cameraserver process
gpull:         script to apply patch automatically, run gpull to see the usage
myexit:        a small script to detach from currect screen instead of killing it
               when you run exit, need to add "alias exit='~/tools/myexit" in bashrc
mygit/myrepo:  a customized git/repo tool, run mygit myrepo to see the usage
repo:          repo tool
vimrc:         customized vimrc file, need to run "ln -s ~/tools/vimrc
               ~/.vimrc" to use
