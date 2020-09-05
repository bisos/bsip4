#!/bin/bash

IcmBriefDescription="Build And Install Emacs Based On The Official source distribution (git and tar)"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:dblock:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: lcaEmacsSrcBinsPrep.sh,v 1.11 2020-05-18 02:47:44 lsipusr Exp $"
# *CopyLeft*
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaEmacsSrcBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 
####+END:
_CommentEnd_

_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || TODOs     ::  Status, Notes, Todos    [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_


** TODO [#A] Capture as template and include in begin and start. etc.
   SCHEDULED: <2019-07-25 Thu>
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_moduleDescription    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/blee/lcntPublications/lcntModel/fullUsagePanel-en.org::seedLcntProc.sh][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Imports   ::  Prefaces (Imports/Libraries)    [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/lpInBaseDirDo.libSh

. ${opBinBase}/distHook.libSh

# PRE parameters

baseDir=""

srcObtainForm="git"

#
# BEGIN PKG Base Variables
#
#srcPkgName="emacs-24.5"
#srcPkgName="emacs-25.1"

emacsVerLatest="emacs28"
emacsVerCurrent="emacs27"

srcPkgName="${emacsVerCurrent}"

srcBuildScript=""
srcBuildScriptTmpDir=/tmp/"${srcPkgName}"
srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}-tar"

distEmacsTarFile=${srcPkgName}.tar
distEmacsTarUrl="http://ftp.gnu.org/pub/gnu/emacs/${distEmacsTarFile}.gz"

prepCmndLine=""

#
#
# END PKG Base Variables
#

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]   *Examples*      :: /ICM Examples/ [[elisp:(org-cycle)][| ]]
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || IIF       ::  vis_examples    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Full Service" )
${G_myName} ${extraInfo} -i srcFullBuild
$( examplesSeperatorChapter "Build In Steps With srcPkgSelector" )
srcPkgSelector is one of: emacsVer =  latest current emacs27 emacs26 emacs25 emacs24
$( examplesSeperatorSection "srcEnvSetup:: Setup (apt install) Needed Packages For Buidling" )
${G_myName} ${extraInfo} -i srcEnvSetup # defaults to latest
${G_myName} ${extraInfo} -i srcEnvSetup current
${G_myName} ${extraInfo} -i srcEnvSetup emacs28
${G_myName} ${extraInfo} -i srcEnvSetup emacs27
${G_myName} ${extraInfo} -i srcEnvSetup emacs26
$( examplesSeperatorSection "srcPkgSpecPrep:: determine key params for specified emacs version" )
${G_myName} ${extraInfo} -i srcPkgSpecPrep # defaults to latest
${G_myName} ${extraInfo} -i srcPkgSpecPrep current
${G_myName} ${extraInfo} -i srcPkgSpecPrep emacs28
${G_myName} ${extraInfo} -i srcPkgSpecPrep emacs27
${G_myName} ${extraInfo} -i srcPkgSpecPrep emacs26
$( examplesSeperatorSection "srcPkgObtain:: git clone or wget file.tar -- Get The Sources" )
${G_myName} ${extraInfo} -i srcPkgObtain # defaults to latest
${G_myName} ${extraInfo} -i srcPkgObtain current
${G_myName} ${extraInfo} -i srcPkgObtain emacs28
${G_myName} ${extraInfo} -i srcPkgObtain emacs27
${G_myName} ${extraInfo} -i srcPkgObtain emacs26
$( examplesSeperatorSection "srcBuild:: make config; make bootstrap -- Build With Sources" )
${G_myName} ${extraInfo} -i srcBuild # defaults to latest
${G_myName} ${extraInfo} -i srcBuild current
${G_myName} ${extraInfo} -i srcBuild emacs28
${G_myName} ${extraInfo} -i srcBuild emacs27
${G_myName} ${extraInfo} -i srcBuild emacs26
$( examplesSeperatorChapter "srcBinInstall:: sudo make install -- Install Build Results" )
${G_myName} ${extraInfo} -i srcBinInstall # defaults to latest
${G_myName} ${extraInfo} -i srcBinInstall current
${G_myName} ${extraInfo} -i srcBinInstall emacs28
${G_myName} ${extraInfo} -i srcBinInstall emacs27
${G_myName} ${extraInfo} -i srcBinInstall emacs26
$( examplesSeperatorChapter "postInstall:: " )
${G_myName} ${extraInfo} -i postInstall # defaults to latest
${G_myName} ${extraInfo} -i postInstall current
${G_myName} ${extraInfo} -i postInstall emacs28
${G_myName} ${extraInfo} -i postInstall emacs27
${G_myName} ${extraInfo} -i postInstall emacs26
$( examplesSeperatorChapter "srcFullBuild:: srcEnvSetup + obtain + build + install -- Full Service" )
$( examplesSeperatorChapter "srcFullBuild:: when rebuilding is desired specify -f (forceMode) " )
${G_myName} ${extraInfo} -i srcFullBuild # defaults to latest
${G_myName} ${extraInfo} -i srcFullBuild current
${G_myName} ${extraInfo} -i srcFullBuild emacs28
${G_myName} ${extraInfo} -i srcFullBuild emacs27
${G_myName} ${extraInfo} -i srcFullBuild emacs26
$( examplesSeperatorChapter "Installation Verification:: Is Specified Emacs Installed?" )
${G_myName} ${extraInfo} -i installedVerify # defaults to latest
${G_myName} ${extraInfo} -i installedVerify current
${G_myName} ${extraInfo} -i installedVerify emacs28
${G_myName} ${extraInfo} -i installedVerify emacs27
${G_myName} ${extraInfo} -i installedVerify emacs26
_EOF_
}

