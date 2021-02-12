#!/bin/bash

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
*  /This File/ :: /bisos/core/bsip/bin/bueMailStatic.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:

export PATH=$PATH:/usr/curenv/bin:/opt/public/teTeX/bin/sparc-solaris:/usr/bin:
typeset textOnly="_nil"

typeset -t outputs=""
typeset -t cleanType=""
typeset -t optionsList=""
typeset -t currentBase=""

typeset -t inFormat=""   ## xelatex, latex, tex, texinfo, oda, fm5, ...


extraLatexOptions=""

. ${opBase}/lib/ocp-lib.sh
. ${opBinBase}/opDoAtAsLib.sh
. ${opBinBase}/bibTex.libSh

typeset frameMakerHost="192.168.0.103"
vis_examples () {
  typeset visLibExamples=`visLibExamplesOutput ${G_myName}`
 cat  << _EOF_
EXAMPLES:
${visLibExamples}
--- texBuild ---
${G_myName} -p outputs=ps -i buildDocs main.ttytex
${G_myName} -p outputs=pdf -i buildDocs main.ttytex
${G_myName} -p outputs=tty -i buildDocs main.ttytex
${G_myName} -p outputs=onehtml -i buildDocs main.ttytex
${G_myName} -p outputs=html -i buildDocs main.ttytex
${G_myName} -p outputs=simplehtml -i buildDocs main.ttytex
${G_myName} -p outputs=tex4ht -i buildDocs main.ttytex
${G_myName} -p outputs=heveaHtml -i buildDocs main.ttytex
${G_myName} -p currentBase=`pwd` -p outputs=all -i buildDocs main.fm5
${G_myName} -p outputs=all -i buildDocs main.ttytex
${G_myName} -p outputs=ps -i buildDocs main.ttytex main2.ttytex main3.ttytex
${G_myName} -p outputs=ps,pdf,html -i buildDocs main.ttytex main2.ttytex main3.ttytex
--- FIGURE BUILDING
${G_myName} -p currentBase=`pwd` -p outputs=epsi -i buildFigures figure.fm5
${G_myName} -p currentBase=`pwd` -p outputs=pdf -i buildFigures figure.fm5
${G_myName} -p currentBase=`pwd` -p outputs=gif -i buildFigures figure.fm5
${G_myName} -p currentBase=`pwd` -p outputs=all -i buildFigures figure.fm5
${G_myName} -p currentBase=`pwd` -p outputs=all -i buildFigures `echo *.fm5`
${G_myName} -p currentBase=`pwd` -p outputs=epsi,pdf -i buildFigures figure.fm5
${G_myName} -p currentBase=`pwd` -i tgrindBuild xxx.c
${G_myName} -p currentBase=`pwd` -i tgrindBuild xxx.h
--- CLEANING ---
${G_myName} -p cleanType=realclean -i clean main.ttytex
${G_myName} -p cleanType=realclean -i clean main.ttytex main2.ttytex
${G_myName} -p cleanType=cleanKeepResults -i clean main.ttytex
${G_myName} -p cleanType=cleanKeepResults -i clean main.ttytex main2.ttytex
${G_myName} -p cleanType=realclean -i clean figure.fm5 figure2.fm5
--- FREQUENT ACTIONS ---
${G_myName} -p cleanType=realclean -i clean `echo *.ttytex`
${G_myName} -p cleanType=realclean -i clean `echo *.fm5`
${G_myName} -p currentBase=`pwd` -p outputs=all -i buildFigures `echo *.fm5`
${G_myName} -p currentBase=`pwd` -p outputs=all -i buildDocs `echo *.fm5`
${G_myName} -p outputs=all -i buildDocs `echo *.ttytex`
_EOF_
}


vis_help () {
  cat  << _EOF_

takeAction in the main program

_EOF_
}

noArgsHook() {
  vis_examples
}

