Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96F58CAC597
	for <webhook@archiver.kernel.org>; Fri, 19 Sep 2025 02:20:53 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web11.6437.1758248448500514077
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 18 Sep 2025 19:20:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FVW1qtkg;
 spf=pass (domain: gmail.com, ip: 209.85.222.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8072bb631daso146622385a.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 18 Sep 2025 19:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758248447; x=1758853247; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UDbrcRTNULwJQZv4nIiM/GWfTys8VXtGd38mE6I4qb4=;
        b=FVW1qtkgjB9P29kHPdYadrPvQcIwRvxJL9cDPuf+HZMOStrt/xEFtuXTxcC2+9kGXV
         2o54PUkR6fbLlIA5QenF6B7Dr2r9lwENemqLpkCXWPWEJi7GF8uEV9uc9+jLvAPjbsVs
         dZ0fNzSjKURUy1abzgphgkp2BwkakMWwX4o/y1RH32Q9DdOxy+F9PoRUp5FsZCOGP2gM
         qf/tELxjIi81627J92OzSDcxzbB6XNh9AZCN2PqnobCDrncRzu5aH4NCUf8hrAZoPS+H
         zrtxT8Ao/oJS8AqXXVlOTsGwyL9fN5HPTaLv3VpbAmSL2rdN+7yHFS3l4yDzbTXJVWyK
         QFSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758248447; x=1758853247;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UDbrcRTNULwJQZv4nIiM/GWfTys8VXtGd38mE6I4qb4=;
        b=Reb0Akybjn94CHsaVFEFp3QQqmfVfXZIY8JFZBEccvFKd9Wvw/lVXU6+YOEEYheG2W
         Wx54EkZ2YARiuWsvefDg/ZwfJZnGDqMIf3YSa7HZZWUdnGDrfIC3Sk5Q6TCaUFtug5W3
         DSEIMM4as4JUiMfvQkSSPGotE4q5usSVTZa6QdvlVmDfEn1fXc0RS1W0FtHNJnzPk9s+
         +EzD2BBTnlmFGyf+jXAPDvIGJ69o1c3aWDSFWGtWCTGhf5ETqtQR6jTIwxTvDhVlwkY3
         hkvcWkixwUg1TuvbRYNhdemJZQ+3ezKv+EZGG7DypyEyf9XSq162NsaQeKtsbvD5DM62
         jdXg==
X-Gm-Message-State: AOJu0YyQ+sS0G5ni31PoqzpSpnhEFH71llT1tMAxr8ITbTR+uCrcvJOU
	wkK70AFVTWH21LNgbEHiCXaNyek29pKtk0UWKtuRyHzHPUkme6ToHcJg0dgPx+Aoa+Y=
X-Gm-Gg: ASbGncvKCTUeYBSFSYJwoL08BTRYQ4VQfs0oapTqNQvPiXoB5hhmmbGBy3UBAz+mSMY
	tFelHdL0YQGfukLy9s/G5gMDhD1PimB5zSm9RMzuH2oPAVLVnsGm3lMExX/IqLaUyjTiP9cF+Hi
	qisnRbqZPpRrLWUyIwZtRcDE3R2IO0lJfiTCeu3I86UiNlQcpymY158y4q4AV/2q66njLqt26eN
	LmQsrGVRFTggEmLxewVeubfTUNTn/9HWU3jIKUcyX/JiPeetvqaLiLwxPQCXkyjOzJgcYXZXtQn
	pcLmFhiJvLjQBkqElzgAio5l1Ehvw7bzWIeTMgfBlPqWRbGrO3bmZ6oolStbldHlb5Uvpfwab37
	FxSH1sU7KqbYFnVYEVqQG4zBFvuNa/PEChJTYJzqo7uVQ9Qi13Ls9G/miuraBMK7DIVEEw7NG0E
	Pao/B5dIfdYQeqsxcKtfUy8hNtDU60lwJqBUWtfL2G7zD0vvjRd4QlWh9FZJ37sg==
X-Google-Smtp-Source: AGHT+IFsR0Fld5sKF9NGZqFKUszWYxqYKFA/hO+2Nnx0ftpjiQehbJiaJlSF9+sjPmoyWgZ0LDuYFQ==
X-Received: by 2002:a05:620a:4607:b0:804:4a23:38c1 with SMTP id af79cd13be357-83ba589b884mr229360585a.36.1758248447278;
        Thu, 18 Sep 2025 19:20:47 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8363439fb02sm262989185a.68.2025.09.18.19.20.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 19:20:46 -0700 (PDT)
Date: Thu, 18 Sep 2025 22:20:45 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: patrick.vogelaar@belden.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] docker: make ca-certificates a
 packageconfig
