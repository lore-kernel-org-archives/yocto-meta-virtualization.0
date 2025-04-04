Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42150C36010
	for <webhook@archiver.kernel.org>; Fri,  4 Apr 2025 14:04:44 +0000 (UTC)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web11.12073.1743775474141448871
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 04 Apr 2025 07:04:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=J/l+6weo;
 spf=pass (domain: gmail.com, ip: 209.85.215.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-af548cb1f83so1856644a12.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743775473; x=1744380273; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Q/buSjh2dYgPcvf/P9f5Ml0wN1s4z7mTiwSRWYAQfXY=;
        b=J/l+6weoDUTHgcgnDH2NwEkmCrgcnjouTnywpRRKVN2vO+Fl0EsDpK8zbzPm+VbLp5
         8uYDLgUPPOUetn2l2l2SfnBog0HaQB/3U0g2dPIoSKXZbsDDX+ta/jwmatjanFBLhTuO
         C38VBrgt1wO/Ybe6e69ivVgFSZvGx+duWhS/u4bghMkQvv4YlIoF+d06bO/IjeyaF5zS
         EhL4KXcy+k5l1IaF2+zYD5Eo5REVdjp3HXqku77FdMKsKHbCtOux2SdCFhMX+49x87+Z
         +3li45sBobQiOLNu+DLV4+52IPCwiFCafxGhrJnB7EJ3ZRwk5l1hTczWNFqC6RpQ9Xft
         HCTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743775473; x=1744380273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q/buSjh2dYgPcvf/P9f5Ml0wN1s4z7mTiwSRWYAQfXY=;
        b=YbdqCEBDIywKJHiLKEJMD8VWuYapx8KA/MEcB14PIqC9swiswMRS7OdTqUKc5XCX7O
         d//x6ez/18nRDAxDsOK+MoEPAaEG5WM4i2ODMXZ303HfPWfM85tD0XkRrOXuk21h5XVx
         F0PTAe+G+bDHM7Vm6Jes7Jo8wN5cAyOizJ8KPtFmbiwyGUz+4qSz8gwBJOq+OOMWjN4a
         5v1zGn+lMLEgyBxOgM7AjoOi+L7CVhUtVEJ30xjwak25yxdvWo93b6tB7OuXQaUpkBLG
         a5HrUUpQXiPVlYqXPXc2ODHS0shjvlPVcMlblNPeqNj5ge0MwZ5f6cNU8jYiLiC5mCDa
         t+Cw==
X-Gm-Message-State: AOJu0YyxCnpC22fsevfThS9iEbRZieXOWFTM4LxLlfVkR8qJiYPvKTbl
	QFCaMXIrNfVevPLGxxK3H+uiihPfhCvpKiiiqAKQC7/gMCtxtRGuS44IrRVmDWkWhmGGWHDdxd4
	bSxUhH3PpqFH5kwPGwvxwEl8sfc0=
X-Gm-Gg: ASbGncu1qoHeE15dMbFb4flU2rKo9hBFxVFypDu1jPwTyfqZJV57tD9PwZVNrC8NwBV
	qvwOspNEU5KcAq/bmdaozWEaAiZIanRM9Ubry0msBJG41KlbJWlgrw7lI/gpYjBVn0R1EdQw1zA
	arshlzJn0I+gu0N+urjmGeSmDRvuA=
X-Google-Smtp-Source: AGHT+IFduj8/ZZ0IEt+HpdtrqldvzrsMyjqD8Q2fBdJClEihM6HrFXwLUwAdfZmpUQISCsFLP3YO1BYfIF7vyGeQq3s=
X-Received: by 2002:a17:90b:53c5:b0:2f2:a664:df20 with SMTP id
 98e67ed59e1d1-306a47c2e20mr5755178a91.7.1743775472990; Fri, 04 Apr 2025
 07:04:32 -0700 (PDT)
MIME-Version: 1.0
References: <18328BABEEB953D4.22698@lists.yoctoproject.org> <CA+chaQen8GCkgLBDBNNGXtrxWWD2k5V62-M3dTqv6egp753Njg@mail.gmail.com>
In-Reply-To: <CA+chaQen8GCkgLBDBNNGXtrxWWD2k5V62-M3dTqv6egp753Njg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 4 Apr 2025 10:04:20 -0400
X-Gm-Features: AQ5f1JrOvnGzWvVN06OI-BjgacEp5BgFAh3h88Jdf77ZeRRplEDMS8z9pNT2bf4
Message-ID: <CADkTA4O2Nr+Bu+VuVRtdVQfUAzqbQ7yT7mtmWePaOOkPb3sbmA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/3] metadata: add whitespace around assignments
To: martin.jansa@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a2c11f0631f45d9d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 04 Apr 2025 14:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9201

