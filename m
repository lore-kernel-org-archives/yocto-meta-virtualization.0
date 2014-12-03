Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5BE14E0086F; Tue,  2 Dec 2014 20:35:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 42942E00521
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Dec 2014 20:35:01 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id p9so11690591lbv.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Dec 2014 20:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=GQMac/0GThlPESkOkbBDBHea6ZmbBrG6/BR5Me+eSNM=;
	b=PhqbrGGWpWDbAwWtlk6r5/Vf19Ud5Nb9z1HuNQ9cutCJKs0vVxAvykrUU27BBws5r4
	ddK8mHTJl3arvVzDhGq1Y4JQ2X5MFqSR1cLbZhh4ZVxbdFfOvykhwnCGIsL50kviko/7
	ekzHphHhJuPO96IOFxWPyEOWgaY94TVXY/561NFA2ttZr5XOcSrGnL0r0arYQEHOvCeB
	19mCAKOhmYBS0Bam1C1dAdz9lMYL8U6OB+rrEvB7o/Ud66CAEy4WX1EEiQJ5Ajlta0D+
	1KV/97AVOiXNM+eyw8qqN3tpEn5ujIX8WQnDlxgI3jUVeqr6riDe4nRDY0q4+ZR+bs2I
	LmVw==
MIME-Version: 1.0
X-Received: by 10.112.170.7 with SMTP id ai7mr2344242lbc.67.1417581300012;
	Tue, 02 Dec 2014 20:35:00 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Tue, 2 Dec 2014 20:34:59 -0800 (PST)
In-Reply-To: <1417577611-13242-1-git-send-email-mark.asselstine@windriver.com>
References: <1417577611-13242-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 2 Dec 2014 23:34:59 -0500
Message-ID: <CADkTA4MV_axqhRgcAvF3JKY=jd6CW+TS0Yfh9S-B+gRaA2w4LA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: uprev to latest stable update - v2.1.3
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
X-List-Received-Date: Wed, 03 Dec 2014 04:35:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 2, 2014 at 10:33 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> v2.1.3 is listed upstream as "contains only bug fixes for the 2.1.2
> release". The only update to the recipe is updated checksums.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Bruce,
>
> I notice that upstream has released v2.3.0 as well. I will look to
> creating a recipe for that shortly so folks can have it available to
> try out while we continue to make this v2.1.x release stream
> available.

Agreed. I had noticed the release as well. I'll queue this immediately, sin=
ce it
is just a stable/bug update. And we'll wait for 2.3 for the "new stuff".

Cheers,

Bruce

