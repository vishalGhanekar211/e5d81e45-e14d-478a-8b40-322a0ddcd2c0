#!/bin/sh
echo 'EXECUTION_TYPE='$EXECUTION_TYPE
echo 'EXECUTION_DIR='$EXECUTION_DIR
echo 'JAR_NAME='$JAR_NAME
if [ ${EXECUTION_TYPE} = 'workflow' ]
then
cd ./workflows/${EXECUTION_DIR}/
mvn -o clean package -DskipTests
java -jar target/${JAR_NAME}
elif [ ${EXECUTION_TYPE} = 'preposthook' ]
then
sh /preposthooks/${EXECUTION_DIR}/entrypoint.sh
fi