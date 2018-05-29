#!/bin/bash -e

echo "========================= Clean apt-get ========================"
apt-get clean
mv /var/lib/apt/lists/* /tmp
mkdir -p /var/lib/apt/lists/partial
apt-get clean
apt-get update
echo "======================== Cleaned apt-get ======================"

echo "======================= Installing gcc 8.0.1 ======================"
add-apt-repository -y ppa:ubuntu-toolchain-r/test
apt-get update
apt-get install -y \
  gcc-8=8* \
  g++-8=8*
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 80 --slave /usr/bin/g++ g++ /usr/bin/g++-8
update-alternatives --install /usr/bin/gcov gcov /usr/bin/gcov-8 80
gcc --version
echo "================== Successfully Installed gcc 8.0.1 ==============="

sudo apt-get update && apt-get install -yy \
  autoconf=2.69* \
  automake=1:1.15* \
  ccache=3.2.4* \
  graphviz=2.38* \
  kmod=22-1ubuntu5 \
  mscgen=0.20-5 \
  libcunit1-dev=2.1* \
  libpcap-dev=1.7.4* \
  libssl-dev=1.0*\
  libtool=2.4* \
  linux-headers-`uname -r` \
  ruby-dev=1:2.3*


CLANG_VERSION=6.0.0
echo "==================== Installing clang $CLANG_VERSION ==================="
wget -nv http://releases.llvm.org/"$CLANG_VERSION"/clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu.tar.xz
tar xf clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu.tar.xz
cd clang+llvm-"$CLANG_VERSION"-aarch64-linux-gnu
cp -R * /usr/local/
cd ../
clang --version
echo "=============== Successfully Installed clang $CLANG_VERSION ============"
