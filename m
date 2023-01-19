Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378B5C46467
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 20:14:43 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.56159.1674159277668592286
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 12:14:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L9gQeDfc;
 spf=pass (domain: gmail.com, ip: 209.85.160.177, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id e8so2518903qts.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 12:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=klsGCbK78hDQtaXisNfhp0E8A+z6zXQDt/QYgHgtE14=;
        b=L9gQeDfcM1UxMUZd3kU8qiUqpPM8rZbnqrOqigHseZZUHJtpnkbCUK1T7p8/DOysNN
         EsgFnLsZmqcRIPxxgAG1t1YJELhNcJILt/CEjprhfagPRiQvLXfVZx+X/fcnU1J0pK4l
         itcZoWN59kdOQlrC+d1wsFtp/9fdp/ffNgAJ+4EdJHZLcPIJCYwewgcTsJfnq2Pumy+O
         4yJk1g00EIzJiJ1lpvtdhTXX2U3TbkkNwmVKZ1m6Ru8HgHQu6e1y2F10ktX3YanH2TUY
         Sty/+3f8TFKlAlnLpFls2BvWk5IZqNAMfhEIrGJWtB2LdSB8bMt/mxGbFJ9BiShgM3Xt
         jBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klsGCbK78hDQtaXisNfhp0E8A+z6zXQDt/QYgHgtE14=;
        b=q6/pV74gx/6gZ39oh6IAVz1fKOHzDQ0Fac2cYrJ4gAT+G1kEKnEV60HJ7P9KKlZ6wc
         sb5a8jpU9Z1LoXB9aIB+O85Rhfa2eVuhTl0cGOEUEMj0pUWLRlq/HtCHorcAv27Q9x1b
         5osYmIysg/p3LN6ivfKMUNw9QbCrroPpkHlhbLt4AhLnmpk73Qge50uqS+qlWbVb69sL
         boxO+hMMo/tt+QVYAGmPC8FG8/KiYnE0bHcNuiprEHf170/HV9RS+MICslUBInHjwBKr
         tedDMpcxICSvdrKqy9nkWV/nmLv+rAlvts053JMAT8ken7xByQxlA8oZPvTB+KY0tXA8
         vNbw==
X-Gm-Message-State: AFqh2krIIXN8aXzPKGsl18zgxPzeJx2Lz8CXKDGCWn837T67trSdPEpe
	KYuuA0xs7vzqzF0tTvFH5ldFX3KxLXy1Vg==
X-Google-Smtp-Source: AMrXdXt0NAqOtMKqFRHUzwGcWzI8kSoxTxsNIOLEe8cC7a09nqcoaPhkTC3QTzdYqQbWRrV0kMwKeg==
X-Received: by 2002:ac8:6eda:0:b0:3a7:e110:81e5 with SMTP id f26-20020ac86eda000000b003a7e11081e5mr15681226qtv.53.1674159276660;
        Thu, 19 Jan 2023 12:14:36 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id c8-20020ac80548000000b003972790deb9sm19255788qth.84.2023.01.19.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:14:36 -0800 (PST)
Date: Thu, 19 Jan 2023 15:14:34 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH] lxc: backport patch to
 fix CVE-2022-47952
Message-ID: <Y8mkqs6s44JndPP5@gmail.com>
References: <20230118012927.2347896-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118012927.2347896-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:14:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7822

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH] lxc: backport patch to fix CVE-2022-47952
on 18/01/2023 Xiangyu Chen wrote:

