function mboxappend
{
   for f in $@; do
      if [ $f != $1 ]; then
         echo -e "\n\nFrom - (someone)" >> $1
         cat $f >> $1
         echo $f
      fi
   done
}