function vis_buildDocs {
  #set -x
  typeset input="$*" currentFile

  for currentFile in ${input}
  do
    TM_trace "${currentFile}";

    subjectBaseName=`FN_prefix ${currentFile}`
    subjectExtensionName=`FN_extension ${currentFile}`
    TM_trace 9 "Subject Name is  ${subjectBaseName}"
    TM_trace 9 "Subject Extension is  ${subjectExtensionName}"
	
    case ${subjectExtensionName} in
      'ttytex')
	 typeset outputFormatsList=`getOutputFormatsList ${outputs}`
	 typeset singleOutput
	 for singleOutput in ${outputFormatsList} ; do
	   case ${singleOutput} in
	     'tty')
		    doing_tty ${subjectBaseName}
		    ;;
	     'dvi')
		    doing_dvi ${subjectBaseName}
		    ;;
	     'xdvi')
		     doing_dvi ${subjectBaseName}
		     xdvi ${subjectBaseName}.dvi
		     ;;
	     'ps')
		   doing_ps ${subjectBaseName}
		   ;;
	     'pdf')
		    doing_pdf ${subjectBaseName}
		    ;;
	     'pdf+')
		    doing_pdf ${subjectBaseName}
		    opDo acroread ${subjectBaseName}.pdf &
		    ;;
	     'lpr')
		    doing_ps
		    echo "Printing ${subjectBaseName}.ps"
		    lpr ${subjectBaseName}.ps 
		    ;;
	     'prehtml')
		    preProcForHtml ${subjectBaseName}
		    ;;
	     'prehtmlPC')
	            preProcForHtmlPC ${subjectBaseName}
		    ;;
	     'html')
		    ttytexToHtml ${subjectBaseName}
		    ;;
	     'onehtml')
		    ttytexToOneHtml ${subjectBaseName}
		    ;;
	     'simplehtml')
	            ttytexToSimpleHtml ${subjectBaseName}
		    ;;
	     'tex4ht')
	            ttytexWithTex4ht ${subjectBaseName}
		    ;;
	     'heveaHtml')
	            ttytexToHeveaHtml ${subjectBaseName}
		    ;;
	     'simplehtmlPC')
		    ttytexToSimpleHtmlPC ${subjectBaseName}
		    ;;
	     'all')
		 #doing_ps ${subjectBaseName}
		 doing_pdf ${subjectBaseName}
		 ttytexToHeveaHtml ${subjectBaseName}		 
		 #doing_tty ${subjectBaseName}
                 #ttytexWithTex4ht ${subjectBaseName}
		 #ttytexToOneHtml ${subjectBaseName}
		 #ttytexToHtml ${subjectBaseName}
		 ;;
	     *)
		EH_problem "Unknown: ${outputs}"
		exit 1
		;;
	   esac
	 done
	 ;;
      'texinfo')
	;;
      'tex')
	EH_oops "NOTYET"
	;;
      'fm5')
         EH_assert [[ "${currentBase}_" != "_" ]]
	 typeset outputFormatsList=`getOutputFormatsList ${outputs}`
	 typeset singleOutput
	 for singleOutput in ${outputFormatsList} ; do
	   case ${singleOutput} in
	     'ps')
		   doing_fm5ToPs  ${currentBase}/${subjectBaseName}
		   ;;
	     'pdf')
		    doing_fm5ToPdf  ${currentBase}/${subjectBaseName}
		    ;;
	     'all')
		    doing_fm5ToPs ${currentBase}/${subjectBaseName}
		    doing_fm5ToPdf ${currentBase}/${subjectBaseName}
		    ;;
	     *)
		EH_problem "Unknown: ${outputs}"
		exit 1
		;;
	   esac
	 done
	 ;;
      *)
	EH_problem "Unknown extension file: ${subjectExtensionName}"
	exit 1
	;;
    esac

  done
}

