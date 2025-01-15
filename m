Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EECCC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:04:43 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.21566.1736949882318853981
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 06:04:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fuzEyA83;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f13acbe29bso1477958a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736949882; x=1737554682; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9XLiAMRVaF3hJ0V545s4WsoUKMX4vi+eptpTdfnz0HU=;
        b=fuzEyA832pdJkz44WvPU+Yaee4slgAEQ3thMzecyXQGXu2SMsIYmKA1f3xZqGwFLYJ
         YExGtGocDsLeYXHJI0d/nS1SxqpNvTYzmScTH48Dm+2llbjoLc6IpcGurBo6MszzS2ma
         964pXS6eeN+GV8UTGjL++jFhbPyVjz2nqGyqDI7TuaCq5IjS8kN7G1cL3FkaSa4JiUIS
         zMPFoL3Gj/MsnEJ5mxiEqGs6c2tWTDAp5tI3VRGVGztrvltdBIDAe6XjZR368wmCO93I
         I3PmPzIy72NxQZ/5Onr4/vibxk4MaxXZIjUN77W+Tz18kvQGCZuBSuzTUZG41maQ/MQO
         QgRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949882; x=1737554682;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9XLiAMRVaF3hJ0V545s4WsoUKMX4vi+eptpTdfnz0HU=;
        b=E/kcNTMrmp1E8WN8XKBTu/uMSHv/IO4lp+XqJOT/v/JBRiGgYLCVtywUNb8zpa+WCw
         b7G8aQAQESX/iZgas0IsDHaMaAnbaBpwKsxGtOIwChg9uS6E1Apl/9MhUaljEwjnEJ2a
         iWnFJF0eBtUFlu4kBKL3JXCaNv9N4i9OV5WO5IPpzIDmb2M/IiTmnguKix37g5K0BXVl
         yY97KYkIVhFbKYTjvS6zhVdHsW/Fzc+QlcdfNMJospwvXJEUD//F0Y2My6AsnFLmv9D9
         gE/lOduhpj+K4pZRIWNAI2Xoq3bQQUinZRJgdJ9dASG5p30lWUA8WUVVBY6HZVhglnJC
         Dobw==
X-Gm-Message-State: AOJu0Yy90g5T2b+4GhU873ibQ/adWvwrrW3LKDE/aFjnySd5BGGeDWTD
	xwu7WfOqKWIohC+o1b0WfUQNk5Ravq09nt0BpoMpFnEJOCa2e6ksNakue1zw3Tk9l4jQyNSEtkz
	ONKryZXUgRCz3C2uxg5JGlBaLhF5R87yW3g0=
X-Gm-Gg: ASbGncs3gb7dQ7qcdNQ5CaffyoQ0lYdW5QDYcWUMKImJrL3sOcPpzZMEggJ+UqgGbjk
	3B3nkjjBNEHJ/O3kcKMlwcDDsSLbCaxa6qzVS8Wc=
X-Google-Smtp-Source: AGHT+IECi6rOtX2nbLE5oY4Iz/GEWs+WVyMnmyo7/B4oCdrjMtxJ36+7AE07iva8IeavDmjeUwBPYYlZkmmtfZUxYdo=
X-Received: by 2002:a17:90b:1a81:b0:2ef:7be8:e987 with SMTP id
 98e67ed59e1d1-2f728e4841cmr4683007a91.12.1736949881668; Wed, 15 Jan 2025
 06:04:41 -0800 (PST)
MIME-Version: 1.0
References: <20250115054639.1079705-1-Qi.Chen@windriver.com> <20250115054639.1079705-3-Qi.Chen@windriver.com>
In-Reply-To: <20250115054639.1079705-3-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 09:04:30 -0500
X-Gm-Features: AbW1kvZFANHB6iD0dVVe0jgRCxN5HvaADarnB5_kFSlJ2j0GuDfmAzMvXkxPWpA
Message-ID: <CADkTA4Ooo+NWK9EwPOY5A=2E_C1QDGW4O_BR1_7pEEjk_sABdQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/4] cri-o: fix already-stripped QA
 issue and clean up
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b09041062bbf2850"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 14:04:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9089

--000000000000b09041062bbf2850
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Patches 3 and 4 look good to me.

I'll put them onto my under-test queue and let you know if they need to be
rebased for any of my pending package updates.

Bruce

