Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACDF1C5AD49
	for <webhook@archiver.kernel.org>; Thu, 29 May 2025 13:24:16 +0000 (UTC)
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web10.20969.1748525051437653753
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 May 2025 06:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=F2r3BNQX;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3109f106867so1014572a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 06:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748525051; x=1749129851; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QigpDAXmDUYAu/MocCCI6nlp9lTCv/t8AgiRDvgRrv4=;
        b=F2r3BNQXIR+dFpCbrknmqar3vFodtawcuuzPm8ztiGYuYEL7g43OEVNVWd5QJSKNSb
         Y710+Bkr8yHUriKQ5nCLr8AsuYhiLeQBLJlKd3kR5o8Mg/mRUdmK8xEA1TLoDT0h5EWx
         91Vc2aX/Weg0jnlr3EIFvnVcWEvKH70PSR04py0Ozyx0AUoBlnlZMt+Kwoo+rF1i/1p+
         hr3OVx99Nq0YqhlmdWMBOZK/vWrMlkwt1KhDyHVRUQqXt+DgKCknZzjYX4GAzjoLDHyj
         hOEPvwZTGe/TeJQbzG1KyqFjy3GIVKOapR9hupL60KqHDsdE2EuTs43/qbwVU+KXDlGL
         hIcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748525051; x=1749129851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QigpDAXmDUYAu/MocCCI6nlp9lTCv/t8AgiRDvgRrv4=;
        b=cSqrklbH03WiAHmwvLxmowtk7KMnvkdVPACfPCKuFaqwocchwfMiV3iTHrU7rMERgp
         u0bJ5/rWXw7PgA6qCE4mSJH7SnXc8SM7l4z5wy3hSiOJ8O3IjE85tWEvPExRx9b3jtPt
         YEDIZoxqepZO7QxZvbANHcGO8/um6qVKq2fbNAYlGwnEBBVwV9ePbGYkejFGIzcMNoI6
         OeQsUhUztcwwliydOs+KoAcmVJumr+jMJGlL9hVoPJjOMQku1wLHg/0He4iSwTmp8JEO
         WhffD1PxodT67VdGfSZxFq7+/hyaFZOE6nnqb/xnFxhDYRPue3RN3Gw/MZXTd4Cl9lyZ
         b8PA==
X-Forwarded-Encrypted: i=1; AJvYcCURZ3F6iFELNdKKCWJLIAwe5aCTnGEnVbmKkuC6P9HeSNM7EAantvTgqM18zdRQ0WABNf9gLdaxkXu15N8jELT8vT49@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yz0SRYhHdaHEAyx57vH4Fqwul51TfwfuDu66Mv2qXcu7kdrtdPT
	+cOJnlDXa+5gsW95wbBjZob6/bupREw6lITY3iPzyildceDnMNE89UP/AmpOY7SlMgGv245qvzi
	JIZWnbrR0QZiaCnHWGK+o84Ki0R0yrZI=
X-Gm-Gg: ASbGnctujqlsuh56dUlyJDk2D9xXkHVVDtGedo3p8usCeUc28DQ2fBNTEMX6Q/0qUj4
	GjF4FF2ny7Qax55iyxikqKIfRHrQUSlnjC/ioHHYoRs4sXFBqP8rHxZri7mh8hXh+t5MO8hqRXi
	8FvyIOVrD+YbMu5DYm3JNefmudyeu4iHcvnjrVmkTI8PE0
X-Google-Smtp-Source: AGHT+IE2h0WSXuDxXGheC1f51reQ4Y1pWkr98WNuHIs3fIaN0wF+4JLy9BgrH+spz3EqM6mY8TbclVo0qMpOeiv8dr8=
X-Received: by 2002:a17:90a:ec90:b0:311:e8cc:4253 with SMTP id
 98e67ed59e1d1-3121dc215f0mr3788405a91.2.1748525050574; Thu, 29 May 2025
 06:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250529035110.1881797-1-Qi.Chen@windriver.com> <18440159446548C9.8712@lists.yoctoproject.org>
