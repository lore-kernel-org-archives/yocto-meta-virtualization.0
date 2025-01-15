Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB18EC02183
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 13:58:53 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.21539.1736949525250876170
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 05:58:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EtnYX3P+;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2ef714374c0so1495006a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 05:58:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736949525; x=1737554325; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=R1P1NO8M4HJJQdUNE/PaxGz/Jta9vhQ/WbLCU3LXvYo=;
        b=EtnYX3P+U3QjF570eax+W8/lrlA5lDRTsEkFB1pwNybmsKa8AW4bX1mXoFc5CDL730
         rJuF1r1sx0iR3buGR7qU6OgZDlfA+jb0ozCevfUpQo9cpw5H4OTBmPZ5puNp1XMKe2kO
         CDWTaJZwhjL9c05wC2v3192DHuN+gNd38i6sneGXI6Xux53f4K4qfisTu8/VUlBKEwpa
         hvFvnBbgPGtety4ZD6tQGlRRSjbRDZd1u6ATDCL1KubXrycwjTZwIaJV6Z/b0Rut+m4Z
         lSgw/Qnt2qcGfV3PDwvfdMk6m9KO6jiEvyZZEh1DxrVLhPe5E2rr2EQDdwovJaSn16FX
         so0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949525; x=1737554325;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1P1NO8M4HJJQdUNE/PaxGz/Jta9vhQ/WbLCU3LXvYo=;
        b=ZCnjwTNH2DVUqX3nqAMEmaZEjEfgrdVlZHqmoqieFiNlKlh1rtyYFCeafDv3HLnHuJ
         WwSpR0vEwcOhVtPSV9YpojBCAIGvreTqyQQgHvSDTCYEP9i5dpTjoFNNIkYvZRQ5ji0F
         ySTxqEjcBIUZprq5ay4lLQLK1gSUkcBf8jPSdBdMN/2YArUD6yfmE/M+OdilDEgx57z3
         0vUS1Z9r0yIa99O7jIq4ISSYSb4JlsFw18RGpvb5Tg6RZhoQvWOHvaYVB5KXHXs9AgUO
         LflURWcdvEM3H7I7CY8YeRkIKXeh/p8MtVwCo8ncfZ0SuiVecB/kBUluUzKOpCLliKzg
         KbRQ==
X-Gm-Message-State: AOJu0Ywq4VkVlnpFdr5LpflzZVlAixVew+q4XOMgVe3D00UcyILFmere
	23C+B07Uax+YLn+JhHHqkHD/HEpHpw6mJDoXSEk1Hc1fwGHq0BhlDLnP6KM/AdL+q5HruGTEijJ
	fTL21LF4nPeF/oCx57QsTJmCFr5FjqcIV1Vg=
X-Gm-Gg: ASbGncv0pLtQxZEy1KTiaVLc5VXgWUQm6A+ZNxE1hXdc8pVMfEa3TIdNpVPanjHIxkm
	nmfFv2pCjGVjXyHotDz0yWkj9IcRzKy+wcCfEwGM=
X-Google-Smtp-Source: AGHT+IG9j6PEzymL6pb0aEZXG3zJUVZu7OkQFJ7lMbTQ14BHPnOdMvfjHEePj3XePHi1Xw1OwNt63TIyv5Lyqkaylhk=
X-Received: by 2002:a17:90b:1f8c:b0:2ee:8cbb:de28 with SMTP id
 98e67ed59e1d1-2f728deacf6mr5153088a91.8.1736949523071; Wed, 15 Jan 2025
 05:58:43 -0800 (PST)
MIME-Version: 1.0
References: <20250115054639.1079705-1-Qi.Chen@windriver.com>
In-Reply-To: <20250115054639.1079705-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 08:58:31 -0500
X-Gm-Features: AbW1kvbMR8hA1gmZ8G52K2HCGS_MdnEeMlCdFtQNhsaevXJrqCLfZ6K1RPHlcpE
Message-ID: <CADkTA4M7sk2+H3_MzYAMbO6RANpO0vCdnO7RXN9KaW734=6xhA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/4] buildah: update to 1.37.5
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000050ceb8062bbf139e"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 13:58:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9086

--00000000000050ceb8062bbf139e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I already have queued updates for packages.

Just some testing issues are holding up the push.

Also, the SRCREV format doesn't break anything, so I'l leave it as is.

Bruce

