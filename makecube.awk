{
input=$1
gsub(/.sdf$/,"", $1)
print "makecube in="input " out="substr($3,1,3)  "cube_"$1 "_NU0" $2 ".sdf detector=\"'NU0" $2 "'\" "
print "makecube in="input " out="substr($3,1,3)  "cube_"$1 "_NU1" $2 ".sdf detector=\"'NU1" $2 "'\" "
}