>
> Mark
>
>
>  .../openvswitch/openvswitch_2.1.2.bb               | 130 ---------------=
------
>  .../openvswitch/openvswitch_2.1.3.bb               | 130 +++++++++++++++=
++++++
>  2 files changed, 130 insertions(+), 130 deletions(-)
>  delete mode 100644 recipes-networking/openvswitch/openvswitch_2.1.2.bb
>  create mode 100644 recipes-networking/openvswitch/openvswitch_2.1.3.bb
>
> diff --git a/recipes-networking/openvswitch/openvswitch_2.1.2.bb b/recipe=
s-networking/openvswitch/openvswitch_2.1.2.bb
> deleted file mode 100644
> index 3f092af..0000000
> --- a/recipes-networking/openvswitch/openvswitch_2.1.2.bb
> +++ /dev/null
> @@ -1,130 +0,0 @@
> -SUMMARY =3D "OpenvSwitch"
> -DESCRIPTION =3D "Open vSwitch is a production quality, multilayer virtua=
l switch licensed under the open source Apache 2.0 license. It is designed =
to enable massive network automation through programmatic extension, while =
still supporting standard management interfaces and protocols (e.g. NetFlow=
, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
> -HOMEPAGE =3D "http://openvswitch.org/"
> -SECTION =3D "networking"
> -LICENSE =3D "Apache-2"
> -
> -DEPENDS +=3D "bridge-utils openssl python perl"
> -
> -RDEPENDS_${PN} +=3D "util-linux-uuidgen util-linux-libuuid coreutils \
> -              python perl perl-module-strict ${PN}-switch ${PN}-controll=
er"
> -RDEPENDS_${PN}-controller =3D "${PN} lsb ${PN}-pki"
> -RDEPENDS_${PN}-switch =3D "${PN} openssl procps util-linux-uuidgen"
> -RDEPENDS_${PN}-pki =3D "${PN}"
> -RDEPENDS_${PN}-brcompat =3D "${PN} ${PN}-switch"
> -RRECOMMENDS_${PN} +=3D "kernel-module-openvswitch"
> -
> -RDEPENDS_${PN}-ptest +=3D "python-logging python-syslog python-argparse =
python-io \
> -                     python-fcntl python-shell python-lang python-xml py=
thon-math \
> -                     python-datetime python-netclient python sed"
> -
> -# Some installers will fail because of an install order based on
> -# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
> -# queued for install later.
> -RDEPENDS_${PN} +=3D "sed gawk grep"
> -
> -SRC_URI =3D "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
> -       file://openvswitch-switch \
> -       file://openvswitch-switch-setup \
> -       file://openvswitch-controller \
> -       file://openvswitch-controller-setup \
> -       file://openvswitch-add-target-python-handling.patch \
> -       file://openvswitch-add-target-perl-handling.patch \
> -       file://openvswitch-add-more-target-python-substitutions.patch \
> -       file://openvswitch-add-ptest.patch \
> -       file://run-ptest \
> -       "
> -
> -SRC_URI[md5sum] =3D "430ff6d1e1fc81e9c5ebc2e641cfc953"
> -SRC_URI[sha256sum] =3D "875429b052c4001815b6cb38616c7a6cb212df4bba746021=
64ee0a99b172079b"
> -
> -LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De03b0d9c4115c44518594e5618e65=
3f8"
> -
> -# Don't compile kernel modules by default since it heavily depends on
> -# kernel version. Use the in-kernel module for now.
> -# distro layers can enable with EXTRA_OECONF_pn_openvswitch +=3D ""
> -# EXTRA_OECONF =3D "--with-linux=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGE=
T_ARCH}"
> -
> -EXTRA_OECONF +=3D "TARGET_PYTHON=3D${bindir}/python \
> -                 TARGET_PERL=3D${bindir}/perl \
> -                "
> -
> -ALLOW_EMPTY_${PN}-pki =3D "1"
> -PACKAGES =3D+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
> -
> -FILES_${PN}-controller =3D "${sysconfdir}/init.d/openvswitch-controller =
\
> -       ${sysconfdir}/default/openvswitch-controller \
> -       ${sysconfdir}/openvswitch-controller \
> -       ${bindir}/ovs-controller"
> -
> -FILES_${PN}-brcompat =3D "${sbindir}/ovs-brcompatd"
> -
> -FILES_${PN}-switch =3D "${sysconfdir}/init.d/openvswitch-switch \
> -                  ${sysconfdir}/default/openvswitch-switch \
> -                  "
> -# silence a warning
> -FILES_${PN} +=3D "${datadir}/ovsdbmonitor"
> -FILES_${PN} +=3D "/run"
> -
> -inherit autotools update-rc.d ptest
> -
> -EXTRA_OEMAKE +=3D "TEST_DEST=3D${D}${PTEST_PATH} TEST_ROOT=3D${PTEST_PAT=
H}"
> -
> -do_install_ptest() {
> -       oe_runmake test-install
> -}
> -
> -INITSCRIPT_PACKAGES =3D "${PN}-switch ${PN}-controller"
> -INITSCRIPT_NAME_${PN}-switch =3D "openvswitch-switch"
> -INITSCRIPT_PARAMS_${PN}-switch =3D "defaults 71"
> -
> -INITSCRIPT_NAME_${PN}-controller =3D "openvswitch-controller"
> -INITSCRIPT_PARAMS_${PN}-controller =3D "defaults 72"
> -
> -do_install_append() {
> -       install -d ${D}/${sysconfdir}/default/
> -       install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconf=
dir}/default/openvswitch-switch
> -       install -d ${D}/${sysconfdir}/openvswitch-controller
> -       install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sys=
confdir}/default/openvswitch-controller
> -
> -       install -d ${D}/${sysconfdir}/init.d/
> -       install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdi=
r}/init.d/openvswitch-controller
> -       install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/i=
nit.d/openvswitch-switch
> -       true || rm -fr ${D}/${datadir}/${PN}/pki
> -}
> -
> -pkg_postinst_${PN}-pki () {
> -       # can't do this offline
> -       if [ "x$D" !=3D "x" ]; then
> -               exit 1
> -       fi
> -       if test ! -d $D/${datadir}/${PN}/pki; then
> -               ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> -       fi
> -}
> -
> -pkg_postinst_${PN}-controller () {
> -       # can't do this offline
> -       if [ "x$D" !=3D "x" ]; then
> -               exit 1
> -       fi
> -
> -       if test ! -d $D/${datadir}/${PN}/pki; then
> -               ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> -       fi
> -
> -       cd $D/${sysconfdir}/openvswitch-controller
> -       if ! test -e cacert.pem; then
> -               ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.=
pem
> -       fi
> -       if ! test -e privkey.pem || ! test -e cert.pem; then
> -               oldumask=3D$(umask)
> -               umask 077
> -               ovs-pki req+sign --dir=3D$D/${datadir}/${PN}/pki tmp cont=
roller >/dev/null
> -               mv tmp-privkey.pem privkey.pem
> -               mv tmp-cert.pem cert.pem
> -               mv tmp-req.pem req.pem
> -               chmod go+r cert.pem req.pem
> -               umask $oldumask
> -       fi
> -}
> diff --git a/recipes-networking/openvswitch/openvswitch_2.1.3.bb b/recipe=
s-networking/openvswitch/openvswitch_2.1.3.bb
> new file mode 100644
> index 0000000..c3a29aa
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
> @@ -0,0 +1,130 @@
> +SUMMARY =3D "OpenvSwitch"
> +DESCRIPTION =3D "Open vSwitch is a production quality, multilayer virtua=
l switch licensed under the open source Apache 2.0 license. It is designed =
to enable massive network automation through programmatic extension, while =
still supporting standard management interfaces and protocols (e.g. NetFlow=
, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
> +HOMEPAGE =3D "http://openvswitch.org/"
> +SECTION =3D "networking"
> +LICENSE =3D "Apache-2"
> +
> +DEPENDS +=3D "bridge-utils openssl python perl"
> +
> +RDEPENDS_${PN} +=3D "util-linux-uuidgen util-linux-libuuid coreutils \
> +              python perl perl-module-strict ${PN}-switch ${PN}-controll=
er"
> +RDEPENDS_${PN}-controller =3D "${PN} lsb ${PN}-pki"
> +RDEPENDS_${PN}-switch =3D "${PN} openssl procps util-linux-uuidgen"
> +RDEPENDS_${PN}-pki =3D "${PN}"
> +RDEPENDS_${PN}-brcompat =3D "${PN} ${PN}-switch"
> +RRECOMMENDS_${PN} +=3D "kernel-module-openvswitch"
> +
> +RDEPENDS_${PN}-ptest +=3D "python-logging python-syslog python-argparse =
python-io \
> +                     python-fcntl python-shell python-lang python-xml py=
thon-math \
> +                     python-datetime python-netclient python sed"
> +
> +# Some installers will fail because of an install order based on
> +# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
> +# queued for install later.
> +RDEPENDS_${PN} +=3D "sed gawk grep"
> +
> +SRC_URI =3D "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
> +       file://openvswitch-switch \
> +       file://openvswitch-switch-setup \
> +       file://openvswitch-controller \
> +       file://openvswitch-controller-setup \
> +       file://openvswitch-add-target-python-handling.patch \
> +       file://openvswitch-add-target-perl-handling.patch \
> +       file://openvswitch-add-more-target-python-substitutions.patch \
> +       file://openvswitch-add-ptest.patch \
> +       file://run-ptest \
> +       "
> +
> +SRC_URI[md5sum] =3D "d3c8a69df3d1b1a9eaef5a896576fd2a"
> +SRC_URI[sha256sum] =3D "43a2562fe5e8e48e997bfdb04691ffaaaefe73069b569965=
4538bf2f16ebfb1a"
> +
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De03b0d9c4115c44518594e5618e65=
3f8"
> +
> +# Don't compile kernel modules by default since it heavily depends on
> +# kernel version. Use the in-kernel module for now.
> +# distro layers can enable with EXTRA_OECONF_pn_openvswitch +=3D ""
> +# EXTRA_OECONF =3D "--with-linux=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGE=
T_ARCH}"
> +
> +EXTRA_OECONF +=3D "TARGET_PYTHON=3D${bindir}/python \
> +                 TARGET_PERL=3D${bindir}/perl \
> +                "
> +
> +ALLOW_EMPTY_${PN}-pki =3D "1"
> +PACKAGES =3D+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
> +
> +FILES_${PN}-controller =3D "${sysconfdir}/init.d/openvswitch-controller =
\
> +       ${sysconfdir}/default/openvswitch-controller \
> +       ${sysconfdir}/openvswitch-controller \
> +       ${bindir}/ovs-controller"
> +
> +FILES_${PN}-brcompat =3D "${sbindir}/ovs-brcompatd"
> +
> +FILES_${PN}-switch =3D "${sysconfdir}/init.d/openvswitch-switch \
> +                  ${sysconfdir}/default/openvswitch-switch \
> +                  "
> +# silence a warning
> +FILES_${PN} +=3D "${datadir}/ovsdbmonitor"
> +FILES_${PN} +=3D "/run"
> +
> +inherit autotools update-rc.d ptest
> +
> +EXTRA_OEMAKE +=3D "TEST_DEST=3D${D}${PTEST_PATH} TEST_ROOT=3D${PTEST_PAT=
H}"
> +
> +do_install_ptest() {
> +       oe_runmake test-install
> +}
> +
> +INITSCRIPT_PACKAGES =3D "${PN}-switch ${PN}-controller"
> +INITSCRIPT_NAME_${PN}-switch =3D "openvswitch-switch"
> +INITSCRIPT_PARAMS_${PN}-switch =3D "defaults 71"
> +
> +INITSCRIPT_NAME_${PN}-controller =3D "openvswitch-controller"
> +INITSCRIPT_PARAMS_${PN}-controller =3D "defaults 72"
> +
> +do_install_append() {
> +       install -d ${D}/${sysconfdir}/default/
> +       install -m 660 ${WORKDIR}/openvswitch-switch-setup ${D}/${sysconf=
dir}/default/openvswitch-switch
> +       install -d ${D}/${sysconfdir}/openvswitch-controller
> +       install -m 660 ${WORKDIR}/openvswitch-controller-setup ${D}/${sys=
confdir}/default/openvswitch-controller
> +
> +       install -d ${D}/${sysconfdir}/init.d/
> +       install -m 755 ${WORKDIR}/openvswitch-controller ${D}/${sysconfdi=
r}/init.d/openvswitch-controller
> +       install -m 755 ${WORKDIR}/openvswitch-switch ${D}/${sysconfdir}/i=
nit.d/openvswitch-switch
> +       true || rm -fr ${D}/${datadir}/${PN}/pki
> +}
> +
> +pkg_postinst_${PN}-pki () {
> +       # can't do this offline
> +       if [ "x$D" !=3D "x" ]; then
> +               exit 1
> +       fi
> +       if test ! -d $D/${datadir}/${PN}/pki; then
> +               ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> +       fi
> +}
> +
> +pkg_postinst_${PN}-controller () {
> +       # can't do this offline
> +       if [ "x$D" !=3D "x" ]; then
> +               exit 1
> +       fi
> +
> +       if test ! -d $D/${datadir}/${PN}/pki; then
> +               ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> +       fi
> +
> +       cd $D/${sysconfdir}/openvswitch-controller
> +       if ! test -e cacert.pem; then
> +               ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.=
pem
> +       fi
> +       if ! test -e privkey.pem || ! test -e cert.pem; then
> +               oldumask=3D$(umask)
> +               umask 077
> +               ovs-pki req+sign --dir=3D$D/${datadir}/${PN}/pki tmp cont=
roller >/dev/null
> +               mv tmp-privkey.pem privkey.pem
> +               mv tmp-cert.pem cert.pem
> +               mv tmp-req.pem req.pem
> +               chmod go+r cert.pem req.pem
> +               umask $oldumask
> +       fi
> +}
> --
> 1.8.3.2
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

