Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA56FD0621
	for <webhook@archiver.kernel.org>; Wed, 11 Mar 2026 06:21:56 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14435.1773210113181206888
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Mar 2026 23:21:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dyUbfu//;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: martin.jansa@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a43f1f978so38625981fa.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Mar 2026 23:21:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773210111; cv=none;
        d=google.com; s=arc-20240605;
        b=V2UePNLenBUOpAKgywWXmzXJM1DDndiwW5X0+wLW7m2RMBGP2swPircYnJ8Lj7DIFg
         fq5OUwtz/ztrmTOTOIK2Q4lf1qwCMubQ+wmeTght/NNKEHhj+UFPZno7PDuVYRhfhzxi
         tLZf0mmCRKsOYHqDWNrRwcgeFjr/qiJeook7uaS3ciuaDPzvzXFnbviLiC4r99ozggjD
         bjRNYusqLXBw3/SUvgv462YhPXnVfVGSi37SNGTX9FMGb3XH5f/FpsE67PxUbxIUavcW
         2G1TYNIxq5AP3zXlc+Acb8XuhB0S+2ocFTabz2PJoSCxK5D1RtXdc6Ua/VObL3yVCSa8
         yjAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EDdomW4PQd4EdFQrnm2whkLnZBrdy1bFF9Whl2psKkg=;
        fh=eCwnOjlv6B8KHYbz1+dR8q8uprCZzyTQ1RaTi1tuuHw=;
        b=OGFlqarSXD7r9teix/7kr17k81x8z+8CNgkFOkaQxD3Vm1RgmF03aW/OIBk5qfQGjj
         BIpzPeOgpLVrAhKQghRgTLhRs46QjV5ReDJddDPWjcdK90NhuitZarckVhYSBV3hIV3l
         R2ykO+frlSDaBBFjfV1bMQWDR6qUH1s8FXeQ51ac+cfHr07yXHlYDUrlcRiS6hnoYQ9V
         YOb3qV1amUMvn6QWgVhJVmHh6CdPefY2TOZ9LOdpv0cl4XkyB1yBEr0uJr6t2LG9Y/aC
         qcqAZ+SG7nHLE+TX8SCEkUnFexTg2IxmXnZre+MkIvpi+VkSWYo7qTmQWAWYLGceCIkE
         rMbA==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773210111; x=1773814911; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDdomW4PQd4EdFQrnm2whkLnZBrdy1bFF9Whl2psKkg=;
        b=dyUbfu//ykLzrWpQJM6QpgNTqauJ2/4t67cNgXWh8eYX3OOGqkvIOO1ef1ABJtEw+3
         xWucxx1tofxbaPDyfjI2vlf7mLRhPNEo/fHOK+uAA1aGCzdxzZJdUwOUgBAJiI+Y/9nw
         znn5xDaLMpNPNMmkDU2oGDGDByXjCQvip6dKHjbOJ0KNBT/tdtA7oKet8ysqVKfIRCr1
         zocpqpO1NP+8lPb429ksMgNxcO4YFA0H1BfFuQL/0YX5hfYoc01v9H513nMTiYCnsFgN
         VqCqbcAMrlHzuAZUlRtlx5kLNvpglJPgJ05Pp887CLZICR8GOI/KwwuJo215kTxBqgXb
         Wj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773210111; x=1773814911;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EDdomW4PQd4EdFQrnm2whkLnZBrdy1bFF9Whl2psKkg=;
        b=ummvnBRZga3pm9fsrwCRv8hr4YT8d5n40cFfzC+TOOsjCD4OrTMklVLK5DWyapGgzU
         KMDvQptew2cqJfu5aJaI9ju7xLdIaWwvu2h+99Wv1yFOIVPk8amHIQGb6KHQtI8EYmrf
         iqI5UpoccRoNN9QP8PPEBVelD1kYwX62Pc6ZCm46ApOafdhAIvmKvct12EKtIPV3lFMm
         VgnOKjaOfYq8hun7w/CCd0f4n866/6eYcxIipjL0IZxIdrHHFXJtNu0XxksS+Da8n88J
         ULBApdU3gdJGPoWYEmw0RAk6aLW9oI6keDKzsHncodAIFUkJVv2CDowyaNnfK2p/x4is
         EZUg==
X-Gm-Message-State: AOJu0YxQ4Ea35m2AL9pKOs+mswvY9VeRbqKY6tne2MZv+ipSjlW3lE5M
	KKzBuTXOyPnUSLXieRHn80L5KXXwLiXBoVSem8LT6LASFHodCoQQMrDYnGrYy8FhHp/kk8atwM8
	hRqT8eKf1ungqJAMPAUqfRMvfF3Prqjg=
X-Gm-Gg: ATEYQzxIhX3To43qcm7YGguncSbztWlsWxHPyzTS+lofeN3icsBLAvKXeIi5maZwS4c
	Q+Z1SgKlINxaCd14xXblcoOlf6iEPxiO9gTZzccKSmpvm4yPNCPY120fG501a7YT0223lYzuuk6
	ZWcQEj0waR/mgBNJppkhNO6WiLuZPUbXuSRh5sLCo8YlX9CJMAz1sWsiRUYIEkEa2ODwk9VbBKl
	S5StG1zM5pdy7YhcNFLIAU4z67FfVEiCeS2QnCzbMwHgGeTFFvYAYGHi1nZtx5Vp8XD7WP+UX0x
	2N6QOQDEYQ==
X-Received: by 2002:a2e:be1b:0:b0:38a:3208:8cc4 with SMTP id
 38308e7fff4ca-38a67e54516mr6157021fa.25.1773210110675; Tue, 10 Mar 2026
 23:21:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260310135815.3353144-1-martin.jansa@gmail.com> <abCdV-WOM6O4DYfk@gmail.com>
In-Reply-To: <abCdV-WOM6O4DYfk@gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 11 Mar 2026 07:21:37 +0100
X-Gm-Features: AaiRm530gOUlmZRP6oBwdkggZSlG_CUh5koSEWWk9t0UO7J3i4ZOU9YI9RWd35k
Message-ID: <CA+chaQf7Uv8NbP9hzeieTaQ_h+ZPiLMBfQvJugR6g+77Oj4A_A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to
 dynamic layer for meta-webserver
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 11 Mar 2026 06:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9647

On Tue, Mar 10, 2026 at 11:38=E2=80=AFPM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> In message: [meta-virtualization] [PATCH 1/2] cockpit-machines: move to d=
ynamic layer for meta-webserver
> on 10/03/2026 Martin Jansa via lists.yoctoproject.org wrote:
>
> > From: Martin Jansa <martin.jansa@gmail.com>
> >
> > it depends on cockpit recipe from there, fixes:
> > ERROR: Nothing PROVIDES 'cockpit' (but meta-virtualization/recipes-exte=
nded/cockpit-machines/cockpit-machines_346.bb DEPENDS on or otherwise requi=
res it)
> > in bitbake world builds
>
> I guess alternatively, could a skiprecipe be raised if webserver
> isn't in the collections ?

That would work as well, but dynamic layers looked better to me, your call.

> Or meta-weberver becomes a dependency (which I do not want).

It's also already listed in LAYERRECOMMENDS_virtualization-layer which
seems enough for this optional recipe (I don't even know what cockpit
recipe is, I've seen it for first time in the error message :)).

Cheers,

