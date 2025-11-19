Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA0FCF6494
	for <webhook@archiver.kernel.org>; Wed, 19 Nov 2025 23:29:22 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.20865.1763594953102832186
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Nov 2025 15:29:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LD9ekEHy;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2dec4d115so29335885a.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 15:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763594952; x=1764199752; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pn63MJVMwx3bC757bxpFN0smqc9iPHTAK1E58Oz8jXQ=;
        b=LD9ekEHy3Z6XGvWO3RmDorfiE1nEwy6cL1IJj7ZMu+4xQ1zQM9J9aRWBnGBNkORA/d
         Ob+Fq9VzHT2yAr8/kmcYai/0/yQfNrwkRECNMG5uD/zsZkrIuwQBOmTeFmpOgvWarse1
         DuRldBAujfuCq9/nWZDa6m4q65wRtejnyTihhX98iiBe4P+aqEZ7AnK7G+Zcp/yEqcVA
         MRsq6BV1BNwiBP8f2uQRB89X0o53CujRiN9GsRQPJk5xZuW9HCU4E45GxzjsKLv376ok
         a3O7G5bqP78fj7nq1EI3lrRSEVcOrMIpHNX+ryxYp3a9OrRFi/kyOlIPMwY08JrCZETb
         7aVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763594952; x=1764199752;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pn63MJVMwx3bC757bxpFN0smqc9iPHTAK1E58Oz8jXQ=;
        b=kKCMQZ6nQ4TNarnuTv5UgRr4XhnHyLqrEFv9ek6sPNno6FR0b9ZOUCDrarYkHMyx0j
         XJUtsGZkbx2MA7+b+dH6441JE1e/zMZN1Srni7KBFNIan8+oIBKaHrkwZ8ZJqcz7dZ8P
         kZJ890oakXB3CL6ZOrMpmFS2KsNXj8aUaQ6Ft7667iNXvyyL5lt1q1tnN3qhRnB8XM3m
         UCPw9NPtrSC6a8U5+b+QsdZZ8J8FV+NqRjazWieKUPFQcSce9onN7BRapy5gf3Cw4bZX
         WC3dWZ4VLjV7vsZNaEJjGiKxsGEb92EggIdG0SzJRuLhzL8sS3wveAREpPhSPNkBmBiH
         Ljvg==
X-Gm-Message-State: AOJu0Yzs85GncCeCBTFnm5JzRumZf1vqCh/Xl4zd/93pxLBMZOJoNXLr
	4o3cmlpRh0iYhvRBk1Jd9BD4zzobG/jZMpWjXxSe6DkMHBQ4EanHm7efzOf6JoSO
X-Gm-Gg: ASbGncu5u8bagYZ6txIbZoIqPmWNERrbl00vs2+RCsQ9MdZs74Zvj6QQjr/itreCpKz
	iaudrX4Er9DEN+TdSuh9RfzuZN1XMSv6n5XBc/dSUsMEJgMdsvFN2lNzoifLfP7lsQEPPC6wQA0
	Y0KDnslOt6oBWDaGTA7Qcme3gbUUTWV7aPZvnAKwY1y7jHrAWTNIw9yP+2rYgZI3peZiSvYTI9+
	ccwdW0RnyDvsXw8q57IuuYN3UGGsXxR5c893dsiAYW/3+3lyDTuSVC8vEmEyJIS+yIYF5WcAzb8
	QIXGbPJFUNt6ues3DWbECe78IhTvXeS454FB47JTLr9fyj039Tgb7yOXt6n4n7UnXC1dkYY29tn
	2HWnVq0P5it7BuyacuXa8n2/27d60t0YqsB36FpPNDfz3DtuuPkAnaB+hqw+HdOPVYGvMQi1+/i
	+Ds9DwnMALwFsXEk2Erz0OtDtSNc7Q2Gtf1Ik4YSmgPI50+KgBZhSq1VBfhzbV7CgMbZcw1tf4j
	xk=
X-Google-Smtp-Source: AGHT+IFq2UItbpPPkDCxdilqbeuIdtYcsRjcMh4BD2iTIm4ekvakj4y/Acf05qGIzYqSP4/9veYtVg==
X-Received: by 2002:a05:620a:258e:b0:8b2:ea5a:414d with SMTP id af79cd13be357-8b32749fed5mr155399685a.66.1763594951939;
        Wed, 19 Nov 2025 15:29:11 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b3294336e4sm45551585a.21.2025.11.19.15.29.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 15:29:11 -0800 (PST)
Date: Wed, 19 Nov 2025 18:29:09 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: vanusuri@mvista.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] cloud-init: Fix
 CVE-2024-11584
