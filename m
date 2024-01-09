Return-Path: <liu.ming50@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88D68C46CD2
	for <webhook@archiver.kernel.org>; Tue,  9 Jan 2024 09:19:49 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web11.12960.1704791982871878528
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Jan 2024 01:19:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=L8DYeT7D;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: liu.ming50@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-5c66b093b86so2445434a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jan 2024 01:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704791982; x=1705396782; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=arFfq6QIabmQna4Mhv/mOU4B/1gcykjKi42YbiiRnWw=;
        b=L8DYeT7DHc63QneD7hoLzUBh0pzEsXBvGPnZo8+OxgUP1Jlb2gpB83Zd5+hODCKr/P
         FIgekolvujjpMjyZcrSKX6B7MHQQg+KuqrDvdF//Zh1muyePkWdVjPFnUtC3lWE91HiC
         sokzl39RoZYeUhdkA9MLaAKyf0HQiNnTRRAY2r/L9sM8rFMMmwYfKcIg3Bin1PHJhJrK
         dkxiNyFe2Ccgp5frEDuY7uxHRO4KZgu3vGuZRjvyoGA8bIRoY8AbwbjPX/kf4tZ0Dr9c
         IJ9ludJ8QHhkIBgCh8N0+xAWuON6pnU9uiRSHpsTzCPGfNdrMEl/dymo+nMknBgkruC9
         UxaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704791982; x=1705396782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arFfq6QIabmQna4Mhv/mOU4B/1gcykjKi42YbiiRnWw=;
        b=mE0BpqVH5qV4m/2xEsV28YsqeTGAIOJh4JEqEkbUheWiK5WxijULKu8HsSdJ8fc5vH
         70u0JfrBjXlS9V27Go0NMuULoC1a0XlZes16M3k4FGni/0X18/f+FGx7C5hNXANfCuK/
         taE0PmkFUGOM0kR74oqgGUv6c7iHhY4lrKjvP5P6hwzi+0XJEW0zg0emYMPClroEYrCR
         /l8pWHshblQU4yVXnhmR65r68GVE1a+taVau85qs+tR8UK0UojVVsHYWswzJ4eOe/kL/
         U11HtBHiQh5QGHV4brxhE+Ps90QiYMYP3X97kjHHneSAItTJBOd8N4VB4kd1KTlEOxxO
         3kzQ==
X-Gm-Message-State: AOJu0YwVKnYz8aTBvBfpUTL+pufGF+NmMGMjAnoxcCnM4gDPOxZoAJ29
	2C0TlhdXV9ZEe6fCx2nnPbFzz7kSMdhVySLmG5g=
X-Google-Smtp-Source: AGHT+IENvdp5UGKgmf6tHkBdtEQET7O7G08GUOulj+/tZoGX9ZCRIrAxy5GTU+o1FUGd/RXmhgDD6CDRKmcH8r7a6pI=
X-Received: by 2002:a17:90a:fb4d:b0:28b:765c:163e with SMTP id
 iq13-20020a17090afb4d00b0028b765c163emr543238pjb.16.1704791982090; Tue, 09
 Jan 2024 01:19:42 -0800 (PST)
MIME-Version: 1.0
References: <20240108180933.2362963-1-liu.ming50@gmail.com> <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com>
In-Reply-To: <CADkTA4NwrXFJ0b_2x0GDhVNeSUFVGOvWuXRKu+Wj1ckE=CtSEA@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Tue, 9 Jan 2024 10:19:30 +0100
Message-ID: <CALatG=4-p2tGB_Ke2WzULVQOPN00n5EYYRvAcsgfWi-U2gGo5g@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] podman: support bash completions for podman/docker
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000823056060e7fd0af"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Jan 2024 09:19:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8533

--000000000000823056060e7fd0af
Content-Type: text/plain; charset="UTF-8"

Hi, Bruce:

Seems podman manage its shell completions inside the code (see this line:
https://github.com/containers/podman/pull/21095/commits/6c4892c8029fd992b4494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd423c162d5b669688416caeR484
)

then it uses "podman completion SHELL-NAME" to get the completion for a
particular shell, so it's not safe to pre-generate a completion outside of
podman source? For instance, if we add a CVE fix or some common bug fixes
to SRC_URI, the completion might be changed and the developers have to be
aware of that and also update completion file.

And this qemu wrapper way is being used in OE in several recipes, like
python, the qemu-native would be built in most cases if you build a OE
image, so would be no much cost on it? Just my personal options.

the best,
thank you

--000000000000823056060e7fd0af
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>Seems podman manage its shel=
l completions inside the code (see this line: <a href=3D"https://github.com=
/containers/podman/pull/21095/commits/6c4892c8029fd992b4494adb62c535d0f5c5d=
62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd423c162d5b669688416caeR4=
84">https://github.com/containers/podman/pull/21095/commits/6c4892c8029fd99=
2b4494adb62c535d0f5c5d62d#diff-cf5cc76e70a369c5221f08f29ec0452710af1f4ecd42=
3c162d5b669688416caeR484</a>)</div><div><br></div><div>then it uses &quot;p=
odman completion SHELL-NAME&quot; to get the completion for a particular sh=
ell, so it&#39;s not safe to pre-generate a completion outside of podman so=
urce? For instance, if we add a CVE fix or some common bug fixes to SRC_URI=
, the completion might be changed and the developers=C2=A0have to be aware =
of that and also update completion file.</div><div><br></div><div>And this =
qemu wrapper way is being used in OE in several recipes, like python, the q=
emu-native would be built in most cases if you build a OE image, so would b=
e no much cost on it? Just my personal options.</div><div><br></div><div>th=
e best,</div><div>thank you</div></div>

--000000000000823056060e7fd0af--

