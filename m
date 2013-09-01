Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 801DEE00282
	for <meta-virtualization@yoctoproject.org>;
	Sun,  1 Sep 2013 07:25:10 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id eo20so2901162lab.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 01 Sep 2013 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=5hDOThHyd4RmWD0vHp64nn2BC6pNGcHSERJrClPDtyE=;
	b=q8+Kzs/jukEuR4zN6cbl7wIIhA6d17QJFy5nVLcVjgaZ3kgci8RNz3lk8ktYcQYl+P
	HjHdki39ytSrgDiieSPJGtQrsysaqzkLeTj1LY5zgL/6yO63KZBZ6AfG5YzHG1YllT18
	10LMmAyxDQ4bSlaqi76CHXEGdSfOijQHYE99FeVMtsBsHwiaFeXQrcGfnGip+OoO5Ojq
	P2HaIED347w9VMSl5LivkTVTqAJEULHEbP1F1MVWcm9FJ7te6x4TuPgDPszVamhVc1ku
	P0hsHqV1fFfF2OZP/CcVxI+CtWGCb2/jfd0I8ieFW//fBUooO+IhZAIW7dvxCEjmG/P+
	jUQA==
MIME-Version: 1.0
X-Received: by 10.152.30.74 with SMTP id q10mr1992786lah.27.1378045509264;
	Sun, 01 Sep 2013 07:25:09 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Sun, 1 Sep 2013 07:25:09 -0700 (PDT)
In-Reply-To: <CABZSBQeaFr2zaQwTeQciO6sw7Tvsedy=5m49MO9LkLVZE95QjA@mail.gmail.com>
References: <1377833844-14672-1-git-send-email-cjp256@gmail.com>
	<1377833844-14672-5-git-send-email-cjp256@gmail.com>
	<CADkTA4M38h0=R5=nG1EoOOnoKfodShCqHJ05S=m8na=MF92HFA@mail.gmail.com>
	<CABZSBQeaFr2zaQwTeQciO6sw7Tvsedy=5m49MO9LkLVZE95QjA@mail.gmail.com>
Date: Sun, 1 Sep 2013 10:25:09 -0400
Message-ID: <CABZSBQcqjGgouK9s3-9-mpLtROK4zN-rW5Fj-spoze6kzLHLgw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
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
X-List-Received-Date: Sun, 01 Sep 2013 14:25:12 -0000
Content-Type: multipart/alternative; boundary=089e0158c410106a9f04e553399c

--089e0158c410106a9f04e553399c
Content-Type: text/plain; charset=ISO-8859-1

Tracked down the issue to the busybox defconfig in the meta-virt layer.

There were patches upstreamed to udev's mount script to require 'stat' in
addition to a similar update to busybox's config to provide it.

commit ef7e1239b95dbef4e461007d6d0612c27a7919ec
Author: Andy Ross <andy.ross@windriver.com>
Date:   Tue Sep 18 14:38:44 2012 -0700
busybox: add /usr/bin/stat applet...

commit 3543d0db691e82098c1da7bf12f43e0c57551a3d
Author: Andy Ross <andy.ross@windriver.com>
Date:   Tue Sep 18 14:38:45 2012 -0700
udev-extraconf: Don't mount root filesystem under /media...

I suppose this could be resolved by updating the busybox defconfig to a
fragment turning on only the extra bits it wants?  Or should I be
prioritizing my layers differently?


