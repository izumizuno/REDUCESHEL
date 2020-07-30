{
 print "fitslist " $1 " | grep -E 'LOFREQS|LOFREQE' | awk '{print $3}'| \\paste -s >>lofreq.txt"
}
