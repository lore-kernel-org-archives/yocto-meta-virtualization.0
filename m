Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1C9CF589CD
	for <webhook@archiver.kernel.org>; Thu, 23 Apr 2026 13:04:45 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19034.1776949483707853691
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Apr 2026 06:04:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=DOC/obE6;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2aaf43014d0so41003295ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 06:04:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776949483; cv=none;
        d=google.com; s=arc-20240605;
        b=HMgb9XgMR589eYdy8Ealm1r+KNMi5fknnP3mYCLAhu1ccCe+aD/nI+7Otm5hPRNb1N
         bGPXvY7a/S90jUHY6jK2naVvWsh7CyyFRwTZ5EKG5hFougo6nCm4givK/M3AraxZQvlZ
         uS97orqoHNVc2doM9NFixlRattNyghaidYRYok3RucVgTReczB4zeCm89aL7Qp9Des8h
         rDOWThVPgxkDeJ1JILMupyHxXSTrvJ96PwBjnNtGT7MXLLZrOHa+69xtGdyPt8O9LGyU
         s05zTNgiqYs7g7qzsZ/dD10oS3KGH5KjP3kgdW88BQcnR/T53MgzaormnfdpT7EdskqB
         D/jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=a3A6mY4D9TzCFnYTb/w79zsfJkR2Qbg3Wi3tiJG2Is8=;
        fh=QPHnNHvs7hTGm+Ai9SNpXOHJUNRt/ULMNcyucdGKvrU=;
        b=RwQcadNaCiZSno0BEdw4MGcYQlm4mdzvTwpiawBL6Ei5gA8Lum5tm7zIGvhhIcL7lH
         XHnPpDxGC5NE4kx8yfkZ9lvs4NW+bqzjuMDlzwOf8uFFdpYy/Pul+BIfEYyz4yJIQ3Sh
         DRNAinuR9GGzvvk47ddy6V8mxn+KPujNL0ZL6ND4CnjGUGRTtSEpPNIyxRGe7boeboKO
         PjuV3aDgZ08UjmmVgZVGgSu3B+P6A6V4OOjXZNqs+pPmtR+SerEES1ObrAJfgMSmMi0V
         m/57FKZuYTjqtEyGfrm87CaHhQVH4jxaAZuCCec1Afzx2QUCUI6JSUvcKbpNCPENfHFR
         TkSg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776949483; x=1777554283; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=a3A6mY4D9TzCFnYTb/w79zsfJkR2Qbg3Wi3tiJG2Is8=;
        b=DOC/obE6s2VjDuaDQO86ZtTCFduWfQzCdo0uRDozcyedFMRXiTF9VRTlBpEMuHrQ/a
         TWY4S8FKH+/7A03u/GA5AoN5m0hKXPpZoL8CjAeCSq97qiNYO4UO9SIvRTqUiZSKctam
         pPSt3WNFxI3WLcxpoBzz1hNUyzKdd6PLVfR5IMoLut+2ZCi7vArkMse6wQfnExttcNHJ
         j1FCG3150bvNkk2jV6s3RkKF1zjNMMFHWml+gnmeUq6/JEAONRQt7wQgs5jVoyuEsudE
         HT18v+djUPzZRAk5y7tXQXD73+szhvlaXAwz8nL4K3vZklnPgNQ/yt7Ys10uv1nmC7sE
         vEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776949483; x=1777554283;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a3A6mY4D9TzCFnYTb/w79zsfJkR2Qbg3Wi3tiJG2Is8=;
        b=RK1QwIIXFoFoOYP9DCzcZ4HbR8SHEN5oCm8ZAzBOqATTgkMKlCoAsf9NKIRCsjnTLs
         adfbpT4NNqqKpeSzEyG9GqFfJrfA1yANtQx1CQxzeddf4Z3uQAeHfbrxxVlyLnsYdBMA
         Y4qXY+WT1/x3Ct5Q5FVCC5U+Guv/mFTpzfG91y1quQS7Oln35lHnIEkIWJJybLqjq8Ps
         5q+QwxTn88DRASgrfO6lh+yNzPHmDW4YAdLJsJHli7ykWe3i++44m3pbLrwp7G2v7qI+
         2vrkhfpJNpndSoRwB4n9u1PNJIbBAdb6u9yIPzNvakJ9KMHg64uQWuNs6QQdfNM8Za84
         vHrw==
