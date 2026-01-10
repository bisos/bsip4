#!/bin/bash

####+BEGIN: bx:bsip:bash/libLoadOnce :libName "auto"
if [ -z "${bpo_lib:-}" ] ; then
    bpo_lib="LOADED" ; TM_trace 7 "bpo_lib :: Loading Library -- /bisos/git/auth/bxRepos/bisos/bsip4/bin/bpo_lib.sh"
else
    TM_trace 7 "bpo_lib :: Prviously Loaded -- Skipping /bisos/git/auth/bxRepos/bisos/bsip4/bin/bpo_lib.sh" ; return
fi
####+END:

. ${opBinBase}/bpoId_lib.sh

# ./opAcctLib.sh
. ${opBinBase}/opAcctLib.sh

# ./lcnFileParams.libSh
. ${opBinBase}/lcnFileParams.libSh



function bpoIdAssert {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Return 0 if bpoId has been specified or is determinable. Otherwise, non-zero.
Side-effecft: bpoId and bpoHome may be set based on bxoPath
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    if [ ! -z "${bpoId}" ] ; then
        return 0
    elif [ ! -z "${bxoPath:-}" ] ; then
        bpoId=$( vis_bpoIdObtainForPath "${bxoPath}" )
        if [ -z ${bpoId} ] ; then
            return 101
        else
            bpoHome=$( FN_absolutePathGet ~${bpoId} )
        fi
    else
        return 101
    fi
    return 0
}


function bxoGitServerPrivTag { echo "bxoPriv"; }   # used to prefix entries in ~usg/.ssh/config and corresponding git urls

function bxoGitServerSshKeyName {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used both for pushing key to server and also for keeping at ~usg/.ssh.
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    local gitServerType=$1
    local bpoId=$2
    local sshKeyType=$3

    echo "${gitServerType}_${bpoId}_${sshKeyType}"
}

function bxoGitServerSshAlias {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Used as Host in ~usg/.ssh/config -- and ~usg/.ssh/configSeg/bxoPriv_as-bisos.configSeg.
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    local gitServerType=$1
    local bpoId=$2

    echo "${gitServerType}_${bpoId}"
}

function rbxeSshBase { echo "rbxe/credentials/ssh"; }

function vis_bxoSshAcctKeyVerify {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]

    local retVal=0

    lpDo lcaSshAdmin.sh ${G_commandOptions} -p localUser=${bpoId} -p sshDir=rbxe/credentials/ssh -i userKeyVerify
    retVal=$?

    lpReturn ${retVal}
}

function vis_bxoKindTypeFacility {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
For example for bpoId=pir_privRegistrar, facility=bxioRegistrar.sh
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local bxeDescBase="${bpoHome}/rbxe/bxeDesc"
    
    local bxeKind=$( fileParamManage.cs  -i fileParamRead  ${bxeDescBase} bxeKind )    
    local bxeType=$( fileParamManage.cs  -i fileParamRead  ${bxeDescBase} bxeType )

    local bxeTypeWord=${bxeType^}

    local bxeKindTag=""
    
    case ${bxeKind} in 
      real)
            bxeKindTag="bxro"
            ;;
      info)
            bxeKindTag="bxio"
            ;;
      svc)
            bxeKindTag="bxso"
            ;;
      container)
            bxeKindTag="bxco"
            ;;
      materialization)
            bxeKindTag="bxmo"
            ;;
      *)
            EH_problem "Unknown bxeKind=${bxeKind}"
            return 101
    esac

    echo "${bxeKindTag}${bxeTypeWord}.sh"
    
    lpReturn
}



function vis_bxoSshKeyUpdate {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ ! -z "${bpoId}" ]]    

    lpDo lcaSshAdmin.sh ${G_commandOptions} -p localUser=${bpoId} -p sshDir=rbxe/credentials/ssh -i userKeyUpdate

    local curUser=$( id -u -n )    
    bpoHome=$( FN_absolutePathGet ~${bpoId} )
    lpDo sudo chown -R "${curUser}":bisos ${bpoHome}/rbxe/credentials/ssh
    
    lpReturn
}


function vis_bxoPathObtainForBxoId {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local thisBxoId="$1"

    thisBxoId=$(bpoIdPrep ${thisBxoId})
    EH_assert [ ! -z ${thisBxoId} ]

    local thisBxoHome=$( FN_absolutePathGet ~${thisBxoId} )
    EH_assert [ ! -z "${thisBxoHome}" ]

    echo "${thisBxoHome}"
    lpReturn
}

function vis_bpoIdObtainForPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local inPath="$1"
    local canonInPath=$( FN_absolutePathGet ${inPath} )
    local thisElem=""

    typeset bxoBaseFound="FALSE"

    pathToArray ${canonInPath}

    set ${pathArray[@]}

    for thisElem in ${pathArray[@]} ; do
        #echo "${thisElem}"
        shift
        if [[ "${bxoBaseFound}" == "TRUE" ]] ; then
            break
        fi
        if [[ "${thisElem}" == "iso" ]] ; then
            bxoBaseFound="TRUE"
        fi
    done
    
    if [[ "${bxoBaseFound}" != "TRUE" ]] ; then
        ANT_raw "bpoId not found"
        lpReturn 101
    fi

    echo "${thisElem}"
    lpReturn
}

