#!/bin/csh
source /jac_sw/bin/starlink.csh
ls a????????_?????_??_????.sdf > list.lis
# reduce only P0
mkdir p0

oracdr_acsis
setenv ORAC_DATA_IN .
setenv ORAC_DATA_OUT ./p0
# define P1 as "bad receptor"
echo "NU1L NU1U" >> $ORAC_DATA_OUT/bad_receptors.lis

oracdr -loop file -file /export/data2/imizuno/20200729/JCMTCAL/list.lis  -nodisplay -log  -verbose -calib bad_receptors=FILE

#oracdr -loop file -file $ORAC_DATA_IN/list.lis -nodisplay -log sf\
 -verbose -calib bad_receptors=FILE

# reduce only P1
mkdir p1
setenv ORAC_DATA_IN .
setenv ORAC_DATA_OUT ./p1
echo "NU0L NU0U" >> $ORAC_DATA_OUT/bad_receptors.lis

# define P0 as "bad receptor"
oracdr -loop file -file /export/data2/imizuno/20200729/JCMTCAL/list.lis -nodisplay -log -verbose -calib bad_receptors=FILE
 
