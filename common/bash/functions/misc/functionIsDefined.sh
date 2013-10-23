function functionIsDefined()
{
   if [ $# != 1 ]
   then
     echo "usage: functionIsDefined <function_name>"
   fi

   local testout=`type -type $1`
   if [ -n "$testout" ] && [ "$testout" = "function" ]
   then
     return 0
   else
     return -1
   fi
}