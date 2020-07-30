#file require to run this "reduce.sh" program
#-oracdr.sh
#-rm.sh
#-serch_sideband.awk
#-makecube.awk
#-linplot.awk
#-wcsattrib.awk
#-set_soft.txt


ls a????????_?????_??_????.sdf>mylist				#make a list for raw data
tcsh oracdr.sh							#run oracdr for the data in mylist
ls a????????_?????_??_thr???.sdf >mylist			#make a list for thr file
echo -n > sideband.txt						#make a empty file to record sideband
awk -f serch_sideband.awk mylist >search_sideband1.txt		#make command lines to get sideband infromation
cat set_soft.txt search_sideband1.txt > search_sideband.sh	#add additional lines to load software to get sideband information
tcsh search_sideband.sh						#run program and sideband.txt has the infromation for sideband after running
\paste mylist sideband.txt > mylist2				#gather the information of filename and sideband to makecube1.txt
awk -f makecube.awk mylist2 >makecube1.txt			#make command like to ran makecube
cat set_soft.txt makecube1.txt >makecube.sh			#add additinal line to load software
tcsh makecube.sh						#run makecube and cube_orighinalfilename is produced
ls cube_a????????_?????_??_thr???.sdf > mylist
awk -f wcsattrib.awk mylist > wcsattrib.txt
cat set_soft.txt wcsattrib.txt > wcsattrib.sh
tcsh wcsattrib.sh
awk -f linplot.awk mylist > linplot.txt
cat set_soft.txt linplot.txt > linplot.sh
tcsh linplot.sh
tcsh rm.sh							#delete the filesproduced for the process for this script
