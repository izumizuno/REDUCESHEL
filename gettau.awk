{
print "fitslist " $1 " | grep -E '^TAU225ST|^TAU225EN|^WVMTAUST|^WVMTAUEN' | awk '{print $2}'| \\paste -s >> tau.txt"
}
