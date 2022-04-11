Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87768C5518D
	for <webhook@archiver.kernel.org>; Mon, 11 Apr 2022 17:18:00 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com
 [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web12.28858.1649681029427538608
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 05:43:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PinBr7KU;
 spf=pass (domain: gmail.com, ip: 209.85.208.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 21so5031918edv.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Apr 2022 05:43:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R3Ojzmo9kjmOmYhDsdtmxs5QFq1281eKEKvU1CfUKAg=;
        b=PinBr7KUnE28PfjRroumu4b9bCwi0r7LKH0T4oAT1VkubjbgtG1JJfXoyIIwlpXTpy
         pHEAPSjHe8UAxLwCPwfFl+oE1CzGQSAfYonXcQ8FERiSMDAvO8jhdfjT6BXxvz1qtw+G
         BsZNxOtNSCap0qB3idpQZMxyZ+Le4F7bTiusl/zU/ew5hJ1qOYsbBKjUgoGDqFdwM0Td
         s/xFjVnJ7rkbY6luNppZA4WnxPFHTZJE5JTEsto8kVl4Kqz68+kYWnoJMsVVxEZw0m1A
         EAtFxjP+6+8dvgwIEabklsqzIHSpRYNO27fHuQMvZKEmbAinEsDJh43CVmYypGPnOPdL
         yfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R3Ojzmo9kjmOmYhDsdtmxs5QFq1281eKEKvU1CfUKAg=;
        b=nTiWYUcHgxF2B2ojFJFYL2Mk0hQeBb4l/92I1uyOaDop5Hat/ZPABXupfxa1NvRzYv
         niNV8q8qPZX2zOAlpC+wnzrFAHPL5nBoGgn2BwXC9qMeq8DoA8k1aUYYtjjv0GbC4Lgm
         pCkQ1X0+tZH6QtZwsZdy78u/upqUkFCjtEHm4ftdqKx4e9qwxCcKJaNlCM/RI1CdgFJF
         Cl26IZey8OhsaIMMGfhU7mGowHMw4tE6OqOv7fnsY+9x5xopI8aWlofEQQKPlqiZa883
         wgRhOXSddjT6Mjf3z4AJTzloQ2VdZ/wS0iVbP4y6uhnQ3t8+Imr42vYL7vtTiuOqjAeF
         CVvw==
X-Gm-Message-State: AOAM533ziw+Cg+1t+1pUTEKwhe74bVJDyrBO3YO72Xw6o8gYUuZfWFqX
	ihTEWB+739Qj09yhAJy/rLsF3RE2sO/2CIzV+tg=
X-Google-Smtp-Source: 
 ABdhPJz1GyjxAqGy7XVy9YMsZ107r1vGsWjMGIKyBjx8axs895vQwI691iLOaNpbWnrHA+/C7DP76p6QOxNLadyXmwY=
X-Received: by 2002:a05:6402:5186:b0:419:651e:5137 with SMTP id
 q6-20020a056402518600b00419651e5137mr33448211edd.335.1649681027893; Mon, 11
 Apr 2022 05:43:47 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4MBM_yP+DyR4=mS0K06JzACmJZP5v0E_hG0c+9e=ypikw@mail.gmail.com>
 <4446.1649648962103104390@lists.yoctoproject.org>
In-Reply-To: <4446.1649648962103104390@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Apr 2022 08:43:36 -0400
Message-ID: 
 <CADkTA4Nh0273C0r2g1ieTAwN3bnYw+RbLM0CQNz1HMPOzxz9rA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: fix do_package issue
To: preeti.sachan@intel.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: multipart/alternative; boundary="000000000000a90ccc05dc604bd3"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Apr 2022 17:18:00 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7150

--000000000000a90ccc05dc604bd3
Content-Type: text/plain; charset="UTF-8"

There's definitely something different in your configuration, so that needs
to be understood first.

That file is packaged as part of libvirt-python here, and should be the
same for others, as I haven't had any reports of failures.

You have a multiconfig in play. Anything else ? What is your init system ?
Any bbappends in play ?

Bruce

On Sun, Apr 10, 2022 at 11:49 PM <preeti.sachan@intel.com> wrote:

> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: QA Issue: libvirt:
> Files/directories were installed but not shipped in any package:
>   /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> libvirt: 1 installed and not shipped files. [installed-vs-shipped]
> ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were
> found, failing task.
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7146):
> https://lists.yoctoproject.org/g/meta-virtualization/message/7146
> Mute This Topic: https://lists.yoctoproject.org/mt/90385357/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [
> bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000a90ccc05dc604bd3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">There&#39;s definitely something different=C2=A0in your confi=
guration, so that needs to be understood first.</div><div class=3D"gmail_de=
fault" style=3D"font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-size:small">That file is packaged as part of libvirt-python here=
, and should be the same for others, as I haven&#39;t had any reports of fa=
ilures.</div><div class=3D"gmail_default" style=3D"font-size:small"><br></d=
iv><div class=3D"gmail_default" style=3D"font-size:small">You have a multic=
onfig in play. Anything=C2=A0else ? What is your init system ? Any bbappend=
s in play ?</div><div class=3D"gmail_default" style=3D"font-size:small"><br=
></div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Sun, Apr 10, 2022 at 11:49 PM &lt;<a href=3D"mailto:preeti.sachan@intel.co=
m">preeti.sachan@intel.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div>ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_packa=
ge: QA Issue: libvirt: Files/directories were installed but not shipped in =
any package:</div>
<div>=C2=A0 /usr/lib/sysctl.d/60-qemu-postcopy-migration.conf</div>
<div>Please set FILES such that these items are packaged. Alternatively if =
they are unneeded, avoid installing them or delete them within do_install.<=
/div>
<div>libvirt: 1 installed and not shipped files. [installed-vs-shipped]</di=
v>
<div>ERROR: mc:x86-2020:libvirt-8.1.0-r0 do_package: Fatal QA errors were f=
ound, failing task.</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#7146): <a href=3D"https://lists.yoctoproject.org/g/meta=
-virtualization/message/7146" rel=3D"noreferrer" target=3D"_blank">https://=
lists.yoctoproject.org/g/meta-virtualization/message/7146</a><br>
Mute This Topic: <a href=3D"https://lists.yoctoproject.org/mt/90385357/1050=
810" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/mt=
/90385357/1050810</a><br>
Group Owner: <a href=3D"mailto:meta-virtualization%2Bowner@lists.yoctoproje=
ct.org" target=3D"_blank">meta-virtualization+owner@lists.yoctoproject.org<=
/a><br>
Unsubscribe: <a href=3D"https://lists.yoctoproject.org/g/meta-virtualizatio=
n/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.or=
g/g/meta-virtualization/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.c=
om" target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature">- Thou shalt not follow the NULL pointer, for ch=
aos and madness await thee at its end<br>- &quot;Use the force Harry&quot; =
- Gandalf, Star Trek II<br><br></div></div>

--000000000000a90ccc05dc604bd3--

