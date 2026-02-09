# Day 13 – Linux Volume Management (LVM)

## 🎯 Goal
Learn **Linux Logical Volume Manager (LVM)** to manage storage flexibly by creating, extending, and mounting volumes.

---

## 🔑 Key Concepts Learned
- Physical Volume (PV)
- Volume Group (VG)
- Logical Volume (LV)
- Dynamic resizing of storage without downtime

---

## 🔐 Switch to Root User

    sudo -i
# or
    sudo su

## 💽 Creating a Virtual Disk (No Spare Disk Available)

Since no extra physical disk was available, a loop device was used.

Create a 2GB Disk Image
          
    dd if=/dev/zero of=/tmp/disk1.img bs=1M count=2048

Attach the Disk Image to a Loop Device
    
    losetup -fP /tmp/disk1.img
    losetup -a

Verify Loop Device

    lsblk


✅ Identified usable loop device:

    /dev/loop33   2G   loop


⚠️ Note: Loop devices mounted under /snap were ignored as they are system-managed.

## 🧱 Task 2: Create Physical Volume (PV)

    pvcreate /dev/loop33

Verify

    pvs


📸 Screenshot: Physical Volume created

## 🗂️ Task 3: Create Volume Group (VG)

    vgcreate devops-vg /dev/loop33

Verify
vgs


📸 Screenshot: Volume Group details

## 📦 Task 4: Create Logical Volume (LV)
lvcreate -L 500M -n app-data devops-vg

    Verify
    lvs
    lsblk


📸 Screenshot: Logical Volume created

## 🧾 Task 5: Format and Mount Logical Volume
Create Filesystem
 
    mkfs.ext4 /dev/devops-vg/app-data

Create Mount Point
 
    mkdir -p /mnt/app-data

Mount the Logical Volume
 
    mount /dev/devops-vg/app-data /mnt/app-data

Verify

    df -h /mnt/app-data


📸 Screenshot: Mounted logical volume

✍️ Test the Mount
   
    touch /mnt/app-data/test.txt
    ls -l /mnt/app-data

## 📈 Task 6: Extend the Logical Volume
Extend LV by 200MB

    lvextend -L +200M /dev/devops-vg/app-data

Resize the Filesystem

    resize2fs /dev/devops-vg/app-data

Verify
  
    df -h /mnt/app-data


📸 Screenshot: Extended filesystem size

## 🧪 Final Verification
     
    lsblk
    pvs
    vgs
    lvs
    df -h


📸 Screenshot: Final LVM state

## 📚 What I Learned

LVM allows dynamic resizing of storage without downtime

Loop devices are useful for safe practice

Always verify block devices before running LVM commands

Ubuntu Snap packages create many loop devices — choose carefully

## 🚀 DevOps Relevance

Used in production servers and cloud environments

Enables flexible disk management

Critical for scaling applications without service interruption

