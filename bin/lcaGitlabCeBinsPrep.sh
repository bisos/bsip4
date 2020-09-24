#!/bin/bash

IimBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
### Args: :control "enabled|disabled|hide|release|fVar"  :vc "cvs|git|nil" :partof "bystar|nil" :copyleft "halaal+minimal|halaal+brief|nil"
typeset RcsId="$Id: dblock-iim-bash.el,v 1.4 2017-02-08 06:42:32 lsipusr Exp $"
# *CopyLeft*
__copying__="
* Libre-Halaal Software"
#  This is part of ByStar Libre Services. http://www.by-star.net
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal.
####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/lcaGitlabCeBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*  /Controls/ ::  [[elisp:(org-cycle)][| ]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[file:Panel.org][Panel]] | [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] | [[elisp:(bx:org:run-me)][Run]] | [[elisp:(bx:org:run-me-eml)][RunEml]] | [[elisp:(delete-other-windows)][(1)]] | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] [[elisp:(org-cycle)][| ]]
** /Version Control/ ::  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]]
####+END:
_CommentEnd_



_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  Notes         :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref->>  -- External Documents  [[elisp:(org-cycle)][| ]]
Xref-
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxPlatform/baseDirs/samba/fullUsagePanel-en.org::Xref-][MODULE Panel]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Pkgs-List     :: Components List [[elisp:(org-cycle)][| ]]
_CommentEnd_

function itemNameFor {
    echo "$1" | sed -r 's/-/_/g'
}

