#!/bin/sh -e

wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python2.7 get-pip.py
pip install gcovr
pip install cpplint
rm -rf get-pip.py 

