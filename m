Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABC3CD98C5
	for <webhook@archiver.kernel.org>; Sat, 13 Jun 2026 22:52:16 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.99576.1781391135275453470
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 13 Jun 2026 15:52:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TLGYAZ3b;
 spf=pass (domain: gmail.com, ip: 209.85.210.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-8424b6792efso892199b3a.3
        for <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 15:52:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781391135; cv=none;
        d=google.com; s=arc-20240605;
        b=WlY9eJtpaf6Zr5waX7kGg+eSbK4EkBYwRxNSmQXDermW9UV6uGcvS9glfGYd7AJ0+K
         332Gef26DtFSBJLvtiNumh6n1krcXRPEDG8A4fOzZ8ebtGc4e4t2LQyypLK3D8IPyDQ9
         Ga5VGyDc8/mLL5Z34S7hQSyV6bSm8Rl07mDQyFr5xDp6j/60EvmtFSX3f6ZfSPEK4ooB
         hjERFncgjjc/aCOKrJ0L5SwKKCPVgjo2UTQsZ7D++477N/skQ4JOctsmL47ifOWON8nk
         r4qG18yc+frFQV1uiSOUUkfUrrmL8eSEatHBympIvMDGxS+4Y8ihDgnFbzsit8EKoygu
         FBMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=E33n2h4XKvKv7SGCC3/kn0zVDK+N9sPMtpO9+WCZkx4=;
        fh=2hQr0szKQYGpuSOF+RtTRCfOhdWO6Si9zNZvMU3iBds=;
        b=TCEX2iZO7po30QJisE5TJR+elJLsmB2Uly4iC4IQLiqRtxsCo88zERINFaax/eyd7N
         E2KcPt81JIxzGWQbMhdjd8zskS5QdNPpZROKjp1KUjgglMan4/5O7Hd3c9wuo+CbZJQT
         htQPFZ/stED9dupSTT+FRHABcX+8GP4UbSym9K4MtncBsix3lrC3AHiHuYnb/3xexxNd
         k0/mGhxV7XGOc/c98ZWQwAWhJwp00A+Hamq8o8J/hL3D+wxkPWDhJdD602vKghNnd742
         DzjSIj0HMDYOjAib0PtzQJH4L3fEmpSD2aILfyank6bJCk1u9CKZtQ3dZavPwpjQmBH5
         hycw==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781391135; x=1781995935; darn=lists.yoctoproject.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=E33n2h4XKvKv7SGCC3/kn0zVDK+N9sPMtpO9+WCZkx4=;
        b=TLGYAZ3bp92yDUdv7pY3VC0s2k0iDfeo0gevKYFNIMz20yt/3+TdVsTqxIsEEt6Ie6
         Ie87JHVUJmznJ0t7B2FoHkiiOZEBAA1LlKxyJu7tI93zTaVlTG4FKY5p/af3GOzSXViw
         UF4d7LLl4E5nsMPCrX8yszoR3JgmvVia0RXCjdjg67BR7Q0rkfS1wufV0niue0yn1b1O
         vViX04HMmU2HDpmuxDx0IgGDTuHpiuC3sm0HQKyKA61ctBdD9W3C0Bn00avi8jUGmzha
         9HQ7M+qaCanPCc2EDBe0xf1NxRTW7CPhkI8VTB3zKZXXk8pibxbOQhGe5JZjgpCIJ2Vi
         u5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781391135; x=1781995935;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E33n2h4XKvKv7SGCC3/kn0zVDK+N9sPMtpO9+WCZkx4=;
        b=KqyppNZO/E3At+2wa/HazEVf1gbc6wegbFcnSEzkxCpCYEJln1udGGi8yX0Iv560DG
         4z7/TdxcoMisXERqaFYAJZhb7drFETL4WlAaHUkCf+JjLmS0dye8ALE6SlMdCm9fHMNS
         RLLtxGa2DddejC7dWTYmMe9XuLATxXUvTU5xqn/S/8jzhNbIAJT2fPOBUOLUfxPfQhVO
         w9HfHN8xm177FSJPrDb+4X4yRJhZ5o1p/xDHRQPSakHGuaJEHtMwegJhHUpu0iebzT5P
         Ffyq3/bApaTRxoe1smpLn1ZYr+9k3FgCrw50Up1ILQF1g2iP5q5VwKbuTnlFX1psE98W
         zPjg==
X-Gm-Message-State: AOJu0YwLfNLUwMH9Y/rDo25VvkaqOkKaECf3aPwcdyUHQfry0tPrKr6R
	5nW9+Km6xQhUOFVhJ8KU1eLAvaZLiQMe5WCwcWEdsUsPBM7FrCHp10VD5h898a72tBrnJTC5rNL
	d68CE6Y8x4rsi6xPGXpC71uX87fE99co=
X-Gm-Gg: Acq92OG0rXbRG5y0K8RKfeEmCnEvlocfveZh14Ga84Wa3/pHFkbI6AOHcNhHs9xXY1I
	5RwbK7mJboyioGpZxFAtZ+UEL4AAdlxYHetKzre4936mPrIeEgJNtXqTOUPbt1gUBcs3pRhOjVd
	vcv4JYzsS6dZ80js3Cbo5FEqQXMdeGeTIyWDUC3YfyJ91n7D8uzA11UhGxErpGFAdCtECom0tB9
	yY5L7owWG1FtgluQa7zoCMsZdcxtiuRRv61xDzyjXG55IYxaiME5oyrlCPXFYpghEZdqPKNXB5u
	rrYoPWXFSv6kESmJQseTNeS70DV3p6rD8Or2lM22lXSsH3gwogrU3YavAbBWz5iNoGBHxM5E5/u
	ZV3FwCYwoqepdQHDxTWmI8Idm2nF1EAejNO4=
X-Received: by 2002:a05:6a00:896:b0:842:74e3:48a9 with SMTP id
 d2e1a72fcca58-844e1981195mr5905589b3a.12.1781391134404; Sat, 13 Jun 2026
 15:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <e5d18f05-f00f-45df-a4c1-c2d21ca17de7@gmail.com>
In-Reply-To: <e5d18f05-f00f-45df-a4c1-c2d21ca17de7@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 13 Jun 2026 18:52:02 -0400
X-Gm-Features: AVVi8CdmMyIm28B-fS5Hg_5tlQreHvZ9HNRyqbMBr4CJvi_RdazCevpRdfeBnus
Message-ID: <CADkTA4MTErag5MAyYFP=PCvzErAkcZYkrQB3in3ioBXSi82jyA@mail.gmail.com>
Subject: Re: [meta-virtualization] lxc: starting a container errors out
To: fntoth@gmail.com
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: multipart/alternative; boundary="000000000000c5b5d906542a7101"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 13 Jun 2026 22:52:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9891

--000000000000c5b5d906542a7101
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II


On Sat, Jun 13, 2026, 3:34=E2=80=AFp.m. Ferry Toth via lists.yoctoproject.o=
rg
<fntoth=3Dgmail.com@lists.yoctoproject.org> wrote:

> root@yuna:~# lxc-create --name mycontainer --template download -- --dist
> ubuntu --release resolute --arch amd64
>
> mktemp: failed to create file via template '-d/tmp.XXXXXXXXXX': No such
> file or directory
>
>
> This can be traced back to
>
> - DOWNLOAD_TEMP=3D"${DOWNLOAD_TEMP}$(mktemp -d)"
>
> + DOWNLOAD_TEMP=3D"$(mktemp -p ${DOWNLOAD_TEMP} -d)"
>
>
> in patch "templates-actually-create-DOWNLOAD_TEMP-directory.patch."
>
> At this point in the code it is guaranteed that DOWNLOAD_TEMP is unset.
> And `mktemp -p -d` results to the above error (on linux).
>
> The patch needs to be dropped.
>


So send a patch.

lxc is functional for other use cases master-next is passing sanity for
incus/lxc and I'll need to confirm those paths against any changes.

Bruce


> Ferry
>
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9890):
> https://lists.yoctoproject.org/g/meta-virtualization/message/9890
> Mute This Topic: https://lists.yoctoproject.org/mt/119792692/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000c5b5d906542a7101
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div><br></div><div><br></div><div data-smartmail=3D=
"gmail_signature">- Thou shalt not follow the NULL pointer, for chaos and m=
adness await thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf=
, Star Trek II<br><br></div><br><div class=3D"gmail_quote gmail_quote_conta=
iner"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 13, 2026, 3:34=E2=
=80=AFp.m. Ferry Toth via <a href=3D"http://lists.yoctoproject.org">lists.y=
octoproject.org</a> &lt;fntoth=3D<a href=3D"mailto:gmail.com@lists.yoctopro=
ject.org">gmail.com@lists.yoctoproject.org</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc s=
olid;padding-left:1ex">root@yuna:~# lxc-create --name mycontainer --templat=
e download -- --dist <br>
ubuntu --release resolute --arch amd64<br>
<br>
mktemp: failed to create file via template &#39;-d/tmp.XXXXXXXXXX&#39;: No =
such <br>
file or directory<br>
<br>
<br>
This can be traced back to<br>
<br>
- DOWNLOAD_TEMP=3D&quot;${DOWNLOAD_TEMP}$(mktemp -d)&quot;<br>
<br>
+ DOWNLOAD_TEMP=3D&quot;$(mktemp -p ${DOWNLOAD_TEMP} -d)&quot;<br>
<br>
<br>
in patch=C2=A0&quot;templates-actually-create-DOWNLOAD_TEMP-directory.patch=
.&quot;<br>
<br>
At this point in the code it is guaranteed that DOWNLOAD_TEMP is unset. <br=
>
And `mktemp -p -d` results to the above error (on linux).<br>
<br>
The patch needs to be dropped.<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">So send a patch.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto">lxc is functional for ot=
her use cases master-next is passing sanity for incus/lxc and I&#39;ll need=
 to confirm those paths against any changes.</div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Bruce=C2=A0</div><div dir=3D"auto"><br></div><div dir=
=3D"auto"><div class=3D"gmail_quote gmail_quote_container"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
Ferry<br>
<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#9890): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/9890" rel=3D"noreferrer noreferrer" target=3D"_blan=
k">https://lists.yoctoproject.org/g/meta-virtualization/message/9890</a><br=
>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/119792692/105=
0810" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoctopr=
oject.org/mt/119792692/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank" rel=3D"noreferrer">meta-virtualization+owner@list=
s.yoctoproject.org</a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.yoct=
oproject.org/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfi=
eld@gmail.com" target=3D"_blank" rel=3D"noreferrer">bruce.ashfield@gmail.co=
m</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000c5b5d906542a7101--

