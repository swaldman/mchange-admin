pushd ${BASH_FUNCTIONS_BASE} > /dev/null

source env/appendToCLASSPATH.sh

# NOTE: we require absolute paths of directories,
# 'cuz we don't know how to resolve possible relative
# paths into absolutes
#
# TODO: fix this.
function addjars()
{

    # see https://askubuntu.com/questions/590899/how-do-i-check-which-shell-i-am-using#comment2014535_590903
    RUNNING_SHELL=$(ps -cp "$$" -o command="")
    
    if [ $RUNNING_SHELL = "zsh" ]
    then
	setopt nullglob
    fi	
    
    for f in $1/*.jar; do
        if [ $f != "$1/*.jar" ] # don't add the unmatched literal wildcard
	then
          appendToCLASSPATH $f
        fi
    done

    for f in $1/*.zip; do
        if [ $f != "$1/*.zip" ] # don't add the unmatched literal wildcard
	then
          appendToCLASSPATH $f
        fi
    done

    if [ $RUNNING_SHELL = "zsh" ]
    then
	unsetopt nullglob
    fi	

    return 0;
}

popd > /dev/null
