Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50F10C677C4
	for <webhook@archiver.kernel.org>; Wed, 11 Jun 2025 12:41:18 +0000 (UTC)
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
 by mx.groups.io with SMTP id smtpd.web10.6741.1749645669839845763
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 11 Jun 2025 05:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=g51S6xLF;
 spf=pass (domain: gmail.com, ip: 209.85.215.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-b2fca9d7872so427939a12.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 05:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749645669; x=1750250469; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZidCJ3EScGUegNzlA0Go7y0Cmj5bZ6wJEMtJa1uDKEY=;
        b=g51S6xLFp8h7/lMfjXI0j6ZU0YUFZ8bBNkbUiwFyxzsOxGmbiZ+A3AycdU/OtXCmtK
         AntT1tPTpfqK7VLyFCQPesYbYkNTw773MkzgKxfPSeXcOpm57OJ6fTWGgLi9GaFw93jV
         jDFduEyp3SHCt1vgyU2E39jh14HvbLW1SIxr9tT8qIl4n9ZbXc8mD7DJ55mti9/t4dwc
         2X6PCGNQfXJq3xlMPIi+AIZXVOdrdKYIxJwoCEavZnk778xz4qJOVaA3l+BWYd/WMplB
         /VkXskQUixda6BEAxMlArvYSkyfrImnq3kVi8NGBHrI8Ggg3vCBsDR0uam7mLrHPCvRy
         daUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749645669; x=1750250469;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZidCJ3EScGUegNzlA0Go7y0Cmj5bZ6wJEMtJa1uDKEY=;
        b=quNmf6GkiOA9OyGV3wsIymFxsZSubUnirKo1xDoSYsEsPzin5xKRVyf/jDVRQIuBd2
         CmEeinbFaRKtFt5KIaOBlY0f82jisJzWBW7sD4JRrBOgbFXrujpxSjwQowO9eSxnov9C
         JHeSSBYWAz40Tn5xhsTBEdeN906do3SbRXuECnAsMzEK5sf8cdjt1cGDyYrsTxiyevyb
         5MwqEeuxcu/btXemV6qTQrOClvpYJchOdWmIoR3C/hxKA1XFMOY2XVJj2h1WLqryKPGR
         XpC0mdvNztdcJsAmgGRNSb399rRx3NCdZVg32QQkf3Oih9oA+GTDLQOMzqNGAQxNx89v
         F3UA==
X-Gm-Message-State: AOJu0YxBGU1nGIVYwPZ0+eC8e45gwP09Vl3uemFXH2pa1kCul/4ZWZaW
	EMGRtvr9KsvUEAs/Zw5J90u8UGQnT1xN9unTFuwKPCnl12pQRntdfOtbaOFEARAxmUJK/e+2ahc
	40/d33rN+R/5uGL4zS9ycAIoHZyIW1/A=
X-Gm-Gg: ASbGncs1Xw3XXC4+IApgRLdYqRd+1OW+jxmioPRfDh9pDWOyhZzP4NsTw1kIkr57yfR
	L3XstMtT7AcGSDrzUcOi1GmjvWinaytJ6yOQVlggyW/CVu/qNhqumBDGqmKBP0sm2KI/cAqY6By
	Zm5I8Y3YFuUwcxheyXw3kikogu9sRAVwq1hO4wquXalZU=
X-Google-Smtp-Source: AGHT+IFpXa/MRoGgmH7p3AUxwhijVEVtby9NyZW/HIVC0jQ1ae5DlkyzIQQ9LxtKcTYHHzLosAJxyMmxR8klRsCJERM=
X-Received: by 2002:a17:90b:2808:b0:311:baa0:89ca with SMTP id
 98e67ed59e1d1-313af22d4b8mr4009634a91.34.1749645668933; Wed, 11 Jun 2025
 05:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <20250528054841.2516534-1-changqing.li@windriver.com>
 <aEEBBxb7NxcvPnxo@gmail.com> <65f0132d-1bba-4a61-b726-0b3dfd651af0@windriver.com>
In-Reply-To: <65f0132d-1bba-4a61-b726-0b3dfd651af0@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 11 Jun 2025 08:40:57 -0400
X-Gm-Features: AX0GCFu2imKp906eCZMsG-CT0kVn_5KtKSTG-8DNLKgAJuhsUC6v3_BH7fFi4uU
Message-ID: <CADkTA4PaaSfwFtxDKpdvanWvO3mY0SihWD3oUeTpwdXCp0745Q@mail.gmail.com>
Subject: Re: [meta-virtualization][walnascar][master][PATCH] containerd: make
 cni_networking conditional
To: Changqing Li <changqing.li@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000094652b06374b2041"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Jun 2025 12:41:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9279

--00000000000094652b06374b2041
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 3:19=E2=80=AFAM Changqing Li <changqing.li@windrive=
r.com>
wrote:

>
> On 6/5/25 10:29, Bruce Ashfield wrote:
>
> CAUTION: This email comes from a non Wind River email account!
> Do not click links or open attachments unless you recognize the sender an=
d know the content is safe.
>
> In message: [meta-virtualization][walnascar][master][PATCH] containerd: m=
ake cni_networking conditional
> on 28/05/2025 Changqing Li via lists.yoctoproject.org wrote:
>
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
> We shouldn't need to do this to fix the package install. Whether we need
> to do it to make sure networking configurations don't conflict is a separ=
ate
> question (and one that we need more information to decide on).
>
> The design of the cni_networking is to allow co-existence of packages
> that need to configure cni networking. So we don't have to do what
> you've tried to do in this patch.
>
> Let's rename the files referenced in CNI_NETWORKING_FILES to something
> more specific to the kubernetes packages and then they can both be
> installed at the same time.
>
> That's one patch.
>
> If you can show me that the two networking configurations being installed
> at the same time cause issues, we can then do the coordination betwen
> the packages similarly to what you are doing here in a second, separate
> patch.
>
> Bruce
>
> Hi, Bruce
>
> Sorry,  I did not notice this mail before.
>
> According to kubernetes doc:
>
> "If there are multiple CNI configuration files in the directory, the
> kubelet uses the configuration file that comes first by name in
> lexicographic order."
>
> Now,  both containerd-cni and kubernetes-cni use name
> cni-containerd-net.conflist.
>
> How about keep containerd-cni use name cni-containerd-net.conflist, and
> let kubernetes-cni use 00_cni-containerd-net.conflist, so that
> configuration in kubernetes-cni
>
> will be used if both package installed?
>
>
That would be a fine solution!

Bruce


Regards
>
> //Changqing
>
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
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9261): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/9261
> Mute This Topic: https://lists.yoctoproject.org/mt/113339575/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000094652b06374b2041
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 11, 2025 at 3:19=
=E2=80=AFAM Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.com">=
changqing.li@windriver.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><u></u>

 =20
  <div bgcolor=3D"#cceed0">
    <p><br>
    </p>
    <div>On 6/5/25 10:29, Bruce Ashfield wrote:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

