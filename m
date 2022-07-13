Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B7BBC43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 20:37:04 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
 [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web08.2288.1657744614270654329
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 13:36:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=THetA4Y6;
 spf=pass (domain: gmail.com, ip: 209.85.216.48,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso35441pjh.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 13:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=oiWgy8E97fZMpv4IWTLeqkuAOuqMdQ8BBFUu8BfKRT0=;
        b=THetA4Y6HbVFOdxA7JJxdKxteaObVO3u26+R2rnrjsfGybOf/DgqnAV3bCcLwUUSjz
         dY+5tAWJNhm4YpmxWw3wBCnncDbc+UEBXL8WhlkedETg80jjuOMbxLPWmhxxJqdGqVjI
         hmIC75U+5wX27sY9a+1T1blB13kOrs1mV11u1ZrtlX5f6OnQnuq9AuK3WwwvZ4XE0drV
         DQXvIUJJ+J10msKCgm+NS3oNVL9kk2mr0y3vxJfHNfVjVsM0UjhuRui0HDv1mg1g5FLh
         r9p5OVQLMB3+soa+dyzHIMkjtTBhEz+dw5JN3Lqne2xVjvUP1u12ZJxuG59FQ9WSBk9r
         ggsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=oiWgy8E97fZMpv4IWTLeqkuAOuqMdQ8BBFUu8BfKRT0=;
        b=1TU5gNNSpRrcwVfG4LIRkr417G3r7fQtSnu6lO6vctcHCmgE1ReQ/dDgWcmhaxSO3p
         yMieVXw2Ez1ccYJuRiYRwruceW0tZ4b9d+dvfsoxsYSaqQvaROaBdVG5fiqheKuIvUui
         /OEtvWqiE4kqhxq+Am/Uzyj53LTlfF8C60EFvqvbJcBvMXYm/y6q3qudYg5CciZqjEOU
         X1JpEnZSD+CyneIHXmdCZOOlpHaab0zZV8LCqoHzFnROzXXyewSrXoqP0bgEfJGmVdDV
         DNbJBKtgWARixaGivbcKDIXfkiLsr1qHTZQE+Hp5R6fQl5P0ObSUOSDeTfcAMC3+mpzW
         0YoQ==
X-Gm-Message-State: AJIora9BsgVq9QIjbVqYa5Y7luiqOm4oPQjq1PClGG6adAPP8uNLdnEu
	x+Ht8LUwjvLXlO7w/HesVf3j0dx8YzTrNLuBXwZ/fyjUecg=
X-Google-Smtp-Source: 
 AGRyM1vO+FNUc2TT1/uESt9aOQ77tbi7IkWrupttLDgSI1cJ0g5GCQGUBHuA/tfGnCwDgaERt10fwgDys2ptz9yfN1w=
X-Received: by 2002:a17:90b:3e84:b0:1f0:3f92:8c91 with SMTP id
 rj4-20020a17090b3e8400b001f03f928c91mr12383395pjb.112.1657744613699; Wed, 13
 Jul 2022 13:36:53 -0700 (PDT)
MIME-Version: 1.0
References: 
 <CADkTA4PZ6rMBUAF1Q23C6ov9OzjByCjvDQ+dMMxumyJL2fzaUg@mail.gmail.com>
 <12926.1657696750463147139@lists.yoctoproject.org>
In-Reply-To: <12926.1657696750463147139@lists.yoctoproject.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Jul 2022 16:36:41 -0400
Message-ID: 
 <CADkTA4NzkovYyu_b-pJCFjoKwpCb+q-mQKkRZVQ7mkkxsf389g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/3] image-oci-umoci: skip parent
 directory in tar
To: Vasileios Anagnostopoulos <vasileios.anagnostopoulos@siemens.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 20:37:04 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7460

On Wed, Jul 13, 2022 at 3:19 AM Vasileios Anagnostopoulos
<vasileios.anagnostopoulos@siemens.com> wrote:
>
> Hello Bruce,
>
> How do you generate the images and import them? Could you describe a bit =
more the use case?
>
> With podman for example you can load the image by using `podman load -i b=
uild-oci/tmp/deploy/images/capricorn-64/name-of-the-image-capricorn-64-2022=
0713063601.rootfs.tar`
>
> Usually, the tools that support the oci image format also support the oci=
-archive image format. An exception is docker that does not support the oci=
 image format and I have first to transform it using skopeo.
>
> What is the advantage of first un-taring the image and then doing the imp=
ort?
>

There's no advantage, it's just the support for the OCI image format
when I added it, was around the oci image, not the oci-archive, and it
was designed around oci-image-tools, runc, and directly executing /
manipulating the images. The tgz version was something I added after,
to make it easier to copy them around, stage them, and otherwise
collect artifacts.  docker, podman or any other specific runtime
wasn't the target.

skopeo was from the beginning the tool that was used to copy/import
the images, and that was with the oci: type .. not with the tarballs
.. in those flows as well.

I'm just pondering the right way to not break existing layouts and
flows, and that will take me a bit longer.

> Probably the other 2 patches that I send it with this one (https://lists.=
yoctoproject.org/g/meta-virtualization/message/7442, https://lists.yoctopro=
ject.org/g/meta-virtualization/message/7441) are still relevant, because th=
ey are fixing other minor issues.
>

Yep, I still have those tagged in my "to-review" and "to-test" queues.

Cheers,

Bruce

>
>
> Vasileios
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7451): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/7451
> Mute This Topic: https://lists.yoctoproject.org/mt/92331697/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

