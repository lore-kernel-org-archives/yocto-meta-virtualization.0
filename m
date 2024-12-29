Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8BF5E7718B
	for <webhook@archiver.kernel.org>; Sun, 29 Dec 2024 03:53:11 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.40106.1735444386570092979
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 28 Dec 2024 19:53:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=JtBY3noQ;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2efded08c79so8276735a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 28 Dec 2024 19:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735444386; x=1736049186; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sFpxqXbjFTErKuahyUGkcClthLFuVjLvpJFEOsXmXV8=;
        b=JtBY3noQ+e5Ent336BK4fDW20wD/lN0yRBvcqmDzpR9o8fKceliROrYIGPgKgEE1qH
         Um2ZC2l/r/TVG5ySu6/nqmI3+eB4kJlFI+a3dcafBrZuy+44bBJLyFKVEo0G+wfiTX9e
         mm2uasnIGSpMpVsq2qBiqv+vQ/2Fgy2dKDSraCVVV9SIumHUBbyBUMqilBDzH0AqzBV1
         plvkR51kBg2wM5nQrTYjXOFjkn7nS9pvWN4SJ8ZdpEVzHhJo9u1hVnwemwpApH+QLMJ/
         /JJRxHb+xIHEWO6nNf+cWMeYtsS4hbX8LDmU1ihv1v3i6gQDuhvWONDTMVoJFxuWo/Z0
         xJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735444386; x=1736049186;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sFpxqXbjFTErKuahyUGkcClthLFuVjLvpJFEOsXmXV8=;
        b=feI1h8s4ucWoWPoLn+YY6KDzQZ7eCFxYaQ1ExB/PDqVDHPXZ6p16ZQQHB7852WabGK
         th1Npvx8xCR0/gW1csL2a9mbNs7dkVDJNy5bvB1yQRonfQkup1v2asjH2e8Ab32ZPwZp
         a9uF/9RxCEQUMK8SHEHyMXAjSnYMJ+RiXb5bVrBOOXg/TUHks9sxwd52UgBYL9HGloF9
         V+82FY1n0bR7WabPLxmhZIs/KQHKirwmDjsVqJcDzDU5ThIivVHAAZAED2E+LXQR1FMn
         ghFQXyeDNtu7GN+piJqln4zadembKCfSdlZ6zH7YOeC7kSt/WfIbrWgCi7wTaKM37Ymp
         ctjg==
X-Gm-Message-State: AOJu0YzHypQWWPA6fk5yHBXpm8n8P8ZPjzQ4YLVJW9kZtgNtLiBJ3a2i
	oHT51yc/Ys39QjeulmVu5a76T3I8E1gMD+o+CZ3FIeyD5dqviTGlXHc7GxhsVKCpH64LhaGiC0k
	0ncZZ5QhU/En8+XmUCDfq7UP6JC4=
X-Gm-Gg: ASbGncs+CqlRqoXYqoilJ6jMmC+MeOHq2QPkxu5klKWsqsaHm4clHtosfKd4N5IFODX
	pP2cA3zVPkLfyMhYnjFM47XDHpAqCUldFpuQrBA==
X-Google-Smtp-Source: AGHT+IF6ZySYGhJ6mTK1Nns5TlW0MFPSAg3QL1qLy82RiL25ev5breeA2be7A7MAM1uu1za6Gc7lkkncgaK2Q7iPRSs=
X-Received: by 2002:a17:90b:3d43:b0:2ee:a583:e616 with SMTP id
 98e67ed59e1d1-2f452e17cb9mr49493119a91.9.1735444384386; Sat, 28 Dec 2024
 19:53:04 -0800 (PST)
MIME-Version: 1.0
References: <20241228090210.695265-1-hongxu.jia@windriver.com> <20241228090210.695265-3-hongxu.jia@windriver.com>
In-Reply-To: <20241228090210.695265-3-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 28 Dec 2024 22:52:53 -0500
Message-ID: <CADkTA4NVozBEx59M4UpzDAUZw1ghKz6+wtfjDuK3kmL+aaW_Bw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 3/3] docker.inc: use DISTRO_FEATURES
 to filter seccomp from PACKAGECONFIG
To: hongxu.jia@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000f1752062a60a28c"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 29 Dec 2024 03:53:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9068

--0000000000000f1752062a60a28c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 28, 2024 at 4:02=E2=80=AFAM hongxu via lists.yoctoproject.org
<hongxu.jia=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> Otherwise world build on qemuloongarch64 failed
>
> $ echo "MACHINE =3D 'qemuloongarch64'" >> conf/local.conf
> $ bitbake world
> ERROR: Nothing PROVIDES 'libseccomp' (but
> meta-virtualization/recipes-containers/docker/docker-moby_26.0.2.bb
> DEPENDS on or otherwise requires it)
> libseccomp was skipped: missing required distro feature 'seccomp' (not in
> DISTRO_FEATURES)
> NOTE: Runtime target 'docker' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['docker', 'libseccomp']
> ERROR: Required build target 'meta-world-pkgdata' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['meta-world-pkgdata',
> 'docker-compose', 'docker', 'libseccomp']
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/docker/docker.inc | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc
> b/recipes-containers/docker/docker.inc
> index 8aabd154..71f11074 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -26,7 +26,7 @@ RPROVIDES:${PN}-dev +=3D "docker-dev"
>  RPROVIDES:${PN}-contrip +=3D "docker-dev"
>
>  inherit pkgconfig
> -PACKAGECONFIG ??=3D "docker-init seccomp"
> +PACKAGECONFIG ??=3D "docker-init ${@bb.utils.filter('DISTRO_FEATURES',
> 'seccomp', d)}"
>

