{
print "stats " $1 " order=True | grep -E \"mean|deviation|median\" | awk '{print $4}' |\\paste -s >> stats1.txt"
print "stats " $1 " order=True | grep -E \"Mini|Max\" | awk '{print $5}' |\\paste -s >> stats2.txt"
}
