Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30C06C64EC4
	for <webhook@archiver.kernel.org>; Fri, 10 Mar 2023 15:51:50 +0000 (UTC)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
 by mx.groups.io with SMTP id smtpd.web11.22814.1678463509650773055
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Mar 2023 07:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XYnM6+jq;
 spf=pass (domain: gmail.com, ip: 209.85.222.42, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f42.google.com with SMTP id bx14so3841238uab.0
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Mar 2023 07:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678463508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=soLheYLOw06z32R86FR9kZkZUOHwTsbAGQ0cYBZVdPw=;
        b=XYnM6+jq/ppMD5sDosI2ztPLKzTUCFdt3rvIryl9rBLrxx/rAsBsbNIoP52NYmUG/+
         9UWHy9jsT9FSLvwr0Ly8cTjoSgMdYrW7IBZ2jyzjmROHGz2662br+2i6Ni9dAVbnZeUw
         isJrzRPlHMZ9RbMtyshQUmjL7oalarsyl8XXYut2SGJvjoPJndR4U2A9StLoWZntGWzv
         rq3tgLIEjTShBWnJJ8ngLfIT21bQjtQMhv06XdK824RtqOiClkImYUYnA+3gJ3uaEcmS
         fxYTYxi0rn5mkevoDID5OsKPqxSWAc27dfSXeDKMYWMzLwl6m77jrtTT232kHI2occxB
         QMHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678463508;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soLheYLOw06z32R86FR9kZkZUOHwTsbAGQ0cYBZVdPw=;
        b=1ULdkpxhn2RJKRpsybQVYO2Pu0dUiMmtRryPwNA2crT7rxpkG++kKqs+2+Ooqh7vMu
         zfuAMYL7wfHiowYDtXCTEN0UbA6q9WfxvXMhiLA0wWEr0gyJ7hvAj6gmE1K6Kj+WM/WS
         h7pvrltTe51Jx/uqA/rzTr2XqfK6MprMt8tFdtej2NKJayZVgTdE2y1CXOCTGaSqBfoL
         FMTIsUiBWntb+yUyepUTUT0u7AwE62SUcMtx+E1RVyl4JhVQRNVMneY2FToL+XDReG3J
         I6swWpeD5b5G55dRO15vNJyVQi6CgmO7vnCNJoAqxNSUnmwfUhajhf/XxEBuDibYUBda
         sZZQ==
X-Gm-Message-State: AO0yUKU1FcLFFBVyOb1Da9S81qg3FP/09KBRsPvcZen3cmIH2D7OYFx6
	1+JC3qbtaRzNxDtV6igb6LOST3xkGiMONWHBZU8=
X-Google-Smtp-Source: AK7set9FEZETfpiY7FYTEbxCxjTeC8LuKWL70PnLtPXb6yg25YXyvJ0/l8qddhauBppMl1tD1Cvp3RBIwVvNtvgtRYI=
X-Received: by 2002:a1f:9dc2:0:b0:406:1fd2:bb76 with SMTP id
 g185-20020a1f9dc2000000b004061fd2bb76mr16033273vke.0.1678463508591; Fri, 10
 Mar 2023 07:51:48 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Nne7FGt6twF9MeJ7BxhGwmPCM95840xSDJU_7WkpD6Zw@mail.gmail.com>
 <CANPvuRm=zfh+BeAQFxoQXSK3wuboVV=kAQmh44GoUyDqGyeQbw@mail.gmail.com>
 <1747DE9593C63FFC.22517@lists.yoctoproject.org> <CADkTA4OPjbwqKmnjdOosJR5wDvkNQbQ_nbkJReLkD_5ah0jDyg@mail.gmail.com>
In-Reply-To: <CADkTA4OPjbwqKmnjdOosJR5wDvkNQbQ_nbkJReLkD_5ah0jDyg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Fri, 10 Mar 2023 15:51:37 +0000
Message-ID: <CANPvuRnpoF8YWJrHbuXaW4aUaA88tmT_kScySj0wfE3zinomYA@mail.gmail.com>
Subject: Re: [meta-virtualization] go breakage in master
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, volodymyr.khoroz@foundries.io, 
	Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000032b8b105f68dbda2"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Mar 2023 15:51:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7939

--00000000000032b8b105f68dbda2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia ter=C3=A7a, 28/02=
/2023
=C3=A0(s) 03:32:

> On Mon, Feb 27, 2023 at 10:15 PM Bruce Ashfield via
> lists.yoctoproject.org
> <bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
> >
> > On Mon, Feb 27, 2023 at 6:01 PM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> > >
> > > Hi Bruce,
> > >
> > > I have seen recently some weird issues on the crypto/elliptic that is
> deprecated and replaced by crypto/ecdh on the 1.20 release [1].
> > > It looks like the crypto/elliptic is now no more than a compatibility
> wrapper and the new crypto/ecdh don't implement the P-224 curves [2].
> > >
> > > Are you facing something like this?
> >
> > That is one of them, yes.
> >
> > By removing the sharedlink, I was able to get it to build again. I
> > pushed a WIP patch to master-next just today.
>

For now we are using the same workaround of not using the sharedlink.

I have submit a bug about this issue
https://github.com/golang/go/issues/58966

Jose


>
> My mistake, I pushed it to master.
>
> So if you are still seeing this with a master from today, my fix isn't
> holding and we need to look into it more.
>
> Bruce
>
> >
> > Bruce
> >
> > >
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Add
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Add
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).CombinedM=
ult
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).CombinedM=
ult
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Double
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Double
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).IsOnCurve
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).IsOnCurve
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Params
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Params
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarBas=
eMult
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarBas=
eMult
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarMul=
t
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).ScalarMul=
t
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal=
Compressed
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).Unmarshal=
Compressed
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).normalize=
Scalar
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).normalize=
Scalar
> > > type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point]:
> unreachable sym in relocation:
> crypto/elliptic.(*nistCurve[*crypto/internal/nistec.P224Point]).pointFrom=
Affine
> > >
> > > [1] https://tip.golang.org/doc/go1.20
> > > [2] https://words.filippo.io/dispatches/go-1-20-cryptography
> > >
> > > Jose
> > >
> > > Bruce Ashfield <bruce.ashfield@gmail.com> escreveu no dia quinta,
> 23/02/2023 =C3=A0(s) 13:29:
> > >>
> > >> Just a heads up that some of the go applications are breaking in
> master.
> > >>
> > >> I'm aware of the issue, and have a general fix in progress.
> > >>
> > >> Bruce
> > >>
> > >> --
> > >> - Thou shalt not follow the NULL pointer, for chaos and madness awai=
t
> > >> thee at its end
> > >> - "Use the force Harry" - Gandalf, Star Trek II
> > >>
> > >>
> > >>
> > >
> > >
> > > --
> > > Best regards,
> > >
> > > Jos=C3=A9 Quaresma
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7906):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7906
> > Mute This Topic: https://lists.yoctoproject.org/mt/97182310/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe:
> https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/105081=
0/978058475/xyzzy
> [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000032b8b105f68dbda2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:=
bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt; escreveu no dia =
ter=C3=A7a, 28/02/2023 =C3=A0(s) 03:32:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">On Mon, Feb 27, 2023 at 10:15 PM Bruce Ashfield via=
<br>
<a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_bla=
nk">lists.yoctoproject.org</a><br>
&lt;bruce.ashfield=3D<a href=3D"mailto:gmail.com@lists.yoctoproject.org" ta=
rget=3D"_blank">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;<br>
&gt; On Mon, Feb 27, 2023 at 6:01 PM Jose Quaresma &lt;<a href=3D"mailto:qu=
aresma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wr=
ote:<br>
&gt; &gt;<br>
&gt; &gt; Hi Bruce,<br>
&gt; &gt;<br>
&gt; &gt; I have seen recently some weird issues on the crypto/elliptic tha=
t is deprecated and replaced by crypto/ecdh on the 1.20 release [1].<br>
&gt; &gt; It looks like the crypto/elliptic is now no more than a compatibi=
lity wrapper and the new crypto/ecdh don&#39;t implement the P-224 curves [=
2].<br>
&gt; &gt;<br>
&gt; &gt; Are you facing something like this?<br>
&gt;<br>
&gt; That is one of them, yes.<br>
&gt;<br>
&gt; By removing the sharedlink, I was able to get it to build again. I<br>
&gt; pushed a WIP patch to master-next just today.<br></blockquote><div><br=
>For now we are using the same workaround of not using the sharedlink.<br><=
br>I have submit=C2=A0a bug about this issue<br><a href=3D"https://github.c=
om/golang/go/issues/58966">https://github.com/golang/go/issues/58966</a><br=
><br>Jose<br>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
My mistake, I pushed it to master.<br>
<br>
So if you are still seeing this with a master from today, my fix isn&#39;t<=
br>
holding and we need to look into it more.<br>
<br>
Bruce<br>
<br>
&gt;<br>
&gt; Bruce<br>
&gt;<br>
&gt; &gt;<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Add<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Add<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).CombinedMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).CombinedMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Double<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Double<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).IsOnCurve<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).IsOnCurve<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Params<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Params<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).ScalarBaseMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).ScalarBaseMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).ScalarMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).ScalarMult<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Unmarshal<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).Unmarshal<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).UnmarshalCompressed<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).UnmarshalCompressed<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).normalizeScalar<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).normalizeScalar<br>
&gt; &gt; type:*crypto/elliptic.nistCurve[*crypto/internal/nistec.P224Point=
]: unreachable sym in relocation: crypto/elliptic.(*nistCurve[*crypto/inter=
nal/nistec.P224Point]).pointFromAffine<br>
&gt; &gt;<br>
&gt; &gt; [1] <a href=3D"https://tip.golang.org/doc/go1.20" rel=3D"noreferr=
er" target=3D"_blank">https://tip.golang.org/doc/go1.20</a><br>
&gt; &gt; [2] <a href=3D"https://words.filippo.io/dispatches/go-1-20-crypto=
graphy" rel=3D"noreferrer" target=3D"_blank">https://words.filippo.io/dispa=
tches/go-1-20-cryptography</a><br>
&gt; &gt;<br>
&gt; &gt; Jose<br>
&gt; &gt;<br>
&gt; &gt; Bruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>&gt; escreveu no dia quinta, 23=
/02/2023 =C3=A0(s) 13:29:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Just a heads up that some of the go applications are breaking=
 in master.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I&#39;m aware of the issue, and have a general fix in progres=
s.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Bruce<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; --<br>
&gt; &gt;&gt; - Thou shalt not follow the NULL pointer, for chaos and madne=
ss await<br>
&gt; &gt;&gt; thee at its end<br>
&gt; &gt;&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt;<br>
&gt; &gt; --<br>
&gt; &gt; Best regards,<br>
&gt; &gt;<br>
&gt; &gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; - Thou shalt not follow the NULL pointer, for chaos and madness await<=
br>
&gt; thee at its end<br>
&gt; - &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#7906): <a href=3D"https://lists.yoctoproject.org/g=
/meta-virtualization/message/7906" rel=3D"noreferrer" target=3D"_blank">htt=
ps://lists.yoctoproject.org/g/meta-virtualization/message/7906</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/97182310=
/1050810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.o=
rg/mt/97182310/1050810</a><br>
&gt; Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yocto=
project.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject=
.org</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtuali=
zation/leave/6693017/1050810/978058475/xyzzy" rel=3D"noreferrer" target=3D"=
_blank">https://lists.yoctoproject.org/g/meta-virtualization/leave/6693017/=
1050810/978058475/xyzzy</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" ta=
rget=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div></=
div>

--00000000000032b8b105f68dbda2--