function bxoRealizationScopeIsValid {
   G_funcEntry
   function describeF {  G_funcEntryShow; cat  << _EOF_
** \$1 is one of:
- basePrep    -- Just create the base dir. Do not create the git account or the repo
- realize     -- Create the git account or the repo. Assumes basePrep has previously been invoked. 
- full        -- basePrep+realize
_EOF_
                      }
   EH_assert [[ $# -eq 1 ]]
   local bxoRealizationScope=$1
   case ${bxoRealizationScope} in
       basePrep|realize|full)
           return 0
           ;;
       *)
           return 1
           ;;
   esac
}

function vis_with_bxoRealizationScope_createBaseDirOrCreateRepo {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    
    local bxoRealizationScope=$1
    local repoBase=$2

    if [ -d "${repoBase}" ] ; then
        case ${bxoRealizationScope} in
            realize)
                lpDo vis_repoCreateAndPushBasedOnPath ${repoBase}
                lpReturn 1
                ;;
            full)
                ANT_raw "With bxoRealizationScope=${bxoRealizationScope} did not expect ${repoBase}"
                lpDo vis_repoCreateAndPushBasedOnPath ${repoBase}
                lpReturn 1
                ;;
            basePrep)
                ANT_raw "repoBase=${repoBase} is in place, updating"
                ;;
            *)
                EH_problem "Bad Usage -- ${bxoRealizationScope}"
                return 101
                ;;
        esac
    else
        case ${bxoRealizationScope} in
            realize)
                EH_problem "Base does not exist but realize was specified."
                lpReturn 101
                ;;
            basePrep|full)
                ANT_raw "repoBase=${repoBase} missing, creating"
                lpDo mkdir -p ${repoBase}
                ;;
            *)
                EH_problem "Bad Usage -- ${bxoRealizationScope}"
                return 101
                ;;
        esac
    fi
    lpReturn 0
}

function vis_repoCreateAndPushBasedOnPathBasedOn_bxoRealizationScope {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 2 ]]
    
    local bxoRealizationScope=$1
    local repoBase=$2

    if [ "${bxoRealizationScope}" == "full" ] ; then
        lpDo vis_repoCreateAndPushBasedOnPath ${repoBase}
    fi
}

function vis_repoCreateAndPushBasedOnPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local repoPath="$1"
    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    if [ ! -d "${canonRepoPath}" ] ; then
        EH_problem "${canonRepoPath} -- does not exist  -- Skipped"
        lpReturn 101
    fi

    if [ ! -z "${gitRemote}" ] ; then
        EH_problem "${canonRepoPath} Is Already A Git Repo -- Skipped"
        lpReturn 101
    fi

    local baseName=$( basename "${canonRepoPath}" )
    
    bpoId=$( vis_bpoIdObtainForPath "${canonRepoPath}" )
 
    EH_assert  vis_userAcctExists "${bpoId}"

    lpDo vis_repoCreateAndPush "${baseName}" "${canonRepoPath}" priv
    
    lpReturn
}

function vis_repoDeleteBasedOnPath {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local repoPath="$1"
    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    if [ -z "${gitRemote}" ] ; then
        EH_problem "${canonRepoPath} Is Not A Git Repo -- Deletion Skipped"
        lpReturn 101
    fi

    local baseName=$( basename "${canonRepoPath}" )
    
    bpoId=$( vis_bpoIdObtainForPath "${canonRepoPath}" )

    lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i reposDelete "${baseName}"

    local repoContainerPath=$( FN_dirsPart "${canonRepoPath}" )

    if [ "${G_forceMode}" == "force" ] ; then
        inBaseDirDo ${repoContainerPath} rm -r "${baseName}"
    else
        ANT_raw "${canonRepoPath} not deleted -- forceMode is not specified."
    fi
    
    lpReturn
}

function vis_basedOnPath_reposNameList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local repoPath="$1"
    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    bpoId=$( vis_bpoIdObtainForPath "${canonRepoPath}" )

    lpDo bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList    
    
    lpReturn
}


function vis_basedOnPath_reposPathList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    local repoPath="$1"
    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    bpoId=$( vis_bpoIdObtainForPath "${canonRepoPath}" )
    local bpoHome=$( FN_absolutePathGet ~${bpoId} )
    local reposList=$( bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList )

    for each in ${reposList} ; do
        echo ${bpoHome}/${each}
    done
    
    lpReturn
}



function vis_bxoReposNameList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Given a list of BxOs on stdin or as args, for each list all of its repos.
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local bpoId=$1
        if ! vis_userAcctExists ${bpoId} ; then
            EH_problem "${bpoId} Account Does Not Exist -- ${thisFunc} Processing Skipped"
            lpReturn 101
        fi

        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "Listing Names Of Repos Of bpoId=${bpoId}"
        fi
        lpDo bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList         
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}


