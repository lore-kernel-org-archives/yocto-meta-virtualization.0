Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA06DFF885D
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:23:53 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11066.1777375432142734683
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:23:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AKgB6i9e;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-35da9c0c007so9657721a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777375431; cv=none;
        d=google.com; s=arc-20240605;
        b=HpMaE+tMo1RcqGAbTGEYrxEsw0wUtnYmOM90yMa9EAO4KSlL4g9LRNArK2M9CKfKkm
         6210OHsW11+o5IApNu1njv4HbmCqONvj+gC8gh/pd3H6mgGSdJNuXE6wigCPZGdN6x7i
         RbzcHJpBoIdOUig80Xq64TVC2lSpAcfR9Cv/CZQ35hKKUhx5hUXRbexgtpkLs/GNm/Ks
         fitCx1/cuwtgcK4kuA5zz2fDl5loC3bcZEefqsZd/bx+/VfBEqiCYeLfkKGZrIEFvnTS
         uYDzCS8eD0WyZ4060/B/HwSachsrhkhvCpdQ5lPC25x6ddsfiC5Q5Uf4vfP+mIBxPagM
         fbPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yLmz+XS13MqCGbEJGeNhuuCQHabISDiuSlOebddcncc=;
        fh=msz0JO98b8iXgFkacINEqWk35UuiAWCVkDUIE9HiYW4=;
        b=YyXQKghUw9IRM5YmEaUpw1fPKUrHIJXjSJvWPVm1au1OsKjDGf6FOVJCjEBq/hTc49
         YVdOjZsbfMClEC7W6e+m3q+QXcefUCIM0SnQAn6wINkGKtXVJDuKqXcqgL0UEGFBcml8
         tFkDAtK2hvG4h9OAPjaZ7DVZHLx8QaoDLHKwE8SOaFyMXvX/QwMsAhngXTtoABs5a4d+
         SYqOz7aT8U50CZQ1fjWeSLMO3ktivY4tPVYrneXIS2hXtqrBCQHfvkDuCSDtaFnwAOzR
         XBZKWr7RsDA3HqhvNBHngiA6zdDFPfjCxtw2Gboo0bTBv/NrQa0V4nNk9AJX4BRL9EuP
         eWxg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777375431; x=1777980231; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yLmz+XS13MqCGbEJGeNhuuCQHabISDiuSlOebddcncc=;
        b=AKgB6i9e6YjPT1pGAywIEV38I1t5rPCEeionr69kX7xRBrKFcnQIv8SRlLRxkYnAa1
         SYyK35U2gduoj2EVIFy/hIHQF3MCbELMKzOT8a4LbtYH6FPDtmV2LTTMipVH3awz5ZRR
         u4byndWWie5fJfq+bZ75eHKMVFjl1ZDXU17ByugeusY4nJxsMRHqGmWcQi/rKhzJ6Lx7
         F5MTrASiO4ZJMUJuoHcuPrUpSYmls/GzO0bPvkb2u0HU+fhKBjRU8rHICcJqMwo1ZU/e
         jhQjPeVovxY7C8tCyxEC9KmREWPuqyPhF6KaM1sikfsLk4gdklAdNbNyLFZthgsudRH7
         ddVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777375431; x=1777980231;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yLmz+XS13MqCGbEJGeNhuuCQHabISDiuSlOebddcncc=;
        b=mSB9LXm44khKv6iDbgMm30zK+NHK1WHshxeg0hmvGyWkpWSkmck2MWUTszPA8H/s6e
         bNr4Pfj+raAsIOpRtMHMymtYuNFxoKTEV3TsaJ6S04bBGW2efC/a4RrlCrT4qvJObLgB
         /xaGT5MMNCqaekkT3CtnanbRz2jO7u5CPl/LOvTgrBcLLeZDltVuM33FPyPC9iUdfPSI
         KoFLKrC1qs7RjGsQ2SZZVVCIWGvoVTSAH0Bv3A5xACnIMVGI7cubqurzpoMk9SBcyyRj
         nPc9eYWAaZjEiKu9Qdw9uw2cPTi3d6IdNu2DnbtN0vqqO+bioAByzjzHFVb64oSZRpk6
         XBcA==
