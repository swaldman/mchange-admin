function appendToMANPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: appendToMANPATH <varname>"
     return -1
   fi

   if [ -n "$MANPATH" ]
   then
      MANPATH=${MANPATH}:$1
   else
      MANPATH=$1
      export MANPATH
   fi
}
