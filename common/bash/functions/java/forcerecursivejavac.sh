pushd ${BASH_FUNCTIONS_BASE} > /dev/null

source misc/dirsbelowfullpaths.sh

function forcerecursivejavac
{
   local d=`pwd`
   for f in `dirsbelowfullpaths`; do
     echo "Compiling all java files in: $f"
     cd $f
     #javac *.java
     # modified to work with 1.3 compiler (which fails
     # to produce any output if any simultaneously compiled
     # file fails
     for f in *.java; do
       javac $f
     done
   done
   cd $d
}

popd > /dev/null
