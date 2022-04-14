Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E529EC49EA5
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:54 +0000 (UTC)
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com
 [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.7553.1649906094938366850
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lpr8wsdB;
 spf=pass (domain: gmail.com, ip: 209.85.208.54,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id c6so4688972edn.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 20:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KCpj4vz9Mi/76HpvmswXE0jVJ1ZvqT7hThHKJypApvU=;
        b=lpr8wsdBy8Uf4WgZYr5q20mlbDkV/KXgHHsaW57u6l/OFlPpzb3N5v57jyp0SC9waE
         tdhEw7hrXg74PSxjiQM1NcYYLLqpZPctsW2vueHRwtgtFAiWlpyDhsXJvtXBuaJxHe5m
         DEExhPuzvIf6SBg+JV6csA847/WV6lBcgJNVZY5R4hZk3efWTfCTkn7PibQCYra0qP9a
         FLN8KdWn0bKWraRSgYf8D3hBNyQXYaKrKid7a9XGTAPz2DBky1N2Z8C0uA1ESsT1fcL8
         4ZCFKSUGiTS7fOCUHZm7v5bgRaBFW+0w9v2GZ3wQ8nHf7pSwpUMXe/ixy7jLivDd96Oa
         SD7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KCpj4vz9Mi/76HpvmswXE0jVJ1ZvqT7hThHKJypApvU=;
        b=ZyXujCmH4de/7c0p0JlQ4rEqe8QTELnN8dU6Cyqec6FDjMBZfRbSqbZ2w2VG7Iph8o
         Gmjq+/mDLc7/WSkHDyqvg65sRZBeNuTYtkLn3w5q3a51QUKb0YmCqRcN1AvNOo4SXqgX
         uYdT3aZgbStUQtxDPxyqb/O/2YqtwV+xg8H3CdUeijteH0GLuCuRttTExWtX4006KUGK
         U1TdyN81b/IQmbfnZMlSVk9FpQF86WvU8h7zDyjaCz8xGKMfXj8Zktuw3HYm0NlEk7DI
         nyuMSmm9wyu4zxZKcaMWvNEHaKLmWB2b7Ity0qpJNmIoQKjLXfT3DwyZ+qdSr1YnQDb+
         /2NA==
X-Gm-Message-State: AOAM532Rbak8xznsMxGmPdNRVkPNce7q9CIyrtfHcTYBTm4rZdzSOfwo
	1tAyyWiObOQG4FwCtpXqdVsk0qRiqaLb25oEruU=
X-Google-Smtp-Source: 
 ABdhPJxAEauD8DsRDIJNpv1wEkCUNxHEDj0ZwIeYcwqTRmcp1YgUYqV3DSn0REAupAF6g8OPKKWoyO3SDtebeg6ltho=
X-Received: by 2002:a05:6402:516e:b0:41d:79f1:ff43 with SMTP id
 d14-20020a056402516e00b0041d79f1ff43mr739565ede.141.1649906093059; Wed, 13
 Apr 2022 20:14:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220413091647.3749-1-richard.neill@arm.com>
In-Reply-To: <20220413091647.3749-1-richard.neill@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 13 Apr 2022 23:14:42 -0400
Message-ID: 
 <CADkTA4MapjFi4qsdnuKarso6Qvt9JqfmfZ04A9Qx5hyQ4e2PKA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] k3s: Add missing IP Virtual Server
 (ip_vs) feature to the kernel config
To: Richard Neill <richard.neill@arm.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:54 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7169

On Wed, Apr 13, 2022 at 5:16 AM Richard Neill <richard.neill@arm.com> wrote:
>
> K3s (and Kubernetes) supports load balancing via IPVS, and by default reports
> errors when IPVS kernel modules cannot be loaded.
>
> This patch adds the missing reported kernel modules to the k3s recipe, and
> orders the kernel module list alphabetically:

I'd actually prefer that the list not be sorted, at the same time as
we are adding to it.

Can you re-submit with just the new kernel module recommendations added.

Bruce

>
>     * ip-vs
>     * ip-vs-rr
>     * ip-vs-wrr
>     * ip-vs-sh
>
> The modules are configured by including the ip_vs kernel feature.
>
> Signed-off-by: Richard Neill <richard.neill@arm.com>
> ---
>  recipes-containers/k3s/k3s_git.bb             | 22 +++++++++++--------
>  .../linux/linux-yocto/kubernetes.scc          |  1 +
>  2 files changed, 14 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index e2a3ffc..0b56e3c 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -2690,20 +2690,24 @@ RDEPENDS:${PN}-server = "${PN}"
>  RDEPENDS:${PN}-agent = "${PN}"
>
>  RRECOMMENDS:${PN} = "\
> +                     kernel-module-ip-vs \
> +                     kernel-module-ip-vs-rr \
> +                     kernel-module-ip-vs-sh \
> +                     kernel-module-ip-vs-wrr \
> +                     kernel-module-nfnetlink-log \
> +                     kernel-module-vxlan \
>                       kernel-module-xt-addrtype \
> -                     kernel-module-xt-nat \
> -                     kernel-module-xt-multiport \
> -                     kernel-module-xt-conntrack \
>                       kernel-module-xt-comment \
> -                     kernel-module-xt-mark \
>                       kernel-module-xt-connmark \
> -                     kernel-module-vxlan \
> +                     kernel-module-xt-conntrack \
> +                     kernel-module-xt-limit \
> +                     kernel-module-xt-mark \
>                       kernel-module-xt-masquerade \
> -                     kernel-module-xt-statistic \
> -                     kernel-module-xt-physdev \
> +                     kernel-module-xt-multiport \
> +                     kernel-module-xt-nat \
>                       kernel-module-xt-nflog \
> -                     kernel-module-xt-limit \
> -                     kernel-module-nfnetlink-log \
> +                     kernel-module-xt-physdev \
> +                     kernel-module-xt-statistic \
>                       "
>
>  RCONFLICTS:${PN} = "kubectl"
> diff --git a/recipes-kernel/linux/linux-yocto/kubernetes.scc b/recipes-kernel/linux/linux-yocto/kubernetes.scc
> index 1e93b70..a94ae84 100644
> --- a/recipes-kernel/linux/linux-yocto/kubernetes.scc
> +++ b/recipes-kernel/linux/linux-yocto/kubernetes.scc
> @@ -1,2 +1,3 @@
>  include docker.scc
> +include cgl/cfg/net/ip_vs.scc
>  kconf non-hardware kubernetes.cfg
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7165): https://lists.yoctoproject.org/g/meta-virtualization/message/7165
> Mute This Topic: https://lists.yoctoproject.org/mt/90436886/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

