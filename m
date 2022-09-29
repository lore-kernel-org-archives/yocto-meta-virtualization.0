Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7851DC433FE
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 13:47:06 +0000 (UTC)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 by mx.groups.io with SMTP id smtpd.web09.10565.1664459217299249178
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 06:46:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TY1Mpvvg;
 spf=pass (domain: gmail.com, ip: 209.85.161.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f48.google.com with SMTP id
 d74-20020a4a524d000000b004755f8aae16so178753oob.11
        for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Sep 2022 06:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=dInNv7jevG/k5c4/JzbrSrFyeqdkXJZBkfHlFJuFS0k=;
        b=TY1MpvvgKfDyp5APUNbH4HdISu9V0NGVNVtrd16TUEdX9bQCAn4Ztu3NXylnONxHeq
         SzvyWjhAzywdyiCaWev7kH6u9rYaLC41AVNpXjgDcwDq0vsOhFIr/Di9ElV+/7frAHn1
         y7Pt0GTZs7v1jIOYeBc1QMUXDq0aIHfxNS4xyWpwmAZfnnqyznO4FeZ5RbogEqkm9b9i
         QokDT7Xy3hKtjUcL5wmYn3wtAjleX8b5n3myNYE8drSs0aSloUE0CoIurTO4R6CU0Dxj
         rKLqZSU/1z3G8f0f8gA6A10J07O/QmNbU9xhiHnMquRpZfZglP2wpTxbQgnHZ5urJaC3
         sDew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=dInNv7jevG/k5c4/JzbrSrFyeqdkXJZBkfHlFJuFS0k=;
        b=WTJZFfWjGpfsgv7GQAsBzRR2jXeOEO3nyErik3fxwyVLo6fI3GwkVu/qV7f03zygkx
         S//wR6KaMaHahFh7SJBbJy/7lsl9Onkni8RxQxQZG+Drf8OStl+Uq70j+MyzHzLZEXR5
         yAlSJur2v4geGmKByh2nzkzm77UW2q7ql3Zpq2dVKnMPXREUg2LuJD1OE0LFGz9XEjHM
         n/vwbSmB4zyZLpI8B+thA2bMoUovpo5lvyDKLk/ryGZ7NeakDBYk+I21d8rx0RvPeNSV
         OaXLdgdKbxFNSZUNj23//rkQC+6p7wUDc+T8+2CZ7NTUu6hdd5w12DxgVigRTz3n/HGw
         pozw==
X-Gm-Message-State: ACrzQf2fqdHJDBpiMGF/yJAwbmpDzqe0Yeh1FYgEXR7eOwCZS/kR/WoU
	UM/RbzLox0Tgm+tfXIJLsT5yUQYdj4sZocaUwN0Z9/q5A+E=
X-Google-Smtp-Source: 
 AMsMyM42sR9eAueyzra5f+zEl2cyl9cMQhrq3xLgfovBwVGixW5vGnxF2PkTHOTPlMvI9sNNiVwcWMS3rHA6kwJOGnM=
X-Received: by 2002:a4a:8d57:0:b0:476:99ae:46a5 with SMTP id
 x23-20020a4a8d57000000b0047699ae46a5mr1375878ook.51.1664459216441; Thu, 29
 Sep 2022 06:46:56 -0700 (PDT)
MIME-Version: 1.0
References: <20220929085141.19781-1-kai.kang@windriver.com>
In-Reply-To: <20220929085141.19781-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 29 Sep 2022 09:46:44 -0400
Message-ID: 
 <CADkTA4PbHs90Ek5uBj_LtzAt5=ow+U3ZcOSzBK1a1zs5VBipQQ@mail.gmail.com>
Subject: Re: [PATCH 0/1] Update criu to 3.17.1
To: kai.kang@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="00000000000056d74205e9d11cbe"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Sep 2022 13:47:06 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7633

--00000000000056d74205e9d11cbe
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 29, 2022 at 4:51 AM <kai.kang@windriver.com> wrote:

> From: Kai Kang <kai.kang@windriver.com>
>
> Hi Bruce,
>
> The latest release is 3.17.1 but not include commits to fix for glibc
> 2.36. So backport them at same time.
>
>
I would have preferred not to have the patch, so I spent some time digging
around the criu repository this morning.

And yes indeed, it is on criu-dev, but not on master. And while criu-dev
has the 3.17 "release" commit, it doesn't have the 3.17.1 commit .. while
we could switch to criu-dev for the branch, and pickup this fix and a few
others, that's more churn than just taking the patch. I'm not concerned
about staying on the release commits, since they don't really do anything,
so not having the 3.17.1 commit on criu-dev isn't a concern to me.

Summary: we'll keep the branch the same, and take this commit as-is, since
it will be easy to fixup in the future.

Bruce


>
>
> Kai Kang (1):
>   criu: 3.17 -> 3.17.1
>
>  recipes-containers/criu/criu_git.bb           |  12 +-
>  ...u-Change-libraries-install-directory.patch |   6 +-
>  .../0004-criu-fix-conflicting-headers.patch   | 288 ++++++++++++++++++
>  ...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++
>  4 files changed, 411 insertions(+), 5 deletions(-)
>  create mode 100644
> recipes-containers/criu/files/0004-criu-fix-conflicting-headers.patch
>  create mode 100644
> recipes-containers/criu/files/0005-mount-add-definition-for-FSOPEN_CLOEXEC.patch
>
> --
> 2.17.1
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000056d74205e9d11cbe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Thu, Sep 29, 2022 at 4:51 AM &lt;<a href=3D"mail=
to:kai.kang@windriver.com" target=3D"_blank">kai.kang@windriver.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From: Ka=
i Kang &lt;<a href=3D"mailto:kai.kang@windriver.com" target=3D"_blank">kai.=
kang@windriver.com</a>&gt;<br>
<br>
Hi Bruce,<br>
<br>
The latest release is 3.17.1 but not include commits to fix for glibc<br>
2.36. So backport them at same time.<br>
<br></blockquote><div><br></div><div><div class=3D"gmail_default" style=3D"=
font-size:small">I would have preferred not to have the patch, so I spent s=
ome time digging around the criu repository this morning.</div></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">And yes indeed, it is on criu-dev, b=
ut not on master. And while criu-dev has the 3.17 &quot;release&quot; commi=
t, it doesn&#39;t have the 3.17.1 commit .. while we could switch to criu-d=
ev for the branch, and pickup this fix and a few others, that&#39;s more ch=
urn than just taking the patch. I&#39;m not concerned about staying on the =
release commits, since they don&#39;t really do anything, so not having the=
 3.17.1 commit on criu-dev isn&#39;t a concern to me.=C2=A0</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">Summary: we&#39;ll keep the branch the s=
ame, and take this commit as-is, since it will be easy to fixup in the futu=
re.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><=
div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
Kai Kang (1):<br>
=C2=A0 criu: 3.17 -&gt; 3.17.1<br>
<br>
=C2=A0recipes-containers/criu/<a href=3D"http://criu_git.bb" rel=3D"norefer=
rer" target=3D"_blank">criu_git.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0|=C2=A0 12 +-<br>
=C2=A0...u-Change-libraries-install-directory.patch |=C2=A0 =C2=A06 +-<br>
=C2=A0.../0004-criu-fix-conflicting-headers.patch=C2=A0 =C2=A0| 288 +++++++=
+++++++++++<br>
=C2=A0...nt-add-definition-for-FSOPEN_CLOEXEC.patch | 110 +++++++<br>
=C2=A04 files changed, 411 insertions(+), 5 deletions(-)<br>
=C2=A0create mode 100644 recipes-containers/criu/files/0004-criu-fix-confli=
cting-headers.patch<br>
=C2=A0create mode 100644 recipes-containers/criu/files/0005-mount-add-defin=
ition-for-FSOPEN_CLOEXEC.patch<br>
<br>
-- <br>
2.17.1<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
>- Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br=
><br></div></div>

--00000000000056d74205e9d11cbe--

