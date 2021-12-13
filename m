Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88EB5C433EF
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 20:42:23 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web09.16893.1639428142485396667
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 12:42:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=eVvNEE2k;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id x15so57152948edv.1
        for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Dec 2021 12:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mr5n1kaiqG1ecNT41xNmzTWmqKdlBs910Ib4XCWQ7Mg=;
        b=eVvNEE2kboQe/L6VLhUr3WcOoCx9jASUlYEfGzoNMHnLqTl1Jze9AAIL8lid0Xyqx3
         81bGAOcY8HtQcFcILAJ2VdqbDvbLrGn99lpKpLp3LkruKPGAF4QhZlxJaOSFse0/TS1t
         75vqX/WRZp0qDkonbX2qwAuanA1QWvCVfRTWY86ts1yLO0DfFsKFoIXiTR1ovx9L7QW8
         ujCyiuHrXezigmoQsQ4K1OWa3v4NdVy8xw3U2FqShyYpRQ6Y7vea7R7qIGhqhipRdxI7
         46/wS1w+5VMnRtSOyc5SVIiKhnqGXvLRd9YmwCKDmfU8b1Kq0Fhxf34dPzxrEgDjNYtj
         uMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mr5n1kaiqG1ecNT41xNmzTWmqKdlBs910Ib4XCWQ7Mg=;
        b=401GfPv+Qq12AFTEX2wpwAcpBtHlpHQqrM2xxgNeYYy7uterqrLE/uOWxx0KsT6QUy
         EpZrilRhVK0gub29arW/TeS7/xxV7BBbKaiZeQBLo48WYJRs+NC/rQaln4mZlbZDdIbt
         TAyZyE8ml8cCVgFJ2WELIFDp/PXQltDzAuKBXVJt/a9+jf3f0nMlstM4zOIH/NCwYYm7
         u2DO0uDef+OjlzDbcgF/PeJmArh5o6OIJvLuWEMd5e48UkOeHsiw+CMuGx0e054q5gng
         GfUPjoTPEBF/ovrMqgGi4NHYbxERm6x2wmlqQoEfB/cbTHFH+JYq/7NDUI7Cac46YkIF
         T+PA==
X-Gm-Message-State: AOAM530bvEHZSd7SjxfaJBv2yssbtoRKQir0umxLP2zBZGh2t0Cvx6mb
	R8lyPffUPfv+6z0H5CL/kF6/UOrrwD+2GvhRvDU=
X-Google-Smtp-Source: 
 ABdhPJy1eyAEBA78Qxha3cgWLCVjIzJTW0/O5NC+9kWz2Zjft3eYZyjjvA+A/l6OVSHS6VzlTEtcDeFHcmdTJdsz87Y=
X-Received: by 2002:a17:906:544d:: with SMTP id
 d13mr671633ejp.651.1639428140638;
 Mon, 13 Dec 2021 12:42:20 -0800 (PST)
MIME-Version: 1.0
References: <20211209135752.6872-1-kamil.dziezyk@arm.com>
In-Reply-To: <20211209135752.6872-1-kamil.dziezyk@arm.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 13 Dec 2021 15:42:09 -0500
Message-ID: 
 <CADkTA4MD816MbZi3=BmZQSwG6NMq2=zsFoPvsc0E180UCjBuWg@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2 1/3] xen-tools: Load xen related
 kernel modules during system boot
To: Kamil Dziezyk <kamil.dziezyk@arm.com>,
	Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, nd <nd@arm.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Dec 2021 20:42:23 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6978

v2 looks good to me, but I'd like to get an Ack from Christopher before merging.

Bruce

On Thu, Dec 9, 2021 at 8:58 AM Kamil Dziezyk <kamil.dziezyk@arm.com> wrote:
>
> This patch changes the location of xen.conf file, that contains list of kernel
> modules to be loaded during system boot, to "${nonarch_libdir}".
>
> Previous path based on "${systemd_unitdir}" was not considered by default by
> systemd-modules-load.service.
>
> Signed-off-by: Kamil Dziezyk <kamil.dziezyk@arm.com>
> ---
>  recipes-extended/xen/xen-tools.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen-tools.inc b/recipes-extended/xen/xen-tools.inc
> index d831941..17ef0f7 100644
> --- a/recipes-extended/xen/xen-tools.inc
> +++ b/recipes-extended/xen/xen-tools.inc
> @@ -653,10 +653,10 @@ FILES:${PN}-xm = "\
>      "
>
>  FILES:${PN}-xencommons += "\
> +    ${nonarch_libdir}/modules-load.d/xen.conf \
>      ${sysconfdir}/default/xencommons \
>      ${sysconfdir}/init.d/xencommons \
>      ${sysconfdir}/xen/scripts/launch-xenstore \
> -    ${systemd_unitdir}/modules-load.d/xen.conf \
>      ${systemd_unitdir}/system/proc-xen.mount \
>      ${systemd_unitdir}/system/xen-qemu-dom0-disk-backend.service \
>      ${systemd_unitdir}/system/xenconsoled.service \
> @@ -744,7 +744,7 @@ SYSTEMD_SERVICE:${PN}-xendomains = "xendomains.service"
>
>  EXTRA_OECONF += " \
>      --with-systemd=${systemd_unitdir}/system \
> -    --with-systemd-modules-load=${systemd_unitdir}/modules-load.d \
> +    --with-systemd-modules-load=${nonarch_libdir}/modules-load.d \
>      --with-initddir=${INIT_D_DIR} \
>      --with-sysconfig-leaf-dir=default \
>      --with-system-qemu=${bindir}/qemu-system-i386 \
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6972): https://lists.yoctoproject.org/g/meta-virtualization/message/6972
> Mute This Topic: https://lists.yoctoproject.org/mt/87611978/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

