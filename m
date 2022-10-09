Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED52C433F5
	for <webhook@archiver.kernel.org>; Sun,  9 Oct 2022 03:01:46 +0000 (UTC)
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 by mx.groups.io with SMTP id smtpd.web11.10618.1665284496910639522
 for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 08 Oct 2022 20:01:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=AShYasVn;
 spf=pass (domain: gmail.com, ip: 209.85.161.51,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oo1-f51.google.com with SMTP id
 k11-20020a4ab28b000000b0047659ccfc28so6000972ooo.8
        for <meta-virtualization@lists.yoctoproject.org>;
 Sat, 08 Oct 2022 20:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fzFVAKFfncuWB5C4LrnhdzeRvBUuUrk6KR/5OwFOKLk=;
        b=AShYasVn4bH/HOrX7EMBIeXJo4LIBVysiI+WcIaMw33suToGmn4wfXtbVJwg8sin1R
         UOtJFRM13M3w8js45vr5guccpL19lXdiJvN/EuhEDsPoRQnj2aCf8/oVIZB4EpfhAUVt
         whk8je+GNVD5Q4ZWNT0c6pumi75U86E5oKArlG46qRmnJbrvyYPJzI1l1ZEHL3qWuyDM
         6Se5QLIQoJkUq9BIbCyhLmU7aXbpcedNBj/tR/9ELzx0TFfHdW9LVlGGFY6YfZXGEVIl
         qwF0NrIlP1eptkSWi5fxaCnlSEugt21gnCcJrys9v3UYUWhOHK/jN2z8Pvb2wgA0OlZu
         iwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzFVAKFfncuWB5C4LrnhdzeRvBUuUrk6KR/5OwFOKLk=;
        b=ZrUoOwUwUaRrDDohyggPBP9eOsuDqXsRkxnD9GE+k3UJsyZ7TOiApTQMzqfBeEPMq1
         XIrJ2zfhlAMZ35TP8h2rA7a5sYwmi2v6dOjIwOL2djAbjMPlew5gOkU02vEdJ/nwANlP
         XweAUFATUDClqJtwTvP0NrUaoOBxatzQ+kTvlbQd8eMYfA/2fK6L2rVGsr5sV82nJGdw
         vL7I9IycnMHaExm7SmXmYQfnj9zMxEToUxpoCMz+IrA9oFbdIpQMBdIQY1UDuJOxR9Sb
         uxdePHRPeG3REpjoMhRocpuXcTVdZYjALBgRYj/GxM5HQ7OAbujAPv4l+02+iKVgEKed
         M0IQ==
X-Gm-Message-State: ACrzQf0AHUnTiD8pFcBN9cD4bnZlf4Mu1nlJmELIhpQ4ht/d2ok7vy+P
	VAUPpl8usmadCONzVV4qyaHbXZxKCcutFMXjE5Y=
X-Google-Smtp-Source: 
 AMsMyM48ys2os9KYWAqXDiRdjIj9LjILsogTrtKN7crwAuZuN5CQtEk4hjtA/wEXGqg2g2qeZBmLIPvgg4ui3/VNWco=
X-Received: by 2002:a4a:8d57:0:b0:476:99ae:46a5 with SMTP id
 x23-20020a4a8d57000000b0047699ae46a5mr4636445ook.51.1665284496071; Sat, 08
 Oct 2022 20:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20221004194629.50511-1-christopher.w.clark@gmail.com>
 <20221004194629.50511-2-christopher.w.clark@gmail.com>
In-Reply-To: <20221004194629.50511-2-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 8 Oct 2022 23:01:25 -0400
Message-ID: 
 <CADkTA4Nhj7Swux4YCHW2AOS-UwDmm0twvSWBS9Yqdg1uTtt8Bg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 2/2] xen, xen-tools: remove the
 version 4.15 recipes
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	Bertrand.Marquis@arm.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sun, 09 Oct 2022 03:01:46 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7652

All of the Xen bits are now merged to master and langdale.

Bruce

On Tue, Oct 4, 2022 at 3:46 PM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
> The existing 4.16 recipes are the current preferred Xen version, so
> per the Xen version update policy, the 4.15 recipes can now be removed.
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/xen/xen-tools_4.15.bb | 19 -------------------
>  recipes-extended/xen/xen_4.15.bb       | 19 -------------------
>  2 files changed, 38 deletions(-)
>  delete mode 100644 recipes-extended/xen/xen-tools_4.15.bb
>  delete mode 100644 recipes-extended/xen/xen_4.15.bb
>
> diff --git a/recipes-extended/xen/xen-tools_4.15.bb b/recipes-extended/xen/xen-tools_4.15.bb
> deleted file mode 100644
> index 5592dd7..0000000
> --- a/recipes-extended/xen/xen-tools_4.15.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# xen 4.15.2 release sha
> -SRCREV ?= "32dcef072fb37d432fd45c7916383472f3fcbc5e"
> -
> -XEN_REL ?= "4.15"
> -XEN_BRANCH ?= "stable-${XEN_REL}"
> -
> -SRC_URI = " \
> -    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> -    file://0001-python-pygrub-pass-DISTUTILS-xen-4.15.patch \
> -    "
> -
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> -
> -PV = "${XEN_REL}+stable${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> -
> -require xen.inc
> -require xen-tools.inc
> diff --git a/recipes-extended/xen/xen_4.15.bb b/recipes-extended/xen/xen_4.15.bb
> deleted file mode 100644
> index 41023b2..0000000
> --- a/recipes-extended/xen/xen_4.15.bb
> +++ /dev/null
> @@ -1,19 +0,0 @@
> -# xen 4.15.2 release sha
> -SRCREV ?= "32dcef072fb37d432fd45c7916383472f3fcbc5e"
> -
> -XEN_REL ?= "4.15"
> -XEN_BRANCH ?= "stable-${XEN_REL}"
> -
> -SRC_URI = " \
> -    git://xenbits.xen.org/xen.git;branch=${XEN_BRANCH} \
> -    file://0001-menuconfig-mconf-cfg-Allow-specification-of-ncurses-location.patch \
> -    "
> -
> -LIC_FILES_CHKSUM ?= "file://COPYING;md5=419739e325a50f3d7b4501338e44a4e5"
> -
> -PV = "${XEN_REL}+stable${SRCPV}"
> -
> -S = "${WORKDIR}/git"
> -
> -require xen.inc
> -require xen-hypervisor.inc
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

