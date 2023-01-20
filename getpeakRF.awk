{
print "stats " $1 " |  grep Co-ordinate | awk 'FNR==2{print $5}'| sed -E 's/\\)$//' >> peakRF.txt"
}
