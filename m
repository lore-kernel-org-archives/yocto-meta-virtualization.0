Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA581C02192
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 12:24:37 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.10805.1738758272791794810
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2025 04:24:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=OgqlGj4b;
 spf=pass (domain: gmail.com, ip: 209.85.216.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2f44353649aso9019756a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 04:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738758272; x=1739363072; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Ytwko0ps+cIXMkT7zOEBUcXbLKlqmGjhWInj1uEeRB0=;
        b=OgqlGj4bEtRmJI1/OeemFvuqAZ2lUz2cZxC0v3C3MgDL8P4s1DjBKFKQUI2nSjlusI
         5bptSGwBy9Z0+xMMUpNrRxgALde9BThV+u2CRvrhe1/dvcEYfciVqzisl7WgMIWBS9e8
         f20TaTSckR/mRrN13sja5NZcdCgT9p7xBe1MmGQ4s6eb6yah99mRYlh/bAMUq55SZpW6
         +WghdXojvugZWZYoZSfq+iu6v5WUGn4RvQpZvpFyzzmmj89Dv2q67ShWG3XYyCr6eZP4
         39HkHp1UcO5I5r7tRDVEzLRN6lrr7yP/TxIcOrG+3vx3xW5WNkCTikvGSgfQ6U0exYcC
         dgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738758272; x=1739363072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ytwko0ps+cIXMkT7zOEBUcXbLKlqmGjhWInj1uEeRB0=;
        b=osr8vA88EOA4RUtgzW5XEhRmAVhO+dCm4rBTZq54NO79PhYFiavYFUg967+vvESdyS
         2VWUCEmCKno3xYEUDMo0Rsx572U2je6HQCSSQgEeAewlx6eWBQtIQXyzPN0J2R/i0Yw3
         J6zomcb+qyxY1XDA6ycX6ic1oHePOn7cGbpwsYTytRshke7nlCwiP049LHDy7ARb0jB5
         5kpflQgBPUthVv+dSI4V4I9G7ckjjMaudJ2M04FgH4EBMbWPu6eaP3pLqMRnYDtPnS+3
         aPNK0u8qv9lzILivaFvSoRZGh4YbBkmvOGdDZAZEkz000y5WcL81hpWDuiOJdz86RpH9
         J5Ew==
X-Gm-Message-State: AOJu0Yz2wKPlYtdu54J6oU4nUag84CcSvc0XIba7j0DjrS3Hpbpdww2P
	l2dbdFXa3a/H3UCZDfNfoYdw6YxVw6PZ1q84v5bgUezr9GIxUam1w/jzKFrQs3F0JyEEsysuUiO
	VszHigdwnqv51F5EjTcMRPD+D0Q8=
X-Gm-Gg: ASbGncvAAMv5Go97oC2yFP3oyX11G5TO+P0nOJtxRGz+JUalP2zarQvTOXXDiaTDvt1
	lXDdONjtB1OJMmLZPik0ctIcRQyJJCS5kiRq66cVrb4KfG1hKvwiJAc1bM9NDHLnIxAO1BxfAbw
	==
X-Google-Smtp-Source: AGHT+IHJA0+bIBYykEYBXh+D0dSC13LFXfjzGVS+9znVgbNdPQO5lg4JZKSDEk+0FhWclUDumpj/9s68346c4szRtTo=
X-Received: by 2002:a17:90b:5288:b0:2ee:b4d4:78 with SMTP id
 98e67ed59e1d1-2f9e080f2a7mr4250399a91.24.1738758271927; Wed, 05 Feb 2025
 04:24:31 -0800 (PST)
MIME-Version: 1.0
References: <12196.1738732187186511335@lists.yoctoproject.org> <22391.1738748188874422514@lists.yoctoproject.org>
In-Reply-To: <22391.1738748188874422514@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 5 Feb 2025 07:24:20 -0500
X-Gm-Features: AWEUYZlLz8KmX0vAgkWDO65TYLo2D7aMcTcEk2fd6p4-6VYpS7LDtQy-Fhd3k5I
Message-ID: <CADkTA4ODQinSQg3YY6dsJ5D4VWckh508f262bRsf-MfG0CVC2w@mail.gmail.com>
Subject: Re: [meta-virtualization] [kirkstone][PATCH 1/1] runc-docker: upgrade
 1.1.4 -> 1.1.12
To: jonas.gorski@bisdn.de
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000026117d062d643586"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Feb 2025 12:24:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9120

--00000000000026117d062d643586
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 5, 2025 at 4:36=E2=80=AFAM Jonas Gorski via lists.yoctoproject.=
org
<jonas.gorski=3Dbisdn.de@lists.yoctoproject.org> wrote:

> Hi,
>
> On Wed, Feb  5, 2025 at 06:09 AM, Ranjitsinh Rathod wrote:
> > Hello Bruce,
> >
> > After this merge,
> > 0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch is
> getting
> > failed for runc-opencontainers as this recipe also uses this patch and
> not
> > upgraded to 1.1.12 and still uses 1.1.4.
> >
> > Is it possible to also upgrade runc-opencontainers to 1.1.12 to fix sam=
e
> CVEs
> > which we fixed for runc-docker, else we may need to maintain two patche=
s
> for
> > two different versions.
>
> I want to second that, especially since runc-opencontainers is the defaul=
t
> provider for virtual/runc in kirkstone, so this broke it for everyone not
> explicitly using runc-docker.
>
> Also the change of patch targets via patchdir isn't done in master; they
> still target git/src/import. I'm not sure it's a good idea to deviate how
> master is doing things. Makes backporting things harder.
>
>
Indeed, and I keep rejecting patches that unnecessarily use/change
patchdir, I missed this one in my haste.

I also always insist on upgrading both at the same time, and again, somehow
missed it.

My solution is simpler, I'm reverting the change in kirstone and will wait
for a resubmission that upgrades (and tests) both.

Bruce



> Best regards,
> Jonas
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9119):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9119
> Mute This Topic: https://lists.yoctoproject.org/mt/110709071/1050810
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

