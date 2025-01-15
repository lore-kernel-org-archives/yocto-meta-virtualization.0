Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B36C4C02180
	for <webhook@archiver.kernel.org>; Wed, 15 Jan 2025 14:02:43 +0000 (UTC)
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
 by mx.groups.io with SMTP id smtpd.web10.21504.1736949754089215998
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2025 06:02:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gUDTn1+e;
 spf=pass (domain: gmail.com, ip: 209.85.216.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2f441791e40so8907111a91.3
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 06:02:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736949753; x=1737554553; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rRfHGg4uTm1ZuQZHLCWNhjPijrcxQvFUdAPmq/ArFww=;
        b=gUDTn1+eZSh+emQl1/UTwS/tTHVidLUeOF1QS5V1YK047mfff14JJaAj7RH1+xei1K
         tGnfqWLsWJXIGcX6Q2yhYSntGyG2cPGqc7biBPjSNyolotim+Fqym+DgLlfwizUEJtTC
         iJOdDuvjTKxjrHu9oLNcwRU6mVod4qulyqGborYDQ1Y5KPk5A8FUIDps97FN62sW8XCY
         l8MoZ+TWc5WV4w1vIIoJvZEThTd4TSIbwzrWewl39FDMaXToBrUfmz7Bloa/OGRYQ+nl
         m3kmbZOocsSHstPUBr9MCcqy1UW39WXwP+gTnUYC9sBv11cfxiX0MmgPTVH/3cMyWqvZ
         Uz8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736949753; x=1737554553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rRfHGg4uTm1ZuQZHLCWNhjPijrcxQvFUdAPmq/ArFww=;
        b=KWWYq628hICL8Q2w57H6brm+31zj3MyRPtyj/+YFfefWlXnRp5PMYAQ8eKJs+jPOuQ
         duMOOfgMIV1BYuf2TMtPaKrEDA8Gxe/c2CtqGD49p3Q+lIrD2zQrMhqgbqj6Fr+17M28
         Rl1GT5f7dPVFPMDTm2g8m+hBCSvxf4aswOm2qCNuMZq8MryBW4tGJpTG9yeG1cA5KUf5
         Vws8cHrpxXS4U3YAmmW9KuoyYkgTAXbhJvu0+ZbVPYj+navnoJ3x4x0enNFzNlNuQp5r
         mbi065QQhqLPoimvH1JiAZaHPbVdEa8hJgut9kXgcWcl2Z7kgXxkR7ulpIuT4hzr9ae9
         jpzQ==
X-Gm-Message-State: AOJu0YwvWH8qzgKGQBTMhwbfZsJQB0NYaO1cB/AkoPEvzbZCbvn714Kb
	QBvCJsPB0CXzXieFdY9/qyXYS9MvdfWSr2nH5FZOkcPW9w9LM4SE9FFkoFVzgBbVt4wrfA06ciT
	K2zmPEXG9kunTWcSZRA2UUYTSv9k=
X-Gm-Gg: ASbGncvVKHyMoTi4bH9FYiN31T8JlPpd3PiANFZtpAknas218NZe5bM08QmdofP7xLp
	/WjME7ecK//MIN4+S6W8w36u2B2dtdY1xsf60UdU=
X-Google-Smtp-Source: AGHT+IGsNnl8E9HqEwY+CMZP/leK5cEjhYa/424JviWZCi/FSBIdKrK4ceODlUHxA4lDE5bOfjttBK0x6PlsnzoYKZg=
X-Received: by 2002:a17:90b:4c8d:b0:2ee:db8a:29d0 with SMTP id
 98e67ed59e1d1-2f5490bab2cmr35960461a91.26.1736949753343; Wed, 15 Jan 2025
 06:02:33 -0800 (PST)
MIME-Version: 1.0
References: <181AD785DBDAB9B0.28670@lists.yoctoproject.org> <Z4eZcpDn32qKiT9i@nuoska>
In-Reply-To: <Z4eZcpDn32qKiT9i@nuoska>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 15 Jan 2025 09:02:22 -0500
X-Gm-Features: AbW1kvbxqqhHLWev3nOBf6Hhj10wJV1XN2wfbTg-Eqf1hALiGRonmzMBKnq-xtU
Message-ID: <CADkTA4PRRcWjshr+O1ZOpwwFb3Ev=u8W4G0gUAyBcDkEfEr4xg@mail.gmail.com>
Subject: Re: [meta-virtualization] k3s spegel download failure
To: mikko.rapeli@linaro.org
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="0000000000000a77ea062bbf2190"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2025 14:02:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9088

--0000000000000a77ea062bbf2190
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I had run into this as well, and updated k3s past the issue .. but
unfortunately oe-core's go is to old at the moment, so the update can't be
pushed.

I'm glad it resolved this way though, since I was stuck without a great
solution.

Bruce

On Wed, Jan 15, 2025 at 6:18=E2=80=AFAM Mikko Rapeli via lists.yoctoproject=
.org
<mikko.rapeli=3Dlinaro.org@lists.yoctoproject.org> wrote:

> Hi,
>
> On Wed, Jan 15, 2025 at 12:39:30PM +0200, Mikko Rapeli via
> lists.yoctoproject.org wrote:
> > I've reported this to upstream in
> https://github.com/spegel-org/spegel/issues/697
>
> Upstream developers pushed the commit under a tag and issue is fixed.
>
> Cheers,
>
> -Mikko
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9085):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9085
> Mute This Topic: https://lists.yoctoproject.org/mt/110625130/1050810
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

--0000000000000a77ea062bbf2190
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-size:small">I h=
ad run into this as well, and updated=C2=A0k3s past the issue .. but unfort=
unately oe-core&#39;s go is to old at the moment, so the update can&#39;t b=
e pushed.</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">I&#39;m glad it=
 resolved this way though, since I was stuck without a great solution.</div=
><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-size:small">Bruce</div></div><br><div cla=
ss=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_at=
tr">On Wed, Jan 15, 2025 at 6:18=E2=80=AFAM Mikko Rapeli via <a href=3D"htt=
p://lists.yoctoproject.org">lists.yoctoproject.org</a> &lt;mikko.rapeli=3D<=
a href=3D"mailto:linaro.org@lists.yoctoproject.org">linaro.org@lists.yoctop=
roject.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On Wed, Jan 15, 2025 at 12:39:30PM +0200, Mikko Rapeli via <a href=3D"http:=
//lists.yoctoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctop=
roject.org</a> wrote:<br>
&gt; I&#39;ve reported this to upstream in <a href=3D"https://github.com/sp=
egel-org/spegel/issues/697" rel=3D"noreferrer" target=3D"_blank">https://gi=
thub.com/spegel-org/spegel/issues/697</a><br>
<br>
Upstream developers pushed the commit under a tag and issue is fixed.<br>
<br>
Cheers,<br>
<br>
-Mikko<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9085): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9085" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/9085</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/110625130/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/110625130/1050810</a><br>
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

--0000000000000a77ea062bbf2190--

