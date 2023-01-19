Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5552FC004D4
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 20:43:03 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.57018.1674160977295769160
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 19 Jan 2023 12:42:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XBoYQJYW;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id n2so2372773qvo.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 12:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Bdf06fJUJgfvGXmq6XR/IAhTw35Sscw6Q7pb6rV9tvQ=;
        b=XBoYQJYWwwgcLF1/qtwU2eLZ7aCZgBajy+UCy3/vYySDXGM4OtNg1VrFzAs/pmzY2s
         DrFLUTzVfwfKnx+5x34ir6zD+uhBe/xrtUcnGoqQCbGKqlnFd9z4+oJzykLl24LugSd4
         rq9rmnVoAOlQASgsQOT8EC8bVWRV0KEOAEi6eF9yh5uJlU6gdvh35MliR2NmSldTZLf6
         gRAobXGXA5PxoNqc6d1a5JUuyZJXIzr0OzfRNenDfAbsscXQ6EyonpP3jeKIZOIqWhlT
         0Tqcz7Wol57uc9dSZFIXx9PTAbM15hq1XhOQR77MGHUW5QX/IsVJpP0obcqPJDa35y+8
         Thdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bdf06fJUJgfvGXmq6XR/IAhTw35Sscw6Q7pb6rV9tvQ=;
        b=P3q3LDl1wv6K2ERBawkZG6m4Mn+HkrdSniRh3R3C+MlAnP82KvedOBsI3y1vMqsNQw
         YXvQuLSkObJ8f4cJQuNe1LlKcvayGP1rpbX3mZBKygZYy1RniHo1j5VtBXaUxx1PqswB
         J05VV+N1MMUZGcAMRAhakysev2Ltmic0zYNq6OVlqCJyUmm1zGBWn4Gm3uMG0rr3k8XA
         JQ4ufgol+ux5c++1VPifq5M4ekJXTQ7U2JZklZlib0VmoKrl5HXaPLe3pjDjq3FM8ZTr
         tSYRLHOFCKvTuWVmNObSkKCrJJFX6CFlx1V61B2xXZT4TvOTU/mpRgiRdDLItP5LZt/N
         rKYg==
X-Gm-Message-State: AFqh2krJBhfc9qPT6h9U9TwN7/bFhsQYfAXz20hMGfzqfDnzpyhCkdJq
	hsKdX3nZ/D6BkNoa3CeGvY2XQJVrrdL32Q==
X-Google-Smtp-Source: AMrXdXsDZgZj+4rfBEBP48lDJqzCSq4clICa6mjKGpYlxlkjE2nYlOE4QDwTZeTtjajc6mu6vTaIng==
X-Received: by 2002:ad4:5507:0:b0:535:5492:b43d with SMTP id pz7-20020ad45507000000b005355492b43dmr4205706qvb.46.1674160976189;
        Thu, 19 Jan 2023 12:42:56 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id x6-20020a05620a448600b0070736988c10sm2723842qkp.110.2023.01.19.12.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 12:42:55 -0800 (PST)
Date: Thu, 19 Jan 2023 15:42:52 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][master][langdale][PATCH] lxc: backport
 patch to fix CVE-2022-47952
Message-ID: <Y8mrTMyrUGSrPXMX@gmail.com>
References: <20230118013705.2354105-1-xiangyu.chen@eng.windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230118013705.2354105-1-xiangyu.chen@eng.windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 19 Jan 2023 20:43:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7823

merged to langdale, but master is a git based recipe, so we
should just be bumping the version/SRCREV.

I've taken care of that version bump for master.

Bruce

In message: [meta-virtualization][master][langdale][PATCH] lxc: backport patch to fix CVE-2022-47952
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
> index 9cabe05..a99d7ee 100644
> --- a/recipes-containers/lxc/lxc_git.bb
> +++ b/recipes-containers/lxc/lxc_git.bb
> @@ -47,6 +47,7 @@ SRC_URI = "git://github.com/lxc/lxc.git;branch=master;protocol=https \
>  	file://0001-use-sd_bus_call_method_async-to-replace-the-asyncv-o.patch \
>  	file://dnsmasq.conf \
>  	file://lxc-net \
> +	file://0001-Patching-an-incoming-CVE-CVE-2022-47952.patch \
>  	"
>  
>  SRCREV = "133aa416ca2a5996090ec0e697e253646364d274"
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7816): https://lists.yoctoproject.org/g/meta-virtualization/message/7816
> Mute This Topic: https://lists.yoctoproject.org/mt/96345640/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