function vis_clean {
  #set -x
  typeset input="$*" currentFile

  for currentFile in ${input}
  do
    TM_trace "${currentFile}";

    subjectBaseName=`FN_prefix ${currentFile}`
    subjectExtensionName=`FN_extension ${currentFile}`
    TM_trace 9 "Subject Name is  ${subjectBaseName}"
    TM_trace 9 "Subject Extension is  ${subjectExtensionName}"
	
    case ${subjectExtensionName} in
      'ttytex')
	 case ${cleanType} in
	   'realclean')
		 doing_realclean ${subjectBaseName}
		 ;;
	   'cleanKeepResults')
		 doing_cleanKeepResults ${subjectBaseName}
		 ;;
	   *)
	      EH_problem "Unknown: ${cleanType}"
	      exit 1
	      ;;
	 esac
	 ;;
      'texinfo')
	;;
      'tex')
	EH_oops "NOTYET"
	exit
	;;
      'fm5')
	 case ${cleanType} in
	   'realclean')
		 opDo doing_realcleanFigure ${subjectBaseName}
		 ;;
	   'cleanKeepResults')
		 opDo doing_cleanKeepResultsFigure ${subjectBaseName}
		 ;;
	   *)
	      EH_problem "Unknown: ${cleanType}"
	      exit 1
	      ;;
	 esac
	 ;;
      'odg')
	    ANT_raw "Automated Processing of .odg is not yet supported, so cleaning does not apply"
	 ;;
      *)
	EH_problem "Unknown extension file: ${subjectExtensionName}"
	exit 1
	;;
    esac

  done
}

function doing_tty {
  logActivitySeparator
  textOnly="yes"
  ttytexToTtyDvi ${1}
  dvi2tty  ${1}.dvi > ${1}.tty
  chmod g+w $1.tty
  ls -l ${1}.tty
}

function doing_dvi {
  #$1=module name
  ttytexToTtyDvi ${1}
}

function doing_ps {
#set -x
  typeset DVIPS="dvips -f -t letter"
  logActivitySeparator
  ttytexToTtyDvi ${1}
  ${DVIPS} ${1}.dvi > ${1}.ps
  chmod g+w $1.ps
  ls -l ${1}.ps

  #echo ${subjectBaseName}
}

function doing_pdf {
  ttytexToPdf ${1}
}

function doing_realclean {
  # $1=${subjectBaseName}
#set -x

  FN_fileRmIfThere -v ${1}.aux ${1}.auxO \
   ${1}.dlog \
   ${1}.dvi  ${1}.toc \
   ${1}.log ${1}.tex \
   ${1}.idx ${1}.lof \
   ${1}.ilg ${1}.ind \
   ${1}.lot \
   ${1}.blg \
   ${1}.out \
   ${1}.snm \
   ${1}.nav \
   ${1}.pdfpc \
   ${1}.fls \
   ${1}-itags.py \
   screenCasting.el \
   ${1}.bbl ${1}.bblO \
   ${1}.glg \
   ${1}.glo \
   ${1}.gls \
   ${1}.glsdefs \
   ${1}.ist \
   ${1}.xdy \
   ${1}.tty \
   ${1}.*.vrb \
   ${1}.bcf \
   ${1}.run.xml \
   ${1}.ps \
   ${1}.pdf missfont.log comment.cut *~

  # 
  # tex4ht cleanups
  #
  FN_fileRmIfThere -v ${1}.4ct
  FN_fileRmIfThere -v ${1}.4tc
  FN_fileRmIfThere -v ${1}.idv
  FN_fileRmIfThere -v ${1}.lg
  FN_fileRmIfThere -v ${1}.tmp
  FN_fileRmIfThere -v ${1}.xref
  FN_fileRmIfThere -v semantic.cache
  FN_fileRmIfThere -v tex4ht.tmp 

  if [[ -d ${1%.*} || -d one-${1%.*} ]] ; then
    print "Removing ${1%.*} and one-${1%.*} directory"
    /bin/rm -r -f ${1%.*} one-${1%.*}
  fi
 
  # tex4ht
  if [[ -d tex4ht-${1%.*} ]] ; then
    print "Removing tex4ht-${1%.*} directory"
    /bin/rm -r -f tex4ht-${1%.*}
  fi

  # heveaHtml
  if [[ -d heveaHtml-${1%.*} ]] ; then
    print "Removing heveaHtml-${1%.*} directory"
    /bin/rm -r -f heveaHtml-${1%.*}
  fi

}

