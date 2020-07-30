#file require to run this "reduce.sh" program
#-serch_sideband.awk
#-makecube.awk
#-linplot.awk
#-wcsattrib.awk
#-getfreq.awk
#-stats.awk
#-gettau.awk
#-set_soft.txt

ls a????????_?????_??_thr???.sdf >mylist			#make a list for thr file
echo -n > sideband.txt						#make a empty file to record sideband                                 
awk -f serch_sideband.awk mylist >search_sideband1.txt		#make command lines to get sideband infromation                       
cat set_soft.txt search_sideband1.txt > search_sideband.sh	#add additional lines to load software to get sideband information        
tcsh search_sideband.sh						#run program and sideband.txt has the infromation for sideband after runningtcsh wcsattrib.sh
echo -n > restfreq.txt
awk -f getfreq.awk mylist > getfreq.txt  
cat set_soft.txt getfreq.txt > getfreq.sh
tcsh getfreq.sh
\paste mylist sideband.txt restfreq.txt > mylist2				#gather the information of filename and sideband to makecube1.txt       
awk -f makecube.awk mylist2 >makecube.txt			#make command like to ran makecube                                        
cat set_soft.txt makecube.txt > makecube.sh
tcsh makecube.sh

ls ???cube_a????????_?????_??_thr???_NU??.sdf > mylist						#run makecube and cube_orighinalfilename is produced
awk -f wcsattrib.awk mylist > wcsattrib.txt
cat set_soft.txt wcsattrib.txt > wcsattrib.sh
tcsh wcsattrib.sh

awk -f linplot.awk mylist > linplot.txt
cat set_soft.txt linplot.txt > linplot.sh
tcsh linplot.sh

echo -n >stats1.txt
echo -n >stats2.txt
awk -f stats.awk mylist > stats.txt
cat set_soft.txt stats.txt > stats.sh
tcsh stats.sh

echo -n > restfreq.txt
awk -f getfreq.awk mylist > getfreq.txt
cat set_soft.txt getfreq.txt > getfreq.sh
tcsh getfreq.sh

echo -n > tau.txt
awk -f gettau.awk mylist > gettau.txt
cat set_soft.txt gettau.txt > gettau.sh
tcsh gettau.sh

sed -e "s/...cube_a//g" mylist -e "s/_thr001_/ /" -e "s/.sdf//" -e "s/_/ /g" > mylist2
\paste mylist mylist2 restfreq.txt stats1.txt stats2.txt tau.txt > stats3.txt
echo "fname utdate obsnum subsystem recep restfreq mean std median min max tau225st tau225en wvmtaust wvmtauen" > header.txt
cat header.txt stats3.txt > stats4.txt