> From: Xiangyu Chen <xiangyu.chen@windriver.com>
> 
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  ...ching-an-incoming-CVE-CVE-2022-47952.patch | 76 +++++++++++++++++++
>  recipes-containers/lxc/lxc_git.bb             |  1 +
>  2 files changed, 77 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
> 
> diff --git a/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
> new file mode 100644
> index 0000000..d5a02f4
> --- /dev/null
> +++ b/recipes-containers/lxc/files/0001-Patching-an-incoming-CVE-CVE-2022-47952.patch
> @@ -0,0 +1,76 @@
> +From 1b0469530d7a38b8f8990e114b52530d1bf7f3b8 Mon Sep 17 00:00:00 2001
> +From: Maher Azzouzi <maherazz04@gmail.com>
> +Date: Sun, 25 Dec 2022 13:50:25 +0100
> +Subject: [PATCH] Patching an incoming CVE (CVE-2022-47952)
> +
> +lxc-user-nic in lxc through 5.0.1 is installed setuid root, and may
> +allow local users to infer whether any file exists, even within a
> +protected directory tree, because "Failed to open" often indicates
> +that a file does not exist, whereas "does not refer to a network
> +namespace path" often indicates that a file exists. NOTE: this is
> +different from CVE-2018-6556 because the CVE-2018-6556 fix design was
> +based on the premise that "we will report back to the user that the
> +open() failed but the user has no way of knowing why it failed";
> +however, in many realistic cases, there are no plausible reasons for
> +failing except that the file does not exist.
> +
> +PoC:
> +> % ls /l
> +> ls: cannot open directory '/l': Permission denied
> +> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/tt h h
> +> cmd/lxc_user_nic.c: 1096: main: Failed to open "/l/h/tt" <----- file does not exist.
> +> % /usr/lib/x86_64-linux-gnu/lxc/lxc-user-nic delete lol lol /l/h/t h h
> +> cmd/lxc_user_nic.c: 1101: main: Path "/l/h/t" does not refer to a network namespace path <---- file exist!
> +
> +Upstream-Status: Backport from https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8
> +CVE: CVE-2022-47952
> +
> +Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
> +Acked-by: Serge Hallyn <serge@hallyn.com>
> +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> +---
> + src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
> +index a91e2259d..69bc6f17d 100644
> +--- a/src/lxc/cmd/lxc_user_nic.c
> ++++ b/src/lxc/cmd/lxc_user_nic.c
> +@@ -1085,20 +1085,17 @@ int main(int argc, char *argv[])
> + 	} else if (request == LXC_USERNIC_DELETE) {
> + 		char opath[LXC_PROC_PID_FD_LEN];
> + 
> +-		/* Open the path with O_PATH which will not trigger an actual
> +-		 * open(). Don't report an errno to the caller to not leak
> +-		 * information whether the path exists or not.
> +-		 * When stracing setuid is stripped so this is not a concern
> +-		 * either.
> +-		 */
> ++		// Keep in mind CVE-2022-47952: It's crucial not to leak any
> ++		// information whether open() succeeded of failed.
> ++
> + 		netns_fd = open(args.pid, O_PATH | O_CLOEXEC);
> + 		if (netns_fd < 0) {
> +-			usernic_error("Failed to open \"%s\"\n", args.pid);
> ++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
> + 			_exit(EXIT_FAILURE);
> + 		}
> + 
> + 		if (!fhas_fs_type(netns_fd, NSFS_MAGIC)) {
> +-			usernic_error("Path \"%s\" does not refer to a network namespace path\n", args.pid);
> ++			usernic_error("Failed while opening netns file for \"%s\"\n", args.pid);
> + 			close(netns_fd);
> + 			_exit(EXIT_FAILURE);
> + 		}
> +@@ -1112,7 +1109,7 @@ int main(int argc, char *argv[])
> + 		/* Now get an fd that we can use in setns() calls. */
> + 		ret = open(opath, O_RDONLY | O_CLOEXEC);
> + 		if (ret < 0) {
> +-			CMD_SYSERROR("Failed to open \"%s\"\n", args.pid);
> ++			CMD_SYSERROR("Failed while opening netns file for \"%s\"\n", args.pid);
> + 			close(netns_fd);
> + 			_exit(EXIT_FAILURE);
> + 		}
> +-- 
> +2.34.1
> +
> diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc_git.bb
> index cecb591..71dce7d 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -48,6 +48,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=stable-4.0;protocol=https \
>  	file://tests-our-init-is-not-busybox.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
> +	file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
>  	"
>  
>  SRCREV = "5ba5725cb4a210c25707beeca64fde5f561d1c71"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7815): https://lists.yoctoproject.org/g/meta-virtualization/message/7815
> Mute This Topic: https://lists.yoctoproject.org/mt/96345539/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


