---
title: Hexo博客搭建
date: 2018-11-01 19:18:12
tags:
---


### 生成秘钥, 并配置github的公钥
```bash
cd ~/.ssh && ssh-keygen -f id_rsa_digger_github
```
### 指定仓库使用该秘钥
~/.ssh/config
```
Host digger-code.github.io.github.com
    HostName github.com
    User yourname 
    PreferredAuthentications publickey
    IdentityFile  ~/.ssh/id_rsa_digger_github

Host blog_content.github.com
    HostName github.com
    User yourname 
    PreferredAuthentications publickey
    IdentityFile  ~/.ssh/id_rsa_digger_github
```
### 克隆内容仓库,并执行脚本，进入blog目录
```bash
git clone ssh://git@blog_content.github.com/digger-code/blog_content.git
cd blog_content
. ./init.sh
```

### 开始使用hexo工具
```bash
hexo server    #启动server,打开http://localhost:4000查看效果
hexo new   "your title"  #创建文件
vim "created markdown file" #使用自己喜欢的编辑器写作
hexo gen       #生成静态文件
hexo deploy    #推送到github.io
```

### 提交markdown内容仓库
