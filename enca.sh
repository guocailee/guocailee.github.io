 
  
SUBFIX="txt html htm conf md xml js css rb lock"  
  
cd /home/git/hpstr-jekyll-theme-master
  
if [ -z $1 ];then  
    cd $PWD  
else  
    if [ -d $1 ];then  
    cd $1  
    else  
    echo " $1 is not exist;"  
    exit 1  
    fi  
fi  
  
for i in $SUBFIX;  
do  
    files=`find . -name "*.$i"`  
    for f in $files;  
    do  
    type=`file $f|awk -F':' '{print $2}' |awk  '{print $1}'`  
    if [ $type = "ISO-8859" ];then  
        echo "$f encoding is :$type"  
        #iconv -f GB2312 -t UTF-8 -o $f $f  
        enca -L zh_cn -x UTF-8 $f  
    else  
        echo "$f encoding is :$type"  
	enca -L  none -x UTF-8 $f
    fi  
      
    done  
done  