On Wed, Jan 15, 2025 at 12:47=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Set DEBUG=3D1 to avoid stripping.
> See https://github.com/cri-o/cri-o/blob/main/Makefile#L93
>
> Set STRIP=3Dtrue to avoid stripping bin/pinns.
> See https://github.com/cri-o/cri-o/blob/main/pinns/Makefile#L4
>
> ALLOW_EMPTY:${PN} =3D "1" is not needed. Remove it.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/cri-o/cri-o_git.bb | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/recipes-containers/cri-o/cri-o_git.bb
> b/recipes-containers/cri-o/cri-o_git.bb
> index 5c2c453e..10c811fe 100644
> --- a/recipes-containers/cri-o/cri-o_git.bb
> +++ b/recipes-containers/cri-o/cri-o_git.bb
> @@ -60,7 +60,7 @@ inherit goarch
>  inherit pkgconfig
>  inherit container-host
>
> -EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
> +EXTRA_OEMAKE =3D "BUILDTAGS=3D'' DEBUG=3D1 STRIP=3Dtrue"
>
>  do_compile() {
>         set +e
> @@ -115,15 +115,13 @@ do_install_ptest() {
>      cp -rf ${S}/src/import/test ${D}${PTEST_PATH}
>      cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}
>  }
> +
>  FILES:${PN}-config =3D "${sysconfdir}/crio/config/*"
>  FILES:${PN} +=3D "${systemd_unitdir}/system/*"
>  FILES:${PN} +=3D "/usr/local/bin/*"
>  FILES:${PN} +=3D "/usr/share/containers/oci/hooks.d"
>
> -# don't clobber hooks.d
> -ALLOW_EMPTY:${PN} =3D "1"
> -
> -INSANE_SKIP:${PN} +=3D "ldflags already-stripped textrel"
> +INSANE_SKIP:${PN} +=3D "ldflags textrel"
>  INSANE_SKIP:${PN}-ptest +=3D "textrel"
>
>  RDEPENDS:${PN}-ptest +=3D " \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9080):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9080
> Mute This Topic: https://lists.yoctoproject.org/mt/110623149/1050810
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

--000000000000b09041062bbf2850
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Pat=
ches 3 and 4 look good to me.</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I&#39;ll put them onto my under-test queue and let you know if they ne=
ed to be rebased for any of my pending package updates.</div><div class=3D"=
gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quo=
te gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan=
 15, 2025 at 12:47=E2=80=AFAM Chen Qi via <a href=3D"http://lists.yoctoproj=
ect.org">lists.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriv=
er.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ch=
en Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Che=
n@windriver.com</a>&gt;<br>
<br>
Set DEBUG=3D1 to avoid stripping.<br>
See <a href=3D"https://github.com/cri-o/cri-o/blob/main/Makefile#L93" rel=
=3D"noreferrer" target=3D"_blank">https://github.com/cri-o/cri-o/blob/main/=
Makefile#L93</a><br>
<br>
Set STRIP=3Dtrue to avoid stripping bin/pinns.<br>
See <a href=3D"https://github.com/cri-o/cri-o/blob/main/pinns/Makefile#L4" =
rel=3D"noreferrer" target=3D"_blank">https://github.com/cri-o/cri-o/blob/ma=
in/pinns/Makefile#L4</a><br>
<br>
ALLOW_EMPTY:${PN} =3D &quot;1&quot; is not needed. Remove it.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a> | 8 +++-----<br>
=C2=A01 file changed, 3 insertions(+), 5 deletions(-)<br>
<br>
diff --git a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=
=3D"noreferrer" target=3D"_blank">cri-o_git.bb</a> b/recipes-containers/cri=
-o/<a href=3D"http://cri-o_git.bb" rel=3D"noreferrer" target=3D"_blank">cri=
-o_git.bb</a><br>
index 5c2c453e..10c811fe 100644<br>
--- a/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
+++ b/recipes-containers/cri-o/<a href=3D"http://cri-o_git.bb" rel=3D"noref=
errer" target=3D"_blank">cri-o_git.bb</a><br>
@@ -60,7 +60,7 @@ inherit goarch<br>
=C2=A0inherit pkgconfig<br>
=C2=A0inherit container-host<br>
<br>
-EXTRA_OEMAKE=3D&quot;BUILDTAGS=3D&#39;&#39;&quot;<br>
+EXTRA_OEMAKE =3D &quot;BUILDTAGS=3D&#39;&#39; DEBUG=3D1 STRIP=3Dtrue&quot;=
<br>
<br>
=C2=A0do_compile() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 set +e<br>
@@ -115,15 +115,13 @@ do_install_ptest() {<br>
=C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/test ${D}${PTEST_PATH}<br>
=C2=A0 =C2=A0 =C2=A0cp -rf ${S}/src/import/bin ${D}${PTEST_PATH}<br>
=C2=A0}<br>
+<br>
=C2=A0FILES:${PN}-config =3D &quot;${sysconfdir}/crio/config/*&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;${systemd_unitdir}/system/*&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;/usr/local/bin/*&quot;<br>
=C2=A0FILES:${PN} +=3D &quot;/usr/share/containers/oci/hooks.d&quot;<br>
<br>
-# don&#39;t clobber hooks.d<br>
-ALLOW_EMPTY:${PN} =3D &quot;1&quot;<br>
-<br>
-INSANE_SKIP:${PN} +=3D &quot;ldflags already-stripped textrel&quot;<br>
+INSANE_SKIP:${PN} +=3D &quot;ldflags textrel&quot;<br>
=C2=A0INSANE_SKIP:${PN}-ptest +=3D &quot;textrel&quot;<br>
<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot; \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9080): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9080" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9080</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110623149/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110623149/1050810</a><br>
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

--000000000000b09041062bbf2850--