function doing_cleanKeepResults {
  # $1=${subjectBaseName}

  print -r -- "Cleaning But Keeping Results For ${1}.${2}"

  FN_fileRmIfThere -v ${1}.aux ${1}.auxO \
   ${1}.dlog \
   ${1}.dvi  ${1}.toc \
   ${1}.log ${1}.tex \
   ${1}.idx ${1}.lof \
   ${1}.ilg ${1}.ind \
   ${1}.lot \
   ${1}.blg \
   ${1}.out \
   ${1}.bbl ${1}.bblO \
   ${1}.glg \
   ${1}.glo \
   ${1}.gls \
   ${1}.xdy \         
   missfont.log
}

function doing_realcleanFigure {
  # $1=${subjectBaseName}

  FN_fileRmIfThere -v ${1}.epsi ${1}.pdf \
   ${1}.gif ${1}.tex ${1}.ps ${1}.ppm *~
}

function doing_cleanKeepResultsFigure {
  # $1=${subjectBaseName}

  FN_fileRmIfThere -v ${1}.ps ${1}.ppm *~ \
   
}

function ttytexToTtyDvi {
#set -x
  # $1 is the module name
  print -r -- "Building the $1.dvi File For TTY Generation"

  case ${opRunOsType} in
    'SunOS' | 'Linux' | 'CYGWIN_NT-5.0')
      echo "$0 running on ${opRunOsType} ...."
      if [[ "${textOnly}_" != "_nil_" ]] ; then
	sed -e "s@%ttyStyleFile%@palatino,@g" -e "s@16.5cm@8cm@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh | expand  > $1.tex
      else
	sed -e "s@%ttyStyleFile%@palatino,@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh | expand  > $1.tex
      fi
      ;;
    'Windows_NT' | 'UWIN-NT')
      echo "$0 running on ${opRunOsType} ...."
  sed -e "s@%ttyStyleFile%@@g" -e "s@pdfstyle,@@g" -e "s@html,@html,hyperref,@g" -e "s@\\\ifpdf@%\\\ifpdf@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh | expand  > $1.tex
      ;;
    *)
      #uname
      echo "$1 not Suported on ${opRunOsType}"
	exit
  esac

  if [ "${extraLatexOptions}_" != "_" ] ; then 
    echo "extraLatexOptions=${extraLatexOptions}"
    pslatex \\nonstopmode\\input $1.tex
    bibtex $1
    makeindex $1.idx
    pslatex \\nonstopmode\\input $1.tex
    pslatex \\nonstopmode\\input $1.tex
    chmod g+w $1.dvi
    ls -l $1.dvi
  else
    pslatex  $1.tex
    # NOTYET, BUG, Under Ubuntu 10.4 bibtex hangs -- get rid of symlink write a bash scriptbibtex.origin $@
    bibtex  $1
    makeindex $1.idx
    pslatex  $1.tex
    pslatex  $1.tex
    chmod g+w $1.dvi
    ls -l $1.dvi
  fi
}