noArgsHook() {
  vis_examples
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Config Params*  :: /Configuration Parameters/  [[elisp:(org-cycle)][| ]]
_CommentEnd_



#
# binPkgName
#

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Func      ::  vis_srcPkgSpecPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_srcPkgSpecPrep {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
$1 is one of:
latest
current
emacs28
emacs27
emacs26
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi
   
    opDo emacsVerCanonicalized    

    function srcPkgSpecPrep_emacs28_git {
	srcPkgName="emacs-28"
       
	srcBuildScript=""
	srcBuildScriptTmpDir=/tmp/"${srcPkgName}"
	
	srcObtainBaseDir="/bisos/var/srcPkgs/${srcPkgName}"
	# -- depth 1 of git clone, copies only the latest revision 
	#obtainCmndLine="git clone --depth 1 git://git.sv.gnu.org/emacs.git"
	obtainCmndLine="obtainOrUpdateSrc_emacs28"

	srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}/emacs"	
    }

    function srcPkgSpecPrep_emacs27_git {
	srcPkgName="emacs-27"
	srcBuildScript=""
	srcBuildScriptTmpDir=/tmp/"${srcPkgName}"

	srcObtainBaseDir="/bisos/var/srcPkgs/${srcPkgName}"
	# -- depth 1 of git clone, copies only the latest revision 
	obtainCmndLine="git clone --single-branch -b emacs-27 git://git.sv.gnu.org/emacs.git"

	srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}/emacs"	
    }

    function srcPkgSpecPrep_emacs27_tar {
	srcPkgName="emacs-27"
	srcBuildScript=""
	srcBuildScriptTmpDir=/tmp/"${srcPkgName}"
	srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}-tar"

        distEmacsTarFile=${srcPkgName}.tar
	distEmacsTarUrl="http://ftp.gnu.org/pub/gnu/emacs/${distEmacsTarFile}.gz"
    }

    
    function srcPkgSpecPrep_dispatch {
	local emacsVer="$1"
	
	if [ "${srcObtainForm}" == "git" ] ; then
	    opDo srcPkgSpecPrep_${emacsVer}_git
	elif [ "${srcObtainForm}" == "tar" ] ; then
	    opDo srcPkgSpecPrep_${emacsVer}_tar
	else
	    EH_problem "Bad srcObtainForm -- specify srcObtainForm='git|tar'"
	    lpReturn 101
	fi
    }

    if [ "${srcPkgSelector}" == "emacs28" ] ; then
	opDoRet srcPkgSpecPrep_dispatch emacs28

    elif [ "${srcPkgSelector}" == "emacs27" ] ; then
	opDoRet srcPkgSpecPrep_dispatch emacs27
	
    elif [ "${srcPkgSelector}" == "emacs-26" ] ; then
	# http://ftp.gnu.org/pub/gnu/emacs/
	srcPkgName="emacs-26.3"
	srcObtainBaseDir="/bisos/var/srcPkgs/${srcPkgName}"
	
        distEmacsTarFile=${srcPkgName}.tar
	distEmacsTarUrl="http://ftp.gnu.org/pub/gnu/emacs/${distEmacsTarFile}.gz"

	obtainCmndLine="wget ${distEmacsTarUrl}"
	prepCmndLine="tar -zxf ${distEmacsTarFile}.gz"

	srcBuildScriptTmpDir=/tmp/"${srcPkgName}"
	srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}/${srcPkgName}"
    	srcBuildScript="vis_srcBuild_26"

    	srcInstallScript="vis_srcBinInstall_common"	

    elif [ "${srcPkgSelector}" == "emacs-25" ] ; then		
	srcPkgName="emacs-25.1"
	srcBuildScript=""
	srcBuildScriptTmpDir=/tmp/"${srcPkgName}"
	srcBuildBaseDir="/bisos/var/srcPkgs/${srcPkgName}-tar"

        distEmacsTarFile=${srcPkgName}.tar
	distEmacsTarUrl="http://ftp.gnu.org/pub/gnu/emacs/${distEmacsTarFile}.gz"
    else
	EH_problem "Bad srcPkgSelector=${srcPkgSelector}"
    fi

    # NOTYET split the description based on srcObtainForm
    
    echo "${srcPkgName}"
    echo "srcObtainForm=${srcObtainForm}"    
    echo "distEmacsTarUrl=${distEmacsTarUrl}"
    echo "srcObtainBaseDir=${srcObtainBaseDir}"
    echo "srcBuildBaseDir=${srcBuildBaseDir}"
    echo "obtainCmndLine=${obtainCmndLine}"
    echo "prepCmndLine=${prepCmndLine}"    

    lpReturn
}	


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Setup Build  Environment/ srcEnvSetup  -- apt-get needed packages [[elisp:(org-cycle)][| ]]
_CommentEnd_

