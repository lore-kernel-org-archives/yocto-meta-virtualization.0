Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E16EBC02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 12:37:27 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web10.10851.1738759041398335558
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 04:37:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ufo2d/nq;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-21644aca3a0so3136695ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 04:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738759041; x=1739363841; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=aaRTM/IstBGe/gudRpVus//OLxYqpZ4MAQ0lUiKWbSc=;
        b=Ufo2d/nqNAca3ky1Ww80wXj894fnj7QOLetyoUCY23tnLcXtPIw3PYRu8Q1PAc2oeN
         0pCzVghlbSIrHHxmfcYhP+TgsHcYxTRG0ljkszY0JtJeEwGtfZJJjfPHR1b4iWskazlj
         wBWpEIJKACRy1Uuz9F++BLgB605lz5pCDmr90jdgDW+8kH+hngjvk5VyGhoTg4wKkjft
         AF4/dftosAlIdcubbHTOKKioCcn+I+9eNz+v595pQ6lEbjGSoNns2esuY/JQsAILrr4p
         1FDOAPYIQk9q0nTGEXfpdox4/Ar9JVdmYgY2+Q3WcFe+r6PpHNWjW+oudEbVu/smuL+x
         fblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738759041; x=1739363841;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aaRTM/IstBGe/gudRpVus//OLxYqpZ4MAQ0lUiKWbSc=;
        b=ICNajv18TTwwOnKL2n05HKcIpTsXk/dtdxl7BlQIhLMqWYPgUQw/Gw3aOntBp214sn
         EdGsy19f7cr2V8Ra+z1NL7hWn9TMoXsxhynkd0b7CF15tYmVAmBvxAsHrj+BkULaE1JB
         ZXZ7I380V7AdwBvNoiCK9iQzmKEaGx3Tn/4QQWZRhnVEnARmT9I/j+jfZopx/mUdYrj/
         cuyHtdiOOZM2JfuxyqBnsTh/UxyWDMG0Kr0MIPUv2Zg/KIWyVoW9LXvzeiFz3/DpQlP+
         e3iP3J0Rhctk3rURf+5RKPwQbvqF2JKoK8Yral6NFs30JQhAfRIr2hJ32SHqQVx1ti2f
         DofA==
X-Gm-Message-State: AOJu0YxhEBiBNscyHnmC7Ohx++xDCkowTmTrgAQyYgq5As13nmNOwffD
	jZ31IuIL65V8q6scV2ov9CsorVS7vuDX0VzdfBLB2+dAQMBAHwL6+wrb65ZMCbTKT2XQIlDs4yH
	yAMeoMQ9ehD4AQrbt7coqajsm58Q=
X-Gm-Gg: ASbGnctbDBSZUtb1nY30oDHhmtEKLBebCmzN2yVi6m5wL17ILnSaGVozl+k6EmpewNg
	Vs9tAtNu11xORn/4gPXJXQt40cIyYHuDqitQYXsrHaRzTNnOq/Vqf2MTnZQ8MFjz+7eW1ZwTzKw
	==
X-Google-Smtp-Source: AGHT+IHivnotKyuicJqd/7pHQ1OvnFSpgfiAeUhF2AACfDbMuYrzCC1AdkaAQ6g4jPafd/G826Nq1ExjtUg4npC6Dbw=
X-Received: by 2002:a17:902:f54b:b0:21d:ccb9:e2b9 with SMTP id
 d9443c01a7336-21f17ec878fmr51589355ad.41.1738759040573; Wed, 05 Feb 2025
 04:37:20 -0800 (PST)
MIME-Version: 1.0
References: <20250204122034.2182589-1-divya.chellam@windriver.com>
In-Reply-To: <20250204122034.2182589-1-divya.chellam@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2025 07:37:09 -0500
X-Gm-Features: AWEUYZl1hDYQLbLq3qLeBzD3NPO6N5z1y-ZiKgyYLk2xh62R3fGU4avYCOJ_hlU
Message-ID: <CADkTA4Pr6kr51x6LSgCxwa1bqLhrn3LHg6qFGxfvVa8bGPm8dA@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/1] runc-docker: upgrade
 1.1.12 -> 1.1.14
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000f6a6b1062d6462b6"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 12:37:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9121

--000000000000f6a6b1062d6462b6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

See the conversion on the list.

You'll need to resubmit this, and the upgrade to 1.1.12

When updating runc-docker, you must also update runc-moby, and you'll note
that in master I dropped runc-docker on January 15th, so this is only
something that needs to happen for older releases.

Also, please don't change the root of the patches, switching to using
patchdir is unnecessary, and I won't take changes that do it.

Bruce

