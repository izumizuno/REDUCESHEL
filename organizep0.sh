ls a????????_?????_??_reduced001.sdf > mylist

echo -n > sideband.txt 
awk -f serch_sideband.awk mylist >search_sideband1.txt 
cat set_soft.txt search_sideband1.txt > search_sideband.sh
tcsh search_sideband.sh

echo -n > restfreq.txt
awk -f getfreq.awk mylist > getfreq.txt
cat set_soft.txt getfreq.txt > getfreq.sh
tcsh getfreq.sh

\paste mylist sideband.txt restfreq.txt > mylist2
awk -f namechangeP0.awk mylist2 > namechangeP0.sh
tcsh namechangeP0.sh

ls a????????_?????_??_reduced????P?.sdf > mylist
awk -f wcsattrib.awk mylist > wcsattrib.txt
cat set_soft.txt wcsattrib.txt > wcsattrib.sh
tcsh wcsattrib.sh

awk -f linplot.awk mylist > linplot.txt
cat set_soft.txt linplot.txt > linplot.sh
tcsh linplot.sh

echo -n > peakval.txt
awk -f getpeakval.awk mylist > getpeakval.txt
cat set_soft.txt getpeakval.txt > getpeakval.sh
tcsh getpeakval.sh

echo -n > lofreq.txt
awk -f getlofreq.awk mylist > getlofreq.txt
cat set_soft.txt getlofreq.txt > getlofreq.sh
tcsh getlofreq.sh

echo -n > restfreq.txt
awk -f getfreq.awk mylist > getfreq.txt
cat set_soft.txt getfreq.txt > getfreq.sh
tcsh getfreq.sh

echo -n > tsys.txt
awk -f gettsys.awk mylist > gettsys.txt
cat set_soft.txt gettsys.txt > gettsys.sh
tcsh gettsys.sh

echo -n > msbtitle.txt
awk -f getmsbtitle.awk mylist > getmsbtitle.txt
cat set_soft.txt getmsbtitle.txt > getmsbtitle.sh
tcsh getmsbtitle.sh

echo -n > object.txt
awk -f getobject.awk mylist > getobject.txt
cat set_soft.txt getobject.txt > getobject.sh
tcsh getobject.sh

echo -n > bwmode.txt
awk -f getbwmode.awk mylist > getbwmode.txt
cat set_soft.txt getbwmode.txt > getbwmode.sh
tcsh getbwmode.sh

echo -n > msroot.txt
awk -f getmsroot.awk mylist > getmsroot.txt
cat set_soft.txt getmsroot.txt > getmsroot.sh
tcsh getmsroot.sh

sed -e "s/a//" mylist -e "s/_/ /g" -e "s/reduced...//" -e "s/P/ /" -e "s/.sdf//" > mylist2
\paste mylist mylist2 restfreq.txt lofreq.txt tsys.txt peakval.txt msbtitle.txt object.txt bwmode.txt msroot.txt > summary.txt
echo "fname utdate obsnum subsystem sideband pol restfreq LOfreqs LOfreqe tsys peak msbtitle object bwmode msroot" > header.txt
cat header.txt summary.txt > summary2.txt