####+BEGINNOT: blee:bxPanel:runResult :outLevel 1  :command "apt-cache depends emacs25"  :results nil :comment "List of needed packages for emacs" :afterComment ""
_CommentBegin_
* TODO [[elisp:(show-all)][(>]] [[elisp:(blee:menu-sel:outline:popupMenu)][+-]] [[elisp:(blee:menu-sel:navigation:popupMenu)][==]]     [[elisp:(lsip-local-run-command "apt-cache depends emacs25")][apt-cache depends emacs25]] ~||~  =List of needed packages for emacs=   [[elisp:(org-shifttab)][<)]] E|
_CommentEnd_
####+END:

function emacsVerCanonicalized {
    if [ "${srcPkgSelector}" == "latest" ] ; then
	srcPkgSelector=${emacsVerLatest}
    elif [ "${srcPkgSelector}" == "current" ] ; then
	srcPkgSelector=${emacsVerCurrent}
    else
	opDo doNothing
    fi
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcEnvSetup    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcEnvSetup {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized    
    
    opDo vis_srcEnvSetup_${srcPkgSelector}

    lpReturn
}	

function vis_srcEnvSetup_buildPreRequisites {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
If needed, this should become opRunDistGeneration specific
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDo apt-get -y install  git-core
    opDo apt-get -y install  git
    
    opDo apt-get -y install  autoconf
    opDo apt-get -y install  automake
    opDo apt-get -y install  libtool
    opDo apt-get -y install  texinfo
    opDo apt-get -y install  build-essential
    opDo apt-get -y install  xorg-dev
}    

function vis_srcEnvSetup_distroGeneration {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

Based on the standard distribution of emacs for the distro and distroGeneration We use the
standard emacs as distributed on distroGeneration as a starting point.

We install needed development packages with "sudo apt-get -y build-dep emacs". This
dependes on deb-src in /etc/apt/sources.list.
Run:
  debAptSourcesManage.sh -h -v -n showRun -i enableDebSrc
to enable deb-src.

We also make sure that needed run time packages are in place based on:

At this time, this script supports: 
    Ubuntu 20.04, Ubuntu 18.04, Ubuntu 16.04
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]
    local retVal=0

    lpDo debAptSourcesManage.sh -h -v -n showRun -i verifyDebSrc
    retVal=$?
    
    if [ ${retVal} != 0 ] ; then
	lpDo debAptSourcesManage.sh -h -v -n showRun -i enableDebSrc
    fi

    # With sources enabled, we now can run: apt-get -y build-dep emacs

    if [ "${opRunDistGeneration}" == "2004" ] ; then
	
	# -------- Development Pkgs -----------
	#
	opDo apt-get -y build-dep emacs
	
	# On a fresh ubuntu 20.04 system -- for emacs-gtk is emacs26 as distributed with 20.04
	# The following NEW packages will be installed:
	# autopoint debhelper dh-autoreconf dh-strip-nondeterminism dwz imagemagick
	# imagemagick-6.q16 libacl1-dev libasound2-dev libattr1-dev libbz2-dev
	# libdebhelper-perl libdjvulibre-dev libexif-dev libfile-stripnondeterminism-perl
	# libgpm-dev libilmbase-dev liblcms2-dev liblockfile-bin liblockfile-dev
	# liblockfile1 liblqr-1-0-dev libm17n-dev libmagick++-6-headers libmagick++-6.q16-8
	# libmagick++-6.q16-dev libmagickcore-6-arch-config libmagickcore-6-headers
	# libmagickcore-6.q16-6-extra libmagickcore-6.q16-dev libmagickwand-6-headers
	# libmagickwand-6.q16-dev libopenexr-dev libotf-dev librsvg2-dev
	# libsub-override-perl libsystemd-dev libwmf-dev po-debconf quilt sharutils xaw3dg
	# xaw3dg-dev xutils-dev
	#
	
	# emacs-gtk is emacs26 as distributed with 20.04
	#  apt-cache depends emacs-gtk | grep Depends: | grep -v emacs | cut -d ':' -f 2 | sed -e 's/^/opDo apt-get -y install /'
	# ----- BEGIN  (emacs26 on 20.04) ------------
	# -------- Run Time Pkgs -----------
	opDo apt-get -y install  libacl1
	opDo apt-get -y install  libasound2
	opDo apt-get -y install  libc6
	opDo apt-get -y install  libcairo2
	opDo apt-get -y install  libdbus-1-3
	opDo apt-get -y install  libfontconfig1
	opDo apt-get -y install  libfreetype6
	opDo apt-get -y install  libgdk-pixbuf2.0-0
	opDo apt-get -y install  libgif7
	opDo apt-get -y install  libglib2.0-0
	opDo apt-get -y install  libgnutls30
	opDo apt-get -y install  libgpm2
	opDo apt-get -y install  libgtk-3-0
	opDo apt-get -y install  libice6
	opDo apt-get -y install  libjpeg8
	opDo apt-get -y install  liblcms2-2
	opDo apt-get -y install  libm17n-0
	opDo apt-get -y install  libmagickcore-6.q16-6
	opDo apt-get -y install  libmagickwand-6.q16-6
	opDo apt-get -y install  libotf0
	opDo apt-get -y install  libpango-1.0-0
	opDo apt-get -y install  libpng16-16
	opDo apt-get -y install  librsvg2-2
	opDo apt-get -y install  libselinux1
	opDo apt-get -y install  libsm6
	opDo apt-get -y install  libsystemd0
	opDo apt-get -y install  libtiff5
	opDo apt-get -y install  libtinfo6
	opDo apt-get -y install  libx11-6
	opDo apt-get -y install  libxext6
	opDo apt-get -y install  libxfixes3
	opDo apt-get -y install  libxft2
	opDo apt-get -y install  libxml2
	opDo apt-get -y install  libxpm4
	opDo apt-get -y install  libxrender1
	opDo apt-get -y install  zlib1g
	# ----- END  (emacs26 on ubuntu 20.04) ------------

    elif [ "${opRunDistGeneration}" == "1804" ] ; then

	# -------- Development Pkgs -----------
	#
	opDo apt-get -y build-dep emacs25
	
	# On a fresh ubuntu 18.04 system
	# The following NEW packages will be installed:
	# 

	# emacs25 as distributed with 18.04
	#  apt-cache depends emacs25 | grep Depends: | grep -v emacs | cut -d ':' -f 2 | sed -e 's/^/opDo apt-get -y install /'
	# ----- BEGIN  (emacs25 on 18.04) ------------
	# -------- Run Time Pkgs -----------
	opDo apt-get -y install  gconf-service
	opDo apt-get -y install  libasound2
	opDo apt-get -y install  libc6
	opDo apt-get -y install  libcairo2
	opDo apt-get -y install  libdbus-1-3
	opDo apt-get -y install  libfontconfig1
	opDo apt-get -y install  libfreetype6
	opDo apt-get -y install  libgconf-2-4
	opDo apt-get -y install  libgdk-pixbuf2.0-0
	opDo apt-get -y install  libgif7
	opDo apt-get -y install  libglib2.0-0
	opDo apt-get -y install  libgnutls30
	opDo apt-get -y install  libgpm2
	opDo apt-get -y install  libgtk-3-0
	opDo apt-get -y install  libice6
	opDo apt-get -y install  libjpeg8
	opDo apt-get -y install  liblockfile1
	opDo apt-get -y install  libm17n-0
	opDo apt-get -y install  libmagickcore-6.q16-3
	opDo apt-get -y install  libmagickwand-6.q16-3
	opDo apt-get -y install  libotf0
	opDo apt-get -y install  libpango-1.0-0
	opDo apt-get -y install  libpng16-16
	opDo apt-get -y install  librsvg2-2
	opDo apt-get -y install  libselinux1
	opDo apt-get -y install  libsm6
	opDo apt-get -y install  libtiff5
	opDo apt-get -y install  libtinfo5
	opDo apt-get -y install  libx11-6
	opDo apt-get -y install  libx11-xcb1
	opDo apt-get -y install  libxcb1
	opDo apt-get -y install  libxfixes3
	opDo apt-get -y install  libxft2
	opDo apt-get -y install  libxml2
	opDo apt-get -y install  libxpm4
	opDo apt-get -y install  libxrender1
	opDo apt-get -y install  zlib1g
	# ----- END  (emacs25 on ubuntu 18.04) ------------
	
    elif [ "${opRunDistGeneration}" == "1604" ] ; then

	# -------- Development Pkgs -----------
	#
	opDo apt-get -y build-dep emacs24
	
	# On a fresh ubuntu 16.04 system
	# The following NEW packages will be installed:
	# 
	# bsd-mailx gir1.2-gconf-2.0 libacl1-dev libasound2-dev libattr1-dev libbz2-dev
	# libdjvulibre-dev libexif-dev libgconf2-dev libgpm-dev libgraphviz-dev
	# libgvc6-plugins-gtk libilmbase-dev libjasper-dev liblcms2-dev liblockfile-dev
	# liblqr-1-0-dev libmagick++-6-headers libmagick++-6.q16-dev libmagick++-dev
	# libmagickcore-6-arch-config libmagickcore-6-headers libmagickcore-6.q16-dev
	# libmagickwand-6-headers libmagickwand-6.q16-dev libopenexr-dev libselinux1-dev
	# libsepol1-dev libwmf-dev libxdot4 quilt xaw3dg-dev xutils-dev

	# emacs24 as distributed with 16.04
	#  apt-cache depends emacs24 | grep Depends: | grep -v emacs | cut -d ':' -f 2 | sed -e 's/^/opDo apt-get -y install /'
	# ----- BEGIN  (emacs24 on 16.04) ------------
	# -------- Run Time Pkgs -----------
	opDo apt-get -y install  gconf-service
	opDo apt-get -y install  libacl1
	opDo apt-get -y install  libasound2
	opDo apt-get -y install  libc6
	opDo apt-get -y install  libcairo2
	opDo apt-get -y install  libdbus-1-3
	opDo apt-get -y install  libfontconfig1
	opDo apt-get -y install  libfreetype6
	opDo apt-get -y install  libgconf-2-4
	opDo apt-get -y install  libgdk-pixbuf2.0-0
	opDo apt-get -y install  libgif7
	opDo apt-get -y install  libglib2.0-0
	opDo apt-get -y install  libgnutls30
	opDo apt-get -y install  libgpm2
	opDo apt-get -y install  libgtk-3-0
	opDo apt-get -y install  libice6
	opDo apt-get -y install  libjpeg8
	opDo apt-get -y install  libm17n-0
	opDo apt-get -y install  libmagickcore-6.q16-2
	opDo apt-get -y install  libmagickwand-6.q16-2
	opDo apt-get -y install  libotf0
	opDo apt-get -y install  libpango-1.0-0
	opDo apt-get -y install  libpng12-0
	opDo apt-get -y install  librsvg2-2
	opDo apt-get -y install  libselinux1
	opDo apt-get -y install  libsm6
	opDo apt-get -y install  libtiff5
	opDo apt-get -y install  libtinfo5
	opDo apt-get -y install  libx11-6
	opDo apt-get -y install  libxft2
	opDo apt-get -y install  libxml2
	opDo apt-get -y install  libxpm4
	opDo apt-get -y install  libxrender1
	opDo apt-get -y install  zlib1g
	# ----- END  (emacs24 on ubuntu 16.04) ------------
	
    else
	EH_problem "Unsupported Distro and DistroGeneration=${opRunDistGeneration}"
    fi
}



