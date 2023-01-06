Return-Path: <christopher.w.clark@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C07EBC3DA7A
	for <webhook@archiver.kernel.org>; Fri,  6 Jan 2023 07:19:08 +0000 (UTC)
Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
 by mx.groups.io with SMTP id smtpd.web10.8705.1672989547908058010
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 05 Jan 2023 23:19:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fjLZuXkl;
 spf=pass (domain: gmail.com, ip: 209.85.208.43, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ed1-f43.google.com with SMTP id m21so1192655edc.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Jan 2023 23:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=A9yFNN+7lBRmCm9oKiboNRA8dvQtRhTTYGSWc1adzA8=;
        b=fjLZuXkl5MA0yJvEBrjrgR8tXdvu8pKt58BCIiS2G2esLDlwLwf5WQ5tdvskqXc0ZH
         hFSEPPBF4oOSR6RZvj+R8wTWEiPsZjFGka6eA68Ng+Oa64r9A0dF8BNZWYIjCLQiw11a
         injClSpIWaLpuk8LrMDAYYrzzWKksHemn+P1Ein1oFyhvnpt8+cF1/EYEm/8XihzdXrF
         wT53EsDtriyLIELMNzPOdkljF4+IFHKQkK22Um/dzoV55uszir+z9W8zP29bX+TFvrOg
         8ATN3a+ysljx3GVh+Iibe58T9mXXU0/a4H/OxB7m0C+mtBRPmj0hF8o/3/AISPStxYTt
         wKIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9yFNN+7lBRmCm9oKiboNRA8dvQtRhTTYGSWc1adzA8=;
        b=az03oT1EOGUl+H9FzRf8UnDKTTaFZ6w2xr1cz9yAAowqYIjofqdsYu6uGSHQJra5UE
         91HDdn/fTIpsI5x5eIBw2BwgYH788gYs1rA8D37jZElVaeoJ4NUXveEXpIQLaGsnXwr5
         MZTEXMrKwbXT5JB0oBVSRMFdZZZsiYqNdzBYpYpD03SWNk0/dSKxRu6fV+EDd4Fp07r1
         0qZogCAuWsNoKzu7LyB3SgAq2nRG37f5jFxdBEgPQkYZaWQLX/crdrQlejkWQTxvZLV4
         fbWfX1MaQ/u/zwqXm00jGJ4PsKctV/w6QekyXfChKIZmdfZFLQzEkPPt/09zvLsdplc/
         bDHg==
X-Gm-Message-State: AFqh2koKR9jwnihrJ5FABhjwMkE/P45YWhO8MNMVcngz+Ofl2sqFOa5P
	g0Z6ABnG69t80PVT0sOi9x87N2NWM6L+iddZKxM=
X-Google-Smtp-Source: AMrXdXtcizfDDbtlrw693bM9xFY0aSuWOWXqsPrKE90aNdNnShq8iEkiR+pehWqKtlKVfyeA9qLmt2aWy+DKl1DzF5U=
X-Received: by 2002:a50:ff09:0:b0:490:47c3:3d71 with SMTP id
 a9-20020a50ff09000000b0049047c33d71mr690953edu.31.1672989546299; Thu, 05 Jan
 2023 23:19:06 -0800 (PST)
MIME-Version: 1.0
References: <20230105135405.10168-1-michal.orzel@amd.com> <20230105135405.10168-3-michal.orzel@amd.com>
In-Reply-To: <20230105135405.10168-3-michal.orzel@amd.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Thu, 5 Jan 2023 23:18:54 -0800
Message-ID: <CACMJ4GZWr8rnsd16QK0BT8yeCuUgfuU6F=e7vWegKRwFEkyJBA@mail.gmail.com>
Subject: Re: [PATCH 2/3 RESEND] xen: Add recipes for stable Xen 4.17 release
 and update master
To: Michal Orzel <michal.orzel@amd.com>
Cc: meta-virtualization@lists.yoctoproject.org, bertrand.marquis@arm.com, 
	stefano.stabellini@amd.com, stewart.hildebrand@amd.com, 
	bruce.ashfield@gmail.com
Content-Type: multipart/alternative; boundary="0000000000009ec41505f1933bd3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 06 Jan 2023 07:19:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7794

--0000000000009ec41505f1933bd3
Content-Type: text/plain; charset="UTF-8"

On Thu, Jan 5, 2023 at 5:54 AM Michal Orzel <michal.orzel@amd.com> wrote:

> Add recipes for xen and tools for the newly released 4.17 version and
> take the opportunity to update master recipes.
>

Thanks for taking this on, Michal.


>
> Reflect 4.17 tools changes in xen-tools.inc:
>  - add test-paging-mempool to test package,
>  - add a new package init-dom0less that contains init-dom0less script,
>

This tool requires control domain privileges and it depends upon several
Xen libraries including libxl, so would it be better to just include in the
standard xl package, alongside the existing xen-init-dom0?

If it does belong in a new separate package, would it make sense for any of
the existing packages to RRECOMMEND it, to ensure that it gets installed
where it is expected to be present?


>  - add localstatedir to dev package.
>

(I've replied to your comment about localstatedir below.)


>
> Signed-off-by: Michal Orzel <michal.orzel@amd.com>
> ---
> Adding localstatedir to dev package is a little quirk just to keep the old
> behavior unchanged and silence Yocto installed-but-not-shipped error.
> The reason being, 4.17 onwards removed /var/lib/xenstored as it is mostly
> unused. This leaves the build with empty /var and /var/lib. There are other
> possible ways to handle this problem. We could remove the complete
> localstatedir
> while removing installed volatiles or add some checks for the version.
> Suggestions are welcomed.
>

In the same xen-tools.inc file, there is a reference to var-lib-xenstored
in the SYSTEMD_SERVICE declaration for the xencommons package, so: would it
make more sense to add localstatedir to xencommons, which is typically
installed in the control domain, rather than the dev package, which is not?
That should handle the case where there does happen to be a runtime
dependency in the Xen tools on the presence of a /var/lib directory.



> ---
>  recipes-extended/xen/xen-tools.inc     |  8 ++++++++
>  recipes-extended/xen/xen-tools_4.17.bb | 19 +++++++++++++++++++
>  recipes-extended/xen/xen-tools_git.bb  |  8 ++++----
>  recipes-extended/xen/xen_4.17.bb       | 19 +++++++++++++++++++
>  recipes-extended/xen/xen_git.bb        |  8 ++++----
>  5 files changed, 54 insertions(+), 8 deletions(-)
>  create mode 100644 recipes-extended/xen/xen-tools_4.17.bb
>  create mode 100644 recipes-extended/xen/xen_4.17.bb
>
> diff --git a/recipes-extended/xen/xen-tools.inc
> b/recipes-extended/xen/xen-tools.inc
> index d47309a72b1c..1a422255014e 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -212,6 +212,7 @@ PACKAGES = " \
>      ${PN}-test \
>      ${PN}-xen-vmtrace \
>      ${PN}-xen-mceinj \
> +    ${PN}-init-dom0less \
>      "
>
>  PROVIDES =+ " \
> @@ -245,6 +246,7 @@ FILES:${PN}-dbg += "\
>
>  FILES:${PN}-dev = "\
>      ${includedir} \
> +    ${localstatedir} \
>      "
>
>  FILES:${PN}-doc = "\
> @@ -688,6 +690,7 @@ FILES:${PN}-test += "\
>      ${libdir}/xen/bin/test-resource \
>      ${libdir}/xen/bin/test-cpu-policy \
>      ${libdir}/xen/bin/test-tsx \
> +    ${libdir}/xen/bin/test-paging-mempool \
>      "
>
>  # test-xenstore and test-resource currently only exist in 4.16
> @@ -708,6 +711,11 @@ FILES:${PN}-xen-vmtrace +="\
>  # xen-vmtrace is only built for x86 4.16, so allow empty package
>  ALLOW_EMPTY:${PN}-xen-vmtrace = "1"
>
> +FILES:${PN}-init-dom0less += "${libdir}/xen/bin/init-dom0less"
>

All the existing FILES:${PN} definitions are sorted alphabetically, so when
adding a new one, please could you insert it at the correct point -- which
would be after FILES:${PN}-hvmloader in this case.

thanks,
Christopher




> +
> +# init-dom0less is only built for Arm 4.17, so allow empty package
> +ALLOW_EMPTY:${PN}-init-dom0less = "1"
> +
>  INSANE_SKIP:${PN} = "already-stripped"
>
>  # configure init.d scripts
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

--0000000000009ec41505f1933bd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Thu, Jan 5, 2023 at 5:54 AM Michal Orz=
el &lt;<a href=3D"mailto:michal.orzel@amd.com">michal.orzel@amd.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Add reci=
pes for xen and tools for the newly released 4.17 version and<br>
take the opportunity to update master recipes.<br></blockquote><div><br></d=
iv><div>Thanks for taking this on, Michal.</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
<br>
Reflect 4.17 tools changes in xen-tools.inc:<br>
=C2=A0- add test-paging-mempool to test package,<br>
=C2=A0- add a new package init-dom0less that contains init-dom0less script,=
<br></blockquote><div><br></div><div>This tool requires control domain priv=
ileges and it depends upon several Xen libraries including libxl, so would =
it be better to just include in the standard xl package, alongside the exis=
ting xen-init-dom0?</div><div><br></div><div>If it does belong in a new sep=
arate package, would it make sense for any of the existing packages to RREC=
OMMEND it, to ensure that it gets installed where it is expected to be pres=
ent?</div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
=C2=A0- add localstatedir to dev package.<br></blockquote><div><br></div><d=
iv>(I&#39;ve replied to your comment about localstatedir below.)<br></div><=
div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Michal Orzel &lt;<a href=3D"mailto:michal.orzel@amd.com" tar=
get=3D"_blank">michal.orzel@amd.com</a>&gt;<br>
---<br>
Adding localstatedir to dev package is a little quirk just to keep the old<=
br>
behavior unchanged and silence Yocto installed-but-not-shipped error.<br>
The reason being, 4.17 onwards removed /var/lib/xenstored as it is mostly<b=
r>
unused. This leaves the build with empty /var and /var/lib. There are other=
<br>
possible ways to handle this problem. We could remove the complete localsta=
tedir<br>
while removing installed volatiles or add some checks for the version.<br>
Suggestions are welcomed.<br></blockquote><div><br></div><div>In the same x=
en-tools.inc file, there is a reference to var-lib-xenstored in the SYSTEMD=
_SERVICE declaration for the xencommons package, so: would it make more sen=
se to add localstatedir to xencommons, which is typically installed in the =
control domain, rather than the dev package, which is not? That should hand=
le the case where there does happen to be a runtime dependency in the Xen t=
ools on the presence of a /var/lib directory.</div><div><br></div><div>=C2=
=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0recipes-extended/xen/xen-tools.inc=C2=A0 =C2=A0 =C2=A0|=C2=A0 8 +++++=
+++<br>
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
=C2=A05 files changed, 54 insertions(+), 8 deletions(-)<br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen-tools_4=
.17.bb" rel=3D"noreferrer" target=3D"_blank">xen-tools_4.17.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.17.bb=
" rel=3D"noreferrer" target=3D"_blank">xen_4.17.bb</a><br>
<br>
diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-=
tools.inc<br>
index d47309a72b1c..1a422255014e 100644<br>
--- a/recipes-extended/xen/xen-tools.inc<br>
+++ b/recipes-extended/xen/xen-tools.inc<br>
@@ -212,6 +212,7 @@ PACKAGES =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-test \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xen-vmtrace \<br>
=C2=A0 =C2=A0 =C2=A0${PN}-xen-mceinj \<br>
+=C2=A0 =C2=A0 ${PN}-init-dom0less \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0PROVIDES =3D+ &quot; \<br>
@@ -245,6 +246,7 @@ FILES:${PN}-dbg +=3D &quot;\<br>
<br>
=C2=A0FILES:${PN}-dev =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${includedir} \<br>
+=C2=A0 =C2=A0 ${localstatedir} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0FILES:${PN}-doc =3D &quot;\<br>
@@ -688,6 +690,7 @@ FILES:${PN}-test +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-resource \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-cpu-policy \<br>
=C2=A0 =C2=A0 =C2=A0${libdir}/xen/bin/test-tsx \<br>
+=C2=A0 =C2=A0 ${libdir}/xen/bin/test-paging-mempool \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0# test-xenstore and test-resource currently only exist in 4.16<br>
@@ -708,6 +711,11 @@ FILES:${PN}-xen-vmtrace +=3D&quot;\<br>
=C2=A0# xen-vmtrace is only built for x86 4.16, so allow empty package<br>
=C2=A0ALLOW_EMPTY:${PN}-xen-vmtrace =3D &quot;1&quot;<br>
<br>
+FILES:${PN}-init-dom0less +=3D &quot;${libdir}/xen/bin/init-dom0less&quot;=
<br></blockquote><div><br></div><div>All the existing FILES:${PN} definitio=
ns are sorted alphabetically, so when adding a new one, please could you in=
sert it at the correct point -- which would be after FILES:${PN}-hvmloader =
in this case.<br></div><div><br></div><div>thanks,<br></div><div><div>Chris=
topher</div><div><br></div></div><div><br></div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">
+<br>
+# init-dom0less is only built for Arm 4.17, so allow empty package<br>
+ALLOW_EMPTY:${PN}-init-dom0less =3D &quot;1&quot;<br>
+<br>
=C2=A0INSANE_SKIP:${PN} =3D &quot;already-stripped&quot;<br>
<br>
=C2=A0# configure init.d scripts<br>
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

--0000000000009ec41505f1933bd3--

