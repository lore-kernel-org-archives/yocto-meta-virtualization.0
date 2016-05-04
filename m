Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E19AE00984; Tue,  3 May 2016 19:22:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f44.google.com (mail-oi0-f44.google.com
	[209.85.218.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 463F6E00951
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 May 2016 19:22:23 -0700 (PDT)
Received: by mail-oi0-f44.google.com with SMTP id x201so49571598oif.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 May 2016 19:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=IWj9cL91V6KaRKS1zCarcD24sP1qLqs7A5t13wmA4+s=;
	b=t5n10YglR9kOytjVYINh4FaxhL2qyHk28In+Ed6AMC46zpD4614RV07IpWz9JdvhsI
	M6B/vTcHvX6KrklxBxbhfJfCQEzmwixJziABwF8n48wL+s0p0j6FvtQfeKSQanZ1D2vA
	FIwIFYUW1kn5blDiFGuLQKLNxj+wPgskX72WisQJ6A8PyOMI/WQrEcQYRs6g+zlC2nzT
	T3oWsezJxsp2hGNzoKLd3GI+j469gSOOB9XCRSD+4ecIVWsgWfayhPSzRR3/q27vWHRb
	tyYcBchw0fN/yV0oh7SFFI4MEHN8OiPBSBy0yEqbRIIrJF+MUwhDtPXJCpmHyguWWkXU
	X7SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=IWj9cL91V6KaRKS1zCarcD24sP1qLqs7A5t13wmA4+s=;
	b=IAC2q1Q+/8atPmOhanucqWyBb6xr5S7ZTdbGq9BQuKTW2wiWTo0NjkyxTW2NC+O9ou
	4AuOiEKSpzuR7uslEEY1XAkjsMZFIPEicRR41vu1e6bAgbUBCI87E9XfkBsym6ZuzN5W
	M0Ue6t2S3RpwYWMkruLipkoo0zstgCn5auRQpHAdvUX8cTU5zBTIkQaVMJ0JtE2+P/Rt
	lbLR3a7K1VA3S7cqgQc5jjrSpFNRGksN2cglH/txK10zY9xcIHQpcgaVIM/FXcyG9yiQ
	D98JmifZ4GV3g9pW0AiNo2pe7cfS8DiLvJjtKGwzOhvaxZHVPUKH0VskvHtcVl8QDmpa
	KZzg==
X-Gm-Message-State: AOPr4FW5iW7e0ofCdBvc99r1eXCX9FGj+TERNPgqbXe4GFzwcJ+8E0EEia9ASa5GD3FLCRcmtrLsI9sxgku5Dw==
MIME-Version: 1.0
X-Received: by 10.157.37.45 with SMTP id k42mr3069965otb.119.1462328542647;
	Tue, 03 May 2016 19:22:22 -0700 (PDT)
Received: by 10.157.32.135 with HTTP; Tue, 3 May 2016 19:22:22 -0700 (PDT)
In-Reply-To: <1462112865-19058-1-git-send-email-derek@asterius.io>
References: <1462112865-19058-1-git-send-email-derek@asterius.io>
Date: Tue, 3 May 2016 22:22:22 -0400
Message-ID: <CADkTA4MNe0K+Adc06-rT=2DKYem423YpC29bmxEQdoVsiA7vZQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] globally replace 'base_contains' calls with 'bb.utils.contains'
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
X-List-Received-Date: Wed, 04 May 2016 02:22:28 -0000
Content-Type: multipart/alternative; boundary=001a11352e46545da20531fae56e

--001a11352e46545da20531fae56e
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Sun, May 1, 2016 at 10:27 AM, Derek Straka <derek@asterius.io> wrote:

> The 'base_contains' is now deprecated and only kept as a compatibility
> method.  It will be removed in future releases.
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-containers/docker-registry/docker-registry_git.bb |  6 +++---
>  recipes-containers/docker/docker_git.bb                   | 10 +++++-----
>  recipes-containers/lxc/lxc_2.0.0.bb                       |  6 +++---
>  recipes-extended/images/xen-guest-image-minimal.bb        |  4 ++--
>  recipes-extended/libvirt/libvirt_1.3.2.bb                 |  8 ++++----
>  recipes-kernel/linux/linux-yocto_4.1.bbappend             |  4 ++--
>  recipes-kernel/linux/linux-yocto_4.4.bbappend             |  4 ++--
>  7 files changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/recipes-containers/docker-registry/docker-registry_git.bb
> b/recipes-containers/docker-registry/docker-registry_git.bb
> index 3d8d74b..996dfdd 100644
> --- a/recipes-containers/docker-registry/docker-registry_git.bb
> +++ b/recipes-containers/docker-registry/docker-registry_git.bb
> @@ -73,14 +73,14 @@ RDEPENDS_${PN} += "\
>
>  inherit setuptools systemd
>
> -SYSTEMD_PACKAGES =
> "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> -SYSTEMD_SERVICE_${PN} =
> "${@base_contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
> +SYSTEMD_PACKAGES =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> +SYSTEMD_SERVICE_${PN} =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker-registry.service','',d)}"
>
>  do_install_append() {
>         mkdir -p ${D}/etc/default/
>         cp ${WORKDIR}/docker-registry.conf ${D}/etc/default/docker-registry
>
> -       if
> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +       if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>                 install -d ${D}${systemd_unitdir}/system
>                 install -m 644 ${WORKDIR}/docker-registry.service
> ${D}/${systemd_unitdir}/system
>                 sed -i
> "s|#WORKDIR#|${PYTHON_SITEPACKAGES_DIR}/docker_registry|"
> ${D}/${systemd_unitdir}/system/docker-registry.service
> diff --git a/recipes-containers/docker/docker_git.bb
> b/recipes-containers/docker/docker_git.bb
> index 19fdef0..c2681a2 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -101,11 +101,11 @@ do_compile() {
>
>  inherit systemd update-rc.d
>
> -SYSTEMD_PACKAGES =
> "${@base_contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> -SYSTEMD_SERVICE_${PN} =
> "${@base_contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
> +SYSTEMD_PACKAGES =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','${PN}','',d)}"
> +SYSTEMD_SERVICE_${PN} =
> "${@bb.utils.contains('DISTRO_FEATURES','systemd','docker.service','',d)}"
>
> -INITSCRIPT_PACKAGES +=
> "${@base_contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
> -INITSCRIPT_NAME_${PN} =
> "${@base_contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
> +INITSCRIPT_PACKAGES +=
> "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','${PN}','',d)}"
> +INITSCRIPT_NAME_${PN} =
> "${@bb.utils.contains('DISTRO_FEATURES','sysvinit','docker.init','',d)}"
>  INITSCRIPT_PARAMS_${PN} = "${OS_DEFAULT_INITSCRIPT_PARAMS}"
>
>  do_install() {
> @@ -115,7 +115,7 @@ do_install() {
>         cp
> ${S}/bundles/${DOCKER_VERSION}/dynbinary/dockerinit-${DOCKER_VERSION} \
>           ${D}/${bindir}/dockerinit
>
> -       if
> ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> +       if
> ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
>                 install -d ${D}${systemd_unitdir}/system
>                 install -m 644 ${S}/contrib/init/systemd/docker.*
> ${D}/${systemd_unitdir}/system
>                 # replaces one copied from above with one that uses the
> local registry for a mirror
> diff --git a/recipes-containers/lxc/lxc_2.0.0.bb b/recipes-containers/lxc/
> lxc_2.0.0.bb
> index 34aab38..9f01edd 100644
> --- a/recipes-containers/lxc/lxc_2.0.0.bb
> +++ b/recipes-containers/lxc/lxc_2.0.0.bb
> @@ -38,7 +38,7 @@ S = "${WORKDIR}/${BPN}-${PV}"
>
>  # Let's not configure for the host distro.
>  #
> -PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest',
> '--enable-tests', '', d)}"
> +PTEST_CONF = "${@bb.utils.contains('DISTRO_FEATURES', 'ptest',
> '--enable-tests', '', d)}"
>  EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>
>  EXTRA_OECONF += "--with-init-script=\
> @@ -48,7 +48,7 @@ ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> 'systemd', '', d)}"
>  EXTRA_OECONF += "--enable-log-src-basename"
>
>  PACKAGECONFIG ??= "templates \
> -    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}
> \
>  "
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc
> --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
> @@ -109,7 +109,7 @@ do_install_append() {
>         for i in `grep -l "#! */bin/bash" ${D}${datadir}/lxc/hooks/*`; do \
>             sed -e 's|#! */bin/bash|#!/bin/sh|' -i $i; done
>
> -       if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
> +       if ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', 'true',
> 'false', d)}; then
>             install -d ${D}${sysconfdir}/init.d
>             install -m 755 config/init/sysvinit/lxc*
> ${D}${sysconfdir}/init.d
>         fi
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
> b/recipes-extended/images/xen-guest-image-minimal.bb
> index f13940c..ab7e92c 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -7,8 +7,8 @@ IMAGE_INSTALL += " \
>      ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
> 'kernel-module-xen-acpi-processor', '', d)} \
>      "
>
> -IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> -IMAGE_INSTALL += "${@base_contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
> +IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> +IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
>
>  LICENSE = "MIT"
>
> diff --git a/recipes-extended/libvirt/libvirt_1.3.2.bb
> b/recipes-extended/libvirt/libvirt_1.3.2.bb
> index 42066c1..be21910 100644
> --- a/recipes-extended/libvirt/libvirt_1.3.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.3.2.bb
> @@ -107,7 +107,7 @@ FILES_${PN}-libvirtd = " \
>          /usr/lib/sysctl.d/60-libvirtd.conf \
>         ${sbindir}/libvirtd \
>         ${systemd_unitdir}/system/* \
> -       ${@base_contains('DISTRO_FEATURES', 'sysvinit', '',
> '${libexecdir}/libvirt-guests.sh', d)} \
> +       ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '',
> '${libexecdir}/libvirt-guests.sh', d)} \
>          "
>
>  FILES_${PN}-virsh = "${bindir}/virsh"
> @@ -167,9 +167,9 @@ PRIVATE_LIBS_${PN}-ptest = " \
>  # full config
>  PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test
> \
>                     remote macvtap libvirtd netcf udev python ebtables \
> -                   ${@base_contains('DISTRO_FEATURES', 'selinux',
> 'selinux audit libcap-ng', '', d)} \
> -                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl
> xen-inotify', '', d)} \
> -                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit',
> '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
> 'selinux audit libcap-ng', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'xen
> libxl xen-inotify', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11',
> 'polkit', '', d)} \
>                    "
>
>  # enable,disable,depends,rdepends
> diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> index 85e98cc..f3be89e 100644
> --- a/recipes-kernel/linux/linux-yocto_4.1.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend
> @@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD += "kvm-amd"
>  KERNEL_MODULE_AUTOLOAD += "kvm-intel"
>
>  # aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', '
> features/aufs/aufs-enable.scc', '', d)}"
> +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>
>  # xen kernel support
> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc',
> '', d)}"
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> index 85e98cc..f3be89e 100644
> --- a/recipes-kernel/linux/linux-yocto_4.4.bbappend
> +++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend
> @@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD += "kvm-amd"
>  KERNEL_MODULE_AUTOLOAD += "kvm-intel"
>
>  # aufs kernel support required for xen-image-minimal
> -KERNEL_FEATURES_append += "${@base_contains('DISTRO_FEATURES', 'aufs', '
> features/aufs/aufs-enable.scc', '', d)}"
> +KERNEL_FEATURES_append += "${@bb.utils.contains('DISTRO_FEATURES',
> 'aufs', ' features/aufs/aufs-enable.scc', '', d)}"
>
>  # xen kernel support
> -SRC_URI += "${@base_contains('DISTRO_FEATURES', 'xen', ' file://xen.scc',
> '', d)}"
> +SRC_URI += "${@bb.utils.contains('DISTRO_FEATURES', 'xen', '
> file://xen.scc', '', d)}"
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11352e46545da20531fae56e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Sun, May 1, 2016 at 10:27 AM=
, Derek Straka <span dir=3D"ltr">&lt;<a href=3D"mailto:derek@asterius.io" t=
arget=3D"_blank">derek@asterius.io</a>&gt;</span> wrote:<br><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pa=
dding-left:1ex">The &#39;base_contains&#39; is now deprecated and only kept=
 as a compatibility method.=C2=A0 It will be removed in future releases.<br=
