Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDBFFC28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 19:29:04 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.3762.1742498935781291967
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 12:28:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fEFsH2Bu;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-301918a4e1bso1689855a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 12:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742498935; x=1743103735; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mI9LRslH3oQZULIPE5kYU4H/K/wgUk6c/ng8n6CmgtU=;
        b=fEFsH2Buuh/8N51mqVe9gFyPIm/HlTQjb/aDPtIpqwJzir1J/+gcmd83O+NcYs3cGv
         uomI5aPU2Zmwfv1UJji74QDCHvGzso4Qbdq73FCLhLdwaPmyAJ3sbyaXzqA18MukFPm6
         CBx+5fEiAJ8TkpV2G604M2E9oEBgBTRX+wbfeINyyp3zkfJrsZoengyuy/MzRkhfnsRx
         ko7XEHDDLNsmeaV/B4xO+XEd/uFfgPr2SERjCtR643mOM48oBjTi1fDyUH37pfJynpHg
         zOXGaD9pvxv7sjKstB/Z20sl4KxULyQaO1o5OboBy8eMfp+5nHzmuoQano6xLJHwcdSA
         G1WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742498935; x=1743103735;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mI9LRslH3oQZULIPE5kYU4H/K/wgUk6c/ng8n6CmgtU=;
        b=Zvbn2OTEqwGbX8c5Ln5XJDvXfQ7cFXkUhLVCZu/+r2k2YwvEpUTROHXyx3zgaqb7ij
         u1GYlet4mLcvL/pJq7izSOux39vKwxImyfMkqa4xrWgBvSvGX0IkXFJniICR5tlG6hhj
         tdAtrjt+aRJq32b1cHOamvJjOGcFZb850d/0TZy8/S5gJpikhvCXbaMT9X71hLfvENyV
         6diGNRJgWu6T3kFRVX9cI2bDR8Gd8pMXBC6oLsFoh+mqKO1aXRWeduXEK5+mEwaesAHc
         L12m1R89rJ4KZ2VEacapCi2Nk1loW/Vs5uD12XKbcRkX9a6fpo1FJqKpiMQSJ4QEK9Su
         3grQ==
X-Gm-Message-State: AOJu0Yy9qnYg9aXPTT2nEqhCxoSFysV+hqnX49vgQ27RYpUiY+rY6+IQ
	pBWYxjcvR92CyPGkRTPH8qLrWsA9LLWZR2E1hpWTKMlVPmxVjhxSPg4LEFFYt7OtIg631XXyqc6
	E+GMUG6nCH+uHRUtyIYsMMiPM5I0UnihoRU009g==
X-Gm-Gg: ASbGncvduUgg9dlZ3SD8WlgWlpHS4mB/QCVm+DxrcOZ/Hd1Fomv9Iubi41RN4hRIcNA
	uT53cBIf5ZCRNJg6M0BNSp7SYj3QfZLKVyLWWUUZAy3jd63346tye4WgwL6bQoJWGf4llGy1k2d
	bCeCU5kvsN3hzWweN6+p/ia5QtwVwgJrK18CKkEQ==
X-Google-Smtp-Source: AGHT+IFfaHRSkSTVFBIU09GVYxe4trG1yrU7cmT78V8teh7BNgaazxH7dtzb2f7KikjFRalYNm7DGdsO77GHyyqE+PA=
X-Received: by 2002:a17:90a:d008:b0:2fe:a545:4c84 with SMTP id
 98e67ed59e1d1-3030ff03212mr601884a91.34.1742498934984; Thu, 20 Mar 2025
 12:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20250312054628.3335246-1-kai.kang@windriver.com>
In-Reply-To: <20250312054628.3335246-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 20 Mar 2025 15:28:42 -0400
X-Gm-Features: AQ5f1JqucVYsXpibbggYI2_0NWWTzjCj0XYqiq5f5mtHmkSQFRW_0gX5WaUGx5Q
Message-ID: <CADkTA4NyESj_1z8bpB2MkRBam04Gf=2PvvkiYm11BJbo=bJ6mQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] virt-manager: update for
 PACKAGECONFIG gui
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000a96020630cb26c7"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Mar 2025 19:29:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9168

--0000000000000a96020630cb26c7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I haven't forgotten about this, I'm just overloaded trying to complete some
package upgrades and will get to pending patches shortly.

Bruce

On Wed, Mar 12, 2025 at 1:46=E2=80=AFAM Kai Kang via lists.yoctoproject.org
<kai.kang=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> It turned to meson since virt-manager 5.0, so update for PACKAGECONFIG
> gui accordingly. And merge the DEPENDS lines that the latter one uses
> direct assign('=3D') which clears the content of DEPENDS set before.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/virt-manager/virt-manager_git.bb | 10 +++-------
>  1 file changed, 3 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-extended/virt-manager/virt-manager_git.bb
> b/recipes-extended/virt-manager/virt-manager_git.bb
> index 71806077..a33f37a6 100644
> --- a/recipes-extended/virt-manager/virt-manager_git.bb
> +++ b/recipes-extended/virt-manager/virt-manager_git.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "virt-manager is a graphical tool for
> managing virtual machines vi
>  HOMEPAGE =3D "https://virt-manager.org/"
>  LICENSE =3D "GPL-2.0-only"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
> -DEPENDS +=3D "python3-docutils-native"
> +DEPENDS +=3D "python3-docutils-native python3-pylint"
>  SRCREV =3D "da2f65f9262fc18e2b05f527cf8886b1c6b9cde1"
>
>  SRC_URI =3D " \
> @@ -15,22 +15,18 @@ PV =3D "v5.0.0+git"
>  S =3D "${WORKDIR}/git"
>
>  PACKAGECONFIG ??=3D "gui"
> -PACKAGECONFIG[gui] =3D ",--no-update-icon-cache
> --no-compile-schemas,python3-pygobject"
> +PACKAGECONFIG[gui] =3D ",-Dupdate-icon-cache=3Dfalse
> -Dcompile-schemas=3Dfalse,python3-pygobject"
>
>  inherit ${@bb.utils.contains('PACKAGECONFIG', 'gui', 'gtk-icon-cache',
> '', d)}
>  inherit bash-completion gettext pkgconfig meson
>
> -EXTRA_OEMESON +=3D "-Dupdate-icon-cache=3Dfalse \
> -                   -Dtests=3Ddisabled \
> -                "
> +EXTRA_OEMESON +=3D "-Dtests=3Ddisabled"
>
>  PACKAGES +=3D " \
>    ${PN}-common \
>    ${PN}-install \
>  "
>
> -DEPENDS =3D "python3-pylint"
> -
>  RDEPENDS:${PN}-common +=3D " \
>    libvirt-python \
>    libosinfo \
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9163):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9163
> Mute This Topic: https://lists.yoctoproject.org/mt/111655339/1050810
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

