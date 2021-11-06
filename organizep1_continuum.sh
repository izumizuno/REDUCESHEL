ls a????????_?????_??_reduced001.sdf > mylist

echo -n > sideband.txt 
awk -f serch_sideband.awk mylist >search_sideband1.txt 
cat set_soft.txt search_sideband1.txt > search_sideband.sh
tcsh search_sideband.sh

echo -n > restfreq.txt
awk -f getfreq.awk mylist > getfreq.txt
cat set_soft.txt getfreq.txt > getfreq.sh
tcsh getfreq.sh

echo -n > object.txt
awk -f getobject.awk mylist > getobject.txt
cat set_soft.txt getobject.txt > getobject.sh
tcsh getobject.sh
cat object.txt | sed "s/'//g" |sed "s/(//g" | sed "s/)//g"  > object2.txt

\paste mylist sideband.txt restfreq.txt object2.txt > mylist2
awk -f namechangeP1.awk mylist2 > namechangeP0.sh
tcsh namechangeP0.sh

ls a????????_?????_??_???_*_?P?.sdf > mylist
awk -f wcsattrib.awk mylist > wcsattrib.txt
cat set_soft.txt wcsattrib.txt > wcsattrib.sh
tcsh wcsattrib.sh

awk -f linplot.awk mylist > linplot.txt
cat set_soft.txt linplot.txt > linplot.sh
tcsh linplot.sh

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
cat object.txt | sed "s/'//g" > object2.txt


echo -n > bwmode.txt
awk -f getbwmode.awk mylist > getbwmode.txt
cat set_soft.txt getbwmode.txt > getbwmode.sh
tcsh getbwmode.sh

echo -n > msroot.txt
awk -f getmsroot.awk mylist > getmsroot.txt
cat set_soft.txt getmsroot.txt > getmsroot.sh
tcsh getmsroot.sh

echo -n > mean_dev_median.txt
echo -n > Min_Max.txt
awk -f stats.awk mylist >stats.txt
cat set_soft.txt stats.txt > stats.sh
tcsh stats.sh

sed -E "s/_[0-9][0-9][0-9]_[0-9A-Z-]+_/_/" mylist | sed -e "s/a//" | sed -e "s/_/ /g" | sed -e "s/P/ /" | sed -e "s/.sdf//" > mylist2
\paste mylist mylist2 restfreq.txt lofreq.txt tsys.txt msbtitle.txt object2.txt bwmode.txt msroot.txt mean_dev_median.txt Min_Max.txt > summary.txt
echo "fname utdate obsnum subsystem sideband pol restfreq LOfreqs LOfreqe tsys msbtitle object bwmode msroot mean deviation median min max" > header.txt
cat header.txt summary.txt > summary2.txt

