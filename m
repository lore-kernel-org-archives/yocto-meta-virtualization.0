Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48639C7EE23
	for <webhook@archiver.kernel.org>; Tue, 23 May 2023 13:54:10 +0000 (UTC)
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
 by mx.groups.io with SMTP id smtpd.web10.23371.1684850041075650209
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 23 May 2023 06:54:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=gfOEOhBG;
 spf=pass (domain: gmail.com, ip: 209.85.166.51, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-76c5c806fc5so94146739f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 23 May 2023 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684850040; x=1687442040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f5ZY98qFC4qJZm9MvShREYdUv/9OyFB0L+EZR+pV4IE=;
        b=gfOEOhBGuQ8CgHK/SARGZFLKar267W7NFo6TKVwMl/rAesD4YICV8g/HKpM6taLBuX
         KkDdAqgohNQFB4fsz3G3WOMsGp00TdYLMHBeA/fH0U3C7YTzpYqST5aDAxUtniHVzLKg
         3kSgdS3Bhl4cKJEUfARx/KbXmck/4+KO7telyzsLEL3hjMuy4rC/XKVugbzfDL7fjx3C
         Zv02aU6s8xWx1gZq98awlCJ3nSk2Brcmn6f5od4y+MVLE0czhoovIH9k/q5CIyyDNRrB
         XmDttRk6ZewU+rxJJaTdGniMy0+B1cO1XYKq1qojabZ+wk8JeooEVY87C6rlce2/wziW
         28bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684850040; x=1687442040;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f5ZY98qFC4qJZm9MvShREYdUv/9OyFB0L+EZR+pV4IE=;
        b=B19D18sis2OQfNCRjAxpzRAtQIO12bNtKA1lcHmVkiCLiXWgJaxWzGLplQZSjQjXnQ
         HBBhtRE7HTJXM7skvqnQ/n/VQFllxAe8l5hekT06Gh+Kvf2VgH281V6SNGhx+M6vM1/A
         ouqx4RgrfvyiOhE3JsjSlwWK6/YrvbaRTYMt9O83POrgyFfBuuRR79GhTDWG0c01LtPx
         6NEI4YzYkl6uouAS/s/YSfmEVXxUDDSmqlkCkkbz0MpUTEAfNqb1q6NylppYdeTFYfvW
         u+J7valFqFUSC7JWmYOeNx/GAiyW/B0sG8GpJ6Rin4TGVWLWlKYEOkoXV4OyN0wT/Ba4
         groQ==
X-Gm-Message-State: AC+VfDxiZXqEH+mcOX99iRkhpihRqXrUQ4kTbTCIGF9YG7G5zj1ZffYx
	30SqGm/a+1iekoDGWzsw9/fEzgLpb3Yiras5Rq8=
X-Google-Smtp-Source: ACHHUZ4WqSDJcwTgKtsSh03ftZ2bJ/RXm93DW6iKKCovixMCdsLR2ARXC/gJPtRFki7nn6OKZY3+wRAzgNRd+KlrqcI=
X-Received: by 2002:a6b:e80f:0:b0:76c:615c:7c1 with SMTP id
 f15-20020a6be80f000000b0076c615c07c1mr9027705ioh.16.1684850039991; Tue, 23
 May 2023 06:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230523110041.3166571-1-changqing.li@windriver.com>
In-Reply-To: <20230523110041.3166571-1-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 23 May 2023 09:53:48 -0400
Message-ID: <CADkTA4Osbwb-DKm28YhBACfXD5wvdLJaaPeEFiFpWQCdR-OMMg@mail.gmail.com>
Subject: Re: [meta-virtualization] [mickledore][master][PATCH] libvirt:
 upgrade 9.2.0 -> 9.3.0
To: Changqing Li <changqing.li@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000022314705fc5cb81b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 23 May 2023 13:54:10 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8074

--00000000000022314705fc5cb81b
Content-Type: text/plain; charset="UTF-8"

Can you send a v2 with the commit shortlogs between the versions captured ?

Bruce

On Tue, May 23, 2023, 7:00 AM Changqing Li <changqing.li@eng.windriver.com>
wrote:

> From: Changqing Li <changqing.li@windriver.com>
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt-python.inc                     | 2 +-
>  recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.3.0.bb} | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_9.2.0.bb => libvirt_9.3.0.bb}
> (99%)
>
> diff --git a/recipes-extended/libvirt/libvirt-python.inc
> b/recipes-extended/libvirt/libvirt-python.inc
> index e4806df..b77df3b 100644
> --- a/recipes-extended/libvirt/libvirt-python.inc
> +++ b/recipes-extended/libvirt/libvirt-python.inc
> @@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg += "buildpaths"
>
>  SRC_URI += "
> http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python
> "
>
> -SRC_URI[libvirt_python.sha256sum] =
> "95cc190c57cb84e8ed2e1b8205b01a937e1a4bc19cc8865df19ca4470e6d7c1b"
> +SRC_URI[libvirt_python.sha256sum] =
> "9c761d88b4ddcf65b324043944da4f18f82471c74d9371d2372d3b4e0f19861b"
>
>  export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
>  export LIBVIRT_CFLAGS = "-I${S}/include"
> diff --git a/recipes-extended/libvirt/libvirt_9.2.0.bb
> b/recipes-extended/libvirt/libvirt_9.3.0.bb
> similarity index 99%
> rename from recipes-extended/libvirt/libvirt_9.2.0.bb
> rename to recipes-extended/libvirt/libvirt_9.3.0.bb
> index 5e70470..e1bfb94 100644
> --- a/recipes-extended/libvirt/libvirt_9.2.0.bb
> +++ b/recipes-extended/libvirt/libvirt_9.3.0.bb
> @@ -32,7 +32,7 @@ SRC_URI = "
> http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>
> file://0001-messon.build-remove-build-path-information-to-avoid-.patch \
>            "
>
> -SRC_URI[libvirt.sha256sum] =
> "a07f501e99093ac1374888312be32182e799de17407ed7547d0e469fae8188c5"
> +SRC_URI[libvirt.sha256sum] =
> "751179b08e5a73b6cfd93200d110df199eaa3973f3554ba2ebcbd71e272bebe1"
>
>  inherit meson gettext update-rc.d pkgconfig systemd useradd perlnative
>  USERADD_PACKAGES = "${PN}"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8073):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8073
> Mute This Topic: https://lists.yoctoproject.org/mt/99084593/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000022314705fc5cb81b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Can you send a v2 with the commit shortlogs between =
the versions captured ?</div><div dir=3D"auto"><br></div><div dir=3D"auto">=
Bruce=C2=A0<br><br><div class=3D"gmail_quote" dir=3D"auto"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Tue, May 23, 2023, 7:00 AM Changqing Li &lt;<a hre=
f=3D"mailto:changqing.li@eng.windriver.com">changqing.li@eng.windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Changqing Li &=
lt;<a href=3D"mailto:changqing.li@windriver.com" target=3D"_blank" rel=3D"n=
oreferrer">changqing.li@windriver.com</a>&gt;<br>
<br>
Signed-off-by: Changqing Li &lt;<a href=3D"mailto:changqing.li@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">changqing.li@windriver.com</a>&gt;<=
br>
---<br>
=C2=A0recipes-extended/libvirt/libvirt-python.inc=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
=C2=A0recipes-extended/libvirt/{<a href=3D"http://libvirt_9.2.0.bb" rel=3D"=
noreferrer noreferrer" target=3D"_blank">libvirt_9.2.0.bb</a> =3D&gt; <a hr=
ef=3D"http://libvirt_9.3.0.bb" rel=3D"noreferrer noreferrer" target=3D"_bla=
nk">libvirt_9.3.0.bb</a>} | 2 +-<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename recipes-extended/libvirt/{<a href=3D"http://libvirt_9.2.0.bb" =
rel=3D"noreferrer noreferrer" target=3D"_blank">libvirt_9.2.0.bb</a> =3D&gt=
; <a href=3D"http://libvirt_9.3.0.bb" rel=3D"noreferrer noreferrer" target=
=3D"_blank">libvirt_9.3.0.bb</a>} (99%)<br>
<br>
diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended=
/libvirt/libvirt-python.inc<br>
index e4806df..b77df3b 100644<br>
--- a/recipes-extended/libvirt/libvirt-python.inc<br>
+++ b/recipes-extended/libvirt/libvirt-python.inc<br>
@@ -20,7 +20,7 @@ INSANE_SKIP:${PN}-dbg +=3D &quot;buildpaths&quot;<br>
<br>
=C2=A0SRC_URI +=3D &quot;<a href=3D"http://libvirt.org/sources/python/libvi=
rt-python-$%7BPV%7D.tar.gz;name=3Dlibvirt_python" rel=3D"noreferrer norefer=
rer" target=3D"_blank">http://libvirt.org/sources/python/libvirt-python-${P=
V}.tar.gz;name=3Dlibvirt_python</a>&quot;<br>
<br>
-SRC_URI[libvirt_python.sha256sum] =3D &quot;95cc190c57cb84e8ed2e1b8205b01a=
937e1a4bc19cc8865df19ca4470e6d7c1b&quot;<br>
+SRC_URI[libvirt_python.sha256sum] =3D &quot;9c761d88b4ddcf65b324043944da4f=
18f82471c74d9371d2372d3b4e0f19861b&quot;<br>
<br>
=C2=A0export LIBVIRT_API_PATH =3D &quot;${S}/docs/libvirt-api.xml&quot;<br>
=C2=A0export LIBVIRT_CFLAGS =3D &quot;-I${S}/include&quot;<br>
diff --git a/recipes-extended/libvirt/<a href=3D"http://libvirt_9.2.0.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">libvirt_9.2.0.bb</a> b/recip=
es-extended/libvirt/<a href=3D"http://libvirt_9.3.0.bb" rel=3D"noreferrer n=
oreferrer" target=3D"_blank">libvirt_9.3.0.bb</a><br>
similarity index 99%<br>
rename from recipes-extended/libvirt/<a href=3D"http://libvirt_9.2.0.bb" re=
l=3D"noreferrer noreferrer" target=3D"_blank">libvirt_9.2.0.bb</a><br>
rename to recipes-extended/libvirt/<a href=3D"http://libvirt_9.3.0.bb" rel=
=3D"noreferrer noreferrer" target=3D"_blank">libvirt_9.3.0.bb</a><br>
index 5e70470..e1bfb94 100644<br>
--- a/recipes-extended/libvirt/<a href=3D"http://libvirt_9.2.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libvirt_9.2.0.bb</a><br>
+++ b/recipes-extended/libvirt/<a href=3D"http://libvirt_9.3.0.bb" rel=3D"n=
oreferrer noreferrer" target=3D"_blank">libvirt_9.3.0.bb</a><br>
@@ -32,7 +32,7 @@ SRC_URI =3D &quot;<a href=3D"http://libvirt.org/sources/l=
ibvirt-$%7BPV%7D.tar.xz;name=3Dlibvirt" rel=3D"noreferrer noreferrer" targe=
t=3D"_blank">http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=3Dlibvirt=
</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-messon.build-remove-b=
uild-path-information-to-avoid-.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-SRC_URI[libvirt.sha256sum] =3D &quot;a07f501e99093ac1374888312be32182e799d=
e17407ed7547d0e469fae8188c5&quot;<br>
+SRC_URI[libvirt.sha256sum] =3D &quot;751179b08e5a73b6cfd93200d110df199eaa3=
973f3554ba2ebcbd71e272bebe1&quot;<br>
<br>
=C2=A0inherit meson gettext update-rc.d pkgconfig systemd useradd perlnativ=
e<br>
=C2=A0USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
-- <br>
2.25.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8073): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8073" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/8073</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/99084593/1050=
810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopro=
ject.org/mt/99084593/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--00000000000022314705fc5cb81b--

