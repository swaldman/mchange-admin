function appendToPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: appendToPATH <varname>"
     return -1
   fi

   if [ -n "$PATH" ]
   then
      PATH=${PATH}:$1
   else
      PATH=$1
      export PATH
   fi
}