On Sun, Sep 1, 2013 at 12:41 AM, Chris Patterson <cjp256@gmail.com> wrote:

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
> On Fri, Aug 30, 2013 at 1:36 AM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:
>
>> On Thu, Aug 29, 2013 at 11:37 PM, Chris Patterson <cjp256@gmail.com>
>> wrote:
>> > xen-image-initramfs: newly added initrd to support testing
>> xen-image-minimal and init script based on init-live.sh.
>> > ---
>> >  recipes-extended/images/xen-image-initramfs.bb     |   17 ++
>> >  recipes-extended/images/xen-image-minimal.bb       |   55 +++++-
>> >  .../initrdscripts/files/init-boot-xen.sh           |  205
>> ++++++++++++++++++++
>> >  .../initrdscripts/initramfs-boot-xen_1.0.bb        |   16 ++
>> >  4 files changed, 286 insertions(+), 7 deletions(-)
>> >  create mode 100644 recipes-extended/images/xen-image-initramfs.bb
>> >  create mode 100644
>> recipes-extended/initrdscripts/files/init-boot-xen.sh
>> >  create mode 100644 recipes-extended/initrdscripts/
>> initramfs-boot-xen_1.0.bb
>> >
>> > diff --git a/recipes-extended/images/xen-image-initramfs.bbb/recipes-extended/images/
>> xen-image-initramfs.bb
>> > new file mode 100644
>> > index 0000000..d2f1301
>> > --- /dev/null
>> > +++ b/recipes-extended/images/xen-image-initramfs.bb
>> > @@ -0,0 +1,17 @@
>> > +DESCRIPTION = "Xen image initramfs"
>> > +
>> > +IMAGE_INSTALL = "initramfs-boot-xen busybox udev udev-extraconf
>> base-passwd coreutils"
>> > +
>> > +# Do not pollute the initrd image with rootfs features
>> > +IMAGE_FEATURES = ""
>> > +
>> > +export IMAGE_BASENAME = "xen-image-initramfs"
>> > +
>> > +IMAGE_LINGUAS = ""
>> > +
>> > +LICENSE = "MIT"
>> > +
>> > +IMAGE_FSTYPES = "${INITRAMFS_FSTYPES}"
>> > +inherit core-image
>> > +
>> > +IMAGE_ROOTFS_SIZE = "8192"
>> > diff --git a/recipes-extended/images/xen-image-minimal.bbb/recipes-extended/images/
>> xen-image-minimal.bb
>> > index 0cf55d6..c941339 100644
>> > --- a/recipes-extended/images/xen-image-minimal.bb
>> > +++ b/recipes-extended/images/xen-image-minimal.bb
>> > @@ -1,14 +1,55 @@
>> > -DESCRIPTION = "A minimal xen image"
>> > -IMAGE_INSTALL = "packagegroup-core-boot xen-minimal dropbear mdadm"
>> > +DESCRIPTION = "Image with Xen."
>> > +
>> > +INITRD_IMAGE ?= "xen-image-initramfs"
>> > +
>> > +IMAGE_INSTALL += " \
>> > +    ${CORE_IMAGE_BASE_INSTALL} \
>> > +    packagegroup-core-basic \
>> > +    packagegroup-core-ssh-openssh \
>> > +    kernel-module-xen-acpi-processor \
>> > +    kernel-module-xen-blkback \
>> > +    kernel-module-xen-blkfront \
>> > +    kernel-module-xen-evtchn \
>> > +    kernel-module-xenfs \
>> > +    kernel-module-xen-gntalloc \
>> > +    kernel-module-xen-gntdev \
>> > +    kernel-module-xen-netback \
>> > +    kernel-module-xen-netfront \
>> > +    kernel-module-xen-pcifront \
>> > +    kernel-module-xen-privcmd \
>> > +    kernel-module-xen-wdt \
>> > +    xen-base \
>> > +    xen-qemu \
>> > +    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>> > +    "
>> >
>> > -IMAGE_LINGUAS = " "
>> >  LICENSE = "MIT"
>> >
>> >  inherit core-image
>> >
>> > -IMAGE_ROOTFS_SIZE = "8192"
>> > +syslinux_iso_populate_append() {
>> > +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32
>> ${ISODIR}${ISOLINUXDIR}
>> > +}
>> > +
>> > +syslinux_hddimg_populate_append() {
>> > +       install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32
>> ${HDDDIR}${SYSLINUXDIR}
>> > +}
>> > +
>> > +grubefi_populate_append() {
>> > +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
>> ${DEST}${EFIDIR}/xen.gz
>> > +}
>> > +
>> > +populate_append() {
>> > +       install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
>> ${DEST}/xen.gz
>> > +}
>> >
>> > -# remove not needed ipkg informations
>> > -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
>> > +build_syslinux_cfg () {
>> > +       echo "ALLOWOPTIONS 1" > ${SYSLINUXCFG}
>> > +       echo "DEFAULT boot" >> ${SYSLINUXCFG}
>> > +       echo "TIMEOUT 10" >> ${SYSLINUXCFG}
>> > +       echo "PROMPT 1" >> ${SYSLINUXCFG}
>> > +       echo "LABEL boot" >> ${SYSLINUXCFG}
>> > +       echo "  KERNEL mboot.c32" >> ${SYSLINUXCFG}
>> > +       echo "  APPEND /xen.gz loglvl=all guest_loglvl=all
>> console=com1,vga com1=115200,8n1 --- /vmlinuz ramdisk_size=32768
>> root=/dev/ram0 rw console=hvc0 earlyprintk=xen console=tty0 panic=10 ---
>> /initrd" >> ${SYSLINUXCFG}
>> > +}
>> >
>> > -require xen-bootimg.inc
>> > diff --git a/recipes-extended/initrdscripts/files/init-boot-xen.sh
>> b/recipes-extended/initrdscripts/files/init-boot-xen.sh
>> > new file mode 100644
>> > index 0000000..741f201
>> > --- /dev/null
>> > +++ b/recipes-extended/initrdscripts/files/init-boot-xen.sh
>> > @@ -0,0 +1,205 @@
>> > +#!/bin/sh
>> > +
>> > +PATH=/sbin:/bin:/usr/sbin:/usr/bin
>> > +
>> > +ROOT_MOUNT="/rootfs/"
>> > +ROOT_IMAGE="rootfs.img"
>> > +MOUNT="/bin/mount"
>> > +UMOUNT="/bin/umount"
>> > +ISOLINUX=""
>> > +
>> > +# Copied from initramfs-framework. The core of this script probably
>> should be
>> > +# turned into initramfs-framework modules to reduce duplication.
>> > +udev_daemon() {
>> > +       OPTIONS="/sbin/udev/udevd /sbin/udevd /lib/udev/udevd
>> /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd"
>> > +
>> > +       for o in $OPTIONS; do
>> > +               if [ -x "$o" ]; then
>> > +                       echo $o
>> > +                       return 0
>> > +               fi
>> > +       done
>> > +
>> > +       return 1
>> > +}
>> > +
>> > +_UDEV_DAEMON=`udev_daemon`
>> > +
>> > +early_setup() {
>> > +    mkdir -p /proc
>> > +    mkdir -p /sys
>> > +    mount -t proc proc /proc
>> > +    mount -t sysfs sysfs /sys
>> > +    mount -t devtmpfs none /dev
>> > +
>> > +    # support modular kernel
>> > +    modprobe isofs 2> /dev/null
>> > +
>> > +    mkdir -p /run
>> > +    mkdir -p /var/run
>> > +    mkdir -p /media
>> > +
>> > +    $_UDEV_DAEMON --daemon
>> > +    udevadm trigger --action=add
>> > +}
>> > +
>> > +read_args() {
>> > +    [ -z "$CMDLINE" ] && CMDLINE=`cat /proc/cmdline`
>> > +    for arg in $CMDLINE; do
>> > +        optarg=`expr "x$arg" : 'x[^=]*=\(.*\)'`
>> > +        case $arg in
>> > +            root=*)
>> > +                ROOT_DEVICE=$optarg ;;
>> > +            rootfstype=*)
>> > +                modprobe $optarg 2> /dev/null ;;
>> > +            LABEL=*)
>> > +                label=$optarg ;;
>> > +            video=*)
>> > +                video_mode=$arg ;;
>> > +            vga=*)
>> > +                vga_mode=$arg ;;
>> > +            console=*)
>> > +                if [ -z "${console_params}" ]; then
>> > +                    console_params=$arg
>> > +                else
>> > +                    console_params="$console_params $arg"
>> > +                fi ;;
>> > +            debugshell*)
>> > +                if [ -z "$optarg" ]; then
>> > +                        shelltimeout=30
>> > +                else
>> > +                        shelltimeout=$optarg
>> > +                fi
>> > +        esac
>> > +    done
>> > +}
>> > +
>> > +boot_live_root() {
>> > +    # Watches the udev event queue, and exits if all current events
>> are handled
>> > +    udevadm settle --timeout=3 --quiet
>> > +    killall "${_UDEV_DAEMON##*/}" 2>/dev/null
>> > +
>> > +    # Move the mount points of some filesystems over to
>> > +    # the corresponding directories under the real root filesystem.
>> > +    for dir in `awk '/\/dev.* \/media/{print $2}' /proc/mounts`; do
>> > +        mkdir -p  ${ROOT_MOUNT}/$dir
>> > +        mount -n --move $dir ${ROOT_MOUNT}/$dir
>> > +    done
>> > +    mount -n --move /proc ${ROOT_MOUNT}/proc
>> > +    mount -n --move /sys ${ROOT_MOUNT}/sys
>> > +    mount -n --move /dev ${ROOT_MOUNT}/dev
>> > +
>> > +    cd $ROOT_MOUNT
>> > +    exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
>> > +}
>> > +
>> > +fatal() {
>> > +    echo $1 >$CONSOLE
>> > +    echo >$CONSOLE
>> > +    exec sh
>> > +}
>> > +
>> > +early_setup
>> > +
>> > +[ -z "$CONSOLE" ] && CONSOLE="/dev/console"
>> > +
>> > +read_args
>> > +
>> > +echo "Waiting for removable media..."
>> > +C=0
>> > +shelltimeout=5
>> > +while true
>> > +do
>> > +  udevadm trigger
>> > +  udevadm settle
>> > +  for i in `ls /media 2>/dev/null`; do
>> > +      if [ -f /media/$i/$ROOT_IMAGE ] ; then
>> > +               found="yes"
>> > +               break
>> > +         elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then
>> > +               found="yes"
>> > +               ISOLINUX="isolinux"
>> > +               break
>> > +      fi
>> > +  done
>> > +  if [ "$found" = "yes" ]; then
>> > +      break;
>> > +  fi
>> > +  # don't wait for more than $shelltimeout seconds, if it's set
>> > +  if [ -n "$shelltimeout" ]; then
>> > +      echo -n " " $(( $shelltimeout - $C ))
>> > +      if [ $C -ge $shelltimeout ]; then
>> > +           echo "..."
>> > +          echo "Mounted filesystems"
>> > +           mount | grep media
>> > +           echo "Available block devices"
>> > +           ls /dev/sd*
>> > +           fatal "Cannot find rootfs.img file in /media/* , dropping
>> to a shell "
>> > +      fi
>> > +      C=$(( C + 1 ))
>> > +  fi
>> > +  sleep 1
>> > +done
>> > +
>> > +# Try to make a union mount of the root image.
>> > +# If no unification filesystem is available, mount the image read-only.
>> > +mount_and_boot() {
>> > +    mkdir $ROOT_MOUNT
>> > +
>> > +    mknod /dev/loop0 b 7 0 2>/dev/null
>> > +
>> > +    # determine which unification filesystem to use
>> > +    union_fs_type=""
>> > +    if grep -q -w "overlayfs" /proc/filesystems; then
>> > +       union_fs_type="overlayfs"
>> > +    elif grep -q -w "aufs" /proc/filesystems; then
>> > +       union_fs_type="aufs"
>> > +    else
>> > +       union_fs_type=""
>> > +    fi
>> > +    # make a union mount if possible
>> > +    case $union_fs_type in
>> > +       "overlayfs")
>> > +           mkdir -p /rootfs.ro /rootfs.rw
>> > +           if ! mount -o rw,loop,noatime,nodiratime
>> /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
>> > +               rm -rf /rootfs.ro /rootfs.rw
>> > +               fatal "Could not mount rootfs image"
>> > +           else
>> > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
>> > +               mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/
>> rootfs.rw" overlayfs $ROOT_MOUNT
>> > +               mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
>> > +               mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
>> > +               mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
>> > +           fi
>> > +           ;;
>> > +       "aufs")
>> > +           mkdir -p /rootfs.ro /rootfs.rw
>> > +           if ! mount -o rw,loop,noatime,nodiratime
>> /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
>> > +               rm -rf /rootfs.ro /rootfs.rw
>> > +               fatal "Could not mount rootfs image"
>> > +           else
>> > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
>> > +               mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro"
>> aufs $ROOT_MOUNT
>> > +               mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
>> > +               mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
>> > +               mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
>> > +           fi
>> > +           ;;
>> > +       "")
>> > +           if ! mount -o rw,loop,noatime,nodiratime
>> /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
>> > +               fatal "Could not mount rootfs image"
>> > +           else
>> > +               mount -t tmpfs -o rw,noatime,mode=755 tmpfs
>> $ROOT_MOUNT/media
>> > +           fi
>> > +           ;;
>> > +    esac
>> > +
>> > +    # boot the image
>> > +    boot_live_root
>> > +}
>> > +
>> > +mount_and_boot
>> > +
>> > +# If we're getting here, we failed...
>> > +fatal "Installation image failed"
>> > +
>> > diff --git a/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bbb/recipes-extended/initrdscripts/
>> initramfs-boot-xen_1.0.bb
>> > new file mode 100644
>> > index 0000000..9380e83
>> > --- /dev/null
>> > +++ b/recipes-extended/initrdscripts/initramfs-boot-xen_1.0.bb
>> > @@ -0,0 +1,16 @@
>> > +DESCRIPTION = "A live image init script with support for Xen"
>> > +LICENSE = "MIT"
>> > +LIC_FILES_CHKSUM =
>> "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> > +SRC_URI = "file://init-boot-xen.sh"
>> > +PR = "r0"
>> > +
>> > +inherit allarch
>> > +
>> > +RDEPENDS_${PN} = "udev udev-extraconf"
>> > +
>> > +FILES_${PN} += " /init "
>>
>> I was going to ask if you are seeing any QA warnings with this, since
>> in the past we've had
>> to use update alternatives and priority to ensure that the right init
>> was used in an image .. but
>> then I noticed this is only pulled into the minimal config and there
>> shouldn't be any conflicting
>> init providers!
>>
>> Bruce
>>
>> > +
>> > +do_install() {
>> > +        install -m 0755 ${WORKDIR}/init-boot-xen.sh ${D}/init
>> > +}
>> > +
>> > --
>> > 1.7.10.4
>> >
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"
>>
>
>