Message-ID: <aR5SxVG6P97W+3pD@gmail.com>
References: <20251113142617.2403672-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251113142617.2403672-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 19 Nov 2025 23:29:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9450

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] cloud-init: Fix CVE-2024-11584
on 13/11/2025 Vijay Anusuri via lists.yoctoproject.org wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> import patch from debian to fix
>  CVE-2024-11584
> 
> Upstream-Status: Backport [import from debian 22.4.2-1+deb12u3
> Upstream commit
> https://github.com/canonical/cloud-init/commit/8b45006c4765fd75f20ce244571b563dbc49d4f2]
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../cloud-init/CVE-2024-11584.patch           | 95 +++++++++++++++++++
>  .../cloud-init/cloud-init_21.4.bb             |  1 +
>  2 files changed, 96 insertions(+)
>  create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> 
> diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> new file mode 100644
> index 00000000..aba34a0a
> --- /dev/null
> +++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-11584.patch
> @@ -0,0 +1,95 @@
> +From 4839736429e9057a309ccd835cb3159fb51b1353 Mon Sep 17 00:00:00 2001
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
> + systemd/cloud-init-hotplugd.service | 5 +++--
> + systemd/cloud-init-hotplugd.socket  | 8 +++++---
> + tools/hook-hotplug                  | 2 +-
> + 4 files changed, 10 insertions(+), 9 deletions(-)
> +
> +diff --git a/cloudinit/cmd/devel/logs.py b/cloudinit/cmd/devel/logs.py
> +index d54b809ac..0830610d4 100644
> +--- a/cloudinit/cmd/devel/logs.py
> ++++ b/cloudinit/cmd/devel/logs.py
> +@@ -67,9 +67,7 @@ def get_parser(parser=None):
> + 
> + def _copytree_rundir_ignore_files(curdir, files):
> +     """Return a list of files to ignore for /run/cloud-init directory"""
> +-    ignored_files = [
> +-        "hook-hotplug-cmd",  # named pipe for hotplug
> +-    ]
> ++    ignored_files = []
> +     if os.getuid() != 0:
> +         # Ignore root-permissioned files
> +         ignored_files.append(INSTANCE_JSON_SENSITIVE_FILE)
> +diff --git a/systemd/cloud-init-hotplugd.service b/systemd/cloud-init-hotplugd.service
> +index b64632efe..65243ff16 100644
> +--- a/systemd/cloud-init-hotplugd.service
> ++++ b/systemd/cloud-init-hotplugd.service
> +@@ -1,6 +1,7 @@
> + # Paired with cloud-init-hotplugd.socket to read from the FIFO
> +-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
> +-# add or remove event as processed by 10-cloud-init-hook-hotplug.rules.
> ++# /run/cloud-init/share/hook-hotplug-cmd which is created during a
> ++# udev network add or remove event as processed by
> ++# 10-cloud-init-hook-hotplug.rules.
> + 
> + # On start, read args from the FIFO, process and provide structured arguments
> + # to `cloud-init devel hotplug-hook` which will setup or teardown network
> +diff --git a/systemd/cloud-init-hotplugd.socket b/systemd/cloud-init-hotplugd.socket
> +index aa0930163..db83a65b2 100644
> +--- a/systemd/cloud-init-hotplugd.socket
> ++++ b/systemd/cloud-init-hotplugd.socket
> +@@ -1,13 +1,15 @@
> + # cloud-init-hotplugd.socket listens on the FIFO file
> +-# /run/cloud-init/hook-hotplug-cmd which is created during a udev network
> +-# add or remove event as processed by 10-cloud-init-hook-hotplug.rules.
> ++# /run/cloud-init/share/hook-hotplug-cmd which is created during a
> ++# udev network add or remove event as processed by
> ++# 10-cloud-init-hook-hotplug.rules.
> + 
> + # Known bug with an enforcing SELinux policy: LP: #1936229
> + [Unit]
> + Description=cloud-init hotplug hook socket
> + 
> + [Socket]
> +-ListenFIFO=/run/cloud-init/hook-hotplug-cmd
> ++ListenFIFO=/run/cloud-init/share/hook-hotplug-cmd
> ++SocketMode=0600
> + 
> + [Install]
> + WantedBy=cloud-init.target
> +diff --git a/tools/hook-hotplug b/tools/hook-hotplug
> +index 35bd3da27..2a2ed4813 100755
> +--- a/tools/hook-hotplug
> ++++ b/tools/hook-hotplug
> +@@ -10,7 +10,7 @@ is_finished() {
> + 
> + if is_finished; then
> +     # open cloud-init's hotplug-hook fifo rw
> +-    exec 3<>/run/cloud-init/hook-hotplug-cmd
> ++    exec 3<>/run/cloud-init/share/hook-hotplug-cmd
> +     env_params=(
> +         --subsystem="${SUBSYSTEM}"
> +         handle
> +-- 
> +2.25.1
> +
> diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
> index 02a89a58..46c0d29a 100644
> --- a/recipes-extended/cloud-init/cloud-init_21.4.bb
> +++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
> @@ -10,6 +10,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
>      file://0001-setup.py-respect-udevdir-variable.patch \
>      file://CVE-2024-6174.patch \
> +    file://CVE-2024-11584.patch \
>  "
>  
>  S = "${WORKDIR}/git"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9439): https://lists.yoctoproject.org/g/meta-virtualization/message/9439
> Mute This Topic: https://lists.yoctoproject.org/mt/116274711/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


