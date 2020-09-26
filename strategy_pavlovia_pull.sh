#!/bin/bash

sa_date=`date "+%Y-%m-%d"`;
todays_date=`date "+%m_%d_%Y"`;
git pull;
cd `pwd`/data;

#/Users/daelsaid/scratch/psychopy/strategy_assess_pavlovia/strategy_assessment_pilot/data;

rclone mkdir sbox:/RAs_Telecommute_2020/MET_assessment_virtualization/SA_Pavlovia/raw_task_data/${todays_date};

for sa_csv in `ls *strategy*${sa_date}*`;do sa_file=`echo ${sa_csv}`; echo copying: `echo ${sa_file}`; rclone copy `ls ${sa_file}` sbox:/RAs_Telecommute_2020/MET_assessment_virtualization/SA_Pavlovia/raw_task_data/${todays_date};done
