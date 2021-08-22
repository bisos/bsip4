#!/bin/bash

IcmBriefDescription="NOTYET: Short Description Of The Module"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/bisosAccounts.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
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
*  [[elisp:(org-cycle)][| ]]  Xrefs         :: *[Related/Xrefs:]*  <<Xref-Here->>  -- External Documents  [[elisp:(org-cycle)][| ]]
**  [[elisp:(org-cycle)][| ]]  Panel        :: [[file:/libre/ByStar/InitialTemplates/activeDocs/bxServices/versionControl/fullUsagePanel-en.org::Xref-VersionControl][Panel Roadmap Documentation]] [[elisp:(org-cycle)][| ]]
*  [[elisp:(org-cycle)][| ]]  Info          :: *[Module Description:]* [[elisp:(org-cycle)][| ]]

Installs Persian Fonts

TODO m17n -- chinese emacs menus needs this
apt-get install -y ttf-arphic-uming

_EOF_
  return 0
}

_CommentBegin_
*  [[elisp:(beginning-of-buffer)][Top]] ################ [[elisp:(delete-other-windows)][(1)]]  *Seed Extensions*
_CommentEnd_

_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  Imports       :: Prefaces (Imports/Libraries) [[elisp:(org-cycle)][| ]]
_CommentEnd_


# Import Libraries


typeset -t bystarAcct="sa-20000"

. ${opBinBase}/opAcctLib.sh
. ${opBinBase}/bystarLib.sh


. ${opBinBase}/distHook.libSh

. ${opBinBase}/mmaLib.sh
# . ${opBinBase}/mmaBinsPrepLib.sh

binPublishToServer="www.bybinary.org"
binObtainFromServer="www.bybinary.org"

function vis_examples {
  typeset extraInfo="-h -v -n showRun"
  #typeset extraInfo=""

  oneBystarAcct="sa-20000"

    typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- Persian/Farsi Update - FULL ACTIONS ---
${G_myName} ${extraInfo} -i persianFullInstall
----
${G_myName} ${extraInfo} -p bystarAcct=${oneBystarAcct} -i persianFonts
${G_myName} ${extraInfo} -p bystarAcct=${oneBystarAcct} -i persianKeyboard
${G_myName} ${extraInfo} -p bystarAcct=${oneBystarAcct} -i xfardic
--- XE PERSIAN ---
${G_myName} ${extraInfo} -i xepersianLatex
${G_myName} ${extraInfo} -i xepersianLatexPkgPrep
${G_myName} ${extraInfo} -i xepersianLatexInstall
${G_myName} ${extraInfo} -i persianMiscInstall
${G_myName} ${extraInfo} -i fontXbZarInstall
--- Obtain, Republish and Install ---
${G_myName} ${extraInfo}  -i fontPkgsLocalVerify
${G_myName} ${extraInfo}  -i fontsObtainFromOrig
${G_myName} ${extraInfo}  -i fontPkgsRePublish
${G_myName} ${extraInfo}  -i fontPkgsLocalObtain
${G_myName} ${extraInfo}  -i fontPkgsObtain
${G_myName} ${extraInfo}  -i fontPkgsInstall
_EOF_
}

noSubjectHook() {
  return 0
}

noArgsHook() {
  vis_examples
}

function vis_xepersianLatex {
#
# http://www.ctan.org/tex-archive/macros/xetex/latex/xepersian/
# doc/examples  doc/user-guide
echo "See for relevant files /c1/libre/raazaad/"
  cat  << _EOF_

  OBSOLETED -- See vis_xepersianLatexInstall below

0) Install xetex/xelatex
1) Install xepersian in /usr/share/texmf-texlive/
2) Install etoolbox
3) Install XB Zar 
4) Install ttf2tex
5) Use ttf2tex to install  XBZar without space
   export TEXMFLOCAL=/usr/share/texmf-texlive; ttf2tex
6) Had to comment out a line in one of xepersian sty files
7) Install /c1/libre/raazaad/libertine.zip 

_EOF_
}

function vis_xepersianLatexPkgPrep {
    opDoExit cd ${opVarBase}/distPkgs/all

    #EH_problem "NOTYET XBZar source URL has moved"
    #return
    
    #opDo wget -O XBZar.zip 'http://irmug.org/dl/index.php?name=Downloads&req=getit&lid=30'
    opDo wget -O XBZar.zip 'http://wiki.irmug.com/index.php/X_Series_2#Download_fonts'

    opDo ls -lt

    thisPkgName=XBZar.zip
    thisPkgFullName=${opVarBase}/distPkgs/all/${thisPkgName}
    
  opDo distPkgPublish.sh -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}" -i pkgPublish ${thisPkgFullName}
}

function vis_persianFullInstall {
    opDo vis_persianFonts
    opDo vis_persianMiscInstall
    opDo vis_xepersianLatexInstall
    opDo vis_fontXbZarInstall
}


function vis_xepersianLatexInstall {
    opDo sudo apt-get -y install ttf-linux-libertine
    opDo sudo apt-get -y install texlive-fonts-extra
    opDo sudo apt-get -y install texlive-xetex
    opDo sudo apt-get -y install texlive-lang-arabic
    opDo sudo apt-get -y install texlive-generic-extra
    opDo sudo apt-get -y install texlive-lang-japanese
}


