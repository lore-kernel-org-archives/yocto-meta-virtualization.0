Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFD0C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 13:34:42 +0000 (UTC)
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web09.6285.1642599281214097428
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:34:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qdAxGdKo;
 spf=pass (domain: gmail.com, ip: 209.85.208.49,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id p12so11514257edq.9
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Jan 2022 05:34:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mq4JC606hy6jiuryUG4tS/MdXNJ12f+x6Qcqnau1+Jw=;
        b=qdAxGdKoOVWoP8ml5GzDSmkPAYgXoiv7KwD3SYbmnaw5TdlQM0jVxQ+PIjw9KCLNDh
         3Y1zOeRl740DYMIzq6+u6pXJ+yqsbCf9aclbpgsY4X3ADF0YjXzwFRcjU/qbYGRmyv+1
         +je4f0hy37ykDtgl6M1idsJ+HizlmqgSOP5tUEph2DcJjA0uu7FmFHzU+GyurUbLLX0V
         stL5lpp5vlslCcdjwlldDT2VOlW8mO5VY0chGLHQunaksJ74vXgB8Nyu43p6UsxPbMJp
         /Re/e57VWLpcJpLz/mPoZlW+yEeT/BCXfikejK/pJnnxhf03/yJmbVTDoVYGxTzjnCpk
         b+Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mq4JC606hy6jiuryUG4tS/MdXNJ12f+x6Qcqnau1+Jw=;
        b=OD12OkYnpOZimn7MUy+fFxW+ZWBl2H/G9BX0MkB1CDdDRteddYugqSkUieR8JZ/SCh
         VpZfx1B0n9uqzyBs9crfuim1VYCybRh3PsaMVb5OZ7WXdi5ODqYdsLtPWJZf2OZZz4tH
         V/VRE2Km0KqtX8le+YkzqcaoDvOdKgq1MhsXPy1IP1QIs/Zzf6mRQFtDfrgEJhr/8W8s
         r6q+kwapVbqm6po8eSSdhgb1YEf38UT/Nw3tQ25fbFYQx8HUYjMTQ6jGPcafe1fG6Dar
         SwiGejCC7NsWinjHoKumtjyQd3gz7gLx4lvEC6sOwFWa5LNYeIT590FdAezs6goGCd4F
         dF6g==
X-Gm-Message-State: AOAM532H06jElx56o5DQfFFC1Gipdj6+8y11YyA65stXAWzWeJAuOU9I
	WlVPLiym6mmOtGgKd9XrhS+kEnKPVck8rRVcQGo=
X-Google-Smtp-Source: 
 ABdhPJzn2btwi4VFaysljZD7EVveH8RJVK/3nrkS6jR4CRLReCU28UfH+62deaedivaJPUg/tGZsOaU17UoojlUb/Gc=
X-Received: by 2002:a17:907:7da1:: with SMTP id
 oz33mr16031487ejc.532.1642599279493;
 Wed, 19 Jan 2022 05:34:39 -0800 (PST)
MIME-Version: 1.0
References: <20220119115956.1104692-1-liezhi.yang@windriver.com>
In-Reply-To: <20220119115956.1104692-1-liezhi.yang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Jan 2022 08:34:28 -0500
Message-ID: 
 <CADkTA4M3L97amNq62TyRGUnkSn7LDHzJkL2vz4cDJxW+AtBtUQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] docker: Add kernel-module-xt-nat to
 RRECOMMENDS
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Jan 2022 13:34:42 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7027

On Wed, Jan 19, 2022 at 7:00 AM Robert Yang <liezhi.yang@windriver.com> wrote:
>
> Fixed when kernel-module-xt-nat is not installed:
> $ docker run --rm -it -p 80:80 alpine
>
> docker: Error response from daemon: driver failed programming external connectivity on endpoint elated_cori
> Try `iptables -h' or 'iptables --help' for more information.
>  (exit status 2)).
>

There's already a pending patch for similar changes, I'm still
working through the unification of the meta-virt fragments and the
kernel-cache fragments, so I'm not doing any of the RRECOMMENDS
changes at the moment, until I have that unified.

Since we can recommend all we want, but it can't fix a bad
configuration, and that's the issue.

Bruce

> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
> ---
>  recipes-containers/docker/docker.inc | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/docker/docker.inc
> index 40a3642c..e7bdc388 100644
> --- a/recipes-containers/docker/docker.inc
> +++ b/recipes-containers/docker/docker.inc
> @@ -29,7 +29,13 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare iptables \
>                   "
>  RDEPENDS:${PN} += "virtual-containerd virtual-runc"
>
> -RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat kernel-module-nf-conntrack-netlink kernel-module-xt-addrtype kernel-module-xt-masquerade"
> +RRECOMMENDS:${PN} = "kernel-module-dm-thin-pool \
> +    kernel-module-nf-nat \
> +    kernel-module-nf-conntrack-netlink \
> +    kernel-module-xt-addrtype \
> +    kernel-module-xt-masquerade \
> +    kernel-module-xt-nat \
> +    "
>
>  PROVIDES += "virtual/docker"
>
> --
> 2.17.1
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

