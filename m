Return-Path: <matthis.hauschild@airbus.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18F0ECF31A7
	for <webhook@archiver.kernel.org>; Wed,  2 Oct 2024 08:50:23 +0000 (UTC)
Subject: Re: [PATCH] libvirt: ensure sysusers.d path for libvirt-qemu
To: meta-virtualization@lists.yoctoproject.org
From: "Matthis Hauschild" <matthis.hauschild@airbus.com>
X-Originating-Location: Buxtehude, Lower Saxony, DE (79.197.250.155)
X-Originating-Platform: Linux Firefox 115
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Wed, 02 Oct 2024 01:50:17 -0700
References: <ZvsHJZqFe38Cpq6T@gmail.com>
In-Reply-To: <ZvsHJZqFe38Cpq6T@gmail.com>
Message-ID: <6732.1727859017264507661@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="t7tMzWPfugluuu1erxpA"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 02 Oct 2024 08:50:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8908

--t7tMzWPfugluuu1erxpA
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

does that really solve your issue? With this patch applied, I run into the =
following build error because with the `-d` option, all arguments are treat=
ed as directories. So we should either use `-D` or create the directory acc=
oring to the other created dirs in do_install

>=20
> install: cannot create directory
> =E2=80=98/workdir/build/tmp/work/core2-64-wlanvm-linux/libvirt/v10.5.0+gi=
t/sources-unpack/libvirt-qemu.conf=E2=80=99:
> File exists
> install: cannot create directory
> =E2=80=98/workdir/build/tmp/work/core2-64-wlanvm-linux/libvirt/v10.5.0+gi=
t/image/usr/lib/sysusers.d/libvirt-qemu.conf=E2=80=99:
> File exists
>=20

So I propose the following patch. Please let me know what you think.
Side note: This is my first contribution, I hope the format is correct, oth=
erwise please let me know. I cannot use `git send-email`, so this is writte=
n from the webinterface.
Best regards,
Matthis

Patch:

3902ac8844a9868ab14fa38b663d3832daa4b9de leads to the following build
errors:
install: cannot create directory =E2=80=98{UNPACKDIR}/libvirt-qemu.conf=E2=
=80=99: File exists
install: cannot create directory =E2=80=98{D}/usr/lib/sysusers.d/libvirt-qe=
mu.conf=E2=80=99: File exists
because `-d` treats all arguments as directories. Create the required
directory the same way as the other directories.
Signed-off-by: Matthis Hauschild <matthis.hauschild@airbus.com>
---
recipes-extended/libvirt/libvirt_git.bb | 3 ++-
1 file changed, 2 insertions(+), 1 deletion(-)
diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extended/lib=
virt/libvirt_git.bb
index bef98b69..5c5a9b3f 100644
--- a/recipes-extended/libvirt/libvirt_git.bb
+++ b/recipes-extended/libvirt/libvirt_git.bb
@@ -205,10 +205,11 @@ do_install:append() {
install -d ${D}/etc/init.d
install -d ${D}/etc/libvirt
install -d ${D}/etc/dnsmasq.d
+ =C2=A0 =C2=A0install -d ${D}${nonarch_base_libdir}/sysusers.d

install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
install -m 0644 ${UNPACKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
- =C2=A0 =C2=A0install -d -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nona=
rch_base_libdir}/sysusers.d/libvirt-qemu.conf
+ =C2=A0 =C2=A0install -m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch=
_base_libdir}/sysusers.d/libvirt-qemu.conf

if ${@bb.utils.contains('DISTRO_FEATURES','sysvinit','true','false',d)}; th=
en
# This will wind up in the libvirtd package, but will NOT be invoked by def=
ault.
--
2.43.0

--t7tMzWPfugluuu1erxpA
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<div>Hi,</div>
<div>&nbsp;</div>
<div>does that really solve your issue? With this patch applied, I run into=
 the following build error because with the `-d` option, all arguments are =
