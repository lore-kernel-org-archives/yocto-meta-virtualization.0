Return-Path: <flihp@twobit.us>
Received: from www.twobit.us (www.twobit.us [50.19.210.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4052FE0051D
	for <meta-virtualization@yoctoproject.org>;
	Sun,  8 Sep 2013 15:54:57 -0700 (PDT)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.117])
	by www.twobit.us with esmtpsa (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.72) (envelope-from <flihp@twobit.us>)
	id 1VInsc-0003v4-6j; Sun, 08 Sep 2013 22:54:56 +0000
Message-ID: <522D0032.5040700@twobit.us>
Date: Sun, 08 Sep 2013 18:54:42 -0400
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-5-git-send-email-cjp256@gmail.com>
	<CADkTA4M38h0=R5=nG1EoOOnoKfodShCqHJ05S=m8na=MF92HFA@mail.gmail.com>
	<CABZSBQeaFr2zaQwTeQciO6sw7Tvsedy=5m49MO9LkLVZE95QjA@mail.gmail.com>
In-Reply-To: <CABZSBQeaFr2zaQwTeQciO6sw7Tvsedy=5m49MO9LkLVZE95QjA@mail.gmail.com>
X-Enigmail-Version: 1.4.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on www.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.1
X-SA-Exim-Version: 4.2.1 (built Mon, 22 Mar 2010 06:26:47 +0000)
X-SA-Exim-Scanned: Yes (on www.twobit.us)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 4/4] xen-image-minimal: update image to support xen 4.3.0 base with xl toolstack.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Sep 2013 22:55:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Chris,

Do you have a meta-virt mirror where you're staging all of this? I went
through to test and build this against the master branches of oe-core
etc and had to make a few tweaks. Figured sending changes back to you
might speed this along.

Thanks,
- Philip