function ttytexToPdf {

  # $1 is the module name
  print -r -- "Building the $1.pdf File For TTY Generation"

  case ${opRunOsType} in
    'SunOS' | 'Windows_NT' | 'Linux' | 'UWIN-NT' | 'CYGWIN_NT-5.0')
	# sed -e "s@%ttyStyleFile%@@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh | expand  > $1.tex
	sed -e "s@%ttyStyleFile%@@g" $1.ttytex | expand  > $1.tex	
	# sed -e "s@%ttyStyleFile%@@g" $1.ttytex | expand  > $1.tex
	;;
    *)
      #uname
      echo "$0 not Suported on ${opRunOsType}"
	exit
  esac

  if [ "${extraLatexOptions:-}_" != "_" ] ; then 
    echo "extraLatexOptions=${extraLatexOptions}"
  fi

  opDo vis_lcntProcPre "$1"

  case ${inFormat} in
      "latex"|"")
	  pdflatex ${extraLatexOptions} $1.tex
	  bibtex $1
	  makeindex $1.idx
	  makeglossaries $1
	  pdflatex ${extraLatexOptions} $1.tex
	  pdflatex ${extraLatexOptions} $1.tex
	  ;;
      "xelatex")
	  opDo xelatex  ${extraLatexOptions} $1.tex
	  #opDo echo SKIPPED: bibtex $1
	  opDo vis_bibTexProvider_run $1.ttytex	  
	  opDo makeindex $1.idx
	  opDo makeglossaries $1	  
	  opDo xelatex  ${extraLatexOptions} $1.tex
	  opDo xelatex  ${extraLatexOptions} $1.tex
	  ;;
      *)
	  EH_problem "Unknown inFormat ${inFormat}"
	exit
  esac

  if [ -f $1.pdfpc ] ; then
      opDo sed -i -e  's/\\\\/\n/g' -e  's/\\par/\n\n/g'  $1.pdfpc 
  fi

  chmod g+w $1.pdf
  opDo ls -l $1.pdf
}

function preProcForHtml {
  # $1 is the module name

  case ${opRunOsType} in
    'SunOS' | 'Windows_NT' | 'Linux' | 'UWIN-NT' | 'CYGWIN_NT-5.0')
      echo "$0 running on ${opRunOsType} ...."
      sed -e "s@%ttyStyleFile%@txt-old,@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh |  expand  > $1.tex
      #sed -e "s@%ttyStyleFile%@palatino,@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh |  expand  > $1.tex
      ;;
    *)
       echo "$0 not Suported on ${opRunOsType}"
       exit
       ;;
  esac

}

function preProcForHtmlPC {
  # $1 is the module name

  sed -e "s@%ttyStyleFile%@@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh -f /usr/curenv/bin/nedaGlobalVars.PC |  expand   > $1-PC.tex
}

function ttytexToHtml {
  # $1 is the module name
  print -r -- "Building HTML Files For $1"

  preProcForHtml $1

  if [ "${optionsList}" != "" ]
  then
    latex2html -init_file ${optionsList} $1.tex
  else
    latex2html -split 4  -address "" -info "" $1.tex
  fi

  chmod g+w $1
  echo "file:`pwd`/$1/$1.html"
}

function ttytexWithTex4ht {
  # $1 is the module name
  print -r -- "Building HTML With tex4ht For $1"

      sed -e "s@%ttyStyleFile%@@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh |  expand  > $1.tex

  #preProcForHtml $1

  tex4htHtmlBasedir=tex4ht-${1%.*}

  if [[ -d ${tex4htHtmlBasedir} ]] ; then
    EH_problem "Unclean ${tex4htHtmlBasedir} -- But using it"
  else
    opDoExit mkdir ${tex4htHtmlBasedir}
  fi

  if [ "${extraLatexOptions}_" != "_" ] ; then 
    echo "extraLatexOptions=${extraLatexOptions}"
  fi

  #opDo htlatex ${extraLatexOptions} $1.tex
  #opDo htlatex  $1.tex \"xhtml\" \"iso8859/1/charset/uni/!\"
  opDo htlatex  $1.tex

  opDo mv $1.html $1[0-9].html   ${tex4htHtmlBasedir}
  opDo mv $1[0-9][0-9].html   ${tex4htHtmlBasedir}
  opDo mv $1[0-9][0-9][0-9].html   ${tex4htHtmlBasedir}
  if [ ! -f $1.css ] ; then
      # NOTYET, this is to accomodate beamer when there is no css
      # it needs to mimic an empty css or the elisp filter
      # needs to be modified.
      touch $1.css
  fi
  opDo mv $1.css   ${tex4htHtmlBasedir}

  #opDo cp ${tex4htHtmlBasedir}/$1.html ${tex4htHtmlBasedir}/index.html 
  opDo elispFilterHtml.sh -v -n showRun -i inLineCss $1

  if [ -f ${1}0x.png ] ; then 
    opDo mv ${1}*.png ${tex4htHtmlBasedir}
  fi

  echo "file://`pwd`/${tex4htHtmlBasedir}/$1.html"
  echo "file://`pwd`/${tex4htHtmlBasedir}/index.html"

}

