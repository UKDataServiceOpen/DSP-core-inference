set more off,permanently
cd ~/Dropbox/work/UKDS/Weighting/
clear all
use 8999stata_19F69364F347E76D69B733E62CBABA6D7EBB12BA9FBBED1871C583029D05A74B_V1/lfsp_aj22_eul_pwt22.dta
egen mn=mean(PWT22)
gen PWT22_s=PWT22/mn
keep if FTPTW >0 & TTACHR>=0 & HOURPAY>=0

svyset [pw=PWT22]
svy: tab SEX,count format(%10.1g)
svy: tab SEX,percent 
svy: tab SEX FTPTWK,percent 

svy: mean HOURPAY,over(SEX FTPTWK)

xi:svy: reg HOURPAY i.SEX i.FTPTWK i.SEX*i.FTPTWK  i.URESMC

svyset [pw=PWT22_s]
svy: tab SEX,count format(%10.1g)
svy: tab SEX,percent 
svy: tab SEX FTPTWK,percent 

svy: mean HOURPAY,over(SEX FTPTWK)

xi:svy: reg HOURPAY i.SEX i.FTPTWK i.SEX*i.FTPTWK  i.URESMC
