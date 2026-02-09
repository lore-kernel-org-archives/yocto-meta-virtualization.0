Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37DA3EF070B
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 04:49:34 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.40699.1770612564901362144
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 08 Feb 2026 20:49:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FJSMSUtI;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2aad1bb5058so14466045ad.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 08 Feb 2026 20:49:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770612564; cv=none;
        d=google.com; s=arc-20240605;
        b=G3g+dPLq4qs1Y2Ij6qvlCszRbeLjXdrL12hcjFhTtL0sRJXl0Tox0BArRjMEH25wBm
         h+jsZ9I+7ncxss5T0kBv16P1VUid4IPkd7Amqz8+IJrsLloVAAd35qmzwS7qS8Qq29ib
         8xlswqjBOuXwT2DrvYvoXHW+J3Q1eN1EyZDCxd6h4ffuBjfSMiTeg8IDAcdEoC+0CIav
         UEenrbIZVADwfOKe46LpJMA+dUN3LxGKAfzJpfIvaflSifEN5Azgl25YWMXqAh6vZAhu
         hs9KCUYo8FVdtWQ7sedHzaSGFPTDb43EEbcG/rX673dMHAIkgGBoQazDj1qJnoSriB3f
         U08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=0Chcf2wcEuJ+3bm/SPFhxXcnM7+ofp/7j3CH+b/TTrs=;
        fh=vvozKkZ8g/dvnqFnDWZNMT3SYeUiv/22wRTBrqDPZ9I=;
        b=OimuFSbW1o4nqI6NKUQtz1VKFyjOSpLSwi6UXI6KJU4vZzire5lK8wn5BFywW0t6LO
         mTP9IAieX0iD6HhpLXN5q+74ZhdVwPm8BoU05Lu4xn0r0y/s9PMtWva+ny4NZG7tjhxn
         KNemutt2m+bhDtglGOXMH3I5mNceh5w93S+j85UrnVnhhGazH8q0n5i7v7mK0m/mf8dy
         PNKbDtKZtcmiuEqVui4ell1WxYoHCwrQH52TgOAmMcNFlP7Q4vlwM6qSOQ4Ts+9azgqQ
         e59PrYQvXKrvQ0lYabFBcnVec80RPpM6qmiAgm3yo1lRb0b4rbWhmuvblgtMApFF6nQ9
         5NYA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770612564; x=1771217364; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0Chcf2wcEuJ+3bm/SPFhxXcnM7+ofp/7j3CH+b/TTrs=;
        b=FJSMSUtIglUwPTbcHTKKv2JcFUp2MBh35xCicKMUacEEct5Q3mlLj9ZB8dpoUR6+Tn
         xKY1QjUG472uU66TQ3hnv/nM3ZSkMCk5nF6+HQJQRSASQ4SOTat7X6+Aaeo2d0Kut9/b
         6ifvBTzLeV1krwg3+pJVo3K0xF/WKzvfy5JQ9Ig1LXO1jtXpqzHyFlEOPfSllIdu79dr
         61a2KU3uAfygZB6MS5Cit5am4RBogS5WWAaHkG8DAreZMkPcdC1enNfPOkvJTzfeIU0p
         NvN5f6MnSuhBkhQcal5q1SjuOeb3/ntLAf+mTzTdfLwvhfg7z3uwUNHoaP6b77wr+oSJ
         X0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770612564; x=1771217364;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0Chcf2wcEuJ+3bm/SPFhxXcnM7+ofp/7j3CH+b/TTrs=;
        b=JpExqKMZkK4zThRKAHOK/Ivx1zjiDftxBE5VjPj5gLZRIwLhPT3qPm/PFPiE8tWQvH
         t3NRP4d5DwuXoHYRrJxjy6frB30RrA/OVByik3jywy9i9bFJV71/7PHyfqrrAJPiZFcO
         aB4g84Nae+bsb+OHwIpnngBQjxi12ivyPeuMBSMGoffBu/RF6Icn0ZtibKiqqkHxBzCd
         tdV1PqP1YSQo/lKz1ai27k+jxjtYvqIneHaGFyk5bCgNOgX/AKPHSkJyl8oD5YKBO9sh
         bRR+Ld6eFoVBZbZrGCWEA1J0ZOvtGQmuZThJMRlFk4J3YOT0LdmR6TUMCFQBKBbKFp3X
         rBGg==