In-Reply-To: <18440159446548C9.8712@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 May 2025 09:24:06 -0400
X-Gm-Features: AX0GCFv_4aDJrKSG-CDcEoJLFV4LLXlufbj9y8KVFTMf9XA9dEQ7B1E7UGTb0wE
Message-ID: <CADkTA4NsMJ58FALS55QOOhwcgBDXRBaxs_dqBnoh8oCq_wt3mg@mail.gmail.com>
Subject: Re: [meta-virtualization][master][walnascar][PATCH 1/3]
 docker-distribution: bump to v3.0.0 stable version
To: bruce.ashfield@gmail.com
Cc: Qi.Chen@windriver.com, meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000853ccd06364636de"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 May 2025 13:24:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9266

--000000000000853ccd06364636de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I should clarify that my statement doesn't mean I won't take the change,
just that some of the commits will be slightly different and that it won't
be in the tree for a few weeks yet.

Bruce

On Thu, May 29, 2025 at 9:07=E2=80=AFAM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

> As I've mentioned before, I'm not doing package upgrades at the moment.
>
> A full pass of the recipes will happen at the m2 timeframe of the current
> release.
>
> Cheers,
>
> Bruce
>
> On Wed, May 28, 2025 at 11:51=E2=80=AFPM Chen Qi via lists.yoctoproject.o=
rg
> <Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable
>> version.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  .../docker-distribution/docker-distribution_git.bb            | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/recipes-containers/docker-distribution/
>> docker-distribution_git.bb b/recipes-containers/docker-distribution/
>> docker-distribution_git.bb
>> index 495b0d17..41c4e227 100644
>> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
>> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
>> @@ -3,7 +3,7 @@ SUMMARY =3D "The Docker toolset to pack, ship, store, an=
d
>> deliver content"
>>  LICENSE =3D "Apache-2.0"
>>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dd2794c0df5b907fdace235a619d8=
0314"
>>
>> -SRCREV_distribution =3D "f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a"
>> +SRCREV_distribution =3D "9ed95e7365224025ee89365e12cf128e1f1bf965"
>>  SRC_URI =3D "git://
>> github.com/docker/distribution.git;branch=3Dmain;name=3Ddistribution;des=
tsuffix=3Dgit/src/github.com/distribution/distribution/v3;protocol=3Dhttps
>> \
>>             file://docker-registry.service \
>>             file://0001-build-use-to-use-cross-go-compiler.patch \
>> @@ -11,7 +11,7 @@ SRC_URI =3D "git://
>> github.com/docker/distribution.git;branch=3Dmain;name=3Ddistributio
>>
>>  PACKAGES =3D+ "docker-registry"
>>
>> -PV =3D "v3.0.0-beta.1"
>> +PV =3D "v3.0.0"
>>  S =3D "${WORKDIR}/git/src/github.com/distribution/distribution/v3"
>>
>>  GO_IMPORT =3D "import"
>> --
>> 2.34.1
>>
>>
>>
>>
>>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
> at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9265):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9265
> Mute This Topic: https://lists.yoctoproject.org/mt/113356930/1050810
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

--000000000000853ccd06364636de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I s=
hould clarify that my statement doesn&#39;t mean I won&#39;t take the chang=
e, just that some of the commits will be slightly different and that it won=
&#39;t be in the tree for a few weeks yet.</div><div class=3D"gmail_default=
" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D=
"font-size:small">Bruce</div></div><br><div class=3D"gmail_quote gmail_quot=
e_container"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 29, 2025 at =
9:07=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org=
">lists.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.c=
om@lists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"=
><div class=3D"gmail_default" style=3D"font-size:small">As I&#39;ve mention=
ed before, I&#39;m not doing package upgrades at the moment.</div><div clas=
s=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail=
_default" style=3D"font-size:small">A full pass of the recipes will happen =
at the m2 timeframe of the current release.</div><div class=3D"gmail_defaul=
t" style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=
=3D"font-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">Bruce</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Wed, May 28, 2025 at 11:51=E2=80=AFPM Chen Qi via <a hre=
f=3D"http://lists.yoctoproject.org" target=3D"_blank">lists.yoctoproject.or=
g</a> &lt;Qi.Chen=3D<a href=3D"mailto:windriver.com@lists.yoctoproject.org"=
 target=3D"_blank">windriver.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">From: Chen Qi &lt;<a=
 href=3D"mailto:Qi.Chen@windriver.com" target=3D"_blank">Qi.Chen@windriver.=
