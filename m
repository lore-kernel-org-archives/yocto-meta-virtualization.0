Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0430FCF6490
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:27:42 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20962.1763594856833204848
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:27:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k1+urL+K;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-882399d60baso2122996d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:27:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594856; x=1764199656; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eFCuYPn1h4x+v1Kv2EP5xOm4uDGpLlUFGuu0Mgn57wI=;
        b=k1+urL+KgC0wzu8V5WwElWJAsrV4PKZ7d+GOF75tAueYoizXv7V5pES+Dp+Rbd5AZ5
         olyfxeQX1Q3v4M593N+etCgbkCTTbSdmiNMJwSh2zrUbuc+NSiJEp08CGnwRrRadPA6E
         3jnmyuooiDmzDyzP9GCKb/PAimMtZPjE64xQOaU6unnXsAxbpzG5LRCh1yVleQ7P4BOX
         dZ7OrTKTFxj85M+vXYbFn/Kfr+WsqBmllhwOURC2WYsCkTDbhnzff4VrD3jueKoXWZd1
         K8bSchU9DU3HooxMn1f1QbQ+56OZu/T5KDiUM5X4YiQ669FeIt3vgErZ3rny5DzY8weA
         ailA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594856; x=1764199656;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eFCuYPn1h4x+v1Kv2EP5xOm4uDGpLlUFGuu0Mgn57wI=;
        b=C7+s59P0wBFkvBtzLfihw6vUAzRIcB7YiPHW22ZrhBUpNSTGqFqI2t9/++VS42MVB9
         bM6FgI7qzpQ6nI5nKXaVcTwFOnQ28hTBQYosulZyI0+k75ZH12iaCFqycY8nFMJ+Soy9
         t/iZ0pXLBhPeFR6tYDrLvuW+GTC/T6Y9xFuytxZtAqOcFMFpZzs2RYXugJRMZxizB+oZ
         NfkjrjxFm/kzZRF9rTNe/uM5bYhcYbl/LNxkQC5JWR5jyDoKtvUYFcQtlP8/DwLlf2+d
         h+0ZmtMXEyb4SeMZoeH47lbVrUBNowFlyiWzC8xO8qqAq6pKhL9B3YHeFhXWIfs8ZnK/
         HuAQ==
X-Gm-Message-State: AOJu0Yw2jzqaRWXfmdaNBuJFgyBidSTIP56DjA5Z9Y8kBgaDCmlnEf92
	UC+PUz5+yGCtM0cJn1uPcXG7rlaaVI8cZlfLvXJMtW0qvtdS7US+rvaK
X-Gm-Gg: ASbGncsx/4WNkCAfmO3i7ttXsDaVh1jkFc9T9qE5oqeggnRykWVf25DACRPoLUAAWak
	cUtpAvYV7fQpDNXgc6UQVTd3dlMOfGvGWPPr6CK6GlByJyUBb69XZhH71PUh/onVCYosO631ucD
	J7Wm/996UuWEmE892qUVeVvDh9HcjHhWTrAhud0CU2859jPLaoaKIV3pWghnPsdLqUCWwL5/At1
	ACpSDuhqdPt7OJIAw0bu5pLavL/eC0fAJwXM10zS3qa+FcTXGkVzTTj4coyJn7dyyznb4K7hFpW
	whmm8pvrR6K9cc9eV8OnidGWRlttxbv0ABtqPf3T2uPUSdAXM/qgvfQDS8cfSL0AiJLe54gWwwF
	bnGT0BYv3/DS5rnXpa9Krsd2nz85uaWVX7SCGbNkt8hkL0N2apqvP8Flt2wPHrurjZvK/6UVPP4
	+ieTNo0LrxEHyexvy4vqb4GsfeaGUKJaveQRpfEmWsA5LQNdJWLB8q606i7ytcJefW
X-Google-Smtp-Source: AGHT+IHj2x0QWhdL8nCn3jkkwmN6Ilu9WZgYC4GZDfLBSzza4g+1rSChpChIvlexcqZo/GD1HD0PPg==
X-Received: by 2002:a05:6214:2482:b0:880:2b54:2b91 with SMTP id 6a1803df08f44-8846e11d9edmr18970616d6.36.1763594855774;
        Wed, 19 Nov 2025 15:27:35 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8846e5744ddsm5453316d6.45.2025.11.19.15.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:27:35 -0800 (PST)
Date: Wed, 19 Nov 2025 18:27:33 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-vitualization][scarthgap][patch]
 cloud-init: Fix CVE-2024-11584
Message-ID: <aR5SZfdYLYwGp+Jq@gmail.com>
References: <20251111084102.149727-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111084102.149727-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:27:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9447

merged.

Bruce

