{
sdf=$1
gsub(/.sdf$/,".png", $1)
print "linplot " sdf " dev=" $1 "/PNG xmap=LRLinear"

}
