Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FBBBC5475B
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 06:38:17 +0000 (UTC)
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
 by mx.groups.io with SMTP id smtpd.web10.6519.1709707095370910024
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 05 Mar 2024 22:38:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iF9Qfb7e;
 spf=pass (domain: gmail.com, ip: 209.85.167.181, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-3c1ec2c07ffso1631565b6e.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 05 Mar 2024 22:38:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709707094; x=1710311894; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r4rHyYrJ6BFfoJQ3qBvJQee+F1sw8YA4G+kuQQjtATA=;
        b=iF9Qfb7ewHJOutgldB9XFZIpjkDCmiImZymioqkolFXHiz5qDWkJhICAUOE1Rl5ae+
         TbTlWrGW/7s9SJhYEEx1SMR2VsgtbysaR6R5TD05B2sN58eFmBzLYJoiD3ivm43ZO7JP
         OM/RBB4GawpjVsJPaiWqXOuxV4Mi+Wcc/jmwLUZTJ7hsBjODyJqpCEg6MTZqX9FTLXnK
         CtJn5OrV6R4ljfI5HrsgPWNQxiWPt22xuEyGFIxEt8no9OZWtZUGSJzqg03IYp2F2mo6
         63ImjFBGSwXBu7VKHO7Bj3SieV93UYPpbr573kIkcqK2xQ6hP2ex7EluideY/BJM+X5m
         lxYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709707094; x=1710311894;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r4rHyYrJ6BFfoJQ3qBvJQee+F1sw8YA4G+kuQQjtATA=;
        b=CF8cbNxnhqt/hX4JbKzbEVcCSbN1VmUdxuSzS23jLn45SCkdxof67WizB9IIrIIj0J
         x27L8jngJwhBkb96JKzCGdu6B4NMsX2NB1Txw+B1X8+iyNWVRcgACB+kJmkxTRFNmXGU
         348z5Z3KVKp8c521mDL91Tkig2sqpymOOX802AI9lGQiYgXJw5gHJ5UmHqXlCLX53v5k
         ckWc5GqUo1i7YcwvlNhrgHcHlpKn/jt1UdJBxmfXRjxN86oZBdXxyJjya7lb+i8Q/hO0
         AdDagzzIf79UWTh2yW1Jw9ibwSnWuvfAbL4zn7pL6GZfnQYvdlg9ih3QBLlRL62w8xoU
         Da4g==
X-Gm-Message-State: AOJu0YzKEQdqmuLnm40bTXZs6AGEBU1jPReySegSBGoGJZrHGwAKgZR2
	SZkaAU96ZJKH1dVXXYs86h7jCeCaTY/Ti6AnT88YlJ/yirTw++ytB/qxJFrBnoyt50B7B0HG7s3
	9WAa3yrrdJT5qNG57hzmeUse8NJQ=
X-Google-Smtp-Source: AGHT+IFOSIRwWNwbOck3a4GzoDDNx0WpMWVtonNGNfji+TpAcv06qXmh8Xb/O7S5ZlgLvLEBCrfGLYRiYxQans4An2A=
X-Received: by 2002:a05:6870:f61d:b0:21e:a332:ceb2 with SMTP id
 ek29-20020a056870f61d00b0021ea332ceb2mr4306870oab.31.1709707094445; Tue, 05
 Mar 2024 22:38:14 -0800 (PST)
MIME-Version: 1.0
References: <CADkTA4Pu+VRU=nOazQGrCdJcTriVDatUOnG7P6DVi9T1AOTOBw@mail.gmail.com>
In-Reply-To: <CADkTA4Pu+VRU=nOazQGrCdJcTriVDatUOnG7P6DVi9T1AOTOBw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 5 Mar 2024 22:38:03 -0800
Message-ID: <CAMKF1so3wHCg=Vsv8-=Pgu=P5xE1CqEb9PCg4bkaYTOnrU43ww@mail.gmail.com>
Subject: Re: [meta-virtualization] ceph upgrade
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="00000000000008d1d80612f834f3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 06 Mar 2024 06:38:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8605

--00000000000008d1d80612f834f3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 5, 2024 at 6:22=E2=80=AFPM Bruce Ashfield <bruce.ashfield@gmail=
.com>
wrote:

> Hi all,
>
> If anyone has experience with Cmake, I could use a hand completing the
> ceph upgrade that is marked as WIP in master-next.
>
> It took me a few hours today, but I managed to get past python3
> detection issues, but now I'm running into a compiler test failure
> during the build.
>
> To me, it looks like our sysroot isn't being passed, which could be
> related to the toolchain.cmake not being used (since the compiler test
> is being launched by a sub component).
>

Post the cmake error logs this might give some hints

>
> I'm inclined to be stubborn about this, and keep working on getting
> the package bumped, as it has missed a few upgrades and is in need of
> some love.
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
> View/Reply Online (#8604):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8604
> Mute This Topic: https://lists.yoctoproject.org/mt/104759213/1997914
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--00000000000008d1d80612f834f3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Tue, Mar 5, 2024 at 6:22=E2=80=AFPM Bruce Ashfield &lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">Hi all,<br>
<br>
If anyone has experience with Cmake, I could use a hand completing the<br>
ceph upgrade that is marked as WIP in master-next.<br>
<br>
It took me a few hours today, but I managed to get past python3<br>
detection issues, but now I&#39;m running into a compiler test failure<br>
during the build.<br>
<br>
To me, it looks like our sysroot isn&#39;t being passed, which could be<br>
related to the toolchain.cmake not being used (since the compiler test<br>
is being launched by a sub component).<br>
</blockquote><div dir=3D"auto"><br></div><div dir=3D"auto">Post the cmake e=
rror logs this might give some hints=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;padding-left:1ex;border-left-color:rgb(204,204,204)"><br>
I&#39;m inclined to be stubborn about this, and keep working on getting<br>
the package bumped, as it has missed a few upgrades and is in need of<br>
some love.<br>
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
View/Reply Online (#8604): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8604" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8604</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/104759213/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/104759213/1997914</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" ta=
rget=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000008d1d80612f834f3--