function ttytexToHeveaHtml {
  # $1 is the module name
  print -r -- "Building HTML With hevea For $1"

  sed -e "s@%ttyStyleFile%@@g" $1.ttytex | expand  > $1.tex	

  # sed -e "s@%ttyStyleFile%@@g" $1.ttytex | RCSdefVarsExpand.sh -f $1.ttytex | nedaGlobalVarsExpand.sh |  expand  > $1.tex

  #preProcForHtml $1

  heveaHtmlBasedir=heveaHtml-${1%.*}

  if [[ -d ${heveaHtmlBasedir} ]] ; then
    EH_problem "Unclean ${heveaHtmlBasedir} -- But using it"
  else
      opDoExit mkdir ${heveaHtmlBasedir}
      # NOTYET, run seedLcntProc.sh
      opDo seedLcntProc.sh -i outputBaseDirLinks ${heveaHtmlBasedir}
  fi

  if [ "${extraLatexOptions:-}_" != "_" ] ; then 
    echo "extraLatexOptions=${extraLatexOptions}"
  fi

  opDo vis_lcntProcPre "$1"

  local heveaMacrosBase=""
  if [ -d /bisos/apps/bxtex/hevea/macros ] ; then
      heveaMacrosBase="/bisos/apps/bxtex/hevea/macros"
  else
      heveaMacrosBase="/lcnt/bxdpt/hevea/macros"
  fi

  opDo hevea -o ${heveaHtmlBasedir}/$1.html -I ${heveaMacrosBase} bx-fixups.hva bx-enfa.hva bx-faen.hva framed.hva $1.ttytex
  opDo bibhva ${heveaHtmlBasedir}/$1 
  opDo hevea -o ${heveaHtmlBasedir}/$1.html -I ${heveaMacrosBase} bx-fixups.hva bx-enfa.hva bx-faen.hva framed.hva $1.ttytex
  opDo hevea -o ${heveaHtmlBasedir}/$1.html -I ${heveaMacrosBase} bx-fixups.hva bx-enfa.hva bx-faen.hva framed.hva $1.ttytex

  opDoComplain pushd ${heveaHtmlBasedir} 2> /dev/null ; EH_retOnFail
  if [ -s "${1}.image.tex"  ] ; then
      # NOTYET, detect applicability of latex vs xelatex
      #opDo egrep -v "usepackage.utf8..inputenc.|bidi" ${1}.image.tex > ${1}-xe.image.tex
      # NOTYET, ALL OF THIS PART NEEDS TO BE UPDATED MB-29032017
      # MB: Commented out next two lines for busPlan to work 25032018
      #opDo egrep -v "usepackage.bidi" ${1}.image.tex | sed -e "s@.ignorenonframetext.@@"  > ${1}-xe.image.tex
      #opDo mv ${1}-xe.image.tex ${1}.image.tex
      opDo bx-imagen -mag 2500 ${1}
  fi
  opDoComplain popd

  # NOTYET, Pass srcLang Info To script
  opDo elispFilterHtml.sh -v -n showRun -i heveaPlone3Fixups $1

  opDo vis_lcntProcPost "$1"

  echo "file://$( pwd )/${heveaHtmlBasedir}/$1.html"
  echo "file://$( pwd )/${heveaHtmlBasedir}/index.html"
}


