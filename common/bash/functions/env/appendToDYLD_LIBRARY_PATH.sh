function appendToDYLD_LIBRARY_PATH()
{
   if [ $# != 1 ]
   then
     echo "usage: appendToDYLD_LIBRARY_PATH <varname>"
     return -1
   fi

   if [ -n "$DYLD_LIBRARY_PATH" ]
   then
      DYLD_LIBRARY_PATH=${DYLD_LIBRARY_PATH}:$1
   else
      DYLD_LIBRARY_PATH=$1
      export DYLD_LIBRARY_PATH
   fi
}