On Tue, Feb 4, 2025 at 7:21=E2=80=AFAM dchellam via lists.yoctoproject.org
<Divya.Chellam=3Dwindriver.com@lists.yoctoproject.org> wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
>
> Includes fix for CVE-2024-45310 and other bug fixes
>
> Changelog:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md
>
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  recipes-containers/runc/runc-docker_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/runc/runc-docker_git.bb
> b/recipes-containers/runc/runc-docker_git.bb
> index afecac67..72acdecb 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -2,13 +2,13 @@ include runc.inc
>
>  # Note: this rev is before the required protocol field, update when all
> components
>  #       have been updated to match.
> -SRCREV_runc-docker =3D "a9833ff391a71b30069a6c3f816db113379a4346"
> +SRCREV_runc-docker =3D "2c9f5602f0ba3d9da1c2596322dfc4e156844890"
>  SRC_URI =3D "git://
> github.com/opencontainers/runc;branch=3Drelease-1.1;name=3Drunc-docker;pr=
otocol=3Dhttps
> \
>
> file://0001-runc-Add-console-socket-dev-null.patch;patchdir=3Dsrc/import =
\
>
> file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch;pa=
tchdir=3Dsrc/import
> \
>
> file://0001-runc-docker-SIGUSR1-daemonize.patch;patchdir=3Dsrc/import \
>            "
>
> -RUNC_VERSION =3D "1.1.12"
> +RUNC_VERSION =3D "1.1.14"
>
>  CVE_PRODUCT =3D "runc"
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9117):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9117
> Mute This Topic: https://lists.yoctoproject.org/mt/110990505/1050810
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

--000000000000f6a6b1062d6462b6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">See=
 the conversion on the list.</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">You&#39;ll need to resubmit this, and the upgrade to 1.1.12=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">When updating runc-docker, you=
 must also update runc-moby, and you&#39;ll note that in master I dropped r=
unc-docker on January 15th, so this is only something that needs to happen =
for older releases.</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Also,=
 please don&#39;t change the root of the patches, switching to using patchd=
ir is unnecessary, and I won&#39;t take changes that do it.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail=
_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue,=
 Feb 4, 2025 at 7:21=E2=80=AFAM dchellam via <a href=3D"http://lists.yoctop=
roject.org">lists.yoctoproject.org</a> &lt;Divya.Chellam=3D<a href=3D"mailt=
o:windriver.com@lists.yoctoproject.org">windriver.com@lists.yoctoproject.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>From: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windriver.com" tar=
get=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
<br>
Includes fix for CVE-2024-45310 and other bug fixes<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://github.com/opencontainers/runc/blob/v1.1.14/CHANGELOG.md=
" rel=3D"noreferrer" target=3D"_blank">https://github.com/opencontainers/ru=
nc/blob/v1.1.14/CHANGELOG.md</a><br>
<br>
Signed-off-by: Divya Chellam &lt;<a href=3D"mailto:divya.chellam@windriver.=
com" target=3D"_blank">divya.chellam@windriver.com</a>&gt;<br>
Signed-off-by: Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.co=
m" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt;<br>
---<br>
=C2=A0recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a> | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" =
rel=3D"noreferrer" target=3D"_blank">runc-docker_git.bb</a> b/recipes-conta=
iners/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"noreferrer" target=
=3D"_blank">runc-docker_git.bb</a><br>
index afecac67..72acdecb 100644<br>
--- a/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
+++ b/recipes-containers/runc/<a href=3D"http://runc-docker_git.bb" rel=3D"=
noreferrer" target=3D"_blank">runc-docker_git.bb</a><br>
@@ -2,13 +2,13 @@ include runc.inc<br>
<br>
=C2=A0# Note: this rev is before the required protocol field, update when a=
ll components<br>
=C2=A0#=C2=A0 =C2=A0 =C2=A0 =C2=A0have been updated to match.<br>
-SRCREV_runc-docker =3D &quot;a9833ff391a71b30069a6c3f816db113379a4346&quot=
;<br>
+SRCREV_runc-docker =3D &quot;2c9f5602f0ba3d9da1c2596322dfc4e156844890&quot=
;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/opencontainers/r=
unc;branch=3Drelease-1.1;name=3Drunc-docker;protocol=3Dhttps" rel=3D"norefe=
rrer" target=3D"_blank">github.com/opencontainers/runc;branch=3Drelease-1.1=
;name=3Drunc-docker;protocol=3Dhttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-Add-console-sock=
et-dev-null.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-Makefile-respect-GOBU=
ILDFLAGS-for-runc-and-remove-re.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-runc-docker-SIGUSR1-d=
aemonize.patch;patchdir=3Dsrc/import \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-RUNC_VERSION =3D &quot;1.1.12&quot;<br>
+RUNC_VERSION =3D &quot;1.1.14&quot;<br>
<br>
=C2=A0CVE_PRODUCT =3D &quot;runc&quot;<br>
-- <br>
2.40.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9117): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9117" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9117</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110990505/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110990505/1050810</a><br>
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

--000000000000f6a6b1062d6462b6--

