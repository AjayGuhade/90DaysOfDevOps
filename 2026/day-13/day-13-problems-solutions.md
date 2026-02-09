# Problems Faced in Day 13 & How I Solved Them (DevOps Way)
## ❌ Problem 1: pvcreate command not found

Error

    sudo apt install pvcreate
    E: Unable to locate package pvcreate

🔍 Root Cause

- pvcreate is not a standalone package

- It is a binary provided by the lvm2 package

- Confusing commands with packages is a common beginner issue

✅ Solution

- Installed the correct package:

      sudo apt update
      sudo apt install lvm2

🧠 DevOps Best Practice

- Always identify which package provides a binary

- Verify installation using:

      which pvcreate
      pvcreate --version

## ❌ Problem 2: device is too small (pv_min_size)

Error

    pvcreate /dev/loop0
    Cannot use /dev/loop0: device is too small (pv_min_size)

🔍 Root Cause

    /dev/loop0 was only 4 KB

It was a Snap-managed loop device, not the practice disk

Ubuntu desktop creates many loop devices automatically for Snap packages

✅ Solution

Inspected block devices properly:

    lsblk


Identified correct loop devices:

    /dev/loop32 → 1G
    /dev/loop33 → 2G


Chose `/dev/loop33` safely:

    pvcreate /dev/loop33

## 🧠 DevOps Best Practice

- Never assume disk names

- Always verify size, mountpoints, and ownership before destructive commands

- Ignore loop devices mounted under /snap


## ✅ Final Outcome

- After resolving all issues:

- Physical Volume created successfully

- Volume Group and Logical Volume configured

- Filesystem mounted and tested

- Logical Volume extended online without downtime

## Most IMP  
“During my LVM lab, I faced issues related to missing packages, incorrect loop device selection, and LVM size constraints.
I resolved them by validating system state with lsblk, installing correct dependencies, selecting safe block devices, 
and respecting LVM safeguards — following best DevOps practices instead of force-fixing errors.”