com</a>&gt;<br>
<br>
Bump docker-distribution from v3.0.0-beta.1 to v3.0.0 stable<br>
version.<br>
<br>
Signed-off-by: Chen Qi &lt;<a href=3D"mailto:Qi.Chen@windriver.com" target=
=3D"_blank">Qi.Chen@windriver.com</a>&gt;<br>
---<br>
=C2=A0.../docker-distribution/<a href=3D"http://docker-distribution_git.bb"=
 rel=3D"noreferrer" target=3D"_blank">docker-distribution_git.bb</a>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/recipes-containers/docker-distribution/<a href=3D"http://docke=
r-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribu=
tion_git.bb</a> b/recipes-containers/docker-distribution/<a href=3D"http://=
docker-distribution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-dis=
tribution_git.bb</a><br>
index 495b0d17..41c4e227 100644<br>
--- a/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
+++ b/recipes-containers/docker-distribution/<a href=3D"http://docker-distr=
ibution_git.bb" rel=3D"noreferrer" target=3D"_blank">docker-distribution_gi=
t.bb</a><br>
@@ -3,7 +3,7 @@ SUMMARY =3D &quot;The Docker toolset to pack, ship, store, =
and deliver content&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2.0&quot;<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://LICENSE;md5=3Dd2794c0df5b907fdace23=
5a619d80314&quot;<br>
<br>
-SRCREV_distribution =3D &quot;f22dd6186008ff9d35f92acc5bc5fd16ba7ef95a&quo=
t;<br>
+SRCREV_distribution =3D &quot;9ed95e7365224025ee89365e12cf128e1f1bf965&quo=
t;<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://github.com/docker/distribut=
ion.git;branch=3Dmain;name=3Ddistribution;destsuffix=3Dgit/src/github.com/d=
istribution/distribution/v3;protocol=3Dhttps" rel=3D"noreferrer" target=3D"=
_blank">github.com/docker/distribution.git;branch=3Dmain;name=3Ddistributio=
n;destsuffix=3Dgit/src/github.com/distribution/distribution/v3;protocol=3Dh=
ttps</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://docker-registry.service \<=
br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-build-use-to-use-cros=
s-go-compiler.patch \<br>
@@ -11,7 +11,7 @@ SRC_URI =3D &quot;git://<a href=3D"http://github.com/dock=
er/distribution.git;branch=3Dmain;name=3Ddistributio" rel=3D"noreferrer" ta=
rget=3D"_blank">github.com/docker/distribution.git;branch=3Dmain;name=3Ddis=
tributio</a><br>
<br>
=C2=A0PACKAGES =3D+ &quot;docker-registry&quot;<br>
<br>
-PV =3D &quot;v3.0.0-beta.1&quot;<br>
+PV =3D &quot;v3.0.0&quot;<br>
=C2=A0S =3D &quot;${WORKDIR}/git/src/<a href=3D"http://github.com/distribut=
ion/distribution/v3" rel=3D"noreferrer" target=3D"_blank">github.com/distri=
bution/distribution/v3</a>&quot;<br>
<br>
=C2=A0GO_IMPORT =3D &quot;import&quot;<br>
-- <br>
2.34.1<br>
<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9265): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9265" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9265</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/113356930/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/113356930/1050810</a><br>
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

--000000000000853ccd06364636de--