function vis_srcEnvSetup_emacs28 { opDo vis_srcEnvSetup_emacs27; }
    

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcEnvSetup_27    [[elisp:(org-cycle)][| ]]
_CommentEnd_

#  apt-cache depends emacs-gtk | grep Depends: | grep -v emacs | cut -d ':' -f 2 | sed -e 's/^/opDo apt-get -y install /'

function vis_srcEnvSetup_emacs27 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo vis_srcEnvSetup_buildPreRequisites

    opDo vis_srcEnvSetup_distroGeneration    
    
    if [ "${opRunDistGeneration}" == "2004" ] ; then
	#

	opDo apt-get -y install  libjpeg-dev
	opDo apt-get -y install  libtiff-dev
	opDo apt-get -y install  libncurses5-dev
	opDo apt-get -y install  libgif-dev      # NOTYET double check on need for this
	opDo apt-get -y install  libpng12-dev
	opDo apt-get -y install  librsvg2-dev
	opDo apt-get -y install  libotf-dev
	
	opDo apt-get -y install  libgnutls28-dev # NOTYET double check on need for this

	opDo apt-get -y install  libwebkit2gtk-4.0-dev
	opDo apt-get -y install  libwebkit2gtk-4.0-37-gtk2  # NOTYET, is this needed

	opDo apt-get -y install  libm17n-dev
	opDo apt-get -y install  libharfbuzz-dev     # shaping for farsi/arabic

    elif [ "${opRunDistGeneration}" == "1804" ] ; then
	#

	opDo apt-get -y install libgif-dev      # NOTYET double check on need for this
	opDo apt-get -y install libgnutls28-dev # NOTYET double check on need for this
	opDo apt-get -y install libwebkit2gtk-4.0-dev	
	opDo apt-get -y install libwebkit2gtk-4.0-37-gtk2	
	opDo apt-get -y install libharfbuzz-dev     # shaping for farsi/arabic

    elif [ "${opRunDistGeneration}" == "1604" ] ; then
	#
	opDo apt-get -y install libgif-dev      # NOTYET double check on need for this
	opDo apt-get -y install libgnutls28-dev # NOTYET double check on need for this
	opDo apt-get -y install libwebkit2gtk-4.0-dev	
	opDo apt-get -y install libwebkit2gtk-4.0-37-gtk2  # libwebkit2gtk-4.0-dev	
	opDo apt-get -y install libharfbuzz-dev     # shaping for farsi/arabic

    else
	EH_problem "Unsupported Distro and Generation -- ${opRunDistGeneration}"
    fi
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcEnvSetup_26    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcEnvSetup_26 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo apt-get -y install  git-core
    opDo apt-get -y install  git
    opDo apt-get -y install  autoconf
    opDo apt-get -y install  texinfo
    opDo apt-get -y install  libncurses5-dev
    opDo apt-get -y install  build-essential
    opDo apt-get -y install  xorg-dev
    opDo apt-get -y install  libjpg-dev
    opDo apt-get -y install  libgif-dev
    opDo apt-get -y install  libtiff-dev
    opDo apt-get -y install  libm17n-dev
    opDo apt-get -y install  libpng12-dev
    opDo apt-get -y install  librsvg2-dev
    opDo apt-get -y install  libotf-dev

    opDo apt-get -y install  libgtk-3-dev
    opDo apt-get -y install  libwebkitgtk-3.0-dev
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcEnvSetup_25    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcEnvSetup_25 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo apt-get -y install  git-core
    opDo apt-get -y install  git
    opDo apt-get -y install  autoconf
    opDo apt-get -y install  texinfo
    opDo apt-get -y install  libncurses5-dev
    opDo apt-get -y install  build-essential
    opDo apt-get -y install  xorg-dev
    opDo apt-get -y install  libjpg-dev
    opDo apt-get -y install  libgif-dev
    opDo apt-get -y install  libtiff-dev
    opDo apt-get -y install  libm17n-dev
    opDo apt-get -y install  libpng12-dev
    opDo apt-get -y install  librsvg2-dev
    opDo apt-get -y install  libotf-dev

    opDo apt-get -y install  libgtk-3-dev
    opDo apt-get -y install  libwebkitgtk-3.0-dev
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcEnvSetup_24    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcEnvSetup_24 {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    opDo apt-get -y install  git-core
    opDo apt-get -y install  git
    opDo apt-get -y install  autoconf
    opDo apt-get -y install  texinfo
    opDo apt-get -y install  libncurses5-dev
    opDo apt-get -y install  build-essential
    opDo apt-get -y install  xorg-dev
    opDo apt-get -y install  libgtk2.0-dev
    opDo apt-get -y install  libjpg-dev
    opDo apt-get -y install  libgif-dev
    opDo apt-get -y install  libtiff-dev
    opDo apt-get -y install  libm17n-dev
    opDo apt-get -y install  libpng12-dev
    opDo apt-get -y install  librsvg2-dev
    opDo apt-get -y install  libotf-dev
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Obtain Sources/ [[elisp:(org-cycle)][| ]]
_CommentEnd_




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcPkgObtain    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcPkgObtain {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized    
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}

    opDoExit mkdir -p ${srcObtainBaseDir}

    inBaseDirDo ${srcObtainBaseDir} ${obtainCmndLine}

}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || IIC       ::  vis_obtainOrUpdateSrc_emacs28    [[elisp:(org-cycle)][| ]]
_CommentEnd_


