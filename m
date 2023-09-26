Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D0D5E7E642
	for <webhook@archiver.kernel.org>; Tue, 26 Sep 2023 14:38:04 +0000 (UTC)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com [209.85.166.47])
 by mx.groups.io with SMTP id smtpd.web11.20581.1695739074747596759
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 26 Sep 2023 07:37:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mR4WfQrZ;
 spf=pass (domain: gmail.com, ip: 209.85.166.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f47.google.com with SMTP id ca18e2360f4ac-79fb78e297bso200215939f.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695739074; x=1696343874; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dwLTnVnHZ9JH5pHsYLtzxKkJfSc36avVIL9huj+tMVM=;
        b=mR4WfQrZINcZSpswrefSdl412QTULUmToNDkQZLRCwuU+xK8qUw65Ml1kZoFDUic54
         +nBQXWQJnVXr75I/8Z+x5rjA3xodNzuIC2zgE5UvGIadOayZbasBvaZ/Vpu6LDcMxskk
         qHpjX03b3g5L+hBmAihERNXrQdylV90vwkzEvm7ye9IZiuUE+k9N3AoiSP64TjIvFSLa
         36SK5w94ui0VC//7HyBk0tHLR8Y1pOy/1B7hQIJF6jjndmVNI1IziGIcuTsMiGD481Pw
         jqW2NMIPquCN4rbBbz0pNx8vld7f3jt+4Ad4JNCtAjZSZ4rVcPgn/GdBTPzj0/0azjKc
         9Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695739074; x=1696343874;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwLTnVnHZ9JH5pHsYLtzxKkJfSc36avVIL9huj+tMVM=;
        b=wtVGY9yWYgebmNsbEjoN+E3kvuV2dLJEIxse4Y0eENU7qp4PCzv7F6aBqsY5NI3ofS
         8btHGJ+iOmpYjl/SJXu1rMDZ4UA9jGkRQdJZU+95GYs2UImNoN9Gv6S4l7ObyE8khJba
         ex7oEgkT/k2U5/XlTzhBhQGnZjUK0UoLQ+y38g+iWJTWbsUYYuGwqOl4XjfhdxYX5Y75
         6rEEKpwqo+EDfHWbMOh6GtvP+p0AsAW6lpctTCoWZWiiUOzYGg3F4ffbM5oyMt7sUCUz
         OZx/wPixepCn7OX0wFgPI6DDnLFPAvW6kriJSas4SO4RXzMLn3JFJJfRbNj0xpf55BAC
         hbxw==
X-Gm-Message-State: AOJu0Yz2dQEBbQVn3Fm06hV5avkG+2zNFe1uuOA/QiHQyUWnee8pdTzS
	NfPw26CIt/YFHBRCCHBi0EqJJApmbBbtZT7eGgw=
X-Google-Smtp-Source: AGHT+IEbEsUkZwn2ibym/5AY8PwiSg2Ym2N9EY/tKWynw9N06oicnhQwmhlliA/qAPzSL6A6nhTJ26Qb0E/XaSunngc=
X-Received: by 2002:a5e:aa07:0:b0:792:6963:df3b with SMTP id
 s7-20020a5eaa07000000b007926963df3bmr10177866ioe.14.1695739073804; Tue, 26
 Sep 2023 07:37:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230926142614.1793757-1-martin.jansa@gmail.com>
In-Reply-To: <20230926142614.1793757-1-martin.jansa@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 26 Sep 2023 10:37:43 -0400
Message-ID: <CADkTA4PBE2+56zochw=vPskHCEJP0sTXArwq-jfjTtK15Y+pig@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libslirp-virt: remove
To: Martin Jansa <martin.jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000203faa060644057b"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 26 Sep 2023 14:38:04 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8323

--000000000000203faa060644057b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 26, 2023 at 10:26=E2=80=AFAM Martin Jansa <martin.jansa@gmail.c=
om>
wrote:

> * it conflicts with libslipr now as discussed in:
>   https://lists.openembedded.org/g/openembedded-core/message/188157
>   and
> https://git.yoctoproject.org/meta-virtualization/commit/recipes-networkin=
g/slirp?id=3D543f4e6b5f6be0d397bcc78e22d5ca9a970b7111
>   said it will be removed after slirp4netns verification in runtime, but
>   slirp4netns_git.bb DEPENDS on libslirp not libslirp-virt so we can drop
>   unused libslirp-virt recipe to fix possible conflict (e.g. in world
> builds):
>
>   ERROR: Recipe libslirp-virt is trying to install files into a shared
> area when those files already exist. The files and the manifests listing
> them are:
>   TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dev
>     (matched in manifest-qemux86_64-libslirp.packagedata)
>   TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dbg
>     (matched in manifest-qemux86_64-libslirp.packagedata)
>   TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp0
>     (matched in manifest-qemux86_64-libslirp.packagedata)
>   TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-src
>     (matched in manifest-qemux86_64-libslirp.packagedata)
>

As I mentioned on IRC, I was testing this (and still am).  I ran into a
strange runtime issue. So I'm
not at the point where I'm ready to drop the recipe.

I'll switch to libvirt-slirp, or remove the recipe once I can root cause
the error.

In the meantime, I'll add an exclude from world, and that should solve the
world build issue.

Bruce



>
> Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> ---
>  recipes-networking/slirp/libslirp-virt_git.bb | 14 --------------
>  1 file changed, 14 deletions(-)
>  delete mode 100644 recipes-networking/slirp/libslirp-virt_git.bb
>
> diff --git a/recipes-networking/slirp/libslirp-virt_git.bb
> b/recipes-networking/slirp/libslirp-virt_git.bb
> deleted file mode 100644
> index 9f6dc627..00000000
> --- a/recipes-networking/slirp/libslirp-virt_git.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -SUMMARY =3D "A general purpose TCP-IP emulator"
> -LICENSE =3D "BSD-3-Clause & MIT"
> -LIC_FILES_CHKSUM =3D "file://COPYRIGHT;md5=3Dbca0186b14e6b05e338e729f106=
db727"
> -
> -SRC_URI =3D "git://
> gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dhttps;branch=3Dmaste=
r"
> -SRCREV =3D "888ddad6bde1dc6d7dbfc8daa7d015251b72e02c"
> -PV =3D "4.6.1+git"
> -S =3D "${WORKDIR}/git"
> -
> -DEPENDS =3D " \
> -    glib-2.0 \
> -"
> -
> -inherit meson pkgconfig
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8322):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8322
> Mute This Topic: https://lists.yoctoproject.org/mt/101596711/1050810
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

