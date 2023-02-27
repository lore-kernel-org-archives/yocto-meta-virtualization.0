Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940B8C64ED6
	for <webhook@archiver.kernel.org>; Mon, 27 Feb 2023 23:01:54 +0000 (UTC)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53])
 by mx.groups.io with SMTP id smtpd.web10.9978.1677538908794134490
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 27 Feb 2023 15:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QjhepYW0;
 spf=pass (domain: gmail.com, ip: 209.85.217.53, mailfrom: quaresma.jose@gmail.com)
Received: by mail-vs1-f53.google.com with SMTP id d7so13946773vsj.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 15:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLI9OdOyT1NREx9JUe9QqN9aAtroxU2O1ZQS5Mb6WwE=;
        b=QjhepYW0vrEipMtpmrDbuuYM/AwYVfqEvYmkaWcscNzdFMHOLuqtcODpK+bITKXm1q
         esjeq5vSFyg5qvvhUTn8MCRkhGIo5vtdsIIeeDqDLOYaTD8riOJXROlOSfLUvLQ3xQ34
         GALkkUscNgzC3WuxEWzd7GAd1TDkkwWzm24qsX1+s4KM8QsqRUzkptOy49mcGHYPd4Gm
         fe44FD2BqL55ByFEDYh792dp4J/aFUEmNp9LQ1YS09EYCGnGhj9nXyquytufBz7PouzN
         mz5IUOUCSc/c3Re2zLuEYyxDcW31sbZMsEd+bQNWw0WSPMI6+vHN4GqDqQLWzC+hRzAY
         9BPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZLI9OdOyT1NREx9JUe9QqN9aAtroxU2O1ZQS5Mb6WwE=;
        b=zsPmVw4uNLRYh7E3ZTX9tKQ7h735sjZ3OHE+WRDSER/DndQOrRi4qMARKgwlZqc0Mo
         F44mgcsgvn63OuU8SBxyILgtgai9+hsgDw69LsNhoLYXQkMlnoIhu/M4I2DN1qBrkXva
         R2isXOqlvHTaM7dhvqpuECUSB0bnyXmTPMImau9aj54/mV7lxaWcAwvvuAzl/EEjRtlp
         nw/KUUWE9+XfXwgQOIDRVDDqwyetblHI4p/OEZeaZuTwUGhUxHLdNpTcKrP9S/rNYNHa
         llEa+LL5gLJ3y/guk+ubUq+f8J3cU+YA0KVvPjSEohqlOhWzlk2jHPIf1PePhOgPtlPr
         tXrQ==
X-Gm-Message-State: AO0yUKVKO5r0obypfsPBzmvyfza6C3Xf4ophb6nJ5hsNE2+afviubw8u
	Jy21LIaFYWohxb0EG6w5g0b/rWqSHY31JPEsw+g=
X-Google-Smtp-Source: AK7set8zXcC6t27Rhj2KGw2n13tC86WEsZsLBt7Flnvoj/13vpzYdoOoH3254TfsWDL680loZbzCR+C+X2ZDDc5bQAA=
X-Received: by 2002:ab0:4a97:0:b0:68a:6c1e:1aab with SMTP id
 s23-20020ab04a97000000b0068a6c1e1aabmr379931uae.2.1677538907548; Mon, 27 Feb
 2023 15:01:47 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
In-Reply-To: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Mon, 27 Feb 2023 23:01:36 +0000
Message-ID: <CANPvuRm=zfh+BeAQFxoQXSK3wuboVV=kAQmh44GoUyDqGyeQbw@mail.gmail.com>
Subject: Re: [meta-virtualization] go breakage in master
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, volodymyr.khoroz@foundries.io, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="000000000000ae729705f5b676b1"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 27 Feb 2023 23:01:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7905

--000000000000ae729705f5b676b1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I have seen recently some weird issues on the crypto/elliptic that is
deprecated and replaced by crypto/ecdh on the 1.20 release [1].
It looks like the crypto/elliptic is now no more than a compatibility
wrapper and the new crypto/ecdh don't implement the P-224 curves [2].

Are you facing something like this?

type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Add
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Add
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).CombinedMul=
t
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).CombinedMul=
t
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Double
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Double
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).IsOnCurve
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).IsOnCurve
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Params
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Params
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarBaseM=
ult
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarBaseM=
ult
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarMult
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarMult
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).UnmarshalCo=
mpressed
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).UnmarshalCo=
mpressed
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).normalizeSc=
alar
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).normalizeSc=
alar
type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
unreachable sym in relocation:
crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).pointFromAf=
fine

[1] https://tip.golang.org/doc/go1.20
[2] https://words.filippo.io/dispatches/go-1-20-cryptography

Jose

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta,
23/02/2023 =C3=A0(s) 13:29:

