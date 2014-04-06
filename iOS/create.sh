#!/bin/sh

armBuildPath="${BUILD_DIR}/${CONFIGURATION}-iphoneos/lib${PRODUCT_NAME}.a"
i386BuildPath="${BUILD_DIR}/${CONFIGURATION}-iphonesimulator/lib${PRODUCT_NAME}.a"
universalPath="${BUILD_DIR}/${CONFIGURATION}-universal"

if [ ! -f $armBuildPath ]; then
echo " ERROR: arm build (${armBuildPath}) not exist, exit now."
rm -Rf $universalPath
exit
else
echo " * arm build (${armBuildPath}) exist."
fi

if [ ! -f $i386BuildPath ]; then
echo " ERROR: build (${i386BuildPath}) not exist, exit now."
rm -Rf $universalPath
exit
else
echo " * i386 build (${i386BuildPath}) exist."
fi

if [ ! -d $universalPath ]; then
echo " * creating build universal path ${universalPath}"
mkdir -p $universalPath
else
echo " * universal build path exist: ${universalPath}"
fi

echo " * copying builds"
copiedArmBuildPath="${universalPath}/arm.a"
copiedi386BuildPath="${universalPath}/i386.a"
cp -f $armBuildPath $copiedArmBuildPath
cp -f $i386BuildPath $copiedi386BuildPath

echo " * creating universal build"
universlBuildPath="${universalPath}/lib${PRODUCT_NAME}-universal.a"
lipo -create $copiedArmBuildPath $copiedi386BuildPath -output $universlBuildPath

universlBuildFinalPath="${PROJECT_DIR}/bin"
if [ ! -d $universlBuildFinalPath ]; then
echo " * creating build universal final path ${universlBuildFinalPath}"
mkdir -p $universlBuildFinalPath
else
echo " * universal build final path exist: ${universlBuildFinalPath}"
fi

echo " * copying universal build to project folder"
cp -f $universlBuildPath ${PROJECT_DIR}/bin/

#universalIncludePath="${universalPath}/include"
#if [ -d $universalIncludePath ]; then
#rm -Rf $universalIncludePath
#echo " * deleted universal header include path"
#fi
#
#echo " * coping files"
#cp -R "${PROJECT_DIR}/az-garage" "${universalIncludePath}"
#
#echo " * deleting non-header files"
#find "${universalIncludePath}" -type f \! -name "*.h" -and \! -name "*.hpp" -print -exec rm {} \;

echo " * done"