Message-ID: <aMy9/Zv+52k+XDcl@gmail.com>
References: <aLjn3mCCaI8wCYlR@gmail.com>
 <14236.1757061728389674907@lists.yoctoproject.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14236.1757061728389674907@lists.yoctoproject.org>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 19 Sep 2025 02:20:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9402

In message: Re: [meta-virtualization] [PATCH] docker: make ca-certificates a packageconfig
on 05/09/2025 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org wrote:

> On Thu, Sep 4, 2025 at 03:14 AM, Bruce Ashfield wrote:
> 
>     In message: [meta-virtualization][PATCH] docker: make ca-certificates a
>     packageconfig
>     on 24/08/2025 Patrick Vogelaar via B4 Relay via lists.yoctoproject.org
>     wrote:
> 
> 
>         Moving ca-certificates into a packageconfig allows using docker without
>         installing all the certificates.
> 
>     I don't have (many) issues with the patch, but in my experience you
>     can't work with any registries or services with the certs being present.
> 
>     Are you installing them some other way ? or using some alternative ?
> 
> We are either not installing from registry at all, or we have our own registry
> were we put only the required certificate and not the whole pool of
> certificates.


Aha. So as long as the default doesn't change, I can live with
that explation and those that turn this off should know what they
are doing.

I had to fix the author before I could push though, so your
git-send-email needs a configuration tweak:

Enumerating objects: 9, done.
Counting objects: 100% (9/9), done.
Delta compression using up to 12 threads
Compressing objects: 100% (5/5), done.
Writing objects: 100% (5/5), 612 bytes | 612.00 KiB/s, done.                                                                                                                                                                                                  
Total 5 (delta 4), reused 0 (delta 0), pack-reused 0
remote: ##############################################
remote: Invalid author Patrick Vogelaar via B4 Relay
remote: ##############################################
To ssh://push.yoctoproject.org/meta-virtualization
! [remote rejected]   master -> master-next (pre-receive hook declined)
error: failed to push some refs to 'ssh://push.yoctoproject.org/meta-virtualization'

Bruce

>  
> Patrick
> 
> 
>     Since the defaults aren't changed by this patch, I'll definitely merge
>     it. I'd just like to make sure that it won't create a hidden/non-working
>     configuration.
> 
>     Bruce
> 
> 
>         Signed-off-by: Patrick Vogelaar <patrick.vogelaar@belden.com>
>         ---
>         recipes-containers/docker/docker.inc | 4 ++--
>         1 file changed, 2 insertions(+), 2 deletions(-)
> 
>         diff --git a/recipes-containers/docker/docker.inc b/recipes-containers/
>         docker/docker.inc
>         index 94ee34db..c464bc3c 100644
>         --- a/recipes-containers/docker/docker.inc
>         +++ b/recipes-containers/docker/docker.inc
>         @@ -10,7 +10,6 @@ RDEPENDS:${PN} = "util-linux util-linux-unshare
>         iptables \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'aufs', 'aufs-util', '', d)} \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', '', 'cgroup-lite',
>         d)} \
>         bridge-utils \
>         - ca-certificates \
>         "
>         RDEPENDS:${PN} += "virtual-containerd $
>         {VIRTUAL-RUNTIME_container_runtime}"
> 
>         @@ -37,10 +36,11 @@ RPROVIDES:${PN}-dev += "docker-dev"
>         RPROVIDES:${PN}-contrip += "docker-dev"
> 
>         inherit pkgconfig
>         -PACKAGECONFIG ??= "docker-init seccomp"
>         +PACKAGECONFIG ??= "docker-init seccomp ca-certs"
>         PACKAGECONFIG[seccomp] = "seccomp,,libseccomp"
>         PACKAGECONFIG[docker-init] = ",,,docker-init"
>         PACKAGECONFIG[transient-config] = "transient-config"
>         +PACKAGECONFIG[ca-certs] = ",,,ca-certificates"
> 
>         GO_IMPORT = "import"
> 
>         --
>         2.34.1
> 
> 
>         **********************************************************************
>         DISCLAIMER:
>         Privileged and/or Confidential information may be contained in this
>         message. If you are not the addressee of this message, you may not
>         copy, use or deliver this message to anyone. In such event, you should
>         destroy the message and kindly notify the sender by reply e-mail. It is
>         understood that opinions or conclusions that do not relate to the
>         official business of the company are neither given nor endorsed by the
>         company. Thank You.
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9375): https://lists.yoctoproject.org/g/meta-virtualization/message/9375
> Mute This Topic: https://lists.yoctoproject.org/mt/114864158/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