--000000000000203faa060644057b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Tue, Sep 26, 2023 at 10:26=E2=80=AFAM Martin Jan=
sa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">* it=
 conflicts with libslipr now as discussed in:<br>
=C2=A0 <a href=3D"https://lists.openembedded.org/g/openembedded-core/messag=
e/188157" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/g/openembedded-core/message/188157</a><br>
=C2=A0 and <a href=3D"https://git.yoctoproject.org/meta-virtualization/comm=
it/recipes-networking/slirp?id=3D543f4e6b5f6be0d397bcc78e22d5ca9a970b7111" =
rel=3D"noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-virt=
ualization/commit/recipes-networking/slirp?id=3D543f4e6b5f6be0d397bcc78e22d=
5ca9a970b7111</a><br>
=C2=A0 said it will be removed after slirp4netns verification in runtime, b=
ut<br>
=C2=A0 <a href=3D"http://slirp4netns_git.bb" rel=3D"noreferrer" target=3D"_=
blank">slirp4netns_git.bb</a> DEPENDS on libslirp not libslirp-virt so we c=
an drop<br>
=C2=A0 unused libslirp-virt recipe to fix possible conflict (e.g. in world =
builds):<br>
<br>
=C2=A0 ERROR: Recipe libslirp-virt is trying to install files into a shared=
 area when those files already exist. The files and the manifests listing t=
