#!/bin/sh -e

wget https://bootstrap.pypa.io/get-pip.py --no-check-certificate
python2.7 get-pip.py
pip install gcovr
rm -rf get-pip.py 

wget http://google-styleguide.googlecode.com/svn/trunk/cpplint/cpplint.py
sed -e s/'\/usr\/bin\/python'/'\/usr\/local\/bin\/python2.7'/g cpplint.py > tmp_cpplint
mv tmp_cpplint cpplint.py
install cpplint.py /usr/local/bin/cpplint
rm -rf cpplint.py

