#!/bin/bash
#/* **************** LFD109x:2022-03-22 s_10/lab_conflict.sh **************** */
#/*
# * The code herein is: Copyright the Linux Foundation, 2022
# *
# * This Copyright is retained for the purpose of protecting free
# * redistribution of source.
# *
# *     URL:    https://training.linuxfoundation.org
# *     email:  info@linuxfoundation.org
# *
# * This code is distributed under Version 2 of the GNU General Public
# * License, which you should have received with the source.
# *
# */
#!/bin/bash 

# initialize the repository and put our name and email in the .config file

echo -e "\n\n*************   CREATING THE REPOSITORY AND CONFIGURING IT\n\n"

rm -rf git-test ; mkdir git-test ; cd git-test
git init
git config user.name "A Smart Guy"
git config user.email "asmartguy@linux.com"

echo -e "\n\n*************   CREATING A COUPLE OF FILES AND ADDING THEM TO THE PROJECT AND COMMITTING\n\n"

# create a couple of files and add them to the project, and then commit

echo file1 > file1
echo file2 > file2
git add file1 file2
git commit . -m "This is our first commit"

# create a new development branch

echo -e "\n\n**************** CREATING A NEW BRANCH, devel ***\n\n"

git branch devel

# checkout the new branch

echo -e "\n\n*************** CHECKOUT BRANCH devel ****\n\n"

git checkout devel

# modify a file and add a new one

echo another line >> file1
echo file3 >> file3

git add file1 file3

echo -e "\n\n*************    DIFFING\n\n"
git diff

echo -e "\n\n*************   RECOMITTING\n\n"

# now get it all in with another commit

git commit . -s -m "This is a commit in the devel branch"

#  list files

echo -e "\n\nlist files, then git ls-files\n\n"

ls -l
git ls-files

# now checkout the original branch

echo -e "\n\n************ LIST BRANCHES AND CHECKOUT main **\n\n"

git branch
git checkout main

#  list files

echo -e "\n\n***************** list files, then git ls-files\n\n"

ls -l
git ls-files

echo -e "\n\n***************** SHOW THE BRANCH\n\n"

git branch

# modify some stuff in the original branch to conflict with devel
echo -e "\n\n*************** MODIFYING MAIN BRANCH AND COMMITTING\n\n"

echo different content >> file1

# add and recommit

git add file1
git commit -s -m"a remodification"

git diff main devel

# try to do a merge

echo "\n\n************** TRYING TO DO A MERGE \n\n"

git merge devel

echo "\n\n************* THE MERGE FAILED ****\n\n"
echo "\n\n************* FIX file1 and then add and commit\n"
echo "\n\n************ IN another window, edit the file and type anything here\n\n"
read something

git add file1
git commit -s -m"finally got it right"

git ls-files
git diff
git branch