function vis_bpoReposNotCloned {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local bpoId=$1
        if ! vis_userAcctExists ${bpoId} ; then
            EH_problem "${bpoId} Account Does Not Exist -- ${thisFunc} Processing Skipped"
            lpReturn 101
        fi
        local bpoHome=$( FN_absolutePathGet ~${bpoId} )
        local reposList=$( bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList )

        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "Listing Path Of Repos Of bpoId=${bpoId}"
        fi
        local basedirsList=$(inBaseDirDo ${bpoHome} ls)
        local bpoMatch="TRUE"
        local repoMisMatch="TRUE"
        for each in ${reposList} ; do
            repoMisMatch="TRUE"
            for other in ${basedirsList} ; do
                if [ "${each}" == "${other}" ] ; then
                    repoMisMatch="FALSE"
                    break
                fi
            done
            if [ "${repoMisMatch}" == "TRUE" ] ; then
                echo REPO Has Not Been Cloned: ${bpoHome}/${each}
                bpoMatch="FALSE"
            fi
        done
        if [ "${bpoMatch}" == "TRUE" ] ; then
            echo Consistent REPOS and BASEDIRS: ${bpoHome}
        fi

        return

        for each in ${basedirsList} ; do
            echo BASEDIR: ${bpoHome}/${each}
        done

        for each in ${reposList} ; do
            echo REPO:  ${bpoHome}/${each}
        done
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:

    lpReturn
}





function vis_bpoBasedirsNotRepos {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local bpoId=$1
        if ! vis_userAcctExists ${bpoId} ; then
            EH_problem "${bpoId} Account Does Not Exist -- ${thisFunc} Processing Skipped"
            lpReturn 101
        fi
        local bpoHome=$( FN_absolutePathGet ~${bpoId} )
        local reposList=$( bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList )

        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "Listing Path Of Repos Of bpoId=${bpoId}"
        fi
        local basedirsList=$(inBaseDirDo ${bpoHome} ls)
        local bpoMatch="TRUE"
        local repoMisMatch="TRUE"
        for each in ${basedirsList} ; do
            repoMisMatch="TRUE"
            for other in ${reposList} ; do
                if [ "${each}" == "${other}" ] ; then
                    repoMisMatch="FALSE"
                    break
                fi
            done
            if [ "${repoMisMatch}" == "TRUE" ] ; then
                echo NOT A REPO: ${bpoHome}/${each}
                bpoMatch="FALSE"
            fi
        done
        if [ "${bpoMatch}" == "TRUE" ] ; then
            echo Consistent REPOS and BASEDIRS: ${bpoHome}
        fi

        return

        for each in ${basedirsList} ; do
            echo BASEDIR: ${bpoHome}/${each}
        done

        for each in ${reposList} ; do
            echo REPO:  ${bpoHome}/${each}
        done
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:

    lpReturn
}



function vis_bxoReposPathList {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    local inputsList="$@"
    local thisFunc=${G_thisFunc}

    function processEach {
        EH_assert [[ $# -eq 1 ]]
        local bpoId=$1
        if ! vis_userAcctExists ${bpoId} ; then
            EH_problem "${bpoId} Account Does Not Exist -- ${thisFunc} Processing Skipped"
            lpReturn 101
        fi
        local bpoHome=$( FN_absolutePathGet ~${bpoId} )
        local reposList=$( bxoGitlab.py -v 30 --bpoId="${bpoId}" -i reposList )

        if [ "${G_verbose}_" == "verbose_" ] ; then
            ANT_raw "Listing Path Of Repos Of bpoId=${bpoId}"
        fi
        for each in ${reposList} ; do
            echo ${bpoHome}/${each}
        done
    }

####+BEGIN: bx:bsip:bash/processArgsAndStdin :noParams t
     function processArgsAndStdin {
        local effectiveArgs=( "$@" )
        local stdinArgs=()
        local each
        if [ ! -t 0 ]; then # FD 0 is not opened on a terminal, there is a pipe
            readarray stdinArgs < /dev/stdin
            effectiveArgs=( "$@" "${stdinArgs[@]}" )
        fi
        if [ ${#effectiveArgs[@]} -eq 0 ] ; then
            ANT_raw "No Args And Stdin Is Empty"
            lpReturn
        fi
        for each in "${effectiveArgs[@]}"; do
            lpDo processEach "${each%$'\n'}"
        done
    }
    lpDo processArgsAndStdin "$@"
####+END:
    
    lpReturn
}



function vis_repoCreateAndPush {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 3 ]]
    EH_assert [ ! -z "${bpoId}" ]
    
    local repoName="$1"
    local repoPath="$2"
    local gitServerSelector="$3"

    local canonRepoPath=$( FN_absolutePathGet ${repoPath} )
    local gitRemote=$( inBaseDirDo ${canonRepoPath} git remote 2> /dev/null )

    if [ ! -z "${gitRemote}" ] ; then
        EH_problem "${canonRepoPath} Is Already A Git Repo -- Skipped"
        lpReturn 101
    fi

    #local gitServerUrl=git@bxoGit-${gitServerSelector}.${bpoId}:${bpoId}/${repoName}.git
    local gitServerUrl=git@bxoPriv_${bpoId}:${bpoId}/${repoName}.git    

    local curUser=$( id -u -n )

    if ! lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i reposCreate ${repoName} ; then
        ANT_cooked "${repoName} exists -- git push skipped"
        lpReturn 101
    fi

    #lpDo sudo chown -R "${curUser}":bisos ${baseDir}

    # previous example of using bpoId user: 
    # inBaseDirDo ${bpoHome}/rbxe sudo -u ${bpoId} git init
    
    inBaseDirDo ${canonRepoPath} git init    
    inBaseDirDo ${canonRepoPath} git add .
    inBaseDirDo ${canonRepoPath} git commit -m "Initial_bxeRealize.sh_commit_of_${canonRepoPath}"

    inBaseDirDo ${canonRepoPath} git remote add origin ${gitServerUrl}
    inBaseDirDo ${canonRepoPath} git remote -v
    inBaseDirDo ${canonRepoPath} git push origin master

    lpReturn
}


function vis_bxoConstructBaseDir_obtain  {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    local privacy="$1"

    echo /bisos/var/bxo/construct/${privacy}

    lpReturn
}       


function vis_obtainRepoSnapshot {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Dispatches to priv/group/all gitServers to obtain repo snap shot.
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [ ! -z "${bpoId}" ]

    local repoName=$1

    if [ -z "${privacy}" ] ; then
        privacy="priv"
    fi

    case ${privacy} in
        "priv"|"private")
            lpDo obtainRepoSnapshot_priv $@
            ;;
        "group")
            lpDo obtainRepoSnapshot_group $@
            ;;
        "all"|"public")
            lpDo obtainRepoSnapshot_all $@
            ;;
        "allGithub")
            lpDo obtainRepoSnapshot_allGithub $@
            ;;
        *)
            EH_problem "privacy=${privacy} -- Unexpected"
            return
            ;;
      esac
    
    lpReturn
}

