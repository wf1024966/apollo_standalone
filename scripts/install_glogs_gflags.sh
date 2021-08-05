set -e

install_gflags()
{
    cd /tmp
    wget https://github.com/gflags/gflags/archive/v2.2.0.tar.gz --no-check-certificate
    tar xzf v2.2.0.tar.gz
    mkdir -p gflags-2.2.0/build
    cd gflags-2.2.0/build
    CXXFLAGS="-fPIC" cmake -DBUILD_SHARED_LIBS=true -DGFLAGS_NAMESPACE=google ..
    make -j8
      make install
}

install_glog()
{
    cd /tmp
    wget https://gitee.com/Coxhuang/glog/repository/archive/v0.3.5.zip --no-check-certificate
    tar xzf v0.3.5.tar.gz
    cd glog-0.3.5
    export LDFLAGS='-L/usr/local/lib'
    ./configure --enable-shared --host=arm-linux CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++
    make CXXFLAGS='-Wno-sign-compare -Wno-unused-local-typedefs -fPIC -D_START_GOOGLE_NAMESPACE_="namespace google {" -D_END_GOOGLE_NAMESPACE_="}" -DGOOGLE_NAMESPACE="google" -DHAVE_PTHREAD -DHAVE_SYS_UTSNAME_H -DHAVE_SYS_SYSCALL_H -DHAVE_SYS_TIME_H -DHAVE_STDINT_H -DHAVE_STRING_H -DHAVE_PREAD -DHAVE_FCNTL -DHAVE_SYS_TYPES_H -DHAVE_SYSLOG_H -DHAVE_LIB_GFLAGS -DHAVE_UNISTD_H'
      make install
}


install_gflags
install_glog
