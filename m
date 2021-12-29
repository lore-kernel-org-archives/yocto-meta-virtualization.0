Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9D46C433F5
	for <webhook@archiver.kernel.org>; Wed, 29 Dec 2021 16:44:13 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by mx.groups.io with SMTP id smtpd.web10.52964.1640796253034522582
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Dec 2021 08:44:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lmS0ux5A;
 spf=pass (domain: gmail.com, ip: 209.85.208.52,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f52.google.com with SMTP id bm14so88346881edb.5
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Dec 2021 08:44:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LrPvjP8VZNT8b4EzaPGDLBwboGxhjzYJjqqrCB4AcSE=;
        b=lmS0ux5AuefXwfkyDAt1lMNIKPnQxBuFP3sifcmHeOzAUrKnaAe3YgFW8m4AzCizcD
         EAgI2KS8ErPE41NBmmH2t7Fe2mhCGSy6A0H9f33MEEjuoaZySyIHojUUsFf6irnRt+Mj
         d8Kc8nBKg/LJLI59M8rjMqKFjRoPpXWVIsTTO92VmLENusW0pzqkhsH47sMuygpMAncg
         2VmHiQJLVrVt6KwEfX4aTSAPRUYzmb3+2ru7GJFCvQoTSJsVr58+NjOY5xWTV18hcYfc
         nvlWS7DAwXSkgGSSdXMwSTz7kPq6iMHqoCI9Sv4FyVYvBfcwZ9RuZ+52arArM2P7W6hg
         0bwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LrPvjP8VZNT8b4EzaPGDLBwboGxhjzYJjqqrCB4AcSE=;
        b=Y9pxEAsje42fiwYBEWjrxOlfdPb27xost8hkWrS9ZbTr1vFUm92zVVwbLSUd3Av6/X
         NmYeQT3sjQo19pj81R7XjGQtv4MhFYm/ySOvQcbNoMNMAkrMhme7PPKnUOK+bW6qvJ6h
         s/pQnFDPhhuHBUnb4HOkK/tPWxANqPPnnn799zpoplutDni9EMkoLAAioEPPruNnra1B
         G9Mwa8qvAws61BVqwv/cDk8R72NqtbwNOXbhxJCEB//88DAuCAH1oJK7lwB+4gUUYURC
         VjuhBsQEnuE30mmuT5ZysQOIJIwXAQ469+1oYNRqClV0gIGhEHVWq3K2do1/zjQ0Tcga
         MG/g==
X-Gm-Message-State: AOAM533KshMMRiqhcsc/3+BRBzJHIxC12GVvcNL5yv0f/5Bh8Bo/iIgf
	322KXR3vTIPQjwFYGx1LeMIeOm4GSWR9DwTAsSI=
X-Google-Smtp-Source: 
 ABdhPJx7EjMx7wgV7hkAjm0H4ODgnoNbjbUKv2Ljl/kcyeQ2ekca4nKkn073xs6ebMu/t7CFu9BBcKk+Lmr27npUuEM=
X-Received: by 2002:a05:6402:4307:: with SMTP id
 m7mr26341193edc.349.1640796251318;
 Wed, 29 Dec 2021 08:44:11 -0800 (PST)
MIME-Version: 1.0
References: <20211229120539.2392783-1-adrian.freihofer@siemens.com>
In-Reply-To: <20211229120539.2392783-1-adrian.freihofer@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 29 Dec 2021 11:44:00 -0500
Message-ID: 
 <CADkTA4OpKLgj476pvsuC7OqzT9D3zmLcWS9F9Wdqt5gp_kTnDQ@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] k3s: fix systemd service install
To: Adrian Freihofer <adrian.freihofer@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Dec 2021 16:44:13 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/6989

On Wed, Dec 29, 2021 at 7:05 AM Adrian Freihofer
<adrian.freihofer@gmail.com> wrote:
>
> - sed was complicated and fragile
> - sed runs on k3s-agent.service before it was installed

Was that actually causing breakage ? As long as WORKDIR is used, it
typically doesn't break anything.

> - not all paths were replaced

Which ones in particular ? We should document

> - "if systemd in DISTRO_FEATURES" is already handled in systemd.bbclass

