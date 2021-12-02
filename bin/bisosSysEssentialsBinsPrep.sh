#!/bin/bash

IcmBriefDescription="MODULE BinsPrep based on apt based seedSubjectBinsPrepDist.sh"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part of [[http://www.by-star.net][ByStar]] -- Best Used With [[http://www.by-star.net/PLPC/180004][Blee]] or [[http://www.gnu.org/software/emacs/][Emacs]]
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
typeset RcsId="$Id: binsPrepLcaSimple.sh,v 1.1 2016-11-25 05:45:02 lsipusr Exp $"
# *CopyLeft*
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
*  /This File/ :: /bisos/core/bsip/bin/bisosSysEssentialsBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/libre/ByStar/InitialTemplates/software/plusOrg/dblock/inserts/topControls.org"
*      ================
*  /Controls/:  [[elisp:(org-cycle)][Fold]]  [[elisp:(show-all)][Show-All]]  [[elisp:(org-shifttab)][Overview]]  [[elisp:(progn (org-shifttab) (org-content))][Content]] | [[elisp:(bx:org:run-me)][RunMe]] | [[elisp:(delete-other-windows)][(1)]]  | [[elisp:(progn (save-buffer) (kill-buffer))][S&Q]]  [[elisp:(save-buffer)][Save]]  [[elisp:(kill-buffer)][Quit]] 
** /Version Control/:  [[elisp:(call-interactively (quote cvs-update))][cvs-update]]  [[elisp:(vc-update)][vc-update]] | [[elisp:(bx:org:agenda:this-file-otherWin)][Agenda-List]]  [[elisp:(bx:org:todo:this-file-otherWin)][ToDo-List]] 

####+END:
_CommentEnd_



_CommentBegin_
*      ================
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]] CONTENTS-LIST ################
*  [[elisp:(org-cycle)][| ]]  [Notes]       :: *[Current-Info:]*  Status, Notes (Tasks/Todo Lists, etc.) [[elisp:(org-cycle)][| ]]
_CommentEnd_

function vis_moduleDescription {  cat  << _EOF_
*  [[elisp:(org-cycle)][| ]]  [Xrefs]       :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
Xref-Here-
**  [[elisp:(org-cycle)][| ]]  Subject      :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  [Info]        :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

_EOF_
}

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [Pkgs-List]   :: Components List [[elisp:(org-cycle)][| ]]
_CommentEnd_

#apt-cache search something | egrep '^something'

function pkgsList_DEFAULT_DEFAULT {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    #  [[elisp:(lsip-local-run-command "apt-cache search something | egrep '^something'")][apt-cache search something | egrep '^something']]

    itemOrderedList=(
        "debconf_utils"     # needed for pre-seeding
        "postfixCustom"     # because various packages install postfix
        "ruby"              # needed by facter  
        "facter"
        "build_essential"
        "dkms"
        "sshpass"
        # Network Client Tools
        "net_tools"
        # Perhaps not available on all revs, hence coming last
        "linux_headers_generic"
        "nmap"
        "pandoc"
    )

    itemOptionalOrderedList=()
    itemLaterOrderedList=()
}

distFamilyGenerationHookRun pkgsList


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [ExamplesExt] :: Module Specific Additions -- examplesHook [[elisp:(org-cycle)][| ]]
_CommentEnd_


function examplesHookPost {
    typeset extraInfo="-h -v -n showRun"
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} ${extraInfo} -i sysPreps
${G_myName} ${extraInfo} -i sysPreps laptop
_EOF_
}

function vis_sysPreps {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_

[org/gnome/settings-daemon/plugins/power]

sleep-inactive-ac-type='blank'

_EOF_
    }
    EH_assert [[ $# -lt 2 ]]

    local isLaptop=""

    if [  $# -eq 1 ] ; then
        if [ "${1}" == "laptop" ] ; then
            isLaptop="true"
        fi
    fi

    case ${opRunDistFamily} in
        "UBUNTU")
            if [ "${opRunDistGeneration}" == "2004" ] ; then
                doNothing
            fi
            ;;
        "DEBIAN")
            # NOTYET, this should not be done to laptops. Only to servers.
            if [ -z "${isLaptop}" ] ; then
                lpDo sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
            else
                lpDo sudo systemctl unmask sleep.target suspend.target hibernate.target hybrid-sleep.target
            fi
            ;;
        *)
            opRunDistGeneration="UNSUPPORTED"
            EH_oops ;
            return
            ;;
    esac
    
    lpReturn
}

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "nmap"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: nmap [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_nmap () { distFamilyGenerationHookRun binsPrep_nmap; }

binsPrep_nmap_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "nmap"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "pandoc"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: pandoc [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_pandoc () { distFamilyGenerationHookRun binsPrep_pandoc; }

binsPrep_pandoc_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "pandoc"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "debconf-utils"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: debconf-utils [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_debconf_utils () { distFamilyGenerationHookRun binsPrep_debconf_utils; }

binsPrep_debconf_utils_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "debconf-utils"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "ruby"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: ruby [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_ruby () { distFamilyGenerationHookRun binsPrep_ruby; }

binsPrep_ruby_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "ruby"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "facter"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: facter [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_facter () { distFamilyGenerationHookRun binsPrep_facter; }

binsPrep_facter_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "facter"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "build-essential"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: build-essential [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_build_essential () { distFamilyGenerationHookRun binsPrep_build_essential; }

binsPrep_build_essential_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "build-essential"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "dkms"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: dkms [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_dkms () { distFamilyGenerationHookRun binsPrep_dkms; }

binsPrep_dkms_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "dkms"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "linux-headers-generic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: linux-headers-generic [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_linux_headers_generic () { distFamilyGenerationHookRun binsPrep_linux_headers_generic; }

binsPrep_linux_headers_generic_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "linux-headers-generic"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "net-tools"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: net-tools [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_net_tools () { distFamilyGenerationHookRun binsPrep_net_tools; }

binsPrep_net_tools_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "net-tools"; }

####+END:

####+BEGIN: bx:dblock:lsip:binsprep:apt :module "sshpass"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: sshpass [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_sshpass () { distFamilyGenerationHookRun binsPrep_sshpass; }

binsPrep_sshpass_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "sshpass"; }

####+END:




_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Custom-Pkg: postfixCustom
_CommentEnd_


item_postfixCustom () {
  distFamilyGenerationHookRun binsPrep_postfixCustom
}

binsPrep_postfixCustom_DEFAULT_DEFAULT () {
    mmaThisPkgName="postfixCustom"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook
    binsPrep_installPostHook="postfix_installPost"

    function customInstallScript {
        ANT_raw "Selecting postfix postfix/main_mailer_type string 'No configuration' with debconf-set-selections"
        echo "postfix postfix/main_mailer_type string 'No configuration'" | sudo  debconf-set-selections
        ANT_raw "Selecting postfix postfix/mailname string bisos.net with debconf-set-selections"       
        echo "postfix postfix/mailname string bisos.net" | sudo  debconf-set-selections

        opDo sudo apt-get -y install postfix
    }
}

function postfix_installPost {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
Just a place holder.
_EOF_
    }
}


_CommentBegin_
*      ================ /[dblock] -- End-Of-File Controls/
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
