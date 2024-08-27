#!/usr/bin/env bash


IcmBriefDescription="NOTYET: Short Description Of The Module"

ORIGIN="
* Revision And Libre-Halaal CopyLeft -- Part Of ByStar -- Best Used With Blee
"

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"

####+END:

__author__="
* Authors: Mohsen BANAN, http://mohsen.banan.1.byname.net/contact
"


####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/blee 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


_CommentBegin_
####+BEGIN: bx:dblock:global:file-insert-cond :cond "./blee.el" :file "/bisos/apps/defaults/software/plusOrg/dblock/inserts/topControls.org"
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]
** https://wiki.archlinux.org/title/Desktop_entries
_EOF_
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/lpParams.libSh
. ${opBinBase}/lpReRunAs.libSh

. ${opBinBase}/bleeLib.sh

# PRE parameters

baseDir=""
acctName=""

function G_postParamHook {
     return 0
}


_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Examples      :: Examples [[elisp:(org-cycle)][| ]]
_CommentEnd_


function vis_examples {
    typeset extraInfo="-h -v -n showRun"
    #typeset extraInfo=""
    typeset runInfo="-p ri=lsipusr:passive"

    typeset examplesInfo="${extraInfo} ${runInfo}"

    visLibExamplesOutput ${G_myName} 
  cat  << _EOF_
$( examplesSeperatorTopLabel "${G_myName}" )
$( examplesSeperatorChapter "Blee Run Sys" )
${G_myName} ${extraInfo} -i xdgBleeSysAppStdout
${G_myName} ${extraInfo} -i xdgBleeSysAppUpdate
${G_myName} ${extraInfo} -f -i xdgBleeSysAppUpdate
ls -l $( vis_xdgBleeSysAppFile  )
gtk-launch $(basename $( vis_xdgBleeSysAppFile  ))
$( examplesSeperatorChapter "Blee Run 30" )
${G_myName} ${extraInfo} -i xdgBlee30AppStdout
${G_myName} ${extraInfo} -i xdgBlee30AppUpdate
${G_myName} ${extraInfo} -f -i xdgBlee30AppUpdate
ls -l $( vis_xdgBlee30AppFile  )
gtk-launch $(basename $( vis_xdgBleeSysAppFile  ))
$( examplesSeperatorChapter "bleeclient Org-Protocol Install" )
${G_myName} ${extraInfo} -i xdgBleeOrgProtocolStdout
${G_myName} ${extraInfo} -i xdgBleeOrgProtocolUpdate
${G_myName} ${extraInfo} -f -i xdgBleeOrgProtocolUpdate
ls -l $( vis_xdgBleeOrgProtocolFile  )
xdg-mime default blee-org-protocol.desktop x-scheme-handler/org-protocol
$( examplesSeperatorChapter "bleeclient Org-Protocol Run" )
xdg-open "org-protocol://roam-file?file=/bisos/panels/panelsRoot/fullUsagePanel-en.org"
xdg-open "org-protocol://capture:/bisos/panels/panelsRoot/fullUsagePanel-en.org"
$( examplesSeperatorChapter "bleeclient mailto Install" )
${G_myName} ${extraInfo} -i xdgBleeMailtoStdout
${G_myName} ${extraInfo} -i xdgBleeMailtoUpdate
${G_myName} ${extraInfo} -f -i xdgBleeMailtoUpdate
ls -l $( vis_xdgBleeMailtoFile )
xdg-mime default blee-mailto.desktop x-scheme-handler/mailto
$( examplesSeperatorChapter "bleeclient mailto Run" )
xdg-email "mailto:emacs@mohsen.1.banan.byname.net"
xdg-email "mailto:emacs@mohsen.1.banan.byname.net"
$( examplesSeperatorChapter "Tools and DEBUGGING" )
export XDG_UTILS_DEBUG_LEVEL=9
xdg-mime query default 'x-scheme-handler/mailto'
desktop-file-validate your-desktop-file
desktop-file-install --dir=$HOME/.local/share/applications ~/app.desktop
update-desktop-database ~/.local/share/applications
echo $XDG_DATA_DIRS/icons  # Where Icons Go
_EOF_
}

noArgsHook() {
  vis_examples
}



