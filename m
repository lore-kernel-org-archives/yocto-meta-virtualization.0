Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 925FCE002FB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2013 22:29:13 -0700 (PDT)
Received: by mail-lb0-f170.google.com with SMTP id r12so3458066lbi.29
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Aug 2013 22:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=mr5rxqKip7bLGBj2S12+DmB43Vtbg6lYcJF6x0axdyM=;
	b=tqrT7JWOBC1ooOSnnCln+3w3s9F91OipAS4L4Xgmjq1VJpvbJSnBJiu+9uuaQ/+pRY
	beYBijXoCzJsu58rzfo2X85OpNqeQe1/wnT9uTCaKx1dBVV5zx4oy9R49cNJ2XRozrqz
	VGQHkzkOWVnU/yh7ygndOgMaOAL5Ys2rOQqUXoo+3UtSS9QhO9SlIrJ4SCckrZFR5N/H
	oWQtJZ+NmMAizqQaHZhd2r9Kl2AmctbBOgyJmS0ukzmyxqTTZ0PP4R6qPeyg9VC3hqtj
	MGyy4KKbuJXQLyEOW01rJbOL7GBuNWFR46bFn3YlLxrlFopaA0XcrX3VWaMFP/OiW25h
	vKuQ==
MIME-Version: 1.0
X-Received: by 10.152.88.74 with SMTP id be10mr22319215lab.4.1377667752341;
	Tue, 27 Aug 2013 22:29:12 -0700 (PDT)
Received: by 10.114.181.41 with HTTP; Tue, 27 Aug 2013 22:29:12 -0700 (PDT)
In-Reply-To: <CADkTA4ORmQ_Gr3XQkd-GG+=5wJYMgAKnfCv4GguZfzUEZ4=qMw@mail.gmail.com>
References: <1377442657-31590-1-git-send-email-cjp256@gmail.com>
	<CADkTA4ORmQ_Gr3XQkd-GG+=5wJYMgAKnfCv4GguZfzUEZ4=qMw@mail.gmail.com>
Date: Wed, 28 Aug 2013 01:29:12 -0400
Message-ID: <CABZSBQe4yQ4ExkQPhN91iGPCBJgw_s5zYvtdkKd01gK89U-WXw@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailman-Approved-At: Thu, 29 Aug 2013 06:02:43 -0700
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: add 4.3.0 recipe.
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
X-List-Received-Date: Wed, 28 Aug 2013 05:29:15 -0000
Content-Type: multipart/alternative; boundary=001a11c34e6cff33b404e4fb44a4

--001a11c34e6cff33b404e4fb44a4
Content-Type: text/plain; charset=ISO-8859-1

I'm currently working towards an installable, minimal Xen distro that takes
advantage of intel's measured launch (TXT) support.  The primary recipe
layers (meta-virtualization, meta-hype, meta-measured) and build scripts (
https://github.com/cjp256/hype-scripts) bits would get you an installable
image for a sugarbay target on dylan or master (providing that you don't
mind nuking a disk drive).

That's probably more than you'd want to dig into for this, but I'm
currently working towards breaking out a standalone Xen example image and
required kernel frags suitable for merging into meta-virtualization.  My
goal is to move the xen bits out of meta-hype and into meta-virtualization,
assuming there is interest.

Once I polish up the xen kernel fragments & a standalone example image that
should run in kvm-qemu (with nested virtualization support), I'll be back
with more patches :)


On Mon, Aug 26, 2013 at 11:36 PM, Bruce Ashfield
<bruce.ashfield@gmail.com>wrote:

> On Sun, Aug 25, 2013 at 10:57 AM, Chris Patterson <cjp256@gmail.com>
> wrote:
> > This patch provides a xen 4.3.0 build that is suitable for a x86_64
> target.  It builds most of the components with the exception of the
> stubdoms and pv-grub.  This has been tested with the xl toolstack,
> qemu-xen-traditional, and upstream qemu.  This will likely require some
> additional work/dependencies for users of the xm/xend toolstacks.
> >
> > Note that I did not attempt to integrate with the common xen.inc as the
> build system(s) have changed a fair bit.  This would probably be a useful
> exercise after the next release of xen.
> >
> > Suggestions or other feedback is certainly welcome :)
>
> I'd like to take this for a spin myself! Do you have some test steps
> or instructions
> that I non Xen expert can follow ?
>
> Bruce
>
> >
> > ---
> >  recipes-extended/xen/xen_4.3.0.bb |  623
> +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 623 insertions(+)
> >  create mode 100644 recipes-extended/xen/xen_4.3.0.bb
> >
> > diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/
> xen_4.3.0.bb
> > new file mode 100644
> > index 0000000..baafbd8
> > --- /dev/null
> > +++ b/recipes-extended/xen/xen_4.3.0.bb
> > @@ -0,0 +1,623 @@
> > +DESCRIPTION = "Xen hypervisor"
> > +HOMEPAGE = "http://xen.org"
> > +LICENSE = "GPLv2"
> > +SECTION = "console/tools"
> > +PR = "r0"
> > +
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=e0f0f3ac55608719a82394cc353928df"
> > +
> > +SRC_URI = "
> http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.tar.gz"
> > +
> > +SRC_URI[md5sum] = "7b18cfb58f1ac2ce39cf35a1867f0c0a"
> > +SRC_URI[sha256sum] =
> "e1e9faabe4886e2227aacdbde74410653b233d66642ca1972a860cbec6439961"
> > +
> > +S = "${WORKDIR}/xen-${PV}"
> > +
> > +COMPATIBLE_HOST = '(x86_64.*).*-linux'
> > +
> > +inherit autotools gettext setuptools update-rc.d
> > +
> > +DEPENDS = "util-linux util-linux-native file-native zlib ncurses
> openssl bison-native flex-native gettext dev86-native iasl-native pciutils
> virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman
> python xz xz-native"
> > +
> > +RDEPENDS_xen-base = "\
> > +    libgcc pciutils bridge-utils iproute2 util-linux udev procps bash
> coreutils python python-core python-shell python-pprint perl xz \
> > +    ${PN}-blktap \
> > +    ${PN}-console \
> > +    ${PN}-libblktapctl \
> > +    ${PN}-libxenguest \
> > +    ${PN}-libxenlight \
> > +    ${PN}-libxenvchan \
> > +    ${PN}-libxenctrl \
> > +    ${PN}-libxlutil \
> > +    ${PN}-libvhd \
> > +    ${PN}-libxenstat \
> > +    ${PN}-libxenstore \
> > +    ${PN}-libblktap \
> > +    ${PN}-libfsimage \
> > +    ${PN}-flask \
> > +    ${PN}-fsimage \
> > +    ${PN}-hvmloader \
> > +    ${PN}-scripts-block \
> > +    ${PN}-scripts-network \
> > +    ${PN}-udev \
> > +    ${PN}-xenpaging \
> > +    ${PN}-xen-watchdog \
> > +    ${PN}-xencommons \
> > +    ${PN}-xendomains \
> > +    ${PN}-xenstore \
> > +    ${PN}-xenstored \
> > +    ${PN}-xl \
> > +    "
> > +
> > +RDEPENDS_${PN}-scripts-block = "\
> > +    ${PN}-scripts-common \
> > +    ${PN}-udev \
> > +    "
> > +
> > +RDEPENDS_${PN}-scripts-network = "\
> > +    bridge-utils \
> > +    ${PN}-scripts-common \
> > +    ${PN}-udev \
> > +    "
> > +
> > +PACKAGES = "\
> > +    ${PN}-base \
> > +    ${PN}-blktap \
> > +    ${PN}-console \
> > +    ${PN}-dbg \
> > +    ${PN}-dev \
> > +    ${PN}-doc \
> > +    ${PN}-flask \
> > +    ${PN}-fsimage \
> > +    ${PN}-gdbsx \
> > +    ${PN}-hvmloader \
> > +    ${PN}-hypervisor \
> > +    ${PN}-kdd \
> > +    ${PN}-libblktap \
> > +    ${PN}-libblktapctl \
> > +    ${PN}-libblktapctl-dev \
> > +    ${PN}-libblktap-dev \
> > +    ${PN}-libfsimage \
> > +    ${PN}-libfsimage-dev \
> > +    ${PN}-libvhd \
> > +    ${PN}-libvhd-dev \
> > +    ${PN}-libxenctrl \
> > +    ${PN}-libxenctrl-dev \
> > +    ${PN}-libxenguest \
> > +    ${PN}-libxenguest-dev \
> > +    ${PN}-libxenlight \
> > +    ${PN}-libxenlight-dev \
> > +    ${PN}-libxenstat \
> > +    ${PN}-libxenstat-dev \
> > +    ${PN}-libxenstore \
> > +    ${PN}-libxenstore-dev \
> > +    ${PN}-libxenvchan \
> > +    ${PN}-libxenvchan-dev \
> > +    ${PN}-libxlutil \
> > +    ${PN}-libxlutil-dev \
> > +    ${PN}-misc \
> > +    ${PN}-pygrub \
> > +    ${PN}-python \
> > +    ${PN}-qemu \
> > +    ${PN}-remus \
> > +    ${PN}-scripts-block \
> > +    ${PN}-scripts-common \
> > +    ${PN}-scripts-network \
> > +    ${PN}-staticdev \
> > +    ${PN}-udev \
> > +    ${PN}-xcutils \
> > +    ${PN}-xencommons \
> > +    ${PN}-xend \
> > +    ${PN}-xend-examples \
> > +    ${PN}-xendomains \
> > +    ${PN}-xenmon \
> > +    ${PN}-xenpaging \
> > +    ${PN}-xenpmd \
> > +    ${PN}-xenstat \
> > +    ${PN}-xenstore \
> > +    ${PN}-xenstored \
> > +    ${PN}-xentrace \
> > +    ${PN}-xen-watchdog \
> > +    ${PN}-xl \
> > +    ${PN}-xl-examples \
> > +    ${PN}-xm \
> > +    ${PN}-xm-examples \
> > +    "
> > +
> > +FILES_${PN}-dbg += "\
> > +    ${libdir}/.debug \
> > +    ${libdir}/xen/bin/.debug \
> > +    ${libdir}/python2.7/site-packages/.debug \
> > +    ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
> > +    ${libdir}/fs/xfs/.debug \
> > +    ${libdir}/fs/ufs/.debug \
> > +    ${libdir}/fs/ext2fs-lib/.debug \
> > +    ${libdir}/fs/fat/.debug \
> > +    ${libdir}/fs/zfs/.debug \
> > +    ${libdir}/fs/reiserfs/.debug \
> > +    ${libdir}/fs/iso9660/.debug \
> > +    ${sbindir}/.debug \
> > +    ${libdir}exec/.debug \
> > +    ${bindir}/.debug \
> > +    ${libdir}/python2.7/dist-packages/.debug \
> > +    ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
> > +    "
> > +
> > +FILES_${PN}-dev = "\
> > +    ${includedir} \
> > +    "
> > +
> > +FILES_${PN}-doc = "\
> > +    ${sysconfdir}/xen/README \
> > +    ${sysconfdir}/xen/README.incompatibilities \
> > +    ${datadir}/doc \
> > +    ${datadir}/man \
> > +    "
> > +
> > +FILES_${PN}-staticdev += "\
> > +    ${libdir}/libblktapctl.a \
> > +    ${libdir}/libxenguest.a \
> > +    ${libdir}/libxenlight.a \
> > +    ${libdir}/libxenvchan.a \
> > +    ${libdir}/libxenctrl.a \
> > +    ${libdir}/libxlutil.a \
> > +    ${libdir}/libvhd.a \
> > +    ${libdir}/libxenstat.a \
> > +    ${libdir}/libxenstore.a \
> > +    ${libdir}/libblktap.a \
> > +    "
> > +
> > +FILES_${PN}-libblktapctl = "${libdir}/libblktapctl.so.*"
> > +FILES_${PN}-libblktapctl-dev = "${libdir}/libblktapctl.so"
> > +
> > +FILES_${PN}-libxenguest = "${libdir}/libxenguest.so.*"
> > +FILES_${PN}-libxenguest-dev = "${libdir}/libxenguest.so"
> > +
> > +FILES_${PN}-libxenlight = "${libdir}/libxenlight.so.*"
> > +FILES_${PN}-libxenlight-dev = "${libdir}/libxenlight.so"
> > +
> > +FILES_${PN}-libxenvchan = "${libdir}/libxenvchan.so.*"
> > +FILES_${PN}-libxenvchan-dev = "${libdir}/libxenvchan.so"
> > +
> > +FILES_${PN}-libxenctrl = "${libdir}/libxenctrl.so.*"
> > +FILES_${PN}-libxenctrl-dev = "${libdir}/libxenctrl.so"
> > +
> > +FILES_${PN}-libxlutil = "${libdir}/libxlutil.so.*"
> > +FILES_${PN}-libxlutil-dev = "${libdir}/libxlutil.so"
> > +
> > +FILES_${PN}-libvhd = "${libdir}/libvhd.so.*"
> > +FILES_${PN}-libvhd-dev = "${libdir}/libvhd.so"
> > +
> > +FILES_${PN}-libxenstat = "${libdir}/libxenstat.so.*"
> > +FILES_${PN}-libxenstat-dev = "${libdir}/libxenstat.so"
> > +
> > +FILES_${PN}-libxenstore = "${libdir}/libxenstore.so.*"
> > +FILES_${PN}-libxenstore-dev = "${libdir}/libxenstore.so"
> > +
> > +FILES_${PN}-libblktap = "${libdir}/libblktap.so.*"
> > +FILES_${PN}-libblktap-dev = "${libdir}/libblktap.so"
> > +
> > +FILES_${PN}-libfsimage = "${libdir}/libfsimage.so.*"
> > +FILES_${PN}-libfsimage-dev = "${libdir}/libfsimage.so"
> > +
> > +FILES_${PN}-fsimage = "${libdir}/fs/*/*fsimage.so"
> > +
> > +FILES_${PN}-hypervisor = "\
> > +    /boot/xen-4.3.0.gz \
> > +    /boot/xen-4.3.gz \
> > +    /boot/xen-4.gz \
> > +    /boot/xen.gz \
> > +    /boot/xen-syms-4.3.0 \
> > +    "
> > +
> > +FILES_${PN}-base = "\
> > +    ${sysconfdir}/default/volatiles/99_xen \
> > +    ${sysconfdir}/default/xencommons \
> > +    ${sysconfdir}/default/xendomains \
> > +    ${sysconfdir}/xen/auto \
> > +    ${sysconfdir}/xen/cpupool \
> > +    ${sysconfdir}/sysconfig/xendomains \
> > +    ${localstatedir}/xen/dump \
> > +    "
> > +
> > +FILES_${PN}-blktap = "\
> > +    ${sbindir}/blktapctrl \
> > +    ${sbindir}/img2qcow \
> > +    ${sbindir}/lock-util \
> > +    ${sbindir}/qcow2raw \
> > +    ${sbindir}/qcow-create \
> > +    ${sbindir}/tap-ctl \
> > +    ${sbindir}/tapdisk \
> > +    ${sbindir}/tapdisk2 \
> > +    ${sbindir}/tapdisk-client \
> > +    ${sbindir}/tapdisk-diff \
> > +    ${sbindir}/tapdisk-stream \
> > +    ${sbindir}/td-util \
> > +    ${sbindir}/vhd-update \
> > +    ${sbindir}/vhd-util \
> > +    "
> > +
> > +FILES_${PN}-console = "\
> > +    ${libdir}/xen/bin/xenconsole \
> > +    ${sbindir}/xenconsoled \
> > +    "
> > +
> > +FILES_${PN}-flask = "\
> > +    ${sbindir}/flask-get-bool \
> > +    ${sbindir}/flask-getenforce \
> > +    ${sbindir}/flask-label-pci \
> > +    ${sbindir}/flask-loadpolicy \
> > +    ${sbindir}/flask-set-bool \
> > +    ${sbindir}/flask-setenforce \
> > +    "
> > +
> > +FILES_${PN}-gdbsx = "\
> > +    ${sbindir}/gdbsx \
> > +    "
> > +
> > +INSANE_SKIP_${PN}-hvmloader = "arch"
> > +FILES_${PN}-hvmloader = "\
> > +    ${libdir}/xen/boot/hvmloader \
> > +    "
> > +
> > +FILES_${PN}-kdd = "\
> > +    ${sbindir}/kdd \
> > +    "
> > +
> > +FILES_${PN}-misc = "\
> > +    ${bindir}/xencons \
> > +    ${bindir}/xencov_split \
> > +    ${bindir}/xen-detect \
> > +    ${libdir}/xen/bin/xenpvnetboot \
> > +    ${sbindir}/gtracestat \
> > +    ${sbindir}/gtraceview \
> > +    ${sbindir}/xen-bugtool \
> > +    ${sbindir}/xencov \
> > +    ${sbindir}/xend \
> > +    ${sbindir}/xenperf \
> > +    ${sbindir}/xenpm \
> > +    ${sbindir}/xsview \
> > +    ${sbindir}/xen-tmem-list-parse \
> > +    ${sbindir}/xen-python-path \
> > +    ${sbindir}/xen-ringwatch \
> > +    ${sbindir}/xen-hptool \
> > +    ${sbindir}/xen-hvmcrash \
> > +    ${sbindir}/xen-hvmctx \
> > +    ${sbindir}/xenlockprof \
> > +    ${sbindir}/xen-lowmemd \
> > +    "
> > +
> > +FILES_${PN}-pygrub = "\
> > +    ${bindir}/pygrub \
> > +    ${libdir}/xen/bin/pygrub \
> > +    "
> > +
> > +FILES_${PN}-python = "\
> > +    ${libdir}/python2.7 \
> > +    "
> > +
> > +INSANE_SKIP_${PN}-qemu = "arch"
> > +FILES_${PN}-qemu = " \
> > +    ${datadir}/xen/qemu \
> > +    ${libdir}/xen/bin/qemu-system-i386 \
> > +    ${libdir}/xen/bin/qemu-system-x86_64 \
> > +    ${libdir}/xen/bin/qemu-img \
> > +    ${libdir}/xen/bin/qemu-nbd \
> > +    ${libdir}/xen/bin/qemu-ga \
> > +    ${libdir}/xen/bin/qemu-io \
> > +    ${libdir}/xen/bin/qemu-dm \
> > +    ${libdir}/xen/bin/virtfs-proxy-helper \
> > +    /usr/libexec/qemu-bridge-helper \
> > +    /usr/etc/qemu \
> > +    /usr/etc/qemu/target-x86_64.conf \
> > +    ${datadir}/qemu-xen \
> > +    ${datadir}/qemu-xen/qemu \
> > +    ${datadir}/qemu-xen/qemu/bamboo.dtb \
> > +    ${datadir}/qemu-xen/qemu/pxe-pcnet.rom \
> > +    ${datadir}/qemu-xen/qemu/vgabios-vmware.bin \
> > +    ${datadir}/qemu-xen/qemu/pxe-eepro100.rom \
> > +    ${datadir}/qemu-xen/qemu/pxe-e1000.rom \
> > +    ${datadir}/qemu-xen/qemu/openbios-ppc \
> > +    ${datadir}/qemu-xen/qemu/multiboot.bin \
> > +    ${datadir}/qemu-xen/qemu/vgabios-cirrus.bin \
> > +    ${datadir}/qemu-xen/qemu/bios.bin \
> > +    ${datadir}/qemu-xen/qemu/vgabios-stdvga.bin \
> > +    ${datadir}/qemu-xen/qemu/palcode-clipper \
> > +    ${datadir}/qemu-xen/qemu/pxe-ne2k_pci.rom \
> > +    ${datadir}/qemu-xen/qemu/spapr-rtas.bin \
> > +    ${datadir}/qemu-xen/qemu/slof.bin \
> > +    ${datadir}/qemu-xen/qemu/vgabios-qxl.bin \
> > +    ${datadir}/qemu-xen/qemu/pxe-rtl8139.rom \
> > +    ${datadir}/qemu-xen/qemu/openbios-sparc64 \
> > +    ${datadir}/qemu-xen/qemu/pxe-virtio.rom \
> > +    ${datadir}/qemu-xen/qemu/kvmvapic.bin \
> > +    ${datadir}/qemu-xen/qemu/openbios-sparc32 \
> > +    ${datadir}/qemu-xen/qemu/petalogix-s3adsp1800.dtb \
> > +    ${datadir}/qemu-xen/qemu/sgabios.bin \
> > +    ${datadir}/qemu-xen/qemu/linuxboot.bin \
> > +    ${datadir}/qemu-xen/qemu/qemu-icon.bmp \
> > +    ${datadir}/qemu-xen/qemu/ppc_rom.bin \
> > +    ${datadir}/qemu-xen/qemu/vgabios.bin \
> > +    ${datadir}/qemu-xen/qemu/s390-zipl.rom \
> > +    ${datadir}/qemu-xen/qemu/petalogix-ml605.dtb \
> > +    ${datadir}/qemu-xen/qemu/keymaps \
> > +    ${datadir}/qemu-xen/qemu/keymaps/common \
> > +    ${datadir}/qemu-xen/qemu/keymaps/th \
> > +    ${datadir}/qemu-xen/qemu/keymaps/is \
> > +    ${datadir}/qemu-xen/qemu/keymaps/en-gb \
> > +    ${datadir}/qemu-xen/qemu/keymaps/ar \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fr-be \
> > +    ${datadir}/qemu-xen/qemu/keymaps/ru \
> > +    ${datadir}/qemu-xen/qemu/keymaps/hu \
> > +    ${datadir}/qemu-xen/qemu/keymaps/de-ch \
> > +    ${datadir}/qemu-xen/qemu/keymaps/no \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fr \
> > +    ${datadir}/qemu-xen/qemu/keymaps/pl \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fr-ca \
> > +    ${datadir}/qemu-xen/qemu/keymaps/de \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fr-ch \
> > +    ${datadir}/qemu-xen/qemu/keymaps/bepo \
> > +    ${datadir}/qemu-xen/qemu/keymaps/lv \
> > +    ${datadir}/qemu-xen/qemu/keymaps/ja \
> > +    ${datadir}/qemu-xen/qemu/keymaps/da \
> > +    ${datadir}/qemu-xen/qemu/keymaps/lt \
> > +    ${datadir}/qemu-xen/qemu/keymaps/hr \
> > +    ${datadir}/qemu-xen/qemu/keymaps/es \
> > +    ${datadir}/qemu-xen/qemu/keymaps/modifiers \
> > +    ${datadir}/qemu-xen/qemu/keymaps/sl \
> > +    ${datadir}/qemu-xen/qemu/keymaps/it \
> > +    ${datadir}/qemu-xen/qemu/keymaps/nl \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fo \
> > +    ${datadir}/qemu-xen/qemu/keymaps/mk \
> > +    ${datadir}/qemu-xen/qemu/keymaps/pt-br \
> > +    ${datadir}/qemu-xen/qemu/keymaps/tr \
> > +    ${datadir}/qemu-xen/qemu/keymaps/sv \
> > +    ${datadir}/qemu-xen/qemu/keymaps/fi \
> > +    ${datadir}/qemu-xen/qemu/keymaps/en-us \
> > +    ${datadir}/qemu-xen/qemu/keymaps/et \
> > +    ${datadir}/qemu-xen/qemu/keymaps/nl-be \
> > +    ${datadir}/qemu-xen/qemu/keymaps/pt \
> > +    ${bindir}/qemu-nbd-xen \
> > +    ${bindir}/qemu-img-xen \
> > +    "
> > +
> > +FILES_${PN}-remus = "\
> > +    ${bindir}/remus \
> > +    "
> > +
> > +FILES_${PN}-scripts-network = " \
> > +    ${sysconfdir}/xen/scripts/network-bridge \
> > +    ${sysconfdir}/xen/scripts/network-nat \
> > +    ${sysconfdir}/xen/scripts/network-route \
> > +    ${sysconfdir}/xen/scripts/qemu-ifup \
> > +    ${sysconfdir}/xen/scripts/vif2 \
> > +    ${sysconfdir}/xen/scripts/vif-bridge \
> > +    ${sysconfdir}/xen/scripts/vif-common.sh \
> > +    ${sysconfdir}/xen/scripts/vif-nat \
> > +    ${sysconfdir}/xen/scripts/vif-openvswitch \
> > +    ${sysconfdir}/xen/scripts/vif-route \
> > +    ${sysconfdir}/xen/scripts/vif-setup \
> > +    "
> > +
> > +FILES_${PN}-scripts-block = " \
> > +    ${sysconfdir}/xen/scripts/blktap \
> > +    ${sysconfdir}/xen/scripts/block \
> > +    ${sysconfdir}/xen/scripts/block-common.sh \
> > +    ${sysconfdir}/xen/scripts/block-enbd \
> > +    ${sysconfdir}/xen/scripts/block-iscsi \
> > +    ${sysconfdir}/xen/scripts/block-nbd \
> > +    ${sysconfdir}/xen/scripts/vscsi \
> > +    "
> > +
> > +FILES_${PN}-scripts-common = " \
> > +    ${sysconfdir}/xen/scripts/external-device-migrate \
> > +    ${sysconfdir}/xen/scripts/hotplugpath.sh \
> > +    ${sysconfdir}/xen/scripts/locking.sh \
> > +    ${sysconfdir}/xen/scripts/logging.sh \
> > +    ${sysconfdir}/xen/scripts/xen-hotplug-cleanup \
> > +    ${sysconfdir}/xen/scripts/xen-hotplug-common.sh \
> > +    ${sysconfdir}/xen/scripts/xen-network-common.sh \
> > +    ${sysconfdir}/xen/scripts/xen-script-common.sh \
> > +    "
> > +
> > +FILES_${PN}-udev = "\
> > +    ${sysconfdir}/udev/rules.d/xen-backend.rules \
> > +    ${sysconfdir}/udev/rules.d/xend.rules \
> > +    "
> > +
> > +FILES_${PN}-xcutils = "\
> > +    ${libdir}/xen/bin/lsevtchn \
> > +    ${libdir}/xen/bin/readnotes \
> > +    ${libdir}/xen/bin/xc_restore \
> > +    ${libdir}/xen/bin/xc_save \
> > +    "
> > +
> > +FILES_${PN}-xend-examples = "\
> > +    ${sysconfdir}/xen/xend-config.sxp \
> > +    ${sysconfdir}/xen/xend-pci-permissive.sxp \
> > +    ${sysconfdir}/xen/xend-pci-quirks.sxp \
> > +    "
> > +
> > +FILES_${PN}-xenpaging = "\
> > +    ${libdir}/xen/bin/xenpaging \
> > +    ${localstatedir}/lib/xen/xenpaging \
> > +    "
> > +
> > +FILES_${PN}-xenpmd = "\
> > +    ${sbindir}/xenpmd \
> > +    "
> > +
> > +FILES_${PN}-xenstat = "\
> > +    ${sbindir}/xentop \
> > +    "
> > +
> > +FILES_${PN}-xenstore = "\
> > +    ${bindir}/xenstore \
> > +    ${bindir}/xenstore-chmod \
> > +    ${bindir}/xenstore-control \
> > +    ${bindir}/xenstore-exists \
> > +    ${bindir}/xenstore-list \
> > +    ${bindir}/xenstore-ls \
> > +    ${bindir}/xenstore-read \
> > +    ${bindir}/xenstore-rm \
> > +    ${bindir}/xenstore-watch \
> > +    ${bindir}/xenstore-write \
> > +    "
> > +
> > +FILES_${PN}-xenstored = "\
> > +    ${sbindir}/xenstored \
> > +    ${localstatedir}/lib/xenstored \
> > +    "
> > +
> > +FILES_${PN}-xentrace = "\
> > +    ${bindir}/xentrace \
> > +    ${bindir}/xentrace_format \
> > +    ${bindir}/xentrace_setsize \
> > +    ${libdir}/xen/bin/xenctx \
> > +    "
> > +
> > +FILES_${PN}-xen-watchdog = "\
> > +    ${sbindir}/xenwatchdogd \
> > +    "
> > +
> > +FILES_${PN}-xl = "\
> > +    ${sysconfdir}/bash_completion.d/xl.sh \
> > +    ${sysconfdir}/xen/xl.conf \
> > +    ${libdir}/xen/bin/libxl-save-helper \
> > +    ${sbindir}/xl \
> > +    "
> > +
> > +FILES_${PN}-xl-examples = "\
> > +    ${sysconfdir}/xen/xlexample.hvm \
> > +    ${sysconfdir}/xen/xlexample.pvlinux \
> > +    "
> > +
> > +FILES_${PN}-xm-examples = "\
> > +    ${sysconfdir}/xen/xmexample1 \
> > +    ${sysconfdir}/xen/xmexample2 \
> > +    ${sysconfdir}/xen/xmexample3 \
> > +    ${sysconfdir}/xen/xmexample.hvm \
> > +    ${sysconfdir}/xen/xmexample.hvm-stubdom \
> > +    ${sysconfdir}/xen/xmexample.nbd \
> > +    ${sysconfdir}/xen/xmexample.pv-grub \
> > +    ${sysconfdir}/xen/xmexample.vti \
> > +    "
> > +
> > +FILES_${PN}-xenmon = "\
> > +    ${sbindir}/xenbaked \
> > +    ${sbindir}/xentrace_setmask \
> > +    ${sbindir}/xenmon.py \
> > +    "
> > +
> > +FILES_${PN}-xm = "\
> > +    ${sysconfdir}/xen/xm-config.xml \
> > +    ${datadir}/xen/create.dtd \
> > +    ${sbindir}/xm \
> > +    "
> > +
> > +FILES_${PN}-xencommons += "${sysconfdir}/init.d/xencommons"
> > +FILES_${PN}-xend += "${sysconfdir}/init.d/xend"
> > +FILES_${PN}-xendomains += "${sysconfdir}/init.d/xendomains"
> > +FILES_${PN}-xen-watchdog += "${sysconfdir}/init.d/xen-watchdog"
> > +
> > +# configure init.d scripts
> > +INITSCRIPT_PACKAGES = "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog
> ${PN}-xendomains"
> > +INITSCRIPT_NAME_${PN}-xencommons = "xencommons"
> > +INITSCRIPT_PARAMS_${PN}-xencommons = "defaults 80"
> > +INITSCRIPT_NAME_${PN}-xen-watchdog = "xen-watchdog"
> > +INITSCRIPT_PARAMS_${PN}-xen-watchdog = "defaults 81"
> > +INITSCRIPT_NAME_${PN}-xend = "xend"
> > +INITSCRIPT_PARAMS_${PN}-xend = "defaults 82"
> > +INITSCRIPT_NAME_${PN}-xendomains = "xendomains"
> > +INITSCRIPT_PARAMS_${PN}-xendomains = "defaults 83"
> > +
> > +#### REQUIRED ENVIRONMENT VARIABLES ####
> > +export BUILD_SYS
> > +export HOST_SYS
> > +export STAGING_INCDIR
> > +export STAGING_LIBDIR
> > +
> > +# specify xen hypervisor to target x86_64 (x86_32 not supported)
> > +export XEN_TARGET_ARCH="x86_64"
> > +export XEN_COMPILE_ARCH="x86_64"
> > +
> > +# this is used for the header (#!${bindir}/python) of the install
> python scripts
> > +export PYTHONPATH="${bindir}/python"
> > +
> > +# seabios forcefully sets HOSTCC to CC - fixup to allow it to build
> native conf executable
> > +export HOSTCC="${BUILD_CC}"
> > +
> > +# make xen requires CROSS_COMPILE set by hand as it does not abide by
> ./configure
> > +export CROSS_COMPILE="${TARGET_PREFIX}"
> > +
> > +# overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld:
> unrecognized option '-Wl,-O1'"
> > +export LDFLAGS=""
> > +
> > +do_configure() {
> > +    # fixup qemu-xen-traditional pciutils check hardcoded to test
> ${includedir}/pci
> > +    sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g'
> ${S}/tools/qemu-xen-traditional/xen-hooks.mak
> > +
> > +    # fixup for qemu to cross compile
> > +    sed -i 's/configure --d/configure --cross-prefix=${TARGET_PREFIX}
> --d/g' ${S}/tools/qemu-xen-traditional/xen-setup
> > +
> > +    # no stubs-32.h in our 64-bit sysroot - hack it into
> tools/include/gnu
> > +    test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
> > +    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; then
> > +        cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v
> stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg >
> ${S}/tools/include/gnu/stubs-32.h
> > +        echo \#define __stub___kernel_cosl >>
> ${S}/tools/include/gnu/stubs-32.h
> > +        echo \#define __stub___kernel_sinl >>
> ${S}/tools/include/gnu/stubs-32.h
> > +        echo \#define __stub___kernel_tanl >>
> ${S}/tools/include/gnu/stubs-32.h
> > +    fi
> > +
> > +    # do configure
> > +    ./configure --exec-prefix=/usr --prefix=/usr --host=${HOST_SYS}
> --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub
> --disable-xenstore-stubdom
> > +
> > +    # seabios needs a patch to specify correct compiler - pull and
> patch Makefile
> > +    make -C ${S}/tools/firmware seabios-dir
> > +    sed -i 's/export HOSTCC.*$(CC)/export HOSTCC ?= $(CC)/g'
> ${S}/tools/firmware/seabios-dir/Makefile
> > +}
> > +
> > +do_compile() {
> > +    oe_runmake
> > +}
> > +
> > +do_install() {
> > +    oe_runmake DESTDIR="${D}" install
> > +
> > +    # remove installed volatiles
> > +    rm -rf ${D}${localstatedir}/run ${D}${localstatedir}/lock
> ${D}${localstatedir}/log ${D}${localstatedir}/volatile
> > +
> > +    # install volatiles using populate_volatiles mechanism
> > +    install -d ${D}${sysconfdir}/default/volatiles
> > +    echo "d root root 0755 ${localstatedir}/run/xenstored none" \
> > +         > ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/run/xend none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/run/xend/boot none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/run/xen none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/log/xen none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/lock/xen none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +    echo "d root root 0755 ${localstatedir}/lock/subsys none" \
> > +         >> ${D}${sysconfdir}/default/volatiles/99_xen
> > +
> > +    # workaround for xendomains script which searchs sysconfig if
> directory exists
> > +    install -d ${D}${sysconfdir}/sysconfig
> > +    ln -sf ${sysconfdir}/default/xendomains
> ${D}${sysconfdir}/sysconfig/xendomains
> > +}
> > +
> > +pkg_postinst_${PN}-base() {
> > +    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ]
> ; then
> > +        ${sysconfdir}/init.d/populate-volatile.sh update
> > +    fi
> > +}
> > +
> > +sysroot_stage_all_append() {
> > +        sysroot_stage_dir ${D}/boot ${SYSROOT_DESTDIR}/kernel
> > +
> > +    install -d ${DEPLOY_DIR_IMAGE}
> > +    install -m 0644 ${D}/boot/xen.gz
> ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz
> > +}
> > --
> > 1.7.10.4
> >
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
>