treated as directories. So we should either use `-D` or create the director=
y accoring to the other created dirs in do_install</div>
<div>&nbsp;</div>
<blockquote>
<div>install: cannot create directory &lsquo;/workdir/build/tmp/work/core2-=
64-wlanvm-linux/libvirt/v10.5.0+git/sources-unpack/libvirt-qemu.conf&rsquo;=
: File exists<br />install: cannot create directory &lsquo;/workdir/build/t=
mp/work/core2-64-wlanvm-linux/libvirt/v10.5.0+git/image/usr/lib/sysusers.d/=
libvirt-qemu.conf&rsquo;: File exists</div>
</blockquote>
<div>
<div>So I propose the following patch. Please let me know what you think.</=
div>
<div>Side note: This is my first contribution, I hope the format is correct=
, otherwise please let me know. I cannot use `git send-email`, so this is w=
ritten from the webinterface.</div>
<div>Best regards,</div>
<div>Matthis</div>
<div>&nbsp;</div>
<div>Patch:</div>
<div>&nbsp;</div>
<div>3902ac8844a9868ab14fa38b663d3832daa4b9de leads to the following build<=
br />errors:<br />install: cannot create directory &lsquo;{UNPACKDIR}/libvi=
rt-qemu.conf&rsquo;: File exists<br />install: cannot create directory &lsq=
uo;{D}/usr/lib/sysusers.d/libvirt-qemu.conf&rsquo;: File exists</div>
<div>because `-d` treats all arguments as directories. Create the required<=
br />directory the same way as the other directories.</div>
<div>Signed-off-by: Matthis Hauschild &lt;matthis.hauschild@airbus.com&gt;<=
br />---<br />&nbsp;recipes-extended/libvirt/libvirt_git.bb | 3 ++-<br />&n=
bsp;1 file changed, 2 insertions(+), 1 deletion(-)</div>
<div>diff --git a/recipes-extended/libvirt/libvirt_git.bb b/recipes-extende=
d/libvirt/libvirt_git.bb<br />index bef98b69..5c5a9b3f 100644<br />--- a/re=
cipes-extended/libvirt/libvirt_git.bb<br />+++ b/recipes-extended/libvirt/l=
ibvirt_git.bb<br />@@ -205,10 +205,11 @@ do_install:append() {<br />&nbsp; =
&nbsp; &nbsp;install -d ${D}/etc/init.d<br />&nbsp; &nbsp; &nbsp;install -d=
 ${D}/etc/libvirt<br />&nbsp; &nbsp; &nbsp;install -d ${D}/etc/dnsmasq.d<br=
 />+ &nbsp; &nbsp;install -d ${D}${nonarch_base_libdir}/sysusers.d<br />&nb=
sp;<br />&nbsp; &nbsp; &nbsp;install -m 0755 ${UNPACKDIR}/libvirtd.sh ${D}/=
etc/init.d/libvirtd<br />&nbsp; &nbsp; &nbsp;install -m 0644 ${UNPACKDIR}/l=
ibvirtd.conf ${D}/etc/libvirt/libvirtd.conf<br />- &nbsp; &nbsp;install -d =
-m 0644 ${UNPACKDIR}/libvirt-qemu.conf ${D}${nonarch_base_libdir}/sysusers.=
d/libvirt-qemu.conf<br />+ &nbsp; &nbsp;install -m 0644 ${UNPACKDIR}/libvir=
t-qemu.conf ${D}${nonarch_base_libdir}/sysusers.d/libvirt-qemu.conf<br />&n=
bsp;<br />&nbsp; &nbsp; &nbsp;if ${@bb.utils.contains('DISTRO_FEATURES','sy=
svinit','true','false',d)}; then<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;# T=
his will wind up in the libvirtd package, but will NOT be invoked by defaul=
t.<br />--&nbsp;<br />2.43.0</div>
<div>&nbsp;</div>
</div>

--t7tMzWPfugluuu1erxpA--

