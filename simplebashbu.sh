#!/bin/bash
#
# COPYRIGHT:
# (c) 2001 Chris Arrowood (GNU LGPL V2.1)
# You may view the full copyright text at:
# http://www.opensource.org/licenses/lgpl-license.html
#
# DESCRIPTION:
# A simple BASH script to do nightly backups to tarballs
# on a hard drive (not to tape)  Ideal for home linux users
# to easily backup thier system, provided they have an extra 
# hard drive.
#







###############################################
#              User Variables                 #
###############################################
#
# Modify these variables to suit your needs
#
# Which day of the week do we want to do full backups? 0=Sunday
  LEVEL0DAY=0
# Where to create the backups; It should already exist
  BACKUP_DIR=/Entropy/bkup
# Filesystems to backup seperated by spaces and the entire string in double quotes; each must start with /
  FILESYSTEMS="/etc /home/dave"
# Should we email results? Also should we email critical errors?  0=false, 1=true 
  EMAIL=0
# EMAIL address to send results to
  EMAILADDRESS=foo@bar.com
# Email Subject
  EMAILSUBJECT="$HOSTNAME Backup"
# Only keep last weeks level0 backup (0) or keep all lvl 0 backups (1).  Keeping all data may take a lot of space!
  KEEPALL=0
# Do we wnat to compress the backup file using gzip? 0=false, 1=true
  COMPRESS=1
# Should we compress the log file when we are done?  0=false, 1=true
  COMPRESSLOG=0
# If we are compressing, what level do we use?
  COMPRESSLEVEL=6
# Determines whether we see all output to screen. It will still go to log regardless of this value.   0=false, 1=true 
  QUIET=1
# Would you like to get detailed information from tar and gzip? 0=false, 1=true   
  VERBOSE=1


# DO NOT EDIT BELOW THIS LINE
#--------------------------------------------------------



###############################################
#     Application Variables -  DO NOT EDIT    #
###############################################
# Day of the week;
  DAYOFWEEK=`date +"%w"`
# Folder for all daily backups
  DAILYBACKUPDIR=$BACKUP_DIR/DAILY
# Name of directory to create for current backup  
  TODAYSBACKUPDIR=$DAILYBACKUPDIR/$DAYOFWEEK
# directory to store last weeks data
  ARCHIVEDDATADIR=$BACKUP_DIR/ARCHIVED_BACKUPS
# Location of a file to hold the date stamp of last level 0 backup
  L0DATESTAMP=$BACKUP_DIR/.level0_datestamp
# Do I really need to explain this one ;-)
  NOW=`date`
# Log dir
  LOGDIR=$BACKUP_DIR/LOGS
# Svript name
  SCRIPTNAME="Simple Bash Backup Script"
# Version
  VERSION=0.01
# Copyright
  COPYRIGHT="(c) 2001 Chris Arrowood (GNU GPL V.2)"
# If user choose verbose, set the verbose command. Otherwise leave empty
if [ $VERBOSE -eq 1 ]
  then 
  VERBOSECOMMAND="--verbose"
fi
# Logfile
  LOGFILE=$LOGDIR/`date +"%m%d%Y_%s"`.log


######## Do some error checking #########
# Does backup dir exist?
if [ ! -d $BACKUP_DIR ]
  then
    #Send Email and Exit
    if [ $EMAIL -eq 1 ]
      then
      echo "The specified backup directory $BACKUP_DIR does not exist. Operation canceled." | mail -s "$EMAILSUBJECT" $EMAILADDRESS
    fi
    echo "The specified backup directory $BACKUP_DIR does not exist. Operation canceled."
    exit 1
fi
# Does the daily backup dir exist? If not, create it.
if [ ! -d $DAILYBACKUPDIR ]
  then
    mkdir $DAILYBACKUPDIR
fi
 
# Does the daily backup dir exist? If not, create it.
if [ ! -d $LOGDIR ]
  then
    mkdir $LOGDIR
fi



####### Redirect Output to a logfile and screen - Couldnt get tee to work
exec 3>&1                         # create pipe (copy of stdout)
exec 1>$LOGFILE                   # direct stdout to file
exec 2>&1                         # uncomment if you want stderr too
if [ $QUIET -eq 0 ] 
  then tail -f $LOGFILE >&3 &     # run tail in bg
fi



######## DO SOME PRINTING ###############
echo " "
echo "#######################################################################"
echo "$SCRIPTNAME "
echo "Version $VERSION" 
echo "$COPYRIGHT"
echo " "
echo "Host: $HOSTNAME "
echo "Start Time: $NOW"
echo "#######################################################################"
echo " "
echo " "
echo " "