function vis_fontXbZarInstall {
    ANT_raw "Must Run As Root"
    #opVarBase="/bisos/var/srcPkgs"
    opDoExit cd /bisos/var/srcPkgs # ${opVarBase}/distPkgs/all
    
    #opDo wget -O XBZar.zip 'http://irmug.org/dl/index.php?name=Downloads&req=getit&lid=30'
    #opDo wget -O XBZar.zip 'http://wiki.irmug.com/index.php/X_Series_2#Download_fonts'

    opDo wget -O XBZar.zip http://www.bybinary.org/republish/debian/squeeze/all/XBZar.zip

    opDo ls -lt

    opDo sudo unzip XBZar.zip -d /usr/share/fonts/truetype/ttf-persian-fonts
}


function vis_persianMiscInstall {
    opDo sudo apt-get -y install aspell-fa

    opDo sudo apt-get -y install iceweasel-l10n-fa-ir
    opDo sudo apt-get -y install iceweasel-l10n-fa

    opDo sudo apt-get -y install jalali-calendar
    opDo sudo apt-get -y install jcal

    opDo sudo apt-get -y install ttf-freefarsi
}



function vis_persianFonts {

#sudo apt-get install ttf-farsiweb xfonts-intl-arabic xfonts-intl-european xfonts-intl-phonet
#
sudo apt-get -y install fonts-farsiweb
sudo apt-get -y install emacs-intl-fonts
sudo apt-get -y install xfonts-intl-arabic
sudo apt-get -y install xfonts-intl-european
sudo apt-get -y install xfonts-intl-phonetic
sudo apt-get -y install msttcorefonts

opDo vis_fontPkgsObtain

opDo vis_fontPkgsInstall
}

function vis_fontPkgsInstall {
    opDoExit cd ${opVarBase}/distPkgs/all
    opDo sudo mkdir /usr/share/fonts/truetype/ttf-persian-fonts
    opDo sudo unzip fpf.zip -d /usr/share/fonts/truetype/ttf-persian-fonts
    opDo sudo tar zxvf tahoma.tar.gz -C /usr/share/fonts/truetype/ttf-persian-fonts
    opDo sudo tar zxvf bfonts.tar.gz -C /usr/share/fonts/truetype/ttf-persian-fonts

    opDo fc-cache -f -v
}


function vis_fontPkgsObtain {
  opDo vis_fontPkgsLocalVerify > /dev/null 2>&1 ;   retVal=$?
  if [[ ${retVal} -ne 0 ]] ; then
      ANT_raw "${G_myName} $0: Missing Local fonts, will obtain them from Orig and RePub next"
      continueAfterThis

      opDo vis_fontsObtainFromOrig
      opDo vis_fontPkgsRePublish
      continueAfterThis
  else 
      ANT_raw "${G_myName} $0: Local fonts in place, using those"
      continueAfterThis
  fi
  opDo vis_fontPkgsLocalObtain
}



vis_fontsObtainFromOrig () {
    opDo mkdir -p ${opVarBase}/distPkgs/all
    opDoExit cd ${opVarBase}/distPkgs/all
    opDo wget  http://voxel.dl.sourceforge.net/sourceforge/fpf/fpf.zip
    opDo wget  http://hezardastan.sourceforge.net/persianfonts/tahoma.tar.gz
    opDo wget  http://hezardastan.sourceforge.net/persianfonts/bfonts.tar.gz
    opDo ls -l fpf.zip tahoma.tar.gz bfonts.tar.gz
}



vis_fontPkgsLocalObtain () {
    opDo mkdir -p ${opVarBase}/distPkgs/all
    opDoExit cd ${opVarBase}/distPkgs/all
    opDo wget http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/fpf.zip
    opDo wget http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/tahoma.tar.gz
    opDo wget http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/bfonts.tar.gz

    opDo ls -l `pwd`/fpf.zip `pwd`/tahoma.tar.gz `pwd`/bfonts.tar.gz
}

vis_fontPkgsRePublish () {
    thisPkgName=fpf.zip
    thisPkgFullName=${opVarBase}/distPkgs/all/fpf.zip
    
  opDo distPkgPublish.sh -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}" -i pkgPublish ${thisPkgFullName}

    thisPkgName=tahoma.tar.gz
    thisPkgFullName=${opVarBase}/distPkgs/all/tahoma.tar.gz
    
  opDo distPkgPublish.sh -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}" -i pkgPublish ${thisPkgFullName}

    thisPkgName=bfonts.tar.gz
    thisPkgFullName=${opVarBase}/distPkgs/all/bfonts.tar.gz
    
  opDo distPkgPublish.sh -p publishServer=${binPublishToServer} -p relativeUrl="/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}" -i pkgPublish ${thisPkgFullName}

}

vis_fontPkgsLocalVerify () {
    thisPkgName=fpf.zip
    
    opDo wget --spider http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName} ;     retVal=$?
    if [[ ${retVal} -ne 0 ]] ; then
        EH_problem "Missing http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    else
        ANT_raw "In Place: http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    fi 

    thisPkgName=tahoma.tar.gz
    
    opDo wget --spider http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName} ;     retVal=$?
    if [[ ${retVal} -ne 0 ]] ; then
        EH_problem "Missing http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    else
        ANT_raw "In Place: http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    fi 

    thisPkgName=bfonts.tar.gz
    
    opDo wget --spider http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName} ;     retVal=$?
    if [[ ${retVal} -ne 0 ]] ; then
        EH_problem "Missing http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    else
        ANT_raw "In Place: http://${binObtainFromServer}:/republish/${cononDistFamily}/${cononDistGeneration}/all/${thisPkgName}
    fi 
    
    return ${retVal}
}



function vis_persianKeyboard {
#
# goto keyboard perferences ...
#
    return
}

function vis_xfardic {
#
# add this line to /etc/apt/sources.list
# deb http://parsix.org/packages ramon main
#
# apt-get xfardic
    return
}
