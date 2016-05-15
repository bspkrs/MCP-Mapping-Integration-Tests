#! /bin/bash
# usage: ./setup_gradle.sh 2.0 1.8 forge promos/1.8-latest stable_17 1

FG=$1
MC_VERSION=$2
PLUGIN=$3
PLUGIN_VERSION=`python get_json_value.py ${PLUGIN} $4`
MAPPINGS=$5
IS_MASTER=$6
if [ "${IS_MASTER}" != "1" ]
then
    VERSION=${MC_VERSION}-${PLUGIN_VERSION}-${MC_VERSION}
else
    VERSION=${MC_VERSION}-${PLUGIN_VERSION}
fi

# files
TO_REPLACE=build.gradle_pre
GRADLE_BUILD=build.gradle

# delete old build.gradle, and copy in new one.
rm -rf ${GRADLE_BUILD}
cp ${TO_REPLACE} ${GRADLE_BUILD}

sed -i 's/@FG@/'${FG}'/g' ${GRADLE_BUILD}
sed -i 's/@PLUGIN@/'${PLUGIN}'/g' ${GRADLE_BUILD}
sed -i 's/@VERSION@/'${VERSION}'/g' ${GRADLE_BUILD}
sed -i 's/@MAPPINGS@/'${MAPPINGS}'/g' ${GRADLE_BUILD}

#gradlew recompileMC
