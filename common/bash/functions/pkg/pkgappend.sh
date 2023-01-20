pushd ${BASH_FUNCTIONS_BASE} > /dev/null

source env/appendToPATH.sh
source env/appendToCLASSPATH.sh
source env/appendToMANPATH.sh
source env/appendToLD_LIBRARY_PATH.sh
source env/appendToDYLD_LIBRARY_PATH.sh
source java/addjars.sh

function pkgappend()
{
    local usagestr="pkgappend <pkgname>"

    if [ $# != 1 ]
    then
	echo $usagestr;
	return -1
    fi

    local pkgdir=${PKGBASE}/$1

    if [ ! -d $pkgdir ]
    then
	echo "No such package: $pkgdir";
	return -1;
    fi

    local bindir=${pkgdir}/bin
    local mandir=${pkgdir}/man
    local libdir=${pkgdir}/lib
    local classesdir=${pkgdir}/classes
    local resourcesdir=${pkgdir}/resources

    if [ -d "${bindir}" ]
    then
      appendToPATH "${bindir}" 
    fi

    if [ -d "${mandir}" ]
    then
      appendToPATH "${mandir}" 
    fi

    addjars $pkgdir

    if [ -d "${libdir}" ]
    then
	addjars $libdir
        appendToLD_LIBRARY_PATH "${libdir}"
        appendToDYLD_LIBRARY_PATH "${libdir}"
    fi

    if [ -d "${classesdir}" ]
    then
       appendToCLASSPATH "${classesdir}"  
    fi
       
    if [ -d "${resourcesdir}" ]
    then
       appendToCLASSPATH "${resourcesdir}"  
    fi
       
    return 0;
}

popd > /dev/null