X-Forwarded-Encrypted: i=1; AFNElJ/8HtKaWqK4s4cf2FjK+mYjwkWfIE7jYKpncOhRSanVL6+XC+ajPo+bP0GuBs3+4n/ai3TmtFNwCXyBwjanWAY3Yq8g@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw4warkhCoDARZtrDR1h7ObkTarzKQQD3cc8mBeWwPgncCESgjn
	Kea5qdsWo0THi04l99nLCu1u3bPG5MrYr330Lgpm9+wNcZOD6pK+gWmLiy/AfzO58lBVBJTzjHA
	3/Iw7YrS48iGe8Y1XAc2TOYBeAI/gBsc=
X-Gm-Gg: AeBDiesDnPFL7uOCbIh2U3BUct187ei2LHF5ySbGacaOc3yU5kAGJ3kUcWTMYgdoipb
	fKF2yNCG/GSZCEPqJPqWbPY/zoCGWUMMd1MYSATCMBRFE7WuFhCpcMnIIB+ICKiglmLOE9pV6WE
	CjFvDHO3MhZjVXRIGbzJVykcC8qMsgV/OV2GCVyHZoCZMyS0wmG96edOcYwjmzezhG7Wz9+NFMl
	lO1Hj9bDzTkqz8ODWbOOJNzXI7naBiOV1KI+zPAYxVgX93jDPJJzXs/3nDdS40aQVs+y8E3k4+N
	+qB5cbr7XjIBG/DLPsOlC6yKJq+0gMCbGuOLarw9MADJAL/yn1E=
X-Received: by 2002:a17:90b:2801:b0:35f:9ab2:a5c2 with SMTP id
 98e67ed59e1d1-36491ff6086mr2936372a91.6.1777375431313; Tue, 28 Apr 2026
 04:23:51 -0700 (PDT)
MIME-Version: 1.0
References: <255898079.381409.1777353521045@app.mailbox.org>
 <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
 <18AA811AD1565891.1885982@lists.yoctoproject.org>
In-Reply-To: <18AA811AD1565891.1885982@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 07:23:39 -0400
X-Gm-Features: AVHnY4JJbc_i6wF6LF6fNoH_TaQj36knRS9RU0rrBHzteWXzjANko0Jae-eL9mE
Message-ID: <CADkTA4OtD2a9yJWxWmU7Y8BFjTXy3rREDLbe19uOLDtwjnZo3g@mail.gmail.com>
Subject: Re: [meta-virtualization] Podman version mismatch
To: bruce.ashfield@gmail.com
Cc: peter.marko@siemens.com, 
	"patrick.vogelaar.dev@mailbox.org" <patrick.vogelaar.dev@mailbox.org>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000374c9f065083776a"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9757

--000000000000374c9f065083776a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 7:15=E2=80=AFAM Bruce Ashfield via lists.yoctoproje=
ct.org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:

>
>
> On Tue, Apr 28, 2026 at 2:11=E2=80=AFAM Peter Marko via lists.yoctoprojec=
t.org
> <peter.marko=3Dsiemens.com@lists.yoctoproject.org> wrote:
>
>> meta-virtualization has hardly any recipe which fetches exactly git tag.
>> So things like this are unfortunately expected.
>> In the past I have sent couple updates to mailing list to use real
>> versions, but without success, so I gave up.
>>
>>
> Thanks for the encouragement of the 10+ years of
> maintaining meta-virtualization!
>
> The reason they aren't exact git tags or exact releases is that those
> hashes stay valid
> for such a short time that it simply isn't worth it. And there's
> certaining no value in
> constantly bouncing the files through _<version>.bb and the _git.bb every
> time I
> move off an exact release tag.
>
> Maintaining all this many recipes, that move this quickly by stacking
> patches on to
> languages that don't patch all that way would simply be chaos.
>
> Patrick: there's nothing wrong with script that was intentional on the
> version.
>
>
In this case, I looked a bit more closely, upstream is doing something
different
which did in fact make the script report a different version than the
version in
the code:

build4 [/home/bruc...git/libpod]> git describe --tags
v5.8.2-5-g88c5aaeec6
build4 [/home/bruc...git/libpod]> git describe
v5.8.2-5-g88c5aaeec6

Which is what my script uses to pick up the base version. But the top commi=
t
on the 5.8 branch:

