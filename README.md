# REDUCESHEL
programs and shell script to reduce data and get observation informations

[Reduce raw data p1, p0 separetly in tcsh environment]
  (1)move to the directory which your raw sdf file located
  (2)Edit absolute pass of tcsh oracdr_septwopol.sh from "/export/data2/imizuno/20200729/JCMTCAL/" to your directory pass which your raw sdf file located
  (3)run script like below, then oracdr start to reduce data p0 and p1 separetly
  >tcsh oracdr_septwopol.sh
  (4)After finish the script you get folder named p0 and p1, and each folder have reduced data for p0 or p1.


[Reduced file modification and summarize some useful informations to text file and output spectra image with png format] 
Things to be done:
(a)Change file name from 
    a[utdate]_[obsnum]_[subsystem]_reduced001.sdf 
    to
    a[utdate]_[obsnum]_[subsystem]_[restfreq]_[source name]_[sideband][Polarization].sdf
    example) a20200729_00065_02_218_G343_LP0.sdf
(b)Change axis form velocity to GHz
(c)Summarize information
 Information to be gather:
    fname utdate obsnum subsystem sideband pol restfreq LOfreqs LOfreqe tsys peak msbtitle object bwmode msroot
 Text name which have the summary
    summary2.txt
(d)Output spectra image with ping format 
  example of the png file name) a20200729_00065_02_218_G343_LP0.png

How to run:
 (1)place following files on your p0 and p1 directory
    serch_sideband.awk
    getfreq.awk
    getobject.awk
    namechangeP0.awk
    wcsattrib.awk
    linplot.awk
    getpeakval.awk
    getlofreq.awk
    getfreq.awk
    gettsys.awk
    getmsbtitle.awk
    getobject.awk
    getbwmode.awk
    getmsroot.awk
    set_soft.txt
    organizedp0.sh
    organizedp1.sh 
 (2)run following command at p0 directory
    >tcsh organizedp0.sh 
 (3)run following command at p1 directory
    >tcsh organizedp1.sh 
