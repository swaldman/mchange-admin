function appendToCLASSPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: appendToCLASSPATH <varname>"
     return -1
   fi

   if [ -n "$CLASSPATH" ]
   then
      #echo cp tests true: ${CLASSPATH}
      CLASSPATH=${CLASSPATH}:$1
   else
      #echo cp tests false
      CLASSPATH=$1
      export CLASSPATH
   fi
}