hem are:<br>
=C2=A0 TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dev<br>
=C2=A0 =C2=A0 (matched in manifest-qemux86_64-libslirp.packagedata)<br>
=C2=A0 TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-dbg<br>
=C2=A0 =C2=A0 (matched in manifest-qemux86_64-libslirp.packagedata)<br>
=C2=A0 TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp0<br>
=C2=A0 =C2=A0 (matched in manifest-qemux86_64-libslirp.packagedata)<br>
=C2=A0 TOPDIR/BUILD/pkgdata/qemux86-64/runtime-reverse/libslirp-src<br>
=C2=A0 =C2=A0 (matched in manifest-qemux86_64-libslirp.packagedata)<br></bl=
ockquote><div><br></div><div><div class=3D"gmail_default" style=3D"font-siz=
e:small">As I mentioned on IRC, I was testing this (and still am).=C2=A0 I =
ran into a strange runtime issue. So I&#39;m</div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">not at the point where I&#39;m ready to drop =
the recipe.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:smal=
l"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;l=
l switch to libvirt-slirp, or remove the recipe once I can root cause the e=
rror.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div=
><div class=3D"gmail_default" style=3D"font-size:small">In the meantime, I&=
#39;ll add an exclude from world, and that should solve the world build iss=
ue.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" t=
arget=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-networking/slirp/<a href=3D"http://libslirp-virt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libslirp-virt_git.bb</a> | 14 -----------=
---<br>
=C2=A01 file changed, 14 deletions(-)<br>
=C2=A0delete mode 100644 recipes-networking/slirp/<a href=3D"http://libslir=
p-virt_git.bb" rel=3D"noreferrer" target=3D"_blank">libslirp-virt_git.bb</a=
><br>
<br>
diff --git a/recipes-networking/slirp/<a href=3D"http://libslirp-virt_git.b=
b" rel=3D"noreferrer" target=3D"_blank">libslirp-virt_git.bb</a> b/recipes-=
networking/slirp/<a href=3D"http://libslirp-virt_git.bb" rel=3D"noreferrer"=
 target=3D"_blank">libslirp-virt_git.bb</a><br>
deleted file mode 100644<br>
index 9f6dc627..00000000<br>
--- a/recipes-networking/slirp/<a href=3D"http://libslirp-virt_git.bb" rel=
=3D"noreferrer" target=3D"_blank">libslirp-virt_git.bb</a><br>
+++ /dev/null<br>
@@ -1,14 +0,0 @@<br>
-SUMMARY =3D &quot;A general purpose TCP-IP emulator&quot;<br>
-LICENSE =3D &quot;BSD-3-Clause &amp; MIT&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYRIGHT;md5=3Dbca0186b14e6b05e338e729f=
106db727&quot;<br>
-<br>
-SRC_URI =3D &quot;git://<a href=3D"http://gitlab.freedesktop.org/slirp/lib=
slirp.git;protocol=3Dhttps;branch=3Dmaster" rel=3D"noreferrer" target=3D"_b=
lank">gitlab.freedesktop.org/slirp/libslirp.git;protocol=3Dhttps;branch=3Dm=
aster</a>&quot;<br>
-SRCREV =3D &quot;888ddad6bde1dc6d7dbfc8daa7d015251b72e02c&quot;<br>
-PV =3D &quot;4.6.1+git&quot;<br>
-S =3D &quot;${WORKDIR}/git&quot;<br>
-<br>
-DEPENDS =3D &quot; \<br>
-=C2=A0 =C2=A0 glib-2.0 \<br>
-&quot;<br>
-<br>
-inherit meson pkgconfig<br>
-- <br>
2.42.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8322): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8322" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8322</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101596711/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101596711/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000203faa060644057b--

