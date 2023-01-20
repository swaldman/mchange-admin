pushd ${BASH_FUNCTIONS_BASE} > /dev/null

source env/prependToPATH.sh
source env/prependToCLASSPATH.sh
source env/prependToMANPATH.sh
source env/prependToLD_LIBRARY_PATH.sh
source env/prependToDYLD_LIBRARY_PATH.sh
source java/prependjars.sh

function pkgprepend()
{
    local usagestr="pkgprepend <pkgname>"

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
      prependToPATH "${bindir}" 
    fi

    if [ -d "${mandir}" ]
    then
      prependToPATH "${mandir}" 
    fi

    prependjars $pkgdir

    if [ -d "${libdir}" ]
    then
	prependjars $libdir
        prependToLD_LIBRARY_PATH "${libdir}"
        prependToDYLD_LIBRARY_PATH "${libdir}"
    fi

    if [ -d "${classesdir}" ]
    then
       prependToCLASSPATH "${classesdir}"  
    fi
       
    if [ -d "${resourcesdir}" ]
    then
       prependToCLASSPATH "${resourcesdir}"  
    fi
       
    return 0;
}

popd > /dev/null