On 09/01/2013 12:41 AM, Chris Patterson wrote:
> The reasoning for xen-image-initramfs was that I had minor issues with
> using stock core-image-minimal-initramfs and initramfs-live-boot.
> 
> However, I have since tracked down the issue I was having with
> initramfs-live-boot, and determined we could drop initramfs-boot-xen in
> favor of initramfs-live-boot simply by adding LABEL=boot to the kernel args.
> 
> Beyond that, vanilla core-image-minimal-initramfs would hang at "Waiting
> for removeable media..." indefinitely.  After some testing, It appeared
> that adding coreutils to core-image-minimal-initramfs would resolve the
> issue (though not yet sure why, but looking into it).
> 
> 
> On Fri, Aug 30, 2013 at 1:36 AM, Bruce Ashfield
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
> 
>     On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com
>     <mailto:cjp256@gmail.com>> wrote:
>     > xen-image-initramfs: newly added initrd to support testing
>     xen-image-minimal and init script based on init-live.sh.
>     > ---
>     >  recipes-extended/images/xen-image-initramfs.bb
>     <http://xen-image-initramfs.bb>     |   17 ++
>     >  recipes-extended/images/xen-image-minimal.bb
>     <http://xen-image-minimal.bb>       |   55 +++++-
>     >  .../initrdscripts/files/init-boot-xen.sh           |  205
>     ++++++++++++++++++++
>     >  .../initrdscripts/initramfs-boot-xen_1.0.bb
>     <http://initramfs-boot-xen_1.0.bb>        |   16 ++
>     >  4 files changed, 286 insertions(+), 7 deletions(-)
>     >  create mode 100644 recipes-extended/images/xen-image-initramfs.bb
>     <http://xen-image-initramfs.bb>
>     >  create mode 100644
>     recipes-extended/initrdscripts/files/init-boot-xen.sh
>     >  create mode 100644
>     recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>     <http://initramfs-boot-xen_1.0.bb>
>     >
>     > diff --git a/recipes-extended/images/xen-image-initramfs.bb
>     <http://xen-image-initramfs.bb>
>     b/recipes-extended/images/xen-image-initramfs.bb
>     <http://xen-image-initramfs.bb>
>     > new file mode 100644
>     > index 0000000..d2f1301
>     > --- /dev/null
>     > +++ b/recipes-extended/images/xen-image-initramfs.bb
>     <http://xen-image-initramfs.bb>
>     > @@ -0,0 +1,17 @@
>     > +DESCRIPTION = "Xen image initramfs"
>     > +
>     > +IMAGE_INSTALL = "initramfs-boot-xen busybox udev udev-extraconf
>     base-passwd coreutils"
>     > +
>     > +# Do not pollute the initrd image with rootfs features
>     > +IMAGE_FEATURES = ""
>     > +
>     > +export IMAGE_BASENAME = "xen-image-initramfs"
>     > +
>     > +IMAGE_LINGUAS = ""
>     > +
>     > +LICENSE = "MIT"
>     > +
>     > +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>     > +inherit core-image
>     > +
>     > +IMAGE_ROOTFS_SIZE = "8192"
>     > diff --git a/recipes-extended/images/xen-image-minimal.bb
>     <http://xen-image-minimal.bb>
>     b/recipes-extended/images/xen-image-minimal.bb
>     <http://xen-image-minimal.bb>
>     > index 0cf55d6..c941339 100644
>     > --- a/recipes-extended/images/xen-image-minimal.bb
>     <http://xen-image-minimal.bb>
>     > +++ b/recipes-extended/images/xen-image-minimal.bb
>     <http://xen-image-minimal.bb>
>     > @@ -1,14 +1,55 @@
>     > -DESCRIPTION = "A minimal xen image"
>     > -IMAGE_INSTALL = "packagegroup-core-boot xen-minimal dropbear mdadm"
>     > +DESCRIPTION = "Image with Xen."
>     > +
>     > +INITRD_IMAGE ?= "xen-image-initramfs"
>     > +
>     > +IMAGE_INSTALL += " \
>     > +    ${CORE_IMAGE_BASE_INSTALL} \
>     > +    packagegroup-core-basic \
>     > +    packagegroup-core-ssh-openssh \
>     > +    kernel-module-xen-acpi-processor \
>     > +    kernel-module-xen-blkback \
>     > +    kernel-module-xen-blkfront \
>     > +    kernel-module-xen-evtchn \
>     > +    kernel-module-xenfs \
>     > +    kernel-module-xen-gntalloc \
>     > +    kernel-module-xen-gntdev \
>     > +    kernel-module-xen-netback \
>     > +    kernel-module-xen-netfront \
>     > +    kernel-module-xen-pcifront \
>     > +    kernel-module-xen-privcmd \
>     > +    kernel-module-xen-wdt \
>     > +    xen-base \
>     > +    xen-qemu \
>     > +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>     > +    "
>     >
>     > -IMAGE_LINGUAS = " "
>     >  LICENSE = "MIT"
>     >
>     >  inherit core-image
>     >
>     > -IMAGE_ROOTFS_SIZE = "8192"
>     > +syslinux_iso_populate_append() {
>     > +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32
>     ${ISODIR}${ISOLINUXDIR}
>     > +}
>     > +
>     > +syslinux_hddimg_populate_append() {
>     > +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32
>     ${HDDDIR}${SYSLINUXDIR}
>     > +}
>     > +
>     > +grubefi_populate_append() {
>     > +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
>     ${DEST}${EFIDIR}/xen.gz
>     > +}
>     > +
>     > +populate_append() {
>     > +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
>     ${DEST}/xen.gz
>     > +}
>     >
>     > -# remove not needed ipkg informations
>     > -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
>     > +build_syslinux_cfg () {
>     > +       echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
>     > +       echo "DEFAULT boot" >> ${SYSLINUXCFG}
>     > +       echo "TIMEOUT 10" >> ${SYSLINUXCFG}
>     > +       echo "PROMPT 1" >> ${SYSLINUXCFG}
>     > +       echo "LABEL boot" >> ${SYSLINUXCFG}
>     > +       echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
>     > +       echo "  APPEND /xen.gz loglvl=all guest_loglvl=all
>     console=com1,vga com1=115200,8n1 --- /vmlinuz ramdisk_size=32768
>     root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10
>     --- /initrd" >> ${SYSLINUXCFG}
>     > +}
>     >
>     > -require xen-bootimg.inc
>     > diff --git a/recipes-extended/initrdscripts/files/init-boot-xen.sh
>     b/recipes-extended/initrdscripts/files/init-boot-xen.sh
>     > new file mode 100644
>     > index 0000000..741f201
>     > --- /dev/null
>     > +++ b/recipes-extended/initrdscripts/files/init-boot-xen.sh
>     > @@ -0,0 +1,205 @@
>     > +#!/bin/sh
>     > +
>     > +PATH=/sbin:/bin:/usr/sbin:/usr/bin
>     > +
>     > +ROOT_MOUNT="/rootfs/"
>     > +ROOT_IMAGE="rootfs.img"
>     > +MOUNT="/bin/mount"
>     > +UMOUNT="/bin/umount"
>     > +ISOLINUX=""
>     > +
>     > +# Copied from initramfs-framework. The core of this script
>     probably should be
>     > +# turned into initramfs-framework modules to reduce duplication.
>     > +udev_daemon() {
>     > +       OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd
>     /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
>     > +
>     > +       for o in $OPTIONS; do
>     > +               if [ -x "$o" ]; then
>     > +                       echo $o
>     > +                       return 0
>     > +               fi
>     > +       done
>     > +
>     > +       return 1
>     > +}
>     > +
>     > +_UDEV_DAEMON=`udev_daemon`
>     > +
>     > +early_setup() {
>     > +    mkdir -p /proc
>     > +    mkdir -p /sys
>     > +    mount -t proc proc /proc
>     > +    mount -t sysfs sysfs /sys
>     > +    mount -t devtmpfs none /dev
>     > +
>     > +    # support modular kernel
>     > +    modprobe isofs 2> /dev/null
>     > +
>     > +    mkdir -p /run
>     > +    mkdir -p /var/run
>     > +    mkdir -p /media
>     > +
>     > +    $_UDEV_DAEMON --daemon
>     > +    udevadm trigger --action=add
>     > +}
>     > +
>     > +read_args() {
>     > +    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
>     > +    for arg in $CMDLINE; do
>     > +        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
>     > +        case $arg in
>     > +            root=*)
>     > +                ROOT_DEVICE=$optarg ;;
>     > +            rootfstype=*)
>     > +                modprobe $optarg 2> /dev/null ;;
>     > +            LABEL=*)
>     > +                label=$optarg ;;
>     > +            video=*)
>     > +                video_mode=$arg ;;
>     > +            vga=*)
>     > +                vga_mode=$arg ;;
>     > +            console=*)
>     > +                if [ -z "${console_params}" ]; then
>     > +                    console_params=$arg
>     > +                else
>     > +                    console_params="$console_params $arg"
>     > +                fi ;;
>     > +            debugshell*)
>     > +                if [ -z "$optarg" ]; then
>     > +                        shelltimeout=30
>     > +                else
>     > +                        shelltimeout=$optarg
>     > +                fi
>     > +        esac
>     > +    done
>     > +}
>     > +
>     > +boot_live_root() {
>     > +    # Watches the udev event queue, and exits if all current
>     events are handled
>     > +    udevadm settle --timeout=3 --quiet
>     > +    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
>     > +
>     > +    # Move the mount points of some filesystems over to
>     > +    # the corresponding directories under the real root filesystem.
>     > +    for dir in `awk '/\/dev.* \/media/{print $2}' /proc/mounts`; do
>     > +        mkdir -p  ${ROOT_MOUNT}/$dir
>     > +        mount -n --move $dir ${ROOT_MOUNT}/$dir
>     > +    done
>     > +    mount -n --move /proc ${ROOT_MOUNT}/proc
>     > +    mount -n --move /sys ${ROOT_MOUNT}/sys
>     > +    mount -n --move /dev ${ROOT_MOUNT}/dev
>     > +
>     > +    cd $ROOT_MOUNT
>     > +    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
>     > +}
>     > +
>     > +fatal() {
>     > +    echo $1 >$CONSOLE
>     > +    echo >$CONSOLE
>     > +    exec sh
>     > +}
>     > +
>     > +early_setup
>     > +
>     > +[ -z "$CONSOLE" ] && CONSOLE="/dev/console"
>     > +
>     > +read_args
>     > +
>     > +echo "Waiting for removable media..."
>     > +C=0
>     > +shelltimeout=5
>     > +while true
>     > +do
>     > +  udevadm trigger
>     > +  udevadm settle
>     > +  for i in `ls /media 2>/dev/null`; do
>     > +      if [ -f /media/$i/$ROOT_IMAGE ] ; then
>     > +               found="yes"
>     > +               break
>     > +         elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
>     > +               found="yes"
>     > +               ISOLINUX="isolinux"
>     > +               break
>     > +      fi
>     > +  done
>     > +  if [ "$found" = "yes" ]; then
>     > +      break;
>     > +  fi
>     > +  # don't wait for more than $shelltimeout seconds, if it's set
>     > +  if [ -n "$shelltimeout" ]; then
>     > +      echo -n " " $(( $shelltimeout - $C ))
>     > +      if [ $C -ge $shelltimeout ]; then
>     > +           echo "..."
>     > +          echo "Mounted filesystems"
>     > +           mount | grep media
>     > +           echo "Available block devices"
>     > +           ls /dev/sd*
>     > +           fatal "Cannot find rootfs.img file in /media/* ,
>     dropping to a shell "
>     > +      fi
>     > +      C=$(( C + 1 ))
>     > +  fi
>     > +  sleep 1
>     > +done
>     > +
>     > +# Try to make a union mount of the root image.
>     > +# If no unification filesystem is available, mount the image
>     read-only.
>     > +mount_and_boot() {
>     > +    mkdir $ROOT_MOUNT
>     > +
>     > +    mknod /dev/loop0 b 7 0 2>/dev/null
>     > +
>     > +    # determine which unification filesystem to use
>     > +    union_fs_type=""
>     > +    if grep -q -w "overlayfs" /proc/filesystems; then
>     > +       union_fs_type="overlayfs"
>     > +    elif grep -q -w "aufs" /proc/filesystems; then
>     > +       union_fs_type="aufs"
>     > +    else
>     > +       union_fs_type=""
>     > +    fi
>     > +    # make a union mount if possible
>     > +    case $union_fs_type in
>     > +       "overlayfs")
>     > +           mkdir -p /rootfs.ro <http://rootfs.ro> /rootfs.rw
>     <http://rootfs.rw>
>     > +           if ! mount -o rw,loop,noatime,nodiratime
>     /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro <http://rootfs.ro>; then
>     > +               rm -rf /rootfs.ro <http://rootfs.ro> /rootfs.rw
>     <http://rootfs.rw>
>     > +               fatal "Could not mount rootfs image"
>     > +           else
>     > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs
>     /rootfs.rw <http://rootfs.rw>
>     > +               mount -t overlayfs -o "lowerdir=/rootfs.ro
>     <http://rootfs.ro>,upperdir=/rootfs.rw <http://rootfs.rw>" overlayfs
>     $ROOT_MOUNT
>     > +               mkdir -p $ROOT_MOUNT/rootfs.ro <http://rootfs.ro>
>     $ROOT_MOUNT/rootfs.rw <http://rootfs.rw>
>     > +               mount --move /rootfs.ro <http://rootfs.ro>
>     $ROOT_MOUNT/rootfs.ro <http://rootfs.ro>
>     > +               mount --move /rootfs.rw <http://rootfs.rw>
>     $ROOT_MOUNT/rootfs.rw <http://rootfs.rw>
>     > +           fi
>     > +           ;;
>     > +       "aufs")
>     > +           mkdir -p /rootfs.ro <http://rootfs.ro> /rootfs.rw
>     <http://rootfs.rw>
>     > +           if ! mount -o rw,loop,noatime,nodiratime
>     /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro <http://rootfs.ro>; then
>     > +               rm -rf /rootfs.ro <http://rootfs.ro> /rootfs.rw
>     <http://rootfs.rw>
>     > +               fatal "Could not mount rootfs image"
>     > +           else
>     > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs
>     /rootfs.rw <http://rootfs.rw>
>     > +               mount -t aufs -o "dirs=/rootfs.rw
>     <http://rootfs.rw>=rw:/rootfs.ro <http://rootfs.ro>=ro" aufs $ROOT_MOUNT
>     > +               mkdir -p $ROOT_MOUNT/rootfs.ro <http://rootfs.ro>
>     $ROOT_MOUNT/rootfs.rw <http://rootfs.rw>
>     > +               mount --move /rootfs.ro <http://rootfs.ro>
>     $ROOT_MOUNT/rootfs.ro <http://rootfs.ro>
>     > +               mount --move /rootfs.rw <http://rootfs.rw>
>     $ROOT_MOUNT/rootfs.rw <http://rootfs.rw>
>     > +           fi
>     > +           ;;
>     > +       "")
>     > +           if ! mount -o rw,loop,noatime,nodiratime
>     /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
>     > +               fatal "Could not mount rootfs image"
>     > +           else
>     > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs
>     $ROOT_MOUNT/media
>     > +           fi
>     > +           ;;
>     > +    esac
>     > +
>     > +    # boot the image
>     > +    boot_live_root
>     > +}
>     > +
>     > +mount_and_boot
>     > +
>     > +# If we're getting here, we failed...
>     > +fatal "Installation image failed"
>     > +
>     > diff --git
>     a/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>     <http://initramfs-boot-xen_1.0.bb>
>     b/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>     <http://initramfs-boot-xen_1.0.bb>
>     > new file mode 100644
>     > index 0000000..9380e83
>     > --- /dev/null
>     > +++ b/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>     <http://initramfs-boot-xen_1.0.bb>
>     > @@ -0,0 +1,16 @@
>     > +DESCRIPTION = "A live image init script with support for Xen"
>     > +LICENSE = "MIT"
>     > +LIC_FILES_CHKSUM =
>     "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>     > +SRC_URI = "file://init-boot-xen.sh"
>     > +PR = "r0"
>     > +
>     > +inherit allarch
>     > +
>     > +RDEPENDS_${PN} = "udev udev-extraconf"
>     > +
>     > +FILES_${PN} += " /init "
> 
>     I was going to ask if you are seeing any QA warnings with this, since
>     in the past we've had
>     to use update alternatives and priority to ensure that the right init
>     was used in an image .. but
>     then I noticed this is only pulled into the minimal config and there
>     shouldn't be any conflicting
>     init providers!
> 
>     Bruce
> 
>     > +
>     > +do_install() {
>     > +        install -m 0755 ${WORKDIR}/init-boot-xen.sh ${D}/init
>     > +}
>     > +
>     > --
>     > 1.7.10.4
>     >
>     > _______________________________________________
>     > meta-virtualization mailing list
>     > meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
>     --
>     "Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end"
> 
> 
> 
> 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


