#!/bin/bash

####+BEGIN: bx:bash:top-of-file :vc "cvs" partof: "bystar" :copyleft "halaal+brief"
# {{{ DBLOCK-top-of-file
typeset RcsId="$Id: lcaGcipherDebBinsPrep.sh,v 1.4 2020-02-03 01:28:39 lsipusr Exp $"
# Copyright (c) 2011 Neda Communications, Inc. -- http://www.neda.com
# See PLPC-120001 for restrictions.
# This is a Halaal Poly-Existential intended to remain perpetually Halaal. 
# }}} DBLOCK-top-of-file
####+END:

####+BEGIN: bx:bsip:bash:seed-spec :types "seedSubjectBinsPrepDist.sh"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh]] | 
"
FILE="
*  /This File/ :: /bisos/bsip/bin/lcaVagrantBinsPrep.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedSubjectBinsPrepDist.sh -l $0 "$@" 
    exit $?
fi
####+END:

# {{{ NOTES/Status:

function vis_describe {  cat  << _EOF_

_EOF_
}

# }}}

# {{{ Components List

#apt-cache search something | egrep '^something'


itemOrderedList=( 
    "vagrant"
    "vagrantPlugins"
    # "vagrantDebUpstream"
    "packer_addRepo" 
    "packer" 

)

# }}}


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Module Specific Additions -- examplesHook
_CommentEnd_


function examplesHookPost {
  cat  << _EOF_
----- ADDITIONS -------
${G_myName} -i moduleDescription
${G_myName} ${extraInfo} -i repositoryAdd
_EOF_
}


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "vagrant"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: vagrant [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_vagrant () { distFamilyGenerationHookRun binsPrep_vagrant; }

binsPrep_vagrant_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "vagrant"; }

####+END:

item_vagrantDebUpstream () {
  distFamilyGenerationHookRun binsPrep_vagrantDebUpstream
}

binsPrep_vagrantDebUpstream_DEFAULT_DEFAULT () {
    mmaThisPkgName="na"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        lpDo sudo dpkg --purge --force-all vagrant

        inBaseDirDo /tmp wget https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.deb
    
        opDo sudo dpkg -i /tmp/vagrant_2.2.10_x86_64.deb
    }
}

item_vagrantPlugins () {
  distFamilyGenerationHookRun binsPrep_vagrantPlugins
}

binsPrep_vagrantPlugins_DEFAULT_DEFAULT () {
    mmaThisPkgName="na"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        lpDo sudo vagrant plugin install vagrant-libvirt
        lpDo sudo vagrant plugin install vagrant-disksize

        lpDo vagrant plugin list
    }
}


####+BEGIN: bx:dblock:lsip:binsprep:apt :module "packer"
_CommentBegin_
*  [[elisp:(org-cycle)][| ]]  [[elisp:(blee:ppmm:org-mode-toggle)][Nat]] [[elisp:(beginning-of-buffer)][Top]] [[elisp:(delete-other-windows)][(1)]] || Apt-Pkg       :: packer [[elisp:(org-cycle)][| ]]
_CommentEnd_
item_packer () { distFamilyGenerationHookRun binsPrep_packer; }

binsPrep_packer_DEFAULT_DEFAULT () { binsPrepAptPkgNameSet "packer"; }

####+END:


_CommentBegin_
*      ======[[elisp:(org-cycle)][Fold]]====== Apt-Pkg: packer_addRepo
_CommentEnd_

vis_repositoryAdd () {
    opDo eval "curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -"
    opDo sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
    opDo sudo apt-get update
}


item_packer_addRepo () {
  distFamilyGenerationHookRun binsPrep_packer_addRepo
}

binsPrep_packer_addRepo_DEFAULT_DEFAULT () {
    mmaThisPkgName="packer_addRepo"
    mmaPkgDebianName="${mmaThisPkgName}"
    mmaPkgDebianMethod="custom"  #  or "apt" no need for customInstallScript but with binsPrep_installPostHook

    function customInstallScript {
        opDo vis_repositoryAdd
    }
}


####+BEGIN: bx:dblock:bash:end-of-file :type "basic"
# {{{ DBLOCK-end-of-file
#local variables:
#major-mode: sh-mode
#fill-column: 90
# end:
# }}} DBLOCK-end-of-file
####+END:

