Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4F345E015FF
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2013 13:40:41 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id z5so989347lbh.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 20 Sep 2013 13:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=umbIlSyErwq33oBXngP47Ot8mz/TMWxbmRYmc81Brxo=;
	b=hk7oEBwepujd2jjhLPJxqIyYC274/HQ76JLFBdZnmMFkFauregdbooUBBzcWVP84na
	KR4QM02EgOVQi+bawAXeUw5NLEh3U9r7QA8zq0S40TKPvz3DAVQqSKvbBK+Xk0rpYLdD
	XmaaZDxwI9Jcw9gzz45DMs702HELSqshtC0pQd5oUG4QYHVth0f3tU5+r0t88LwH0wr9
	IuQGkiT9N+e9j7/bZ/BGqmJV101JkgF1GcyNAubhwsFOndj791NTRf/9PmflKm3OIH3B
	LJrLS3Hw7io6HYuA5luINuGzJA8ETccVE1sjnacWOXV3K0A/Ol5N22Lk8bxqJ8FTRS4N
	aC3w==
MIME-Version: 1.0
X-Received: by 10.112.28.109 with SMTP id a13mr7787547lbh.3.1379709640109;
	Fri, 20 Sep 2013 13:40:40 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Fri, 20 Sep 2013 13:40:40 -0700 (PDT)
In-Reply-To: <523C8FA5.4030000@twobit.us>
References: <1378861361-7980-1-git-send-email-cjp256@gmail.com>
	<1378861361-7980-4-git-send-email-cjp256@gmail.com>
	<523C8FA5.4030000@twobit.us>
Date: Fri, 20 Sep 2013 16:40:40 -0400
Message-ID: <CADkTA4OxXWyxCXdJoLpRs6em3cphs5tkPamKK1re=YD9_8hp3Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 3/4] xen: add 4.3.0 recipe.
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
X-List-Received-Date: Fri, 20 Sep 2013 20:40:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 20, 2013 at 2:10 PM, Philip Tricca <flihp@twobit.us> wrote:
> +1 on this. Boot tested this the other day nesting on Xen stable-4.3. We =
could use a Xen PVHVM guest image for testing guest images :)

Agreed. Looks sane here a well. I let this stew long enough and will
merge it over the weekend.

If there are any more changes, folks should feel free to toss them to the
list as well.

Bruce

