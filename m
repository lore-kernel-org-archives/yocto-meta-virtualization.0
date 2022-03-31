Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD3A5C433F5
	for <webhook@archiver.kernel.org>; Thu, 31 Mar 2022 14:23:39 +0000 (UTC)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web12.7718.1648736618928401247
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 07:23:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=E6QSsWaL;
 spf=pass (domain: gmail.com, ip: 209.85.218.42,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id dr20so48416120ejc.6
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 31 Mar 2022 07:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=++V2ym32oBtPjcm0Gh3AiuwDGIPDaw2alXHTqAyWYsw=;
        b=E6QSsWaLxi+Qg1FytOZn+3kyw0H1oJBO6kQDBZbF3jP4SxJRZ2ZFoQEX9pfoy+IeCN
         MEF7PeiqocXqmdN7q2q+oY+wxbt5u+4fZowntoVsQMzDz2Q+FsV3bfMz3yULxrMCy3Gv
         +fTVWHk2Ssc7F4qWGpJTPhKORXFbc0NHcPVbsflzXWtJJFnN6jsO2pdKkkqTsm2a72jF
         psJOnDlR+t2CksGpuTpbqARxC5zFZRXayZhcQOvPdIzteKgCgc3RAjEgQV5w5aTVodBp
         rOP/f0JCBqkG3Uv4i7ywYTABn46prSPN46zKZDv7mJnXKxbpS+ay8GRrx6joZZ8FY5ZE
         Sc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=++V2ym32oBtPjcm0Gh3AiuwDGIPDaw2alXHTqAyWYsw=;
        b=Topmb7BFshZqhQ1v7PVcXAmKHKq0e+rK8IdpHm42GXxFsitavzJtuQR07oi5GJcqH0
         rp5/4x031ayo+EP1xfCffAWPEuxHBYnOKgnc6TmqC4XaOVwslhyxJIQYcRjDMgLIKIIH
         iiIdV8PxWNYH26CUkY1hjnIaRRdpqrFZWUppVZUbXVza7790yOZR/V8UXKmbNDnodc3F
         Cm1112zya3B17bqpdSaYYEdtptdVxmLgL/7H7IjNIRWYO1QWujfpNfXtVL3xVrM/pOk8
         iaXVNITZqXBEGZWhqtEUJjaxt2qbf0Ft8Bfad0naTFWZCytnNLWGCOUSG1IIVOvoLiJa
         Tpmg==
X-Gm-Message-State: AOAM531Qw9g7Ew56igZ0HwgPDtKmSOBHOXLg4r/tOI+SjFlQyb5LaeXO
	uhWNmcDuLAPKfj7JADoyEsH4ns6Ad80sbForl/4+7GSPWxo=
X-Google-Smtp-Source: 
 ABdhPJyjQYUza1y4sa3nlGdI423bsKv2lhmroSqmTXXj7YYXOs4Esaywrl+AotfmprYIN8lKXq565B2wIiG23NYTH80=
X-Received: by 2002:a17:907:6d11:b0:6df:f38b:b698 with SMTP id
 sa17-20020a1709076d1100b006dff38bb698mr5264511ejc.711.1648736617090; Thu, 31
 Mar 2022 07:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220331141829.17208-1-sakib.sajal@windriver.com>
In-Reply-To: <20220331141829.17208-1-sakib.sajal@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 31 Mar 2022 10:23:25 -0400
Message-ID: 
 <CADkTA4Mz6UuNtRLe13p5BUk5ALPidEAmwUmuCgKLs3bH=H4-ow@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt: upgrade 7.2.0 -> 8.1.0
To: Sakib Sajal <sakib.sajal@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000063d2da05db8468a4"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 31 Mar 2022 14:23:39 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7119

--00000000000063d2da05db8468a4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

There's already a libvirt upgrade in master-next.

Check it out and send any patches incrementally to that.

Bruce

On Thu, Mar 31, 2022 at 10:18 AM <sakib.sajal@windriver.com> wrote:

> Dropped patches which are part of the new version:
>         0001-docs-Fix-template-matching-in-page.xsl.patch
>         0001-security-fix-SELinux-label-generation-logic.patch
>         0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch
>         0002-meson-Fix-compatibility-with-Meson-0.58.patch
>
> Dropped the obsolete md5checksum.
>
> From upstream libvirt, the commit:
>         8eb4461645 remove sysconfig files
> removes all sysconfig files. Add the former libvirtd
> sysconfig file that starts libvirtd in the right mode.
> Since the sysconfig file has already been sed'ed,
> remove the sed line from the install rule.
>
> Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc   |  4 +-
>  ...cs-Fix-template-matching-in-page.xsl.patch | 64 -------------------
>  ...y-fix-SELinux-label-generation-logic.patch | 56 ----------------
>  ...nlock-object-on-ACL-fail-in-storageP.patch | 40 ------------
>  ...on-Fix-compatibility-with-Meson-0.58.patch | 48 --------------
>  recipes-extended/libvirt/libvirt/libvirtd     | 22 +++++++
>  .../{libvirt_7.2.0.bb =3D> libvirt_8.1.0.bb}    | 19 +++---
>  7 files changed, 34 insertions(+), 219 deletions(-)
>  delete mode 100644
> recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-page.=
xsl.patch
>  delete mode 100644
> recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-generati=
on-logic.patch
>  delete mode 100644
> recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-ACL=
-fail-in-storageP.patch
>  delete mode 100644
> recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meson-=
0.58.patch
>  create mode 100644 recipes-extended/libvirt/libvirt/libvirtd
>  rename recipes-extended/libvirt/{libvirt_7.2.0.bb =3D> libvirt_8.1.0.bb}
> (94%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index a48aaea5..6f963fb8 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -17,8 +17,8 @@ FILES:${PN}-python =3D "${bindir}/* ${libdir}/*
> ${libdir}/${PYTHON_DIR}/*"
>
>  SRC_URI +=3D "
> http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=3Dlibv=
irt_python
> "
>
> -SRC_URI[libvirt_python.md5sum] =3D "19bf22414a43d358581b9259b52047a7"
> -SRC_URI[libvirt_python.sha256sum] =3D
> "c0c3bac54c55622e17927b09cd9843869600d71842fb072c99491fe2608dcee7"
> +SRC_URI[libvirt_python.md5sum] =3D "dbb1ab179303700aefa20f831b645ee2"
> +SRC_URI[libvirt_python.sha256sum] =3D
> "a21ecfab6d29ac1bdd1bfd4aa3ef58447f9f70919aefecd03774613f65914e43"
>
>  export LIBVIRT_API_PATH =3D "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS =3D "-I${S}/include"
> diff --git
> a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-pag=
e.xsl.patch
> b/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-pag=
e.xsl.patch
> deleted file mode 100644
> index 9dd650ee..00000000
> ---
> a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-pag=
e.xsl.patch
> +++ /dev/null
> @@ -1,64 +0,0 @@
> -Upstream-Status: Backport
> -
> -Signed-off-by: Kai Kang <kai.kang@windriver.com>
> -
> -From 54814c87f3706cc8eb894634ebef0f9cf7dabae6 Mon Sep 17 00:00:00 2001
> -From: Martin Kletzander <mkletzan@redhat.com>
> -Date: Mon, 21 Feb 2022 09:26:13 +0100
> -Subject: [PATCH] docs: Fix template matching in page.xsl
> -
> -Our last default template had a match of "node()" which incidentally
> matched
> -everything, including text nodes.  Since this has the same priority
> according to
> -the XSLT spec, section 5.5:
> -
> -  https://www.w3.org/TR/1999/REC-xslt-19991116#conflict
> -
> -this is an error.  Also according to the same spec section, the XSLT
> processor
> -may signal the error or pick the last rule.
> -
> -This was uncovered with libxslt 1.1.35 which contains the following
> commit:
> -
> -
> https://gitlab.gnome.org/GNOME/libxslt/-/commit/b0074eeca3c6b21b4da14fdf7=
12b853900c51635
> -
> -which makes the build fail with:
> -
> -  runtime error: file ../docs/page.xsl line 223 element element
> -  xsl:element: The effective name '' is not a valid QName.
> -
> -because our last rule also matches text nodes and we are trying to
> extract the
> -node name out of them.
> -
> -To fix this we change the match to "*" which only matches elements and
> not all
> -the nodes, and to avoid any possible errors with different XSLT
> processors we
> -also bump the priority of the match=3D"text()" rule a little higher, jus=
t
> in case
> -someone needs to use an XSLT processor that chooses signalling the error
> instead
> -of the optional recovery.
> -
> -https://bugs.gentoo.org/833586
> -
> -Signed-off-by: Martin Kletzander <mkletzan@redhat.com>
> ----
> - docs/page.xsl | 4 ++--
> - 1 file changed, 2 insertions(+), 2 deletions(-)
> -
> -diff --git a/docs/page.xsl b/docs/page.xsl
> -index fd67918d3b..72a6fa0842 100644
> ---- a/docs/page.xsl
> -+++ b/docs/page.xsl
> -@@ -215,11 +215,11 @@
> -     </xsl:element>
> -   </xsl:template>
> -
> --  <xsl:template match=3D"text()" mode=3D"copy">
> -+  <xsl:template match=3D"text()" mode=3D"copy" priority=3D"0">
> -     <xsl:value-of select=3D"."/>
> -   </xsl:template>
> -
> --  <xsl:template match=3D"node()" mode=3D"copy">
> -+  <xsl:template match=3D"*" mode=3D"copy">
> -     <xsl:element name=3D"{name()}">
> -       <xsl:copy-of select=3D"./@*"/>
> -       <xsl:apply-templates mode=3D"copy" />
> ---
> -2.33.0
> -
> diff --git
> a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-genera=
tion-logic.patch
> b/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-genera=
tion-logic.patch
> deleted file mode 100644
> index 2753503d..00000000
> ---
> a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-genera=
tion-logic.patch
> +++ /dev/null
> @@ -1,56 +0,0 @@
> -From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001
> -From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D <berrange@=
redhat.com>
> -Date: Mon, 28 Jun 2021 13:09:04 +0100
> -Subject: [PATCH] security: fix SELinux label generation logic
> -MIME-Version: 1.0
> -Content-Type: text/plain; charset=3DUTF-8
> -Content-Transfer-Encoding: 8bit
> -
> -A process can access a file if the set of MCS categories
> -for the file is equal-to *or* a subset-of, the set of
> -MCS categories for the process.
> -
> -If there are two VMs:
> -
> -  a) svirt_t:s0:c117
> -  b) svirt_t:s0:c117,c720
> -
> -Then VM (b) is able to access files labelled for VM (a).
> -
> -IOW, we must discard case where the categories are equal
> -because that is a subset of many other valid category pairs.
> -
> -Upstream-status: Backport
> -
> -Fixes: https://gitlab.com/libvirt/libvirt/-/issues/153
> -CVE-2021-3631
> -Reviewed-by: Peter Krempa <pkrempa@redhat.com>
> -Signed-off-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> ----
> - src/security/security_selinux.c | 10 +++++++++-
> - 1 file changed, 9 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/security/security_selinux.c
> b/src/security/security_selinux.c
> -index b50f4463cc..0c2cf1d1c7 100644
> ---- a/src/security/security_selinux.c
> -+++ b/src/security/security_selinux.c
> -@@ -383,7 +383,15 @@ virSecuritySELinuxMCSFind(virSecurityManager *mgr,
> -         VIR_DEBUG("Try cat %s:c%d,c%d", sens, c1 + catMin, c2 + catMin)=
;
> -
> -         if (c1 =3D=3D c2) {
> --            mcs =3D g_strdup_printf("%s:c%d", sens, catMin + c1);
> -+            /*
> -+             * A process can access a file if the set of MCS categories
> -+             * for the file is equal-to *or* a subset-of, the set of
> -+             * MCS categories for the process.
> -+             *
> -+             * IOW, we must discard case where the categories are equal
> -+             * because that is a subset of other category pairs.
> -+             */
> -+            continue;
> -         } else {
> -             if (c1 > c2) {
> -                 int t =3D c1;
> ---
> -2.17.1
> -
> diff --git
> a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-A=
CL-fail-in-storageP.patch
> b/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-A=
CL-fail-in-storageP.patch
> deleted file mode 100644
> index 608322d9..00000000
> ---
> a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on-A=
CL-fail-in-storageP.patch
> +++ /dev/null
> @@ -1,40 +0,0 @@
> -From d3e20e186ed531e196bb1529430f39b0c917e6dc Mon Sep 17 00:00:00 2001
> -From: Peter Krempa <pkrempa@redhat.com>
> -Date: Wed, 21 Jul 2021 11:22:25 +0200
> -Subject: [PATCH] storage_driver: Unlock object on ACL fail in
> - storagePoolLookupByTargetPath
> -
> -'virStoragePoolObjListSearch' returns a locked and refed object, thus we
> -must release it on ACL permission failure.
> -
> -Fixes: 7aa0e8c0cb8
> -Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=3D1984318
> -Signed-off-by: Peter Krempa <pkrempa@redhat.com>
> -Reviewed-by: Michal Privoznik <mprivozn@redhat.com>
> -
> -Upstream-status: Backport
> -CVE-2021-3667 [https://bugzilla.redhat.com/show_bug.cgi?id=3D1986094]
> -Signed-off-by: Yanfei Xu <yanfei.xu@windriver.com>
> ----
> - src/storage/storage_driver.c | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/src/storage/storage_driver.c b/src/storage/storage_driver.c
> -index ecb5b86b4f..de66f1f9e5 100644
> ---- a/src/storage/storage_driver.c
> -+++ b/src/storage/storage_driver.c
> -@@ -1739,8 +1739,10 @@ storagePoolLookupByTargetPath(virConnectPtr conn,
> -
> storagePoolLookupByTargetPathCallback,
> -                                            cleanpath))) {
> -         def =3D virStoragePoolObjGetDef(obj);
> --        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0)
> -+        if (virStoragePoolLookupByTargetPathEnsureACL(conn, def) < 0) {
> -+            virStoragePoolObjEndAPI(&obj);
> -             return NULL;
> -+        }
> -
> -         pool =3D virGetStoragePool(conn, def->name, def->uuid, NULL, NU=
LL);
> -         virStoragePoolObjEndAPI(&obj);
> ---
> -2.27.0
> -
> diff --git
> a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meso=
n-0.58.patch
> b/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meso=
n-0.58.patch
> deleted file mode 100644
> index 3201eede..00000000
> ---
> a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Meso=
n-0.58.patch
> +++ /dev/null
> @@ -1,48 +0,0 @@
> -From c607266619c5ab78ad5d4179b3ea93cfb6348391 Mon Sep 17 00:00:00 2001
> -From: Andrea Bolognani <abologna@redhat.com>
> -Date: Mon, 3 May 2021 09:06:34 +0200
> -Subject: [PATCH] meson: Fix compatibility with Meson 0.58
> -
> -Builds failed with
> -
> -  tests/meson.build:690:0: ERROR: List item must be one
> -  of <class 'str'>, not <class 'list'>
> -
> -before this change.
> -
> -https://gitlab.com/libvirt/libvirt/-/issues/158
> -
> -Upstream-Status: Backport [
> https://gitlab.com/libvirt/libvirt/-/commit/c607266619c5ab78ad5d4179b3ea9=
3cfb6348391
> ]
> -
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> -Signed-off-by: Andrea Bolognani <abologna@redhat.com>
> -Reviewed-by: Peter Krempa <pkrempa@redhat.com>
> -Reviewed-by: Pavel Hrdina <phrdina@redhat.com>
> ----
> - tests/meson.build | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/tests/meson.build b/tests/meson.build
> -index 05c3e90195..9900983d0c 100644
> ---- a/tests/meson.build
> -+++ b/tests/meson.build
> -@@ -687,12 +687,12 @@ foreach name : test_scripts
> -   test(name, script, env: tests_env)
> - endforeach
> -
> -+testenv =3D runutf8
> -+testenv +=3D 'VIR_TEST_FILE_ACCESS=3D1'
> -+
> - add_test_setup(
> -   'access',
> --  env: [
> --    'VIR_TEST_FILE_ACCESS=3D1',
> --    runutf8,
> --  ],
> -+  env: testenv,
> -   exe_wrapper: [ python3_prog, check_file_access_prog.path() ],
> - )
> -
> ---
> -GitLab
> -
> diff --git a/recipes-extended/libvirt/libvirt/libvirtd
> b/recipes-extended/libvirt/libvirt/libvirtd
> new file mode 100644
> index 00000000..455b4395
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/libvirtd
> @@ -0,0 +1,22 @@
> +# Customizations for the libvirtd.service systemd unit
> +
> +# Default behaviour is for libvirtd.service to start on boot
> +# so that VM autostart can be performed. We then want it to
> +# shutdown again if nothing was started and rely on systemd
> +# socket activation to start it again when some client app
> +# connects.
> +LIBVIRTD_ARGS=3D"--timeout 120"
> +
> +# If systemd socket activation is disabled, then the following
> +# can be used to listen on TCP/TLS sockets
> +#LIBVIRTD_ARGS=3D"--listen"
> +LIBVIRTD_ARGS=3D"--listen --daemon"
> +
> +# Override the QEMU/SDL default audio driver probing when
> +# starting virtual machines using SDL graphics
> +#
> +# NB these have no effect for VMs using VNC, unless vnc_allow_host_audio
> +# is enabled in /etc/libvirt/qemu.conf
> +#QEMU_AUDIO_DRV=3Dsdl
> +#
> +#SDL_AUDIODRIVER=3Dpulse
> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb
> b/recipes-extended/libvirt/libvirt_8.1.0.bb
> similarity index 94%
> rename from recipes-extended/libvirt/libvirt_7.2.0.bb
> rename to recipes-extended/libvirt/libvirt_8.1.0.bb
> index 1fc55b8d..f4c0722a 100644
> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_8.1.0.bb
> @@ -23,19 +23,15 @@ RDEPENDS:libvirt-libvirtd:append:x86 =3D " dmidecode"
>  RCONFLICTS:${PN}_libvirtd =3D "connman"
>
>  SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibv=
irt \
> +           file://libvirtd \
>             file://libvirtd.sh \
>             file://libvirtd.conf \
>             file://dnsmasq.conf \
>             file://hook_support.py \
>             file://gnutls-helper.py \
> -           file://0002-meson-Fix-compatibility-with-Meson-0.58.patch \
> -           file://0001-security-fix-SELinux-label-generation-logic.patch=
 \
> -
>  file://0001-storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch \
> -           file://0001-docs-Fix-template-matching-in-page.xsl.patch \
>            "
>
> -SRC_URI[libvirt.md5sum] =3D "92044b629216e44adce63224970a54a3"
> -SRC_URI[libvirt.sha256sum] =3D
> "01f459d0c7ba5009622a628dba1a026200e8f4a299fea783b936a71d7e0ed1d0"
> +SRC_URI[libvirt.sha256sum] =3D
> "3c6c43becffeb34a3f397c616206aa69a893ff8bf5e8208393c84e8e75352934"
>
>  inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES =3D "${PN}"
> @@ -160,7 +156,7 @@ PACKAGECONFIG[fuse] =3D
> "-Dfuse=3Denabled,-Dfuse=3Ddisabled,fuse,"
>  PACKAGECONFIG[audit] =3D "-Daudit=3Denabled,-Daudit=3Ddisabled,audit,"
>  PACKAGECONFIG[libcap-ng] =3D "-Dcapng=3Denabled,-Dcapng=3Ddisabled,libca=
p-ng,"
>  PACKAGECONFIG[wireshark] =3D
> "-Dwireshark_dissector=3Denabled,-Dwireshark_dissector=3Ddisabled,wiresha=
rk
> libwsutil,"
> -PACKAGECONFIG[apparmor_profiles] =3D "-Dapparmor_profiles=3Dtrue,
> -Dapparmor_profiles=3Dfalse,"
> +PACKAGECONFIG[apparmor_profiles] =3D "-Dapparmor_profiles=3Denabled,
> -Dapparmor_profiles=3Ddisabled,"
>  PACKAGECONFIG[firewalld] =3D "-Dfirewalld=3Denabled, -Dfirewalld=3Ddisab=
led,"
>  PACKAGECONFIG[libpcap] =3D "-Dlibpcap=3Denabled,
> -Dlibpcap=3Ddisabled,libpcap,libpcap"
>  PACKAGECONFIG[numad] =3D "-Dnumad=3Denabled, -Dnumad=3Ddisabled,"
> @@ -211,8 +207,8 @@ do_install:append() {
>                  rmdir ${D}${prefix}/lib/systemd/system
> ${D}${prefix}/lib/systemd
>              fi
>
> -           # This variable is used by libvirtd.service to start libvirtd
> in the right mode
> -           sed -i '/#LIBVIRTD_ARGS=3D"--listen"/a LIBVIRTD_ARGS=3D"--lis=
ten
> --daemon"' ${D}/${sysconfdir}/sysconfig/libvirtd
> +            mkdir -p ${D}/${sysconfdir}/sysconfig
> +            install -m 0644 ${WORKDIR}/libvirtd
> ${D}/${sysconfdir}/sysconfig
>
>             # We can't use 'notify' when we don't support 'sd_notify' dbu=
s
> capabilities.
>             sed -i -e 's/Type=3Dnotify/Type=3Dforking/' \
> @@ -307,6 +303,11 @@ do_install:append() {
>
>         # virt-login-shell needs to run with setuid permission
>         chmod 4755 ${D}${bindir}/virt-login-shell
> +
> +        # remove unsupported migration config file
> +        # migration process is described here:
> +        # https://wiki.qemu.org/Features/PostCopyLiveMigration
> +        rm ${D}/usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
>  }
>
>  EXTRA_OEMESON +=3D " \
> --
> 2.33.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7118):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7118
> Mute This Topic: https://lists.yoctoproject.org/mt/90155357/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000063d2da05db8468a4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">The=
re&#39;s already a libvirt upgrade in master-next.</div><div class=3D"gmail=
_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-size:small">Check it out and send any patches incrementally t=
o that.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu=
, Mar 31, 2022 at 10:18 AM &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
>sakib.sajal@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">Dropped patches which are part of the new version=
:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-docs-Fix-template-matching-in-page.xsl.pat=
ch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-security-fix-SELinux-label-generation-logi=
c.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0001-storage_driver-Unlock-object-on-ACL-fail-i=
n-storageP.patch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0002-meson-Fix-compatibility-with-Meson-0.58.pa=
tch<br>
<br>
Dropped the obsolete md5checksum.<br>
<br>
From upstream libvirt, the commit:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 8eb4461645 remove sysconfig files<br>
removes all sysconfig files. Add the former libvirtd<br>
sysconfig file that starts libvirtd in the right mode.<br>
Since the sysconfig file has already been sed&#39;ed,<br>
remove the sed line from the install rule.<br>
<br>
Signed-off-by: Sakib Sajal &lt;<a href=3D"mailto:sakib.sajal@windriver.com"=
 target=3D"_blank">sakib.sajal@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc=C2=A0 =C2=A0|=C2=A0 4 +-<=
br>
=C2=A0...cs-Fix-template-matching-in-page.xsl.patch | 64 ------------------=
-<br>
=C2=A0...y-fix-SELinux-label-generation-logic.patch | 56 ----------------<b=
r>
=C2=A0...nlock-object-on-ACL-fail-in-storageP.patch | 40 ------------<br>
=C2=A0...on-Fix-compatibility-with-Meson-0.58.patch | 48 --------------<br>
=C2=A0recipes-extended/libvirt/libvirt/libvirtd=C2=A0 =C2=A0 =C2=A0| 22 +++=
++++<br>
=C2=A0.../{<a href=3D"http://libvirt_7.2.0.bb" rel=3D"noreferrer" target=3D=
"_blank">libvirt_7.2.0.bb</a> =3D&gt; <a href=3D"http://libvirt_8.1.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_8.1.0.bb</a>}=C2=A0 =C2=A0 | 19=
 +++---<br>
=C2=A07 files changed, 34 insertions(+), 219 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/libvirt/libvirt/0001-docs-Fix-tem=
plate-matching-in-page.xsl.patch<br>
=C2=A0delete mode 100644 recipes-extended/libvirt/libvirt/0001-security-fix=
-SELinux-label-generation-logic.patch<br>
=C2=A0delete mode 100644 recipes-extended/libvirt/libvirt/0001-storage_driv=
er-Unlock-object-on-ACL-fail-in-storageP.patch<br>
=C2=A0delete mode 100644 recipes-extended/libvirt/libvirt/0002-meson-Fix-co=
mpatibility-with-Meson-0.58.patch<br>
=C2=A0create mode 100644 recipes-extended/libvirt/libvirt/libvirtd<br>
=C2=A0rename recipes-extended/libvirt/{<a href=3D"http://libvirt_7.2.0.bb" =
rel=3D"noreferrer" target=3D"_blank">libvirt_7.2.0.bb</a> =3D&gt; <a href=
=3D"http://libvirt_8.1.0.bb" rel=3D"noreferrer" target=3D"_blank">libvirt_8=
.1.0.bb</a>} (94%)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index a48aaea5..6f963fb8 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -17,8 +17,8 @@ FILES:${PN}-python =3D &quot;${bindir}/* ${libdir}/* ${li=
bdir}/${PYTHON_DIR}/*&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/libvi=
rt-python-$%7BPV%7D.tar.gz;name=3Dlibvirt_python" rel=3D"noreferrer" target=
=3D"_blank">http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;n=
ame=3Dlibvirt_python</a>&quot;<br>
<br>
-SRC_URI[libvirt_python.md5sum] =3D &quot;19bf22414a43d358581b9259b52047a7&=
quot;<br>
-SRC_URI[libvirt_python.sha256sum] =3D &quot;c0c3bac54c55622e17927b09cd9843=
869600d71842fb072c99491fe2608dcee7&quot;<br>
+SRC_URI[libvirt_python.md5sum] =3D &quot;dbb1ab179303700aefa20f831b645ee2&=
quot;<br>
+SRC_URI[libvirt_python.sha256sum] =3D &quot;a21ecfab6d29ac1bdd1bfd4aa3ef58=
447f9f70919aefecd03774613f65914e43&quot;<br>
<br>
=C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api.xml&quot;<br>
=C2=A0export LIBVIRT_CFLAGS =3D &quot;-I${S}/include&quot;<br>
diff --git a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matchi=
ng-in-page.xsl.patch b/recipes-extended/libvirt/libvirt/0001-docs-Fix-templ=
ate-matching-in-page.xsl.patch<br>
deleted file mode 100644<br>
index 9dd650ee..00000000<br>
--- a/recipes-extended/libvirt/libvirt/0001-docs-Fix-template-matching-in-p=
age.xsl.patch<br>
+++ /dev/null<br>
@@ -1,64 +0,0 @@<br>
-Upstream-Status: Backport<br>
-<br>
-Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targ=
et=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
-<br>
-From 54814c87f3706cc8eb894634ebef0f9cf7dabae6 Mon Sep 17 00:00:00 2001<br>
-From: Martin Kletzander &lt;<a href=3D"mailto:mkletzan@redhat.com" target=
=3D"_blank">mkletzan@redhat.com</a>&gt;<br>
-Date: Mon, 21 Feb 2022 09:26:13 +0100<br>
-Subject: [PATCH] docs: Fix template matching in page.xsl<br>
-<br>
-Our last default template had a match of &quot;node()&quot; which incident=
ally matched<br>
-everything, including text nodes.=C2=A0 Since this has the same priority a=
ccording to<br>
-the XSLT spec, section 5.5:<br>
-<br>
-=C2=A0 <a href=3D"https://www.w3.org/TR/1999/REC-xslt-19991116#conflict" r=
el=3D"noreferrer" target=3D"_blank">https://www.w3.org/TR/1999/REC-xslt-199=
91116#conflict</a><br>
-<br>
-this is an error.=C2=A0 Also according to the same spec section, the XSLT =
processor<br>
-may signal the error or pick the last rule.<br>
-<br>
-This was uncovered with libxslt 1.1.35 which contains the following commit=
:<br>
-<br>
-=C2=A0 <a href=3D"https://gitlab.gnome.org/GNOME/libxslt/-/commit/b0074eec=
a3c6b21b4da14fdf712b853900c51635" rel=3D"noreferrer" target=3D"_blank">http=
s://gitlab.gnome.org/GNOME/libxslt/-/commit/b0074eeca3c6b21b4da14fdf712b853=
900c51635</a><br>
-<br>
-which makes the build fail with:<br>
-<br>
-=C2=A0 runtime error: file ../docs/page.xsl line 223 element element<br>
-=C2=A0 xsl:element: The effective name &#39;&#39; is not a valid QName.<br=
>
-<br>
-because our last rule also matches text nodes and we are trying to extract=
 the<br>
-node name out of them.<br>
-<br>
-To fix this we change the match to &quot;*&quot; which only matches elemen=
ts and not all<br>
-the nodes, and to avoid any possible errors with different XSLT processors=
 we<br>
-also bump the priority of the match=3D&quot;text()&quot; rule a little hig=
her, just in case<br>
-someone needs to use an XSLT processor that chooses signalling the error i=
nstead<br>
-of the optional recovery.<br>
-<br>
-<a href=3D"https://bugs.gentoo.org/833586" rel=3D"noreferrer" target=3D"_b=
lank">https://bugs.gentoo.org/833586</a><br>
-<br>
-Signed-off-by: Martin Kletzander &lt;<a href=3D"mailto:mkletzan@redhat.com=
" target=3D"_blank">mkletzan@redhat.com</a>&gt;<br>
----<br>
- docs/page.xsl | 4 ++--<br>
- 1 file changed, 2 insertions(+), 2 deletions(-)<br>
-<br>
-diff --git a/docs/page.xsl b/docs/page.xsl<br>
-index fd67918d3b..72a6fa0842 100644<br>
---- a/docs/page.xsl<br>
-+++ b/docs/page.xsl<br>
-@@ -215,11 +215,11 @@<br>
-=C2=A0 =C2=A0 =C2=A0&lt;/xsl:element&gt;<br>
-=C2=A0 =C2=A0&lt;/xsl:template&gt;<br>
- <br>
--=C2=A0 &lt;xsl:template match=3D&quot;text()&quot; mode=3D&quot;copy&quot=
;&gt;<br>
-+=C2=A0 &lt;xsl:template match=3D&quot;text()&quot; mode=3D&quot;copy&quot=
; priority=3D&quot;0&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0&lt;xsl:value-of select=3D&quot;.&quot;/&gt;<br>
-=C2=A0 =C2=A0&lt;/xsl:template&gt;<br>
- <br>
--=C2=A0 &lt;xsl:template match=3D&quot;node()&quot; mode=3D&quot;copy&quot=
;&gt;<br>
-+=C2=A0 &lt;xsl:template match=3D&quot;*&quot; mode=3D&quot;copy&quot;&gt;=
<br>
-=C2=A0 =C2=A0 =C2=A0&lt;xsl:element name=3D&quot;{name()}&quot;&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;xsl:copy-of select=3D&quot;./@*&quot;/&gt;<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;xsl:apply-templates mode=3D&quot;copy&quot;=
 /&gt;<br>
--- <br>
-2.33.0<br>
-<br>
diff --git a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-lab=
el-generation-logic.patch b/recipes-extended/libvirt/libvirt/0001-security-=
fix-SELinux-label-generation-logic.patch<br>
deleted file mode 100644<br>
index 2753503d..00000000<br>
--- a/recipes-extended/libvirt/libvirt/0001-security-fix-SELinux-label-gene=
ration-logic.patch<br>
+++ /dev/null<br>
@@ -1,56 +0,0 @@<br>
-From 15073504dbb624d3f6c911e85557019d3620fdb2 Mon Sep 17 00:00:00 2001<br>
-From: =3D?UTF-8?q?Daniel=3D20P=3D2E=3D20Berrang=3DC3=3DA9?=3D &lt;<a href=
=3D"mailto:berrange@redhat.com" target=3D"_blank">berrange@redhat.com</a>&g=
t;<br>
-Date: Mon, 28 Jun 2021 13:09:04 +0100<br>
-Subject: [PATCH] security: fix SELinux label generation logic<br>
-MIME-Version: 1.0<br>
-Content-Type: text/plain; charset=3DUTF-8<br>
-Content-Transfer-Encoding: 8bit<br>
-<br>
-A process can access a file if the set of MCS categories<br>
-for the file is equal-to *or* a subset-of, the set of<br>
-MCS categories for the process.<br>
-<br>
-If there are two VMs:<br>
-<br>
-=C2=A0 a) svirt_t:s0:c117<br>
-=C2=A0 b) svirt_t:s0:c117,c720<br>
-<br>
-Then VM (b) is able to access files labelled for VM (a).<br>
-<br>
-IOW, we must discard case where the categories are equal<br>
-because that is a subset of many other valid category pairs.<br>
-<br>
-Upstream-status: Backport<br>
-<br>
-Fixes: <a href=3D"https://gitlab.com/libvirt/libvirt/-/issues/153" rel=3D"=
noreferrer" target=3D"_blank">https://gitlab.com/libvirt/libvirt/-/issues/1=
53</a><br>
-CVE-2021-3631<br>
-Reviewed-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=
=3D"_blank">pkrempa@redhat.com</a>&gt;<br>
-Signed-off-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redh=
at.com" target=3D"_blank">berrange@redhat.com</a>&gt;<br>
----<br>
- src/security/security_selinux.c | 10 +++++++++-<br>
- 1 file changed, 9 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/security/security_selinux.c b/src/security/security_selin=
ux.c<br>
-index b50f4463cc..0c2cf1d1c7 100644<br>
---- a/src/security/security_selinux.c<br>
-+++ b/src/security/security_selinux.c<br>
-@@ -383,7 +383,15 @@ virSecuritySELinuxMCSFind(virSecurityManager *mgr,<br=
>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VIR_DEBUG(&quot;Try cat %s:c%d,c%d&quot;=
, sens, c1 + catMin, c2 + catMin);<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c1 =3D=3D c2) {<br>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mcs =3D g_strdup_printf(&quot;%=
s:c%d&quot;, sens, catMin + c1);<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* A process can access a =
file if the set of MCS categories<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for the file is equal-t=
o *or* a subset-of, the set of<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* MCS categories for the =
process.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* IOW, we must discard ca=
se where the categories are equal<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* because that is a subse=
t of other category pairs.<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} else {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (c1 &gt; c2) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int t =3D c1=
;<br>
--- <br>
-2.17.1<br>
-<br>
diff --git a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-ob=
ject-on-ACL-fail-in-storageP.patch b/recipes-extended/libvirt/libvirt/0001-=
storage_driver-Unlock-object-on-ACL-fail-in-storageP.patch<br>
deleted file mode 100644<br>
index 608322d9..00000000<br>
--- a/recipes-extended/libvirt/libvirt/0001-storage_driver-Unlock-object-on=
-ACL-fail-in-storageP.patch<br>
+++ /dev/null<br>
@@ -1,40 +0,0 @@<br>
-From d3e20e186ed531e196bb1529430f39b0c917e6dc Mon Sep 17 00:00:00 2001<br>
-From: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=3D"_bl=
ank">pkrempa@redhat.com</a>&gt;<br>
-Date: Wed, 21 Jul 2021 11:22:25 +0200<br>
-Subject: [PATCH] storage_driver: Unlock object on ACL fail in<br>
- storagePoolLookupByTargetPath<br>
-<br>
-&#39;virStoragePoolObjListSearch&#39; returns a locked and refed object, t=
hus we<br>
-must release it on ACL permission failure.<br>
-<br>
-Fixes: 7aa0e8c0cb8<br>
-Resolves: <a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D1984318=
" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/show_bug=
.cgi?id=3D1984318</a><br>
-Signed-off-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" targ=
et=3D"_blank">pkrempa@redhat.com</a>&gt;<br>
-Reviewed-by: Michal Privoznik &lt;<a href=3D"mailto:mprivozn@redhat.com" t=
arget=3D"_blank">mprivozn@redhat.com</a>&gt;<br>
-<br>
-Upstream-status: Backport<br>
-CVE-2021-3667 [<a href=3D"https://bugzilla.redhat.com/show_bug.cgi?id=3D19=
86094" rel=3D"noreferrer" target=3D"_blank">https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1986094</a>]<br>
-Signed-off-by: Yanfei Xu &lt;<a href=3D"mailto:yanfei.xu@windriver.com" ta=
rget=3D"_blank">yanfei.xu@windriver.com</a>&gt;<br>
----<br>
- src/storage/storage_driver.c | 4 +++-<br>
- 1 file changed, 3 insertions(+), 1 deletion(-)<br>
-<br>
-diff --git a/src/storage/storage_driver.c b/src/storage/storage_driver.c<b=
r>
-index ecb5b86b4f..de66f1f9e5 100644<br>
---- a/src/storage/storage_driver.c<br>
-+++ b/src/storage/storage_driver.c<br>
-@@ -1739,8 +1739,10 @@ storagePoolLookupByTargetPath(virConnectPtr conn,<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 storagePoolLookupByTargetPathCallback,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 cleanpath))) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0def =3D virStoragePoolObjGetDef(obj);<br=
>
--=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virStoragePoolLookupByTargetPathEnsureACL=
(conn, def) &lt; 0)<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (virStoragePoolLookupByTargetPathEnsureACL=
(conn, def) &lt; 0) {<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 virStoragePoolObjEndAPI(&amp;ob=
j);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- <br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pool =3D virGetStoragePool(conn, def-&gt=
;name, def-&gt;uuid, NULL, NULL);<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0virStoragePoolObjEndAPI(&amp;obj);<br>
--- <br>
-2.27.0<br>
-<br>
diff --git a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-=
with-Meson-0.58.patch b/recipes-extended/libvirt/libvirt/0002-meson-Fix-com=
patibility-with-Meson-0.58.patch<br>
deleted file mode 100644<br>
index 3201eede..00000000<br>
--- a/recipes-extended/libvirt/libvirt/0002-meson-Fix-compatibility-with-Me=
son-0.58.patch<br>
+++ /dev/null<br>
@@ -1,48 +0,0 @@<br>
-From c607266619c5ab78ad5d4179b3ea93cfb6348391 Mon Sep 17 00:00:00 2001<br>
-From: Andrea Bolognani &lt;<a href=3D"mailto:abologna@redhat.com" target=
=3D"_blank">abologna@redhat.com</a>&gt;<br>
-Date: Mon, 3 May 2021 09:06:34 +0200<br>
-Subject: [PATCH] meson: Fix compatibility with Meson 0.58<br>
-<br>
-Builds failed with<br>
-<br>
-=C2=A0 tests/meson.build:690:0: ERROR: List item must be one<br>
-=C2=A0 of &lt;class &#39;str&#39;&gt;, not &lt;class &#39;list&#39;&gt;<br=
>
-<br>
-before this change.<br>
-<br>
-<a href=3D"https://gitlab.com/libvirt/libvirt/-/issues/158" rel=3D"norefer=
rer" target=3D"_blank">https://gitlab.com/libvirt/libvirt/-/issues/158</a><=
br>
-<br>
-Upstream-Status: Backport [<a href=3D"https://gitlab.com/libvirt/libvirt/-=
/commit/c607266619c5ab78ad5d4179b3ea93cfb6348391" rel=3D"noreferrer" target=
=3D"_blank">https://gitlab.com/libvirt/libvirt/-/commit/c607266619c5ab78ad5=
d4179b3ea93cfb6348391</a>]<br>
-<br>
-Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" =
target=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
-Signed-off-by: Andrea Bolognani &lt;<a href=3D"mailto:abologna@redhat.com"=
 target=3D"_blank">abologna@redhat.com</a>&gt;<br>
-Reviewed-by: Peter Krempa &lt;<a href=3D"mailto:pkrempa@redhat.com" target=
=3D"_blank">pkrempa@redhat.com</a>&gt;<br>
-Reviewed-by: Pavel Hrdina &lt;<a href=3D"mailto:phrdina@redhat.com" target=
=3D"_blank">phrdina@redhat.com</a>&gt;<br>
----<br>
- tests/meson.build | 8 ++++----<br>
- 1 file changed, 4 insertions(+), 4 deletions(-)<br>
-<br>
-diff --git a/tests/meson.build b/tests/meson.build<br>
-index 05c3e90195..9900983d0c 100644<br>
---- a/tests/meson.build<br>
-+++ b/tests/meson.build<br>
-@@ -687,12 +687,12 @@ foreach name : test_scripts<br>
-=C2=A0 =C2=A0test(name, script, env: tests_env)<br>
- endforeach<br>
- <br>
-+testenv =3D runutf8<br>
-+testenv +=3D &#39;VIR_TEST_FILE_ACCESS=3D1&#39;<br>
-+<br>
- add_test_setup(<br>
-=C2=A0 =C2=A0&#39;access&#39;,<br>
--=C2=A0 env: [<br>
--=C2=A0 =C2=A0 &#39;VIR_TEST_FILE_ACCESS=3D1&#39;,<br>
--=C2=A0 =C2=A0 runutf8,<br>
--=C2=A0 ],<br>
-+=C2=A0 env: testenv,<br>
-=C2=A0 =C2=A0exe_wrapper: [ python3_prog, check_file_access_prog.path() ],=
<br>
- )<br>
- <br>
--- <br>
-GitLab<br>
-<br>
diff --git a/recipes-extended/libvirt/libvirt/libvirtd b/recipes-extended/l=
ibvirt/libvirt/libvirtd<br>
new file mode 100644<br>
index 00000000..455b4395<br>
--- /dev/null<br>
+++ b/recipes-extended/libvirt/libvirt/libvirtd<br>
@@ -0,0 +1,22 @@<br>
+# Customizations for the libvirtd.service systemd unit<br>
+<br>
+# Default behaviour is for libvirtd.service to start on boot<br>
+# so that VM autostart can be performed. We then want it to<br>
+# shutdown again if nothing was started and rely on systemd<br>
+# socket activation to start it again when some client app<br>
+# connects.<br>
+LIBVIRTD_ARGS=3D&quot;--timeout 120&quot;<br>
+<br>
+# If systemd socket activation is disabled, then the following<br>
+# can be used to listen on TCP/TLS sockets<br>
+#LIBVIRTD_ARGS=3D&quot;--listen&quot;<br>
+LIBVIRTD_ARGS=3D&quot;--listen --daemon&quot;<br>
+<br>
+# Override the QEMU/SDL default audio driver probing when<br>
+# starting virtual machines using SDL graphics<br>
+#<br>
+# NB these have no effect for VMs using VNC, unless vnc_allow_host_audio<b=
r>
+# is enabled in /etc/libvirt/qemu.conf<br>
+#QEMU_AUDIO_DRV=3Dsdl<br>
+#<br>
+#SDL_AUDIODRIVER=3Dpulse<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" r=
el=3D"noreferrer" target=3D"_blank">libvirt_7.2.0.bb</a> b/recipes-extended=
/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"noreferrer" target=3D"_=
blank">libvirt_8.1.0.bb</a><br>
similarity index 94%<br>
rename from recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" re=
l=3D"noreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
rename to recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
index 1fc55b8d..f4c0722a 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_7.2.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_7.2.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_8.1.0.bb" rel=3D"n=
oreferrer" target=3D"_blank">libvirt_8.1.0.bb</a><br>
@@ -23,19 +23,15 @@ RDEPENDS:libvirt-libvirtd:append:x86 =3D &quot; dmideco=
de&quot;<br>
=C2=A0RCONFLICTS:${PN}_libvirtd =3D &quot;connman&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/libvirt-$%7BP=
V%7D.tar.xz;name=3Dlibvirt" rel=3D"noreferrer" target=3D"_blank">http://lib=
virt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://libvirtd \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirtd.sh \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libvirtd.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dnsmasq.conf \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://hook_support.py \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://gnutls-helper.py \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-meson-Fix-compatibili=
ty-with-Meson-0.58.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-security-fix-SELinux-=
label-generation-logic.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-storage_driver-Unlock=
-object-on-ACL-fail-in-storageP.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-docs-Fix-template-mat=
ching-in-page.xsl.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[libvirt.md5sum] =3D &quot;92044b629216e44adce63224970a54a3&quot;<b=
r>
-SRC_URI[libvirt.sha256sum] =3D &quot;01f459d0c7ba5009622a628dba1a026200e8f=
4a299fea783b936a71d7e0ed1d0&quot;<br>
+SRC_URI[libvirt.sha256sum] =3D &quot;3c6c43becffeb34a3f397c616206aa69a893f=
f8bf5e8208393c84e8e75352934&quot;<br>
<br>
=C2=A0inherit meson gettext update-rc.d pkgconfig systemd useradd perlnativ=
e<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
@@ -160,7 +156,7 @@ PACKAGECONFIG[fuse] =3D &quot;-Dfuse=3Denabled,-Dfuse=
=3Ddisabled,fuse,&quot;<br>
=C2=A0PACKAGECONFIG[audit] =3D &quot;-Daudit=3Denabled,-Daudit=3Ddisabled,a=
udit,&quot;<br>
=C2=A0PACKAGECONFIG[libcap-ng] =3D &quot;-Dcapng=3Denabled,-Dcapng=3Ddisabl=
ed,libcap-ng,&quot;<br>
=C2=A0PACKAGECONFIG[wireshark] =3D &quot;-Dwireshark_dissector=3Denabled,-D=
wireshark_dissector=3Ddisabled,wireshark libwsutil,&quot;<br>
-PACKAGECONFIG[apparmor_profiles] =3D &quot;-Dapparmor_profiles=3Dtrue, -Da=
pparmor_profiles=3Dfalse,&quot;<br>
+PACKAGECONFIG[apparmor_profiles] =3D &quot;-Dapparmor_profiles=3Denabled, =
-Dapparmor_profiles=3Ddisabled,&quot;<br>
=C2=A0PACKAGECONFIG[firewalld] =3D &quot;-Dfirewalld=3Denabled, -Dfirewalld=
=3Ddisabled,&quot;<br>
=C2=A0PACKAGECONFIG[libpcap] =3D &quot;-Dlibpcap=3Denabled, -Dlibpcap=3Ddis=
abled,libpcap,libpcap&quot;<br>
=C2=A0PACKAGECONFIG[numad] =3D &quot;-Dnumad=3Denabled, -Dnumad=3Ddisabled,=
&quot;<br>
@@ -211,8 +207,8 @@ do_install:append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rmdir ${D}${p=
refix}/lib/systemd/system ${D}${prefix}/lib/systemd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# This variable is used by libvir=
td.service to start libvirtd in the right mode<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sed -i &#39;/#LIBVIRTD_ARGS=3D&qu=
ot;--listen&quot;/a LIBVIRTD_ARGS=3D&quot;--listen --daemon&quot;&#39; ${D}=
/${sysconfdir}/sysconfig/libvirtd<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p ${D}/${sysconfdir}/sysc=
onfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 0644 ${WORKDIR}/libvi=
rtd ${D}/${sysconfdir}/sysconfig<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can&#39;t use &#39;notify&#3=
9; when we don&#39;t support &#39;sd_notify&#39; dbus capabilities.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e &#39;s/Type=3Dnotify/Ty=
pe=3Dforking/&#39; \<br>
@@ -307,6 +303,11 @@ do_install:append() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # virt-login-shell needs to run with setuid per=
mission<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 chmod 4755 ${D}${bindir}/virt-login-shell<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # remove unsupported migration config file<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # migration process is described here:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # <a href=3D"https://wiki.qemu.org/Features/Po=
stCopyLiveMigration" rel=3D"noreferrer" target=3D"_blank">https://wiki.qemu=
.org/Features/PostCopyLiveMigration</a><br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 rm ${D}/usr/lib/sysctl.d/60-qemu-postcopy-migr=
ation.conf<br>
=C2=A0}<br>
<br>
=C2=A0EXTRA_OEMESON +=3D &quot; \<br>
-- <br>
2.33.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7118): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7118" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7118</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90155357/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90155357/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div>

--00000000000063d2da05db8468a4--

