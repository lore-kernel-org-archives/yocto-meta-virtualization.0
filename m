Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B2128E0076F; Tue,  3 Feb 2015 10:47:58 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4CB74E005B4
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Feb 2015 10:47:53 -0800 (PST)
Received: by mail-lb0-f176.google.com with SMTP id z12so40266370lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Feb 2015 10:47:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=0mKz/SWS4Y4XUOt4BYGU5LHcm3fHJcioQNMeZZj0dl8=;
	b=qdSPcqYLBcEzWSAOI/qra4KPBexTtuU3w2424DOcDUWOKEMqHy8DVFAIuX4j7htQm2
	trc2Fi6Va5QYCF61+ckDZBITh2kUdPLawHiW9H2iDPu/eE0TUOb0IqTALmN6egi6Mzr1
	7GdcMACkP7CkdvEO1HvmXZlFMe+E2xkRJmJi8YvERyxwP1XbtfdtfFDATJMXFejSygm4
	6M08UmkFkUnvHiQWGAqJRHIIItJieMVC1leVO8FlKwtHkOIFNp9Ft2uP0rJWQPlYY4pR
	wcEY3G4B6/5IzWMgdkd12kcmdZILrij4juzXnvuL+Mj5VDCbfZuVbRtuS09jHq0DmWdl
	NFfw==
MIME-Version: 1.0
X-Received: by 10.152.2.41 with SMTP id 9mr5803257lar.59.1422989271641; Tue,
	03 Feb 2015 10:47:51 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Tue, 3 Feb 2015 10:47:51 -0800 (PST)
In-Reply-To: <20150130173621.GB9299@windriver.com>
References: <20150130173537.GA9113@windriver.com>
	<20150130173621.GB9299@windriver.com>
Date: Tue, 3 Feb 2015 13:47:51 -0500
Message-ID: <CADkTA4PGfphe6rCHBPzTTwq4P4vRf0OJfx8a_DOBhBrVyKWWkQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] openvswitch restructure recipes
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
X-List-Received-Date: Tue, 03 Feb 2015 18:47:58 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2015 at 12:36 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From fba310bc395a45747d5f40daf6784ea52820ffe0 Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Thu, 29 Jan 2015 13:28:08 -0500
> Subject: [PATCH 2/2] openvswitch restructure recipes
>
> Add openvswitch.inc, removing common parts out of openvswitch*.bb
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
>
> cleanup
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>

I fixed up the commit message, looks like your squash didn't quite get
the properly
consolidated commit.

Other than that, no one has complained, so I've gone ahead and merged
the changes.

Cheers,

Bruce

> ---
>  recipes-networking/openvswitch/openvswitch.inc     | 127 +++++++++++++++=
++++++
>  .../openvswitch/openvswitch_1.10.0.bb              | 110 +--------------=
---
>  .../openvswitch/openvswitch_2.1.3.bb               | 119 ++-------------=
----
>  recipes-networking/openvswitch/openvswitch_git.bb  | 115 ++-------------=
----
>  4 files changed, 151 insertions(+), 320 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/openvswitch.inc
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-net=
working/openvswitch/openvswitch.inc
> new file mode 100644
> index 0000000..ed97920
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -0,0 +1,127 @@
> +SUMMARY =3D "OpenvSwitch"
> +DESCRIPTION =3D "\
> +       Open vSwitch is a production quality, multilayer virtual switch \
> +       licensed under the open source Apache 2.0 license. It is designed=
 \
