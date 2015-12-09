echo "Validating Installed Packages"
PACKAGE_LIST="autoconf glibc-common libtool automake glibc-devel mercurial cloog-ppl glibc-headers mpfr cmake kernel-headers cpp libarchive freetype-devel libgcc ppl gcc libgomp zlib-devel gcc-c++ libstdc++ glibc- libstdc++"

for pkg in $PACKAGE_LIST; do
    if ! rpm -qa | grep $pkg ; then
        echo ":( :( :( $pkg : Not Installed"
    fi
done
echo "Validating Installed Encoders..."
cat /usr/local/bin/yasm >> /tmp/tmp_ffmpeg_yasm || echo ":( :( :( No yasm Installed"
cat /usr/local/bin/x264 >> /tmp/tmp_ffmpeg_x264 || echo ":( :( :( No x264 Installed"
cat /usr/local/bin/lame >> /tmp/tmp_ffmpeg_lame || echo ":( :( :( No lame Installed"
cat /usr/local/bin/ffmpeg >> /tmp/tmp_ffmpeg_ffmpeg || echo ":( :( :( No ffmpeg Installed"
cat /root/ffmpeg_build/include/opus/opus.h >> /tmp/tmp_ffmpeg_opus || echo ":( :( :( No opus Installed"
cat /root/ffmpeg_build/include/fdk-aac/aacdecoder_lib.h >> /tmp/tmp_ffmpeg_fdk-aac || echo ":( :( :( No fdk-aac Installed"
cat /root/ffmpeg_build/include/ogg/ogg.h >> /tmp/tmp_ffmpeg_libogg || echo ":( :( :( No libogg Installed"
cat /root/ffmpeg_build/include/vorbis/vorbisenc.h >> /tmp/tmp_ffmpeg_libvorbis || echo ":( :( :( No libvorbis Installed"
cat /root/ffmpeg_build/include/vpx/vpx_encoder.h >> /tmp/tmp_ffmpeg_libvpx || echo ":( :( :( No libvpx Installed"
echo ":) :) :)"
