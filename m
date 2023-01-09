Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F694C54EBD
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 06:35:56 +0000 (UTC)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
 by mx.groups.io with SMTP id smtpd.web10.65383.1673246148514912088
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jan 2023 22:35:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mztgCNx/;
 spf=pass (domain: gmail.com, ip: 209.85.218.45, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ej1-f45.google.com with SMTP id jo4so17598029ejb.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jan 2023 22:35:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iJkAlX5rvKV8SrlDCr5oSfYwolgjDO2OKu7qTCgfJfU=;
        b=mztgCNx/vvKRiBw33d5YXAVMbdozvTTl+viXCFxABCBx2s5ZgIgrmvAM2DQfNYjRko
         irDy9OLL92/55DjEQnP2G2gfa+AzCI/OEzOOfSHkm3P4cXmQQbocKTR4gFI1JcOB9SCe
         P93R5xpMHgSnAwmq8qzdvtjNcFsa0y0Lac0x/cJP8kwxPH90q96d52cYBbniehrCAoCl
         z7Oc0C3ush64FGe+eVVLPNRGx87EnnjwThFXjYwwhL7HfVGRHXDmvMONMbuV2IBQFohj
         T8Q6RosUStJNOQjjPxd7Zib4i82KcmhTkmqN7e/++0SJHxf2Oq+uW8yRGszkJR4yWW6q
         uNFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iJkAlX5rvKV8SrlDCr5oSfYwolgjDO2OKu7qTCgfJfU=;
        b=7we2RMWv9CeHjiASgWk0O2tfDTOYKIPFxmqjpaKn0kvOmo3Rj5dVS/g8bOzAlrNhME
         SkIxN1EwyZZ7Qq95D7Xy/bExU8Tm8/u4O/qE8/UpEjzvF10mDmnSr36gGtVN8Lm5fgcL
         0IZoy1AJ27OJW1ZIjKB9MehSYNGU+j8l+wCjwnU5eBBQ/29pFNaGjjA4gUyUPJEMSvIK
         VcqOQprDDkFePO2tpjebZlreMzqshTcvNMFsRCGEZIDjiJAjY3VBjx3ykSG0S0/o20s2
         SduuIIoHh+2gSAnkJwzj4Ehml8g/X8e5W/k+3NPV19cdVa8zOn46eX7EhDZqBckB6Nkk
         9Svg==
X-Gm-Message-State: AFqh2krS1Gi4BkuOyjcOtGBMZInG2suoMVxic1Qsq568zqaPxx5O0Wcl
	GxnPPa4jpy+pkZRfZNckA7AtGyVM9dEz9osJQbg=
X-Google-Smtp-Source: AMrXdXtqSd6RRQVFV3f41MzIQM5TW9ZVgUDa/g19bQFle1cRVOnsbY1rKgkZG4fJfSHehWfTerL8ZpsifwNEHeaj0Ts=
X-Received: by 2002:a17:907:215b:b0:7c1:1201:603a with SMTP id
 rk27-20020a170907215b00b007c11201603amr3964029ejb.372.1673246147018; Sun, 08
 Jan 2023 22:35:47 -0800 (PST)
MIME-Version: 1.0
References: <20230106144630.23637-1-michal.orzel@amd.com> <20230106144630.23637-3-michal.orzel@amd.com>
In-Reply-To: <20230106144630.23637-3-michal.orzel@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 8 Jan 2023 22:35:34 -0800
Message-ID: <CACMJ4Gb3=QcWy3ZFTca00cnoSGZefK2QdOi=0E+CfMuqhMw8Nw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] xen: Add recipes for stable Xen 4.17 release and
 update master
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bertrand.marquis@arm.com, 
	stefano.stabellini@amd.com, stewart.hildebrand@amd.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000003705bc05f1cefae2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jan 2023 06:35:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7804

--0000000000003705bc05f1cefae2
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 6, 2023 at 6:46 AM Michal Orzel <michal.orzel@amd.com> wrote:

> Add recipes for xen and tools for the newly released 4.17 version and
> take the opportunity to update master recipes.
>
> Reflect 4.17 tools changes in xen-tools.inc:
>  - add test-paging-mempool to test package,
>  - add init-dom0less script to xl package,
>  - add localstatedir to xencommons package (this is needed as from 4.17
>    onwards, there is no /var/lib/xenstored resulting in /var being
>    installed but not shipped in any package).
>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
>

Reviewed-by: Christopher Clark <christopher.w.clark@gmail.com>

