pushd ${BASH_FUNCTIONS_BASE} > /dev/null

source env/prependToCLASSPATH.sh

# NOTE: we require absolute paths of directories,
# 'cuz we don't know how to resolve possible relative
# paths into absolutes
#
# TODO: fix this.
function prependjars()
{
    for f in $1/*.jar; do
        if [ $f != "$1/*.jar" ] # don't add the unmatched literal wildcard
	then
          prependToCLASSPATH $f
        fi
    done

    for f in $1/*.zip; do
        if [ $f != "$1/*.zip" ] # don't add the unmatched literal wildcard
	then
          prependToCLASSPATH $f
        fi
    done

    return 0;
}

popd > /dev/null