> +       to enable massive network automation through programmatic extensi=
on, \
> +       while still supporting standard management interfaces and protoco=
ls \
> +       (e.g. NetFlow, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag) \
> +       "
> +
> +HOMEPAGE =3D "http://openvswitch.org/"
> +SECTION =3D "networking"
> +LICENSE =3D "Apache-2"
> +
> +DEPENDS +=3D "bridge-utils openssl python perl"
> +
> +RDEPENDS_${PN} +=3D "util-linux-uuidgen util-linux-libuuid coreutils \
> +       python perl perl-module-strict ${PN}-switch ${PN}-controller"
> +RDEPENDS_${PN}-controller =3D "${PN} lsb ${PN}-pki"
> +RDEPENDS_${PN}-switch =3D "${PN} openssl procps util-linux-uuidgen"
> +RDEPENDS_${PN}-pki =3D "${PN}"
> +RDEPENDS_${PN}-brcompat =3D "${PN} ${PN}-switch"
> +
> +# Some installers will fail because of an install order based on
> +# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
> +# queued for install later.
> +RDEPENDS_${PN} +=3D "sed gawk grep"
> +
> +SRC_URI =3D "\
> +       file://openvswitch-switch \
> +       file://openvswitch-switch-setup \
> +       file://openvswitch-controller \
> +       file://openvswitch-controller-setup \
> +       file://openvswitch-add-target-python-handling.patch \
> +       file://openvswitch-add-target-perl-handling.patch \
> +       "
> +
> +EXTRA_OECONF +=3D "\
> +       TARGET_PYTHON=3D${bindir}/python \
> +       TARGET_PERL=3D${bindir}/perl \
> +       "
> +
> +# Don't compile kernel modules by default since it heavily depends on
> +# kernel version. Use the in-kernel module for now.
> +# distro layers can enable with EXTRA_OECONF_pn_openvswitch +=3D ""
> +# EXTRA_OECONF =3D "--with-linux=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGE=
T_ARCH}"
> +
> +ALLOW_EMPTY_${PN}-pki =3D "1"
> +PACKAGES =3D+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
> +
> +FILES_${PN}-controller =3D "\
> +       ${sysconfdir}/init.d/openvswitch-controller \
> +       ${sysconfdir}/default/openvswitch-controller \
> +       ${sysconfdir}/openvswitch-controller \
> +       ${bindir}/ovs-controller \
> +       "
> +
> +FILES_${PN}-brcompat =3D "${sbindir}/ovs-brcompatd"
> +
> +FILES_${PN}-switch =3D "\
> +       ${sysconfdir}/init.d/openvswitch-switch \
> +       ${sysconfdir}/default/openvswitch-switch \
> +       "
> +
> +# silence a warning
> +FILES_${PN} +=3D "${datadir}/ovsdbmonitor"
> +FILES_${PN} +=3D "/run"
> +
> +inherit autotools update-rc.d
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
> +
> +       install -d ${D}/${sysconfdir}/init.d/
> +
> +       oe_runmake modules_install INSTALL_MOD_PATH=3D${D}
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
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recip=
es-networking/openvswitch/openvswitch_1.10.0.bb
> index 42d4bc4..85b2709 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -1,32 +1,11 @@
> -SUMMARY =3D "OpenvSwitch"
> -DESCRIPTION =3D "Open vSwitch is a production quality, multilayer virtua=
l switch licensed under the open source Apache 2.0 license. It is designed =
to enable massive network automation through programmatic extension, while =
still supporting standard management interfaces and protocols (e.g. NetFlow=
, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
> -HOMEPAGE =3D "http://openvswitch.org/"
> -SECTION =3D "networking"
> -LICENSE =3D "Apache-2"
> +require openvswitch.inc
>
> -DEPENDS +=3D "bridge-utils openssl python perl"
> -
> -RDEPENDS_${PN} +=3D "util-linux-uuidgen util-linux-libuuid coreutils \
> -              python perl perl-module-strict ${PN}-switch ${PN}-controll=
er"
> -RDEPENDS_${PN}-controller =3D "${PN} lsb ${PN}-pki"
> -RDEPENDS_${PN}-switch =3D "${PN} openssl procps util-linux-uuidgen"
> -RDEPENDS_${PN}-pki =3D "${PN}"
> -RDEPENDS_${PN}-brcompat =3D "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} +=3D "kernel-module-openvswitch"
>
> -# Some installers will fail because of an install order based on
> -# rdeps.  E.g. ovs-pki calls sed in the postinstall.  sed may be
> -# queued for install later.
> -RDEPENDS_${PN} +=3D "sed gawk grep"
>  PR =3D "r4"
>
> -SRC_URI =3D "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
> -       file://openvswitch-switch \
> -       file://openvswitch-switch-setup \
> -       file://openvswitch-controller \
> -       file://openvswitch-controller-setup \
> -       file://openvswitch-add-target-python-handling.patch \
> -       file://openvswitch-add-target-perl-handling.patch \
> +SRC_URI +=3D "\
> +       http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://configure-Only-link-against-libpcap-on-FreeBSD.patch \
>         "
>
> @@ -34,85 +13,4 @@ SRC_URI[md5sum] =3D "fe8b49efe9f86b57abab00166b971106"
>  SRC_URI[sha256sum] =3D "803966c89d6a5de6d710a2cb4ed73ac8d8111a2c44b12b84=
6dcef8e91ffab167"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D49eeb5acb1f5e510f12c44f176c42=
253"
>
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
> -inherit autotools update-rc.d pkgconfig
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
> -        if [ "x$D" !=3D "x" ]; then
> -                exit 1
> -        fi
> -       if test ! -d $D/${datadir}/${PN}/pki; then
> -            ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> -        fi
> -}
> -
> -pkg_postinst_${PN}-controller () {
> -        # can't do this offline
> -        if [ "x$D" !=3D "x" ]; then
> -                exit 1
> -        fi
> -
> -    if test ! -d $D/${datadir}/${PN}/pki; then
> -        ovs-pki init --dir=3D$D/${datadir}/${PN}/pki
> -    fi
> -
> -       cd $D/${sysconfdir}/openvswitch-controller
> -        if ! test -e cacert.pem; then
> -            ln -s $D/${datadir}/${PN}/pki/switchca/cacert.pem cacert.pem
> -        fi
> -        if ! test -e privkey.pem || ! test -e cert.pem; then
> -            oldumask=3D$(umask)
> -            umask 077
> -            ovs-pki req+sign --dir=3D$D/${datadir}/${PN}/pki tmp control=
ler >/dev/null
> -            mv tmp-privkey.pem privkey.pem
> -            mv tmp-cert.pem cert.pem
> -            mv tmp-req.pem req.pem
> -            chmod go+r cert.pem req.pem
> -            umask $oldumask
> -        fi
> -}
> +inherit pkgconfig
> diff --git a/recipes-networking/openvswitch/openvswitch_2.1.3.bb b/recipe=
s-networking/openvswitch/openvswitch_2.1.3.bb
> index c3a29aa..dc6c7e3 100644
> --- a/recipes-networking/openvswitch/openvswitch_2.1.3.bb
> +++ b/recipes-networking/openvswitch/openvswitch_2.1.3.bb
> @@ -1,35 +1,15 @@
> -SUMMARY =3D "OpenvSwitch"
> -DESCRIPTION =3D "Open vSwitch is a production quality, multilayer virtua=
l switch licensed under the open source Apache 2.0 license. It is designed =
to enable massive network automation through programmatic extension, while =
still supporting standard management interfaces and protocols (e.g. NetFlow=
, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
> -HOMEPAGE =3D "http://openvswitch.org/"
> -SECTION =3D "networking"
> -LICENSE =3D "Apache-2"
> +require openvswitch.inc
>
> -DEPENDS +=3D "bridge-utils openssl python perl"
> -
> -RDEPENDS_${PN} +=3D "util-linux-uuidgen util-linux-libuuid coreutils \
> -              python perl perl-module-strict ${PN}-switch ${PN}-controll=
er"
> -RDEPENDS_${PN}-controller =3D "${PN} lsb ${PN}-pki"
> -RDEPENDS_${PN}-switch =3D "${PN} openssl procps util-linux-uuidgen"
> -RDEPENDS_${PN}-pki =3D "${PN}"
> -RDEPENDS_${PN}-brcompat =3D "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} +=3D "kernel-module-openvswitch"
>
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
> +RDEPENDS_${PN}-ptest +=3D "\
> +       python-logging python-syslog python-argparse python-io \
> +       python-fcntl python-shell python-lang python-xml python-math \
> +       python-datetime python-netclient python sed \
> +       "
>
> -SRC_URI =3D "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
> -       file://openvswitch-switch \
> -       file://openvswitch-switch-setup \
> -       file://openvswitch-controller \
> -       file://openvswitch-controller-setup \
> -       file://openvswitch-add-target-python-handling.patch \
> -       file://openvswitch-add-target-perl-handling.patch \
> +SRC_URI +=3D "\
> +       http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-add-more-target-python-substitutions.patch \
>         file://openvswitch-add-ptest.patch \
>         file://run-ptest \
> @@ -40,91 +20,10 @@ SRC_URI[sha256sum] =3D "43a2562fe5e8e48e997bfdb04691f=
faaaefe73069b5699654538bf2f16
>
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3De03b0d9c4115c44518594e5618e65=
3f8"
>
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
> +inherit ptest
>
>  EXTRA_OEMAKE +=3D "TEST_DEST=3D${D}${PTEST_PATH} TEST_ROOT=3D${PTEST_PAT=
H}"
>
>  do_install_ptest() {
>         oe_runmake test-install
>  }
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
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-=
networking/openvswitch/openvswitch_git.bb
> index 17bebae..5580915 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -1,27 +1,12 @@
> -SUMMARY =3D "OpenvSwitch"
> -DESCRIPTION =3D "Open vSwitch is a production quality, multilayer virtua=
l switch licensed under the open source Apache 2.0 license. It is designed =
to enable massive network automation through programmatic extension, while =
still supporting standard management interfaces and protocols (e.g. NetFlow=
, sFlow, SPAN, RSPAN, CLI, LACP, 802.1ag)"
> -HOMEPAGE =3D "http://openvswitch.org/"
> -SECTION =3D "networking"
> -LICENSE =3D "Apache-2 & GPLv2 & PSF"
> +require openvswitch.inc
>
> -DEPENDS +=3D "bridge-utils openssl python perl virtual/kernel"
> +DEPENDS +=3D "virtual/kernel"
>
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
> +RDEPENDS_${PN}-ptest +=3D "\
> +       python-logging python-syslog python-argparse python-io \
> +       python-fcntl python-shell python-lang python-xml python-math \
> +       python-datetime python-netclient python sed \
> +       "
>
>  S =3D "${WORKDIR}/git"
>  PV =3D "2.3.90+${SRCREV}"
> @@ -29,12 +14,8 @@ PV =3D "2.3.90+${SRCREV}"
>  FILESEXTRAPATHS_append :=3D "${THISDIR}/${PN}-git:"
>
>  SRCREV =3D "1667bb34988358aaf1c92d0d21fad4b1c8698780"
> -SRC_URI =3D "git://github.com/openvswitch/ovs.git;protocol=3Dgit \
> -       file://openvswitch-switch \
> -       file://openvswitch-switch-setup \
> -       file://openvswitch-controller \
> -       file://openvswitch-controller-setup \
> -       file://openvswitch-add-target-python-handling.patch \
> +SRC_URI +=3D "\
> +       git://github.com/openvswitch/ovs.git;protocol=3Dgit \
>         file://openvswitch-add-more-target-python-substitutions.patch \
>         file://openvswitch-add-ptest-${SRCREV}.patch \
>         file://run-ptest \
> @@ -51,31 +32,12 @@ PACKAGECONFIG[dpdk] =3D "--with-dpdk=3D${STAGING_DIR_=
TARGET}/opt/dpdk/${TARGET_ARCH}
>  # Don't compile kernel modules by default since it heavily depends on
>  # kernel version. Use the in-kernel module for now.
>  # distro layers can enable with EXTRA_OECONF_pn_openvswitch +=3D ""
> -EXTRA_OECONF =3D "--with-linux=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGET_=
ARCH}"
> -
> -EXTRA_OECONF +=3D "TARGET_PYTHON=3D${bindir}/python \
> -                 TARGET_PERL=3D${bindir}/perl \
> -                "
> -
> -ALLOW_EMPTY_${PN}-pki =3D "1"
> -PACKAGES =3D+ "${PN}-controller ${PN}-switch ${PN}-brcompat ${PN}-pki"
> +EXTRA_OECONF +=3D "--with-linux=3D${STAGING_KERNEL_DIR} KARCH=3D${TARGET=
_ARCH}"
>
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
>  # silence a warning
> -FILES_${PN} +=3D "${datadir}/ovsdbmonitor"
> -FILES_${PN} +=3D "/run"
>  FILES_${PN} +=3D "/lib/modules"
>
> -inherit autotools update-rc.d ptest
> +inherit ptest
>
>  EXTRA_OEMAKE +=3D "TEST_DEST=3D${D}${PTEST_PATH} TEST_ROOT=3D${PTEST_PAT=
H}"
>
> @@ -83,61 +45,6 @@ do_install_ptest() {
>         oe_runmake test-install
>  }
>
> -INITSCRIPT_PACKAGES =3D "${PN}-switch ${PN}-controller"
> -INITSCRIPT_NAME_${PN}-switch =3D "openvswitch-switch"
> -INITSCRIPT_PARAMS_${PN}-switch =3D "defaults 71"
> -
> -INITSCRIPT_NAME_${PN}-controller =3D "openvswitch-controller"
> -INITSCRIPT_PARAMS_${PN}-controller =3D "defaults 72"
> -
>  do_install_append() {
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
> -
> -       install -d ${D}/${sysconfdir}/init.d/
> -
>         oe_runmake modules_install INSTALL_MOD_PATH=3D${D}
>  }
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
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

