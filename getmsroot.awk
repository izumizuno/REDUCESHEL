{                                             
print "fitslist " $1 " | grep  MSROOT | awk '{print $3}' | sed -E 's/^.//' | sed -E 's/.$//' >> msroot.txt"
} 