--001a11c34e6cff33b404e4fb44a4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;m currently working towards an installable, min=
imal Xen distro that takes advantage of intel&#39;s measured launch (TXT) s=
upport.=A0 The primary recipe layers (meta-virtualization, meta-hype, meta-=
measured) and build scripts (<a href=3D"https://github.com/cjp256/hype-scri=
pts">https://github.com/cjp256/hype-scripts</a>) bits would get you an inst=
allable image for a sugarbay target on dylan or master (providing that you =
don&#39;t mind nuking a disk drive).<br>
<br></div><div>That&#39;s probably more than you&#39;d want to dig into for=
 this, but I&#39;m currently working towards breaking out a standalone Xen =
example image and required kernel frags suitable for merging into meta-virt=
ualization.=A0 My goal is to move the xen bits out of meta-hype and into me=
ta-virtualization, assuming there is interest.=A0 <br>
<br>Once I polish up the xen kernel fragments &amp; a standalone example im=
age that should run in kvm-qemu (with nested virtualization support), I&#39=
;ll be back with more patches :)<br></div></div><div class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Mon, Aug 26, 2013 at 11:36 PM, Bruce =
Ashfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span> wrote:<br><blockq=
uote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc =
solid;padding-left:1ex">
<div class=3D"im">On Sun, Aug 25, 2013 at 10:57 AM, Chris Patterson &lt;<a =
href=3D"mailto:cjp256@gmail.com">cjp256@gmail.com</a>&gt; wrote:<br>
&gt; This patch provides a xen 4.3.0 build that is suitable for a x86_64 ta=
rget. =A0It builds most of the components with the exception of the stubdom=
s and pv-grub. =A0This has been tested with the xl toolstack, qemu-xen-trad=
itional, and upstream qemu. =A0This will likely require some additional wor=
k/dependencies for users of the xm/xend toolstacks.<br>

&gt;<br>
&gt; Note that I did not attempt to integrate with the common xen.inc as th=
e build system(s) have changed a fair bit. =A0This would probably be a usef=
ul exercise after the next release of xen.<br>
&gt;<br>
&gt; Suggestions or other feedback is certainly welcome :)<br>
<br>
</div>I&#39;d like to take this for a spin myself! Do you have some test st=
eps<br>
or instructions<br>
that I non Xen expert can follow ?<br>
<br>
Bruce<br>
<div><div class=3D"h5"><br>
&gt;<br>
&gt; ---<br>
&gt; =A0recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_bla=
nk">xen_4.3.0.bb</a> | =A0623 +++++++++++++++++++++++++++++++++++++<br>
&gt; =A01 file changed, 623 insertions(+)<br>
&gt; =A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.3.0=
.bb" target=3D"_blank">xen_4.3.0.bb</a><br>
&gt;<br>
&gt; diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" targ=
et=3D"_blank">xen_4.3.0.bb</a> b/recipes-extended/xen/<a href=3D"http://xen=
_4.3.0.bb" target=3D"_blank">xen_4.3.0.bb</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000..baafbd8<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_=
blank">xen_4.3.0.bb</a><br>
&gt; @@ -0,0 +1,623 @@<br>
&gt; +DESCRIPTION =3D &quot;Xen hypervisor&quot;<br>
&gt; +HOMEPAGE =3D &quot;<a href=3D"http://xen.org" target=3D"_blank">http:=
//xen.org</a>&quot;<br>
&gt; +LICENSE =3D &quot;GPLv2&quot;<br>
&gt; +SECTION =3D &quot;console/tools&quot;<br>
&gt; +PR =3D &quot;r0&quot;<br>
&gt; +<br>
&gt; +LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3De0f0f3ac55608719a8239=
4cc353928df&quot;<br>
&gt; +<br>
&gt; +SRC_URI =3D &quot;<a href=3D"http://bits.xensource.com/oss-xen/releas=
e/$%7BPV%7D/xen-$%7BPV%7D.tar.gz" target=3D"_blank">http://bits.xensource.c=
om/oss-xen/release/${PV}/xen-${PV}.tar.gz</a>&quot;<br>
&gt; +<br>
&gt; +SRC_URI[md5sum] =3D &quot;7b18cfb58f1ac2ce39cf35a1867f0c0a&quot;<br>
&gt; +SRC_URI[sha256sum] =3D &quot;e1e9faabe4886e2227aacdbde74410653b233d66=
642ca1972a860cbec6439961&quot;<br>
&gt; +<br>
&gt; +S =3D &quot;${WORKDIR}/xen-${PV}&quot;<br>
&gt; +<br>
&gt; +COMPATIBLE_HOST =3D &#39;(x86_64.*).*-linux&#39;<br>
&gt; +<br>
&gt; +inherit autotools gettext setuptools update-rc.d<br>
&gt; +<br>
&gt; +DEPENDS =3D &quot;util-linux util-linux-native file-native zlib ncurs=
es openssl bison-native flex-native gettext dev86-native iasl-native pciuti=
ls virtual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman py=
thon xz xz-native&quot;<br>

