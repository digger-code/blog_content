#!/bin/bash
#
#blog helper
#os
os=`uname -s`
if [ ".$os"=".Linux" ];
then
  #centos
  which yum && ! which nodejs && \
  sudo yum install -y epel-release && \
  sudo yum install -y nodejs
fi

#Install soft 
! npm list -g --depth=0 | grep hexo &&\
    npm i -g hexo 
#mkdir 
blog_dir="../blog"
source_dir=`pwd`
[ ! -d $blog_dir ] && mkdir $blog_dir && cd $blog_dir && hexo init && cd $source_dir 

#make hexo use current source dir
cp "$source_dir/etc/_config.yml"  "$blog_dir/_config.yml" && \
rm -rf $blog_dir/source && ln -s $source_dir/source $blog_dir/source && \
cd "../blog" && npm install hexo-deployer-git --save 
