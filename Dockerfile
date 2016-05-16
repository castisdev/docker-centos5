# Pull base image
FROM centos:centos5

# Install EPEL repo
RUN rpm -ivh http://dl.fedoraproject.org/pub/epel/5/x86_64/epel-release-5-4.noarch.rpm

# Install
RUN yum install -y \
  sudo \
  wget \
  gcc \
  gcc-c++ \
  make \
  unzip \
  openssl \
  openssl-devel \
  git \
  cppcheck \
  subversion \
  tar \
  boost-devel \
  glibc-devel \
  e2fsprogs-devel \
  gdb \
  valgrind \
  mysql-devel \
  postgresql93-devel; \
  yum -y clean all

ADD install_xercesc280.sh /script/
RUN /script/install_xercesc280.sh

ADD install_cmake351.sh /script/
RUN /script/install_cmake351.sh

ADD install_devtoolset2.sh /script/
RUN /script/install_devtoolset2.sh
ENV PATH /opt/rh/devtoolset-2/root/usr/bin/:$PATH

ADD install_boost158.sh /script/
RUN /script/install_boost158.sh
ENV BOOST_ROOT /usr/local/boost158

ADD install_cryptopp563.sh /script/
RUN /script/install_cryptopp563.sh

ADD ./install_googletest170.sh /script/
RUN /script/install_googletest170.sh

ADD install_python2711.sh /script/
RUN /script/install_python2711.sh

ADD install_python351.sh /script/
RUN /script/install_python351.sh

ADD install_cpptools.sh /script/
RUN /script/install_cpptools.sh

# Add root files
ADD .bashrc /root/.bashrc
ADD legacy_mode.sh /root/

# Set environment variables
ENV HOME /root

# Define default command
CMD ["bash"]