commit 88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93 (from
28d04eeb8ec047464c35cc6fbe766ca63b49d338) (HEAD -> v5.8, origin/v5.8)
Merge: 28d04eeb8e 7a47175665
Author: Paul Holzinger <pholzing@redhat.com>
Date:   Wed Apr 15 12:01:24 2026 +0200

    Merge pull request #28510 from podmanbot/bump-5.8.3-dev

    Bump Podman to v5.8.3-dev

:100644 100644 9aba2b5c22 39273508b8 M  version/rawversion/version.go

Which is of course what the build is picking up.

I'll have to add a condition to the upgrade tests to pick that up, and/or
see
if I can put it into the scripting logic (it just won't hold across all the
languages
that are used, so it'll be a bit fiddly).

For now, I've manually updated the recipe to match the golang version.

Thanks for catching that!

Bruce



> Which would be easier in your scenario ? (and by your scenario, I mean me
> changing
> the version reporting in the recipe.
>



>
>  - adding the -dev into the PV
>  - injecting the "base" version into the build via -X (or whatever
> mechanism the
>    buld needs) ?
>
> Bruce
>
>
>
>> Having the coming regulations in mind (requiring accurate sbom and cve
>> tracking), I'd recommend everyone using meta-virtualization to just copy
>> any used recipe, correct git hash and update crates.inc.
>>
>
>
>> Peter
>>
>> > -----Original Message-----
>> > From: meta-virtualization@lists.yoctoproject.org <meta-
>> > virtualization@lists.yoctoproject.org> On Behalf Of Patrick Vogelaar
>> via
>> > lists.yoctoproject.org
>> > Sent: Tuesday, April 28, 2026 7:19 AM
>> > To: meta-virtualization@lists.yoctoproject.org
>> > Subject: [meta-virtualization] Podman version mismatch
>> >
>> > Hi,
>> >
>> > I gave the newly upgraded podman recipe a try but it seems that there
>> is still a
>> > version mismatch.
>> > PV =3D "5.8.2"  but: podman -v
>> > podman version 5.8.3-dev
>> >
>> > Do you want me to send a patch or do you want to have a look at your
>> update
>> > script?
>> >
>> > Patrick
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
> View/Reply Online (#9756):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9756
> Mute This Topic: https://lists.yoctoproject.org/mt/119043966/1050810
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

--000000000000374c9f065083776a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026 at 7:15=
=E2=80=AFAM Bruce Ashfield via <a href=3D"http://lists.yoctoproject.org">li=
sts.yoctoproject.org</a> &lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@l=
ists.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026=
 at 2:11=E2=80=AFAM Peter Marko via <a href=3D"http://lists.yoctoproject.or=
g" target=3D"_blank">lists.yoctoproject.org</a> &lt;peter.marko=3D<a href=
=3D"mailto:siemens.com@lists.yoctoproject.org" target=3D"_blank">siemens.co=
m@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">meta-virtualization has hardly any recipe which fet=
ches exactly git tag.<br>
So things like this are unfortunately expected.<br>
In the past I have sent couple updates to mailing list to use real versions=
, but without success, so I gave up.<br>
<br></blockquote><div><br></div><div><div style=3D"font-size:small">Thanks =
for the encouragement of the 10+ years of maintaining=C2=A0meta-virtualizat=
ion!</div><div style=3D"font-size:small"><br></div><div style=3D"font-size:=
small">The reason they aren&#39;t exact git tags or exact releases is that =
those hashes stay valid</div><div style=3D"font-size:small">for such a shor=
t time that it simply isn&#39;t worth it. And there&#39;s certaining no val=
ue in</div><div style=3D"font-size:small">constantly bouncing the files thr=
ough _&lt;version&gt;.bb and the _<a href=3D"http://git.bb" target=3D"_blan=
k">git.bb</a> every time I</div><div style=3D"font-size:small">move off an =
exact release tag.</div><div style=3D"font-size:small"><br></div><div style=
=3D"font-size:small">Maintaining all this many recipes, that move this quic=
kly by stacking patches on to</div><div style=3D"font-size:small">languages=
 that don&#39;t patch all that way would simply be chaos.</div><div style=
=3D"font-size:small"><br></div><div style=3D"font-size:small">Patrick: ther=
e&#39;s nothing wrong with script that was intentional on the version.=C2=
=A0</div><div style=3D"font-size:small"><br></div></div></div></div></block=
quote><div><br></div><div><div class=3D"gmail_default" style=3D"font-size:s=
mall">In this case, I looked a bit more closely, upstream is doing somethin=
g different</div><div class=3D"gmail_default" style=3D"font-size:small">whi=
ch did in fact make the script report a different version than the version =
in</div><div class=3D"gmail_default" style=3D"font-size:small">the code:</d=
iv><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div cl=
ass=3D"gmail_default" style=3D"font-size:small">build4 [/home/bruc...git/li=
bpod]&gt; git describe --tags<br>v5.8.2-5-g88c5aaeec6<br>build4 [/home/bruc=
...git/libpod]&gt; git describe <br>v5.8.2-5-g88c5aaeec6</div></div><div><b=
r><div class=3D"gmail_default" style=3D"font-size:small">Which is what my s=
cript uses to pick up the base version. But the top commit</div><div class=
=3D"gmail_default" style=3D"font-size:small">on the 5.8 branch:<br><br>comm=
it 88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93 (from 28d04eeb8ec047464c35cc6fb=
e766ca63b49d338) (HEAD -&gt; v5.8, origin/v5.8)<br>Merge: 28d04eeb8e 7a4717=
5665<br>Author: Paul Holzinger &lt;<a href=3D"mailto:pholzing@redhat.com">p=
holzing@redhat.com</a>&gt;<br>Date: =C2=A0 Wed Apr 15 12:01:24 2026 +0200<b=
r><br>=C2=A0 =C2=A0 Merge pull request #28510 from podmanbot/bump-5.8.3-dev=
<br>=C2=A0 =C2=A0 <br>=C2=A0 =C2=A0 Bump Podman to v5.8.3-dev<br><br>:10064=
4 100644 9aba2b5c22 39273508b8 M =C2=A0version/rawversion/version.go<br><br=
>Which is of course what the build is picking up.<br><br>I&#39;ll have to a=
dd a condition to the upgrade tests to pick that up, and/or see</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">if I can put it into the s=
cripting logic (it just won&#39;t hold across all the languages</div><div c=
lass=3D"gmail_default" style=3D"font-size:small">that are used, so it&#39;l=
l be a bit fiddly).</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">For n=
ow, I&#39;ve manually updated the recipe to match the golang version.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Thanks for catching that!</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div><br>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=
=3D"gmail_quote"><div><div style=3D"font-size:small"></div><div style=3D"fo=
nt-size:small">Which would be easier in your scenario ? (and by your scenar=
io, I mean me changing</div><div style=3D"font-size:small">the version repo=
rting in the recipe.</div></div></div></div></blockquote><div><br></div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_quote"><div><div style=3D"font-size:small"><br></=
div><div style=3D"font-size:small">=C2=A0- adding the -dev into the PV</div=
><div style=3D"font-size:small">=C2=A0- injecting the &quot;base&quot; vers=
ion into the build via -X (or whatever mechanism the</div><div style=3D"fon=
t-size:small">=C2=A0 =C2=A0buld needs) ?</div><div style=3D"font-size:small=
"><br></div><div style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
Having the coming regulations in mind (requiring accurate sbom and cve trac=
king), I&#39;d recommend everyone using meta-virtualization to just copy an=
y used recipe, correct git hash and update crates.inc.<br></blockquote><div=
>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Peter<br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a> &lt;meta-<br=
>
&gt; <a href=3D"mailto:virtualization@lists.yoctoproject.org" target=3D"_bl=
ank">virtualization@lists.yoctoproject.org</a>&gt; On Behalf Of Patrick Vog=
elaar via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a><br>
&gt; Sent: Tuesday, April 28, 2026 7:19 AM<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt; Subject: [meta-virtualization] Podman version mismatch<br>
&gt; <br>
&gt; Hi,<br>
&gt; <br>
&gt; I gave the newly upgraded podman recipe a try but it seems that there =
is still a<br>
&gt; version mismatch.<br>
&gt; PV =3D &quot;5.8.2&quot;=C2=A0 but: podman -v<br>
&gt; podman version 5.8.3-dev<br>
&gt; <br>
&gt; Do you want me to send a patch or do you want to have a look at your u=
pdate<br>
&gt; script?<br>
&gt; <br>
&gt; Patrick<br>
<br>
<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9756): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9756" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9756</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119043966/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119043966/1050810</a><br>
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

--000000000000374c9f065083776a--

