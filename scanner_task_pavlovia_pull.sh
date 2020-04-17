#!/bin/bash

task_date=`date "+%Y-%m-%d"`;
todays_date=`date "+%m_%d_%Y"`;


data_path="/${HOME}/scratch/psychopy/virtual_scan_tasks/met_scanner_task_testing"
git pull;
cd ${data_path}/data;

box_path=`echo "/RAs_Telecommute_2020/MET_assessment_virtualization/scanner_task_pavlovia_deployment/raw_pavlovia_behavioral_scanner_data"`

rclone mkdir stanford_box:${box_path}/${todays_date};

for scanner_csv in `ls *met_scanner_task*${task_date}*`;do task_file=`echo ${scanner_csv}`; echo copying: `echo ${scanner_csv}`; rclone copy `ls ${scanner_csv}` stanford_box:${box_path}/${todays_date};done