--089e0158c410106a9f04e553399c
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Tracked down the issue to the busybox defconfig =
in the meta-virt layer.<br><br></div>There were patches upstreamed to udev&=
#39;s mount script to require &#39;stat&#39; in addition to a similar updat=
e to busybox&#39;s config to provide it.<br>
<br>commit ef7e1239b95dbef4e461007d6d0612c27a7919ec<br>Author: Andy Ross &l=
t;<a href=3D"mailto:andy.ross@windriver.com">andy.ross@windriver.com</a>&gt=
;<br>Date:=A0=A0 Tue Sep 18 14:38:44 2012 -0700<br>busybox: add /usr/bin/st=
at applet...<br>
<br>commit 3543d0db691e82098c1da7bf12f43e0c57551a3d<br>Author: Andy Ross &l=
t;<a href=3D"mailto:andy.ross@windriver.com">andy.ross@windriver.com</a>&gt=
;<br>Date:=A0=A0 Tue Sep 18 14:38:45 2012 -0700<br>udev-extraconf: Don&#39;=
t mount root filesystem under /media...<br>
<br></div>I suppose this could be resolved by updating the busybox defconfi=
g to a fragment turning on only the extra bits it wants?=A0 Or should I be =
prioritizing my layers differently?<br></div><div class=3D"gmail_extra"><br=
>
<br><div class=3D"gmail_quote">On Sun, Sep 1, 2013 at 12:41 AM, Chris Patte=
rson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_b=
lank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">
<div dir=3D"ltr"><div>The reasoning for xen-image-initramfs was that I had =
minor issues with using stock core-image-minimal-initramfs and initramfs-li=
ve-boot.<br><br>However, I have since tracked down the issue I was having w=
ith initramfs-live-boot, and determined we could drop initramfs-boot-xen in=
 favor of initramfs-live-boot simply by adding LABEL=3Dboot to the kernel a=