--000000000000a2c11f0631f45d9d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 4, 2025 at 2:34=E2=80=AFAM Martin Jansa via lists.yoctoproject.=
org
<martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:

> On Wed, Apr 2, 2025 at 5:59=E2=80=AFPM Martin Jansa via lists.yoctoprojec=
t.org
> <martin.jansa=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > With:
> > https://lists.openembedded.org/g/bitbake-devel/message/17508
> > there are many WARNINGs from this layer will cover src_uri.inc files
> > in next commit.
>
> Hi Bruce,
>
> I see you already have them in master-next and I've noticed your
> fix-up for cri-tools.
>
> There is one more case like that in:
> recipes-containers/docker-distribution/docker-distribution_git.bb:
> EXTRA_OEMAKE
> =3D "BUILDTAGS =3D ''"
> do you want me to send v2 with both fix-ups included or additional one
> for docker-distribution or will you fix it yourself?
>

I have it tweaked locally, I'll just push it shortly once I've done a bit
more testing on
some unrelated changes.


>
> I did run a world build with these changes, but some recipes aren't
> included for our DISTRO even with world build. Sorry about missing
> these 2.
>

2 really minor issues out of that many changes is excellent. I was just
starting
to write a script (or should I say "generate" a script) to do the same
changes
and you saved me quite a bit of time, so you have my thanks for the
contribution!

Bruce



>
> Cheers,
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9199):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9199
> Mute This Topic: https://lists.yoctoproject.org/mt/112049203/1050810
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

--000000000000a2c11f0631f45d9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 4, 2025 at 2:34=
=E2=80=AFAM Martin Jansa via <a href=3D"http://lists.yoctoproject.org">list=
s.yoctoproject.org</a> &lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists=
.yoctoproject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">On Wed, Apr 2, 2025 at 5=
:59=E2=80=AFPM Martin Jansa via <a href=3D"http://lists.yoctoproject.org" r=
el=3D"noreferrer" target=3D"_blank">lists.yoctoproject.org</a><br>
&lt;martin.jansa=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" targ=
et=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com" targe=
t=3D"_blank">martin.jansa@gmail.com</a>&gt;<br>
&gt;<br>
&gt; With:<br>
&gt; <a href=3D"https://lists.openembedded.org/g/bitbake-devel/message/1750=
8" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/g/bi=
tbake-devel/message/17508</a><br>
&gt; there are many WARNINGs from this layer will cover src_uri.inc files<b=
r>
&gt; in next commit.<br>
<br>
Hi Bruce,<br>
<br>
I see you already have them in master-next and I&#39;ve noticed your<br>
fix-up for cri-tools.<br>
<br>
There is one more case like that in:<br>
recipes-containers/docker-distribution/docker-distribution_git.bb:EXTRA_OEM=
AKE<br>
=3D &quot;BUILDTAGS =3D &#39;&#39;&quot;<br>
do you want me to send v2 with both fix-ups included or additional one<br>
for docker-distribution or will you fix it yourself?<br></blockquote><div><=
br></div><div><div class=3D"gmail_default" style=3D"font-size:small">I have=
 it tweaked locally, I&#39;ll just push it shortly once I&#39;ve done a bit=
 more testing on</div><div class=3D"gmail_default" style=3D"font-size:small=
">some unrelated changes.</div></div><div>=C2=A0</div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
I did run a world build with these changes, but some recipes aren&#39;t<br>
included for our DISTRO even with world build. Sorry about missing<br>
these 2.<br></blockquote><div><br></div><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">2 really minor issues out of that many changes is =
excellent. I was just starting</div><div class=3D"gmail_default" style=3D"f=
ont-size:small">to write a script (or should I say &quot;generate&quot; a s=
cript) to do the same changes</div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">and you saved me quite a bit of time, so you have my thanks =
for the contribution!</div><div class=3D"gmail_default" style=3D"font-size:=
small"><br></div><div class=3D"gmail_default" style=3D"font-size:small">Bru=
ce</div><br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
Cheers,<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9199): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9199" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9199</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/112049203/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/112049203/1050810</a><br>
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

--000000000000a2c11f0631f45d9d--