On Wed, Jan 15, 2025 at 12:47=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
>
> Fix the SRCREV as there's no need to use SRCREV_FORMAT.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-containers/buildah/buildah_git.bb | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/recipes-containers/buildah/buildah_git.bb
> b/recipes-containers/buildah/buildah_git.bb
> index 7ad2fd95..1f9805d6 100644
> --- a/recipes-containers/buildah/buildah_git.bb
> +++ b/recipes-containers/buildah/buildah_git.bb
> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D "file://src/
> github.com/containers/buildah/LICENSE;md5=3De3fc50a
>
>  S =3D "${WORKDIR}/git"
>
> -BUILDAH_VERSION =3D "1.37.1"
> +BUILDAH_VERSION =3D "1.37.5"
>
>  PV =3D "${BUILDAH_VERSION}"
>
> @@ -27,9 +27,7 @@ GO_INSTALL =3D "${GO_IMPORT}"
>  GO_WORKDIR =3D "${GO_INSTALL}"
>  GOBUILDFLAGS +=3D "-mod vendor"
>
> -SRCREV_FORMAT =3D "buildah_storage"
> -SRCREV_buildah =3D "0117c423e94b1051d5e34a16f3f1db8fb63509c7"
> -SRCREV_storage =3D "246ba3062e8b551026aef2708eee747014ce5c52"
> +SRCREV =3D "5fd40b989860984a00f6fc1539ff53caceca1325"
>
>  SRC_URI =3D " \
>      git://
> github.com/containers/buildah;branch=3Drelease-1.37;name=3Dbuildah;protoc=
ol=3Dhttps;destsuffix=3D${GO_SRCURI_DESTSUFFIX}
> <http://github.com/containers/buildah;branch=3Drelease-1.37;name=3Dbuilda=
h;protocol=3Dhttps;destsuffix=3D$%7BGO_SRCURI_DESTSUFFIX%7D>
> \
> --
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9081):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9081
> Mute This Topic: https://lists.yoctoproject.org/mt/110623150/1050810
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

--00000000000050ceb8062bbf139e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I a=
lready have queued=C2=A0updates for packages.</div><div class=3D"gmail_defa=
ult" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Just some testing issues are holding up the push.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Also, the SRCREV format doesn=
&#39;t break anything, so I&#39;l leave=C2=A0it as is.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail_quot=
e gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jan =
15, 2025 at 12:47=E2=80=AFAM Chen Qi via <a href=3D"http://lists.yoctoproje=
ct.org">lists.yoctoproject.org</a> &lt;Qi.Chen=3D<a href=3D"mailto:windrive=
r.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.org</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Che=
n Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen=
@windriver.com</a>&gt;<br>
<br>
Fix the SRCREV as there&#39;s no need to use SRCREV_FORMAT.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a> | 6 ++----<br>
=C2=A01 file changed, 2 insertions(+), 4 deletions(-)<br>
<br>
diff --git a/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" r=
el=3D"noreferrer" target=3D"_blank">buildah_git.bb</a> b/recipes-containers=
/buildah/<a href=3D"http://buildah_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">buildah_git.bb</a><br>
index 7ad2fd95..1f9805d6 100644<br>
--- a/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a><br>
+++ b/recipes-containers/buildah/<a href=3D"http://buildah_git.bb" rel=3D"n=
oreferrer" target=3D"_blank">buildah_git.bb</a><br>
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM =3D &quot;file://src/<a href=3D"http://git=
hub.com/containers/buildah/LICENSE;md5=3De3fc50a" rel=3D"noreferrer" target=
=3D"_blank">github.com/containers/buildah/LICENSE;md5=3De3fc50a</a><br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
<br>
-BUILDAH_VERSION =3D &quot;1.37.1&quot;<br>
+BUILDAH_VERSION =3D &quot;1.37.5&quot;<br>
<br>
=C2=A0PV =3D &quot;${BUILDAH_VERSION}&quot;<br>
<br>
@@ -27,9 +27,7 @@ GO_INSTALL =3D &quot;${GO_IMPORT}&quot;<br>
=C2=A0GO_WORKDIR =3D &quot;${GO_INSTALL}&quot;<br>
=C2=A0GOBUILDFLAGS +=3D &quot;-mod vendor&quot;<br>
<br>
-SRCREV_FORMAT =3D &quot;buildah_storage&quot;<br>
-SRCREV_buildah =3D &quot;0117c423e94b1051d5e34a16f3f1db8fb63509c7&quot;<br=
>
-SRCREV_storage =3D &quot;246ba3062e8b551026aef2708eee747014ce5c52&quot;<br=
>
+SRCREV =3D &quot;5fd40b989860984a00f6fc1539ff53caceca1325&quot;<br>
<br>
=C2=A0SRC_URI =3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.com/containers/buildah;b=
ranch=3Drelease-1.37;name=3Dbuildah;protocol=3Dhttps;destsuffix=3D$%7BGO_SR=
CURI_DESTSUFFIX%7D" rel=3D"noreferrer" target=3D"_blank">github.com/contain=
ers/buildah;branch=3Drelease-1.37;name=3Dbuildah;protocol=3Dhttps;destsuffi=
x=3D${GO_SRCURI_DESTSUFFIX}</a> \<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9081): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9081" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9081</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110623150/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110623150/1050810</a><br>
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

--00000000000050ceb8062bbf139e--

