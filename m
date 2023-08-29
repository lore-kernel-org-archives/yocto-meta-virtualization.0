Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEDDC83F15
	for <webhook@archiver.kernel.org>; Tue, 29 Aug 2023 02:09:17 +0000 (UTC)
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
 by mx.groups.io with SMTP id smtpd.web10.8835.1693274947110024439
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Aug 2023 19:09:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=pvNmbT2S;
 spf=pass (domain: gmail.com, ip: 209.85.222.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-76f08e302a1so156507485a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Aug 2023 19:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693274946; x=1693879746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WXW5SiuD9IN9gudAOzis7He+Y4FD6XDcILzoEbkgQlc=;
        b=pvNmbT2SLBZMZv4U3cpBwr8R4Ei3jzsu/GPYkDpdEF0rpB9YqnrGw4gaeamOn8mSg5
         30H6bGN14aIsc2yrXb14VnTYx0qhbz3cqf3Z5gLrOMNgTpYekPQybF0QwnxVWQGdHSJA
         8no01DOGeSCZgYXa11boC2aSS3nrZ3p9bXfwuAnKAhK6XQptjYpNQejPqmgDTYOlrF/e
         cdCs3XndG3+bUrdpjiuG9CoN4nZ0RLTGqmKyfiTHDvUhhCHl1FutPXd3pWNV6dF9k+aY
         2Mo7QX1d+0JahMbIK1Bs5945AuXFxXrrAdd21ioXrHUnSzS2xCR4PE9J6pLu/HRuXwfu
         r6JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693274946; x=1693879746;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WXW5SiuD9IN9gudAOzis7He+Y4FD6XDcILzoEbkgQlc=;
        b=Qrk8FCscPbOos/VkMskt7MaOAykRNIH6vP606q6knCqk28vBVbDNpOB6VaZ7bTMJWp
         Z6bLT2W0UG0GZ/IYNPxpYTjbySQ4WHhNOYNJ22Cgyn7KQDwqE1Dr2qIpXYWZvfvSZJrY
         JFL0MeUy5TIb4OR2Km0SCaMjhpVvCNrJSUUacAvZgCJGUBAN0O6Jf9vNKONKxEcuAcGi
         3bIfyGY5zZO9apgwWvSCo+ONZH0rDtMVup5qtg0DDBniCPJl4AcJenJ2f4J00riHiDy1
         eI08tbMkLcZsec61p7IJ3gi5tNdYmDeVzOa/HfI7P6RVmeovWRAfFoGI52XqJeIo1LoU
         HyiA==
X-Gm-Message-State: AOJu0Yyr6qqRbknZTpvwbWHEI0oDx6T0zp091+stzwNlbRXDCchGaEZ/
	oTH2ueTlVmO7+xNLK4klOc8=
X-Google-Smtp-Source: AGHT+IEDrTJw+xSCgmO2U1zYT9ywu5cjSMHj1SXXUSHGehwQcYDogUKKD3s98lM2vSTfpGJsDvVLoQ==
X-Received: by 2002:a0c:b25e:0:b0:647:38c7:2c47 with SMTP id k30-20020a0cb25e000000b0064738c72c47mr27394734qve.32.1693274946034;
        Mon, 28 Aug 2023 19:09:06 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id r16-20020a0ce290000000b0064f43efc844sm2996787qvl.32.2023.08.28.19.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 19:09:05 -0700 (PDT)
Date: Tue, 29 Aug 2023 02:09:03 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Martin Jansa <Martin.Jansa@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] cloud-init: bump SRCREV to fix
 update to 23.2.2
Message-ID: <ZO1TPyeIiXc/dJOp@gmail.com>
References: <20230828143856.549539-1-Martin.Jansa@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230828143856.549539-1-Martin.Jansa@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 29 Aug 2023 02:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8257

In message: [meta-virtualization] [PATCH] cloud-init: bump SRCREV to fix update to 23.2.2
on 28/08/2023 Martin Jansa wrote:

> * the update from
>   commit 0f1601d98f2c926a109b7beb7df21a5dfe6188d9
>   Author: Bruce Ashfield <bruce.ashfield@gmail.com>
>   Date:   Thu Aug 3 20:15:04 2023 +0000
>   Subject: cloud-init: update to 23.2.2
> 
>     Bumping cloud-init to version 23.2.2, which comprises the following commits:
> 
>         e65a715d Release 23.2.2
> 
>   was missing the SRCREV update, so it was still 23.1:
> 
>   cloud-init/v23.2.2+git/git $ git describe --tags
>   23.1-52-ge02c46079
> 
>   fix that by using the right one of the 23.2.2 tag:
> 
>   cloud-init/v23.2.2+git/git $ git show-ref -d 23.2.2
>   293c6546f038ef4da98910dfeb8d0ade65707952 refs/tags/23.2.2
>   e65a715d524456285e07ac521457424713ea4aa5 refs/tags/23.2.2^{}
> 
> * this fix also allows up to drop the patch backported from 23.2