In message: [meta-virtualization] [meta-vitualization][scarthgap][patch] cloud-init: Fix CVE-2024-11584
on 11/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> import patch from debian to fix
>  CVE-2024-11584
> 
> Upstream-Status: Backport [import from debian 22.4.2-1+deb12u3
> Upstream commit
> https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../cloud-init/CVE-2024-11584.patch           | 104 ++++++++++++++++++
>  recipes-extended/cloud-init/cloud-init_git.bb |   1 +
>  2 files changed, 105 insertions(+)
>  create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> 
> diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> new file mode 100644
> index 00000000..fa94ff53
> --- /dev/null
> +++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> @@ -0,0 +1,104 @@
> +From 8b45006c4765fd75f20ce244571b563dbc49d4f2 Mon Sep 17 00:00:00 2001
> +From: James Falcon <therealfalcon@gmail.com>
> +Date: Wed, 11 Jun 2025 16:22:32 -0500
> +Subject: [PATCH] fix: Make hotplug socket writable only by root (#25)
> +
> +The 'hook-hotplug-cmd' was writable by all users, allowing any user
> +to trigger the hotplug hook script. This script should only be run
> +by root via a udev trigger.
> +
> +Also move socket into 'share' directory and update references
> +accordingly. Since the 'share' directory is only readable by root,
> +this adds another layer of security while also being in a consistent
> +location with the other sockets used by cloud-init.
> +
> +CVE-2024-11584
> +
> +Upstream-Status: Backport [import from debain 22.4.2-1+deb12u3
> +Upstream commit https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]
> +CVE: CVE-2024-11584
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + cloudinit/cmd/devel/logs.py         | 4 +---
> + systemd/cloud-init-hotplugd.service | 2 +-
> + systemd/cloud-init-hotplugd.socket  | 5 +++--
> + tools/cloud-init-hotplugd           | 2 +-
> + tools/hook-hotplug                  | 2 +-
> + 5 files changed, 7 insertions(+), 8 deletions(-)
> +
> +diff --git a/cloudinit/cmd/devel/logs.py b/cloudinit/cmd/devel/logs.py
> +index 83f574c10..f59e8047c 100755
> +--- a/cloudinit/cmd/devel/logs.py
> ++++ b/cloudinit/cmd/devel/logs.py
> +@@ -139,9 +139,7 @@ def get_parser(parser=None):
> + 
> + def _copytree_rundir_ignore_files(curdir, files):
> +     """Return a list of files to ignore for /run/cloud-init directory"""
> +-    ignored_files = [
> +-        "hook-hotplug-cmd",  # named pipe for hotplug
> +-    ]
> ++    ignored_files = []
> +     if os.getuid() != 0:
> +         # Ignore root-permissioned files
> +         ignored_files.append(Paths({}).lookups["instance_data_sensitive"])
> +diff --git a/systemd/cloud-init-hotplugd.service b/systemd/cloud-init-hotplugd.service
> +index 0aeeeaff5..e3a5a74d9 100644
> +--- a/systemd/cloud-init-hotplugd.service
> ++++ b/systemd/cloud-init-hotplugd.service
> +@@ -1,5 +1,5 @@
> + # Paired with cloud-init-hotplugd.socket to read from the FIFO
> +-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
> ++# hook-hotplug-cmd which is created during a udev network
> + # add or remove event as processed by 90-cloud-init-hook-hotplug.rules.
> + 
> + # On start, read args from the FIFO, process and provide structured arguments
> +diff --git a/systemd/cloud-init-hotplugd.socket b/systemd/cloud-init-hotplugd.socket
> +index acf53f12c..00ad5dead 100644
> +--- a/systemd/cloud-init-hotplugd.socket
> ++++ b/systemd/cloud-init-hotplugd.socket
> +@@ -1,5 +1,5 @@
> + # cloud-init-hotplugd.socket listens on the FIFO file
> +-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
> ++# hook-hotplug-cmd which is created during a udev network
> + # add or remove event as processed by 90-cloud-init-hook-hotplug.rules.
> + 
> + # Known bug with an enforcing SELinux policy: LP: #1936229
> +@@ -7,7 +7,8 @@
> + Description=cloud-init hotplug hook socket
> + 
> + [Socket]
> +-ListenFIFO=/run/cloud-init/hook-hotplug-cmd
> ++ListenFIFO=/run/cloud-init/share/hook-hotplug-cmd
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=cloud-init.target
> +diff --git a/tools/cloud-init-hotplugd b/tools/cloud-init-hotplugd
> +index 70977d48e..3d56fffa7 100755
> +--- a/tools/cloud-init-hotplugd
> ++++ b/tools/cloud-init-hotplugd
> +@@ -9,7 +9,7 @@
> + # upon a network device event). Anything received via the pipe is then
> + # passed on via the "cloud-init devel hotplug-hook handle" command.
> + 
> +-PIPE="/run/cloud-init/hook-hotplug-cmd"
> ++PIPE="/run/cloud-init/share/hook-hotplug-cmd"
> + 
> + mkfifo -m700 $PIPE
> + 
> +diff --git a/tools/hook-hotplug b/tools/hook-hotplug
> +index 3085ba86d..f7d530d1c 100755
> +--- a/tools/hook-hotplug
> ++++ b/tools/hook-hotplug
> +@@ -10,7 +10,7 @@ is_finished() {
> + 
> + if is_finished; then
> +     # open cloud-init's hotplug-hook fifo rw
> +-    exec 3<>/run/cloud-init/hook-hotplug-cmd
> ++    exec 3<>/run/cloud-init/share/hook-hotplug-cmd
> +     env_params=" \
> +         --subsystem=${SUBSYSTEM} \
> +         handle \
> +-- 
> +2.43.0
> +
> diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
> index 4cf74efd..66462a51 100644
> --- a/recipes-extended/cloud-init/cloud-init_git.bb
> +++ b/recipes-extended/cloud-init/cloud-init_git.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=24.1.x;protocol=https \
>      file://cloud-init-source-local-lsb-functions.patch \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
>      file://CVE-2024-6174.patch \
> +    file://CVE-2024-11584.patch \
>  "
>  
>  PV = "v23.4.1+git"
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9438): https://lists.yoctoproject.org/g/meta-virtualization/message/9438
> Mute This Topic: https://lists.yoctoproject.org/mt/116235519/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


