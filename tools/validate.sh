#!/bin/bash

# set -e

root=`dirname ${BASH_SOURCE[0]}`
benchmarks=${root}/../benchmarks
asm=${root}/../asm
report=${root}/report

if [[ ! -e ${asm} ]]
then
	cd ${root}/..
	make
	cd -
fi

rm -f ${report}
for benchmark in `find ${benchmarks} -maxdepth 1 -name "*.asm"`
do
	echo ${benchmark}
	output=`basename ${benchmark}`
	output=${output%.*}.bin
	${asm} ${benchmark} ${output}
	echo -e "validating ${output}...\n" >> ${report}
	diff ${benchmark%.*}.bin ${output} >> ${report}
done

grep '<' ${report} > /dev/null 2>&1
if [[  $? == 1 ]]
then
	echo -e "[INFO]: You have passed the benchmarks.\n"
else
	echo -e "[INFO]: Your implementation has some bugs.\n"
fi