>
> - Philip
>
> On 09/10/2013 09:02 PM, Chris Patterson wrote:
>> Signed-off-by: Chris Patterson <cjp256@gmail.com>
>> ---
>>  recipes-extended/xen/xen_4.3.0.bb | 626 +++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 626 insertions(+)
>>  create mode 100644 recipes-extended/xen/xen_4.3.0.bb
>>
>> diff --git a/recipes-extended/xen/xen_4.3.0.bb b/recipes-extended/xen/xe=
n_4.3.0.bb
>> new file mode 100644
>> index 0000000..00394b9
>> --- /dev/null
>> +++ b/recipes-extended/xen/xen_4.3.0.bb
>> @@ -0,0 +1,626 @@
>> +DESCRIPTION =3D "Xen hypervisor"
>> +HOMEPAGE =3D "http://xen.org"
>> +LICENSE =3D "GPLv2"
>> +SECTION =3D "console/tools"
>> +PR =3D "r0"
>> +
>> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De0f0f3ac55608719a82394cc3539=
28df"
>> +
>> +SRC_URI =3D "http://bits.xensource.com/oss-xen/release/${PV}/xen-${PV}.=
tar.gz"
>> +
>> +SRC_URI[md5sum] =3D "7b18cfb58f1ac2ce39cf35a1867f0c0a"
>> +SRC_URI[sha256sum] =3D "e1e9faabe4886e2227aacdbde74410653b233d66642ca19=
72a860cbec6439961"
>> +
>> +S =3D "${WORKDIR}/xen-${PV}"
>> +
>> +COMPATIBLE_HOST =3D '(x86_64.*).*-linux'
>> +
>> +inherit autotools gettext setuptools update-rc.d
>> +
>> +DEPENDS =3D "util-linux util-linux-native file-native zlib ncurses open=
ssl bison-native flex-native gettext dev86-native iasl-native pciutils virt=
ual/libgl virtual/libsdl bridge-utils iproute2 procps yajl pixman python py=
thon-setuptools-native xz xz-native"
>> +
>> +# inherit setuptools adds python to RDEPENDS, override it
>> +RDEPENDS_${PN} =3D ""
>> +
>> +RDEPENDS_${PN}-base =3D "\
>> +    libgcc udev bash perl xz \
>> +    ${PN}-blktap \
>> +    ${PN}-console \
>> +    ${PN}-libblktapctl \
>> +    ${PN}-libxenguest \
>> +    ${PN}-libxenlight \
>> +    ${PN}-libxenvchan \
>> +    ${PN}-libxenctrl \
>> +    ${PN}-libxlutil \
>> +    ${PN}-libvhd \
>> +    ${PN}-libxenstat \
>> +    ${PN}-libxenstore \
>> +    ${PN}-libblktap \
>> +    ${PN}-libfsimage \
>> +    ${PN}-flask \
>> +    ${PN}-fsimage \
>> +    ${PN}-hvmloader \
>> +    ${PN}-scripts-block \
>> +    ${PN}-scripts-network \
>> +    ${PN}-udev \
>> +    ${PN}-xenpaging \
>> +    ${PN}-xen-watchdog \
>> +    ${PN}-xencommons \
>> +    ${PN}-xendomains \
>> +    ${PN}-xenstore \
>> +    ${PN}-xenstored \
>> +    ${PN}-xl \
>> +    "
>> +
>> +RDEPENDS_${PN}-scripts-block =3D "\
>> +    ${PN}-scripts-common \
>> +    ${PN}-udev \
>> +    "
>> +
>> +RDEPENDS_${PN}-scripts-network =3D "\
>> +    bridge-utils \
>> +    ${PN}-scripts-common \
>> +    ${PN}-udev \
>> +    "
>> +
>> +PACKAGES =3D "\
>> +    ${PN}-base \
>> +    ${PN}-blktap \
>> +    ${PN}-console \
>> +    ${PN}-dbg \
>> +    ${PN}-dev \
>> +    ${PN}-doc \
>> +    ${PN}-flask \
>> +    ${PN}-fsimage \
>> +    ${PN}-gdbsx \
>> +    ${PN}-hvmloader \
>> +    ${PN}-hypervisor \
>> +    ${PN}-kdd \
>> +    ${PN}-libblktap \
>> +    ${PN}-libblktapctl \
>> +    ${PN}-libblktapctl-dev \
>> +    ${PN}-libblktap-dev \
>> +    ${PN}-libfsimage \
>> +    ${PN}-libfsimage-dev \
>> +    ${PN}-libvhd \
>> +    ${PN}-libvhd-dev \
>> +    ${PN}-libxenctrl \
>> +    ${PN}-libxenctrl-dev \
>> +    ${PN}-libxenguest \
>> +    ${PN}-libxenguest-dev \
>> +    ${PN}-libxenlight \
>> +    ${PN}-libxenlight-dev \
>> +    ${PN}-libxenstat \
>> +    ${PN}-libxenstat-dev \
>> +    ${PN}-libxenstore \
>> +    ${PN}-libxenstore-dev \
>> +    ${PN}-libxenvchan \
>> +    ${PN}-libxenvchan-dev \
>> +    ${PN}-libxlutil \
>> +    ${PN}-libxlutil-dev \
>> +    ${PN}-misc \
>> +    ${PN}-pygrub \
>> +    ${PN}-python \
>> +    ${PN}-qemu \
>> +    ${PN}-remus \
>> +    ${PN}-scripts-block \
>> +    ${PN}-scripts-common \
>> +    ${PN}-scripts-network \
>> +    ${PN}-staticdev \
>> +    ${PN}-udev \
>> +    ${PN}-xcutils \
>> +    ${PN}-xencommons \
>> +    ${PN}-xend \
>> +    ${PN}-xend-examples \
>> +    ${PN}-xendomains \
>> +    ${PN}-xenmon \
>> +    ${PN}-xenpaging \
>> +    ${PN}-xenpmd \
>> +    ${PN}-xenstat \
>> +    ${PN}-xenstore \
>> +    ${PN}-xenstored \
>> +    ${PN}-xentrace \
>> +    ${PN}-xen-watchdog \
>> +    ${PN}-xl \
>> +    ${PN}-xl-examples \
>> +    ${PN}-xm \
>> +    ${PN}-xm-examples \
>> +    "
>> +
>> +FILES_${PN}-dbg +=3D "\
>> +    ${libdir}/.debug \
>> +    ${libdir}/xen/bin/.debug \
>> +    ${libdir}/python2.7/site-packages/.debug \
>> +    ${libdir}/python2.7/site-packages/xen/lowlevel/.debug \
>> +    ${libdir}/fs/xfs/.debug \
>> +    ${libdir}/fs/ufs/.debug \
>> +    ${libdir}/fs/ext2fs-lib/.debug \
>> +    ${libdir}/fs/fat/.debug \
>> +    ${libdir}/fs/zfs/.debug \
>> +    ${libdir}/fs/reiserfs/.debug \
>> +    ${libdir}/fs/iso9660/.debug \
>> +    ${sbindir}/.debug \
>> +    ${libdir}exec/.debug \
>> +    ${bindir}/.debug \
>> +    ${libdir}/python2.7/dist-packages/.debug \
>> +    ${libdir}/python2.7/dist-packages/xen/lowlevel/.debug \
>> +    "
>> +
>> +FILES_${PN}-dev =3D "\
>> +    ${includedir} \
>> +    "
>> +
>> +FILES_${PN}-doc =3D "\
>> +    ${sysconfdir}/xen/README \
>> +    ${sysconfdir}/xen/README.incompatibilities \
>> +    ${datadir}/doc \
>> +    ${datadir}/man \
>> +    "
>> +
>> +FILES_${PN}-staticdev +=3D "\
>> +    ${libdir}/libblktapctl.a \
>> +    ${libdir}/libxenguest.a \
>> +    ${libdir}/libxenlight.a \
>> +    ${libdir}/libxenvchan.a \
>> +    ${libdir}/libxenctrl.a \
>> +    ${libdir}/libxlutil.a \
>> +    ${libdir}/libvhd.a \
>> +    ${libdir}/libxenstat.a \
>> +    ${libdir}/libxenstore.a \
>> +    ${libdir}/libblktap.a \
>> +    "
>> +
>> +FILES_${PN}-libblktapctl =3D "${libdir}/libblktapctl.so.*"
>> +FILES_${PN}-libblktapctl-dev =3D "${libdir}/libblktapctl.so"
>> +
>> +FILES_${PN}-libxenguest =3D "${libdir}/libxenguest.so.*"
>> +FILES_${PN}-libxenguest-dev =3D "${libdir}/libxenguest.so"
>> +
>> +FILES_${PN}-libxenlight =3D "${libdir}/libxenlight.so.*"
>> +FILES_${PN}-libxenlight-dev =3D "${libdir}/libxenlight.so"
>> +
>> +FILES_${PN}-libxenvchan =3D "${libdir}/libxenvchan.so.*"
>> +FILES_${PN}-libxenvchan-dev =3D "${libdir}/libxenvchan.so"
>> +
>> +FILES_${PN}-libxenctrl =3D "${libdir}/libxenctrl.so.*"
>> +FILES_${PN}-libxenctrl-dev =3D "${libdir}/libxenctrl.so"
>> +
>> +FILES_${PN}-libxlutil =3D "${libdir}/libxlutil.so.*"
>> +FILES_${PN}-libxlutil-dev =3D "${libdir}/libxlutil.so"
>> +
>> +FILES_${PN}-libvhd =3D "${libdir}/libvhd.so.*"
>> +FILES_${PN}-libvhd-dev =3D "${libdir}/libvhd.so"
>> +
>> +FILES_${PN}-libxenstat =3D "${libdir}/libxenstat.so.*"
>> +FILES_${PN}-libxenstat-dev =3D "${libdir}/libxenstat.so"
>> +
>> +FILES_${PN}-libxenstore =3D "${libdir}/libxenstore.so.*"
>> +FILES_${PN}-libxenstore-dev =3D "${libdir}/libxenstore.so"
>> +
>> +FILES_${PN}-libblktap =3D "${libdir}/libblktap.so.*"
>> +FILES_${PN}-libblktap-dev =3D "${libdir}/libblktap.so"
>> +
>> +FILES_${PN}-libfsimage =3D "${libdir}/libfsimage.so.*"
>> +FILES_${PN}-libfsimage-dev =3D "${libdir}/libfsimage.so"
>> +
>> +FILES_${PN}-fsimage =3D "${libdir}/fs/*/*fsimage.so"
>> +
>> +FILES_${PN}-hypervisor =3D "\
>> +    /boot/xen-4.3.0.gz \
>> +    /boot/xen-4.3.gz \
>> +    /boot/xen-4.gz \
>> +    /boot/xen.gz \
>> +    /boot/xen-syms-4.3.0 \
>> +    "
>> +
>> +FILES_${PN}-base =3D "\
>> +    ${sysconfdir}/default/volatiles/99_xen \
>> +    ${sysconfdir}/default/xencommons \
>> +    ${sysconfdir}/default/xendomains \
>> +    ${sysconfdir}/xen/auto \
>> +    ${sysconfdir}/xen/cpupool \
>> +    ${sysconfdir}/sysconfig/xendomains \
>> +    ${localstatedir}/xen/dump \
>> +    "
>> +
>> +FILES_${PN}-blktap =3D "\
>> +    ${sbindir}/blktapctrl \
>> +    ${sbindir}/img2qcow \
>> +    ${sbindir}/lock-util \
>> +    ${sbindir}/qcow2raw \
>> +    ${sbindir}/qcow-create \
>> +    ${sbindir}/tap-ctl \
>> +    ${sbindir}/tapdisk \
>> +    ${sbindir}/tapdisk2 \
>> +    ${sbindir}/tapdisk-client \
>> +    ${sbindir}/tapdisk-diff \
>> +    ${sbindir}/tapdisk-stream \
>> +    ${sbindir}/td-util \
>> +    ${sbindir}/vhd-update \
>> +    ${sbindir}/vhd-util \
>> +    "
>> +
>> +FILES_${PN}-console =3D "\
>> +    ${libdir}/xen/bin/xenconsole \
>> +    ${sbindir}/xenconsoled \
>> +    "
>> +
>> +FILES_${PN}-flask =3D "\
>> +    ${sbindir}/flask-get-bool \
>> +    ${sbindir}/flask-getenforce \
>> +    ${sbindir}/flask-label-pci \
>> +    ${sbindir}/flask-loadpolicy \
>> +    ${sbindir}/flask-set-bool \
>> +    ${sbindir}/flask-setenforce \
>> +    "
>> +
>> +FILES_${PN}-gdbsx =3D "\
>> +    ${sbindir}/gdbsx \
>> +    "
>> +
>> +INSANE_SKIP_${PN}-hvmloader =3D "arch"
>> +FILES_${PN}-hvmloader =3D "\
>> +    ${libdir}/xen/boot/hvmloader \
>> +    "
>> +
>> +FILES_${PN}-kdd =3D "\
>> +    ${sbindir}/kdd \
>> +    "
>> +
>> +FILES_${PN}-misc =3D "\
>> +    ${bindir}/xencons \
>> +    ${bindir}/xencov_split \
>> +    ${bindir}/xen-detect \
>> +    ${libdir}/xen/bin/xenpvnetboot \
>> +    ${sbindir}/gtracestat \
>> +    ${sbindir}/gtraceview \
>> +    ${sbindir}/xen-bugtool \
>> +    ${sbindir}/xencov \
>> +    ${sbindir}/xend \
>> +    ${sbindir}/xenperf \
>> +    ${sbindir}/xenpm \
>> +    ${sbindir}/xsview \
>> +    ${sbindir}/xen-tmem-list-parse \
>> +    ${sbindir}/xen-python-path \
>> +    ${sbindir}/xen-ringwatch \
>> +    ${sbindir}/xen-hptool \
>> +    ${sbindir}/xen-hvmcrash \
>> +    ${sbindir}/xen-hvmctx \
>> +    ${sbindir}/xenlockprof \
>> +    ${sbindir}/xen-lowmemd \
>> +    "
>> +
>> +FILES_${PN}-pygrub =3D "\
>> +    ${bindir}/pygrub \
>> +    ${libdir}/xen/bin/pygrub \
>> +    "
>> +
>> +FILES_${PN}-python =3D "\
>> +    ${libdir}/python2.7 \
>> +    "
>> +
>> +INSANE_SKIP_${PN}-qemu =3D "arch"
>> +FILES_${PN}-qemu =3D " \
>> +    ${datadir}/xen/qemu \
>> +    ${libdir}/xen/bin/qemu-system-i386 \
>> +    ${libdir}/xen/bin/qemu-system-x86_64 \
>> +    ${libdir}/xen/bin/qemu-img \
>> +    ${libdir}/xen/bin/qemu-nbd \
>> +    ${libdir}/xen/bin/qemu-ga \
>> +    ${libdir}/xen/bin/qemu-io \
>> +    ${libdir}/xen/bin/qemu-dm \
>> +    ${libdir}/xen/bin/virtfs-proxy-helper \
>> +    /usr/libexec/qemu-bridge-helper \
>> +    /usr/etc/qemu \
>> +    /usr/etc/qemu/target-x86_64.conf \
>> +    ${datadir}/qemu-xen \
>> +    ${datadir}/qemu-xen/qemu \
>> +    ${datadir}/qemu-xen/qemu/bamboo.dtb \
>> +    ${datadir}/qemu-xen/qemu/pxe-pcnet.rom \
>> +    ${datadir}/qemu-xen/qemu/vgabios-vmware.bin \
>> +    ${datadir}/qemu-xen/qemu/pxe-eepro100.rom \
>> +    ${datadir}/qemu-xen/qemu/pxe-e1000.rom \
>> +    ${datadir}/qemu-xen/qemu/openbios-ppc \
>> +    ${datadir}/qemu-xen/qemu/multiboot.bin \
>> +    ${datadir}/qemu-xen/qemu/vgabios-cirrus.bin \
>> +    ${datadir}/qemu-xen/qemu/bios.bin \
>> +    ${datadir}/qemu-xen/qemu/vgabios-stdvga.bin \
>> +    ${datadir}/qemu-xen/qemu/palcode-clipper \
>> +    ${datadir}/qemu-xen/qemu/pxe-ne2k_pci.rom \
>> +    ${datadir}/qemu-xen/qemu/spapr-rtas.bin \
>> +    ${datadir}/qemu-xen/qemu/slof.bin \
>> +    ${datadir}/qemu-xen/qemu/vgabios-qxl.bin \
>> +    ${datadir}/qemu-xen/qemu/pxe-rtl8139.rom \
>> +    ${datadir}/qemu-xen/qemu/openbios-sparc64 \
>> +    ${datadir}/qemu-xen/qemu/pxe-virtio.rom \
>> +    ${datadir}/qemu-xen/qemu/kvmvapic.bin \
>> +    ${datadir}/qemu-xen/qemu/openbios-sparc32 \
>> +    ${datadir}/qemu-xen/qemu/petalogix-s3adsp1800.dtb \
>> +    ${datadir}/qemu-xen/qemu/sgabios.bin \
>> +    ${datadir}/qemu-xen/qemu/linuxboot.bin \
>> +    ${datadir}/qemu-xen/qemu/qemu-icon.bmp \
>> +    ${datadir}/qemu-xen/qemu/ppc_rom.bin \
>> +    ${datadir}/qemu-xen/qemu/vgabios.bin \
>> +    ${datadir}/qemu-xen/qemu/s390-zipl.rom \
>> +    ${datadir}/qemu-xen/qemu/petalogix-ml605.dtb \
>> +    ${datadir}/qemu-xen/qemu/keymaps \
>> +    ${datadir}/qemu-xen/qemu/keymaps/common \
>> +    ${datadir}/qemu-xen/qemu/keymaps/th \
>> +    ${datadir}/qemu-xen/qemu/keymaps/is \
>> +    ${datadir}/qemu-xen/qemu/keymaps/en-gb \
>> +    ${datadir}/qemu-xen/qemu/keymaps/ar \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fr-be \
>> +    ${datadir}/qemu-xen/qemu/keymaps/ru \
>> +    ${datadir}/qemu-xen/qemu/keymaps/hu \
>> +    ${datadir}/qemu-xen/qemu/keymaps/de-ch \
>> +    ${datadir}/qemu-xen/qemu/keymaps/no \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fr \
>> +    ${datadir}/qemu-xen/qemu/keymaps/pl \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fr-ca \
>> +    ${datadir}/qemu-xen/qemu/keymaps/de \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fr-ch \
>> +    ${datadir}/qemu-xen/qemu/keymaps/bepo \
>> +    ${datadir}/qemu-xen/qemu/keymaps/lv \
>> +    ${datadir}/qemu-xen/qemu/keymaps/ja \
>> +    ${datadir}/qemu-xen/qemu/keymaps/da \
>> +    ${datadir}/qemu-xen/qemu/keymaps/lt \
>> +    ${datadir}/qemu-xen/qemu/keymaps/hr \
>> +    ${datadir}/qemu-xen/qemu/keymaps/es \
>> +    ${datadir}/qemu-xen/qemu/keymaps/modifiers \
>> +    ${datadir}/qemu-xen/qemu/keymaps/sl \
>> +    ${datadir}/qemu-xen/qemu/keymaps/it \
>> +    ${datadir}/qemu-xen/qemu/keymaps/nl \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fo \
>> +    ${datadir}/qemu-xen/qemu/keymaps/mk \
>> +    ${datadir}/qemu-xen/qemu/keymaps/pt-br \
>> +    ${datadir}/qemu-xen/qemu/keymaps/tr \
>> +    ${datadir}/qemu-xen/qemu/keymaps/sv \
>> +    ${datadir}/qemu-xen/qemu/keymaps/fi \
>> +    ${datadir}/qemu-xen/qemu/keymaps/en-us \
>> +    ${datadir}/qemu-xen/qemu/keymaps/et \
>> +    ${datadir}/qemu-xen/qemu/keymaps/nl-be \
>> +    ${datadir}/qemu-xen/qemu/keymaps/pt \
>> +    ${bindir}/qemu-nbd-xen \
>> +    ${bindir}/qemu-img-xen \
>> +    "
>> +
>> +FILES_${PN}-remus =3D "\
>> +    ${bindir}/remus \
>> +    "
>> +
>> +FILES_${PN}-scripts-network =3D " \
>> +    ${sysconfdir}/xen/scripts/network-bridge \
>> +    ${sysconfdir}/xen/scripts/network-nat \
>> +    ${sysconfdir}/xen/scripts/network-route \
>> +    ${sysconfdir}/xen/scripts/qemu-ifup \
>> +    ${sysconfdir}/xen/scripts/vif2 \
>> +    ${sysconfdir}/xen/scripts/vif-bridge \
>> +    ${sysconfdir}/xen/scripts/vif-common.sh \
>> +    ${sysconfdir}/xen/scripts/vif-nat \
>> +    ${sysconfdir}/xen/scripts/vif-openvswitch \
>> +    ${sysconfdir}/xen/scripts/vif-route \
>> +    ${sysconfdir}/xen/scripts/vif-setup \
>> +    "
>> +
>> +FILES_${PN}-scripts-block =3D " \
>> +    ${sysconfdir}/xen/scripts/blktap \
>> +    ${sysconfdir}/xen/scripts/block \
>> +    ${sysconfdir}/xen/scripts/block-common.sh \
>> +    ${sysconfdir}/xen/scripts/block-enbd \
>> +    ${sysconfdir}/xen/scripts/block-iscsi \
>> +    ${sysconfdir}/xen/scripts/block-nbd \
>> +    ${sysconfdir}/xen/scripts/vscsi \
>> +    "
>> +
>> +FILES_${PN}-scripts-common =3D " \
>> +    ${sysconfdir}/xen/scripts/external-device-migrate \
>> +    ${sysconfdir}/xen/scripts/hotplugpath.sh \
>> +    ${sysconfdir}/xen/scripts/locking.sh \
>> +    ${sysconfdir}/xen/scripts/logging.sh \
>> +    ${sysconfdir}/xen/scripts/xen-hotplug-cleanup \
>> +    ${sysconfdir}/xen/scripts/xen-hotplug-common.sh \
>> +    ${sysconfdir}/xen/scripts/xen-network-common.sh \
>> +    ${sysconfdir}/xen/scripts/xen-script-common.sh \
>> +    "
>> +
>> +FILES_${PN}-udev =3D "\
>> +    ${sysconfdir}/udev/rules.d/xen-backend.rules \
>> +    ${sysconfdir}/udev/rules.d/xend.rules \
>> +    "
>> +
>> +FILES_${PN}-xcutils =3D "\
>> +    ${libdir}/xen/bin/lsevtchn \
>> +    ${libdir}/xen/bin/readnotes \
>> +    ${libdir}/xen/bin/xc_restore \
>> +    ${libdir}/xen/bin/xc_save \
>> +    "
>> +
>> +FILES_${PN}-xend-examples =3D "\
>> +    ${sysconfdir}/xen/xend-config.sxp \
>> +    ${sysconfdir}/xen/xend-pci-permissive.sxp \
>> +    ${sysconfdir}/xen/xend-pci-quirks.sxp \
>> +    "
>> +
>> +FILES_${PN}-xenpaging =3D "\
>> +    ${libdir}/xen/bin/xenpaging \
>> +    ${localstatedir}/lib/xen/xenpaging \
>> +    "
>> +
>> +FILES_${PN}-xenpmd =3D "\
>> +    ${sbindir}/xenpmd \
>> +    "
>> +
>> +FILES_${PN}-xenstat =3D "\
>> +    ${sbindir}/xentop \
>> +    "
>> +
>> +FILES_${PN}-xenstore =3D "\
>> +    ${bindir}/xenstore \
>> +    ${bindir}/xenstore-chmod \
>> +    ${bindir}/xenstore-control \
>> +    ${bindir}/xenstore-exists \
>> +    ${bindir}/xenstore-list \
>> +    ${bindir}/xenstore-ls \
>> +    ${bindir}/xenstore-read \
>> +    ${bindir}/xenstore-rm \
>> +    ${bindir}/xenstore-watch \
>> +    ${bindir}/xenstore-write \
>> +    "
>> +
>> +FILES_${PN}-xenstored =3D "\
>> +    ${sbindir}/xenstored \
>> +    ${localstatedir}/lib/xenstored \
>> +    "
>> +
>> +FILES_${PN}-xentrace =3D "\
>> +    ${bindir}/xentrace \
>> +    ${bindir}/xentrace_format \
>> +    ${bindir}/xentrace_setsize \
>> +    ${libdir}/xen/bin/xenctx \
>> +    "
>> +
>> +FILES_${PN}-xen-watchdog =3D "\
>> +    ${sbindir}/xenwatchdogd \
>> +    "
>> +
>> +FILES_${PN}-xl =3D "\
>> +    ${sysconfdir}/bash_completion.d/xl.sh \
>> +    ${sysconfdir}/xen/xl.conf \
>> +    ${libdir}/xen/bin/libxl-save-helper \
>> +    ${sbindir}/xl \
>> +    "
>> +
>> +FILES_${PN}-xl-examples =3D "\
>> +    ${sysconfdir}/xen/xlexample.hvm \
>> +    ${sysconfdir}/xen/xlexample.pvlinux \
>> +    "
>> +
>> +FILES_${PN}-xm-examples =3D "\
>> +    ${sysconfdir}/xen/xmexample1 \
>> +    ${sysconfdir}/xen/xmexample2 \
>> +    ${sysconfdir}/xen/xmexample3 \
>> +    ${sysconfdir}/xen/xmexample.hvm \
>> +    ${sysconfdir}/xen/xmexample.hvm-stubdom \
>> +    ${sysconfdir}/xen/xmexample.nbd \
>> +    ${sysconfdir}/xen/xmexample.pv-grub \
>> +    ${sysconfdir}/xen/xmexample.vti \
>> +    "
>> +
>> +FILES_${PN}-xenmon =3D "\
>> +    ${sbindir}/xenbaked \
>> +    ${sbindir}/xentrace_setmask \
>> +    ${sbindir}/xenmon.py \
>> +    "
>> +
>> +FILES_${PN}-xm =3D "\
>> +    ${sysconfdir}/xen/xm-config.xml \
>> +    ${datadir}/xen/create.dtd \
>> +    ${sbindir}/xm \
>> +    "
>> +
>> +FILES_${PN}-xencommons +=3D "${sysconfdir}/init.d/xencommons"
>> +FILES_${PN}-xend +=3D "${sysconfdir}/init.d/xend"
>> +FILES_${PN}-xendomains +=3D "${sysconfdir}/init.d/xendomains"
>> +FILES_${PN}-xen-watchdog +=3D "${sysconfdir}/init.d/xen-watchdog"
>> +
>> +# configure init.d scripts
>> +INITSCRIPT_PACKAGES =3D "${PN}-xend ${PN}-xencommons ${PN}-xen-watchdog=
 ${PN}-xendomains"
>> +INITSCRIPT_NAME_${PN}-xencommons =3D "xencommons"
>> +INITSCRIPT_PARAMS_${PN}-xencommons =3D "defaults 80"
>> +INITSCRIPT_NAME_${PN}-xen-watchdog =3D "xen-watchdog"
>> +INITSCRIPT_PARAMS_${PN}-xen-watchdog =3D "defaults 81"
>> +INITSCRIPT_NAME_${PN}-xend =3D "xend"
>> +INITSCRIPT_PARAMS_${PN}-xend =3D "defaults 82"
>> +INITSCRIPT_NAME_${PN}-xendomains =3D "xendomains"
>> +INITSCRIPT_PARAMS_${PN}-xendomains =3D "defaults 83"
>> +
>> +#### REQUIRED ENVIRONMENT VARIABLES ####
>> +export BUILD_SYS
>> +export HOST_SYS
>> +export STAGING_INCDIR
>> +export STAGING_LIBDIR
>> +
>> +# specify xen hypervisor to target x86_64 (x86_32 not supported)
>> +export XEN_TARGET_ARCH=3D"x86_64"
>> +export XEN_COMPILE_ARCH=3D"x86_64"
>> +
>> +# this is used for the header (#!${bindir}/python) of the install pytho=
n scripts
>> +export PYTHONPATH=3D"${bindir}/python"
>> +
>> +# seabios forcefully sets HOSTCC to CC - fixup to allow it to build nat=
ive conf executable
>> +export HOSTCC=3D"${BUILD_CC}"
>> +
>> +# make xen requires CROSS_COMPILE set by hand as it does not abide by .=
/configure
>> +export CROSS_COMPILE=3D"${TARGET_PREFIX}"
>> +
>> +# overide LDFLAGS to allow xen to build without: "x86_64-oe-linux-ld: u=
nrecognized option '-Wl,-O1'"
>> +export LDFLAGS=3D""
>> +
>> +do_configure() {
>> +    # fixup qemu-xen-traditional pciutils check hardcoded to test ${inc=
ludedir}/pci
>> +    sed -i 's/\/usr\/include\/pci/$(STAGING_INCDIR)\/pci/g' ${S}/tools/=
qemu-xen-traditional/xen-hooks.mak
>> +
>> +    # fixup for qemu to cross compile
>> +    sed -i 's/configure --d/configure --cross-prefix=3D${TARGET_PREFIX}=
 --d/g' ${S}/tools/qemu-xen-traditional/xen-setup
