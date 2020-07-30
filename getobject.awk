{
print "fitslist " $1 " | grep OBJECT | awk '{print $3}' | sed 's/^.//' >> object.txt"
}
