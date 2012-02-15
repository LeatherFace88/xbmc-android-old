#!/bin/bash

SCRIPT_PATH=$(cd `dirname $0` && pwd)

#Edit these
NDKROOT=/home/speedy/Documents-big/xbmc/android-ndk-r6b
TARBALLS=/home/speedy/Documents-big/xbmc/android-tarballs
TOOLCHAIN=/home/speedy/Documents-big/xbmc/xbmc-android-toolchain
XBMCPREFIX=/home/speedy/Documents-big/xbmc/xbmc-master

#
#
sudo mkdir -p $XBMCPREFIX $TARBALLS
sudo chmod 775 $XBMCPREFIX $TARBALLS
sudo chown -R speedy:speedy $XBMCPREFIX $TARBALLS
mkdir -p $XBMCPREFIX/lib $XBMCPREFIX/include

#
#
echo "NDKROOT=$NDKROOT"                                              >  $SCRIPT_PATH/Makefile.include
echo "XBMCPREFIX=$XBMCPREFIX"                                          >> $SCRIPT_PATH/Makefile.include
echo "TOOLCHAIN=$TOOLCHAIN"                                            >> $SCRIPT_PATH/Makefile.include
echo "BASE_URL=http://mirrors.xbmc.org/build-deps/darwin-libs"         >> $SCRIPT_PATH/Makefile.include
echo "TARBALLS_LOCATION=$TARBALLS"                                     >> $SCRIPT_PATH/Makefile.include
echo "RETRIEVE_TOOL=/usr/bin/curl"                                     >> $SCRIPT_PATH/Makefile.include
echo "RETRIEVE_TOOL_FLAGS=-Ls --create-dirs --output \$(TARBALLS_LOCATION)/\$(ARCHIVE)" >> $SCRIPT_PATH/Makefile.include
echo "ARCHIVE_TOOL=/bin/tar"                                           >> $SCRIPT_PATH/Makefile.include
echo "ARCHIVE_TOOL_FLAGS=xf"                                           >> $SCRIPT_PATH/Makefile.include
echo "JOBS=$((`grep -c processor /proc/cpuinfo` -1))"                  >> $SCRIPT_PATH/Makefile.include