--00000000000026117d062d643586
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 5, 2025 at 4:36=
=E2=80=AFAM Jonas Gorski via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;jonas.gorski=3D<a href=3D"mailto:bisdn.de@lists.=
yoctoproject.org">bisdn.de@lists.yoctoproject.org</a>&gt; wrote:<br></div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On Wed, Feb=C2=A0 5, 2025 at 06:09 AM, Ranjitsinh Rathod wrote:<br>
&gt; Hello Bruce,<br>
&gt; <br>
&gt; After this merge,<br>
&gt; 0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch is get=
ting<br>
&gt; failed for runc-opencontainers as this recipe also uses this patch and=
 not<br>
&gt; upgraded to 1.1.12 and still uses 1.1.4.<br>
&gt; <br>
&gt; Is it possible to also upgrade runc-opencontainers to 1.1.12 to fix sa=
me CVEs<br>
&gt; which we fixed for runc-docker, else we may need to maintain two patch=
es for<br>
&gt; two different versions.<br>
<br>
I want to second that, especially since runc-opencontainers is the default =
provider for virtual/runc in kirkstone, so this broke it for everyone not e=
xplicitly using runc-docker.<br>
<br>
Also the change of patch targets via patchdir isn&#39;t done in master; the=
y still target git/src/import. I&#39;m not sure it&#39;s a good idea to dev=
iate how master is doing things. Makes backporting things harder.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Indeed, and I keep rejecting patches that unnecessarily=C2=
=A0use/change patchdir, I missed this one in my haste.</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">I also always insist on upgrading both at the=
 same time, and again, somehow missed it.</div><div class=3D"gmail_default"=
 style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"=
font-size:small">My solution is simpler, I&#39;m reverting the change in ki=
rstone and will wait for a resubmission that upgrades (and tests) both.</di=
v><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cla=
ss=3D"gmail_default" style=3D"font-size:small">Bruce</div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Best regards,<br>
Jonas<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9119): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9119" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9119</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110709071/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110709071/1050810</a><br>
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

--00000000000026117d062d643586--