In message: [meta-virtualization][walnascar][master][PATCH] containerd: mak=
e cni_networking conditional
on 28/05/2025 Changqing Li via <a href=3D"http://lists.yoctoproject.org" ta=
rget=3D"_blank">lists.yoctoproject.org</a> wrote:

</pre>
      <blockquote type=3D"cite">
        <pre>From: Changqing Li <a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank">&lt;changqing.li@windriver.com&gt;</a>

make cni_networking conditional, when k3s, k8s is enabled, the
networking configuration will be provided by the orchestration package,
containerd-cni is not needed. This is for fix the following error:
PACKAGE_CLASSES =3D &quot;package_deb&quot;
do_rootfs failed with error:
dpkg: error processing archive /path/to/oe-rootfs-repo/corei7-64/./kubernet=
es-cni_v1.32.0+git0+5fe148234f_release-r0.deb (--unpack):
trying to overwrite &#39;/etc/cni/net.d/cni-containerd-net.conflist&#39;, w=
hich is also in package containerd-cni v2.0.5-r0
</pre>
      </blockquote>
      <pre>We shouldn&#39;t need to do this to fix the package install. Whe=
ther we need
to do it to make sure networking configurations don&#39;t conflict is a sep=
arate
question (and one that we need more information to decide on).

The design of the cni_networking is to allow co-existence of packages
that need to configure cni networking. So we don&#39;t have to do what
you&#39;ve tried to do in this patch.

Let&#39;s rename the files referenced in CNI_NETWORKING_FILES to something
more specific to the kubernetes packages and then they can both be
installed at the same time.

That&#39;s one patch.

If you can show me that the two networking configurations being installed
at the same time cause issues, we can then do the coordination betwen
the packages similarly to what you are doing here in a second, separate
patch.

Bruce</pre>
    </blockquote>
    <p>Hi, Bruce</p>
    <p>Sorry,=C2=A0 I did not notice this mail before.=C2=A0</p>
    <p>According to kubernetes doc:</p>
    <p>&quot;If there are multiple CNI configuration files in the directory=
,
      the kubelet uses the configuration file that comes first by name
      in lexicographic order.&quot;</p>
    <p>Now,=C2=A0 both <span style=3D"white-space:pre-wrap">containerd-cni =
and </span><span style=3D"white-space:pre-wrap">kubernetes-cni  use name cn=
i-containerd-net.conflist.</span></p>
    <p><span style=3D"white-space:pre-wrap">How about keep </span><span sty=
le=3D"white-space:pre-wrap">containerd-cni use </span><span style=3D"white-=
space:pre-wrap">name cni-containerd-net.conflist, and let </span><span styl=
e=3D"white-space:pre-wrap">kubernetes-cni use 00_</span><span style=3D"whit=
e-space:pre-wrap"></span><span style=3D"white-space:pre-wrap">cni-container=
d-net.conflist,  so that configuration in </span><span style=3D"white-space=
:pre-wrap">kubernetes-cni</span></p>
    <p><span style=3D"white-space:pre-wrap">will be used if both package in=
stalled? </span></p>
    <p><span style=3D"white-space:pre-wrap"></span></p></div></blockquote><=
div><br></div><div><div class=3D"gmail_default" style=3D"font-size:small">T=
hat would be a fine solution!</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">Bruce</div><br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex"><div bgcolor=3D"#cceed0"><p><span style=3D"white-space:pre-=
wrap">
</span></p>
    <p><span style=3D"white-space:pre-wrap">Regards</span></p>
    <p><span style=3D"white-space:pre-wrap">//Changqing
</span></p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>Refer [1], &quot;--no-force-overwrite&quot; is set for dpkg, s=
o above error
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
--
2.34.1

</pre>
      </blockquote>
      <pre></pre>
      <blockquote type=3D"cite">
        <pre>-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
Links: You receive all messages sent to this group.
View/Reply Online (#9261): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9261" target=3D"_blank">https://lists.yoctoproject.=
org/g/meta-virtualization/message/9261</a>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113339575/105=
0810" target=3D"_blank">https://lists.yoctoproject.org/mt/113339575/1050810=
</a>
Group Owner: <a href=3D"mailto:meta-virtualization+owner@lists.yoctoproject=
.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org</a=
>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" target=3D"_blank">https://lists.yoctoproject.org/g/meta-virtualiza=
tion/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blan=
k">bruce.ashfield@gmail.com</a>]
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-

</pre>
      </blockquote>
      <pre></pre>
    </blockquote>
  </div>

</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--00000000000094652b06374b2041--

