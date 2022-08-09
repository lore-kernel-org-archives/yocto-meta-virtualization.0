Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A9F9C19F2D
	for <webhook@archiver.kernel.org>; Tue,  9 Aug 2022 13:19:08 +0000 (UTC)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by mx.groups.io with SMTP id smtpd.web12.11730.1660051139016700047
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:18:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=WeyAh0kI;
 spf=pass (domain: gmail.com, ip: 209.85.160.47,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-10ea7d8fbf7so13877968fac.7
        for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Aug 2022 06:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=btxO8W7FSarB2U+Ae0tpoeJJAa6iybtP7FiaRHsl0uA=;
        b=WeyAh0kI8EUP8Ve3nTXBTdVp9hXk2bLpixNk+2LyN6cmbw0bpINXE3Rpg/5GCRBMrJ
         SepYxZRgy3Mfjfu8RBVMqwEBEkov1pvPn0a0n4H8YIcaErB1UX2ggU6KDqhIMD/Co8JM
         Vu8Lw9dOCNqW7GW1E890rKfEX0KUcWWelASUeHzSTvx5zXV0VYKYNrALzTGdwTeAwz9E
         BTMR2006Ai/uVHLKnFWFXeVwM8VJ/AOPfnNlaWAYNQTs1duzZuvjdWvOLKhd8TY6B5r1
         QYVhH1GJw5q7dke63vfSAG/aFrrdfUzTdNAJq9bQR+j4fsjJF5j9Lv4FZfXZvUCJezXI
         gGgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=btxO8W7FSarB2U+Ae0tpoeJJAa6iybtP7FiaRHsl0uA=;
        b=bZqEkbRVNL1VSyeoWUOFGtNV1r9wZl5uUnf+EQucKsMYRI8lMVl29PSONvqOvMyEpe
         +mpKjcK/iNa0cQVuCwz6BWNcXOHSp0TOElTF9Fn4j6LBLWndAxAdhdl8fanReEuT04u6
         XYfX6sPguCnQ7zySI7ZVvQKqPJDdPbEjz1SyI4URdL7quOFyTfq0FC1oT5y6cr6wRJuG
         LaPsUxB8Q24SXU+OhI9KDPE37P1hgVwmx99s5Jw53oTFAJ6lvve7U+yQxl+9ZC1vkg5j
         ZNLYUgm2xnLbZ89837JnD70KRDYZAtS6f7MtGtXwwzBfxpg6KS3BZ9HFba9Oa/irNBo4
         HtIw==
X-Gm-Message-State: ACgBeo3emkHxnEF9aydQkyVO+Zk3HQN14+8QDqDRNmaK5PMLYKH8zG5i
	DhlDq/bf8bCzMZk5Vm1yXwOS5i4iST80+M3Mr9g=
X-Google-Smtp-Source: 
 AA6agR6KMtYsiKHh8Wue4ysiGceZpp48Nnrpxx8qvoE5SBNwRb3htsnxRI3VQ8vMADD4wkNhLV8pgXMldi2GvsKQrd0=
X-Received: by 2002:a05:6870:d29d:b0:10e:747b:f87b with SMTP id
 d29-20020a056870d29d00b0010e747bf87bmr13984938oae.6.1660051138315; Tue, 09
 Aug 2022 06:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220809121619.32258-1-jose.quaresma@foundries.io>
In-Reply-To: <20220809121619.32258-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Aug 2022 09:18:46 -0400
Message-ID: 
 <CADkTA4OaXz+DFBs+W8TpqkdusRzhg5wS8vDAmxoveeB=QrSNbA@mail.gmail.com>
Subject: Re: [meta-virtualization][kirkstone][master][PATCH 1/4] nerdctl:
 install the binaries in OE standard places
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Aug 2022 13:19:08 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7499

On Tue, Aug 9, 2022 at 8:16 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> - The env BIN_PREFIX is there from the beginning but there are no references to it,
> also fix a fatal QA errors installed-vs-shipped:
>
> ERROR: nerdctl-v0.18.0-r0 do_package: QA Issue: nerdctl: Files/directories were installed but not shipped in any package:
>   /bin
>   /bin/nerdctl
> Please set FILES such that these items are packaged. Alternatively if they are unneeded, avoid installing them or delete them within do_install.
> nerdctl: 2 installed and not shipped files. [installed-vs-shipped]
> ERROR: nerdctl-v0.18.0-r0 do_package: Fatal QA errors were found, failing task.
>

I'm building nerdctl constantly, and I'm not seeing this.

So until I can reproduce the issue, I can't merge this change.

Bruce

> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  recipes-containers/nerdctl/nerdctl_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/nerdctl/nerdctl_git.bb b/recipes-containers/nerdctl/nerdctl_git.bb
> index 5d4d827..ad18f67 100644
> --- a/recipes-containers/nerdctl/nerdctl_git.bb
> +++ b/recipes-containers/nerdctl/nerdctl_git.bb
> @@ -239,8 +239,8 @@ do_compile() {
>  }
>
>  do_install() {
> -        install -d "${D}${BIN_PREFIX}/bin"
> -        install -m 755 "${S}/src/import/_output/nerdctl" "${D}${BIN_PREFIX}/bin"
> +        install -d ${D}${bindir}
> +        install -m 755 ${S}/src/import/_output/nerdctl ${D}${bindir}
>  }
>
>  INHIBIT_PACKAGE_STRIP = "1"
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7495): https://lists.yoctoproject.org/g/meta-virtualization/message/7495
> Mute This Topic: https://lists.yoctoproject.org/mt/92913425/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

