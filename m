Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E740C433FE
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 03:01:27 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.10554.1665284480477102024
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 08 Oct 2022 20:01:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MHqH7qMU;
 spf=pass (domain: gmail.com, ip: 209.85.167.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id g10so2370579oif.10
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 08 Oct 2022 20:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Dg1/nfxEaFbBst/MyOP2gsDDXb3zclnPqIFTXkcZM0=;
        b=MHqH7qMUI2SGSTPGjFFVHZPIQkxSjHSA1SXJf5DCs9wnfC/HnUhq0MjYWCrYwQjaa9
         Ib5hFABDy8fF25RTSCqCijuh5SB3wePJT8n+wYChF0EW3D0WCHPqinmitO4PbGf8ME3z
         IQwmxaiquJklTvnEZi0pNOBfMxI7imI1aFP/JRAiMhAVdF5m2pxFZ9OT+6SfE/kzGLNJ
         kubQRPGYCd9OOrERd4yTGDFXz/h2FAV5o53M99l7Yp326hE6q7DOEaW1T8GXyFxn5cYA
         Zwx7UxlEMuYkUMEh0A0wYm4VeEO/GN0lWRbTleMO8OPpielbA8+b+sAYimowbedfptRh
         pQHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Dg1/nfxEaFbBst/MyOP2gsDDXb3zclnPqIFTXkcZM0=;
        b=F8LDbpLqPc6OHHj+w5ZxhRKL8D+yHwGVrWSsKgyAJnH4y5rWRsqBbMtVl8lTiI5d6Y
         IR/MwllN4G44wMPgn8u+jdBs3i5xTlf9cQzwHBUsV4p7Ki43vZJmyzJaqdcbDqm8+s8m
         sFP05HEsi5gc+LP2dvYBbJsjT9egZV+5qTMCOmV54NnRa5GL8S7bPGVhwmmJThY8Q16/
         oBNSb8U5l81UqSA17ZhDU2oNAMJq9QBl8BzEZ5dtp1jRGDl3jcsvwe776UQqe+UBCnXe
         /ccLR4GI8SWnPmktkfc0TPq8E1oDYaox3bWXzLOWXaf/kDFE2EchQVKXVv8WeB2xJhCW
         jPGA==
X-Gm-Message-State: ACrzQf1PJqBtxAoeC55WT7VKeYV4EdwwBOPYklTgOYQfL6MpWcFui7zO
	QMaQGoVrTjZ1sXYUfri2KqUgNBO8gCrzxt/vwqs=
X-Google-Smtp-Source: 
 AMsMyM6IdZrHg62Qu39yW/vku+cZcqgxhEisEbeUttW30eL/FYswIVeyeDfrZCerhlmekaxPFY8tBVCBrlypzVGDbEY=
X-Received: by 2002:a05:6808:1a08:b0:354:2875:3d63 with SMTP id
 bk8-20020a0568081a0800b0035428753d63mr5608952oib.241.1665284479544; Sat, 08
 Oct 2022 20:01:19 -0700 (PDT)
MIME-Version: 1.0
References: <20221006081020.2269569-1-paul.barker@sancloud.com>
In-Reply-To: <20221006081020.2269569-1-paul.barker@sancloud.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 8 Oct 2022 23:01:08 -0400
Message-ID: 
 <CADkTA4O5Bn-t=z_1gwvWMWF0_Qx8zb69n9a1WaP1M7Qb3Hwq_Q@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] openvswitch: Fix INSTALL_MOD_PATH
To: Paul Barker <paul.barker@sancloud.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Oct 2022 03:01:27 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7651

merged.

Bruce

On Thu, Oct 6, 2022 at 4:10 AM Paul Barker <paul.barker@sancloud.com> wrote:
>
> If the usrmerge DISTRO_FEATURE is enabled, modules should be installed
> under /usr/lib instead of /lib. We can handle this by using
> ${root_prefix} in INSTALL_MOD_PATH.
>
> Signed-off-by: Paul Barker <paul.barker@sancloud.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc    | 2 +-
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 251a7056347f..e6c9091ad364 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -132,7 +132,7 @@ do_install:append() {
>         install -d ${D}/usr/share/openvswitch/scripts/
>         install -m 755 ${S}/rhel/usr_share_openvswitch_scripts_ovs-systemd-reload ${D}/usr/share/openvswitch/scripts/ovs-systemd-reload
>
> -       oe_runmake modules_install INSTALL_MOD_PATH=${D}
> +       oe_runmake modules_install INSTALL_MOD_PATH=${D}${root_prefix}
>         install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
>         cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
>  }
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 2e125e78fdf1..f5d85f3fb821 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -53,5 +53,5 @@ do_install_ptest() {
>  }
>
>  do_install:append() {
> -       oe_runmake modules_install INSTALL_MOD_PATH=${D}
> +       oe_runmake modules_install INSTALL_MOD_PATH=${D}${root_prefix}
>  }
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

