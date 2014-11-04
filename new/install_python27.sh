#!/bin/sh -e
 
# Source: http://toomuchdata.com/2012/06/25/how-to-install-python-2-7-3-on-centos-6-2/
cd ~ 
yum install -y zlib-devel ; yum clean all -y
yum install -y bzip2-devel openssl-devel ncurses-devel yum clean all -y
wget http://www.python.org/ftp/python/2.7.3/Python-2.7.3.tar.bz2
tar xf Python-2.7.3.tar.bz2 
cd Python-2.7.3
./configure --prefix=/usr/local
make && make altinstall
wget http://pypi.python.org/packages/source/d/distribute/distribute-0.6.27.tar.gz --no-check-certificate
tar xf distribute-0.6.27.tar.gz 
cd distribute-0.6.27
python2.7 setup.py install
cd ~
rm -rf Python-2.7.3*

