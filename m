Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B70EBC43334
	for <webhook@archiver.kernel.org>; Mon, 11 Jul 2022 13:26:20 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web08.28617.1657545974868994052
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:26:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Qt5iV2dj;
 spf=pass (domain: gmail.com, ip: 209.85.210.176,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id w185so4769796pfb.4
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 11 Jul 2022 06:26:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8j+6hFtMjDxAh5D0E6kIUxXah0D4LOAdy4PLTWVj6/M=;
        b=Qt5iV2djO5qpa+YRn0L9U8G6fqZqPWVLUU/hALgDaWCbHZMQ/X5CZLDC29vkncMf4L
         tEkdw8JUsmN5G5BAlGd8ixPH3VACWRUqwkDBi8sw9ZQjCmwhnV12kc/IJOYasEtpRN2v
         Pe+jLYn71nK9bxw1vH4vhIb1qhcvJ6IP88HFXBO6L4t8e+JjlLAWiSlDBYZb6x3hFTQk
         vrQQW+B7EZuYfiH/qY5oDYJpR5EnEePzQBy+wzcn0G8H5yo4bJHU8E0Y8Q/pifyvLY0l
         vBWYiQ2LP4vUtdL7572KCFMjT502I7QiXdYnvJbl+04YF4JGv1leuInkzceiIh/goexd
         YR0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8j+6hFtMjDxAh5D0E6kIUxXah0D4LOAdy4PLTWVj6/M=;
        b=OH3U6yxXaLPuNlJbO30vs5r18XCiOQFEs2rff+DDPud5+gDRfXHod8kcjjKs71QvdM
         3DsIKCdvKh8rsVQU5pxzjADKUatp308EjmwKVguDUkGHRGVGtTd4kWZSGKT8PbGKFV51
         72uYaPPdeB1LUteG9I3Kot1/RwNa1zEym5eeNQfyEgK2sI4Xe/wJBql1Ce7xER3PQ0oV
         j4KctHaOy8nf4dALbpOcZacY75VCyp8X9ikWJudqkuzpZxZwTgeGJNQhBW/dEnjjsTKT
         hnA57wWLXCzomjQt5KQVHKm0JgWGPjIxe/ZHeBEvAXLtTcEVyb695in0VoBwp9cveo4S
         N/mg==
X-Gm-Message-State: AJIora83KpCIMcKTLDNuRaybj6ZaD0HYxWEjh1kurAOov1jJ8rlePdU2
	IpUSabohIW1hjKAJWs+RTdjuWKEBuoxi41xSnhw=
X-Google-Smtp-Source: 
 AGRyM1s1B79LVaFtEmQnw+RPtdGE5vool8GLztLh3Rbn+n5PPXiMMJpNuC/mfPi4DqyCmyvwxw3u8FEPMQhYNLY8lLg=
X-Received: by 2002:a63:dd43:0:b0:416:8be5:94d6 with SMTP id
 g3-20020a63dd43000000b004168be594d6mr737491pgj.450.1657545973810; Mon, 11 Jul
 2022 06:26:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220711130022.3264142-1-andrei@gherzan.com>
In-Reply-To: <20220711130022.3264142-1-andrei@gherzan.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 11 Jul 2022 09:26:00 -0400
Message-ID: 
 <CADkTA4MZOuSQYfyPZYt_pVH_aa2xzQfj=sRjw7yxBCi_0GiBAw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 1/3] slirp4netns: Require tun kernel
 module
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 11 Jul 2022 13:26:20 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7427

On Mon, Jul 11, 2022 at 9:00 AM Andrei Gherzan <andrei@gherzan.com> wrote:
>
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> slirp4netns uses a TAP device to connect to the internet in an
> unprivileged way. Without the required kernel support (TAP/TUN),
> slirp4netns will fail at runtime.
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-networking/slirp4netns/slirp4netns_git.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-networking/slirp4netns/slirp4netns_git.bb b/recipes-networking/slirp4netns/slirp4netns_git.bb
> index a63871c..4bf25b8 100644
> --- a/recipes-networking/slirp4netns/slirp4netns_git.bb
> +++ b/recipes-networking/slirp4netns/slirp4netns_git.bb
> @@ -18,4 +18,6 @@ DEPENDS = "glib-2.0 libcap libseccomp libslirp"
>
>  S = "${WORKDIR}/git"
>
> +RDEPENDS:${PN} += "kernel-module-tun"

This needs to be a RRECOMMENDS, since we can suggest, but not enforce
a specific configuration.

Bruce

> +
>  inherit autotools pkgconfig
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7421): https://lists.yoctoproject.org/g/meta-virtualization/message/7421
> Mute This Topic: https://lists.yoctoproject.org/mt/92309173/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

