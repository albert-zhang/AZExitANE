#!/bin/sh
ADTPath="/Applications/Adobe Flash Builder 4.7/sdks/4.6/bin"

rm -Rf tmp
rm -Rf tmp-ios
rm -Rf tmp-default

mkdir tmp
mkdir tmp-ios
mkdir tmp-android
mkdir tmp-default

unzip -o -d tmp ../Flash/bin/AZExitANE.swc
cp -f tmp/library.swf tmp-ios
cp -f tmp/library.swf tmp-android
cp -f tmp/library.swf tmp-default
cp -f ../iOS/bin/libAZExitANE-universal.a tmp-ios

"${ADTPath}/adt" -package -target ane AZExitANE.ane extension.xml \
	-swc ../Flash/bin/AZExitANE.swc \
	-platform Android-ARM -C tmp-android . \
	-platform iPhone-ARM -C tmp-ios . \
	-platform default -C tmp-default .

rm -Rf tmp
rm -Rf tmp-ios
rm -Rf tmp-android
rm -Rf tmp-default