> Just a heads up that some of the go applications are breaking in master.
>
> I'm aware of the issue, and have a general fix in progress.
>
> Bruce
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7896):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7896
> Mute This Topic: https://lists.yoctoproject.org/mt/97182310/5052612
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/50526=
12/94736074/xyzzy
> [quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--000000000000ae729705f5b676b1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Bruce,</div><br>I have seen recently some weird is=
sues on the crypto/elliptic that is deprecated=C2=A0and replaced by=C2=A0cr=
ypto/ecdh on the 1.20 release [1].<br>It looks like the crypto/elliptic is =
now no more than a compatibility wrapper and the new crypto/ecdh don&#39;t =
implement the P-224 curves [2].<div><br>Are you facing something like this?=
<br><br>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:=
 unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/interna=
l/nistec.P224Point]).Add<br>type:*crypto/elliptic.nistCurve[*crypto/interna=
l/nistec.P224Point]: unreachable sym in relocation: crypto/elliptic.(*nistC=
urve[*crypto/internal/nistec.P224Point]).Add<br>type:*crypto/elliptic.nistC=
urve[*crypto/internal/nistec.P224Point]: unreachable sym in relocation: cry=
pto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).CombinedMult<b=
r>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).CombinedMult<br>type:*crypto/elliptic.nistCurve[*crypto/inte=
rnal/nistec.P224Point]: unreachable sym in relocation: crypto/elliptic.(*ni=
stCurve[*crypto/internal/nistec.P224Point]).Double<br>type:*crypto/elliptic=
.nistCurve[*crypto/internal/nistec.P224Point]: unreachable sym in relocatio=
n: crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Double<b=
r>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).IsOnCurve<br>type:*crypto/elliptic.nistCurve[*crypto/interna=
l/nistec.P224Point]: unreachable sym in relocation: crypto/elliptic.(*nistC=
urve[*crypto/internal/nistec.P224Point]).IsOnCurve<br>type:*crypto/elliptic=
.nistCurve[*crypto/internal/nistec.P224Point]: unreachable sym in relocatio=
n: crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Params<b=
r>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unrea=
chable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nist=
ec.P224Point]).Params<br>type:*crypto/elliptic.nistCurve[*crypto/internal/n=
istec.P224Point]: unreachable sym in relocation: crypto/elliptic.(*nistCurv=
e[*crypto/internal/nistec.P224Point]).ScalarBaseMult<br>type:*crypto/ellipt=
ic.nistCurve[*crypto/internal/nistec.P224Point]: unreachable sym in relocat=
ion: crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Scalar=
BaseMult<br>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Poi=
nt]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/int=
ernal/nistec.P224Point]).ScalarMult<br>type:*crypto/elliptic.nistCurve[*cry=
pto/internal/nistec.P224Point]: unreachable sym in relocation: crypto/ellip=
tic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarMult<br>type:*cry=
pto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unreachable sym =
in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Poin=
t]).Unmarshal<br>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P2=
24Point]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypt=
o/internal/nistec.P224Point]).Unmarshal<br>type:*crypto/elliptic.nistCurve[=
*crypto/internal/nistec.P224Point]: unreachable sym in relocation: crypto/e=
lliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).UnmarshalCompressed=
<br>type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unr=
eachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/ni=
stec.P224Point]).UnmarshalCompressed<br>type:*crypto/elliptic.nistCurve[*cr=
ypto/internal/nistec.P224Point]: unreachable sym in relocation: crypto/elli=
ptic.(*nistCurve[*crypto/internal/nistec.P224Point]).normalizeScalar<br>typ=
e:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]: unreachabl=
e sym in relocation: crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P2=
24Point]).normalizeScalar<br>type:*crypto/elliptic.nistCurve[*crypto/intern=
al/nistec.P224Point]: unreachable sym in relocation: crypto/elliptic.(*nist=
Curve[*crypto/internal/nistec.P224Point]).pointFromAffine<br><br>[1] <a hre=
f=3D"https://tip.golang.org/doc/go1.20" target=3D"_blank">https://tip.golan=
g.org/doc/go1.20</a><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">[2] <a href=3D"https://words.filippo.io/dispatches/go-1-20-=
cryptography" target=3D"_blank">https://words.filippo.io/dispatches/go-1-20=
-cryptography</a><br><br></div><div class=3D"gmail_attr">Jose</div><div cla=
ss=3D"gmail_attr"><br></div><div dir=3D"ltr" class=3D"gmail_attr">Bruce Ash=
field &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bru=
ce.ashfield@gmail.com</a>&gt; escreveu no dia quinta, 23/02/2023 =C3=A0(s) =
13:29:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Just a he=
ads up that some of the go applications are breaking in master.<br>
<br>
I&#39;m aware of the issue, and have a general fix in progress.<br>
<br>
Bruce<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7896): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7896" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7896</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97182310/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/97182310/5052612</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/leave/11553848/5052612/94736074/xyzzy" rel=3D"noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/leave/11553848/5052=
612/94736074/xyzzy</a> [<a href=3D"mailto:quaresma.jose@gmail.com" target=
=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div=
></div></div>

--000000000000ae729705f5b676b1--

