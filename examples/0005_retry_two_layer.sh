#!/bin/bash
typeset -i time=$1
export LOGFILE=tengine_job_test.log
echo "`date` tengine_job_test $MM_ACTUAL_JOB_NAME_PATH start" >> $LOGFILE
case "$MM_ACTUAL_JOB_NAME_PATH" in
  "/jn0005/j1" ) 
    sleep "$J1_SLEEP" 
    if [ $J1_FAIL = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/j2" ) 
    sleep "$J2_SLEEP"
    if [ "$J2_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/jn4/j41" ) 
    sleep "$J41_SLEEP"
    if [ "$J41_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/jn4/j42" ) 
    sleep "$J42_SLEEP" 
    if [ "$J42_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/jn4/j43" ) 
    sleep "$J43_SLEEP" 
    if [ "$J43_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/jn4/j44" ) 
    sleep "$J44_SLEEP" 
    if [ "$J44_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/jn4/finally/jn4_f" ) 
    sleep "$JN4_F_SLEEP" 
    if [ "$JN4_F_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/j4" ) 
    sleep "$J4_SLEEP" 
    if [ "$J4_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/finally/jn0005_fjn/jn0005_f1" ) 
    sleep "$JN0005_F1_SLEEP" 
    if [ "$JN0005_F1_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/finally/jn0005_fjn/jn0005_f2" ) 
    sleep "$JN0005_F2_SLEEP" 
    if [ "$JN0005_F2_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/finally/jn0005_fjn/finally/jn0005_fif" ) 
    sleep "$JN0005_FIF_SLEEP"
    if [ "$JN0005_FIF_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
  "/jn0005/finally/jn0005_f" ) 
    sleep "$JN0005_F_SLEEP" 
    if [ "$JN0005_F_FAIL" = "true" ] ; then
      exit 1
    fi
    ;;
esac

echo "`date` tengine_job_test $MM_ACTUAL_JOB_NAME_PATH finish" >> $LOGFILE