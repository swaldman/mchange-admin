if [ -z "$BASH_FUNCTIONS_BASE" ]; then
   echo "Cannot define useFunction!"
   echo "\$BASH_FUNCTIONS_BASE must be defined!" 
else  

  #
  # set up our ability to use functions
  #
  function useFunction
  {
    pushd "$BASH_FUNCTIONS_BASE" > /dev/null
      . "$1.sh"
    popd > /dev/null
  }

fi

