Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6B6EE645B
	for <webhook@archiver.kernel.org>; Fri, 15 Sep 2023 12:47:24 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com [209.85.166.50])
 by mx.groups.io with SMTP id smtpd.web11.19440.1694782038047124548
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Sep 2023 05:47:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=M00Fk+uY;
 spf=pass (domain: gmail.com, ip: 209.85.166.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f50.google.com with SMTP id ca18e2360f4ac-794d98181f0so67929539f.2
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 05:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1694782037; x=1695386837; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h6ycAuCEZ19Ba9LSEVu4R3TAg9ZXKPFT5/hIad8vAFM=;
        b=M00Fk+uYOAQPZpTGDqbB75+8yxKvL7wXIH2ikVgJyNLaLKzgtsHusjsAWMLQH+vBVD
         eA4y+ECdbtp+lbeG/sDgtbUs91mKpnjt20MkRdD3GzQLHD4eSqy/aCk53jzRjDgWxR88
         Bnnyyie/yFwJOfV1yjH1oXGoPQkxuRVOzpJcIS7BwEajQNHfSrXTHQg0xDBchc1NtQsI
         8CBFOD9+yIVhodbg7kxKdbXR5Q3MTprJDK9CuyZ44jygTM2jkY1h1gwb/zXN9Mf32sE5
         1z1qYuyz1zuEMSqJzGOPRotjnTlDmwkDu6yiNq5l8pQrCXQrZa+CAKrdYZWYdBOyokh7
         NhOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694782037; x=1695386837;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6ycAuCEZ19Ba9LSEVu4R3TAg9ZXKPFT5/hIad8vAFM=;
        b=P0DvlQfS91062xXH7x4QO1vQ5+olcTYDVXukVNJRhjoiHKpGP085sCogOogw+cAiDW
         /TbbVaHG5PJojG4IDMQiDEVapZkLwk5h1Nnuh1tYGeW4FeVHYEY/CYmIn7C5jf1cqBO2
         XgLnDQ3aysSXenxPQ55WDRotqppfVC3Cr7guhx1n2fWr60XacS2Xl7BzLmzll9EB6pEe
         RWuvoRZAlb8wpOqLSLSyukd8NFzvQFmTM9MKxQbYLsHW44qEj++SrZHiW15dfh1XHXhb
         RoQvkVbgX9tjuYgRYGU9P2Q1U0zvVRF1V58azpba6MFi+JRZml+bTXl7T0hxQ3vesMAC
         /kTg==
X-Gm-Message-State: AOJu0YzTGxe4FKp+OFxjMGHYvtlbiXgsGMcDVsdYIwWMr33fpIypI4nA
	jUk+SN15XPvI3PteGACR4gM921BvwwO2RN0bzK8=
X-Google-Smtp-Source: AGHT+IHVohVwK0fCWvsftQlDCxzrebRniXnpJNNZgHtlWnnn9OxbExA17TOTM+Lihl19qxW+6L8h6x40o+H4e2JvcMk=
X-Received: by 2002:a6b:fb0c:0:b0:792:7f26:dc95 with SMTP id
 h12-20020a6bfb0c000000b007927f26dc95mr1468396iog.14.1694782037214; Fri, 15
 Sep 2023 05:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230915084136.2685419-1-zboszor@gmail.com>
In-Reply-To: <20230915084136.2685419-1-zboszor@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 15 Sep 2023 08:47:05 -0400
Message-ID: <CADkTA4P5mz1tvm1g+FfqknjmzzJax=mLC7B=jTKvga52J1smNQ@mail.gmail.com>
Subject: Re: [PATCH] conf/layer.conf: Fix spelling of "mickledore"
To: =?UTF-8?B?Wm9sdMOhbiBCw7ZzesO2cm3DqW55aQ==?= <zboszor@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 15 Sep 2023 12:47:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8309

Ooops. I had already noticed that, but neglected to push the fix.

I'm actually going to just drop the dual support now, so I'll do a
different patch and push it shortly.

Bruce

On Fri, Sep 15, 2023 at 4:41=E2=80=AFAM Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9=
nyi <zboszor@gmail.com> wrote:
>
> Fixes: 76208ca8 ("conf: update compatibility to match oe-core")
> Signed-off-by: Zolt=C3=A1n B=C3=B6sz=C3=B6rm=C3=A9nyi <zboszor@gmail.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 189a86d4..ab5c7345 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -21,7 +21,7 @@ BBFILES_DYNAMIC +=3D " \
>  # This should only be incremented on significant changes that will
>  # cause compatibility issues with other layers
>  LAYERVERSION_virtualization-layer =3D "1"
> -LAYERSERIES_COMPAT_virtualization-layer =3D "mickeldore nanbield"
> +LAYERSERIES_COMPAT_virtualization-layer =3D "mickledore nanbield"
>  LAYERDEPENDS_virtualization-layer =3D " \
>      core \
>      openembedded-layer \
> --
> 2.41.0
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

