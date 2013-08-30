Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f48.google.com (mail-la0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4756CE005B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:36:30 -0700 (PDT)
Received: by mail-la0-f48.google.com with SMTP id er20so1135843lab.7
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 22:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EJkFc1+4oHE9Xc2TOXF7CnxeyKL2a/6Kx9YiNHGyRmg=;
	b=cyUCzTG9IAA1YB2Ll2M8NahaSUOx0pe4rUodZaVqqhhgLrnZN6bcbi6xI0HwkF9+kh
	1rFouG40DRcYSAghInrKeVeVBzULsBqCisYrQ9cQFWD6DPKs4MqvWgFQZ0b8ofJe3PNN
	SHq+YBvN6xVm0DnpnLlKRNrypjvQDErXwbMiSAM0E1+rxjGSfwv2EZVCaNWAGnbc1fw5
	9jzQMxAbvPYfI7TY5nvQ5yB3PM/SGwVU+4Z95HPij6xrJZidTS1twdWdzffakuyg8+iu
	bdoLf65B6dJ5J3xGdYv9WB4AXVTEMG8WehoTO5HdB8AWiuBwPO9myIBrQlo+Y9aVocIY
	hyTA==
MIME-Version: 1.0
X-Received: by 10.152.228.130 with SMTP id si2mr358197lac.32.1377840989715;
	Thu, 29 Aug 2013 22:36:29 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 22:36:29 -0700 (PDT)
In-Reply-To: <1377833844-14672-5-git-send-email-cjp256@gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-5-git-send-email-cjp256@gmail.com>
Date: Fri, 30 Aug 2013 01:36:29 -0400
Message-ID: <CADkTA4M38h0=R5=nG1EoOOnoKfodShCqHJ05S=m8na=MF92HFA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
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
X-List-Received-Date: Fri, 30 Aug 2013 05:36:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com> wrote:
> xen-image-initramfs: newly added initrd to support testing xen-image-minimal and init script based on init-live.sh.
> ---
>  recipes-extended/images/xen-image-initramfs.bb     |   17 ++
>  recipes-extended/images/xen-image-minimal.bb       |   55 +++++-
>  .../initrdscripts/files/init-boot-xen.sh           |  205 ++++++++++++++++++++
>  .../initrdscripts/initramfs-boot-xen_1.0.bb        |   16 ++
>  4 files changed, 286 insertions(+), 7 deletions(-)
>  create mode 100644 recipes-extended/images/xen-image-initramfs.bb
>  create mode 100644 recipes-extended/initrdscripts/files/init-boot-xen.sh
>  create mode 100644 recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>
> diff --git a/recipes-extended/images/xen-image-initramfs.bb b/recipes-extended/images/xen-image-initramfs.bb
> new file mode 100644
> index 0000000..d2f1301
> --- /dev/null
> +++ b/recipes-extended/images/xen-image-initramfs.bb
> @@ -0,0 +1,17 @@
> +DESCRIPTION = "Xen image initramfs"
> +
> +IMAGE_INSTALL = "initramfs-boot-xen busybox udev udev-extraconf base-passwd coreutils"
> +
> +# Do not pollute the initrd image with rootfs features
> +IMAGE_FEATURES = ""
> +
> +export IMAGE_BASENAME = "xen-image-initramfs"
> +
> +IMAGE_LINGUAS = ""
> +
> +LICENSE = "MIT"
> +
> +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
> +inherit core-image
> +
> +IMAGE_ROOTFS_SIZE = "8192"
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 0cf55d6..c941339 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -1,14 +1,55 @@
> -DESCRIPTION = "A minimal xen image"
> -IMAGE_INSTALL = "packagegroup-core-boot xen-minimal dropbear mdadm"
> +DESCRIPTION = "Image with Xen."
> +
> +INITRD_IMAGE ?= "xen-image-initramfs"
> +
> +IMAGE_INSTALL += " \
> +    ${CORE_IMAGE_BASE_INSTALL} \
> +    packagegroup-core-basic \
> +    packagegroup-core-ssh-openssh \
> +    kernel-module-xen-acpi-processor \
> +    kernel-module-xen-blkback \
> +    kernel-module-xen-blkfront \
> +    kernel-module-xen-evtchn \
> +    kernel-module-xenfs \
> +    kernel-module-xen-gntalloc \
> +    kernel-module-xen-gntdev \
> +    kernel-module-xen-netback \
> +    kernel-module-xen-netfront \
> +    kernel-module-xen-pcifront \
> +    kernel-module-xen-privcmd \
> +    kernel-module-xen-wdt \
> +    xen-base \
> +    xen-qemu \
> +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
> +    "
>
> -IMAGE_LINGUAS = " "
>  LICENSE = "MIT"
>
>  inherit core-image
>
> -IMAGE_ROOTFS_SIZE = "8192"
> +syslinux_iso_populate_append() {
> +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${ISODIR}${ISOLINUXDIR}
> +}
> +
> +syslinux_hddimg_populate_append() {
> +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${HDDDIR}${SYSLINUXDIR}
> +}
> +
> +grubefi_populate_append() {
> +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}${EFIDIR}/xen.gz
> +}
> +
> +populate_append() {
> +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
> +}
>
> -# remove not needed ipkg informations
> -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> +build_syslinux_cfg () {
> +       echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
> +       echo "DEFAULT boot" >> ${SYSLINUXCFG}
> +       echo "TIMEOUT 10" >> ${SYSLINUXCFG}
> +       echo "PROMPT 1" >> ${SYSLINUXCFG}
> +       echo "LABEL boot" >> ${SYSLINUXCFG}
> +       echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
> +       echo "  APPEND /xen.gz loglvl=all guest_loglvl=all console=com1,vga com1=115200,8n1 --- /vmlinuz ramdisk_size=32768 root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 --- /initrd" >> ${SYSLINUXCFG}
> +}
>
> -require xen-bootimg.inc
> diff --git a/recipes-extended/initrdscripts/files/init-boot-xen.sh b/recipes-extended/initrdscripts/files/init-boot-xen.sh
> new file mode 100644
> index 0000000..741f201
> --- /dev/null
> +++ b/recipes-extended/initrdscripts/files/init-boot-xen.sh
> @@ -0,0 +1,205 @@
> +#!/bin/sh
> +
> +PATH=/sbin:/bin:/usr/sbin:/usr/bin
> +
> +ROOT_MOUNT="/rootfs/"
> +ROOT_IMAGE="rootfs.img"
> +MOUNT="/bin/mount"
> +UMOUNT="/bin/umount"
> +ISOLINUX=""
> +
> +# Copied from initramfs-framework. The core of this script probably should be
> +# turned into initramfs-framework modules to reduce duplication.
> +udev_daemon() {
> +       OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
> +
> +       for o in $OPTIONS; do
> +               if [ -x "$o" ]; then
> +                       echo $o
> +                       return 0
> +               fi
> +       done
> +
> +       return 1
> +}
> +
> +_UDEV_DAEMON=`udev_daemon`
> +
> +early_setup() {
> +    mkdir -p /proc
> +    mkdir -p /sys
> +    mount -t proc proc /proc
> +    mount -t sysfs sysfs /sys
> +    mount -t devtmpfs none /dev
> +
> +    # support modular kernel
> +    modprobe isofs 2> /dev/null
> +
> +    mkdir -p /run
> +    mkdir -p /var/run
> +    mkdir -p /media
> +
> +    $_UDEV_DAEMON --daemon
> +    udevadm trigger --action=add
> +}
> +
> +read_args() {
> +    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
> +    for arg in $CMDLINE; do
> +        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
> +        case $arg in
> +            root=*)
> +                ROOT_DEVICE=$optarg ;;
> +            rootfstype=*)
> +                modprobe $optarg 2> /dev/null ;;
> +            LABEL=*)
> +                label=$optarg ;;
> +            video=*)
> +                video_mode=$arg ;;
> +            vga=*)
> +                vga_mode=$arg ;;
> +            console=*)
> +                if [ -z "${console_params}" ]; then
> +                    console_params=$arg
> +                else
> +                    console_params="$console_params $arg"
> +                fi ;;
> +            debugshell*)
> +                if [ -z "$optarg" ]; then
> +                        shelltimeout=30
> +                else
> +                        shelltimeout=$optarg
> +                fi
> +        esac
> +    done
> +}
> +
> +boot_live_root() {
> +    # Watches the udev event queue, and exits if all current events are handled
> +    udevadm settle --timeout=3 --quiet
> +    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
> +
> +    # Move the mount points of some filesystems over to
> +    # the corresponding directories under the real root filesystem.
> +    for dir in `awk '/\/dev.* \/media/{print $2}' /proc/mounts`; do
> +        mkdir -p  ${ROOT_MOUNT}/$dir
> +        mount -n --move $dir ${ROOT_MOUNT}/$dir
> +    done
> +    mount -n --move /proc ${ROOT_MOUNT}/proc
> +    mount -n --move /sys ${ROOT_MOUNT}/sys
> +    mount -n --move /dev ${ROOT_MOUNT}/dev
> +
> +    cd $ROOT_MOUNT
> +    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
> +}
> +
> +fatal() {
> +    echo $1 >$CONSOLE
> +    echo >$CONSOLE
> +    exec sh
> +}
> +
> +early_setup
> +
> +[ -z "$CONSOLE" ] && CONSOLE="/dev/console"
> +
> +read_args
> +
> +echo "Waiting for removable media..."
> +C=0
> +shelltimeout=5
> +while true
> +do
> +  udevadm trigger
> +  udevadm settle
> +  for i in `ls /media 2>/dev/null`; do
> +      if [ -f /media/$i/$ROOT_IMAGE ] ; then
> +               found="yes"
> +               break
> +         elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
> +               found="yes"
> +               ISOLINUX="isolinux"
> +               break
> +      fi
> +  done
> +  if [ "$found" = "yes" ]; then
> +      break;
> +  fi
> +  # don't wait for more than $shelltimeout seconds, if it's set
> +  if [ -n "$shelltimeout" ]; then
> +      echo -n " " $(( $shelltimeout - $C ))
> +      if [ $C -ge $shelltimeout ]; then
> +           echo "..."
> +          echo "Mounted filesystems"
> +           mount | grep media
> +           echo "Available block devices"
> +           ls /dev/sd*
> +           fatal "Cannot find rootfs.img file in /media/* , dropping to a shell "
> +      fi
> +      C=$(( C + 1 ))
> +  fi
> +  sleep 1
> +done
> +
> +# Try to make a union mount of the root image.
> +# If no unification filesystem is available, mount the image read-only.
> +mount_and_boot() {
> +    mkdir $ROOT_MOUNT
> +
> +    mknod /dev/loop0 b 7 0 2>/dev/null
> +
> +    # determine which unification filesystem to use
> +    union_fs_type=""
> +    if grep -q -w "overlayfs" /proc/filesystems; then
> +       union_fs_type="overlayfs"
> +    elif grep -q -w "aufs" /proc/filesystems; then
> +       union_fs_type="aufs"
> +    else
> +       union_fs_type=""
> +    fi
> +    # make a union mount if possible
> +    case $union_fs_type in
> +       "overlayfs")
> +           mkdir -p /rootfs.ro /rootfs.rw
> +           if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
> +               rm -rf /rootfs.ro /rootfs.rw
> +               fatal "Could not mount rootfs image"
> +           else
> +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
> +               mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw" overlayfs $ROOT_MOUNT
> +               mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
> +               mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
> +               mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
> +           fi
> +           ;;
> +       "aufs")
> +           mkdir -p /rootfs.ro /rootfs.rw
> +           if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
> +               rm -rf /rootfs.ro /rootfs.rw
> +               fatal "Could not mount rootfs image"
> +           else
> +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
> +               mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
> +               mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
> +               mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
> +               mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
> +           fi
> +           ;;
> +       "")
> +           if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
> +               fatal "Could not mount rootfs image"
> +           else
> +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOT_MOUNT/media
> +           fi
> +           ;;
> +    esac
> +
> +    # boot the image
> +    boot_live_root
> +}
> +
> +mount_and_boot
> +
> +# If we're getting here, we failed...
> +fatal "Installation image failed"
> +
> diff --git a/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb b/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
> new file mode 100644
> index 0000000..9380e83
> --- /dev/null
> +++ b/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "A live image init script with support for Xen"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
> +SRC_URI = "file://init-boot-xen.sh"
> +PR = "r0"
> +
> +inherit allarch
> +
> +RDEPENDS_${PN} = "udev udev-extraconf"
> +
> +FILES_${PN} += " /init "

I was going to ask if you are seeing any QA warnings with this, since
in the past we've had
to use update alternatives and priority to ensure that the right init
was used in an image .. but
then I noticed this is only pulled into the minimal config and there
shouldn't be any conflicting
init providers!

Bruce

> +
> +do_install() {
> +        install -m 0755 ${WORKDIR}/init-boot-xen.sh ${D}/init
> +}
> +
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