function obtainRepoSnapshot_priv {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
** Obtain repoSnapshot.tar in /bisos/var/bxo/construct (NOTYET to be verified)
** Untar the file in a .git dir
** clone based on the .git dir
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bpoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    local repoTarFile="${bxoConstructBaseDir}/${bpoId}/${repoName}-gitSnapot.tar"
    local gitRepoBaseDir="${bxoConstructBaseDir}/${bpoId}/${repoName}.git"

    opDo FN_dirCreatePathIfNotThere "${bxoConstructBaseDir}/${bpoId}"
    
    lpDo bxoGitlab.py -v 20 --bpoId=${bpoId} --outFile="${repoTarFile}"  -i repoSnapshot ${repoName}

    lpDo mkdir "${gitRepoBaseDir}"

    inBaseDirDo "${gitRepoBaseDir}" tar xf "${repoTarFile}"

    lpDo git clone "${gitRepoBaseDir}" "${bxoConstructBaseDir}/${bpoId}/${repoName}"
    
    lpReturn
}



function obtainRepoSnapshot_group {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET -- TBD
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bpoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET"
    
    lpReturn
}

function obtainRepoSnapshot_all {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET --
** anon git clone ${bpoId}.rbxe
** anon git clone ${bpoId}.maps
Based on those run one of the _mapFile.sh
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [[ ! -z "${bpoId}" ]]
    EH_assert [[ ! -z "${privacy}" ]]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET"
    
    lpReturn
}


function obtainRepoSnapshot_allGithub {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
NOTYET --
** anon git clone ${bpoId}.rbxe
** anon git clone ${bpoId}.maps
Based on those run one of the _mapFile.sh
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert [ ! -z "${bpoId}" ]
    EH_assert [ ! -z "${privacy}" ]    

    local repoName=$1

    local bxoConstructBaseDir=$(vis_bxoConstructBaseDir_obtain "${privacy}")

    echo "NOTYET GITHUB ${bxoConstructBaseDir} ${bpoId}"

    opDo FN_dirCreatePathIfNotThere "${bxoConstructBaseDir}/${bpoId}"
    
    lpDo git clone git://github.com/bxObjects/${bpoId}.${repoName}.git "${bxoConstructBaseDir}/${bpoId}/${repoName}"

    
    lpReturn
}


