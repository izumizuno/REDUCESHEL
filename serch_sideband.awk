{
 print "fitslist " $1 " |grep OBS_SB | awk '{print substr($3,2,1)}'>>sideband.txt" 
}