thanks
Christopher




> ---
> Changes in v2:
>  - add init-dom0less to xl package
>  - add localstatedir to xencommons package
> ---
>  recipes-extended/xen/xen-tools.inc     |  3 +++
>  recipes-extended/xen/xen-tools_4.17.bb | 19 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_git.bb  |  8 ++++----
>  recipes-extended/xen/xen_4.17.bb       | 19 +++++++++++++++++++
>  recipes-extended/xen/xen_git.bb        |  8 ++++----
>  5 files changed, 49 insertions(+), 8 deletions(-)
>  create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
>  create mode 100644 recipes-extended/xen/xen_4.17.bb
>
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index d47309a72b1c..95da2bfbb6ce 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -616,6 +616,7 @@ FILES:${PN}-xl = "\
>      ${libdir}/xen/bin/libxl-save-helper \
>      ${sbindir}/xl \
>      ${libdir}/xen/bin/xen-init-dom0 \
> +    ${libdir}/xen/bin/init-dom0less \
>      "
>
>  FILES:${PN}-xl-examples = "\
> @@ -658,6 +659,7 @@ FILES:${PN}-xencommons += "\
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${systemd_unitdir}/system/xen-init-dom0.service', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${systemd_unitdir}/system/xenstored.service', '', d)} \
>      ${@bb.utils.contains('DISTRO_FEATURES', 'systemd',
> '${systemd_unitdir}/system/var-lib-xenstored.mount', '', d)} \
> +    ${localstatedir} \
>      "
>
>  FILES:${PN}-xend += " \
> @@ -688,6 +690,7 @@ FILES:${PN}-test += "\
>      ${libdir}/xen/bin/test-resource \
>      ${libdir}/xen/bin/test-cpu-policy \
>      ${libdir}/xen/bin/test-tsx \
> +    ${libdir}/xen/bin/test-paging-mempool \
>      "
>
>  # test-xenstore and test-resource currently only exist in 4.16
> diff --git a/recipes-extended/xen/xen-tools_4.17.bb
> b/recipes-extended/xen/xen-tools_4.17.bb
> new file mode 100644
> index 000000000000..0f323cb32aac
> --- /dev/null
> +++ b/recipes-extended/xen/xen-tools_4.17.bb
> @@ -0,0 +1,19 @@
> +# xen 4.17.0 release sha
> +SRCREV ?= "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
> +
> +XEN_REL ?= "4.17"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
> +    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-tools.inc
> diff --git a/recipes-extended/xen/xen-tools_git.bb b/recipes-extended/xen/
> xen-tools_git.bb
> index a450a7d6574a..fd42cf2963b4 100644
> --- a/recipes-extended/xen/xen-tools_git.bb
> +++ b/recipes-extended/xen/xen-tools_git.bb
> @@ -1,7 +1,7 @@
> -# master status on 2022-04-05
> -SRCREV ?= "14dd241aad8af447680ac73e8579990e2c09c1e7"
> +# master status on 2022-12-29
> +SRCREV ?= "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
>
> -XEN_REL ?= "4.17"
> +XEN_REL ?= "4.18"
>  XEN_BRANCH ?= "master"
>
>  SRC_URI = " \
> @@ -9,7 +9,7 @@ SRC_URI = " \
>      file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
>      "
>
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
>
>  PV = "${XEN_REL}+git${SRCPV}"
>
> diff --git a/recipes-extended/xen/xen_4.17.bb b/recipes-extended/xen/
> xen_4.17.bb
> new file mode 100644
> index 000000000000..f35689d4120f
> --- /dev/null
> +++ b/recipes-extended/xen/xen_4.17.bb
> @@ -0,0 +1,19 @@
> +# xen 4.17.0 release sha
> +SRCREV ?= "11560248ffda3f00f20bbdf3ae088af474f7f2a3"
> +
> +XEN_REL ?= "4.17"
> +XEN_BRANCH ?= "stable-${XEN_REL}"
> +
> +SRC_URI = " \
> +    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH}
> <http://xenbits.xen.org/xen.git;branch=$%7BXEN_BRANCH%7D> \
> +
> file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> \
> +    "
> +
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
> +
> +PV = "${XEN_REL}+stable${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> +
> +require xen.inc
> +require xen-hypervisor.inc
> diff --git a/recipes-extended/xen/xen_git.bb b/recipes-extended/xen/
> xen_git.bb
> index ebd1b76ff420..2138424406f9 100644
> --- a/recipes-extended/xen/xen_git.bb
> +++ b/recipes-extended/xen/xen_git.bb
> @@ -1,7 +1,7 @@
> -# master status on 2022-04-05
> -SRCREV ?= "14dd241aad8af447680ac73e8579990e2c09c1e7"
> +# master status on 2022-12-29
> +SRCREV ?= "7eef80e06ed2282bbcec3619d860c6aacb0515d8"
>
> -XEN_REL ?= "4.17"
> +XEN_REL ?= "4.18"
>  XEN_BRANCH ?= "master"
>
>  SRC_URI = " \
> @@ -9,7 +9,7 @@ SRC_URI = " \
>
>  file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch
> \
>      "
>
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> +LIC_FILES_CHKSUM ?= "file://COPYING;md5=d1a1e216f80b6d8da95fec897d0dbec9"
>
>  PV = "${XEN_REL}+git${SRCPV}"
>
> --
> 2.25.1
>
>