function vis_initialReposClone {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Get a list of repos for the specified bpoId.
Then clone those repos at the specified base or bpoHome if not specified.
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]
    EH_assert [[ ! -z "${bpoId}" ]]

    if ! vis_userAcctExists "${bpoId}" ; then
        ANT_raw "${bpoId} account is not valid."
        lpReturn 101
    fi
    
    local gitCloneDest=""

    # At this point bpoId exists
    bpoHome=$( FN_absolutePathGet ~${bpoId} )    
    
    if [ $# -eq 0 ] ; then
        gitCloneDest=${bpoHome}
    elif [ $# -eq 1 ] ; then
        gitCloneDest=$1
    else
        EH_oops ""
        lpReturn
    fi
    
    local reposList=$( bxoGitlab.py -v 20 --bpoId="${bpoId}"  -i reposList )

    local eachRepo=""
    local gitServerUrl=""

    opDo FN_dirCreatePathIfNotThere "${gitCloneDest}"  # NOTYET
    
    for eachRepo in ${reposList} ; do
        gitServerUrl=git@bxoPriv_${bpoId}:${bpoId}/${eachRepo}.git
        # NOTYET, 
        
        #
        # NOTYET results into a add prompt -- needs something like below.
        # ssh-keygen -F github.com || ssh-keyscan github.com >> ~/.ssh/known_hosts
        lpDo git clone "${gitServerUrl}" "${gitCloneDest}/${eachRepo}"          
    done

    lpReturn
}



function vis_reposDelete {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Based on -p bpoId and \$1=repoName, creates a repo in bpoId.
_EOF_
    }
    EH_assert [[ $# -gt 0 ]]
    local args=$@
    EH_assert bpoIdAssert

    EH_assert  vis_userAcctExists "${bpoId}"

    lpDo bxoGitlab.py -v 20 --bpoId="${bpoId}" -i reposDelete ${args}
    
    lpReturn
}       



#
# Left Over From OSMT -- called bystarLib.sh -- To be sorted.
#

function bxoNextDisposableScopeAcctNu {
    EH_assert [[ $# -eq  0 ]]

    passwdFileInfo=$( egrep '^..-15' /etc/passwd | sort | tail -1 | cut -d: -f1 )

    if [ "${passwdFileInfo}_" == "_" ] ; then 
        echo "15001"
    else
        lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
        nextNu=$( expr $lastNuStr +  1 )
        echo ${nextNu}
    fi
}

function bxoNextLocalScopeAcctNu {
    EH_assert [[ $# -eq  0 ]]
    
    passwdFileInfo=$( egrep '^..-16' /etc/passwd | sort | tail -1 | cut -d: -f1 )

    if [ "${passwdFileInfo}_" == "_" ] ; then 
        echo "16001"
    else
        lastNuStr=$( expr substr  ${passwdFileInfo}  4 10 )
        nextNu=$( expr $lastNuStr +  1 )
        echo ${nextNu}
    fi
}


function bxoNextControlledAcct {
  EH_assert [[ $# -eq  0 ]]

    nextNu=$( bxoNextLocalScopeAcctNu )
    echo ca-${nextNu}
}

function bxoIsControlledAcct {
  EH_assert [[ $# -eq  1 ]]

  bxoUid=$1     
  bxoBagpLoad

  if [ "${cp_MasterAcct}_" == "_" ] ; then
    #EH_problem "Missing Master Acct"
    return 101
  fi
  return 0
}

function bxoIsMasterAcct {
  EH_assert [[ $# -eq 1 ]]
  return 0
}

function bxoBacpBaseDirVerifyAndFix {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxoUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bxoUid}_" != "_" ]]

    bpoHome=$( FN_absolutePathGet ~${bxoUid} )
    if [ ! -d ${bpoHome} ] ; then
        EH_problem "Missing ${bpoHome}"
        return 101
    fi

    if [ ! -d ${bpoHome}/BACP ] ; then
        FN_dirCreatePathIfNotThere ${bpoHome}/BACP
    fi
}

function bxoBagpLoad {
    EH_assert [[ $# -eq 0 ]]
    EH_assert [[ "${bxoUid}_" != "MANDATORY_" ]]
    EH_assert [[ "${bxoUid}_" != "_" ]]


    bpoHome=$( FN_absolutePathGet ~${bxoUid} )

    if [ ! -d ${bpoHome} ] ; then
        EH_problem "Missing ${bpoHome}"
        return 101
    fi

    if [ ! -d ${bpoHome}/BAGP ] ; then
        EH_problem "Missing ${bpoHome}/BAGP"
        return 101
    fi

    opDo fileParamsLoadVarsFromBaseDir  ${bpoHome}/BAGP 2> /dev/null
}


function masterAcctBagpLoad {
  EH_assert [[ $# -eq 0 ]]

  if [ "${cp_MasterAcct}_" == "_" ] ; then
    EH_problem "Missing Master Acct"
    return 101
  fi

  paramsFileBaseDir=$( FN_absolutePathGet ~${cp_MasterAcct}/BAGP )
  
  if [[ -d ${paramsFileBaseDir} ]] ; then 
      opDoExit cd ${paramsFileBaseDir}
  else
      EH_problem "Missing ${paramsFileBaseDir} Directory"
      return 100
  fi

  fileParamsLoadVarsFromBaseDir ${paramsFileBaseDir}    
  
  funcName=cpf_$( FN_nonDirsPart ${paramsFileBaseDir} )

  tmpFileName="/tmp/codeGen.masterAcctBagpLoad.$$"

  fileParamsCodeGenOutput ${paramsFileBaseDir} "master" > ${tmpFileName}

   .  ${tmpFileName}

   ${funcName}

   opDo rm ${tmpFileName}
}


function nextUserId {

  typeset groupName="$1"

  opAcctUidGidAnalyze ${groupName}
  integer nextid=`cat ${iv_uidPolicy_homeDir}/nextid`
  echo $nextid
  if [[ "${G_runMode}_" == "showOnly_" ]] ; then
    return 0
  else
    integer new_nextid=`expr ${nextid} + 1`   
    echo ${new_nextid} > ${iv_uidPolicy_homeDir}/nextid
  fi
}

function bxoBacsAcctsList {
  EH_assert [[ $# -ge 0 ]]
  
  #acctsList=$(cat /etc/passwd | egrep \'^ea-[0-9]\*:\|sa-[0-9]\*:\' | cut -d: -f1 )
  acctsList=$(cat /etc/passwd | egrep '^[a-z][a-z]-[0-9]*:' | cut -d: -f1 )
 
  if [[ -z ${acctsList} ]] ; then
    return 101
  fi
  
  echo ${acctsList}

  return 0
}

#
# VERY DIRTY. There should just be one bxoAcctAnalyze
#

function bxoAcctPrefixAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bxo_acct_acctTypePrefix=$1

            bxoServiceType="BYSMB"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("bysmb.net" "bysmb.com" "libresite.org")
            thisHomeDir="NOTYET"  # "${iv_uidPolicy_homeDir}/${cp_Domain1}/${cp_Domain2}"

            lpReturn


    case ${bxo_acct_acctTypePrefix} in 
      "ea")
            bxoUidGidTag="smb"
            ;;
      "ma")
            bxoUidGidTag="memory"
            ;;
      "mu")
            bxoUidGidTag="memoryUser"
            ;;
      "sa")
            bxoUidGidTag="subscriber"
            ;;
      "ua")
            bxoUidGidTag="user"
            ;;
      "aa")
            bxoUidGidTag="alias"
            ;;
      "au")
            bxoUidGidTag="aliasUsr"
            ;;
      "ca")
            bxoUidGidTag="reserved"
            ;;

      ##
      #####  BXO Generation
      ##
      "ai")
            bxoUidGidTag="autonomousIndividual"
            ;;
      *)
            EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
            return 101
    esac
    opAcctUidGidAnalyze ${bxoUidGidTag}

    case ${bxo_acct_acctTypePrefix} in 
      "ea")
            bxoServiceType="BYSMB"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("bysmb.net" "bysmb.com" "libresite.org")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_Domain1}/${cp_Domain2}"
            ;;
      "ma")
            bxoServiceType="BYMEMORY"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("bymemory.net")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
            ;;
      "mu")
            bxoServiceType="BYMEMORY"
            bxoServiceSupportType="TRIAL"
            bxoDomainsList=("bymemory.com")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
            ;;
      "sa")
            bxoUidGidTag="subscriber"
            bxoServiceType="BYNAME"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("byname.net")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
            ;;
      "ua")
            bxoUidGidTag="user"
            bxoServiceType="BYNAME"
            bxoServiceSupportType="TRIAL"
            bxoDomainsList=("byname.com")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/${cp_nameSelector}/${cp_FirstName}"
            ;;
      "aa")
            bxoServiceType="BYALIAS"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("byname.net")
            thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
            ;;
      "au")
            bxoUidGidTag="aliasusr"
            bxoServiceType="BYALIAS"
            bxoServiceSupportType="TRIAL"
            bxoDomainsList=("byalias.com")
            thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
            ;;
      "ca")
            bxoServiceType="BCA"
            bxoServiceSupportType="COMMITTED"
            bxoDomainsList=("BCA")
            thisHomeDir="${iv_uidPolicy_homeDir}/${cp_acctNu}"
            ;;
      ##
      #####  BXO Generation
      ##
      "ai")
            bxoServiceType="BXO"
            bxoServiceSupportType="BXO"
            bxoDomainsList=("BXO")
            # thisHomeDir=$( FN_absolutePathGet ${cp_acctNu} )
            ;;
      
      *)
            EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
            return 101
    esac
  return 0
}


