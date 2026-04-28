Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5970FF8868
	for <webhook@archiver.kernel.org>; Tue, 28 Apr 2026 11:16:03 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10617.1777374955019488294
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 28 Apr 2026 04:15:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=EeLJ0Wmz;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-35fc2b18363so11876811a91.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 04:15:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777374954; cv=none;
        d=google.com; s=arc-20240605;
        b=VbHp49OCN1YPAvsXvkG88Dng2D6gFYVK2GGVB7QLLM9zQDagU/Dkqq8VbExqXGjVJS
         bvYd8ySM26MpabQkah+QAZv8M6QsC2cto5MJg4d0zbRKRtL2C1G/zknDEfmHDexWeA6H
         zrntt9gkV/2Ir0NPtbRwkJ/Lt1qZVKbNermSB8frYgftAoEG7p2KwXB/hiNWuMDB6rWQ
         zk/Ouydv/oWplPs+9uRB8TI67dneVqBg/5PXK9fKYUeBUxqH5ywq6FtayBo1j0xBEiGj
         XYPymyQa/froo08Ls6naIsc+yq8jKcqW+bdiWbBOVn7rehtBPI+z3N4+W1I4tE5mAjMp
         GR1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZBZcp09cIncZagwwSXns/SF9VWfOJIkIltxf834ODAs=;
        fh=9Qd+lQoWNFE33H9l+VX8MZj/ezCEKiCawqn4XCMGG2A=;
        b=Yy8SA9cP/wEBsbruEeIiERB4dYuAR8FiUKV6M27I0VNqlbyerGBlclGcDEgfz+9yk8
         D2oB9uu5l7gKmVjhmHQjxeG8ayadHuJZqhtBcGrtUiSMBq0vsZx6ckco05Jd50ZDlf5p
         XHFOtqJjRUmfBZcz1USLQgPi/dKZAfyz9LVKwr4/8onXbX/R7Iup5/3SbWQM463RMQV8
         rY5shyvLINfBogvwAPqCFXOzSVt1SgmY/gSg17K0j0CQbK3RgAlmkLcdLlqjjS/YWaka
         BZsDJIryEeDRVk9X4o85co3G7cjX8ymAGB5IZ+6WvajlbMGS3rNmiotZ46El7vMO1KoA
         Y1KQ==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777374954; x=1777979754; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZBZcp09cIncZagwwSXns/SF9VWfOJIkIltxf834ODAs=;
        b=EeLJ0WmzKiaaoD++PVYftlhe4JeMmjZxKkyOhZu3Mbb5YxbUWlkm8/nt36VDci2i4K
         HCsEcxopbQQHdQ8pXqkAo+hSfM7pNYiwndqEbtfF+Seb3ns4dJ9pQ2aGJY6vTuhKNdah
         uV7YCYp94ZWPZznYH31sXA8QDO/FUThXdnOpYjRfLgY+EJ7hX3q7N06MGclib9DCdZ93
         sou63eTQyHbMIKTq54VvEogQpAtr2qpghQ5ekh1TOemtHcKwkPEBhygfgncNRjf7pbzs
         XRoZI2/u+45z1b5bD8EiGQKxjphzVCF7Nn8f5tPycpWcnaFFnxYkAmR8km7xQNE1VH9F
         nKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777374954; x=1777979754;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZBZcp09cIncZagwwSXns/SF9VWfOJIkIltxf834ODAs=;
        b=IgZYBpe9rI6s2ZXJpkqo2sHYzv2kRCbg0csSPCf//nBA877yH6ZES8txAyjeI4bcGs
         RsVuFWIR67aGHUxyuWhlVPhBTn8ZWWKkOTUrj5Y5Wm4AJ/twDkACzA5rIaetV1uak+Si
         SdkhfnT0Rhm13fAGf+iloy4pHDlmCbAOYficseUdNStOfLjb+iEs708qkS+4fgI8N8Zk
         0s4qkeXt1Wh++tAUcxYcnTtv5eHyyJPnuAPKhHG/2H/6I6OvmyqhxQ00oW66/wRR3N47
         70W39qlCW+78ipQjcNgBy1LSwdFsatV8Xb/Z0izhbFXEk6Q69A6ivQbUv3sp08JAvc2h
         M6xA==
X-Forwarded-Encrypted: i=1; AFNElJ9BCIUSp75AGVZhjispOBSdghYXdezwAD/ZKzKTyxPAdr/8PPqzSU1KjeSio1ho76vtpF8ar3OVmwVuu343ALNXeH33@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YyTZ1zndAX2FKxg8AoBOR8KlRwjqcwveLRxAlmnDjffUDo6RJC+
	qrrboV9mJ1WmJGuv4eKGDmb3AKxPKTTAaffzZ8CJbj0JIAR38kjSFOpotSENQI3PHwOJccMvL1P
	fqRGBId3zhCNM9H6YRMJ8nSPc8Ki4dec=
X-Gm-Gg: AeBDieuRX4Zf1mevDDspWe0n4tDzNtCGl0pQm4LdPFLGEpz3FzL15MFoAmcNy0p8pk7
	krTkfK+iDuHZ+yDS1KZDLbW+xl9w1yy1/FR8dwSHmQPRUj8vC/dEEZ2p9Qzul937VBSdSLRJdJW
	uVtMEZbqND3rIOFjLFc5Lesl9MSmKs7WOTDIUzYcWWGObkn2J8M+oZ+uGNd3gZIwfyGZ9fJg4zd
	hSHGjzcq9tedBEj46kbJbMHldVImXQzzQvaQkRft6OsRMxVY2KYIPEvhfVFIS/H3FxkJbTDrVk7
	S4C+ho8gz1yo5ZQoQCeo888LhbNeYpqwfJ3Z/jSr3e57yPRzJOw=