rgs.<br>

<br></div><div>Beyond that, vanilla core-image-minimal-initramfs would hang=
 at &quot;Waiting for removeable media...&quot; indefinitely.=A0 After some=
 testing, It appeared that adding coreutils to core-image-minimal-initramfs=
 would resolve the issue (though not yet sure why, but looking into it).</d=
iv>

</div><div class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><b=
r><br><div class=3D"gmail_quote">On Fri, Aug 30, 2013 at 1:36 AM, Bruce Ash=
field <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" tar=
get=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div><div>On Thu, Aug 29, 2013 at 11:37 PM, =
Chris Patterson &lt;<a href=3D"mailto:cjp256@gmail.com" target=3D"_blank">c=
jp256@gmail.com</a>&gt; wrote:<br>


&gt; xen-image-initramfs: newly added initrd to support testing xen-image-m=
inimal and init script based on init-live.sh.<br>
&gt; ---<br>
&gt; =A0recipes-extended/images/<a href=3D"http://xen-image-initramfs.bb" t=
arget=3D"_blank">xen-image-initramfs.bb</a> =A0 =A0 | =A0 17 ++<br>
&gt; =A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" tar=
get=3D"_blank">xen-image-minimal.bb</a> =A0 =A0 =A0 | =A0 55 +++++-<br>
&gt; =A0.../initrdscripts/files/init-boot-xen.sh =A0 =A0 =A0 =A0 =A0 | =A02=
05 ++++++++++++++++++++<br>
&gt; =A0.../initrdscripts/<a href=3D"http://initramfs-boot-xen_1.0.bb" targ=
et=3D"_blank">initramfs-boot-xen_1.0.bb</a> =A0 =A0 =A0 =A0| =A0 16 ++<br>
&gt; =A04 files changed, 286 insertions(+), 7 deletions(-)<br>
&gt; =A0create mode 100644 recipes-extended/images/<a href=3D"http://xen-im=
age-initramfs.bb" target=3D"_blank">xen-image-initramfs.bb</a><br>
&gt; =A0create mode 100644 recipes-extended/initrdscripts/files/init-boot-x=
en.sh<br>
&gt; =A0create mode 100644 recipes-extended/initrdscripts/<a href=3D"http:/=
/initramfs-boot-xen_1.0.bb" target=3D"_blank">initramfs-boot-xen_1.0.bb</a>=
<br>
&gt;<br>
&gt; diff --git a/recipes-extended/images/<a href=3D"http://xen-image-initr=
amfs.bb" target=3D"_blank">xen-image-initramfs.bb</a> b/recipes-extended/im=
ages/<a href=3D"http://xen-image-initramfs.bb" target=3D"_blank">xen-image-=
initramfs.bb</a><br>