--0000000000003705bc05f1cefae2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 6, 2023 at 6:46 AM Michal=
 Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add =
recipes for xen and tools for the newly released 4.17 version and<br>
take the opportunity to update master recipes.<br>
<br>
Reflect 4.17 tools changes in xen-tools.inc:<br>
=C2=A0- add test-paging-mempool to test package,<br>
=C2=A0- add init-dom0less script to xl package,<br>
=C2=A0- add localstatedir to xencommons package (this is needed as from 4.1=
7<br>
=C2=A0 =C2=A0onwards, there is no /var/lib/xenstored resulting in /var bein=
g<br>
=C2=A0 =C2=A0installed but not shipped in any package).<br>
<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br></blockquote><div><br></div>=
<div>Reviewed-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.cla=
rk@gmail.com">christopher.w.clark@gmail.com</a>&gt;</div><div><br></div><di=
v>thanks</div><div>Christopher</div><div><br></div><div><br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes in v2:<br>
=C2=A0- add init-dom0less to xl package<br>
=C2=A0- add localstatedir to xencommons package<br>
---<br>
=C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 3 +++<b=
r>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a> | 19 +++++++++++++++++++<br=
>
=C2=A0recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a>=C2=A0 |=C2=A0 8 ++++----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0| 19 ++++++++=
+++++++++++<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++=
----<br>
=C2=A05 files changed, 49 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen-tools_4=
.17.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.17.bb=
" rel=3D"noreferrer" target=3D"_blank">xen_4.17.bb</a><br>
<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index d47309a72b1c..95da2bfbb6ce 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -616,6 +616,7 @@ FILES:${PN}-xl =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/libxl-save-helper \<br>
=C2=A0 =C2=A0 =C2=A0${sbindir}/xl \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/xen-init-dom0 \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/init-dom0less \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES:${PN}-xl-examples =3D &quot;\<br>
@@ -658,6 +659,7 @@ FILES:${PN}-xencommons +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;${systemd_unitdir}/system/xen-init-dom0.service&#39;, &#39=
;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;${systemd_unitdir}/system/xenstored.service&#39;, &#39;&#3=
9;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;DISTRO_FEATURES&#39;, &#39;sy=
stemd&#39;, &#39;${systemd_unitdir}/system/var-lib-xenstored.mount&#39;, &#=
39;&#39;, d)} \<br>
+=C2=A0 =C2=A0 ${localstatedir} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES:${PN}-xend +=3D &quot; \<br>
@@ -688,6 +690,7 @@ FILES:${PN}-test +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-resource \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-cpu-policy \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-tsx \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-paging-mempool \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# test-xenstore and test-resource currently only exist in 4.16<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_4.17.bb</a> b/recipes-extended/=
xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"noreferrer" target=3D"_blan=
k">xen-tools_4.17.bb</a><br>
new file mode 100644<br>
index 000000000000..0f323cb32aac<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_4.17.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
@@ -0,0 +1,19 @@<br>
+# xen 4.17.0 release sha<br>
+SRCREV ?=3D &quot;11560248ffda3f00f20bbdf3ae088af474f7f2a3&quot;<br>
+<br>
+XEN_REL ?=3D &quot;4.17&quot;<br>
+XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.git;branch=3D$%7=
BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/xen.gi=
t;branch=3D${XEN_BRANCH}</a> \<br>
+=C2=A0 =C2=A0 file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \<br=
>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897=
d0dbec9&quot;<br>
+<br>
+PV =3D &quot;${XEN_REL}+stable${SRCPV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+require xen.inc<br>
+require xen-tools.inc<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-tools_git.bb</a> b/recipes-extended/x=
en/<a href=3D"http://xen-tools_git.bb" rel=3D"noreferrer" target=3D"_blank"=
>xen-tools_git.bb</a><br>
index a450a7d6574a..fd42cf2963b4 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen-tools_git.bb" rel=3D"noref=
errer" target=3D"_blank">xen-tools_git.bb</a><br>
@@ -1,7 +1,7 @@<br>
-# master status on 2022-04-05<br>
-SRCREV ?=3D &quot;14dd241aad8af447680ac73e8579990e2c09c1e7&quot;<br>
+# master status on 2022-12-29<br>
+SRCREV ?=3D &quot;7eef80e06ed2282bbcec3619d860c6aacb0515d8&quot;<br>
<br>
-XEN_REL ?=3D &quot;4.17&quot;<br>
+XEN_REL ?=3D &quot;4.18&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
@@ -9,7 +9,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch=
 \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5&quot;<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897=
d0dbec9&quot;<br>
<br>
=C2=A0PV =3D &quot;${XEN_REL}+git${SRCPV}&quot;<br>
<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"nor=
eferrer" target=3D"_blank">xen_4.17.bb</a> b/recipes-extended/xen/<a href=
=3D"http://xen_4.17.bb" rel=3D"noreferrer" target=3D"_blank">xen_4.17.bb</a=
><br>
new file mode 100644<br>
index 000000000000..f35689d4120f<br>
--- /dev/null<br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_4.17.bb" rel=3D"noreferrer=
" target=3D"_blank">xen_4.17.bb</a><br>
@@ -0,0 +1,19 @@<br>
+# xen 4.17.0 release sha<br>
+SRCREV ?=3D &quot;11560248ffda3f00f20bbdf3ae088af474f7f2a3&quot;<br>
+<br>
+XEN_REL ?=3D &quot;4.17&quot;<br>
+XEN_BRANCH ?=3D &quot;stable-${XEN_REL}&quot;<br>
+<br>
+SRC_URI =3D &quot; \<br>
+=C2=A0 =C2=A0 git://<a href=3D"http://xenbits.xen.org/xen.git;branch=3D$%7=
BXEN_BRANCH%7D" rel=3D"noreferrer" target=3D"_blank">xenbits.xen.org/xen.gi=
t;branch=3D${XEN_BRANCH}</a> \<br>
+=C2=A0 =C2=A0 file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncur=
ses-location.patch \<br>
+=C2=A0 =C2=A0 &quot;<br>
+<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897=
d0dbec9&quot;<br>
+<br>
+PV =3D &quot;${XEN_REL}+stable${SRCPV}&quot;<br>
+<br>
+S =3D &quot;${WORKDIR}/git&quot;<br>
+<br>
+require xen.inc<br>
+require xen-hypervisor.inc<br>
diff --git a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">xen_git.bb</a> b/recipes-extended/xen/<a href=3D"=
http://xen_git.bb" rel=3D"noreferrer" target=3D"_blank">xen_git.bb</a><br>
index ebd1b76ff420..2138424406f9 100644<br>
--- a/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
+++ b/recipes-extended/xen/<a href=3D"http://xen_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">xen_git.bb</a><br>
@@ -1,7 +1,7 @@<br>
-# master status on 2022-04-05<br>
-SRCREV ?=3D &quot;14dd241aad8af447680ac73e8579990e2c09c1e7&quot;<br>
+# master status on 2022-12-29<br>
+SRCREV ?=3D &quot;7eef80e06ed2282bbcec3619d860c6aacb0515d8&quot;<br>
<br>
-XEN_REL ?=3D &quot;4.17&quot;<br>
+XEN_REL ?=3D &quot;4.18&quot;<br>
=C2=A0XEN_BRANCH ?=3D &quot;master&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
@@ -9,7 +9,7 @@ SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0file://0001-menuconfig-mconf-cfg-Allow-specification-of=
-ncurses-location.patch \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3D419739e325a50f3d7b4501338=
e44a4e5&quot;<br>
+LIC_FILES_CHKSUM ?=3D &quot;file://COPYING;md5=3Dd1a1e216f80b6d8da95fec897=
d0dbec9&quot;<br>
<br>
=C2=A0PV =3D &quot;${XEN_REL}+git${SRCPV}&quot;<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--0000000000003705bc05f1cefae2--