X-Received: by 2002:a17:90a:d88f:b0:35f:b953:2445 with SMTP id
 98e67ed59e1d1-364920a5138mr2984325a91.16.1777374954204; Tue, 28 Apr 2026
 04:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <255898079.381409.1777353521045@app.mailbox.org> <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
In-Reply-To: <AS1PR10MB5697C73C24228D7555130AF9FD372@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 28 Apr 2026 07:15:41 -0400
X-Gm-Features: AVHnY4Ld8GpzkJ5zQQkugOnS4aGDA2Xru2KnzWQ8wRzrd7dk4wuYJcNofqfdQOE
Message-ID: <CADkTA4OW9pcG-2HL16zMc3qN0DxK2Dz+bmjjjAQ2jG8fE-kYWA@mail.gmail.com>
Subject: Re: [meta-virtualization] Podman version mismatch
To: peter.marko@siemens.com
Cc: "patrick.vogelaar.dev@mailbox.org" <patrick.vogelaar.dev@mailbox.org>, 
	"meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c731fe0650835a64"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 28 Apr 2026 11:16:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9756

--000000000000c731fe0650835a64
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2026 at 2:11=E2=80=AFAM Peter Marko via lists.yoctoproject.=
org
<peter.marko=3Dsiemens.com@lists.yoctoproject.org> wrote:

> meta-virtualization has hardly any recipe which fetches exactly git tag.
> So things like this are unfortunately expected.
> In the past I have sent couple updates to mailing list to use real
> versions, but without success, so I gave up.
>
>
Thanks for the encouragement of the 10+ years of
maintaining meta-virtualization!

The reason they aren't exact git tags or exact releases is that those
hashes stay valid
for such a short time that it simply isn't worth it. And there's certaining
no value in
constantly bouncing the files through _<version>.bb and the _git.bb every
time I
move off an exact release tag.

Maintaining all this many recipes, that move this quickly by stacking
patches on to
languages that don't patch all that way would simply be chaos.

Patrick: there's nothing wrong with script that was intentional on the
version.

Which would be easier in your scenario ? (and by your scenario, I mean me
changing
the version reporting in the recipe.

 - adding the -dev into the PV
 - injecting the "base" version into the build via -X (or whatever
mechanism the
   buld needs) ?

Bruce



> Having the coming regulations in mind (requiring accurate sbom and cve
> tracking), I'd recommend everyone using meta-virtualization to just copy
> any used recipe, correct git hash and update crates.inc.
>


> Peter
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org <meta-
> > virtualization@lists.yoctoproject.org> On Behalf Of Patrick Vogelaar vi=
a
> > lists.yoctoproject.org
> > Sent: Tuesday, April 28, 2026 7:19 AM
> > To: meta-virtualization@lists.yoctoproject.org
> > Subject: [meta-virtualization] Podman version mismatch
> >
> > Hi,
> >
> > I gave the newly upgraded podman recipe a try but it seems that there i=
s
> still a
> > version mismatch.
> > PV =3D "5.8.2"  but: podman -v
> > podman version 5.8.3-dev
> >
> > Do you want me to send a patch or do you want to have a look at your
> update
> > script?
> >
> > Patrick
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9755):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9755
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

--000000000000c731fe0650835a64
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 28, 2026 at 2:11=
=E2=80=AFAM Peter Marko via <a href=3D"http://lists.yoctoproject.org">lists=
.yoctoproject.org</a> &lt;peter.marko=3D<a href=3D"mailto:siemens.com@lists=
.yoctoproject.org">siemens.com@lists.yoctoproject.org</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">meta-virtualization ha=
s hardly any recipe which fetches exactly git tag.<br>
So things like this are unfortunately expected.<br>
In the past I have sent couple updates to mailing list to use real versions=
, but without success, so I gave up.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">Thanks for the encouragement of the 10+ years of maintaini=
ng=C2=A0meta-virtualization!</div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">The reason they aren&#39;t exact git tags or exact releases is that tho=
se hashes stay valid</div><div class=3D"gmail_default" style=3D"font-size:s=
mall">for such a short time that it simply isn&#39;t worth it. And there&#3=
9;s certaining no value in</div><div class=3D"gmail_default" style=3D"font-=
size:small">constantly bouncing the files through _&lt;version&gt;.bb and t=
he _<a href=3D"http://git.bb">git.bb</a> every time I</div><div class=3D"gm=
ail_default" style=3D"font-size:small">move off an exact release tag.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Maintaining all this many reci=
pes, that move this quickly by stacking patches on to</div><div class=3D"gm=
ail_default" style=3D"font-size:small">languages that don&#39;t patch all t=
hat way would simply be chaos.</div><div class=3D"gmail_default" style=3D"f=
ont-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:s=
mall">Patrick: there&#39;s nothing wrong with script that was intentional o=
n the version.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:s=
mall"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Whic=
h would be easier in your scenario ? (and by your scenario, I mean me chang=
ing</div><div class=3D"gmail_default" style=3D"font-size:small">the version=
 reporting in the recipe.</div><div class=3D"gmail_default" style=3D"font-s=
ize:small"><br></div><div class=3D"gmail_default" style=3D"font-size:small"=
>=C2=A0- adding the -dev into the PV</div><div class=3D"gmail_default" styl=
e=3D"font-size:small">=C2=A0- injecting the &quot;base&quot; version into t=
he build via -X (or whatever mechanism the</div><div class=3D"gmail_default=
" style=3D"font-size:small">=C2=A0 =C2=A0buld needs) ?</div><div class=3D"g=
mail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_defau=
lt" style=3D"font-size:small">Bruce</div><br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
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
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9755): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9755" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9755</a><br>
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

--000000000000c731fe0650835a64--

