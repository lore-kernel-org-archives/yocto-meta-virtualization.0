Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0184E732E9
	for <webhook@archiver.kernel.org>; Thu, 28 Sep 2023 20:05:25 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.2566.1695931523531545788
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 28 Sep 2023 13:05:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=QXI+JeZk;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id ca18e2360f4ac-79fa5d9f3a2so396342239f.3
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Sep 2023 13:05:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695931522; x=1696536322; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tIUH1tV8neoo4nT7ioo1KEXt0s15nQhpBR33xbKUfLg=;
        b=QXI+JeZkHYHeuljGwwK1LL5nSbqAxaBsc9Mj1UJ22rbH/4ePSflKuOQ14Zg6JNrpTt
         1MdAcqK4jYaJHGxDYXdysPenihA0MpiBYLg+1TykuWCIGNz6JAufHnx41vHvrAtEqomZ
         nsS1WdIZ0nBMA2xLULTpgZxKWs/XIorEdLvhhpIXMS5UtIMgv7lGVJzf9TezLeEN2dCO
         JBpNZcQzGuzRVKcGQR5Dlb507uFevOjcWh3JLd8rpS2Py2yihhd1qqs6DC23kz+tIk0g
         GXyzr4BpyP8BfV2hmQZjXJs3V/dQ8VKYfIqJ97e3x3XTkCpo/Kkwd4TseA/hBqTdNoKv
         DKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695931522; x=1696536322;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIUH1tV8neoo4nT7ioo1KEXt0s15nQhpBR33xbKUfLg=;
        b=r7TFHHqZBuZ3foy++3R3bdd4JwezHHpLdgulcHs7V4PjuePv/+55f9bexffBf+vl66
         sCRCvfpn+V3vlwal+HeVlKY8enQRe/9SofegFDI8G7iQObBSiIMtjTy+ekYE6zJnnqUT
         5WNq5ty4M4Jcal3aeBgLugtgsVrjPOXVmXErEhBaCWFPX8MhfZcW/rEDw4nqCv9OICWb
         DO+CdXAVMkU+6d2twLD8CFwWO3ks6QVv+BmKkuo8IzO85AhbafluuSYY3kE5Z3Ne2lI/
         VioBPhbdA/mvq4hkqywIkIHUfYpBLuVrqz97rglJxUV7AR0Q6V8j8X8QUsA2oZ+V/AZN
         JjYQ==
X-Gm-Message-State: AOJu0YzAxaDzLdmmy3uQgmmYm1gw0O5Se7UkvifiEdGYWsbsBFQbzLni
	yXImgwE8OWNLazR+TecQOZ1jRgfCLwZquQ302zY=
X-Google-Smtp-Source: AGHT+IHHMHzgB07IVHZS5XtGIdubYVMmBWHk5LyIZtXiIbi8DTnp4FiY8TczsLqnADUDIElzdwkcrKMpnTrSVRESm5Y=
X-Received: by 2002:a05:6602:1857:b0:792:82f8:749d with SMTP id
 d23-20020a056602185700b0079282f8749dmr2468579ioi.10.1695931521762; Thu, 28
 Sep 2023 13:05:21 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4OxoMcxMBX_QuDVqPjRFKRX9M0n5Vs_wmVs0yvYWEspxg@mail.gmail.com>
 <27529.1695927896223484818@lists.yoctoproject.org>
In-Reply-To: <27529.1695927896223484818@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 28 Sep 2023 16:05:10 -0400
Message-ID: <CADkTA4OMeZoD2e0dKFhXn=_1L0znRA1_EXp3t-gk_H5xLPETCw@mail.gmail.com>
Subject: Re: [meta-virtualization] [mickledore][PATCH 1/2] moby: update to v24.0.2
To: Adam Johnston <adam.johnston@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000eb0be4060670d3ed"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 Sep 2023 20:05:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8330

--000000000000eb0be4060670d3ed
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Nope!

I have a policy similar to oe-core, minor version bumps are fine, just no
major version bumps unless there's a super compelling reason.

Bruce

On Thu, Sep 28, 2023 at 3:04=E2=80=AFPM Adam Johnston <adam.johnston@arm.co=
m> wrote:

> Thanks Bruce, just wanted to check there was no objection in principle to
> the version bump
>
> Thanks and Regards
>
> Adam
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8329):
> https://lists.yoctoproject.org/g/meta-virtualization/message/8329
> Mute This Topic: https://lists.yoctoproject.org/mt/101577831/1050810
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

--000000000000eb0be4060670d3ed
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Nope!</div><div class=3D"gmail_default" style=3D"font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I hav=
e a policy similar to oe-core, minor version bumps are fine, just no major =
version bumps unless there&#39;s a super compelling reason.</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Bruce</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Sep 28, 2023 at 3:04=
=E2=80=AFPM Adam Johnston &lt;<a href=3D"mailto:adam.johnston@arm.com">adam=
.johnston@arm.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">Thanks Bruce, just wanted to check there was no objection =
in principle to the version bump<br><br>Thanks and Regards<br><br>Adam
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#8329): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/8329" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/8329</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/101577831/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/m=
t/101577831/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature">- =
Thou shalt not follow the NULL pointer, for chaos and madness await thee at=
 its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br><b=
r></div></div>

--000000000000eb0be4060670d3ed--

