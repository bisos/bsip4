#!/bin/bash

typeset RcsId="$Id: opDiskDriveAdmin.sh,v 1.1.1.1 2016-06-08 23:49:51 lsipusr Exp $"

####+BEGIN: bx:bsip:bash:seed-spec :types "seedActions.bash"
SEED="
*  /[dblock]/ /Seed/ :: [[file:/bisos/core/bsip/bin/seedActions.bash]] | 
"
FILE="
*  /This File/ :: /bisos/core/bsip/bin/opDiskDriveAdmin.sh 
"
if [ "${loadFiles}" == "" ] ; then
    /bisos/core/bsip/bin/seedActions.bash -l $0 "$@" 
    exit $?
fi
####+END:


. ${opBinBase}/lpReRunAs.libSh


#
# Visible Functions
#

vis_examples () {
  typeset doLibExamples=`doLibExamplesOutput ${G_myName}`
 cat  << _EOF_
EXAMPLES:
${doLibExamples}
--- ACTIONS ---
${G_myName} -i help
${G_myName} -i helpMisc
${G_myName} -i helpDebPkgs
---- Locate Disk Drives
${G_myName} -e "Find Disk Drives" -i runFunc dmesg | egrep -i '^[hs].*disk'
df -T
---- Disk Partitions ----
${G_myName} -e "List ALL Disks ALL Partitions" -i runFunc fdisk -l
sudo fdisk -l
${G_myName} -e "List Disk Partitions" -i runFunc fdisk -l /dev/sdb
${G_myName} -e "CARE: Partition the disk" -i runFunc cfdisk /dev/sdb
# Choose type 83 (Linux)
---- Hardware Raid ----
${G_myName} -e "install needed modules" -i runFunc modeprobe megaraid
---- Software Raid ----
${G_myName} -e "Status of the raid" -i runFunc cat /proc/mdstat
mdadm --query --detail /dev/md127
mdadm --detail --test /dev/md127
---- Software Raid Break An Array -- Delete an array ---
mdadm --manage /dev/md127 --fail /dev/sdd
mdadm --manage /dev/md127 --remove /dev/sdd
mdadm --manage --stop /dev/md127
---- Bad Blocks ----
${G_myName} -e "BAD Blocks check" -i runFunc mkfs -c /dev/sdb1
---- File System Checks ----
${G_myName} -e "reiserfsck just check" -i runFunc reiserfsck --check --check /dev/sdb2
---- File System Build ---
${G_myName} -e "CARE: build a file system" -i runFunc mkreiserfs -d /dev/sdb1
${G_myName} -e "CARE: build a file system" -i runFunc mkreiserfs -d --format 3.6 /dev/sdb1
${G_myName} -e "CARE: build a file system" -i runFunc mkfs -t ext3 /dev/sdb1
sudo mkfs -t ext4 /dev/sdz1
---- Mount File System ----
${G_myName} -e "Mount a file system" -i runFunc mount /dev/sdb2 /mnt
NOTYET, NFS Mount
NOTYET, Samba Mount
---- Add to fstab  ----
sudo fdisk -l
sudo blkid
/etc/fstab line: UUID=c63ba96c-5290-48c6-806e-9f07dd051b40 /dd/this/XA ext3 defaults,relatime 0 0
/etc/fstab line: UUID=c63ba96c-5290-48c6-806e-9f07dd051b40 /dd/this/XA ntfs defaults,relatime 0 0
${G_myName} -i fstabLineGen /dev/sdb1 /dd/this/b ext4
sudo mkdir /dd/this/XA
${G_myName} -i fstabLineGen /dev/sda3 /dd/this/XA ntfs
---- Export a Directory  ---
${G_myName} -e "add exports line" -i runFunc xxx >> /etc/exports
${G_myName} -e "export" -i exportfs -a -r
NOTYET: export sambafs
---- EXTERNAL USB DRIVES ----
modprobe usb-storage 
dmesg | grep -i USB

_EOF_
}


noArgsHook() {
  vis_examples
}


vis_helpMisc () {
  cat  << _EOF_

You can find module names from
  /lib/modules/2.6.8-2-386/kernel/drivers/scsi/megaraid.ko 

ignore .ko and that is the module name

Then 
    modprobe megaraid
After 2.6.12
    modprobe megaraid-mm
    modprobe megaraid-mbox

Then look at dmesg and see names of devices 
that were detected.

If it is a brand new disk or hardware raid array that is being
configured then go through cfdisk and create the partitions.
    Create
    Write
    Quit

Then create the filesystem
    mkreiserfs

Check the file system.

Mount it.

Edit fstab and add the line.

_EOF_
}


function vis_fstabLineGen {
    G_funcEntry
    function describeF {  G_funcEntryShow; cat  << _EOF_
_EOF_
    }

    EH_assert [[ $# -eq 3 ]]

    if vis_reRunAsRoot ${G_thisFunc} $@ ; then lpReturn ${globalReRunRetVal}; fi;
    
    typeset dev=$1
    typeset mountPoint=$2
    typeset fsType=$3

    typeset uuid=$( blkid -o value ${dev} | head -1 )

    echo "UUID=${uuid} ${mountPoint} ${fsType} defaults,relatime 0 0"


    lpReturn
}
