function prependToMANPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: prependToMANPATH <varname>"
     return -1
   fi

   if [ -n "$MANPATH" ]
   then
      MANPATH=$1:${MANPATH}
   else
      MANPATH=$1
      export MANPATH
   fi
}
