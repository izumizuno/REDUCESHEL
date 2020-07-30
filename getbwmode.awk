{
print "fitslist " $1 " | grep  BWMODE | awk '{print $3}' | sed -E 's/^.//' | sed -E 's/.$//' >> bwmode.txt"
}