X-Gm-Message-State: AOJu0Yx4JQVbkPBkxMdJO8NLV8+zqDEO+tHpwC+K5Mqnp6M3a871ewBH
	XuNlvGsRFZu07AYgYD8cK86cbFNYMya1dRBfMay4qeWzDpngjgs8M/7NpV+POqKRUjPCLOA2LGI
	VvkreXOF42IVK7sZIL9aZm29XSEayAc0=
X-Gm-Gg: AeBDieuRqGic2ginfABGch00dByYUDkNrlGfnlYzN38UzJdN7XShhJ5Bf8TZdDu2UcO
	P/LjLSj2z5Fmb/He5GOGNDWwaZ6IaIv4PqUR5WqkUMYc6J09p3UNeW1tqShRtI/BA5X0tbyLg0a
	MCGa08AAQBZ9h0QGMwmjQxsTgHQZNdBtHJCJb+5CgcV6A/B8Zsv66goMzmaBoELap8JT7U+Zr5f
	vBFM7SpmcUuU1n1W61S9DxIAR8blErFqOIuP2+/zJ8WsFGG9yhyXTMTerIQ76131xUKBfjpnfD3
	59+VFRcoWqIOA/31eWRSx+hMjg3slI6vn2rWv71L2seKB2JK+Njw
X-Received: by 2002:a17:903:2acb:b0:2b4:5b9e:2f51 with SMTP id
 d9443c01a7336-2b5f9fb80demr301189045ad.34.1776949482619; Thu, 23 Apr 2026
 06:04:42 -0700 (PDT)
MIME-Version: 1.0
References: <20260423063550.2973613-1-mingli.yu@windriver.com>
In-Reply-To: <20260423063550.2973613-1-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 23 Apr 2026 09:04:31 -0400
X-Gm-Features: AQROBzD-MtkghTpObbl9N4VKB_rBUsa0MnzqnlGnhWvxVwNxbgJUir0KJmmAQ2w
Message-ID: <CADkTA4Ndxaw9ofd9dC6z2TnhHNJ5fjYk+nYRA=y+H2B8iv9-oQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [scarthgap][PATCH] podman: Upgrade 5.0.1 -> 5.0.3
To: mingli.yu@eng.windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000b20a9f0650204afa"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Apr 2026 13:04:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9727

--000000000000b20a9f0650204afa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 23, 2026 at 2:35=E2=80=AFAM Yu, Mingli via lists.yoctoproject.o=
rg
<mingli.yu=3Deng.windriver.com@lists.yoctoproject.org> wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
>
> Upgrade podman to 5.0.3 to include some bugfixes and some security fix
> such as CVE-2024-3727 [1].
>
> [1] https://github.com/containers/podman/releases/tag/v5.0.3



Update this to the format of (almost) all the other upgrades in meta-virt.

We need a shortlog of the changes, not links to release notes.

Bruce