>
<br>
Signed-off-by: Derek Straka &lt;<a href=3D"mailto:derek@asterius.io">derek@=
asterius.io</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a> |=
=C2=A0 6 +++---<br>
=C2=A0recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 6 +++---<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-guest-image-minimal.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 4 ++--<br>
=C2=A0recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 8 ++++----<br>
=C2=A0recipes-kernel/linux/linux-yocto_4.1.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0recipes-kernel/linux/linux-yocto_4.4.bbappend=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A07 files changed, 21 insertions(+), 21 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-registry/<a href=3D"http://docker-re=
gistry_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb<=
/a> b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
index 3d8d74b..996dfdd 100644<br>
--- a/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
+++ b/recipes-containers/docker-registry/<a href=3D"http://docker-registry_=
git.bb" rel=3D"noreferrer" target=3D"_blank">docker-registry_git.bb</a><br>
@@ -73,14 +73,14 @@ RDEPENDS_${PN} +=3D &quot;\<br>
<br>
=C2=A0inherit setuptools systemd<br>
<br>
-SYSTEMD_PACKAGES =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;,&#39=
;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
-SYSTEMD_SERVICE_${PN} =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;=
,&#39;systemd&#39;,&#39;docker-registry.service&#39;,&#39;&#39;,d)}&quot;<b=
r>
+SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
&#39;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;,&#39;systemd&#39;,&#39;docker-registry.service&#39;,&#39;&#39;,d)}&quo=
t;<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/etc/default/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${WORKDIR}/docker-registry.conf ${D}/etc/def=
ault/docker-registry<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@base_contains(&#39;DISTRO_FEATURES&#39;,&=
#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
stemd_unitdir}/system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${WO=
RKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i &quot;s|#WOR=
KDIR#|${PYTHON_SITEPACKAGES_DIR}/docker_registry|&quot; ${D}/${systemd_unit=
dir}/system/docker-registry.service<br>
diff --git a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=
=3D"noreferrer" target=3D"_blank">docker_git.bb</a> b/recipes-containers/do=
cker/<a href=3D"http://docker_git.bb" rel=3D"noreferrer" target=3D"_blank">=
docker_git.bb</a><br>
index 19fdef0..c2681a2 100644<br>
--- a/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a><br>
+++ b/recipes-containers/docker/<a href=3D"http://docker_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">docker_git.bb</a><br>
@@ -101,11 +101,11 @@ do_compile() {<br>
<br>
=C2=A0inherit systemd update-rc.d<br>
<br>
-SYSTEMD_PACKAGES =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;,&#39=
;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
-SYSTEMD_SERVICE_${PN} =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;=
,&#39;systemd&#39;,&#39;docker.service&#39;,&#39;&#39;,d)}&quot;<br>
+SYSTEMD_PACKAGES =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
&#39;systemd&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
+SYSTEMD_SERVICE_${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;,&#39;systemd&#39;,&#39;docker.service&#39;,&#39;&#39;,d)}&quot;<br>
<br>
-INITSCRIPT_PACKAGES +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;,=
&#39;sysvinit&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
-INITSCRIPT_NAME_${PN} =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;=
,&#39;sysvinit&#39;,&#39;docker.init&#39;,&#39;&#39;,d)}&quot;<br>
+INITSCRIPT_PACKAGES +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#=
39;,&#39;sysvinit&#39;,&#39;${PN}&#39;,&#39;&#39;,d)}&quot;<br>
+INITSCRIPT_NAME_${PN} =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&=
#39;,&#39;sysvinit&#39;,&#39;docker.init&#39;,&#39;&#39;,d)}&quot;<br>
=C2=A0INITSCRIPT_PARAMS_${PN} =3D &quot;${OS_DEFAULT_INITSCRIPT_PARAMS}&quo=
t;<br>
<br>
=C2=A0do_install() {<br>
@@ -115,7 +115,7 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp ${S}/bundles/${DOCKER_VERSION}/dynbinary/doc=
kerinit-${DOCKER_VERSION} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/${bindir}/dockerinit<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@base_contains(&#39;DISTRO_FEATURES&#39;,&=
#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;,&#39;systemd&#39;,&#39;true&#39;,&#39;false&#39;,d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sy=
stemd_unitdir}/system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}=
/contrib/init/systemd/docker.* ${D}/${systemd_unitdir}/system<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # replaces one copi=
ed from above with one that uses the local registry for a mirror<br>
diff --git a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"=
noreferrer" target=3D"_blank">lxc_2.0.0.bb</a> b/recipes-containers/lxc/<a =
href=3D"http://lxc_2.0.0.bb" rel=3D"noreferrer" target=3D"_blank">lxc_2.0.0=
.bb</a><br>
index 34aab38..9f01edd 100644<br>
--- a/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a><br>
+++ b/recipes-containers/lxc/<a href=3D"http://lxc_2.0.0.bb" rel=3D"norefer=
rer" target=3D"_blank">lxc_2.0.0.bb</a><br>
@@ -38,7 +38,7 @@ S =3D &quot;${WORKDIR}/${BPN}-${PV}&quot;<br>
<br>
=C2=A0# Let&#39;s not configure for the host distro.<br>
=C2=A0#<br>
-PTEST_CONF =3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;ptes=
t&#39;, &#39;--enable-tests&#39;, &#39;&#39;, d)}&quot;<br>
+PTEST_CONF =3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;=
ptest&#39;, &#39;--enable-tests&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-distro=3D${DISTRO} ${PTEST_CONF}&quot;=
<br>
<br>
=C2=A0EXTRA_OECONF +=3D &quot;--with-init-script=3D\<br>
@@ -48,7 +48,7 @@ ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;syst=
emd&#39;, &#39;systemd&#39;, &#39;&#39;, d)}&quot;<br>
=C2=A0EXTRA_OECONF +=3D &quot;--enable-log-src-basename&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;templates \<br>
-=C2=A0 =C2=A0 ${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39=
;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux=
&#39;, &#39;selinux&#39;, &#39;&#39;, d)} \<br>
=C2=A0&quot;<br>
=C2=A0PACKAGECONFIG[doc] =3D &quot;--enable-doc --enable-api-docs,--disable=
-doc --disable-api-docs,,&quot;<br>
=C2=A0PACKAGECONFIG[rpath] =3D &quot;--enable-rpath,--disable-rpath,,&quot;=
<br>
@@ -109,7 +109,7 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 for i in `grep -l &quot;#! */bin/bash&quot; ${D=
}${datadir}/lxc/hooks/*`; do \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s|#! */bin/bash|#!/bi=
n/sh|&#39; -i $i; done<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@base_contains(&#39;DISTRO_FEATURES&#39;, =
&#39;sysvinit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if ${@bb.utils.contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;sysvinit&#39;, &#39;true&#39;, &#39;false&#39;, d)}; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}${sysconfdir}/init=
.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 config/init/sysvin=
it/lxc* ${D}${sysconfdir}/init.d<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
diff --git a/recipes-extended/images/<a href=3D"http://xen-guest-image-mini=
mal.bb" rel=3D"noreferrer" target=3D"_blank">xen-guest-image-minimal.bb</a>=
 b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb" re=
l=3D"noreferrer" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
index f13940c..ab7e92c 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
+++ b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-guest-image-minimal.bb</a><br>
@@ -7,8 +7,8 @@ IMAGE_INSTALL +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;MACHINE_FEATURES&#39;, &#39;a=
cpi&#39;, &#39;kernel-module-xen-acpi-processor&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-IMAGE_INSTALL +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;=
x11&#39;, &#39; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
-IMAGE_INSTALL +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;=
x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
+IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
+IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &=
#39;x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_1.3.2.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_1.3.2.bb</a><br>
index 42066c1..be21910 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_1.3.2.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_1.3.2.bb</a><br>
@@ -107,7 +107,7 @@ FILES_${PN}-libvirtd =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/usr/lib/sysctl.d/60-libvirtd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${sbindir}/libvirtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/* \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${@base_contains(&#39;DISTRO_FEATURES&#39;, &#3=
9;sysvinit&#39;, &#39;&#39;, &#39;${libexecdir}/libvirt-guests.sh&#39;, d)}=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;,=
 &#39;sysvinit&#39;, &#39;&#39;, &#39;${libexecdir}/libvirt-guests.sh&#39;,=
 d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES_${PN}-virsh =3D &quot;${bindir}/virsh&quot;<br>
@@ -167,9 +167,9 @@ PRIVATE_LIBS_${PN}-ptest =3D &quot; \<br>
=C2=A0# full config<br>
=C2=A0PACKAGECONFIG ??=3D &quot;qemu yajl uml openvz vmware vbox esx iprout=
e2 lxc test \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remot=
e macvtap libvirtd netcf udev python ebtables \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@ba=
se_contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39;, &#39;selinux audi=
t libcap-ng&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@ba=
se_contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#39;xen libxl xen-in=
otify&#39;, &#39;&#39;, d)} \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@ba=
se_contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;polkit&#39;, &#3=
9;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;selinux&#39;, &#39;selinux =
audit libcap-ng&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#39;, &#39;xen libxl xe=
n-inotify&#39;, &#39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb=
.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;x11&#39;, &#39;polkit&#39;,=
 &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;=
<br>
<br>
=C2=A0# enable,disable,depends,rdepends<br>
diff --git a/recipes-kernel/linux/linux-yocto_4.1.bbappend b/recipes-kernel=
/linux/linux-yocto_4.1.bbappend<br>
index 85e98cc..f3be89e 100644<br>
--- a/recipes-kernel/linux/linux-yocto_4.1.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_4.1.bbappend<br>
@@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
=C2=A0KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
<br>
=C2=A0# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39;, d=
)}&quot;<br>
+KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39=
;, d)}&quot;<br>
<br>
=C2=A0# xen kernel support<br>
-SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#3=
9;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xe=
n&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
diff --git a/recipes-kernel/linux/linux-yocto_4.4.bbappend b/recipes-kernel=
/linux/linux-yocto_4.4.bbappend<br>
index 85e98cc..f3be89e 100644<br>
--- a/recipes-kernel/linux/linux-yocto_4.4.bbappend<br>
+++ b/recipes-kernel/linux/linux-yocto_4.4.bbappend<br>
@@ -13,7 +13,7 @@ KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-amd&quot;<br>
=C2=A0KERNEL_MODULE_AUTOLOAD +=3D &quot;kvm-intel&quot;<br>
<br>
=C2=A0# aufs kernel support required for xen-image-minimal<br>
-KERNEL_FEATURES_append +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#3=
9;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39;, d=
)}&quot;<br>
+KERNEL_FEATURES_append +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURE=
S&#39;, &#39;aufs&#39;, &#39; features/aufs/aufs-enable.scc&#39;, &#39;&#39=
;, d)}&quot;<br>
<br>
=C2=A0# xen kernel support<br>
-SRC_URI +=3D &quot;${@base_contains(&#39;DISTRO_FEATURES&#39;, &#39;xen&#3=
9;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
+SRC_URI +=3D &quot;${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;xe=
n&#39;, &#39; file://xen.scc&#39;, &#39;&#39;, d)}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
1.9.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listinfo/m=
eta-virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div>

--001a11352e46545da20531fae56e--
