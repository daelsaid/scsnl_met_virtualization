#!/bin/bash


#this script  generates a participant's virtual scanner task links for symbolic and grid, as well as the symbolic REDO links.


Usage () {
    echo ""
    echo "USAGE: create_met_scanner_task_links.sh <PID> <list_type>"
    echo ""
    echo "PID: 4 digit SCSNL subject ID"
    echo ""
    echo "list_type: provide the list number, options are: 1 2 3 4"
    echo ""
    echo "example of formatting: create_met_scanner_task_links.sh 9999 4"
}

if [ $# -lt 2 ] ; then
    Usage
    exit
fi

PID=$1
list_type=$2
run_num=`seq 1 4`

newfile=${HOME}/Desktop/${PID}_list${list_type}_virtual_scanner_task_links
task_link_prefix="https://run.pavlovia.org/scsnl_braindevelopment/met_scanner_task_testing/html/?&"


for task in symbolic grid; do
    echo ""
    for num in $run_num; do
        echo $task", run" ${num}": ${task_link_prefix}participant=${PID}&List=${list_type}&Run=${num}&Scanner=no&Rerun=no&Practice=yes&Version=${task}"
        echo ""
    done
done >> ${newfile}.txt

echo ""
echo "SYM REDO RUNS BELOW"
echo ""

for num in $run_num; do
    echo "Symbolic REDO run" ${num}": ${task_link_prefix}participant=${PID}&List=${list_type}&Run=${num}&Scanner=no&Rerun=no&Practice=yes&Version=symbolic"
    echo ""
done >> ${newfile}.txt
