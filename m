Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8339C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:19:17 +0000 (UTC)
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
 by mx.groups.io with SMTP id smtpd.web10.30970.1721686754712903686
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:19:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XIVjVxsf;
 spf=pass (domain: gmail.com, ip: 209.85.160.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-447e57103d5so20683431cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721686754; x=1722291554; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nXi24mQtN5c3TQ4rkXxPT0TGvvvF58QgKfp9inSWh6k=;
        b=XIVjVxsfc0fYPKFXOW48iPOXMZm+hVsgwzrJdvRb6+wIa8yRBwagnoPHqZfHxAOrq3
         qwtkKqJ0FycwsQUi3FvJis0yFyZQaN2qPW+hOA7Wsp6cPPE1FK0FGx+pymzAsVE2E4UH
         BNjuYusmwEyDScPjqP/22vwle0ZB3cooRfNWkBXGYT+lb8u0/JthQRA6N66U5uOdR0a9
         g6vmOaL1dMNtctmfW/sHkLq+SslpSdvYBhLG2zUFBIO5I0OMbZrb8eSCvV+AeG4qlvy3
         zTMQMMDX8FO9gz9VjcMmVQN5Us7XcBbNaZsez3AwK2vmCggr8KtLHO9e1Y6BAe75E22I
         9mCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686754; x=1722291554;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nXi24mQtN5c3TQ4rkXxPT0TGvvvF58QgKfp9inSWh6k=;
        b=kc9Tocs2hkVS/UUSym2j3d4fyd0O7iGgnNm45Yia2QzL+z47J7hiF6LAiZ1AeAzCO/
         wXsmCldwZbGHG6xL3XwlypDg7x3JJlUX6qsl3HuhR/gcRF3xQSt2Ye+pg5+QgpdqhtiL
         NDU2GsEA7/Ma9sFza5fZODsY9gRFDNxtjz8ZTFAlq58ttNHQ49+8JJrvWhERmAzAbiPz
         rftowYN0I7Dn+x9AUXzKZfWt132AkW8p7y1AAA4PIKzg21VyTiSufyqSzUb1cKNKUH0a
         NhOP8/1MKwz8pYzU/82IrMNKoSCqRKu7RPwojQoX/9XqzKSmDx5670KqUuHoWKq4nqoX
         Ix6A==
X-Gm-Message-State: AOJu0Yy8/5ycPjGGOSS4d40+fh8rtH6kxm70wLHRAv2DTVwHcwA0bn4b
	31aOrzB5gujqm1D2HiwvXgPMcQWjwLInK1uEmfzozoRR1CDB1BWn
X-Google-Smtp-Source: AGHT+IEVBm6renXcvJeniwWmmEPq9ypQncJ5H9aU0qBxvsFkmJy8ThkCWyomOl47W4X4u6fhBsjTCw==
X-Received: by 2002:a05:622a:60f:b0:447:f620:4d0f with SMTP id d75a77b69052e-44fa525bb79mr134524191cf.5.1721686753583;
        Mon, 22 Jul 2024 15:19:13 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-44f9cbed285sm37677801cf.1.2024.07.22.15.19.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:19:13 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:19:11 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: badganchipv@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, ranjitsinh.rathod@kpit.com
Subject: Re: [meta-virtualization][master][PATCH] lxc: Fix meson build issue
Message-ID: <Zp7a3y1P949O1GD2@gmail.com>
References: <20240710105821.60987-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710105821.60987-1-badganchipv@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:19:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8839


In message: [meta-virtualization][master][PATCH] lxc: Fix meson build issue
on 10/07/2024 Pawan Badganchi via lists.yoctoproject.org wrote:

> Build is failing during do_configure stage for lxc as meson
> does not support --with-systemdsystemunitdir config parameter.
> 
> Error:
> meson: error: unrecognized arguments: --with-systemdsystemunitdir=/etc/systemd/system/
> 
> Hence, use -Dsystemd-unitdir config parameter instead.

merged to master-next

Bruce

> 
> Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index 09d5a05e..22ab80c9 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -79,8 +79,7 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "-Dselinux=true,-Dselinux=false,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] ="-Dseccomp=true,-Dseccomp=false,libseccomp,libseccomp"
> -# meson equiv for the unitdir found yet
> -# PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
> +PACKAGECONFIG[systemd] = "-Dsystemd-unitdir=${sysconfdir}/systemd/system/, -Dsystemd-unitdir=, systemd,"
>  PACKAGECONFIG[systemd] = "-Dinit-script=systemd,-Dinit-script=sysvinit,systemd,"
>  
>  # required by python3 to run setup.py
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8834): https://lists.yoctoproject.org/g/meta-virtualization/message/8834
> Mute This Topic: https://lists.yoctoproject.org/mt/107140196/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


