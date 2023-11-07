Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EAB7C4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 13:10:24 +0000 (UTC)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
 by mx.groups.io with SMTP id smtpd.web10.10178.1699362620723393585
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 07 Nov 2023 05:10:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VOr94Qdp;
 spf=pass (domain: gmail.com, ip: 209.85.166.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f44.google.com with SMTP id ca18e2360f4ac-7a93df91813so206583939f.2
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 05:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699362620; x=1699967420; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NmwVvectWhVJKPE1hFHwreV+UKHL4F+0UhJaMEcg2XY=;
        b=VOr94Qdpq213tig09BRIc5nfZ90GJm4VHsZp+TXnN+d4zGS/6cwlCR+JasYpNp262c
         6NLXOaJvvjb8Pv461bXzwxpY5QqPvYNe0zw3AmnpwlHqGSrsKWxApwuUagPMr9cVu/b1
         LV3sXRIQtXeKlow/524brcP2xhfmuI10pmTjz0hcsZWNk9yyLgU7MwTG2Puk4YW2yB1b
         yIWVtt8AkKs1pWLzmlY/RclZfdNA+sUy0A51AQqrBKuK7TUBGyIczMI0ehjghBz70V5B
         zL0qC9HnLpFYzlge5QQbMjN4x9wJ4cOg8aJv9oLrJfROjCZompp1L+dbEzES4Sgvn7AV
         GPLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699362620; x=1699967420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NmwVvectWhVJKPE1hFHwreV+UKHL4F+0UhJaMEcg2XY=;
        b=EwwfTbKlevZzZWxDRT+lPUAwAJ7v8pi7V1KvHC5z88lEb76ApwEjvcjTVLmgj6ozMc
         +ZqE3byk1JfGShNvECyVm3hEQnuKv8hvMGVs379RnxbpRbYqdGmOKrBtPkT5aPhdrHjW
         emmV81IXPGNSvOva8N3EG8sGN9wdirefXq5jkBLpzQoDJCwH8+DnHET87W4bCcfRHzxX
         KgBu15GR5i+1UpDpUh25ai3Nz2k2NbZBUQPKcD0DNzuI8qkw2oFqv6keyaJ8C1Xa2Aki
         dGvO62De2A/SIgtCMNHTGzXZPhAfWLdzBHRw8QroAi7C/+peax60rrsVtx+KXcvWGA78
         ln2w==
X-Gm-Message-State: AOJu0YxC9Pr+nLlf3WwMYjtbDfWJdXcOl4hTdJQx0gjXwgJZdscgHM7g
	tvWS75Txuz32SgZegvfGYHgKY+FB4LmgBEVUkt0=
X-Google-Smtp-Source: AGHT+IFOX8FkYTc9cjK+Ok2h2gOgDfhDHaRe5dPRRRxVJaeWD8KzcspMk1fA8POwIO4OBun20jLpD3eq0gofS3gLjhE=
X-Received: by 2002:a05:6602:1506:b0:7a9:945f:e46 with SMTP id
 g6-20020a056602150600b007a9945f0e46mr43003349iow.13.1699362619939; Tue, 07
 Nov 2023 05:10:19 -0800 (PST)
MIME-Version: 1.0
References: <179550144DFF7F38.20624@lists.yoctoproject.org> <B11R3S.54HAT2F7D7MQ1@t-online.de>
In-Reply-To: <B11R3S.54HAT2F7D7MQ1@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 7 Nov 2023 08:10:08 -0500
Message-ID: <CADkTA4PPsEbS5Nz7Y-YGN2G24R2LF8+K=_nA+dxxpkqVCSPiKw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] libvirt-glib: add
 VALA_MESON_ENABLE_FLAG and VALA_MESON_DISABLE_FLAG
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 13:10:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8439

I had just read the OE-core thread after seeing this, and assumed that
it is dependent on your other change.

I won't actively notice when that change merges to oe-core, so you'll
need to bump the RFC to let me know it is safe to merge.

I don't have any issues with the patch.

Bruce

On Tue, Nov 7, 2023 at 8:05=E2=80=AFAM Markus Volk <f_l_k@t-online.de> wrot=
e:
>
> This patch is RFC. I missed to mark it like this, sorry
>
> On Tue, Nov 7 2023 at 11:21:29 AM +01:00:00, Markus Volk <f_l_k@t-online.=
de> wrote:
>
> According to changes in vala.bbclass we need to add them Signed-off-by: M=
arkus Volk <f_l_k@t-online.de> --- recipes-extended/libvirt/libvirt-glib_4.=
0.0.bb | 2 ++ 1 file changed, 2 insertions(+) diff --git a/recipes-extended=
/libvirt/libvirt-glib_4.0.0.bb b/recipes-extended/libvirt/libvirt-glib_4.0.=
0.bb index 7ca65a95..22b02d42 100644 --- a/recipes-extended/libvirt/libvirt=
-glib_4.0.0.bb +++ b/recipes-extended/libvirt/libvirt-glib_4.0.0.bb @@ -19,=
3 +19,5 @@ GIR_MESON_ENABLE_FLAG =3D 'enabled' GIR_MESON_DISABLE_FLAG =3D '=
disabled' GTKDOC_MESON_ENABLE_FLAG =3D 'enabled' GTKDOC_MESON_DISABLE_FLAG =
=3D 'disabled' +VALA_MESON_ENABLE_FLAG =3D 'enabled' +VALA_MESON_DISABLE_FL=
AG =3D 'disabled'
> --
> 2.42.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8438): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8438
> Mute This Topic: https://lists.yoctoproject.org/mt/102440144/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

