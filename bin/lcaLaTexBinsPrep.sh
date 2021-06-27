#!/bin/osmtKsh
#!/bin/osmtKsh 

typeset RcsId="$Id: lcaLaTexBinsPrep.sh,v 1.4 2020-02-03 01:28:39 lsipusr Exp $"

if [ "${loadFiles}X" == "X" ] ; then
     seedSubjectBinsPrepDist.sh  -l $0 "$@"
     exit $?
fi


itemOrderedList=("preview_latex" "tetex_extra")


item_preview_latex () {
  distFamilyGenerationHookRun binsPrep_preview_latex
}

binsPrep_preview_latex_DEFAULT_DEFAULT () {
    mmaThisPkgName="preview-latex"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="apt"
}


item_tetex_extra () {
  distFamilyGenerationHookRun binsPrep_tetex_extra
}

binsPrep_tetex_extra_DEFAULT_DEFAULT () {
    mmaThisPkgName="tetex-extra"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="tetex-extra"
}

binsPrep_tetex_extra_UBUNTU_1310 () {  # tetex-extra missing in 1310
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1404 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1604 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_1804 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

binsPrep_tetex_extra_UBUNTU_2004 () {  # tetex-extra missing in 1404
    mmaThisPkgName="preview-latex"
    mmaPkgDebianMethod="apt"
    mmaPkgDebianName="preview-latex"
}

function examplesHookPost {
  cat  << _EOF_
----- POST HOOK EXAMPLES -------
    ${G_myName} -i extraInstall

    ${G_myName} -i lgrindInstall

    apt-get install arabtex
    apt-get install tex4ht

    ln -s /opt/public/osmt/share/texmf/tex/extras /usr/share/texmf/tex/extras
texhash
or
TEXINPUTS=.:/opt/public/osmt/share/texmf/tex/extras::

apt-get install latex2html
apt-get install gv xpdf


_EOF_
}


function vis_extraInstall {
    opDo ln -s /opt/public/osmt/share/texmf/tex/extras /usr/share/texmf/tex/extras
    opDo texhash
 
    # As an Alternative
    #export TEXINPUTS=.:/opt/public/osmt/share/texmf/tex/extras::

    opDo apt-get -y install latex2html
    opDo apt-get -y install gv xpdf

    opDo apt-get -y install arabtex
    opDo apt-get -y install tex4ht
    opDo apt-get -y install lgrind
    opDo apt-get -y install gnuplot
    opDo apt-get -y install transfig
    opDo apt-get -y install auctex
    opDo apt-get -y install latex-beamer

    #opDo apt-get -y install writer2latex         # DOES NOT WORK
    
    opDo apt-get -y install gnuhtml2latex         # Can also be used in place of writer2latex

    #opDo vis_lgrindInstall
}

function vis_lgrindInstall {

    ANT_raw "lgrindInstall needs to become version specific -- SKIPPED"

    return

    # lgrind disapeared in squeeze

    typeset srcPkgStableUrl=http://www.bybinary.org/republish/debian/squeeze/i386/lgrind_3.67-2_i386.deb
    typeset srcPkgStableName=lgrind_3.67-2_i386.deb

   opDoExit cd ${opVarBase}/distPkgs/all

   opDo wget ${srcPkgStableUrl}

   opDo dpkg -i ./${srcPkgStableName}
}