I won't take this patch for two reasons:

- The packageconfig should be independent of the disro feature (and in fact
predates it)
- docker won't actually run without seccomp, so this should be a feature
check and forced in the packageconfig

I've made the seccomp check changes locally and will push them when I'm
back from holidays.

longarch64 should be marked incompatible with this recipe.

Bruce


>  PACKAGECONFIG[seccomp] =3D "seccomp,,libseccomp"
>  PACKAGECONFIG[docker-init] =3D ",,,docker-init"
>  PACKAGECONFIG[transient-config] =3D "transient-config"
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9065):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9065
> Mute This Topic: https://lists.yoctoproject.org/mt/110315546/1050810
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

--0000000000000f1752062a60a28c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 28, 2024 at 4:02=
=E2=80=AFAM hongxu via <a href=3D"http://lists.yoctoproject.org">lists.yoct=
oproject.org</a> &lt;hongxu.jia=3D<a href=3D"mailto:eng.windriver.com@lists=
.yoctoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Otherwise world =
build on qemuloongarch64 failed<br>
<br>
$ echo &quot;MACHINE =3D &#39;qemuloongarch64&#39;&quot; &gt;&gt; conf/loca=
l.conf<br>
$ bitbake world<br>
ERROR: Nothing PROVIDES &#39;libseccomp&#39; (but meta-virtualization/recip=
es-containers/docker/<a href=3D"http://docker-moby_26.0.2.bb" rel=3D"norefe=
rrer" target=3D"_blank">docker-moby_26.0.2.bb</a> DEPENDS on or otherwise r=
equires it)<br>
libseccomp was skipped: missing required distro feature &#39;seccomp&#39; (=
not in DISTRO_FEATURES)<br>
NOTE: Runtime target &#39;docker&#39; is unbuildable, removing...<br>
Missing or unbuildable dependency chain was: [&#39;docker&#39;, &#39;libsec=
comp&#39;]<br>
ERROR: Required build target &#39;meta-world-pkgdata&#39; has no buildable =
providers.<br>
Missing or unbuildable dependency chain was: [&#39;meta-world-pkgdata&#39;,=
 &#39;docker-compose&#39;, &#39;docker&#39;, &#39;libseccomp&#39;]<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/docker/docker.inc | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/dock=
er/docker.inc<br>
index 8aabd154..71f11074 100644<br>
--- a/recipes-containers/docker/docker.inc<br>
+++ b/recipes-containers/docker/docker.inc<br>
@@ -26,7 +26,7 @@ RPROVIDES:${PN}-dev +=3D &quot;docker-dev&quot;<br>
=C2=A0RPROVIDES:${PN}-contrip +=3D &quot;docker-dev&quot;<br>
<br>
=C2=A0inherit pkgconfig<br>
-PACKAGECONFIG ??=3D &quot;docker-init seccomp&quot;<br>
+PACKAGECONFIG ??=3D &quot;docker-init ${@bb.utils.filter(&#39;DISTRO_FEATU=
RES&#39;, &#39;seccomp&#39;, d)}&quot;<br></blockquote><div><br></div><div>=
<div class=3D"gmail_default" style=3D"font-size:small">I won&#39;t take thi=
s patch for two reasons:</div><div class=3D"gmail_default" style=3D"font-si=
ze:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">=
- The packageconfig should be independent of the disro feature (and in fact=
 predates it)</div></div><div><span class=3D"gmail_default" style=3D"font-s=
ize:small">-=C2=A0</span>docker won&#39;t actually run without seccomp, so =
this should be a=C2=A0<span class=3D"gmail_default" style=3D"font-size:smal=
l">feature check and forced in the packageconfig</span><br></div><div><br><=
/div><div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;ve m=
ade the seccomp check changes locally and will push them when I&#39;m back =
from holidays.</div></div><div><br></div><div><div class=3D"gmail_default" =
style=3D"font-size:small">longarch64 should be marked incompatible with thi=
s recipe.</div></div><div><span class=3D"gmail_default" style=3D"font-size:=
small"><br></span></div><div><span class=3D"gmail_default" style=3D"font-si=
ze:small">Bruce</span></div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
=C2=A0PACKAGECONFIG[seccomp] =3D &quot;seccomp,,libseccomp&quot;<br>
=C2=A0PACKAGECONFIG[docker-init] =3D &quot;,,,docker-init&quot;<br>
=C2=A0PACKAGECONFIG[transient-config] =3D &quot;transient-config&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9065): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9065" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9065</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110315546/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110315546/1050810</a><br>
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

--0000000000000f1752062a60a28c--