function ttytexToSimpleHtml {
  # $1 is the module name
  print -r -- "Building HTML Files For $1"

  preProcForHtml $1
  
  latex2html -split 0  -address "" -no_navigation -info "" $1.tex
  chmod g+w $1
  echo "file:`pwd`/$1/$1.html"
}

function ttytexToOneHtml {
  # $1 is the module name
  print -r -- "Building HTML Files For $1"

  preProcForHtml $1
  
   latex2html -split 0 -dir one-$1 -mkdir -address "" -no_navigation -info "" -show_section_numbers -toc_depth 5 $1.tex

  cp one-$1/$1.html one-$1/$1-temp.html
  sed -e "s@$1.html#@#@g"  one-$1/$1-temp.html > one-$1/$1.html
  rm one-$1/$1-temp.html
  chmod g+w one-$1
  #cp $1.html index.html
  echo "file://`pwd`/one-$1/$1.html"
}

function ttytexToSimpleHtmlPC {
  # $1 is the module name
  print -r -- "Building HTML Files For $1"

  preProcForHtmlPC $1
  latex2html -split 4 -show_section_numbers -address "" -no_navigation -info "" $1-PC.tex
  echo "file:`pwd`/$1-PC/$1-PC.html"
}

function vis_buildFigures {

  typeset input="$*" currentFigure
  
  for currentFigure in ${input} ; do
    typeset outputFormatsList=`getOutputFormatsList ${outputs}`
    typeset singleOutput
    for singleOutput in ${outputFormatsList} ; do
      case ${singleOutput} in
	'epsi')
	   doing_figureEPSI ${currentBase}/${currentFigure}
	   ;;
	'pdf')
           doing_figurePDF ${currentBase}/${currentFigure%.*}
	   ;;
	'gif')
	   doing_figureGIF ${currentBase}/${currentFigure%.*}
	   ;;
	'odg')
	   ANT_raw "Automated conversion for odg is not yet supported"
	   ;;
	'all')
	   doing_figureEPSI ${currentBase}/${currentFigure}
	   doing_figurePDF ${currentBase}/${currentFigure%.*}
	   doing_figureGIF ${currentBase}/${currentFigure%.*}
	   ;;
	*)
	   EH_problem "Unknown: ${cleanType}"
	   exit 1
	   ;;
      esac
    done
  done
}

function doing_figureEPSI {

  # $1 = figure file (.fm5)
  echo Converting $1 to epsi
  opDoAtAs -h ${frameMakerHost} "/opt/local/frame5/bin/fmprint -p ${opSysConfigInputBase}/fm5/psPrintSetting.fm5  $1"
  echo "Waiting for printing of $1"
  sleep 20
  ls -l $1.ps
  sed -e "/^%%BeginPaperSize/d" -e "/^%%EndPaperSize/d" < $1.ps > /tmp/$$.psTmp
  mv /tmp/$$.psTmp $1.ps
  opDoAtAsRunMode "ssh ${frameMakerHost} 'env PATH=$PATH:/opt/public/foundation/bin LD_LIBRARY_PATH=$LD_LIBRARY_PATH fixfm5 -bb $1.ps $1.epsi'"
  #fixfm5 -bb $1.ps $1.epsi
  mv $1.ps ${1%.*}.ps
  mv $1.epsi ${1%.*}.epsi
  chmod 774 ${1%.*}.ps ${1%.*}.epsi
  ls -l ${1%.*}.ps ${1%.*}.epsi

}

function doing_figurePDF {

  echo Converting $1.ps to $1.pdf
  typeset x=`FN_dirsPart $1`
  typeset y=`FN_nonDirsPart $1`
  #opDoAtAsRunMode "ssh 192.168.0.103 cd ${x} ; ps2pdf ${y}.ps ${y}.pdf"
  #opDoAtAsRunMode "ssh jamshid.intra cd ${x} ; ps2pdf ${y}.ps ${y}.pdf"
  cd $x
  ps2pdf ${y}.ps ${y}.pdf
  chmod 774 ${y}.pdf
  ls -l ${y}.pdf
}