&gt; +<br>
&gt; +RDEPENDS_xen-base =3D &quot;\<br>
&gt; + =A0 =A0libgcc pciutils bridge-utils iproute2 util-linux udev procps =
bash coreutils python python-core python-shell python-pprint perl xz \<br>
&gt; + =A0 =A0${PN}-blktap \<br>
&gt; + =A0 =A0${PN}-console \<br>
&gt; + =A0 =A0${PN}-libblktapctl \<br>
&gt; + =A0 =A0${PN}-libxenguest \<br>
&gt; + =A0 =A0${PN}-libxenlight \<br>
&gt; + =A0 =A0${PN}-libxenvchan \<br>
&gt; + =A0 =A0${PN}-libxenctrl \<br>
&gt; + =A0 =A0${PN}-libxlutil \<br>
&gt; + =A0 =A0${PN}-libvhd \<br>
&gt; + =A0 =A0${PN}-libxenstat \<br>
&gt; + =A0 =A0${PN}-libxenstore \<br>
&gt; + =A0 =A0${PN}-libblktap \<br>
&gt; + =A0 =A0${PN}-libfsimage \<br>
&gt; + =A0 =A0${PN}-flask \<br>
&gt; + =A0 =A0${PN}-fsimage \<br>
&gt; + =A0 =A0${PN}-hvmloader \<br>
&gt; + =A0 =A0${PN}-scripts-block \<br>
&gt; + =A0 =A0${PN}-scripts-network \<br>
&gt; + =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0${PN}-xenpaging \<br>
&gt; + =A0 =A0${PN}-xen-watchdog \<br>
&gt; + =A0 =A0${PN}-xencommons \<br>
&gt; + =A0 =A0${PN}-xendomains \<br>
&gt; + =A0 =A0${PN}-xenstore \<br>
&gt; + =A0 =A0${PN}-xenstored \<br>
&gt; + =A0 =A0${PN}-xl \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN}-scripts-block =3D &quot;\<br>
&gt; + =A0 =A0${PN}-scripts-common \<br>
&gt; + =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +RDEPENDS_${PN}-scripts-network =3D &quot;\<br>
&gt; + =A0 =A0bridge-utils \<br>
&gt; + =A0 =A0${PN}-scripts-common \<br>
&gt; + =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +PACKAGES =3D &quot;\<br>
&gt; + =A0 =A0${PN}-base \<br>
&gt; + =A0 =A0${PN}-blktap \<br>
&gt; + =A0 =A0${PN}-console \<br>
&gt; + =A0 =A0${PN}-dbg \<br>
&gt; + =A0 =A0${PN}-dev \<br>
&gt; + =A0 =A0${PN}-doc \<br>
&gt; + =A0 =A0${PN}-flask \<br>
&gt; + =A0 =A0${PN}-fsimage \<br>
&gt; + =A0 =A0${PN}-gdbsx \<br>
&gt; + =A0 =A0${PN}-hvmloader \<br>
&gt; + =A0 =A0${PN}-hypervisor \<br>
&gt; + =A0 =A0${PN}-kdd \<br>
&gt; + =A0 =A0${PN}-libblktap \<br>
&gt; + =A0 =A0${PN}-libblktapctl \<br>
&gt; + =A0 =A0${PN}-libblktapctl-dev \<br>
&gt; + =A0 =A0${PN}-libblktap-dev \<br>
&gt; + =A0 =A0${PN}-libfsimage \<br>
&gt; + =A0 =A0${PN}-libfsimage-dev \<br>
&gt; + =A0 =A0${PN}-libvhd \<br>
&gt; + =A0 =A0${PN}-libvhd-dev \<br>
&gt; + =A0 =A0${PN}-libxenctrl \<br>
&gt; + =A0 =A0${PN}-libxenctrl-dev \<br>
&gt; + =A0 =A0${PN}-libxenguest \<br>
&gt; + =A0 =A0${PN}-libxenguest-dev \<br>
&gt; + =A0 =A0${PN}-libxenlight \<br>
&gt; + =A0 =A0${PN}-libxenlight-dev \<br>
&gt; + =A0 =A0${PN}-libxenstat \<br>
&gt; + =A0 =A0${PN}-libxenstat-dev \<br>
&gt; + =A0 =A0${PN}-libxenstore \<br>
&gt; + =A0 =A0${PN}-libxenstore-dev \<br>
&gt; + =A0 =A0${PN}-libxenvchan \<br>
&gt; + =A0 =A0${PN}-libxenvchan-dev \<br>
&gt; + =A0 =A0${PN}-libxlutil \<br>
&gt; + =A0 =A0${PN}-libxlutil-dev \<br>
&gt; + =A0 =A0${PN}-misc \<br>
&gt; + =A0 =A0${PN}-pygrub \<br>
&gt; + =A0 =A0${PN}-python \<br>
&gt; + =A0 =A0${PN}-qemu \<br>
&gt; + =A0 =A0${PN}-remus \<br>
&gt; + =A0 =A0${PN}-scripts-block \<br>
&gt; + =A0 =A0${PN}-scripts-common \<br>
&gt; + =A0 =A0${PN}-scripts-network \<br>
&gt; + =A0 =A0${PN}-staticdev \<br>
&gt; + =A0 =A0${PN}-udev \<br>
&gt; + =A0 =A0${PN}-xcutils \<br>
&gt; + =A0 =A0${PN}-xencommons \<br>
&gt; + =A0 =A0${PN}-xend \<br>
&gt; + =A0 =A0${PN}-xend-examples \<br>
&gt; + =A0 =A0${PN}-xendomains \<br>
&gt; + =A0 =A0${PN}-xenmon \<br>
&gt; + =A0 =A0${PN}-xenpaging \<br>
&gt; + =A0 =A0${PN}-xenpmd \<br>
&gt; + =A0 =A0${PN}-xenstat \<br>
&gt; + =A0 =A0${PN}-xenstore \<br>
&gt; + =A0 =A0${PN}-xenstored \<br>
&gt; + =A0 =A0${PN}-xentrace \<br>
&gt; + =A0 =A0${PN}-xen-watchdog \<br>
&gt; + =A0 =A0${PN}-xl \<br>
&gt; + =A0 =A0${PN}-xl-examples \<br>
&gt; + =A0 =A0${PN}-xm \<br>
&gt; + =A0 =A0${PN}-xm-examples \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-dbg +=3D &quot;\<br>
&gt; + =A0 =A0${libdir}/.debug \<br>
&gt; + =A0 =A0${libdir}/xen/bin/.debug \<br>
&gt; + =A0 =A0${libdir}/python2.7/site-packages/.debug \<br>
&gt; + =A0 =A0${libdir}/python2.7/site-packages/xen/lowlevel/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/xfs/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/ufs/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/ext2fs-lib/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/fat/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/zfs/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/reiserfs/.debug \<br>
&gt; + =A0 =A0${libdir}/fs/iso9660/.debug \<br>
&gt; + =A0 =A0${sbindir}/.debug \<br>
&gt; + =A0 =A0${libdir}exec/.debug \<br>
&gt; + =A0 =A0${bindir}/.debug \<br>
&gt; + =A0 =A0${libdir}/python2.7/dist-packages/.debug \<br>
&gt; + =A0 =A0${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-dev =3D &quot;\<br>
&gt; + =A0 =A0${includedir} \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-doc =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/xen/README \<br>
&gt; + =A0 =A0${sysconfdir}/xen/README.incompatibilities \<br>
&gt; + =A0 =A0${datadir}/doc \<br>
&gt; + =A0 =A0${datadir}/man \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-staticdev +=3D &quot;\<br>
&gt; + =A0 =A0${libdir}/libblktapctl.a \<br>
&gt; + =A0 =A0${libdir}/libxenguest.a \<br>
&gt; + =A0 =A0${libdir}/libxenlight.a \<br>
&gt; + =A0 =A0${libdir}/libxenvchan.a \<br>
&gt; + =A0 =A0${libdir}/libxenctrl.a \<br>
&gt; + =A0 =A0${libdir}/libxlutil.a \<br>
&gt; + =A0 =A0${libdir}/libvhd.a \<br>
&gt; + =A0 =A0${libdir}/libxenstat.a \<br>
&gt; + =A0 =A0${libdir}/libxenstore.a \<br>
&gt; + =A0 =A0${libdir}/libblktap.a \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-libblktapctl =3D &quot;${libdir}/libblktapctl.so.*&quot;<=
br>
&gt; +FILES_${PN}-libblktapctl-dev =3D &quot;${libdir}/libblktapctl.so&quot=
;<br>
&gt; +<br>
&gt; +FILES_${PN}-libxenguest =3D &quot;${libdir}/libxenguest.so.*&quot;<br=
>
&gt; +FILES_${PN}-libxenguest-dev =3D &quot;${libdir}/libxenguest.so&quot;<=
br>
&gt; +<br>
&gt; +FILES_${PN}-libxenlight =3D &quot;${libdir}/libxenlight.so.*&quot;<br=
>
&gt; +FILES_${PN}-libxenlight-dev =3D &quot;${libdir}/libxenlight.so&quot;<=
br>
&gt; +<br>
&gt; +FILES_${PN}-libxenvchan =3D &quot;${libdir}/libxenvchan.so.*&quot;<br=
>
&gt; +FILES_${PN}-libxenvchan-dev =3D &quot;${libdir}/libxenvchan.so&quot;<=
br>
&gt; +<br>
&gt; +FILES_${PN}-libxenctrl =3D &quot;${libdir}/libxenctrl.so.*&quot;<br>
&gt; +FILES_${PN}-libxenctrl-dev =3D &quot;${libdir}/libxenctrl.so&quot;<br=
>
&gt; +<br>
&gt; +FILES_${PN}-libxlutil =3D &quot;${libdir}/libxlutil.so.*&quot;<br>
&gt; +FILES_${PN}-libxlutil-dev =3D &quot;${libdir}/libxlutil.so&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-libvhd =3D &quot;${libdir}/libvhd.so.*&quot;<br>
&gt; +FILES_${PN}-libvhd-dev =3D &quot;${libdir}/libvhd.so&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-libxenstat =3D &quot;${libdir}/libxenstat.so.*&quot;<br>
&gt; +FILES_${PN}-libxenstat-dev =3D &quot;${libdir}/libxenstat.so&quot;<br=
>
&gt; +<br>
&gt; +FILES_${PN}-libxenstore =3D &quot;${libdir}/libxenstore.so.*&quot;<br=
>
&gt; +FILES_${PN}-libxenstore-dev =3D &quot;${libdir}/libxenstore.so&quot;<=
br>
&gt; +<br>
&gt; +FILES_${PN}-libblktap =3D &quot;${libdir}/libblktap.so.*&quot;<br>
&gt; +FILES_${PN}-libblktap-dev =3D &quot;${libdir}/libblktap.so&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-libfsimage =3D &quot;${libdir}/libfsimage.so.*&quot;<br>
&gt; +FILES_${PN}-libfsimage-dev =3D &quot;${libdir}/libfsimage.so&quot;<br=
>
&gt; +<br>
&gt; +FILES_${PN}-fsimage =3D &quot;${libdir}/fs/*/*fsimage.so&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-hypervisor =3D &quot;\<br>
&gt; + =A0 =A0/boot/xen-4.3.0.gz \<br>
&gt; + =A0 =A0/boot/xen-4.3.gz \<br>
&gt; + =A0 =A0/boot/xen-4.gz \<br>
&gt; + =A0 =A0/boot/xen.gz \<br>
&gt; + =A0 =A0/boot/xen-syms-4.3.0 \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-base =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/default/volatiles/99_xen \<br>
&gt; + =A0 =A0${sysconfdir}/default/xencommons \<br>
&gt; + =A0 =A0${sysconfdir}/default/xendomains \<br>
&gt; + =A0 =A0${sysconfdir}/xen/auto \<br>
&gt; + =A0 =A0${sysconfdir}/xen/cpupool \<br>
&gt; + =A0 =A0${sysconfdir}/sysconfig/xendomains \<br>
&gt; + =A0 =A0${localstatedir}/xen/dump \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-blktap =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/blktapctrl \<br>
&gt; + =A0 =A0${sbindir}/img2qcow \<br>
&gt; + =A0 =A0${sbindir}/lock-util \<br>
&gt; + =A0 =A0${sbindir}/qcow2raw \<br>
&gt; + =A0 =A0${sbindir}/qcow-create \<br>
&gt; + =A0 =A0${sbindir}/tap-ctl \<br>
&gt; + =A0 =A0${sbindir}/tapdisk \<br>
&gt; + =A0 =A0${sbindir}/tapdisk2 \<br>
&gt; + =A0 =A0${sbindir}/tapdisk-client \<br>
&gt; + =A0 =A0${sbindir}/tapdisk-diff \<br>
&gt; + =A0 =A0${sbindir}/tapdisk-stream \<br>
&gt; + =A0 =A0${sbindir}/td-util \<br>
&gt; + =A0 =A0${sbindir}/vhd-update \<br>
&gt; + =A0 =A0${sbindir}/vhd-util \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-console =3D &quot;\<br>
&gt; + =A0 =A0${libdir}/xen/bin/xenconsole \<br>
&gt; + =A0 =A0${sbindir}/xenconsoled \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-flask =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/flask-get-bool \<br>
&gt; + =A0 =A0${sbindir}/flask-getenforce \<br>
&gt; + =A0 =A0${sbindir}/flask-label-pci \<br>
&gt; + =A0 =A0${sbindir}/flask-loadpolicy \<br>
&gt; + =A0 =A0${sbindir}/flask-set-bool \<br>
&gt; + =A0 =A0${sbindir}/flask-setenforce \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-gdbsx =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/gdbsx \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP_${PN}-hvmloader =3D &quot;arch&quot;<br>
&gt; +FILES_${PN}-hvmloader =3D &quot;\<br>
&gt; + =A0 =A0${libdir}/xen/boot/hvmloader \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-kdd =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/kdd \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-misc =3D &quot;\<br>
&gt; + =A0 =A0${bindir}/xencons \<br>
&gt; + =A0 =A0${bindir}/xencov_split \<br>
&gt; + =A0 =A0${bindir}/xen-detect \<br>
&gt; + =A0 =A0${libdir}/xen/bin/xenpvnetboot \<br>
&gt; + =A0 =A0${sbindir}/gtracestat \<br>
&gt; + =A0 =A0${sbindir}/gtraceview \<br>
&gt; + =A0 =A0${sbindir}/xen-bugtool \<br>
&gt; + =A0 =A0${sbindir}/xencov \<br>
&gt; + =A0 =A0${sbindir}/xend \<br>
&gt; + =A0 =A0${sbindir}/xenperf \<br>
&gt; + =A0 =A0${sbindir}/xenpm \<br>
&gt; + =A0 =A0${sbindir}/xsview \<br>
&gt; + =A0 =A0${sbindir}/xen-tmem-list-parse \<br>
&gt; + =A0 =A0${sbindir}/xen-python-path \<br>
&gt; + =A0 =A0${sbindir}/xen-ringwatch \<br>
&gt; + =A0 =A0${sbindir}/xen-hptool \<br>
&gt; + =A0 =A0${sbindir}/xen-hvmcrash \<br>
&gt; + =A0 =A0${sbindir}/xen-hvmctx \<br>
&gt; + =A0 =A0${sbindir}/xenlockprof \<br>
&gt; + =A0 =A0${sbindir}/xen-lowmemd \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-pygrub =3D &quot;\<br>
&gt; + =A0 =A0${bindir}/pygrub \<br>
&gt; + =A0 =A0${libdir}/xen/bin/pygrub \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-python =3D &quot;\<br>
&gt; + =A0 =A0${libdir}/python2.7 \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +INSANE_SKIP_${PN}-qemu =3D &quot;arch&quot;<br>
&gt; +FILES_${PN}-qemu =3D &quot; \<br>
&gt; + =A0 =A0${datadir}/xen/qemu \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-system-i386 \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-system-x86_64 \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-img \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-nbd \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-ga \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-io \<br>
&gt; + =A0 =A0${libdir}/xen/bin/qemu-dm \<br>
&gt; + =A0 =A0${libdir}/xen/bin/virtfs-proxy-helper \<br>
&gt; + =A0 =A0/usr/libexec/qemu-bridge-helper \<br>
&gt; + =A0 =A0/usr/etc/qemu \<br>
&gt; + =A0 =A0/usr/etc/qemu/target-x86_64.conf \<br>
&gt; + =A0 =A0${datadir}/qemu-xen \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/bamboo.dtb \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-pcnet.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/vgabios-vmware.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-eepro100.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-e1000.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/openbios-ppc \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/multiboot.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/vgabios-cirrus.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/bios.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/vgabios-stdvga.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/palcode-clipper \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-ne2k_pci.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/spapr-rtas.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/slof.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/vgabios-qxl.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-rtl8139.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/openbios-sparc64 \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/pxe-virtio.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/kvmvapic.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/openbios-sparc32 \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/petalogix-s3adsp1800.dtb \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/sgabios.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/linuxboot.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/qemu-icon.bmp \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/ppc_rom.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/vgabios.bin \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/s390-zipl.rom \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/petalogix-ml605.dtb \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/common \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/th \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/is \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/en-gb \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/ar \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fr-be \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/ru \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/hu \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/de-ch \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/no \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fr \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/pl \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fr-ca \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/de \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fr-ch \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/bepo \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/lv \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/ja \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/da \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/lt \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/hr \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/es \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/modifiers \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/sl \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/it \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/nl \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fo \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/mk \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/pt-br \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/tr \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/sv \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/fi \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/en-us \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/et \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/nl-be \<br>
&gt; + =A0 =A0${datadir}/qemu-xen/qemu/keymaps/pt \<br>
&gt; + =A0 =A0${bindir}/qemu-nbd-xen \<br>
&gt; + =A0 =A0${bindir}/qemu-img-xen \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-remus =3D &quot;\<br>
&gt; + =A0 =A0${bindir}/remus \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-scripts-network =3D &quot; \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/network-bridge \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/network-nat \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/network-route \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/qemu-ifup \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif2 \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-bridge \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-common.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-nat \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-openvswitch \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-route \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vif-setup \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-scripts-block =3D &quot; \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/blktap \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/block \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/block-common.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/block-enbd \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/block-iscsi \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/block-nbd \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/vscsi \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-scripts-common =3D &quot; \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/external-device-migrate \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/hotplugpath.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/locking.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/logging.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/xen-hotplug-cleanup \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/xen-hotplug-common.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/xen-network-common.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/scripts/xen-script-common.sh \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-udev =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/udev/rules.d/xen-backend.rules \<br>
&gt; + =A0 =A0${sysconfdir}/udev/rules.d/xend.rules \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xcutils =3D &quot;\<br>
&gt; + =A0 =A0${libdir}/xen/bin/lsevtchn \<br>
&gt; + =A0 =A0${libdir}/xen/bin/readnotes \<br>
&gt; + =A0 =A0${libdir}/xen/bin/xc_restore \<br>
&gt; + =A0 =A0${libdir}/xen/bin/xc_save \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xend-examples =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/xen/xend-config.sxp \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xend-pci-permissive.sxp \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xend-pci-quirks.sxp \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenpaging =3D &quot;\<br>
&gt; + =A0 =A0${libdir}/xen/bin/xenpaging \<br>
&gt; + =A0 =A0${localstatedir}/lib/xen/xenpaging \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenpmd =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/xenpmd \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenstat =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/xentop \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenstore =3D &quot;\<br>
&gt; + =A0 =A0${bindir}/xenstore \<br>
&gt; + =A0 =A0${bindir}/xenstore-chmod \<br>
&gt; + =A0 =A0${bindir}/xenstore-control \<br>
&gt; + =A0 =A0${bindir}/xenstore-exists \<br>
&gt; + =A0 =A0${bindir}/xenstore-list \<br>
&gt; + =A0 =A0${bindir}/xenstore-ls \<br>
&gt; + =A0 =A0${bindir}/xenstore-read \<br>
&gt; + =A0 =A0${bindir}/xenstore-rm \<br>
&gt; + =A0 =A0${bindir}/xenstore-watch \<br>
&gt; + =A0 =A0${bindir}/xenstore-write \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenstored =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/xenstored \<br>
&gt; + =A0 =A0${localstatedir}/lib/xenstored \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xentrace =3D &quot;\<br>
&gt; + =A0 =A0${bindir}/xentrace \<br>
&gt; + =A0 =A0${bindir}/xentrace_format \<br>
&gt; + =A0 =A0${bindir}/xentrace_setsize \<br>
&gt; + =A0 =A0${libdir}/xen/bin/xenctx \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xen-watchdog =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/xenwatchdogd \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xl =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/bash_completion.d/xl.sh \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xl.conf \<br>
&gt; + =A0 =A0${libdir}/xen/bin/libxl-save-helper \<br>
&gt; + =A0 =A0${sbindir}/xl \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xl-examples =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/xen/xlexample.hvm \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xlexample.pvlinux \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xm-examples =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample1 \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample2 \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample3 \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample.hvm \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample.hvm-stubdom \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample.nbd \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample.pv-grub \<br>
&gt; + =A0 =A0${sysconfdir}/xen/xmexample.vti \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xenmon =3D &quot;\<br>
&gt; + =A0 =A0${sbindir}/xenbaked \<br>
&gt; + =A0 =A0${sbindir}/xentrace_setmask \<br>
&gt; + =A0 =A0${sbindir}/xenmon.py \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xm =3D &quot;\<br>
&gt; + =A0 =A0${sysconfdir}/xen/xm-config.xml \<br>
&gt; + =A0 =A0${datadir}/xen/create.dtd \<br>
&gt; + =A0 =A0${sbindir}/xm \<br>
&gt; + =A0 =A0&quot;<br>
&gt; +<br>
&gt; +FILES_${PN}-xencommons +=3D &quot;${sysconfdir}/init.d/xencommons&quo=
t;<br>
&gt; +FILES_${PN}-xend +=3D &quot;${sysconfdir}/init.d/xend&quot;<br>
&gt; +FILES_${PN}-xendomains +=3D &quot;${sysconfdir}/init.d/xendomains&quo=
t;<br>
&gt; +FILES_${PN}-xen-watchdog +=3D &quot;${sysconfdir}/init.d/xen-watchdog=
&quot;<br>
&gt; +<br>
&gt; +# configure init.d scripts<br>
&gt; +INITSCRIPT_PACKAGES =3D &quot;${PN}-xend ${PN}-xencommons ${PN}-xen-w=
atchdog ${PN}-xendomains&quot;<br>
&gt; +INITSCRIPT_NAME_${PN}-xencommons =3D &quot;xencommons&quot;<br>
&gt; +INITSCRIPT_PARAMS_${PN}-xencommons =3D &quot;defaults 80&quot;<br>
&gt; +INITSCRIPT_NAME_${PN}-xen-watchdog =3D &quot;xen-watchdog&quot;<br>
&gt; +INITSCRIPT_PARAMS_${PN}-xen-watchdog =3D &quot;defaults 81&quot;<br>
&gt; +INITSCRIPT_NAME_${PN}-xend =3D &quot;xend&quot;<br>
&gt; +INITSCRIPT_PARAMS_${PN}-xend =3D &quot;defaults 82&quot;<br>
&gt; +INITSCRIPT_NAME_${PN}-xendomains =3D &quot;xendomains&quot;<br>
&gt; +INITSCRIPT_PARAMS_${PN}-xendomains =3D &quot;defaults 83&quot;<br>
&gt; +<br>
&gt; +#### REQUIRED ENVIRONMENT VARIABLES ####<br>
&gt; +export BUILD_SYS<br>
&gt; +export HOST_SYS<br>
&gt; +export STAGING_INCDIR<br>
&gt; +export STAGING_LIBDIR<br>
&gt; +<br>
&gt; +# specify xen hypervisor to target x86_64 (x86_32 not supported)<br>
&gt; +export XEN_TARGET_ARCH=3D&quot;x86_64&quot;<br>
&gt; +export XEN_COMPILE_ARCH=3D&quot;x86_64&quot;<br>
&gt; +<br>
&gt; +# this is used for the header (#!${bindir}/python) of the install pyt=
hon scripts<br>
&gt; +export PYTHONPATH=3D&quot;${bindir}/python&quot;<br>
&gt; +<br>
&gt; +# seabios forcefully sets HOSTCC to CC - fixup to allow it to build n=
ative conf executable<br>
&gt; +export HOSTCC=3D&quot;${BUILD_CC}&quot;<br>
&gt; +<br>
&gt; +# make xen requires CROSS_COMPILE set by hand as it does not abide by=
 ./configure<br>
&gt; +export CROSS_COMPILE=3D&quot;${TARGET_PREFIX}&quot;<br>
&gt; +<br>
&gt; +# overide LDFLAGS to allow xen to build without: &quot;x86_64-oe-linu=
x-ld: unrecognized option &#39;-Wl,-O1&#39;&quot;<br>
&gt; +export LDFLAGS=3D&quot;&quot;<br>
&gt; +<br>
&gt; +do_configure() {<br>
&gt; + =A0 =A0# fixup qemu-xen-traditional pciutils check hardcoded to test=
 ${includedir}/pci<br>
&gt; + =A0 =A0sed -i &#39;s/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g&#3=
9; ${S}/tools/qemu-xen-traditional/xen-hooks.mak<br>
&gt; +<br>
&gt; + =A0 =A0# fixup for qemu to cross compile<br>
&gt; + =A0 =A0sed -i &#39;s/configure --d/configure --cross-prefix=3D${TARG=
ET_PREFIX} --d/g&#39; ${S}/tools/qemu-xen-traditional/xen-setup<br>
&gt; +<br>
&gt; + =A0 =A0# no stubs-32.h in our 64-bit sysroot - hack it into tools/in=
clude/gnu<br>
&gt; + =A0 =A0test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gn=
u<br>
&gt; + =A0 =A0if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h=
 ; then<br>
&gt; + =A0 =A0 =A0 =A0cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h =
| grep -v stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg &gt; ${S=
}/tools/include/gnu/stubs-32.h<br>
&gt; + =A0 =A0 =A0 =A0echo \#define __stub___kernel_cosl &gt;&gt; ${S}/tool=
s/include/gnu/stubs-32.h<br>
&gt; + =A0 =A0 =A0 =A0echo \#define __stub___kernel_sinl &gt;&gt; ${S}/tool=
s/include/gnu/stubs-32.h<br>
&gt; + =A0 =A0 =A0 =A0echo \#define __stub___kernel_tanl &gt;&gt; ${S}/tool=
s/include/gnu/stubs-32.h<br>
&gt; + =A0 =A0fi<br>
&gt; +<br>
&gt; + =A0 =A0# do configure<br>
&gt; + =A0 =A0./configure --exec-prefix=3D/usr --prefix=3D/usr --host=3D${H=
OST_SYS} --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub --disa=
ble-xenstore-stubdom<br>
&gt; +<br>
&gt; + =A0 =A0# seabios needs a patch to specify correct compiler - pull an=
d patch Makefile<br>
&gt; + =A0 =A0make -C ${S}/tools/firmware seabios-dir<br>
&gt; + =A0 =A0sed -i &#39;s/export HOSTCC.*$(CC)/export HOSTCC ?=3D $(CC)/g=
&#39; ${S}/tools/firmware/seabios-dir/Makefile<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_compile() {<br>
&gt; + =A0 =A0oe_runmake<br>
&gt; +}<br>
&gt; +<br>
&gt; +do_install() {<br>
&gt; + =A0 =A0oe_runmake DESTDIR=3D&quot;${D}&quot; install<br>
&gt; +<br>
&gt; + =A0 =A0# remove installed volatiles<br>
&gt; + =A0 =A0rm -rf ${D}${localstatedir}/run ${D}${localstatedir}/lock ${D=
}${localstatedir}/log ${D}${localstatedir}/volatile<br>
&gt; +<br>
&gt; + =A0 =A0# install volatiles using populate_volatiles mechanism<br>
&gt; + =A0 =A0install -d ${D}${sysconfdir}/default/volatiles<br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/run/xenstored no=
ne&quot; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt; ${D}${sysconfdir}/default/volatiles/99_xen<br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/run/xend none&qu=
ot; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/run/xend/boot no=
ne&quot; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/run/xen none&quo=
t; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/log/xen none&quo=
t; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/lock/xen none&qu=
ot; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; + =A0 =A0echo &quot;d root root 0755 ${localstatedir}/lock/subsys none=
&quot; \<br>
&gt; + =A0 =A0 =A0 =A0 &gt;&gt; ${D}${sysconfdir}/default/volatiles/99_xen<=
br>
&gt; +<br>
&gt; + =A0 =A0# workaround for xendomains script which searchs sysconfig if=
 directory exists<br>
&gt; + =A0 =A0install -d ${D}${sysconfdir}/sysconfig<br>
&gt; + =A0 =A0ln -sf ${sysconfdir}/default/xendomains ${D}${sysconfdir}/sys=
config/xendomains<br>
&gt; +}<br>
&gt; +<br>
&gt; +pkg_postinst_${PN}-base() {<br>
&gt; + =A0 =A0if [ -z &quot;$D&quot; ] &amp;&amp; [ -e ${sysconfdir}/init.d=
/populate-volatile.sh ] ; then<br>
&gt; + =A0 =A0 =A0 =A0${sysconfdir}/init.d/populate-volatile.sh update<br>
&gt; + =A0 =A0fi<br>
&gt; +}<br>
&gt; +<br>
&gt; +sysroot_stage_all_append() {<br>
&gt; + =A0 =A0 =A0 =A0sysroot_stage_dir ${D}/boot ${SYSROOT_DESTDIR}/kernel=
<br>
&gt; +<br>
&gt; + =A0 =A0install -d ${DEPLOY_DIR_IMAGE}<br>
&gt; + =A0 =A0install -m 0644 ${D}/boot/xen.gz ${DEPLOY_DIR_IMAGE}/xen-${MA=
CHINE}.gz<br>
&gt; +}<br>
&gt; --<br>
&gt; 1.7.10.4<br>
&gt;<br>
</div></div>&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
<br>
--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span></blockquote></div><br></div>

--001a11c34e6cff33b404e4fb44a4--