My update scripts did something very strange with that bump.

Thanks for the catch.

This is on master-next.

Bruce


> 
> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ---
>  ...-pkg-config-for-udev-rules-path-2137.patch | 50 -------------------
>  recipes-extended/cloud-init/cloud-init_git.bb |  3 +-
>  2 files changed, 1 insertion(+), 52 deletions(-)
>  delete mode 100644 recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
> 
> diff --git a/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch b/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
> deleted file mode 100644
> index 9f3760c..0000000
> --- a/recipes-extended/cloud-init/cloud-init/0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch
> +++ /dev/null
> @@ -1,50 +0,0 @@
> -From 57752970ebea017820343aadf11b65c537bef336 Mon Sep 17 00:00:00 2001
> -From: dankm <dan.mcgregor@usask.ca>
> -Date: Fri, 28 Apr 2023 15:10:34 -0600
> -Subject: [PATCH] setup.py: use pkg-config for udev/rules path (#2137)
> -
> -Distributions other than RHEL also use /usr/lib/udev for the rules
> -path. Instead of hardcoding the udev rules path for RedHat, check
> -pkg-config for the proper location.
> -
> -Upstream-Status: Backport [23.2 https://github.com/canonical/cloud-init/commit/5abf5f5f2cf93c57ac74220251d2a2acce5f7099]
> -Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> ----
> - setup.py | 14 ++++++++------
> - 1 file changed, 8 insertions(+), 6 deletions(-)
> -
> -diff --git a/setup.py b/setup.py
> -index a6dbc5c23..66e618d3a 100644
> ---- a/setup.py
> -+++ b/setup.py
> -@@ -46,7 +46,10 @@ def pkg_config_read(library, var):
> -             "systemdsystemconfdir": "/etc/systemd/system",
> -             "systemdsystemunitdir": "/lib/systemd/system",
> -             "systemdsystemgeneratordir": "/lib/systemd/system-generators",
> --        }
> -+        },
> -+        "udev": {
> -+            "udevdir": "/lib/udev",
> -+        },
> -     }
> -     cmd = ["pkg-config", "--variable=%s" % var, library]
> -     try:
> -@@ -309,14 +312,13 @@ data_files = [
> -     ),
> - ]
> - if not platform.system().endswith("BSD"):
> --
> --    RULES_PATH = LIB
> --    if os.path.isfile("/etc/redhat-release"):
> --        RULES_PATH = "/usr/lib"
> -+    RULES_PATH = pkg_config_read("udev", "udevdir")
> -+    if not in_virtualenv():
> -+        RULES_PATH = "/" + RULES_PATH
> - 
> -     data_files.extend(
> -         [
> --            (RULES_PATH + "/udev/rules.d", [f for f in glob("udev/*.rules")]),
> -+            (RULES_PATH + "/rules.d", [f for f in glob("udev/*.rules")]),
> -             (
> -                 ETC + "/systemd/system/sshd-keygen@.service.d/",
> -                 ["systemd/disable-sshd-keygen-if-cloud-init-active.conf"],
> diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
> index b5c2d71..9d84f47 100644
> --- a/recipes-extended/cloud-init/cloud-init_git.bb
> +++ b/recipes-extended/cloud-init/cloud-init_git.bb
> @@ -7,11 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=c6dd79b6ec2130a3364f6fa9d6380408 \
>      file://LICENSE-Apache2.0;md5=3b83ef96387f14655fc854ddc3c6bd57 \
>  "
>  
> -SRCREV = "e02c4607923af64311c70ae9a06d6794355e9a61"
> +SRCREV = "293c6546f038ef4da98910dfeb8d0ade65707952"
>  SRC_URI = "git://github.com/canonical/cloud-init;branch=23.2.x;protocol=https \
>      file://cloud-init-source-local-lsb-functions.patch \
>      file://0001-setup.py-check-for-install-anywhere-in-args.patch \
> -    file://0002-setup.py-use-pkg-config-for-udev-rules-path-2137.patch \
>  "
>  
>  PV = "v23.2.2+git"
> -- 
> 2.42.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8247): https://lists.yoctoproject.org/g/meta-virtualization/message/8247
> Mute This Topic: https://lists.yoctoproject.org/mt/101011241/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


