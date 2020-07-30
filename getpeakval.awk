{
print "stats " $1 " | grep Maximum | awk '{print $5}' >> peakval.txt"
}
