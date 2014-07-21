#!/bin/bash

set -ex

yum install -y \
    gcc-c++ patch readline readline-devel \
    zlib zlib-devellibyaml-devel libffi-devel openssl-devel \
    make bzip2 autoconf automake libtool bison iconv-devel git-core \
    mercurial

# Timezone を UTC から JST(UTC+9)へ変更
ln -sf /usr/share/zoneinfo/Asia/Tokyo /etc/localtime
cat <<TIMEZONE >>/etc/sysconfig/clock
ZONE="Asia/Tokyo"
TIMEZONE

# MySQL

if [[ ! -f /etc/yum.repos.d/mysql-community.repo ]]; then
    rpm -ivh http://dev.mysql.com/get/mysql-community-release-el6-4.noarch.rpm
fi
rpm -q mysql-community-server >/dev/null || yum install -y \
    mysql-community-server.x86_64 mysql-community-client.x86_64 \
    mysql-community-devel.x86_64
[[ ! -d /etc/my.cnf.d ]] && mkdir -p /etc/my.cnf.d
if [[ ! -f /etc/my.cnf.d/kakehashi.cnf ]]; then
    cat <<'MYCNF' >/etc/my.cnf.d/kakehashi.cnf
[mysqld]
character-set-server    = utf8
default-time-zone       = +00:00
MYCNF
fi
pgrep mysqld >/dev/null || service mysqld start
chkconfig mysqld on

# SELINUX
if [[ -f /etc/selinux/config ]]; then
    cat <<'SELINUX' >/etc/selinux/config
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#       enforcing - SELinux security policy is enforced.
#       permissive - SELinux prints warnings instead of enforcing.
#       disabled - SELinux is fully disabled.
SELINUX=disabled
# SELINUXTYPE= type of policy in use. Possible values are:
#       targeted - Only targeted network daemons are protected.
#       strict - Full SELinux protection.
SELINUXTYPE=targeted
SELINUX
fi

# Japanese
yum -y groupinstall "Japanese Support"
yum -y install glibc-common

# DNS
if [[ -f /etc/resolv.conf ]]; then
  echo "options single-request-reopen" >> /etc/resolv.conf
fi

# ImageMagick
yum -y install ImageMagick ImageMagick-devel

# nokogiri
# http://nokogiri.org/tutorials/installing_nokogiri.html
yum -y install libxml2 libxml2-devel libxslt libxslt-devel

# Etc
yum -y install vim mosh tmux screen wget telnet zsh

# Redis
yum -y install redis
chkconfig redis on
service redis start

# sphinx
yum -y install python-devel python-pip
pip install sphinx
pip install awscli
pip install ansible