function desktopAppFileUpdate {
  EH_assert [[ $# -eq 2 ]]

  updateFileName=$1
  updateStdoutFunc=$2

  typeset dirsPart=$( FN_dirsPart ${updateFileName} )
  #opDoExit  FN_dirCreatePathIfNotThere ${dirsPart}

  if [[ "${G_forceMode}" == "force" ]] ; then
      FN_fileSafeKeep ${updateFileName}
      ${updateStdoutFunc} > ${updateFileName} # 2> /dev/null 
  else
      if [ -f ${updateFileName} ] ; then
          ANT_raw "File: ${updateFileName} exists -- no action taken"
      else
          FN_fileSafeKeep ${updateFileName}
          ${updateStdoutFunc} > ${updateFileName} # 2> /dev/null 
      fi
  fi

  # opDoComplain chmod ugo+x ${updateFileName}
  opDoComplain ls -l ${updateFileName}
}


function vis_xdgBleeOrgProtocolStdout {
  cat  << _EOF_
[Desktop Entry]
Name=Org-Protocol
Exec=bleeclient -i defaultRun %u
Icon=emacs-icon
Type=Application
Terminal=false
MimeType=x-scheme-handler/org-protocol
_EOF_
}

function vis_xdgBleeOrgProtocolFile {
  local updateFileName=$( echo ~/.local/share/applications/blee-org-protocol.desktop )
  echo ${updateFileName}
}

function vis_xdgBleeOrgProtocolUpdate {
  local updateFileName=$( vis_xdgBleeOrgProtocolFile  )
  local updateStdoutFunc=vis_xdgBleeOrgProtocolStdout

  lpDo desktopAppFileUpdate ${updateFileName} ${updateStdoutFunc}
}


function vis_xdgBleeMailtoStdout {
  cat  << _EOF_
[Desktop Entry]
Name=Mailto
Exec=bleeclient -i defaultRun -- -c --eval "(xdp:email|act-on-url  \"%u\")"
Icon=emacs-icon
Type=Application
Terminal=false
MimeType=x-scheme-handler/mailto
_EOF_
}



#
# (browse-url-mail "mailto:emacs@mohsen.1.banan.byname.net")
#

function vis_xdgBleeMailtoFile {
  local updateFileName=$( echo ~/.local/share/applications/blee-mailto.desktop )
  echo ${updateFileName}
}


function vis_xdgBleeMailtoUpdate {
  
  local updateFileName=$( vis_xdgBleeMailtoFile )
  local updateStdoutFunc=vis_xdgBleeMailtoStdout

  lpDo desktopAppFileUpdate ${updateFileName} ${updateStdoutFunc}
}


function vis_xdgBleeSysAppStdout {
  cat  << _EOF_
[Desktop Entry]
Name=Doom-Blee3-Sys
Comment=Blee3 With Emacs-sys and Doom
Exec=/bisos/core/bsip/bin/blee -h -v -n showRun -i run doom-blee3
Icon=/bisos/blee/env3/images/bxLogo.jpg
Type=Application
Terminal=false
_EOF_
}


function vis_xdgBleeSysAppFile {
  local updateFileName=$( echo ~/.local/share/applications/blee3-doom-sys.desktop )
  echo ${updateFileName}
}


function vis_xdgBleeSysAppUpdate {

  local updateFileName=$( vis_xdgBleeSysAppFile )
  local updateStdoutFunc=vis_xdgBleeSysAppStdout

  lpDo desktopAppFileUpdate ${updateFileName} ${updateStdoutFunc}
}

function vis_xdgBlee30AppStdout {
  cat  << _EOF_
[Desktop Entry]
Name=Mailto
Exec=bleeclient -i defaultRun -- -c --eval "(xdp:email|act-on-url  \"%u\")"
Icon=emacs-icon
Type=Application
Terminal=false
MimeType=x-scheme-handler/mailto
_EOF_
}


function vis_xdgBlee30AppFile {
  local updateFileName=$( echo ~/.local/share/applications/blee-sys.desktop )
  echo ${updateFileName}
}


function vis_xdgBlee30AppUpdate {

  local updateFileName=$( vis_xdgBleeMailtoFile )
  local updateStdoutFunc=vis_xdgBleeMailtoStdout

  lpDo desktopAppFileUpdate ${updateFileName} ${updateStdoutFunc}
}




_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  IIFs          :: Interactively Invokable Functions (IIF)s |  [[elisp:(org-cycle)][| ]]
_CommentEnd_


_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *End Of Editable Text*
_CommentEnd_

####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Common        ::  /[dblock] -- End-Of-File Controls/ [[elisp:(org-cycle)][| ]]
_CommentEnd_
#+STARTUP: showall
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
####+END:
