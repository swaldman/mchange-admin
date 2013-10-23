function appendToLD_LIBRARY_PATH()
{
   if [ $# != 1 ]
   then
     echo "usage: appendToLD_LIBRARY_PATH <varname>"
     return -1
   fi

   if [ -n "$LD_LIBRARY_PATH" ]
   then
      LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:$1
   else
      LD_LIBRARY_PATH=$1
      export LD_LIBRARY_PATH
   fi
}