function obtainOrUpdateSrc_emacs28 {
   G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    local cwd=$( pwd )
    local emacsDir=$( FN_absolutePathGet ./emacs )
    local gitDir=$( inBaseDirDo ${emacsDir} git rev-parse --show-toplevel )

    if [ -d "${emacsDir}" ] ; then
	if [ "${emacsDir}" == "${gitDir}" ] ; then
	    inBaseDirDo ${emacsDir} git pull
	else
	    EH_problem "${emacsDir} is not a git base"
	    lpReturn 101
	fi
    else
	# -- depth 1 of git clone, copies only the latest revision	
	opDo git clone --depth 1 git://git.sv.gnu.org/emacs.git
    fi
    lpReturn
}	




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcPkgPrep    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcPkgPrepDefunct {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
This can likely be eliminated and absorbed in obtainSrc
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}

    inBaseDirDo ${srcObtainBaseDir} ${prepCmndLine}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Build From Sources/ [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBuild {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized    
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}    

    opDo vis_srcBuild_${srcPkgSelector}
}


function vis_srcBuild_emacs28 { opDo vis_srcBuild_default; }
function vis_srcBuild_emacs27 { opDo vis_srcBuild_default; }

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_latest    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBuild_default {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    opDo vis_srcPkgSpecPrep ${srcPkgSelector}

    if [ ! -d ${srcBuildBaseDir} ] ; then
	EH_problem "Unreachable srcBuildBaseDir=${srcBuildBaseDir}"
	return
    fi

    inBaseDirDo ${srcBuildBaseDir} ./autogen.sh

    # For ./configure we are accepting  --with-xwidgets 
    inBaseDirDo ${srcBuildBaseDir} ./configure  

    inBaseDirDo ${srcBuildBaseDir} make bootstrap
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_25    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBuild_26 {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDoExit cd ${srcBuildBaseDir}

    opDo ./configure
    opDo make
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_25    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBuild_25 {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDoExit cd ${srcBuildBaseDir}/${srcPkgName}

    opDo ./configure  --with-cairo --with-xwidgets --with-x-toolkit=gtk3
    opDo make
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_24    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBuild_24 {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }
    EH_assert [[ $# -eq 0 ]]

    opDoExit cd ${srcBuildBaseDir}/${srcPkgName}

    opDo ./configure
    opDo make
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Install Results/ [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBinInstall    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBinInstall {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}     

    opDo vis_srcBinInstall_common
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_latest    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBinInstall_common {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    if [ ! -d ${srcBuildBaseDir} ] ; then
	EH_problem "Unreachable srcBuildBaseDir=${srcBuildBaseDir}"
	return
    fi

    inBaseDirDo ${srcBuildBaseDir} sudo make install
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcBuild_latest    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcBinInstall_latest {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    opDo vis_srcPkgSpecPrep ${srcPkgSelector}

    if [ ! -d ${srcBuildBaseDir} ] ; then
	EH_problem "Unreachable srcBuildBaseDir=${srcBuildBaseDir}"
	return
    fi

    opDo vis_srcPkgSpecPrep ${srcPkgSelector}
    
    inBaseDirDo ${srcBuildBaseDir} sudo make install
}



_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Post Install/ [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_postInstall    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_postInstall {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
To be run after installation of emacs (vis_srcBinInstall)
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}     

    opDo vis_postInstall_common
}


function vis_postInstall_common {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
For example, for emacs-28 take care of the following:
  ln -s /usr/local/bin/emacs-28.0.50 /usr/local/bin/emacs-28
  mv /usr/local/bin/emacsclient  /usr/local/bin/emacsclient-28.0.50
  ln -s /usr/local/bin/emacsclient-28.0.50 /usr/local/bin/emacsclient-28
  rm /usr/local/bin/emacs # which was symlinked to /usr/local/bin/emacs-28.0.50
_EOF_
		       }

    local emacsVersion=${srcPkgSelector##emacs}  # eg, 28 - emacs front stripped from emacs28 
    
    local emacsProg=$( echo /usr/local/bin/emacs-${emacsVersion}.* )
    local emacsClientFullVersion=$( /usr/local/bin/emacsclient --version | cut -d ' ' -f 2 )
    local emacsClientVersion=$( /usr/local/bin/emacsclient --version | cut -d ' ' -f 2 | cut -d '.' -f 1 )

    opDo FN_fileSymlinkUpdate ${emacsProg}  /usr/local/bin/emacs-${emacsVersion}

    opDo FN_fileSymlinkRemoveIfThere /usr/local/bin/emacs

    if [ -z "${emacsClientFullVersion}" ] ; then
	EH_problem "Missing /usr/local/bin/emacsclient"
	lpReturn
    fi       
    
    if [ "${emacsClientVersion}" == "${emacsVersion}" ] ; then
	opDo mv /usr/local/bin/emacsclient  /usr/local/bin/emacsclient-${emacsClientFullVersion}
	FN_fileSymlinkUpdate /usr/local/bin/emacsclient-${emacsClientFullVersion} /usr/local/bin/emacsclient-${emacsClientVersion}
    else
	EH_problem "emacsclient version does not match specified emacsVersion=${emacsVersion}"
    fi

    opDo ls -l /usr/local/bin/emacs-${emacsVersion} /usr/local/bin/emacsclient-${emacsClientVersion} 
}

function vis_installedVerify {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Verify if specified emacs has been installed.
_EOF_
		       }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""
    local retVal=0

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized
    
    opDo vis_srcPkgSpecPrep ${srcPkgSelector}     

    opDo installedVerify
    retVal=$?

    lpReturn ${retVal}    
}



function installedVerify {     
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
		       }

    local emacsVersion=${srcPkgSelector##emacs}  # eg, 28 - emacs front stripped from emacs28 
    
    local emacsProg=$( echo /usr/local/bin/emacs-${emacsVersion}.* )

    local retVal=0

    if [ ! -f /usr/local/bin/emacs-${emacsVersion} ] ; then
	retVal=101
    fi

    if [ ! -f /usr/local/bin/emacsclient-${emacsVersion} ] ; then
	retVal=101
    fi

    if [ ${retVal} == 0 ] ; then
	opDo ls -l /usr/local/bin/emacs-${emacsVersion} /usr/local/bin/emacsclient-${emacsVersion}
    else
	ANT_raw "/usr/local/bin/emacs-${emacsVersion} has not been installed"
    fi

    lpReturn  ${retVal}
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  *Cmnds*          :: /Full Build -- setup, obtain, build, install/ [[elisp:(org-cycle)][| ]]
_CommentEnd_



_CommentBegin_
*  [[elisp:(org-cycle)][| ]] [[elisp:(org-show-subtree)][|=]] [[elisp:(show-children 10)][|V]] [[elisp:(blee:ppmm:org-mode-toggle)][|N]] [[elisp:(bx:orgm:indirectBufOther)][|>]] [[elisp:(bx:orgm:indirectBufMain)][|I]] [[elisp:(beginning-of-buffer)][|^]] [[elisp:(org-top-overview)][|O]] [[elisp:(progn (org-shifttab) (org-content))][|C]] [[elisp:(delete-other-windows)][|1]] || Cmnd      ::  vis_srcFullBuild    [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_srcFullBuild {    
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    EH_assert [[ $# -lt 2 ]]

    local srcPkgSelector=""

    if [ $# -eq 0 ] ; then
	srcPkgSelector="latest"
    else
	srcPkgSelector="$1"
    fi

    opDo emacsVerCanonicalized

    opDo vis_srcPkgSpecPrep ${srcPkgSelector}

    if installedVerify ; then
	if [ "${G_forceMode}" == "force" ] ; then
	    ANT_raw "Re-Building:: Emacs ${srcPkgSelector} is installed but forceMode is specified"
	else
	    ANT_raw "Skipping Build:: Emacs ${srcPkgSelector} is installed and forceMode is not specified"
	    lpReturn 0
	fi
    fi
    
    opDoAfterPause vis_srcEnvSetup ${srcPkgSelector}

    opDoAfterPause vis_srcPkgObtain ${srcPkgSelector}

    opDoAfterPause vis_srcBuild ${srcPkgSelector}

    opDoAfterPause vis_srcBinInstall ${srcPkgSelector}

    opDoAfterPause vis_postInstall ${srcPkgSelector}
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [BACS]        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:

