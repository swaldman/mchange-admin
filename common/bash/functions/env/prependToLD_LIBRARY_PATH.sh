function prependToLD_LIBRARY_PATH()
{
   if [ $# != 1 ]
   then
     echo "usage: prependToLD_LIBRARY_PATH <varname>"
     return -1
   fi

   if [ -n "$LD_LIBRARY_PATH" ]
   then
      LD_LIBRARY_PATH=$1:${LD_LIBRARY_PATH}
   else
      LD_LIBRARY_PATH=$1
      export LD_LIBRARY_PATH
   fi
}