>> +
>> +    # no stubs-32.h in our 64-bit sysroot - hack it into tools/include/=
gnu
>> +    test -d ${S}/tools/include/gnu || mkdir ${S}/tools/include/gnu
>> +    if ! test -f ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-32.h ; the=
n
>> +        cat ${STAGING_DIR_TARGET}/usr/include/gnu/stubs-64.h | grep -v =
stub_bdflush | grep -v stub_getmsg | grep -v stub_putmsg > ${S}/tools/inclu=
de/gnu/stubs-32.h
>> +        echo \#define __stub___kernel_cosl >> ${S}/tools/include/gnu/st=
ubs-32.h
>> +        echo \#define __stub___kernel_sinl >> ${S}/tools/include/gnu/st=
ubs-32.h
>> +        echo \#define __stub___kernel_tanl >> ${S}/tools/include/gnu/st=
ubs-32.h
>> +    fi
>> +
>> +    # do configure
>> +    ./configure --exec-prefix=3D/usr --prefix=3D/usr --host=3D${HOST_SY=
S} --disable-stubdom --disable-ioemu-stubdom --disable-pv-grub --disable-xe=
nstore-stubdom
>> +
>> +    # seabios needs a patch to specify correct compiler - pull and patc=
h Makefile
>> +    make -C ${S}/tools/firmware seabios-dir
>> +    sed -i 's/export HOSTCC.*$(CC)/export HOSTCC ?=3D $(CC)/g' ${S}/too=
ls/firmware/seabios-dir/Makefile
>> +}
>> +
>> +do_compile() {
>> +    oe_runmake
>> +}
>> +
>> +do_install() {
>> +    oe_runmake DESTDIR=3D"${D}" install
>> +
>> +    # remove installed volatiles
>> +    rm -rf ${D}${localstatedir}/run ${D}${localstatedir}/lock ${D}${loc=
alstatedir}/log ${D}${localstatedir}/volatile
>> +
>> +    # install volatiles using populate_volatiles mechanism
>> +    install -d ${D}${sysconfdir}/default/volatiles
>> +    echo "d root root 0755 ${localstatedir}/run/xenstored none" \
>> +         > ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/run/xend none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/run/xend/boot none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/run/xen none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/log/xen none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/lock/xen none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +    echo "d root root 0755 ${localstatedir}/lock/subsys none" \
>> +         >> ${D}${sysconfdir}/default/volatiles/99_xen
>> +
>> +    # workaround for xendomains script which searchs sysconfig if direc=
tory exists
>> +    install -d ${D}${sysconfdir}/sysconfig
>> +    ln -sf ${sysconfdir}/default/xendomains ${D}${sysconfdir}/sysconfig=
/xendomains
>> +}
>> +
>> +pkg_postinst_${PN}-base() {
>> +    if [ -z "$D" ] && [ -e ${sysconfdir}/init.d/populate-volatile.sh ] =
; then
>> +        ${sysconfdir}/init.d/populate-volatile.sh update
>> +    fi
>> +}
>> +
>> +sysroot_stage_all_append() {
>> +    sysroot_stage_dir ${D}/boot ${SYSROOT_DESTDIR}/kernel
>> +
>> +    install -d ${DEPLOY_DIR_IMAGE}
>> +    install -m 0644 ${D}/boot/xen.gz ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}=
.gz
>> +}
>>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