--0000000000000a96020630cb26c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small"><di=
v class=3D"gmail_default">I haven&#39;t forgotten about this, I&#39;m just =
overloaded trying to complete some package upgrades and will get to pending=
 patches shortly.</div><div class=3D"gmail_default"><br></div><div class=3D=
"gmail_default">Bruce</div></div></div><br><div class=3D"gmail_quote gmail_=
quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 12, 2025=
 at 1:46=E2=80=AFAM Kai Kang via <a href=3D"http://lists.yoctoproject.org">=
lists.yoctoproject.org</a> &lt;kai.kang=3D<a href=3D"mailto:windriver.com@l=
ists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Kai Kang &=
lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.kang@win=
driver.com</a>&gt;<br>
<br>
It turned to meson since virt-manager 5.0, so update for PACKAGECONFIG<br>
gui accordingly. And merge the DEPENDS lines that the latter one uses<br>
direct assign(&#39;=3D&#39;) which clears the content of DEPENDS set before=
.<br>
<br>
Signed-off-by: Kai Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" targe=
t=3D"_blank">kai.kang@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-extended/virt-manager/<a href=3D"http://virt-manager_git.bb" =
rel=3D"noreferrer" target=3D"_blank">virt-manager_git.bb</a> | 10 +++------=
-<br>
=C2=A01 file changed, 3 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/recipes-extended/virt-manager/<a href=3D"http://virt-manager_g=
it.bb" rel=3D"noreferrer" target=3D"_blank">virt-manager_git.bb</a> b/recip=
es-extended/virt-manager/<a href=3D"http://virt-manager_git.bb" rel=3D"nore=
ferrer" target=3D"_blank">virt-manager_git.bb</a><br>
index 71806077..a33f37a6 100644<br>
--- a/recipes-extended/virt-manager/<a href=3D"http://virt-manager_git.bb" =
rel=3D"noreferrer" target=3D"_blank">virt-manager_git.bb</a><br>
+++ b/recipes-extended/virt-manager/<a href=3D"http://virt-manager_git.bb" =
rel=3D"noreferrer" target=3D"_blank">virt-manager_git.bb</a><br>
@@ -2,7 +2,7 @@ DESCRIPTION =3D &quot;virt-manager is a graphical tool for =
managing virtual machines vi<br>
=C2=A0HOMEPAGE =3D &quot;<a href=3D"https://virt-manager.org/" rel=3D"noref=
errer" target=3D"_blank">https://virt-manager.org/</a>&quot;<br>
=C2=A0LICENSE =3D &quot;GPL-2.0-only&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3Db234ee4d69f5fce4486a8=
0fdaf4a4263&quot;<br>
-DEPENDS +=3D &quot;python3-docutils-native&quot;<br>
+DEPENDS +=3D &quot;python3-docutils-native python3-pylint&quot;<br>
=C2=A0SRCREV =3D &quot;da2f65f9262fc18e2b05f527cf8886b1c6b9cde1&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
@@ -15,22 +15,18 @@ PV =3D &quot;v5.0.0+git&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
=C2=A0PACKAGECONFIG ??=3D &quot;gui&quot;<br>
-PACKAGECONFIG[gui] =3D &quot;,--no-update-icon-cache --no-compile-schemas,=
python3-pygobject&quot;<br>
+PACKAGECONFIG[gui] =3D &quot;,-Dupdate-icon-cache=3Dfalse -Dcompile-schema=
s=3Dfalse,python3-pygobject&quot;<br>
<br>
=C2=A0inherit ${@bb.utils.contains(&#39;PACKAGECONFIG&#39;, &#39;gui&#39;, =
&#39;gtk-icon-cache&#39;, &#39;&#39;, d)}<br>
=C2=A0inherit bash-completion gettext pkgconfig meson<br>
<br>
-EXTRA_OEMESON +=3D &quot;-Dupdate-icon-cache=3Dfalse \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-Dtes=
ts=3Ddisabled \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
+EXTRA_OEMESON +=3D &quot;-Dtests=3Ddisabled&quot;<br>
<br>
=C2=A0PACKAGES +=3D &quot; \<br>
=C2=A0 =C2=A0${PN}-common \<br>
=C2=A0 =C2=A0${PN}-install \<br>
=C2=A0&quot;<br>
<br>
-DEPENDS =3D &quot;python3-pylint&quot;<br>
-<br>
=C2=A0RDEPENDS:${PN}-common +=3D &quot; \<br>
=C2=A0 =C2=A0libvirt-python \<br>
=C2=A0 =C2=A0libosinfo \<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9163): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9163" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9163</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/111655339/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/111655339/1050810</a><br>
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

--0000000000000a96020630cb26c7--

