set -e

install_copack()
{
    cd /tmp && rm -rf ColPack
    git clone https://github.com.cnpmjs.org/CSCsw/ColPack.git
    cd ColPack
    cd build/automake
    autoreconf -vif
    mkdir mywork
    cd mywork
    ../configure --prefix=/usr/local --host=arm-linux CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++
    make -j8
      make install
}

install_adolc()
{
    echo "adolc"
    cd /tmp
    wget https://www.coin-or.org/download/source/ADOL-C/ADOL-C-2.6.3.zip -O ADOL-C-2.6.3.zip --no-check-certificate
    unzip ADOL-C-2.6.3.zip
    cd ADOL-C-2.6.3
    ./configure --prefix="/usr/local" --host=arm-linux CC=aarch64-linux-gnu-gcc CXX=aarch64-linux-gnu-g++ --enable-sparse --enable-addexa --enable-static --with-openmp-flag="-fopenmp" --with-colpack="/usr/local" ADD_CXXFLAGS="-fPIC" ADD_CFLAGS="-fPIC" ADD_FFLAGS="-fPIC"
      make -j8 all
      make install
    echo "/usr/local/lib64" > libadolc.conf
      mv libadolc.conf /etc/ld.so.conf.d/
      ldconfig
}

install_copack
install_adolc
