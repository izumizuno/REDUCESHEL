{
print "fitslist " $1 " | grep MSBTITLE | sed -e 's/MSBTITLE= .//' | sed -E 's/..\\/.[a-zA-Z ]+//' | sed -E 's/[ ]+/_/g' >> msbtitle.txt"
}
