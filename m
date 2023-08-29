Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDE8DC83F12
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 01:49:56 +0000 (UTC)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com [209.85.219.169])
 by mx.groups.io with SMTP id smtpd.web10.8525.1693273788907092845
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 18:49:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=Ex5OcMSj;
 spf=pass (domain: gmail.com, ip: 209.85.219.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f169.google.com with SMTP id 3f1490d57ef6-d746ea563f9so3673431276.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 18:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693273788; x=1693878588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNT2dS4Px9QrlFUe4UJE1tjo380ctY0bwq57SVtyZ3M=;
        b=Ex5OcMSjiVMjmHJlQ8IEZWuL9q/bby6DBriZOBv0hjFv4MVwfJPLlTEgPA8NSWXoy0
         eTqGSX/BzSrQHMctPH+nyPM1HBX5OFkGmpjYOGhLWAWy4XTtUjr4mVkObdPoPD3EeT7U
         ie8iC/XXmAGYd0i0xvgjR67oigni6nAi3FHgYITOtdUxv3mKoe1m7PoV6dIzIMDplY9T
         5W6c0jKZgWpoEsOcrvSo+X62JHzn/5/05Lc2GshG3Afey+bw9lzgQ7QqVCkkPYtPBhBy
         9683WL0YgRiPML8swWFA/6gJJEzBsmPJLPuw0DuDao+9oQiy6h2yWUhlo/LPtSO5+M1T
         EW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693273788; x=1693878588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNT2dS4Px9QrlFUe4UJE1tjo380ctY0bwq57SVtyZ3M=;
        b=bnhSo6hJZKnwoyHw6Ox/Sn2qATc9zpOoDbIj0gIZETJA3FNoIr5bTQvV3zB2qB9oUs
         0cSPKytgI22o6yjJMQgm9V+Eaj7zDskCjy2T0gz9Fxow1ENK+fHJqbIKopKjJxTHOkF+
         zaRwFE535Lf2lngIFrwwBk2jrTpF6nrPGN/m77/c8CNK1jUocTLdyxsvY34UqQZaWx5B
         WVwl+A7uPRd4S8BxDOiBr22Y1pcnzXu59/qxESGEg5eOdt0IW1VghlJSyf+L4/xAWIPc
         5yB3EK4I91MvdjoaXZQV4g1tX4s0zkQXg9wA2uOj+RkG8MjOFWPGZnAVxIPAel9pgLBz
         sGHw==
X-Gm-Message-State: AOJu0YzjM71p/Jz3F5nj3gEFerq4c4fPE7Ji5SjjukIUei+lZ95B2K/G
	mrU3dHZkMextTrwAiRwkjRL7hmI5AYnK0jpffiw=
X-Google-Smtp-Source: AGHT+IGG8ZcOi5IwOPD3z1+/18OwTwTTKor3F26uFeL1FIG7a8d8jJb9jdw03aYmU9rBx5hdqdIaXDU1xgj6TrnQoRg=
X-Received: by 2002:a25:509:0:b0:d43:a84f:a6aa with SMTP id
 9-20020a250509000000b00d43a84fa6aamr27864186ybf.39.1693273788017; Mon, 28 Aug
 2023 18:49:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230824081002.6730-1-f_l_k@t-online.de> <ZOtP7s2ivBE4sp+A@gmail.com>
 <V7Y20S.DEMNSEGCSDXK3@t-online.de> <CADkTA4MpeKhmt=p2cfYu8GorSgQ-k5+ezVje41DfO5FV2Tf1Cg@mail.gmail.com>
 <A2440S.ZJJYBEG8TE2P3@t-online.de>
In-Reply-To: <A2440S.ZJJYBEG8TE2P3@t-online.de>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 28 Aug 2023 21:49:36 -0400
Message-ID: <CADkTA4P6AKA+OWWrxs6XxpoQDojC2jqFxcQD0hMqshikywqhfg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCHv2] libvirt: update from fuse2 to fuse3
To: Markus Volk <f_l_k@t-online.de>
Cc: meta-virtualization <meta-virtualization@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 01:49:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8252

On Mon, Aug 28, 2023 at 2:17=E2=80=AFPM Markus Volk <f_l_k@t-online.de> wro=
te:
>
> On Mon, Aug 28 2023 at 07:17:21 AM -03:00:00, Bruce Ashfield <bruce.ashfi=
eld@gmail.com> wrote:
>
> Did I miss a patch ? If so, feel free to point it out and I'll queue a bu=
ild test!
>
>
> I didn't want to rush. I have sent 2 patches and the second was to fix bu=
ild for introspection/vala for libvirt-glib. I sent it again and also pushe=
d it here on github.
>
> https://github.com/MarkusVolk/meta-virtualization/commit/ce5f953c09fadba1=
f6e0014106adb4b23beef747

Right. This is the patch that I was asking about how the documentation
was going to be used and packaged.

I didn't see a reply, did I miss that ?

Bruce

--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

