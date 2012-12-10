#!/bin/sh
# http://www.automatedbusinesslogic.com/articles/deploying-a-maven-archetype

echo "Started"

CURRENTDIR=`pwd`

# move to the archetype
cd ./archetype-gwtp-basic-appengine

# clean house
mvn clean
mvn idea:clean
mvn eclipse:clean
rm -R .settings
rm -R bin

echo "mvn archetype:create-from-project"
mvn archetype:create-from-project

cd target/generated-sources/archetype/
mvn install

cd $CURRENTDIR

# TODO upload to sonatype
#mvn archetype:crawl -Dcatalog=$CURRENTDIR/archetype-catalog.xml

echo "Finished"

echo "\n***Run this in a new project directory:***\nmvn archetype:generate -DarchetypeCatalog=local\n"
