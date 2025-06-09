Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2907CC61DB2
	for <webhook@archiver.kernel.org>; Mon,  9 Jun 2025 03:44:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
 by mx.groups.io with SMTP id smtpd.web10.51466.1749440687986801435
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Jun 2025 20:44:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mOsvb8Z4;
 spf=pass (domain: gmail.com, ip: 209.85.216.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3116db72bd7so4383441a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Jun 2025 20:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749440687; x=1750045487; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hQB/6HVYGa4iYzTOi182SOhr3UtmEIxis3c6LQxsL1s=;
        b=mOsvb8Z46neWJHQ/6YuRUMkkZgdpzeLAqt1/ktZwjAyKT60CE4qJa94RcQOVN2tSzP
         AlFWyeIsi1L8AGcZtv68b+I+02pSEyn2dWnlwSB75KSmcsBcic9RzaS7zMBq7CvfD7dK
         r/cXjnfJyJ5Ch40KTYoXbcH/8+pbSRPuiII7E7KByIf1/Km0v0eh1ZAZ2iZGaW+Jn/sE
         DE2H/RbmceRvbzz5ufbFOTgW8DqUNkCK119tBhjr7GCSls9I7iVl+rcC3frVlkp4aiHp
         TU+WPgxt16I9MbybQbpKWmtLAcL+no1jK8uyCN5LQM4T1ZGWEssEGQmRMh6HNWvXEqY0
         cGFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749440687; x=1750045487;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hQB/6HVYGa4iYzTOi182SOhr3UtmEIxis3c6LQxsL1s=;
        b=a4lXUovWFlHf7iBwZmhEsiIb3ZblufQw5teEFH7dTDmH/UXOEGl7Mjf9Ee9rix4HH1
         6gyTfgA7tQR+o3YxdITUvCcR9S1frBEF2YWes1+ubKIvtwE0/3GWLU4vZ0dEY7YUur41
         9Asqd596xY9qG7vcZetHNp4mSbSbiFcu9/MlquMVT34UlODcY7d98Cp/Glhfo3Hw/Cgi
         mXKRVmClNcGD+rFzTOjplROFdP+qp1MK8EwtNSOuHDEdxyjdn9BhX8lnkrwznCF2ZIlV
         4/W0khryiW0lirlXpt9wpVb71LVq7vhxwgl0suGC4zClsefe6cnYxvVT05X3pKhnPeyg
         BPmA==
X-Gm-Message-State: AOJu0YyUHQodcm7eIUR0Uwxms7dThYnwohX97LiQO1+G/N1t+kHMx3p2
	ZM7zcUH+q+M6Jy2x3AiM6UaAVHpcg7ONdoR013VCwhILNyytmXKb6c8wKrwmune5w8elW4SW5y1
	qh8RqVugYXywwDwEF9C86M01Mme/0InE=
X-Gm-Gg: ASbGnct51tnlULkVYPIIEdcYaHRZkA/m55RDzUd70Wx5PR3pKdXvVWEr/q0j7FJDADK
	okWyMcdBknEeKxwp6AltfX+/ofEvBr6PeCqoQ6pynINEXVyz1CoPn/H7wi5CqP5o3O/AJuveCq0
	uWviHi2UuKnz+yd5ZQGbLWlAQb/VnVOaHbgA==
X-Google-Smtp-Source: AGHT+IEqs2iggm1fWuyiXmH94t8PnEPs+lMKOEfS6fHy0UDksjFbd5OXLqXqbFyGhkHlxeB3LDSbtLojsb6Dbl1YbSo=
X-Received: by 2002:a17:90b:1dcb:b0:312:639:a064 with SMTP id
 98e67ed59e1d1-3134768d9cbmr16668625a91.28.1749440687196; Sun, 08 Jun 2025
 20:44:47 -0700 (PDT)
MIME-Version: 1.0
References: <18439AD6FDF85A0A.10936@lists.yoctoproject.org> <99f14f26-553a-4a0d-b715-aba7e4367df4@windriver.com>
In-Reply-To: <99f14f26-553a-4a0d-b715-aba7e4367df4@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 Jun 2025 23:44:34 -0400
X-Gm-Features: AX0GCFtNJRylSFEaLB_pgr2lTdYTIuvIXi6dCZX4K1Xyml6KBJVUDZ9T7PD--js
Message-ID: <CADkTA4OA-UNB4CtoV5xUOLa-mL4RxuLXqubudd9R=cDH55XLmA@mail.gmail.com>
Subject: Re: [meta-virtualization][walnascar][master][PATCH] containerd: make
 cni_networking conditional
To: changqing.li@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b74d7206371b6678"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Jun 2025 03:44:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9275

--000000000000b74d7206371b6678
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kindly read my reply to your patch.

I'm not merging this as it currently is.

Bruce

On Sun, Jun 8, 2025 at 9:10=E2=80=AFPM Changqing Li via lists.yoctoproject.=
org <
changqing.li=3Dwindriver.com@lists.yoctoproject.org> wrote:

> Kindly ping
>
> //Changqing
> On 5/28/25 13:48, Changqing Li via lists.yoctoproject.org wrote:
>
> From: Changqing Li <changqing.li@windriver.com> <changqing.li@windriver.c=
om>
>
> make cni_networking conditional, when k3s, k8s is enabled, the
> networking configuration will be provided by the orchestration package,
> containerd-cni is not needed. This is for fix the following error:
> PACKAGE_CLASSES =3D "package_deb"
> do_rootfs failed with error:
> dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubern=
etes-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
> trying to overwrite '/etc/cni/net.d/cni-containerd-net.conflist', which i=
s also in package containerd-cni v2.0.5-r0
>
> Refer [1], "--no-force-overwrite" is set for dpkg, so above error
> occurred.
>
> [1] https://git.openembedded.org/openembedded-core/commit/?id=3Dcb95ba079=
960411775c57ab864d266e15a6292d1
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com> <changqing.li@wi=
ndriver.com>
> ---
>  recipes-containers/containerd/containerd_git.bb      | 2 +-
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-co=
ntainers/containerd/containerd_git.bb
> index c683fbeb..def7591a 100644
> --- a/recipes-containers/containerd/containerd_git.bb
> +++ b/recipes-containers/containerd/containerd_git.bb
> @@ -102,4 +102,4 @@ RDEPENDS:${PN} +=3D " ${VIRTUAL-RUNTIME_container_run=
time}"
>  ## This may need to be made conditional on K3S or similar being
>  ## configured in the distro, since we may have collisions.
>  CNI_NETWORKING_FILES ?=3D "${UNPACKDIR}/cni-containerd-net.conflist"
> -inherit cni_networking
> +inherit_defer ${@bb.utils.contains_any('DISTRO_FEATURES', 'k3s k8s', '',=
 'cni_networking', d)}
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb b/recip=
es-core/packagegroups/packagegroup-container.bb
> index f5e20344..8cbcf28e 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci =3D " \
>  RDEPENDS:packagegroup-containerd =3D " \
>      virtual-containerd \
>      packagegroup-cni \
> -    containerd-cni \
> +    ${@bb.utils.contains_any('DISTRO_FEATURES','k3s k8s','','containerd-=
cni',d)} \
>      nerdctl \
>      tini \
>  "
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9274):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9274
> Mute This Topic: https://lists.yoctoproject.org/mt/113339575/1050810
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

--000000000000b74d7206371b6678
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Kin=
dly read my reply to your patch.</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">I&#39;m not merging this as it currently is.</div><div class=3D"gma=
il_default" style=3D"font-size:small"><br></div><div class=3D"gmail_default=
" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote =
gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Jun 8,=
 2025 at 9:10=E2=80=AFPM Changqing Li via <a href=3D"http://lists.yoctoproj=
ect.org">lists.yoctoproject.org</a> &lt;<a href=3D"http://changqing.li">cha=
ngqing.li</a>=3D<a href=3D"mailto:windriver.com@lists.yoctoproject.org">win=
driver.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#cceed0">
    <p>Kindly ping</p>
    <p>//Changqing<br>
    </p>
    <div>On 5/28/25 13:48, Changqing Li via
      <a href=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoc=
toproject.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.com"=
 target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

make cni_networking conditional, when k3s, k8s is enabled, the
networking configuration will be provided by the orchestration package,
containerd-cni is not needed. This is for fix the following error:
PACKAGE_CLASSES =3D &quot;package_deb&quot;
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernet=
es-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite &#39;/etc/cni/net.d/cni-containerd-net.conflist&#39;, w=
hich is also in package containerd-cni v2.0.5-r0

Refer [1], &quot;--no-force-overwrite&quot; is set for dpkg, so above error
occurred.

[1] <a href=3D"https://git.openembedded.org/openembedded-core/commit/?id=3D=
cb95ba079960411775c57ab864d266e15a6292d1" target=3D"_blank">https://git.ope=
nembedded.org/openembedded-core/commit/?id=3Dcb95ba079960411775c57ab864d266=
e15a6292d1</a>

Signed-off-by: Changqing Li <a href=3D"mailto:changqing.li@windriver.com" t=
arget=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>
---
 recipes-containers/containerd/<a href=3D"http://containerd_git.bb" target=
=3D"_blank">containerd_git.bb</a>      | 2 +-
 recipes-core/packagegroups/<a href=3D"http://packagegroup-container.bb" ta=
rget=3D"_blank">packagegroup-container.bb</a> | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-containers/containerd/<a href=3D"http://containerd_git=
.bb" target=3D"_blank">containerd_git.bb</a> b/recipes-containers/container=
d/<a href=3D"http://containerd_git.bb" target=3D"_blank">containerd_git.bb<=
/a>
index c683fbeb..def7591a 100644
--- a/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" ta=
rget=3D"_blank">containerd_git.bb</a>
+++ b/recipes-containers/containerd/<a href=3D"http://containerd_git.bb" ta=
rget=3D"_blank">containerd_git.bb</a>
@@ -102,4 +102,4 @@ RDEPENDS:${PN} +=3D &quot; ${VIRTUAL-RUNTIME_container_=
runtime}&quot;
 ## This may need to be made conditional on K3S or similar being
 ## configured in the distro, since we may have collisions.
 CNI_NETWORKING_FILES ?=3D &quot;${UNPACKDIR}/cni-containerd-net.conflist&q=
uot;
-inherit cni_networking
+inherit_defer ${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;, &#39;k3s=
 k8s&#39;, &#39;&#39;, &#39;cni_networking&#39;, d)}
diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegroup-cont=
ainer.bb" target=3D"_blank">packagegroup-container.bb</a> b/recipes-core/pa=
ckagegroups/<a href=3D"http://packagegroup-container.bb" target=3D"_blank">=
packagegroup-container.bb</a>
index f5e20344..8cbcf28e 100644
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a>
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" target=3D"_blank">packagegroup-container.bb</a>
@@ -69,7 +69,7 @@ RDEPENDS:packagegroup-oci =3D &quot; \
 RDEPENDS:packagegroup-containerd =3D &quot; \
     virtual-containerd \
     packagegroup-cni \
-    containerd-cni \
+    ${@bb.utils.contains_any(&#39;DISTRO_FEATURES&#39;,&#39;k3s k8s&#39;,&=
#39;&#39;,&#39;containerd-cni&#39;,d)} \
     nerdctl \
     tini \
 &quot;
</pre>
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9274): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9274" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9274</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113339575/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113339575/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000b74d7206371b6678--

