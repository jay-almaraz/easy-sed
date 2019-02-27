#!/bin/bash
usage_message() { echo "Usage: $0 FIND REPLACE [FILE]" 1>&2; exit 1; }

if [ "${#}" -lt 2 ]; then
    usage_message
fi

if [ "${#}" -gt 3 ]; then
    usage_message
fi

FIND=$1
REPLACE=$2
FILE=$3

# echo "find:     ${FIND}"
# echo "replace:  ${REPLACE}"
# echo "file:     ${FILE}"

# FIND=$(sed 's|*|\\*|g' <<< ${FIND})
# FIND=$(sed 's|_|\\_|g' <<< ${FIND})
FIND=$(sed 's|*|\\*|g' <<< ${FIND})
FIND=$(sed 's|_|\\_|g' <<< ${FIND})
FIND=$(sed 's|&|\\&|g' <<< ${FIND})
FIND=$(sed 's|'\''|'\'"\\\'"\''|g' <<< ${FIND})

REPLACE=$(sed 's|*|\\*|g' <<< ${REPLACE})
REPLACE=$(sed 's|_|\\_|g' <<< ${REPLACE})
REPLACE=$(sed 's|&|\\&|g' <<< ${REPLACE})
REPLACE=$(sed 's|'\''|'\'"\\\'"\''|g' <<< ${REPLACE})

# echo "${FIND}"
# echo "${REPLACE}"
# exit 0

if [ "${#}" == 3 ]; then
    COMMAND="sed -i 's_${FIND}_${REPLACE}_g' ${FILE}"
else
    COMMAND="sed 's_${FIND}_${REPLACE}_g'"
fi
eval ${COMMAND}