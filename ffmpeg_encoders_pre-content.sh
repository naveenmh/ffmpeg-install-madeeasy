cd ~/ffmpeg_sources

if [ -d yasm ]
then
    echo "Directory /yasm exists. Started Installing...."
else
    echo "Directory /yasm does not exist. cloning and started Installing...."
    git clone --depth 1 git://github.com/yasm/yasm.git
fi
echo "Installing YASM"
cd yasm
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin"
make
make install
make distclean



cd ~/ffmpeg_sources
if [ -d x264 ]
then
    echo "Directory /x264 exists. Started Installing...."
else
    echo "Directory /x264 does not exist. cloning and started Installing...."
    git clone --depth 1 git://git.videolan.org/x264
fi
echo "Installing libx264"
cd x264
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --enable-static
make
make install
make distclean


hg clone https://bitbucket.org/multicoreware/x265
cd ~/ffmpeg_sources/x265/build/linux
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="$HOME/ffmpeg_build" -DENABLE_SHARED:bool=off ../../source
make
make install




cd ~/ffmpeg_sources
if [ -d fdk-aac ]
then
    echo "Directory /fdk-aac exists. Started Installing...."
else
    echo "Directory /fdk-aac does not exist. cloning and started Installing...."
    git clone --depth 1 git://git.code.sf.net/p/opencore-amr/fdk-aac
fi
echo "Installing FDK-AAC"
cd fdk-aac
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean



cd ~/ffmpeg_sources
if [ -d lame-3.99.5 ]
then
    echo "Directory /lame-3.99.5 exists. Started Installing...."
else
    echo "Directory /fdk-aac does not exist. cloning and started Installing...."
    curl -L -O http://downloads.sourceforge.net/project/lame/lame/3.99/lame-3.99.5.tar.gz
fi
echo "Installing libmp3lame"
tar xzvf lame-3.99.5.tar.gz
cd lame-3.99.5
./configure --prefix="$HOME/ffmpeg_build" --bindir="$HOME/bin" --disable-shared --enable-nasm
make
make install
make distclean

cd ~/ffmpeg_sources
if [ -d opus ]
then
    echo "Directory /opus exists. Started Installing...."
else
    echo "Directory /opus does not exist. cloning and started Installing...."
    git clone git://git.opus-codec.org/opus.git
fi
echo "Installing libopus"
cd opus
autoreconf -fiv
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean



cd ~/ffmpeg_sources
if [ -d libogg-1.3.2 ]
then
    echo "Directory /libogg-1.3.2 exists. Started Installing...."
else
    echo "Directory /libogg-1.3.2 does not exist. cloning and started Installing...."
    curl -O http://downloads.xiph.org/releases/ogg/libogg-1.3.2.tar.gz
fi
echo "Installing libogg"
tar xzvf libogg-1.3.2.tar.gz
cd libogg-1.3.2
./configure --prefix="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean

cd ~/ffmpeg_sources
if [ -d  bvorbis-1.3.4 ]
then
    echo "Directory /libvorbis-1.3.4 exists. Started Installing...."
else
    echo "Directory /libvorbis-1.3.4 does not exist. cloning and started Installing...."
    curl -O http://downloads.xiph.org/releases/vorbis/libvorbis-1.3.4.tar.gz
fi
echo "Installing libvorbis"
tar xzvf libvorbis-1.3.4.tar.gz
cd libvorbis-1.3.4
LDFLAGS="-L$HOME/ffmeg_build/lib" CPPFLAGS="-I$HOME/ffmpeg_build/include" ./configure --prefix="$HOME/ffmpeg_build" --with-ogg="$HOME/ffmpeg_build" --disable-shared
make
make install
make distclean



cd ~/ffmpeg_sources
if [ -d libvpx ]
then
    echo "Directory /libvpx exists. Started Installing...."
else
    echo "Directory /libvpx does not exist. cloning and started Installing...."
    git clone --depth 1 https://chromium.googlesource.com/webm/libvpx.git
fi
echo "Installing libvpx"
cd libvpx
./configure --prefix="$HOME/ffmpeg_build" --disable-examples
make
make install
make clean

cd ~/ffmpeg_sources
if [ -d ffmpeg ]
then
    echo "Directory /ffmpeg exists. Started Installing...."
else
    echo "Directory /ffmpeg does not exist. cloning and started Installing...."
    git clone --depth 1 git://source.ffmpeg.org/ffmpeg
fi
echo "Installing ffmpeg"
cd ffmpeg
PKG_CONFIG_PATH="$HOME/ffmpeg_build/lib/pkgconfig" ./configure --prefix="$HOME/ffmpeg_build" --extra-cflags="-I$HOME/ffmpeg_build/include" --extra-ldflags="-L$HOME/ffmpeg_build/lib" --bindir="$HOME/bin" --pkg-config-flags="--static" --enable-gpl --enable-libfdk_aac --enable-libmp3lame --enable-libopus --enable-libvorbis --enable-libvpx --enable-libx264
make
make install
make distclean
hash -r
echo "Script ffmpeg-encoderh_pre-content.sh installs 'ffmpeg' successfully..."

cp -rf /usr/local/bin/ffmpeg /usr/bin
cp -rf /usr/local/bin/ffmpeg /usr/sbin
                                                                                                                      182,0-1       Bot