X-Gm-Message-State: AOJu0YzR3rD5djU4zADCmJLMn4MOCn0r635rv6KUbMPV4trXHFeeL+dr
	NMPtQlhIb6MjdIouN5+dodnwX5ZbMnzUG7d08CuKtQ0dluGTpBQxg2JaSXi1Yjs/LQPrgCh7GRV
	niCvWNvOglq2p064Zc0F0zK+0TyECs/c=
X-Gm-Gg: AZuq6aIe0GOrdJ+oR8PX2SwO9dBdJCzrdj1T/dJf2UuZZ04poNmyOYBEo2dpMsTbsrj
	egYWPAJDyhLaBBajLSunJSHO8Qd+vacv9W0VsJcULbWfZH5dZC1v+t0AzN89FAfSVgprKqO9mG3
	QpixSz+qJiE8B1AKyfHZ2eP26obA/fJLVMODMrfBAQ5iHI+CtPwp+t0h9CpM87k7B3Q5Hh0UL/0
	759qaVhcjZflvdQllVMSjG4rSOs/LLSVjGPJUw5T1MZ0g/b/jgRXEprPa0S5U+PZT9WnFHCtpXy
	Dc/obkflq2GmJ79RkS6+l6jjY1RY
X-Received: by 2002:a17:903:1a24:b0:2a9:6281:6a48 with SMTP id
 d9443c01a7336-2a962816e6dmr74013095ad.44.1770612564143; Sun, 08 Feb 2026
 20:49:24 -0800 (PST)
MIME-Version: 1.0
References: <20260106155158.3714544-1-dmitry.baryshkov@oss.qualcomm.com>
 <aV1f+h059rYKChfi@gmail.com> <CAO9ioeUC4OJ0o9hfMLG6qL0nb_yrVq12NmF1RxMXV=KfaSm4yw@mail.gmail.com>
In-Reply-To: <CAO9ioeUC4OJ0o9hfMLG6qL0nb_yrVq12NmF1RxMXV=KfaSm4yw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 8 Feb 2026 23:49:12 -0500
X-Gm-Features: AZwV_QiqFsT9dEsnuFW8TssRyDgNIhpVST5fUXeQqd0TZjqfTS2JdFHn9s0h_-o
Message-ID: <CADkTA4PB+4M+HWPb=1KHK0f3G4LQCVC9UAfLF7BdN6Bj3rtyDQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] nerdctl: add textrel to the list
 of skipped QA checks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000ebb28e064a5cdc1d"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 09 Feb 2026 04:49:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9567

--000000000000ebb28e064a5cdc1d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Chen Qi beat me to the fix:

-buildmode=3Dpie

Fixes it up.

I've queued that change and it will be in the tree shortly.

Bruce

On Tue, Jan 6, 2026 at 2:34=E2=80=AFPM Dmitry Baryshkov <
dmitry.baryshkov@oss.qualcomm.com> wrote:

> On Tue, 6 Jan 2026 at 21:18, Bruce Ashfield <bruce.ashfield@gmail.com>
> wrote:
> >
> > I might have a try at fixing the relocation issues.
> >
> > What is the machine you are building for that shows the
> > issues ?
>
> it's qcom-armv7a, which has:
>
> DEFAULTTUNE =3D "cortexa15thf-neon-vfpv4"
> require conf/machine/include/arm/armv7a/tune-cortexa15.inc
>
>
> --
> With best wishes
> Dmitry
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000ebb28e064a5cdc1d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">Che=
n Qi beat me to the fix:<br><br>-buildmode=3Dpie<br><br>Fixes it up.=C2=A0<=
br><br>I&#39;ve queued that change and it will be in the tree shortly.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Tue, Jan 6, 2026 at 2:34=E2=80=AFPM Dmitry Baryshkov &lt;<a href=3D"=
mailto:dmitry.baryshkov@oss.qualcomm.com">dmitry.baryshkov@oss.qualcomm.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
On Tue, 6 Jan 2026 at 21:18, Bruce Ashfield &lt;<a href=3D"mailto:bruce.ash=
field@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com</a>&gt; wrote:<=
br>
&gt;<br>
&gt; I might have a try at fixing the relocation issues.<br>
&gt;<br>
&gt; What is the machine you are building for that shows the<br>
&gt; issues ?<br>
<br>
it&#39;s qcom-armv7a, which has:<br>
<br>
DEFAULTTUNE =3D &quot;cortexa15thf-neon-vfpv4&quot;<br>
require conf/machine/include/arm/armv7a/tune-cortexa15.inc<br>
<br>
<br>
-- <br>
With best wishes<br>
Dmitry<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div>

--000000000000ebb28e064a5cdc1d--

