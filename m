Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 693CDC43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 01:23:49 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28793.1782696228549797263
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 28 Jun 2026 18:23:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NA7BIxaZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-37df72c9984so1209426a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 28 Jun 2026 18:23:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782696228; cv=none;
        d=google.com; s=arc-20260327;
        b=bX7Lxz0USHkMX3YvRwuvve98FHrhlXWGBwCggGurEipOji3Y9+ptR5DOthXd4yRfiP
         0d1EvvfxfRfmxan8T2etdb/aAQOYzs9RD6HdmSYVdUz9+L46uzUbp9L3H2mnLHPS09jj
         8DIuEsQCEVoHvUr7bMlBpb6bWAYzTK853j3OHuwYYSFI77JYIhVSgFd1dTGmiJ7EbgCz
         r19OPnSF4q0d4arjGV9a/sZJ3hEyqFvXo/bDDe+rR7aHSufG68Q0SRc9B5DjSyZ/TiC/
         XaI6gRaEsZEI6hdi+ic94Yxkytf4ibbtA1MuEajGTZz2KuUqx03z0h+hZg+7btBydEPF
         RapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=TmJWppMW6KdAxUMvCN+5Qiv/CFZTjZ5VMMVsIOKNvoc=;
        fh=yGRrT1PcJyzp9oHIpocOJCgn9QVqV5yonzO28A/Q0Rg=;
        b=siBnBSgXzRG0gcHSzzZFnUACquQ7yyclpUQkwvTHcqYMbiRR0Xzpc6Y1WeKTq+bSwG
         ePRFmbofDKdtvbhYZkI+5I/KLEaoc+/fIehVygtFTvb+CloQMooj4i6qfmwWme28EPeV
         2mCasNimkUI/njOQ6BK7sBeGgJPiwpjF2HZMt0S/4fj1bF/aqO4hJyaRZ7RB/zJ5AIfR
         eHj6SwIjuSqfwJGaTIYCgO26eg7DTwyPwYDH/7fceg6J0pqUxGr5MtGkm7egDIfa/G6Z
         wRXLOwB6WFXwDnoFZ2KPCAO+BuPYKI+bJsNICvntEsweCqcbMwiXQ9bbKL6kyb61Fm0T
         RDEg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782696228; x=1783301028; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TmJWppMW6KdAxUMvCN+5Qiv/CFZTjZ5VMMVsIOKNvoc=;
        b=NA7BIxaZO627FtjKdZdqH4NxqWPO4ctJtSuKv+tjfJ6l9mtNgMk4V/VMETzOXGDJTG
         sJ3UIIxi63zbmR+glJc/0IIIPIyUWSkfpeybVGr6v8f0l1j4IG/dIPwghdipqyJ+RfNl
         FCH717wF0C+cLFuUH1w8yGm1WCc9cHIGrP+L/0k8ZaMM0nwUVerimtYFUaBkRiWvsR6L
         etAXGw03zMoD90FVA9syV8IWGcXaBYWMC2ju39NxwgyJkqdJa24A1yv0XUeod3nxrnrR
         atR6c7zRqSDQFdukBP73mUk6gwy2xiCo75oXvtjYLEt7fGDnq7prbX+2x72ouIdNNqX3
         +ppw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782696228; x=1783301028;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TmJWppMW6KdAxUMvCN+5Qiv/CFZTjZ5VMMVsIOKNvoc=;
        b=K+1tTWMmIA2NPg1/KvNzVmTbopfWgQNXzrb8yfwh8N4hK+FbHiXkdCDhMpm4OmDg9s
         ywTPdCUfD5Af9vnyufu2FR3/jeLE13JWrDCmmb71R5qVOTgBayX5ku5S6iBjdHZ29JOm
         a2ugmAZNvbeUbURjB0K/Om3KTYjpy6iRXAUfi8rgC4LFZw7IBQFkPzgAyKRBq3UtONl6
         wfZ0PIYfDjowkcRWQ9ArNhJ4cwB/h0YYTnsaod9xBZaUz6dI/OsBg6IWVS9qyBjCcHLd
         bIWdzJZM6dYHjjJ0gpv9xXhCJGqQIOw+18OOcRm9XmBBFbZHzr6doXoGob1wLVMHujkQ
         ym0g==
X-Gm-Message-State: AOJu0YwIoVXrB8LKLfX820uzZJZOA2pR7ddc7m6o1M1PMXzQNuYbPtzE
	SniL7ocGccnhC9F79NWzdTo6F9J3TmONgpVv2MtIUNpPEVnYreLmwo+KLltztv9HBoXusp95lyo
	1wlkRELyJr8fajLaOQ1LobsXjQHN89vY=
X-Gm-Gg: AfdE7cll8MJ1uO9TZQzYe9w+unLp7t0JPvGT/Tutn3ju+ssIG/2dXySbQqRRTL1YIbJ
	zlNwrAtvNpS3gkuJDWY7eZnpKVDQ2wsuzW31jEJxsVlfN9GPoOVVOZry5TDeojBa9wLWX7RM0vf
	c3WABbsUu2kF9jv4Qi1GPD5y6Ps/rugFW+eLBk5Pj/yOag3vjnjIkv9S2j+eQP1pMV0ujpmueuu
	goG+NhUWrGPcEU0r9htDyOnPzAzJMKvCveNmkScEYtiCzMpKSTZiTQQZq3jyydbWWlKTth17KLu
	fUF8/HvrNtsk9FdJB53Cr+5hEeWgGzrJpa1TaH+EXGQcx7tgbKq7n9xq3dBc9Xn1B9zLZsJGLnC
	3HZ+Nk/IXDXCEFQ==
X-Received: by 2002:a05:6a20:9145:b0:3a2:d629:16a2 with SMTP id
 adf61e73a8af0-3bf69b80fa8mr7584730637.10.1782696227522; Sun, 28 Jun 2026
 18:23:47 -0700 (PDT)
MIME-Version: 1.0
References: <18BBA0305BE410F4.1048178@lists.yoctoproject.org> <TYYPR01MB1341975C97E9A5113CF8C46FFDCE82@TYYPR01MB13419.jpnprd01.prod.outlook.com>
In-Reply-To: <TYYPR01MB1341975C97E9A5113CF8C46FFDCE82@TYYPR01MB13419.jpnprd01.prod.outlook.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 28 Jun 2026 22:23:37 -0300
X-Gm-Features: AVVi8CfujVlnYYZJ2_Sq1xyb6ZiMyAwSgg24bq8-itYnPuLrKA6Jy5cgcO6IzLo
Message-ID: <CADkTA4OxmbZwJkoFYwJNRhwA7sOOw+miLKDpim2nwfBfnWZg_A@mail.gmail.com>
Subject: Re: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH] qemu:
 upgrade bbappend to 11.%
To: wangmy@fujitsu.com
Cc: "meta-virtualization@lists.yoctoproject.org" <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000624f2606555a4f84"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 29 Jun 2026 01:23:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9907

--000000000000624f2606555a4f84
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You only sent that patch 5 days ago, 2 of which were weekend days.

Bruce

On Sun, Jun 28, 2026 at 9:21=E2=80=AFPM wangmy via lists.yoctoproject.org <=
wangmy=3D
fujitsu.com@lists.yoctoproject.org> wrote:

> Ping
>
>   --
> Best Regards
> ---------------------------------------------------
> Wang Mingyu
> FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)
> No.6 Wenzhu Road, Nanjing, 210012, China
> TEL=EF=BC=9A+86+25-86630566--8568
> COINS: 79988548
> FAX: +86+25-83317685
> MAIL: wangmy@fujitsu.com
>
> > -----Original Message-----
> > From: meta-virtualization@lists.yoctoproject.org
> > <meta-virtualization@lists.yoctoproject.org> On Behalf Of wangmy via
> > lists.yoctoproject.org
> > Sent: Tuesday, June 23, 2026 1:57 PM
> > To: meta-virtualization@lists.yoctoproject.org
> > Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C <wangmy@fujitsu.com>
> > Subject: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH]
> qemu:
> > upgrade bbappend to 11.%
> >
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > Compatibility with OE-core.
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../qemu/{qemu_10.%.bbappend =3D> qemu_11.%.bbappend}
> > | 0
> >  1 file changed, 0 insertions(+), 0 deletions(-)  rename
> > meta-openstack/recipes-devtools/qemu/{qemu_10.%.bbappend =3D>
> > qemu_11.%.bbappend} (100%)
> >
> > diff --git a/meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend
> > b/meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
> > similarity index 100%
> > rename from meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend
> > rename to meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend
> > --
> > 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9906):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9906
> Mute This Topic: https://lists.yoctoproject.org/mt/119937023/1050810
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

--000000000000624f2606555a4f84
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">You=
 only sent that patch 5 days ago, 2 of which were weekend days.=C2=A0</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><div class=
=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div clas=
s=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_att=
r">On Sun, Jun 28, 2026 at 9:21=E2=80=AFPM wangmy via <a href=3D"http://lis=
ts.yoctoproject.org">lists.yoctoproject.org</a> &lt;wangmy=3D<a href=3D"mai=
lto:fujitsu.com@lists.yoctoproject.org">fujitsu.com@lists.yoctoproject.org<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">P=
ing<br>
<br>
=C2=A0 --<br>
Best Regards<br>
---------------------------------------------------<br>
Wang Mingyu<br>
FUJITSU NANJING SOFTWARE TECHNOLOGY CO., LTD. (FNST)<br>
No.6 Wenzhu Road, Nanjing, 210012, China<br>
TEL=EF=BC=9A+86+25-86630566--8568<br>
COINS: 79988548<br>
FAX: +86+25-83317685<br>
MAIL: <a href=3D"mailto:wangmy@fujitsu.com" target=3D"_blank">wangmy@fujits=
u.com</a><br>
<br>
&gt; -----Original Message-----<br>
&gt; From: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" ta=
rget=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt; &lt;<a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a>&gt; On Behalf =
Of wangmy via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a><br>
&gt; Sent: Tuesday, June 23, 2026 1:57 PM<br>
&gt; To: <a href=3D"mailto:meta-virtualization@lists.yoctoproject.org" targ=
et=3D"_blank">meta-virtualization@lists.yoctoproject.org</a><br>
&gt; Cc: Wang, Mingyu/=E7=8E=8B =E9=B8=A3=E7=91=9C &lt;<a href=3D"mailto:wa=
ngmy@fujitsu.com" target=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; Subject: [PATCH] [meta-virtualization] [meta-cloud-services] [PATCH] q=
emu:<br>
&gt; upgrade bbappend to 11.%<br>
&gt; <br>
&gt; From: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" target=3D"=
_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; <br>
&gt; Compatibility with OE-core.<br>
&gt; <br>
&gt; Signed-off-by: Wang Mingyu &lt;<a href=3D"mailto:wangmy@fujitsu.com" t=
arget=3D"_blank">wangmy@fujitsu.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../qemu/{qemu_10.%.bbappend =3D&gt; qemu_11.%.bbappend}<br>
&gt; | 0<br>
&gt;=C2=A0 1 file changed, 0 insertions(+), 0 deletions(-)=C2=A0 rename<br>
&gt; meta-openstack/recipes-devtools/qemu/{qemu_10.%.bbappend =3D&gt;<br>
&gt; qemu_11.%.bbappend} (100%)<br>
&gt; <br>
&gt; diff --git a/meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend<b=
r>
&gt; b/meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend<br>
&gt; similarity index 100%<br>
&gt; rename from meta-openstack/recipes-devtools/qemu/qemu_10.%.bbappend<br=
>
&gt; rename to meta-openstack/recipes-devtools/qemu/qemu_11.%.bbappend<br>
&gt; --<br>
&gt; 2.43.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9906): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9906" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9906</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119937023/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/119937023/1050810</a><br>
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

--000000000000624f2606555a4f84--

