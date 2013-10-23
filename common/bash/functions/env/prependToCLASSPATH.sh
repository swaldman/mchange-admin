function prependToCLASSPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: prependToCLASSPATH <varname>"
     return -1
   fi

   if [ -n "$CLASSPATH" ]
   then
      #echo cp tests true: ${CLASSPATH}
      CLASSPATH=$1:${CLASSPATH}
   else
      #echo cp tests false
      CLASSPATH=$1
      export CLASSPATH
   fi
}