It still needs to be protected by the check. We shouldn't be
installing them at all if it isn't enabled. The bbclass doesn't help
with that.

Bruce

>
> Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
> ---
>  recipes-containers/k3s/k3s/k3s-agent.service |  4 ++--
>  recipes-containers/k3s/k3s/k3s.service       |  4 ++--
>  recipes-containers/k3s/k3s_git.bb            | 12 ++++++------
>  3 files changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/recipes-containers/k3s/k3s/k3s-agent.service b/recipes-containers/k3s/k3s/k3s-agent.service
> index 9f9016d..eeeef2a 100644
> --- a/recipes-containers/k3s/k3s/k3s-agent.service
> +++ b/recipes-containers/k3s/k3s/k3s-agent.service
> @@ -21,6 +21,6 @@ Restart=always
>  RestartSec=5s
>  ExecStartPre=-/sbin/modprobe br_netfilter
>  ExecStartPre=-/sbin/modprobe overlay
> -ExecStart=/usr/local/bin/k3s agent
> -ExecStopPost=/usr/local/bin/k3s-clean
> +ExecStart=@@BIN_PREFIX@@/bin/k3s agent
> +ExecStopPost=@@BIN_PREFIX@@/bin/k3s-clean
>
> diff --git a/recipes-containers/k3s/k3s/k3s.service b/recipes-containers/k3s/k3s/k3s.service
> index 33d3ee7..b82d8ce 100644
> --- a/recipes-containers/k3s/k3s/k3s.service
> +++ b/recipes-containers/k3s/k3s/k3s.service
> @@ -29,9 +29,9 @@ RestartSec=5s
>  ExecStartPre=/bin/sh -xc '! systemctl is-enabled --quiet nm-cloud-setup.service'
>  ExecStartPre=-/sbin/modprobe br_netfilter
>  ExecStartPre=-/sbin/modprobe overlay
> -ExecStart=/usr/local/bin/k3s server
> +ExecStart=@@BIN_PREFIX@@/bin/k3s server
>  # Avoid any delay due to this service when the system is rebooting or shutting
>  # down by using the k3s-killall.sh script to kill all of the running k3s
>  # services and containers
>  ExecStopPost=/bin/sh -c "if systemctl is-system-running | grep -i \
> -                           'stopping'; then /usr/local/bin/k3s-killall.sh; fi"
> +                           'stopping'; then @@BIN_PREFIX@@/bin/k3s-killall.sh; fi"
> diff --git a/recipes-containers/k3s/k3s_git.bb b/recipes-containers/k3s/k3s_git.bb
> index c9779ea..d38044c 100644
> --- a/recipes-containers/k3s/k3s_git.bb
> +++ b/recipes-containers/k3s/k3s_git.bb
> @@ -63,12 +63,12 @@ do_install() {
>          install -m 755 "${WORKDIR}/k3s-clean" "${D}${BIN_PREFIX}/bin"
>          install -m 755 "${WORKDIR}/k3s-killall.sh" "${D}${BIN_PREFIX}/bin"
>
> -        if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -                install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
> -                install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
> -                sed -i "s#\(Exec\)\(.*\)=\(.*\)\(k3s\)#\1\2=${BIN_PREFIX}/bin/\4#g" "${D}${systemd_system_unitdir}/k3s.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
> -                install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
> -        fi
> +        install -D -m 0644 "${WORKDIR}/k3s.service" "${D}${systemd_system_unitdir}/k3s.service"
> +        install -D -m 0644 "${WORKDIR}/k3s-agent.service" "${D}${systemd_system_unitdir}/k3s-agent.service"
> +        install -m 755 "${WORKDIR}/k3s-agent" "${D}${BIN_PREFIX}/bin"
> +        sed -i -e "s#@@BIN_PREFIX@@#${BIN_PREFIX}#g" \
> +            "${D}${systemd_system_unitdir}/k3s.service" \
> +            "${D}${systemd_system_unitdir}/k3s-agent.service"
>  }
>
>  PACKAGES =+ "${PN}-server ${PN}-agent"
> --
> 2.31.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#6988): https://lists.yoctoproject.org/g/meta-virtualization/message/6988
> Mute This Topic: https://lists.yoctoproject.org/mt/88013223/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