######## Run Backup #########
#if day is LEVEL0DAY do full backup
if test $DAYOFWEEK -eq $LEVEL0DAY
  then
    LEVEL=0
    #we need to archive the last full backup to the weekold dir
    #make sure the week-old dir exists
    if test -d $ARCHIVEDDATADIR
      then 
        #remove old data unless KEEPALL is set to 1
        if test $KEEPALL -eq 0
          then rm -Rf $ARCHIVEDDATADIR/*
        fi
      else
        #the week-old data dir didnt exist; create it
	mkdir $ARCHIVEDDATADIR
        chmod 700 $ARCHIVEDDATADIR
    fi
    #move the last full backup to the weekold dir
    mv -f $TODAYSBACKUPDIR/* $ARCHIVEDDATADIR > /dev/null 2>&1
    #remove all daily backups since they are simply incrementals on the bu we just archived
    rm -Rf $DAILYBACKUPDIR/*
    #make todays dir since we just blew it away
    mkdir $TODAYSBACKUPDIR
    #do FULL backup for each filesystem specified 
    for BACKUPFILES in $FILESYSTEMS
    do
      #Create the filename; replace / with .
      WITHOUTSLASHES=`echo $BACKUPFILES | tr "/" "."`
      WITHOUTLEADINGDOT=`echo $WITHOUTSLASHES | cut -b2-`
      OUTFILENAME=$WITHOUTLEADINGDOT.`date +"%m%d%Y_%s"`.tar
      OUTFILE=$TODAYSBACKUPDIR/$OUTFILENAME
      STARTTIME=`date`
      echo " "
      echo " "
      echo "#######################################################################"
      echo "$STARTTIME: Creating a level $LEVEL backup of $BACKUPFILES to $OUTFILE" 
      echo "#######################################################################"
      tar --create $VERBOSECOMMAND \
        --file $OUTFILE \
        --label "Level-$LEVEL Backup ${NOW}" \
        $BACKUPFILES 
      if test $COMPRESS -eq 1
        then
        #gzip it
        gzip -$COMPRESSLEVEL $VERBOSECOMMAND $OUTFILE
        rm -f $OUTFILE
      fi
    done
    # Does the timestamp file exist? If not, create it.
    if [ ! -w $L0DATESTAMP ]
      then
       touch $L0DATESTAMP
    fi    
    #record full backup timestamp
    echo $NOW > $L0DATESTAMP
  else
    #we should do an incremental backup
    LEVEL=1
    # Does todays backup dir exist? If not, create it.
    if [ ! -d $TODAYSBACKUPDIR ]
      then
        mkdir $TODAYSBACKUPDIR
    fi    
    # Does the timestamp file exist? If not, create it.
    if [ ! -w $L0DATESTAMP ]
      then
       touch $L0DATESTAMP
       echo "1969-12-31" > $L0DATESTAMP
    fi
    #get date of last full backup
    LAST=`cat $L0DATESTAMP`
    #Do a level 1 Backup for each filesystem specified
    for BACKUPFILES in $FILESYSTEMS
    do
      #Create the filename; replace / with .
      WITHOUTSLASHES=`echo $BACKUPFILES | tr "/" "."`
      WITHOUTLEADINGDOT=`echo $WITHOUTSLASHES | cut -b2-`
      OUTFILENAME=$WITHOUTLEADINGDOT.`date +"%m%d%Y_%s"`.tar
      OUTFILE=$TODAYSBACKUPDIR/$OUTFILENAME
      STARTTIME=`date`
      echo " "
      echo " "
      echo "#######################################################################"
      echo "$STARTTIME: Creating a level $LEVEL backup of $BACKUPFILES to $OUTFILE" 
      echo "#######################################################################"
      tar --create $VERBOSECOMMAND \
        --file $OUTFILE \
        --after-date "$LAST" \
        --label "Level-$LEVEL Backup from $LAST to $NOW" \
        $BACKUPFILES 
      if test $COMPRESS -eq 1
        then
        #gzip it
        gzip -$COMPRESSLEVEL $VERBOSECOMMAND $OUTFILE
        rm -f $OUTFILE
      fi
    done
fi



SCRIPTFINISHTIME=`date`
echo " "
echo " "
echo " "
echo " "
echo "#######################################################################"
echo "Finish Time: $SCRIPTFINISHTIME"
echo " "
echo "  NOTE: Always examine the output of this script carefully for errors."
echo "        Also, be sure to verify your backups and your ability to "
echo "        retsore from them. "
echo "#######################################################################"



#email notification

if [ $EMAIL -eq 1 ]
  then cat $LOGFILE | mail -s "$EMAILSUBJECT" $EMAILADDRESS
fi


#Fix stdout and stderr to go to console instead of og file since we are 
#about to compress the log file
exec 1>&3                   
exec 2>&3


#compress log file?
if test $COMPRESSLOG -eq 1
  then
  #gzip it
  gzip -$COMPRESSLEVEL $LOGFILE  > /dev/null 2>&1
  rm -f $LOGFILE  > /dev/null 2>&1
fi




exit 0
