Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6383E7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 03:45:31 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.40036.1735443927189549659
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 19:45:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hvigjQsy;
 spf=pass (domain: gmail.com, ip: 209.85.216.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ef28f07dbaso8263385a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 19:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735443926; x=1736048726; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UODytdwGXG61paxaYZ+nWZvfC0PY/NsdATr+fGWF23Q=;
        b=hvigjQsyNUmSwiAP3Z1N7+nagJ8Cyy3W6DdZU1NTR+33A+ueDC+aRiZ77O57+STUEx
         mY6a7EhN+cckOyXWDZ351uFp1A96IqATcsxX0ceAqC51neYoa3876rwh64DSeZ4b8Ru7
         g1DCdBRqSjiXvGMgdnaeSZ5Hl0/E+9hhduy+rlWIuk11+RVNxDXxF7mxY2D/fo/zJXdU
         S+01LySQ6W6PbZB4NYWjf97L3RyDxKm8e0H6Ui1ESXve1MNyCvNkeQ0uYgQkUli0jlHL
         HQ62VnJpGm+wD/4tOZysZxIRKNnsUE50qNyHJshBPYuVT0XVGBWela2didpjIRv7yUKP
         eKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735443926; x=1736048726;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UODytdwGXG61paxaYZ+nWZvfC0PY/NsdATr+fGWF23Q=;
        b=mszZ6DRTkTTBWj2drma+ROUdwGLtQi7t0zlcUacuqLAnyB0lBfd6ZajmQJek78Q7z4
         Fp51aV13gTwrRMT+OW7tRVrGnKR/yLhvAkrgRReXE3H+9NtV6mJvXEaQjk7IXR4I/d2w
         vJU8MKX2zu7FXCCP8Ak/ymD6yTkLiJIfJc7GH8rOUNB9cYRWRQ8/pQXDOL1gj2HKqnaT
         CwJ31+TOx52+UMYNeScx7p/uXD3hyPLZcWFS+T7NP8MxmBhHF/zUj4H9u/wDhOkP3bfb
         1SUZk5ryWUrNRTllr+X9ohdg1ECWE00z3FWosbs4X+DOx6+93TmCPePE0Q6K32WMV0rJ
         KjFA==
X-Gm-Message-State: AOJu0YzWM22MJjfkczmLELp+I5QVpSaZTa3PVRqEJbt+JVAOv9IEPWy4
	xihkvhgaLqPtHW7LW2wYISi2Ie7g0DfeopLrelxwUREANGYxY/PMYgD9hfSdJGGvm+wC3bf0/de
	sHdyfJ7u6S9lXnviwQ5t9v438dqc=
X-Gm-Gg: ASbGncuyDywO2EqtWSjfrQNTb4KSxbs6TjhfMLgHX3k5g3FnGF5HXbt0YqGQhBZBI+u
	/DmezFBb9GJ3CqdSFmansyL4Y3uipgUa4lLm7Jw==
X-Google-Smtp-Source: AGHT+IEd7sZlFWhtb9qtC2IlmWkSs8hs5S9TmdHpQIef97wqceYf7Z+Pm99RKaYAQXWPHRv2dJKkG1xczKJILKmFxB8=
X-Received: by 2002:a17:90a:c2ce:b0:2ee:4513:f1d1 with SMTP id
 98e67ed59e1d1-2f452eb24b8mr43158587a91.23.1735443926521; Sat, 28 Dec 2024
 19:45:26 -0800 (PST)
MIME-Version: 1.0
References: <20241228090210.695265-1-hongxu.jia@windriver.com>
In-Reply-To: <20241228090210.695265-1-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Dec 2024 22:45:15 -0500
Message-ID: <CADkTA4OBXESTxvdw4PQX0FK8g8NG37KjioaP3xz4jcZ5nE4yuA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] packagegroup-container: inherit goarch.bbclass
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000c49f3b062a6086ef"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Dec 2024 03:45:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9067