#apt-cache search something | egrep '^something'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search something | egrep '^something'")][apt-cache search something | egrep '^something']]

    itemOrderedList=( 
	"curl"
	"$( itemNameFor openssh-server )"
	"$( itemNameFor ca-certificates )"
	"gnupg"
	"$( itemNameFor debian-archive-keyring )"
	"$( itemNameFor apt-transport-https )"
	"gitlabCe_repoAdd"
	"$( itemNameFor gitlab-ce )"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  ExamplesExt   :: Module Specific Additions -- examplesHook [[elisp:(org-cycle)][| ]]
_CommentEnd_




function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
_EOF_
}

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "curl"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: curl [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_curl () { distFamilyGenerationHookRun binsPrep_curl; }

binsPrep_curl_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "curl"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "openssh-server"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: openssh-server [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_openssh_server () { distFamilyGenerationHookRun binsPrep_openssh_server; }

binsPrep_openssh_server_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "openssh-server"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "ca-certificates"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: ca-certificates [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ca_certificates () { distFamilyGenerationHookRun binsPrep_ca_certificates; }

binsPrep_ca_certificates_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "ca-certificates"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gnupg"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gnupg [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gnupg () { distFamilyGenerationHookRun binsPrep_gnupg; }

binsPrep_gnupg_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gnupg"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "gitlab-ce"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: gitlab-ce [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_gitlab_ce () { distFamilyGenerationHookRun binsPrep_gitlab_ce; }

binsPrep_gitlab_ce_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "gitlab-ce"; }

####+END:


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "debian-archive-keyring"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: debian-archive-keyring [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_debian_archive_keyring () { distFamilyGenerationHookRun binsPrep_debian_archive_keyring; }

binsPrep_debian_archive_keyring_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "debian-archive-keyring"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "apt-transport-https"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: apt-transport-https [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_apt_transport_https () { distFamilyGenerationHookRun binsPrep_apt_transport_https; }

binsPrep_apt_transport_https_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "apt-transport-https"; }

####+END:

os=${os-}
dist=${dist-}
ID=${ID-}

detect_os ()
{
  if [[ ( -z "${os}" ) && ( -z "${dist}" ) ]]; then
    # some systems dont have lsb-release yet have the lsb_release binary and
    # vice-versa
    if [ -e /etc/lsb-release ]; then
      . /etc/lsb-release

      if [ "${ID}" = "raspbian" ]; then
        os=${ID}
        dist=`cut --delimiter='.' -f1 /etc/debian_version`
      else
        os=${DISTRIB_ID}
        dist=${DISTRIB_CODENAME}

        if [ -z "$dist" ]; then
          dist=${DISTRIB_RELEASE}
        fi
      fi

    elif [ `which lsb_release 2>/dev/null` ]; then
      dist=`lsb_release -c | cut -f2`
      os=`lsb_release -i | cut -f2 | awk '{ print tolower($1) }'`

    elif [ -e /etc/debian_version ]; then
      # some Debians have jessie/sid in their /etc/debian_version
      # while others have '6.0.7'
      os=`cat /etc/issue | head -1 | awk '{ print tolower($1) }'`
      if grep -q '/' /etc/debian_version; then
        dist=`cut --delimiter='/' -f1 /etc/debian_version`
      else
        dist=`cut --delimiter='.' -f1 /etc/debian_version`
      fi

    else
      unknown_os
    fi
  fi

  if [ -z "$dist" ]; then
    unknown_os
  fi

  # remove whitespace from OS and dist name
  os="${os// /}"
  dist="${dist// /}"

  echo "Detected operating system as $os/$dist."
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || add-apt-repository :: something_repoAdd [[elisp:(org-cycle)][| ]]
_CommentEnd_

vis_repositoryAdd () {
    #
    # You can add the new repository one of two ways.
    # 1) With add-apt-repository, something like:
    #     opDo sudo add-apt-repository "deb http://dl.google.com/linux/chrome/deb/ stable main"
    # 2) By writing in the /etc/apt/sources.list.d/ directly, something like:
    #    echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian  focal contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list
    #
    # Next you need to create trust with apt-key add, something like,
    # lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -"
    #
    # Mimic the lines below, for a quick start:
    #
    # echo 'deb [arch=amd64] https://download.virtualbox.org/virtualbox/debian  focal contrib' | sudo tee /etc/apt/sources.list.d/virtualbox.list
    # lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -"
    # lpDo eval "wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -"
    
    lpDo sudo apt-get update

    lpDo detect_os

    gpg_key_url="https://packages.gitlab.com/gitlab/gitlab-ce/gpgkey"
    apt_config_url="https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/config_file.list?os=${os}&dist=${dist}&source=script"
    
    apt_source_path="/etc/apt/sources.list.d/gitlab_gitlab-ce.list"

    echo -n "Installing $apt_source_path..."

    # create an apt config file for this repository
    curl -sSf "${apt_config_url}" > $apt_source_path
    curl_exit_code=$?

    if [ "$curl_exit_code" = "22" ]; then
	echo
	echo
	echo -n "Unable to download repo config from: "
	echo "${apt_config_url}"
	echo
	echo "This usually happens if your operating system is not supported by "
	echo "packagecloud.io, or this script's OS detection failed."
	echo
	echo "You can override the OS detection by setting os= and dist= prior to running this script."
	echo "You can find a list of supported OSes and distributions on our website: https://packages.gitlab.com/docs#os_distro_version"
	echo
	echo "For example, to force Ubuntu Trusty: os=ubuntu dist=trusty ./script.sh"
	echo
	echo "If you are running a supported OS, please email support@packagecloud.io and report this."
	[ -e $apt_source_path ] && rm $apt_source_path
	exit 1
    elif [ "$curl_exit_code" = "35" -o "$curl_exit_code" = "60" ]; then
	echo "curl is unable to connect to packagecloud.io over TLS when running: "
	echo "    curl ${apt_config_url}"
	echo "This is usually due to one of two things:"
	echo
	echo " 1.) Missing CA root certificates (make sure the ca-certificates package is installed)"
	echo " 2.) An old version of libssl. Try upgrading libssl on your system to a more recent version"
	echo
	echo "Contact support@packagecloud.io with information about your system for help."
	[ -e $apt_source_path ] && rm $apt_source_path
	exit 1
    elif [ "$curl_exit_code" -gt "0" ]; then
	echo
	echo "Unable to run: "
	echo "    curl ${apt_config_url}"
	echo
	echo "Double check your curl installation and try again."
	[ -e $apt_source_path ] && rm $apt_source_path
	exit 1
    else
	echo "done."
    fi

    echo -n "Importing packagecloud gpg key... "
    # import the gpg key
    curl -L "${gpg_key_url}" 2> /dev/null | apt-key add - &>/dev/null
    echo "done."

    echo -n "Running apt-get update... "
    # update apt on this system
    apt-get update &> /dev/null
    echo "done."

    echo
    echo "The repository is setup! You can now install packages."
    
}


item_gitlabCe_repoAdd () {
  distFamilyGenerationHookRun binsPrep_gitlabCe_repoAdd
}

binsPrep_gitlabCe_repoAdd_DEFAULT_DEFAULT () {
    mmaThisPkgName="gitlabCe_repoAdd"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
	opDo vis_repositoryAdd
    }
}

!


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :types ""
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
