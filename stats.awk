{
print "stats " $1 " order=True | grep -E \"mean|deviation|median\" | awk '{print $4}' |\\paste -s >> mean_dev_median.txt"
print "stats " $1 " order=True | grep -E \"Mini|Max\" | awk '{print $5}' |\\paste -s >> Min_Max.txt"
}
