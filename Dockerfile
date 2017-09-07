# Pull base image
FROM centos:centos5

RUN sed -i 's/#baseurl=http:\/\/mirror.centos.org\/centos\/\$releasever/baseurl=http:\/\/vault.centos.org\/5.11/g' /etc/yum.repos.d/*
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/*

# Install EPEL repo
RUN yum install -y epel-release; yum -y clean all

# Install
RUN yum makecache
RUN yum install -y sudo
RUN yum install -y wget
RUN yum install -y gcc
RUN yum install -y gcc-c++
RUN yum install -y make
RUN yum install -y unzip
RUN yum install -y openssl-devel
RUN yum install -y git
RUN yum install -y subversion
RUN yum install -y tar
RUN yum install -y boost-devel
RUN yum install -y glibc-devel
RUN yum install -y e2fsprogs-devel
RUN yum install -y gdb
RUN yum install -y valgrind
RUN yum install -y mysql-devel
RUN yum install -y postgresql93-devel
RUN yum install -y curl-devel
RUN yum install -y xz
RUN yum install -y file
RUN yum install -y vim-enhanced
RUN yum install -y unixODBC-devel
RUN yum install -y mysql-connector-odbc
RUN yum install -y sysstat

RUN yum install -y bzip2-devel
RUN yum install -y which
RUN yum install -y ncurses-devel
RUN yum install -y zlib-devel
RUN yum install -y sqlite-devel
RUN yum install -y readline-devel
RUN yum install -y tk-devel
RUN yum install -y gdbm-devel
RUN yum install -y db4-devel
RUN yum install -y libpcap-devel
RUN yum install -y xz-devel

RUN yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake372.sh /script/
RUN /script/install_cmake372.sh

ADD install_devtoolset2.sh /script/
RUN /script/install_devtoolset2.sh
ENV PATH /opt/rh/devtoolset-2/root/usr/bin/:$PATH

ADD install_boost158.sh /script/
RUN /script/install_boost158.sh
ENV BOOST_ROOT /usr/local/boost158

ADD install_cryptopp565.sh /script/
RUN /script/install_cryptopp565.sh

ADD ./install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python2713.sh /script/
RUN /script/install_python2713.sh

ADD install_python351.sh /script/
RUN /script/install_python351.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

ADD install_cppcheck177.sh /script/
RUN /script/install_cppcheck177.sh

ADD install_zsh531.sh /script/
RUN /script/install_zsh531.sh

ADD install_ninja172.sh /script/
RUN /script/install_ninja172.sh

# Add root files
ADD .bashrc /root/.bashrc
ADD legacy_mode.sh /root/

# Set environment variables
ENV HOME /root

# Define default command
CMD ["zsh"]
