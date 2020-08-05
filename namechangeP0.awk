{
 gsub("\\.","",$4)
 print "cp " $1 " " substr($1,1,19) substr($3,1,3)"_"$4"_"$2 "P0.sdf"
}
