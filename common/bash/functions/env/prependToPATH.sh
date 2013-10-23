function prependToPATH()
{
   if [ $# != 1 ]
   then
     echo "usage: prependToPATH <varname>"
     return -1
   fi

   if [ -n "$PATH" ]
   then
      PATH=$1:${PATH}
   else
      PATH=$1
      export PATH
   fi
}

