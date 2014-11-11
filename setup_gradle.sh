#! /bin/bash

FG=$1
PLUGIN=$2
MC_VERSION=$3
PLUGIN_VERSION=`python get_json_value.py ${PLUGIN} $4`
VERSION=${MC_VERSION}-${PLUGIN_VERSION}-${MC_VERSION}
MAPPINGS=$5

# files
TO_REPLACE=build.gradle_pre
GRADLE_BUILD=build.gradle

# delete old buiold.gradle, and copy in new one.
rm -rf ${GRADLE_BUILD}
cp ${TO_REPLACE} ${GRADLE_BUILD}

sed -i 's/@FG@/'${FG}'/g' ${GRADLE_BUILD}
sed -i 's/@PLUGIN@/'${PLUGIN}'/g' ${GRADLE_BUILD}
sed -i 's/@VERSION@/'${VERSION}'/g' ${GRADLE_BUILD}
sed -i 's/@MAPPINGS@/'${MAPPINGS}'/g' ${GRADLE_BUILD}

#gradle recompMinecraft