>
>
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-containers/podman/podman_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/podman/podman_git.bb
> b/recipes-containers/podman/podman_git.bb
> index ef9798f0..b80b8d5b 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -17,7 +17,7 @@ DEPENDS =3D " \
>      gettext-native \
>  "
>
> -SRCREV =3D "bb81e85a430fa95d23a15b77c717fd68bf06ebf2"
> +SRCREV =3D "d08315df35cb6e95f65bf3935f529295c6e54742"
>  SRC_URI =3D " \
>      git://github.com/containers/libpod.git;branch=3Dv5.0;protocol=3Dhttp=
s \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless',
> 'file://50-podman-rootless.conf', '', d)} \
> @@ -33,7 +33,7 @@ GO_IMPORT =3D "import"
>
>  S =3D "${WORKDIR}/git"
>
> -PV =3D "5.0.1+git"
> +PV =3D "5.0.3+git"
>
>  CVE_STATUS[CVE-2022-2989] =3D "fixed-version: fixed since v4.3.0"
>  CVE_STATUS[CVE-2023-0778] =3D "fixed-version: fixed since v4.5.0"
> --
> 2.49.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9726):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9726
> Mute This Topic: https://lists.yoctoproject.org/mt/118968012/1050810
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

--000000000000b20a9f0650204afa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 23, 2026 at 2:35=
=E2=80=AFAM Yu, Mingli via <a href=3D"http://lists.yoctoproject.org">lists.=
yoctoproject.org</a> &lt;mingli.yu=3D<a href=3D"mailto:eng.windriver.com@li=
sts.yoctoproject.org">eng.windriver.com@lists.yoctoproject.org</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Mingli =
Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" target=3D"_blank">mingli.=
yu@windriver.com</a>&gt;<br>
<br>
Upgrade podman to 5.0.3 to include some bugfixes and some security fix<br>
such as CVE-2024-3727 [1].<br>
<br>
[1] <a href=3D"https://github.com/containers/podman/releases/tag/v5.0.3" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/containers/podman/rel=
eases/tag/v5.0.3</a></blockquote><div><br></div><div><br></div><div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">Update this to the format o=
f (almost) all the other upgrades in meta-virt.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">We need a shortlog of the changes, not links to rele=
ase notes.</div><div class=3D"gmail_default" style=3D"font-size:small"><br>=
</div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></d=
iv><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
Signed-off-by: Mingli Yu &lt;<a href=3D"mailto:mingli.yu@windriver.com" tar=
get=3D"_blank">mingli.yu@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=
=3D"noreferrer" target=3D"_blank">podman_git.bb</a> b/recipes-containers/po=
dman/<a href=3D"http://podman_git.bb" rel=3D"noreferrer" target=3D"_blank">=
podman_git.bb</a><br>
index ef9798f0..b80b8d5b 100644<br>
--- a/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
+++ b/recipes-containers/podman/<a href=3D"http://podman_git.bb" rel=3D"nor=
eferrer" target=3D"_blank">podman_git.bb</a><br>
@@ -17,7 +17,7 @@ DEPENDS =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0gettext-native \<br>
=C2=A0&quot;<br>
<br>
-SRCREV =3D &quot;bb81e85a430fa95d23a15b77c717fd68bf06ebf2&quot;<br>
+SRCREV =3D &quot;d08315df35cb6e95f65bf3935f529295c6e54742&quot;<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containers/libpod.gi=
t;branch=3Dv5.0;protocol=3Dhttps" rel=3D"noreferrer" target=3D"_blank">gith=
ub.com/containers/libpod.git;branch=3Dv5.0;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;root=
less&#39;, &#39;file://50-podman-rootless.conf&#39;, &#39;&#39;, d)} \<br>
@@ -33,7 +33,7 @@ GO_IMPORT =3D &quot;import&quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-PV =3D &quot;5.0.1+git&quot;<br>
+PV =3D &quot;5.0.3+git&quot;<br>
<br>
=C2=A0CVE_STATUS[CVE-2022-2989] =3D &quot;fixed-version: fixed since v4.3.0=
&quot;<br>
=C2=A0CVE_STATUS[CVE-2023-0778] =3D &quot;fixed-version: fixed since v4.5.0=
&quot;<br>
-- <br>
2.49.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9726): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9726" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9726</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/118968012/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/118968012/1050810</a><br>
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

--000000000000b20a9f0650204afa--

