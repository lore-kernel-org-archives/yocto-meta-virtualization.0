Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4FAEC433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:26:58 +0000 (UTC)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com
 [209.85.128.182])
 by mx.groups.io with SMTP id smtpd.web10.56.1651674413811815407
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:26:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h6rkxY5l;
 spf=pass (domain: gmail.com, ip: 209.85.128.182,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yw1-f182.google.com with SMTP id
 00721157ae682-2f7ca2ce255so17140767b3.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 May 2022 07:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iQzLIlnWYwbUUWmbEP5lwlLsiMT+nDrCOkulv4WEk2U=;
        b=h6rkxY5lvRvwjPgh4Kox0JU2m0db0Hz7/e9URE7WFtFyS4iggsyU1D2z6NYAQwruG6
         exA+mk+tOuwRJlVr3cX5qbdiCcGhiHmqjQQshxIRE9tGJYmFXd/ozVVb5C/VKza+ILj1
         wX0PY7GbzVsUGCM+HkaXn1/a/QkOSnYRw/jH3zYiomOS/6wtjbrn2PT47Ts9GarNnMxG
         /rlHWqbpy9mHfLq4EwTGI0/OEU4Xwwl5Fq+9AuW21kLhLZ4vo3fhSO3aIRW39UXxkzwk
         RHywNkdu3juetcZCMhFklgHHEKVQbXQZskyt6iJ0SlLk08Zb+RHYNiMNAqjcN71ejMdK
         amrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQzLIlnWYwbUUWmbEP5lwlLsiMT+nDrCOkulv4WEk2U=;
        b=g3OBizLRTuDfBoh62VHnlp+F9JyjT7F1dXLsTu9YMp0B8MU3r+jODfWsqoPjeIPAok
         o3p0oQQuB4nWoZRTPO/6R3xekI/KFDo0yaxzCWORCzVsjScnUuCkI8WDP9Ae1IoAe3X3
         iZTIcXEVD/ceoyk4l4ic2kefWH0Jcw+uFL/M7Qs9IJIxd6Ki8AZ/8nn1wh1UACIveBzT
         sX99+vFekF/CCjwQAtZCJl32TSEbd1QtyP3yanWMymnb8xUB//2USK7F2rEeT7rDSl3r
         JT2p6lfSoNp/28X2izunid0yMFYD3l9rnWAxSc0+I3j5spyYBe4y2byiH9EkuuhyrnDO
         JPrw==
X-Gm-Message-State: AOAM532qMjZa2uYYBenVW2LA2Vk6g/TDZQqDNYm0fyUC0zMsB5VfejFe
	/E3OH53lc7OG2f/NTvx+B0z0qUlkiLQKxp9WFAfrmS/wqRo=
X-Google-Smtp-Source: 
 ABdhPJwWyfIV7rJzpXMBjPoFLvdzOZTE5N+oDGPOcl209M/8iIUOE8oIMJkox3QZIJCyc6qaKxlIA8vPW+DPxNvFKdw=
X-Received: by 2002:a81:1414:0:b0:2f7:d855:1568 with SMTP id
 20-20020a811414000000b002f7d8551568mr19947921ywu.323.1651674412825; Wed, 04
 May 2022 07:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220504140917.623536-1-richard.neill@arm.com>
In-Reply-To: <20220504140917.623536-1-richard.neill@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 May 2022 10:26:41 -0400
Message-ID: 
 <CADkTA4MRs3UWyZYOAEcSuSsnDfuyL+38e_OJOi8W-898jCUxxg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] docker: Add runtime provide for
 virtual-docker
To: Richard Neill <richard.neill@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 May 2022 14:26:58 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7243

On Wed, May 4, 2022 at 10:09 AM Richard Neill <richard.neill@arm.com> wrote:
>
> This patch enables successful runtime-dependency on the Docker preferred
> provider, as virtual/docker does not resolve. Doing so aligns with other virtual
> package providers (e.g. virtual-runc), and follows the Yocto Project
> documentation
> (https://docs.yoctoproject.org/singleindex.html#virtual-runtime-provides).

We don't have a virtual-docker rprovides by design. Since there are differences
(historically) between docker-ce and docker-moby.

Your package lists and images should be referring to the one they want, not
virtual-docker as a rdepends.

Bruce

>
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> ---
>  recipes-containers/docker/docker.inc | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 40a3642..e196f9b 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -32,6 +32,7 @@ RDEPENDS:${PN} += "virtual-containerd virtual-runc"
>  RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
>
>  PROVIDES += "virtual/docker"
> +RPROVIDES:${PN} += "virtual-docker"
>
>  # we want all the docker variant recpes to be installable via "docker"
>  PACKAGE_NAME = "docker"
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7241): https://lists.yoctoproject.org/g/meta-virtualization/message/7241
> Mute This Topic: https://lists.yoctoproject.org/mt/90888043/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