--000000000000c49f3b062a6086ef
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 4:02=E2=80=AFAM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> The go related recipe (such as docker-moby, podman) inherited
> goarch.bbclass in which centralize definition of COMPATIBLE_HOST
>
> Due to the packagegroup runtime depends on these go related recipes,
> inherits goarch.bbclass to apply the same COMPATIBLE_HOST
>
> $ echo "MACHINE =3D 'qemuppc'" >> conf/local.conf
> $ bitbake world
> ERROR: Nothing RPROVIDES 'podman' (but
> meta-virtualization/recipes-core/packagegroups/packagegroup-container.bb
> RDEPENDS on or otherwise requires it)
> podman was skipped: incompatible with host powerpc-wrs-linux (not in
> COMPATIBLE_HOST)
> NOTE: Runtime target 'podman' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['podman']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'packagegroup-container', 'podman']
>

Is this also happening for supported architectures ? It may be that you
picked a bad example, but these recipes are absolutely not supported for
ppc, so I'd expect them to fail.

Bruce



>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-core/packagegroups/packagegroup-container.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-core/packagegroups/packagegroup-container.bb
> b/recipes-core/packagegroups/packagegroup-container.bb
> index 21402d65..3e2d2a25 100644
> --- a/recipes-core/packagegroups/packagegroup-container.bb
> +++ b/recipes-core/packagegroups/packagegroup-container.bb
> @@ -2,7 +2,7 @@ SUMMARY =3D "All packages for container host"
>  LICENSE =3D "MIT"
>  LIC_FILES_CHKSUM =3D
> "file://${COMMON_LICENSE_DIR}/MIT;md5=3D0835ade698e0bcf8506ecda2f7b4f302"
>
> -inherit packagegroup
> +inherit packagegroup goarch
>
>  COMPATIBLE_HOST =3D "^(?!(mips|riscv)).*"
>
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9063):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9063
> Mute This Topic: https://lists.yoctoproject.org/mt/110315544/1050810
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

--000000000000c49f3b062a6086ef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 28, 2024 at 4:02=
=E2=80=AFAM hongxu via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists=
.yoctoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">The go related r=
ecipe (such as docker-moby, podman) inherited<br>
goarch.bbclass in which centralize definition of COMPATIBLE_HOST<br>
<br>
Due to the packagegroup runtime depends on these go related recipes,<br>
inherits goarch.bbclass to apply the same COMPATIBLE_HOST<br>
<br>
$ echo &quot;MACHINE =3D &#39;qemuppc&#39;&quot; &gt;&gt; conf/local.conf<b=
r>
$ bitbake world<br>
ERROR: Nothing RPROVIDES &#39;podman&#39; (but meta-virtualization/recipes-=
core/packagegroups/<a href=3D"http://packagegroup-container.bb" rel=3D"nore=
ferrer" target=3D"_blank">packagegroup-container.bb</a> RDEPENDS on or othe=
rwise requires it)<br>
podman was skipped: incompatible with host powerpc-wrs-linux (not in COMPAT=
IBLE_HOST)<br>
NOTE: Runtime target &#39;podman&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;podman&#39;]<br>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 &#39;packagegroup-container&#39;, &#39;podman&#39;]<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">Is thi=
s also happening for supported architectures ? It may be that you picked a =
bad example, but these recipes are absolutely not supported for ppc, so I&#=
39;d expect them to fail.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>Bruce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a> | 2 +=
-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-core/packagegroups/<a href=3D"http://packagegroup-cont=
ainer.bb" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a=
> b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.bb"=
 rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
index 21402d65..3e2d2a25 100644<br>
--- a/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
+++ b/recipes-core/packagegroups/<a href=3D"http://packagegroup-container.b=
b" rel=3D"noreferrer" target=3D"_blank">packagegroup-container.bb</a><br>
@@ -2,7 +2,7 @@ SUMMARY =3D &quot;All packages for container host&quot;<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://${COMMON_LICENSE_DIR}/MIT;md5=3D083=
5ade698e0bcf8506ecda2f7b4f302&quot;<br>
<br>
-inherit packagegroup<br>
+inherit packagegroup goarch<br>
<br>
=C2=A0COMPATIBLE_HOST =3D &quot;^(?!(mips|riscv)).*&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9063): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9063" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9063</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110315544/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110315544/1050810</a><br>
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
rek II<br><br></div></div>

--000000000000c49f3b062a6086ef--