&gt; new file mode 100644<br>
&gt; index 0000000..d2f1301<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/images/<a href=3D"http://xen-image-initramfs.bb=
" target=3D"_blank">xen-image-initramfs.bb</a><br>
&gt; @@ -0,0 +1,17 @@<br>
&gt; +DESCRIPTION =3D &quot;Xen image initramfs&quot;<br>
&gt; +<br>
&gt; +IMAGE_INSTALL =3D &quot;initramfs-boot-xen busybox udev udev-extracon=
f base-passwd coreutils&quot;<br>
&gt; +<br>
&gt; +# Do not pollute the initrd image with rootfs features<br>
&gt; +IMAGE_FEATURES =3D &quot;&quot;<br>
&gt; +<br>
&gt; +export IMAGE_BASENAME =3D &quot;xen-image-initramfs&quot;<br>
&gt; +<br>
&gt; +IMAGE_LINGUAS =3D &quot;&quot;<br>
&gt; +<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +<br>
&gt; +IMAGE_FSTYPES =3D &quot;${INITRAMFS_FSTYPES}&quot;<br>
&gt; +inherit core-image<br>
&gt; +<br>
&gt; +IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
&gt; diff --git a/recipes-extended/images/<a href=3D"http://xen-image-minim=
al.bb" target=3D"_blank">xen-image-minimal.bb</a> b/recipes-extended/images=
/<a href=3D"http://xen-image-minimal.bb" target=3D"_blank">xen-image-minima=
l.bb</a><br>