function bxoAcctAnalyze {
  EH_assert [[ $# -eq 1 ]]
  bxoUid=$1

  opAcctInfoGet ${bxoUid}
  EH_retOnFail

  bxo_acct_uid=${opAcct_uid}
  bxo_acct_homedir=${opAcct_homeDir}
  bxo_acct_NSPdir=${opAcct_homeDir}/NSP
  bxo_acct_acctTypePrefix=${bxoUid%%-*}

  #bxo_acct_decryptedPasswd=$( bxoAcctAdmin.sh -p bxoUid="${bxoUid}" -i acctPasswdGet )
  bxo_acct_decryptedPasswd="MissingBystarAcctAdmin.sh"
  bxoUidPasswdDecrypted=${bxo_acct_decryptedPasswd}

  bxoAcctPrefixAnalyze ${bxo_acct_acctTypePrefix}

            bxoServiceType="BYSMB"
            bxoServiceSupportType="COMMITTED"
            lpReturn

    case ${bxo_acct_acctTypePrefix} in 
      "ea")
            bxoServiceType="BYSMB"
            bxoServiceSupportType="COMMITTED"
            ;;
      "ma")
            bxoServiceType="BYMEMORY"
            bxoServiceSupportType="COMMITTED"
            ;;
      "mu")
            bxoServiceType="BYMEMORY"
            bxoServiceSupportType="TRIAL"
            ;;
      "sa")
            bxoServiceType="BYNAME"
            bxoServiceSupportType="COMMITTED"
            ;;
      "ua")
            bxoServiceType="BYNAME"
            bxoServiceSupportType="TRIAL"
            ;;
      "aa")
            bxoServiceType="BYALIAS"
            bxoServiceSupportType="COMMITTED"
            ;;
      "au")
            bxoServiceType="BYALIAS"
            bxoServiceSupportType="TRIAL"
            ;;
      "ca")
            bxoServiceType="BCA"
            bxoServiceSupportType="COMMITTED"
            ;;

      ##
      #####  BXO Generation
      ##
      "ai")
            bxoServiceType="BXO"
            bxoServiceSupportType="BXO"
            ;;
        *)
            EH_problem "Unknown ${bxo_acct_acctTypePrefix}"
            return 101
    esac

    # NOTYET, BAGP needs to be absorbed.

   bpoHome=$( FN_absolutePathGet ~${bxoUid} )
   opDo fileParamsLoadVarsFromBaseDir  ${bpoHome}/BAGP 2> /dev/null


  #. ${bxo_acct_NSPdir}/bxoSubscriberProfiles.nsp

  #if [[ "${bxo_acct_acctTypePrefix}_" == "ua_" ]] ; then
  #typeset subsSelectorType="t"
  #else
  #typeset subsSelectorType=""
  #fi
  #bxo_acct_baseDomain="${iv_subsFirstName}.${iv_subsLastName}.${subsSelectorType}${iv_subsSelector}.${bxoCluster_myDomain}"
  #bxo_acct_numberDomain="${bxo_acct_uid}.${bxoCluster_myDomainByNumber}"
  return 0
}