function doing_figurePDFOLD {

  echo Converting $1.epsi to $1.pdf
  epstopdf $1.epsi
  chmod 774 ${1%.*}.pdf
  ls -l ${1%.*}.pdf

}

function doing_figureGIF {

  echo Converting $1 to GIF
  opDoAtAsRunMode "ssh ${frameMakerHost} 'env PATH=$PATH:/opt/public/foundation/bin LD_LIBRARY_PATH=$LD_LIBRARY_PATH pstoimg -tmp /tmp  -type gif -debug -discard -interlace -crop ht -transparent -white -out $1.gif $1.ps'"
  #opDoAtAs -h 192.168.0.103 "pstoimg -tmp /tmp  -type gif -debug -discard -interlace -crop ht -transparent -white -out $1.gif $1.ps"

  chmod 774 ${1}.gif
  ls -l $1.gif

}

Comma_leftSide() {
 echo ${1%%,*}
}

Comma_rightSide() {
  echo ${1#*,}
}

function getOutputFormatsList {
  #set -x
  firstOutput=`Comma_leftSide ${outputs}`

  rightSide=`Comma_rightSide ${outputs}`

  if [[ "${firstOutput}" == "${rightSide}" ]] ; then
    print "${rightSide}"
    return 0
  fi

  typeset formatList=""
  while [ "${rightSide}X" != "X" ] ; do
    leftSide=`Comma_leftSide ${rightSide}`
    formatList="${formatList} ${leftSide}"
    if [ "${leftSide}X" == "${rightSide}X" ] ; then
      break
    fi
    rightSide=`Comma_rightSide ${rightSide}`
  done

  print "${firstOutput} ${formatList}"

}

function doing_fm5ToPs {
  echo "Converting $1.fm5 to PS"
  opDoAtAs -h ${frameMakerHost} "/opt/local/frame5/bin/fmprint -p ${opSysConfigInputBase}/fm5/psPrintSetting.fm5  $1.fm5"
  echo "Waiting for printing of $1.fm5"
  # How do we make sure that
  sleep 20
  mv $1.fm5.ps $1.ps
  chmod 774 $1.ps
  ls -l $1.ps
}

function doing_fm5ToPdf {
  echo "Converting $1.fm5 to PDF"
  if [[ ! -f $1.ps ]] ; then
    opDoComplain doing_fm5ToPs $1
  fi
  opDoAtAs -h ${frameMakerHost} "/opt/local/Acrobat3/bin/distill < $1.ps > $1.pdf"
  chmod 774 ${1}.pdf
  ls -l $1.pdf
}

function vis_tgrindBuild {

  echo "Converting $1 to tex"
  EH_assert [[ "${currentBase}_" != "_" ]]
  opDoAtAs -h ${frameMakerHost} "/opt/public/teTeX/bin/sparc-solaris/tgrind -f ${currentBase}/$1 > ${currentBase}/${1%.*}.tex"
  echo "Waiting for printing of ${currentBase}/$1"
  sleep 3
}

function vis_lcntProcPre {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
Verify that a lcntProc.sh is in place, then run lcntProc.sh -i lcnLcntInputPre
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if [ -f "lcntProc.sh" ] ; then
	opDo lcntProc.sh -i lcnLcntInputPre "$1"
    else
	EH_problem "Missing ./lcntProc.sh"
    fi

    lpReturn
}

function vis_lcntProcPost {
    G_funcEntry
    function describeF {  cat  << _EOF_
${G_myName}:${G_thisFunc}:Usage: 
Verify that a lcntProc.sh is in place, then run lcntProc.sh -i lcnLcntInputPost
_EOF_
    }
    EH_assert [[ $# -eq 1 ]]

    if [ -f "lcntProc.sh" ] ; then
	opDo lcntProc.sh -i lcnLcntInputPost "$1"
    else
	EH_problem "Missing ./lcntProc.sh"
    fi

    lpReturn
}