&gt; index 0cf55d6..c941339 100644<br>
&gt; --- a/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" =
target=3D"_blank">xen-image-minimal.bb</a><br>
&gt; +++ b/recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" =
target=3D"_blank">xen-image-minimal.bb</a><br>
&gt; @@ -1,14 +1,55 @@<br>
&gt; -DESCRIPTION =3D &quot;A minimal xen image&quot;<br>
&gt; -IMAGE_INSTALL =3D &quot;packagegroup-core-boot xen-minimal dropbear m=
dadm&quot;<br>
&gt; +DESCRIPTION =3D &quot;Image with Xen.&quot;<br>
&gt; +<br>
&gt; +INITRD_IMAGE ?=3D &quot;xen-image-initramfs&quot;<br>
&gt; +<br>
&gt; +IMAGE_INSTALL +=3D &quot; \<br>
&gt; + =A0 =A0${CORE_IMAGE_BASE_INSTALL} \<br>
&gt; + =A0 =A0packagegroup-core-basic \<br>
&gt; + =A0 =A0packagegroup-core-ssh-openssh \<br>
&gt; + =A0 =A0kernel-module-xen-acpi-processor \<br>
&gt; + =A0 =A0kernel-module-xen-blkback \<br>
&gt; + =A0 =A0kernel-module-xen-blkfront \<br>
&gt; + =A0 =A0kernel-module-xen-evtchn \<br>
&gt; + =A0 =A0kernel-module-xenfs \<br>
&gt; + =A0 =A0kernel-module-xen-gntalloc \<br>
&gt; + =A0 =A0kernel-module-xen-gntdev \<br>
&gt; + =A0 =A0kernel-module-xen-netback \<br>
&gt; + =A0 =A0kernel-module-xen-netfront \<br>
&gt; + =A0 =A0kernel-module-xen-pcifront \<br>
&gt; + =A0 =A0kernel-module-xen-privcmd \<br>
&gt; + =A0 =A0kernel-module-xen-wdt \<br>
&gt; + =A0 =A0xen-base \<br>
&gt; + =A0 =A0xen-qemu \<br>
&gt; + =A0 =A0${ROOTFS_PKGMANAGE_BOOTSTRAP} \<br>
&gt; + =A0 =A0&quot;<br>
&gt;<br>
&gt; -IMAGE_LINGUAS =3D &quot; &quot;<br>
&gt; =A0LICENSE =3D &quot;MIT&quot;<br>
&gt;<br>
&gt; =A0inherit core-image<br>
&gt;<br>
&gt; -IMAGE_ROOTFS_SIZE =3D &quot;8192&quot;<br>
&gt; +syslinux_iso_populate_append() {<br>
&gt; + =A0 =A0 =A0 install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${=
ISODIR}${ISOLINUXDIR}<br>
&gt; +}<br>
&gt; +<br>
&gt; +syslinux_hddimg_populate_append() {<br>
&gt; + =A0 =A0 =A0 install -m 0444 ${STAGING_DATADIR}/syslinux/mboot.c32 ${=
HDDDIR}${SYSLINUXDIR}<br>
&gt; +}<br>
&gt; +<br>
&gt; +grubefi_populate_append() {<br>
&gt; + =A0 =A0 =A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${=
DEST}${EFIDIR}/xen.gz<br>
&gt; +}<br>
&gt; +<br>
&gt; +populate_append() {<br>
&gt; + =A0 =A0 =A0 install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${=
DEST}/xen.gz<br>
&gt; +}<br>
&gt;<br>
&gt; -# remove not needed ipkg informations<br>
&gt; -ROOTFS_POSTPROCESS_COMMAND +=3D &quot;remove_packaging_data_files ; &=
quot;<br>
&gt; +build_syslinux_cfg () {<br>
&gt; + =A0 =A0 =A0 echo &quot;ALLOWOPTIONS 1&quot; &gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 =A0 echo &quot;DEFAULT boot&quot; &gt;&gt; ${SYSLINUXCFG}<br=
>
&gt; + =A0 =A0 =A0 echo &quot;TIMEOUT 10&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 =A0 echo &quot;PROMPT 1&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 =A0 echo &quot;LABEL boot&quot; &gt;&gt; ${SYSLINUXCFG}<br>
&gt; + =A0 =A0 =A0 echo &quot; =A0KERNEL mboot.c32&quot; &gt;&gt; ${SYSLINU=
XCFG}<br>
&gt; + =A0 =A0 =A0 echo &quot; =A0APPEND /xen.gz loglvl=3Dall guest_loglvl=
=3Dall console=3Dcom1,vga com1=3D115200,8n1 --- /vmlinuz ramdisk_size=3D327=
68 root=3D/dev/ram0 rw console=3Dhvc0 earlyprintk=3Dxen console=3Dtty0 pani=
c=3D10 --- /initrd&quot; &gt;&gt; ${SYSLINUXCFG}<br>


&gt; +}<br>
&gt;<br>
&gt; -require xen-bootimg.inc<br>
&gt; diff --git a/recipes-extended/initrdscripts/files/init-boot-xen.sh b/r=
ecipes-extended/initrdscripts/files/init-boot-xen.sh<br>
&gt; new file mode 100644<br>
&gt; index 0000000..741f201<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/initrdscripts/files/init-boot-xen.sh<br>
&gt; @@ -0,0 +1,205 @@<br>
&gt; +#!/bin/sh<br>
&gt; +<br>
&gt; +PATH=3D/sbin:/bin:/usr/sbin:/usr/bin<br>
&gt; +<br>
&gt; +ROOT_MOUNT=3D&quot;/rootfs/&quot;<br>
&gt; +ROOT_IMAGE=3D&quot;rootfs.img&quot;<br>
&gt; +MOUNT=3D&quot;/bin/mount&quot;<br>
&gt; +UMOUNT=3D&quot;/bin/umount&quot;<br>
&gt; +ISOLINUX=3D&quot;&quot;<br>
&gt; +<br>
&gt; +# Copied from initramfs-framework. The core of this script probably s=
hould be<br>
&gt; +# turned into initramfs-framework modules to reduce duplication.<br>
&gt; +udev_daemon() {<br>
&gt; + =A0 =A0 =A0 OPTIONS=3D&quot;/sbin/udev/udevd /sbin/udevd /lib/udev/u=
devd /sbin/systemd/systemd-udevd /lib/systemd/systemd-udevd&quot;<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 for o in $OPTIONS; do<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if [ -x &quot;$o&quot; ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 echo $o<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 done<br>
&gt; +<br>
&gt; + =A0 =A0 =A0 return 1<br>
&gt; +}<br>
&gt; +<br>
&gt; +_UDEV_DAEMON=3D`udev_daemon`<br>
&gt; +<br>
&gt; +early_setup() {<br>
&gt; + =A0 =A0mkdir -p /proc<br>
&gt; + =A0 =A0mkdir -p /sys<br>
&gt; + =A0 =A0mount -t proc proc /proc<br>
&gt; + =A0 =A0mount -t sysfs sysfs /sys<br>
&gt; + =A0 =A0mount -t devtmpfs none /dev<br>
&gt; +<br>
&gt; + =A0 =A0# support modular kernel<br>
&gt; + =A0 =A0modprobe isofs 2&gt; /dev/null<br>
&gt; +<br>
&gt; + =A0 =A0mkdir -p /run<br>
&gt; + =A0 =A0mkdir -p /var/run<br>
&gt; + =A0 =A0mkdir -p /media<br>
&gt; +<br>
&gt; + =A0 =A0$_UDEV_DAEMON --daemon<br>
&gt; + =A0 =A0udevadm trigger --action=3Dadd<br>
&gt; +}<br>
&gt; +<br>
&gt; +read_args() {<br>
&gt; + =A0 =A0[ -z &quot;$CMDLINE&quot; ] &amp;&amp; CMDLINE=3D`cat /proc/c=
mdline`<br>
&gt; + =A0 =A0for arg in $CMDLINE; do<br>
&gt; + =A0 =A0 =A0 =A0optarg=3D`expr &quot;x$arg&quot; : &#39;x[^=3D]*=3D\(=
.*\)&#39;`<br>
&gt; + =A0 =A0 =A0 =A0case $arg in<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0root=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ROOT_DEVICE=3D$optarg ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0rootfstype=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0modprobe $optarg 2&gt; /dev/null ;;<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0LABEL=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0label=3D$optarg ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0video=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0video_mode=3D$arg ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0vga=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0vga_mode=3D$arg ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0console=3D*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -z &quot;${console_params}&quot;=
 ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=3D$arg<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0console_params=3D&quot;$conso=
le_params $arg&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi ;;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0debugshell*)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if [ -z &quot;$optarg&quot; ]; then<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltimeout=3D30<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0shelltimeout=3D$optar=
g<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0 =A0esac<br>
&gt; + =A0 =A0done<br>
&gt; +}<br>
&gt; +<br>
&gt; +boot_live_root() {<br>
&gt; + =A0 =A0# Watches the udev event queue, and exits if all current even=
ts are handled<br>
&gt; + =A0 =A0udevadm settle --timeout=3D3 --quiet<br>
&gt; + =A0 =A0killall &quot;${_UDEV_DAEMON##*/}&quot; 2&gt;/dev/null<br>
&gt; +<br>
&gt; + =A0 =A0# Move the mount points of some filesystems over to<br>
&gt; + =A0 =A0# the corresponding directories under the real root filesyste=
m.<br>
&gt; + =A0 =A0for dir in `awk &#39;/\/dev.* \/media/{print $2}&#39; /proc/m=
ounts`; do<br>
&gt; + =A0 =A0 =A0 =A0mkdir -p =A0${ROOT_MOUNT}/$dir<br>
&gt; + =A0 =A0 =A0 =A0mount -n --move $dir ${ROOT_MOUNT}/$dir<br>
&gt; + =A0 =A0done<br>
&gt; + =A0 =A0mount -n --move /proc ${ROOT_MOUNT}/proc<br>
&gt; + =A0 =A0mount -n --move /sys ${ROOT_MOUNT}/sys<br>
&gt; + =A0 =A0mount -n --move /dev ${ROOT_MOUNT}/dev<br>
&gt; +<br>
&gt; + =A0 =A0cd $ROOT_MOUNT<br>
&gt; + =A0 =A0exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init<br>
&gt; +}<br>
&gt; +<br>
&gt; +fatal() {<br>
&gt; + =A0 =A0echo $1 &gt;$CONSOLE<br>
&gt; + =A0 =A0echo &gt;$CONSOLE<br>
&gt; + =A0 =A0exec sh<br>
&gt; +}<br>
&gt; +<br>
&gt; +early_setup<br>
&gt; +<br>
&gt; +[ -z &quot;$CONSOLE&quot; ] &amp;&amp; CONSOLE=3D&quot;/dev/console&q=
uot;<br>
&gt; +<br>
&gt; +read_args<br>
&gt; +<br>
&gt; +echo &quot;Waiting for removable media...&quot;<br>
&gt; +C=3D0<br>
&gt; +shelltimeout=3D5<br>
&gt; +while true<br>
&gt; +do<br>
&gt; + =A0udevadm trigger<br>
&gt; + =A0udevadm settle<br>
&gt; + =A0for i in `ls /media 2&gt;/dev/null`; do<br>
&gt; + =A0 =A0 =A0if [ -f /media/$i/$ROOT_IMAGE ] ; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 found=3D&quot;yes&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break<br>
&gt; + =A0 =A0 =A0 =A0 elif [ -f /media/$i/isolinux/$ROOT_IMAGE ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 found=3D&quot;yes&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ISOLINUX=3D&quot;isolinux&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break<br>
&gt; + =A0 =A0 =A0fi<br>
&gt; + =A0done<br>
&gt; + =A0if [ &quot;$found&quot; =3D &quot;yes&quot; ]; then<br>
&gt; + =A0 =A0 =A0break;<br>
&gt; + =A0fi<br>
&gt; + =A0# don&#39;t wait for more than $shelltimeout seconds, if it&#39;s=
 set<br>
&gt; + =A0if [ -n &quot;$shelltimeout&quot; ]; then<br>
&gt; + =A0 =A0 =A0echo -n &quot; &quot; $(( $shelltimeout - $C ))<br>
&gt; + =A0 =A0 =A0if [ $C -ge $shelltimeout ]; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 echo &quot;...&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0echo &quot;Mounted filesystems&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 mount | grep media<br>
&gt; + =A0 =A0 =A0 =A0 =A0 echo &quot;Available block devices&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 ls /dev/sd*<br>
&gt; + =A0 =A0 =A0 =A0 =A0 fatal &quot;Cannot find rootfs.img file in /medi=
a/* , dropping to a shell &quot;<br>
&gt; + =A0 =A0 =A0fi<br>
&gt; + =A0 =A0 =A0C=3D$(( C + 1 ))<br>
&gt; + =A0fi<br>
&gt; + =A0sleep 1<br>
&gt; +done<br>
&gt; +<br>
&gt; +# Try to make a union mount of the root image.<br>
&gt; +# If no unification filesystem is available, mount the image read-onl=
y.<br>
&gt; +mount_and_boot() {<br>
&gt; + =A0 =A0mkdir $ROOT_MOUNT<br>
&gt; +<br>
&gt; + =A0 =A0mknod /dev/loop0 b 7 0 2&gt;/dev/null<br>
&gt; +<br>
&gt; + =A0 =A0# determine which unification filesystem to use<br>
&gt; + =A0 =A0union_fs_type=3D&quot;&quot;<br>
&gt; + =A0 =A0if grep -q -w &quot;overlayfs&quot; /proc/filesystems; then<b=
r>
&gt; + =A0 =A0 =A0 union_fs_type=3D&quot;overlayfs&quot;<br>
&gt; + =A0 =A0elif grep -q -w &quot;aufs&quot; /proc/filesystems; then<br>
&gt; + =A0 =A0 =A0 union_fs_type=3D&quot;aufs&quot;<br>
&gt; + =A0 =A0else<br>
&gt; + =A0 =A0 =A0 union_fs_type=3D&quot;&quot;<br>
&gt; + =A0 =A0fi<br>
&gt; + =A0 =A0# make a union mount if possible<br>
&gt; + =A0 =A0case $union_fs_type in<br>
&gt; + =A0 =A0 =A0 &quot;overlayfs&quot;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 mkdir -p /<a href=3D"http://rootfs.ro" target=3D=
"_blank">rootfs.ro</a> /<a href=3D"http://rootfs.rw" target=3D"_blank">root=
fs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 if ! mount -o rw,loop,noatime,nodiratime /media/=
$i/$ISOLINUX/$ROOT_IMAGE /<a href=3D"http://rootfs.ro" target=3D"_blank">ro=
otfs.ro</a>; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -rf /<a href=3D"http://rootfs.ro" tar=
get=3D"_blank">rootfs.ro</a> /<a href=3D"http://rootfs.rw" target=3D"_blank=
">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fatal &quot;Could not mount rootfs image=
&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount -t tmpfs -o rw,noatime,mode=3D755 =
tmpfs /<a href=3D"http://rootfs.rw" target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount -t overlayfs -o &quot;lowerdir=3D/=
<a href=3D"http://rootfs.ro" target=3D"_blank">rootfs.ro</a>,upperdir=3D/<a=
 href=3D"http://rootfs.rw" target=3D"_blank">rootfs.rw</a>&quot; overlayfs =
$ROOT_MOUNT<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir -p $ROOT_MOUNT/<a href=3D"http://r=
ootfs.ro" target=3D"_blank">rootfs.ro</a> $ROOT_MOUNT/<a href=3D"http://roo=
tfs.rw" target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount --move /<a href=3D"http://rootfs.r=
o" target=3D"_blank">rootfs.ro</a> $ROOT_MOUNT/<a href=3D"http://rootfs.ro"=
 target=3D"_blank">rootfs.ro</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount --move /<a href=3D"http://rootfs.r=
w" target=3D"_blank">rootfs.rw</a> $ROOT_MOUNT/<a href=3D"http://rootfs.rw"=
 target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; + =A0 =A0 =A0 &quot;aufs&quot;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 mkdir -p /<a href=3D"http://rootfs.ro" target=3D=
"_blank">rootfs.ro</a> /<a href=3D"http://rootfs.rw" target=3D"_blank">root=
fs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 if ! mount -o rw,loop,noatime,nodiratime /media/=
$i/$ISOLINUX/$ROOT_IMAGE /<a href=3D"http://rootfs.ro" target=3D"_blank">ro=
otfs.ro</a>; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 rm -rf /<a href=3D"http://rootfs.ro" tar=
get=3D"_blank">rootfs.ro</a> /<a href=3D"http://rootfs.rw" target=3D"_blank=
">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fatal &quot;Could not mount rootfs image=
&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount -t tmpfs -o rw,noatime,mode=3D755 =
tmpfs /<a href=3D"http://rootfs.rw" target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount -t aufs -o &quot;dirs=3D/<a href=
=3D"http://rootfs.rw" target=3D"_blank">rootfs.rw</a>=3Drw:/<a href=3D"http=
://rootfs.ro" target=3D"_blank">rootfs.ro</a>=3Dro&quot; aufs $ROOT_MOUNT<b=
r>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mkdir -p $ROOT_MOUNT/<a href=3D"http://r=
ootfs.ro" target=3D"_blank">rootfs.ro</a> $ROOT_MOUNT/<a href=3D"http://roo=
tfs.rw" target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount --move /<a href=3D"http://rootfs.r=
o" target=3D"_blank">rootfs.ro</a> $ROOT_MOUNT/<a href=3D"http://rootfs.ro"=
 target=3D"_blank">rootfs.ro</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount --move /<a href=3D"http://rootfs.r=
w" target=3D"_blank">rootfs.rw</a> $ROOT_MOUNT/<a href=3D"http://rootfs.rw"=
 target=3D"_blank">rootfs.rw</a><br>
&gt; + =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; + =A0 =A0 =A0 &quot;&quot;)<br>
&gt; + =A0 =A0 =A0 =A0 =A0 if ! mount -o rw,loop,noatime,nodiratime /media/=
$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 fatal &quot;Could not mount rootfs image=
&quot;<br>
&gt; + =A0 =A0 =A0 =A0 =A0 else<br>
&gt; + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mount -t tmpfs -o rw,noatime,mode=3D755 =
tmpfs $ROOT_MOUNT/media<br>
&gt; + =A0 =A0 =A0 =A0 =A0 fi<br>
&gt; + =A0 =A0 =A0 =A0 =A0 ;;<br>
&gt; + =A0 =A0esac<br>
&gt; +<br>
&gt; + =A0 =A0# boot the image<br>
&gt; + =A0 =A0boot_live_root<br>
&gt; +}<br>
&gt; +<br>
&gt; +mount_and_boot<br>
&gt; +<br>
&gt; +# If we&#39;re getting here, we failed...<br>
&gt; +fatal &quot;Installation image failed&quot;<br>
&gt; +<br>
&gt; diff --git a/recipes-extended/initrdscripts/<a href=3D"http://initramf=
s-boot-xen_1.0.bb" target=3D"_blank">initramfs-boot-xen_1.0.bb</a> b/recipe=
s-extended/initrdscripts/<a href=3D"http://initramfs-boot-xen_1.0.bb" targe=
t=3D"_blank">initramfs-boot-xen_1.0.bb</a><br>


&gt; new file mode 100644<br>
&gt; index 0000000..9380e83<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/initrdscripts/<a href=3D"http://initramfs-boot-=
xen_1.0.bb" target=3D"_blank">initramfs-boot-xen_1.0.bb</a><br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +DESCRIPTION =3D &quot;A live image init script with support for Xen&q=
uot;<br>
&gt; +LICENSE =3D &quot;MIT&quot;<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://${COREBASE}/meta/COPYING.MIT;md5=3D=
3da9cfbcb788c80a0384361b4de20420&quot;<br>
&gt; +SRC_URI =3D &quot;file://init-boot-xen.sh&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +<br>
&gt; +inherit allarch<br>
&gt; +<br>
&gt; +RDEPENDS_${PN} =3D &quot;udev udev-extraconf&quot;<br>
&gt; +<br>
&gt; +FILES_${PN} +=3D &quot; /init &quot;<br>
<br>
</div></div>I was going to ask if you are seeing any QA warnings with this,=
 since<br>
in the past we&#39;ve had<br>
to use update alternatives and priority to ensure that the right init<br>
was used in an image .. but<br>
then I noticed this is only pulled into the minimal config and there<br>
shouldn&#39;t be any conflicting<br>
init providers!<br>
<br>
Bruce<br>
<div><br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; + =A0 =A0 =A0 =A0install -m 0755 ${WORKDIR}/init-boot-xen.sh ${D}/init=
<br>
&gt; +}<br>
&gt; +<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
</div>&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<span><font color=3D"#888888"><br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--089e0158c410106a9f04e553399c--
