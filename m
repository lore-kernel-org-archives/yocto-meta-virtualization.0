Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 078AAC7EE24
	for <webhook@archiver.kernel.org>; Tue,  6 Jun 2023 12:28:21 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web10.7380.1686054493604409662
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 06 Jun 2023 05:28:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=IJK3bEsi;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-777b46516ddso97371339f.1
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 05:28:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686054493; x=1688646493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd/AUllL1fQ1sFDZgYgIwxXxD9Py5q+9w7SZ2MotziY=;
        b=IJK3bEsiREMES8SuQkKSStrM8veK3EEnGG9hPbDlmovJqDkg6nkOInJCmBrGUMIpar
         da7UYcjlwAI0mKgVDS6hJ/VVZtZ6ISbKvt9xQTz+283kA09qPQNIX1LIzOlQzlRnU4P9
         sTXECUeM5jPPN65APY64iOzRVnLycn0MSqZd9CS8f6tRlo0hNfYL1X97pMu20dHOJ+gz
         gstz9xv5z+5Grcir+2pFVUYxMJQZagLoBJkXUTEeW1e5J8t7/4lJWSWanel2NbQglGTb
         1bn8BxsAAuFd3P5Ps2gQXpN8gRbqdyxcYavJYKzRy1BGRt2rpJfTskCmgvmMDwSZUAge
         v6JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686054493; x=1688646493;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Cd/AUllL1fQ1sFDZgYgIwxXxD9Py5q+9w7SZ2MotziY=;
        b=CZOkLZtBfJUkEIEcq4V7hmGCeMUrjRek4SugDBjM1IQQCRZcvfP0BIs7YWqH4mrdT8
         MTtehzsIaqc7S7oWNEGcHL0QIUfU5z2YXAfxygCafG+UUfLg5AqGKpVSKp8uBZrWEnfc
         rFqgBUNYqmjiVFuL/tgq65Q2S1wEe0/X6DZJcflgljPRdu+VUi8jbFVLAXRkEhNq8BX0
         saNgb/IctxXx10t6/xhJ8OIs/dms+rDhEX9wUl1B+03TZtpFzhoeYykGOn/fv6wL6VpS
         03q9ThVu+RVCCejwl2adp2gstPkolrquBMGJdQvMzuq5vmpcs9yeDvcp+VhbTU5N+uB6
         c2Sw==
X-Gm-Message-State: AC+VfDzCi87e3la2ha/PH31IfOS0Q0RwqlbDCCpS0Y+DlcaolkIJ66ia
	0wxzCJYekDzXV5rCt4Jjb/0mVq1mnC7iL/yslXQSHSXU+Gw=
X-Google-Smtp-Source: ACHHUZ7H1AcvCw+rCXH1GFIvYL/e1vHlTyd/15cC4GsfaDZCJe3q/kZMYsWkjMotiz+P5H3Y9pYs9dWUk38BBoelWZM=
X-Received: by 2002:a5d:9544:0:b0:775:8241:724a with SMTP id
 a4-20020a5d9544000000b007758241724amr1928430ios.16.1686054492770; Tue, 06 Jun
 2023 05:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230606074311.2269186-1-Qi.Chen@windriver.com> <20230606074311.2269186-2-Qi.Chen@windriver.com>
In-Reply-To: <20230606074311.2269186-2-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 6 Jun 2023 08:28:03 -0400
Message-ID: <CADkTA4P9R6GLABgy-4K06qhF-191KLekW0PFS+28OUkVh=Rkow@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] layer.conf: use docker-moby as
 preferred provider
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 Jun 2023 12:28:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8094

I've been testing with a similar default change, it will be available short=
ly.

Thanks for the reminder!

Bruce

On Tue, Jun 6, 2023 at 3:43=E2=80=AFAM Chen Qi via lists.yoctoproject.org
<Qi.Chen=3Dwindriver.com@lists.yoctoproject.org> wrote:
>
> From: Chen Qi <Qi.Chen@windriver.com>
>
> docker-ce has been deprecated, so switch to docker-moby as
> the preferred provider.
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  conf/layer.conf | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index 88ac3905..9ff61f12 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -41,7 +41,7 @@ require conf/distro/include/virt_security_flags.inc
>
>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-opencontainers"
>  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-opencontainers"
> -PREFERRED_PROVIDER_virtual/docker ?=3D "docker-ce"
> +PREFERRED_PROVIDER_virtual/docker ?=3D "docker-moby"
>
>  # Sanity check for meta-virtualization layer.
>  # Setting SKIP_META_VIRT_SANITY_CHECK to "1" would skip the bbappend fil=
es check.
> --
> 2.40.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8090): https://lists.yoctoproject.org/g/meta-virtuali=
zation/message/8090
> Mute This Topic: https://lists.yoctoproject.org/mt/99358925/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [=
bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

