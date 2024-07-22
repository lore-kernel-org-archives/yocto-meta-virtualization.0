Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE51C3DA5D
	for <webhook@archiver.kernel.org>; Mon, 22 Jul 2024 22:20:07 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web11.31072.1721686806888524757
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 22 Jul 2024 15:20:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=PBx+B3tt;
 spf=pass (domain: gmail.com, ip: 209.85.222.179, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-79ef93865afso282277785a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 15:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721686806; x=1722291606; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yK5v1GfetcBmy82DT0NXXUTfhCFt9OJuE84Z43XK9S4=;
        b=PBx+B3ttUh6WZ0zkSElyT/wEvjoWkQEHc6pukcNePcy+Q0+HaQwv/4AJTuO2NXnp1w
         0HYAysNgyzNqeeM4jEiyU/+VMSA//fsGctwskBAML7RhuLVbfhytGatxqsfpkXsSWDlr
         pJo948FwjPTQYJwP+SaTAyQ5TyzhJEJIsuDEdMpQele44ys1lq3K5m1tPUvPr47nUits
         5lkgNCX42EQR9qgg/boJWGPuUBiRMDFIJpJp5AHjS2su+VV7Mzo04MFO6rX/5Rua7Fo7
         lFIou+JG5gyL6wGkZHhpUQQvfULwQSnUOAD2TccUmgjt/sh+BPH0kYdbrysFbZbSTNPl
         Ojkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721686806; x=1722291606;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yK5v1GfetcBmy82DT0NXXUTfhCFt9OJuE84Z43XK9S4=;
        b=fFq+07xRjh2p07lPGFQlkVQvoMMRArgzPyGjzcR5Wfihi8HrkhVg2Y5tz5jFDR1WE7
         MtcytVmKw1uZ3sqZb7rknthrsGIZpttN5Gi2BlZv6mDcbnzYhM/CjKo1E80PcUfUsEks
         2SDWnp8ZGJ0fVataSnLfLFFpYpkBZ0zGhJpOEhHc++KJ351G4/m2ZqosStjhW4Xj4Xbd
         M4k7Ah5+NxSC7Qs+C5c4ji5n9N4/LAyZgblHa0+uW9rP9BjHqIm1DMr8Ruvyc9P1TKew
         31nn47qLZ10b/6jFORp999efxWl3vI+Zn7/n2fCGG/Q3uqyacgBh6c+IV+bYZdg/qp3E
         T3tA==
X-Gm-Message-State: AOJu0YyR52YMAC7ows9vBlFMb6N3rkMN4SpddACG+sHZ9T9uQNy1OnU1
	RCHdGlSfN9lbsPWErr7j+2yPNqsKAxqQUoEuWcv52P7kKJLFbXlK
X-Google-Smtp-Source: AGHT+IHBTvr37RAybfOXqG66Gluo8l4JzLM+CrxapCafwJ9NRHVKHY+3WU+aT0LNXofdzlDIZYXnsg==
X-Received: by 2002:a05:6214:27e5:b0:6b7:9b14:627b with SMTP id 6a1803df08f44-6b9610f023bmr136465986d6.40.1721686805784;
        Mon, 22 Jul 2024 15:20:05 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b96cd4e4f0sm19178456d6.78.2024.07.22.15.20.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 15:20:05 -0700 (PDT)
Date: Mon, 22 Jul 2024 22:20:03 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: badganchipv@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org, ranjitsinh.rathod@kpit.com
Subject: Re: [meta-virtualization][scarthgap][PATCH] lxc: Fix meson build
 issue
Message-ID: <Zp7bE2xL1AozeyeN@gmail.com>
References: <20240710053655.16122-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240710053655.16122-1-badganchipv@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Jul 2024 22:20:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8840

Staged locally.

Once I get master-next merged to master, I'll update scartgap as
well.

Bruce

In message: [meta-virtualization][scarthgap][PATCH] lxc: Fix meson build issue
on 10/07/2024 Pawan Badganchi via lists.yoctoproject.org wrote:

> Build is failing during do_configure stage for lxc as meson
> does not support --with-systemdsystemunitdir config parameter.
> 
> Error:
> meson: error: unrecognized arguments: --with-systemdsystemunitdir=/etc/systemd/system/
> 
> Hence, use -Dsystemd-unitdir config parameter instead.
> 
> Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
> ---
>  recipes-containers/lxc/lxc_git.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index ee0e442f..75cfe859 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -81,8 +81,7 @@ PACKAGECONFIG[apparmor] = "-Dapparmor=true,-Dapparmor=false,apparmor,apparmor"
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
> View/Reply Online (#8829): https://lists.yoctoproject.org/g/meta-virtualization/message/8829
> Mute This Topic: https://lists.yoctoproject.org/mt/107137574/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


