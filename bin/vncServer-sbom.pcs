#!/usr/bin/env python

""" #+begin_org
* Panel::  [[file:/bisos/panels/bisos-apps/NameOfThePanelComeHere/_nodeBase_/fullUsagePanel-en.org]]
* Overview and Relevant Pointers
#+end_org """

from bisos import b
# from bisos.b import cmndsSeed
from bisos.b import cs
from bisos.b import b_io

# import collections
import typing

from bisos.sbom import pkgsSeed  # pkgsSeed.plantWithWhich("seedSbom.cs")
ap = pkgsSeed.aptPkg

aptPkgsList = [
    ap("tigervnc-standalone-server"),  #   Standalone virtual network computing server
]

pkgsSeed.setup(
    aptPkgsList=aptPkgsList,
)


####+BEGIN: b:py3:cs:cmnd/classHead :cmndName "readme" :extent "verify" :comment "Describe" :parsMand "" :parsOpt "" :argsMin 0 :argsMax 0 :pyInv ""
""" #+begin_org
*  _[[elisp:(blee:menu-sel:outline:popupMenu)][±]]_ _[[elisp:(blee:menu-sel:navigation:popupMenu)][Ξ]]_ [[elisp:(outline-show-branches+toggle)][|=]] [[elisp:(bx:orgm:indirectBufOther)][|>]] *[[elisp:(blee:ppmm:org-mode-toggle)][|N]]*  CmndSvc-   [[elisp:(outline-show-subtree+toggle)][||]] <<readme>>  *Describe*  =verify= ro=cli   [[elisp:(org-cycle)][| ]]
#+end_org """
class readme(cs.Cmnd):
    cmndParamsMandatory = [ ]
    cmndParamsOptional = [ ]
    cmndArgsLen = {'Min': 0, 'Max': 0,}

    @cs.track(fnLoc=True, fnEntry=True, fnExit=True)
    def cmnd(self,
             rtInv: cs.RtInvoker,
             cmndOutcome: b.op.Outcome,
    ) -> b.op.Outcome:
        """Describe"""
        failed = b_io.eh.badOutcome
        callParamsDict = {}
        if self.invocationValidate(rtInv, cmndOutcome, callParamsDict, None).isProblematic():
            return failed(cmndOutcome)
####+END:
        descriptionStr = """\
We use tigervnc for both server and viewer.\
"""
        print(descriptionStr)

        return cmndOutcome.set(
            opError=b.op.OpError.Success,
            opResults=None,
        )

def examples_csu() -> b.op.Outcome:
    """Common Usage Examples for this Command-Service Unit"""

    cmnd = cs.examples.cmndEnter
    literal = cs.examples.execInsert

    cmndOutcome = b.op.Outcome()

    cs.examples.menuChapter('*VNC Server Examples*')
    if not (resStr := b.subProc.Op(outcome=cmndOutcome, log=0).bash(
       f"""which vncserver""").stdout):  return(b_io.eh.badOutcome(cmndOutcome))

    literal(f"which vncserver # {resStr.strip()}")
    literal("vncserver --version")
    literal("vncserver --help")

    cmnd('readme', comment=" # An overview short description")

    cs.examples.menuChapter('*End-Of  VNC Server Examples*')
    return cmndOutcome