function bpoIdPrepValidate {
    # Backwards compatibility
    bpoIdPrep $@
}

function bpoIdPrepValidate%% {
    if [ $# -eq 0 ] && [ -n ${bpoId} ] ; then
       lpReturn
    fi
    bxoCentralPrep $@
}

function bxoCentralPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Returns none-zero for assertion 
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    bpoIdPrep

    lpReturn

    case ${bpoId} in 
      "")
            # EH_problem "bpoId=\"\" -- empty/blank -- invalid bxo"
            lpReturn 101
            ;;
      "INVALID"|"MANDATORY")
            EH_problem "bpoId=${bpoId} -- empty/blank -- invalid bxo"
            lpReturn 101
            ;;
      "current")
            lpCurrentsGet
            #if [ "${currentBystarUid}" != "" ] ; then
            if [ "${currentBxoId}" != "" ] ; then           
                bpoId=${currentBxoId}
            else
                EH_problem "bpoId=current But current is unset -- invalid bxo"
                lpReturn 101
            fi  
            ;;
      "prompt")
            echo -n "Specify bpoId: "
            read bpoId
            ;;
      "default")   # e.g., first applicable entry in /etc/passwd
            doNothing
            ;;  
      "all")
            doNothing
            ;;  
        *)
            doNothing
            ;;
    esac

    #lpDo bxoCentralIsValid 
    bxoCentralIsValid 
    EH_retOnFail

    lpReturn 0
}

function bxoCentralIsValid {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    case ${bpoId:-} in 
      "all")
            lpReturn 0
            ;;
        *)
            doNothing
    esac

    #
    # Verify that a given buid is in BxCentralInfoBase.
    #

    lpReturn 0
}

#
# NOTYET, Figure if this is totally unused.
#
function bystarCentral {
  EH_assert [[ $# -eq 0 ]]
  EH_assert [[ "${bpoId}_" != "INVALID_" ]]
}




function basicInfoLoad {
  typeset domainHost=${1}

  if [[ "${domainHost}_" == "bysmb.net_" || "${domainHost}_" == "bysmb.com_" || "${domainHost}_" == "libresite.org_" ]] ; then
    acct_group_uid="smb"
    acct_type="ea"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${domainName} ${domainNameExt}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${domainNameExt}/${domainName}"
  elif [[ "${domainHost}_" == "bymemory.net_" ]] ; then
    acct_group_uid="memory"
    acct_type="ma"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_FirstName} ${cp_LastName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
  elif [[ "${domainHost}_" == "bymemory.com_" ]] ; then
    acct_group_uid="memusr"
    acct_type="mu"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_FirstName} ${cp_LastName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${cp_LastName}/1/${cp_FirstName}"
  elif [[ "${domainHost}_" == "byalias.net_" ]] ; then
    acct_group_uid="alias"
    acct_type="aa"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${aliasName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
  elif [[ "${domainHost}_" == "byalias.com_" ]] ; then
    acct_group_uid="aliasusr"
    acct_type="au"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${aliasName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${aliasName}"
  elif [[ "${domainHost}_" == "byname.net_" ]] ; then
    acct_group_uid="subscriber"
    acct_type="sa"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="sa/1/${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/1/${cp_LastName}/${cp_FirstName}"
  elif [[ "${domainHost}_" == "byname.com_" ]] ; then
    acct_group_uid="user"
    acct_type="ua"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="ua/1/${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${cp_acctUidHome}"
  elif [[ "${domainHost}_" == "reserved_" ]] ; then
    acct_group_uid="reserved"
    acct_type="ca"
    opAcctUidGidAnalyze ${acct_group_uid}
    this_comment="${cp_LastName}/${cp_FirstName}"
    thisHomeDir="${iv_uidPolicy_homeDir}/${assignedUserIdNumber}"
  else
    EH_problem "Unknown domainHost=${domainHost}"
  fi

}

function checkAcctExist {

  typeset thisName="$@"

  typeset inEtcPasswd_userid=`cat /etc/passwd | grep -i ":${thisName}:" | cut -d: -f1`
  
  if [[ -n ${inEtcPasswd_userid} ]] ; then
    print "${inEtcPasswd_userid}"
    return 1
  else
    print "none"
    return 0
  fi
}


function developerVerify {
  if [ "${developer}X" == "NOTX" ] ; then
    EH_oops "developer has to be specified."
    exit 1
  fi

  case ${cvsMode} in
    "READ")
      cvsRootParameter="cvsRoot_bySourceCvs1Pserver"
      readEditPathOffSet="/readonly"
      ;;
    "EDIT")
      cvsRootParameter="cvsRoot_bySourceCvs1Ssh"
      readEditPathOffSet=""
      ;;
    *)
          EH_problem "unknown cvsMode ${cvsMode}"
          ;;
  esac

  mirrorBxoAccountsBase="/mirror/bxo/accounts"

}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== bxoSrAnalyze
_CommentEnd_

function bxoSrAnalyze {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if [ -z "${ss}" ] ; then
        EH_problem "Missing Service Realiztion Specification"
        lpReturn 101
    fi

    srBaseDir="${bpoHome}/${ss}"

    if [ ! -d ${srBaseDir} ] ; then 
        EH_problem "Missing srBaseDir=${srBaseDir}"
        lpReturn 101
    fi

    srAgent="${bpoHome}/${ss}/bsrAgent.sh"

    if [ ! -f ${srAgent} ] ; then 
        srAgent="${bpoHome}/${sr}/srAgent.sh"
        if [ ! -f ${srAgent} ] ; then 
            EH_problem "Missing srAgent=${srAgent} and also missing bsrAgent.sh"
            lpReturn 101
        fi
    fi

    srDomName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srDomNameGet 2> /dev/null )
    if [ -z ${srDomName} ] ; then 
        EH_problem "Blank srDomName"
    fi 

    srFqdn=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srFqdnGet 2> /dev/null )
    if [ -z ${srFqdn} ] ; then 
        EH_problem "Blank srFqdn"
    fi 

    svcName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcNameGet 2> /dev/null )
    if [ -z ${svcName} ] ; then 
        EH_problem "Blank svcName"
    fi 

    svcCapabilityName=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityNameGet 2> /dev/null )
    if [ -z ${svcCapabilityName} ] ; then 
        EH_problem "Blank svcCapabilityName"
    fi 

    svcCapabilityAgent=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityAgentGet 2> /dev/null )
    if [ -z ${svcCapabilityAgent} ] ; then 
        EH_problem "Blank svcCapabilityAgent"
    fi 

    svcCapabilityFlavor=$( inBaseDirDo ${srBaseDir} ${srAgent} -i svcCapabilityFlavorGet 2> /dev/null )
    if [ -z ${svcCapabilityFlavor} ] ; then 
        EH_problem "Blank svcCapabilityFlavor"
    fi 
    
    srSvcBaseLogs=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseLogs 2> /dev/null )
    if [ -z ${srSvcBaseLogs} ] ; then 
        EH_problem "Blank srSvcBaseLogs"
    fi 

    srSvcBaseData=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseData 2> /dev/null )
    if [ -z ${srSvcBaseData} ] ; then 
        EH_problem "Blank srSvcBaseData"
    fi 

    srSvcBaseControl=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseControl 2> /dev/null )
    if [ -z ${srSvcBaseControl} ] ; then 
        EH_problem "Blank srSvcBaseControl"
    fi 

    srSvcBaseTmp=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseTmp 2> /dev/null )
    if [ -z ${srSvcBaseTmp} ] ; then 
        EH_problem "Blank srSvcBaseTmp"
    fi 

    srSvcBaseMailDir=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srSvcBaseMailDir 2> /dev/null )
    if [ -z ${srSvcBaseMailDir} ] ; then 
        EH_problem "Blank srSvcBaseMailDir"
    fi 
    

    # Historic -- Obsoleted
    # srLogsBase=$( inBaseDirDo ${srBaseDir} ${srAgent} -i srLogsBase  2> /dev/null )
    # if [ -z ${srLogsBase} ] ; then 
    #   EH_problem "Blank srLogsBase"
    # fi 

    # Historic -- Obsoleted
    srA2LogBaseDir=$(vis_srA2LogBaseDirGet ${srFqdn})
    if [ -z "${srA2LogBaseDir}" ] ; then
        EH_problem "Missing srA2LogBaseDir"
        lpReturn
    fi


    #echo ${bxoUid} ${bpoHome} ${sr} ${srFqdn}

    return
}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== srA2VirDomFileNameGet -- Name Of The File Based on srFqdn
_CommentEnd_


function vis_srBaseDirGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bpoHome} and \${sr} using bsrAgent.sh get srFqdn
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    EH_assert bpoIdPrep
    # opDoRet bxoAcctAnalyze ${bpoId}

    if [ -z "${ss}" ] ; then
        EH_problem ""
        lpReturn
    fi

    echo ${bpoHome}/${ss}

    lpReturn
}


function vis_srFqdnGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
With \${bpoHome} and \${sr} using bsrAgent.sh get srFqdn
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    typeset srBaseDir="$1"
    typeset srFqdn=$( inBaseDirDo ${srBaseDir} bsrAgent.sh -i srFqdnGet )

    echo ${srFqdn}

    lpReturn
}

function vis_srA2LogBaseDirGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]
    EH_assert bpoIdPrep
    opDoRet bxoAcctAnalyze ${bpoId}

    typeset srFqdn=$1

    echo ${bpoHome}/var/log/apache2/${srFqdn}

    lpReturn
}


function vis_srA2VirDomFileNameGet {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    typeset srFqdn=$(vis_srFqdnGet $(vis_srBaseDirGet))
    if [ -z "${srFqdn}" ] ; then
        EH_problem ""
        lpReturn
    fi

    echo "/etc/apache2/sites-available/${srFqdn}.conf"

    lpReturn
}


    # if [ -z "${sr}" ] ; then
    #   EH_problem ""
    #   lpReturn
    # fi

    # typeset srBaseDir=$(vis_srBaseDirGet)
    # if [ -z "${srBaseDir}" ] ; then
    #   EH_problem ""
    #   lpReturn
    # fi

    # typeset srFqdn=$(vis_srFqdnGet ${srBaseDir})
    # if [ -z "${srFqdn}" ] ; then
    #   EH_problem ""
    #   lpReturn
    # fi

    # typeset srA2LogBaseDir=$(vis_srA2LogBaseDirGet ${srFqdn})
    # if [ -z "${srA2LogBaseDir}" ] ; then
    #   EH_problem ""
    #   lpReturn
    # fi

