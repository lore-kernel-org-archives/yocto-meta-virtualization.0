Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D943DC61DA3
	for <webhook@archiver.kernel.org>; Tue, 21 Feb 2023 15:19:37 +0000 (UTC)
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.web10.44507.1676992774729278605
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 21 Feb 2023 07:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=n2g+ilbi;
 spf=pass (domain: gmail.com, ip: 209.85.160.172, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f172.google.com with SMTP id ay9so4467861qtb.9
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 07:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S/SUeQYSlWIv1VHo2xVOPSUYYPn7EDCNjlKUqFZ/x7w=;
        b=n2g+ilbi/JfZ2DcESk8s8pSCrFAiezDRZ2W+17gpebptSKf9vYeujp6mH9ZM9tcD5p
         F9jRQG3p6ys8pag6ETKHTm2K9Zj352xxC0UacvOUoeyLDsJe5RakM1a5iyZn120tBJNu
         Gb0GmX7akmTrpNIxa644oVve8SCULYs5MM4abbTv7SteqMLqr9qDDF1RdTn/wyjhV3il
         Rtq91BFh+PIL1DEZI/HACdmJdoSKJX0HUokLX8AqUTY/NbB+QgoKITrmTP66GTqjGNxt
         Eo0vlO/KzG3rvZUbQNtsRd/k8l8UlC3Ew1x3Cmxsf2SZB1F2CskRm3qtOjAV4Hpm6aqf
         GAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/SUeQYSlWIv1VHo2xVOPSUYYPn7EDCNjlKUqFZ/x7w=;
        b=O+S+7xurbBmdaGNP/z3p15YxzXjlY8T4adn1G1ewQ6p+yIzZmPN20YwZf+BRBHbaVh
         wjIyXgdB0rmJG5WsZk5Kuw0HTi3C30lPd2y3rfwFWvT31jq2ec+wiGh8a3o1tUJXcHbc
         KaMv0a7eoEYF981pKIj6vk8R79aJZo8lJKsPIICnXkyaNGki482WYLMHhCeb2k9GyoYZ
         47u3p6owC2dmkeDmLAIoUP1fW2JtOshyooWK2IQEg6KNh3wQ6lVUzWjX/GLL8yZztqFl
         nSrmiHggR3hH555SmudzTJzlp8vn8sIla3mr4l/4n+/p89rdbxxkbSWoNrHVcys3fs7/
         rMaA==
X-Gm-Message-State: AO0yUKX4WA/Y7jm+EsfLhvu3oblTcjFBubNtErqyRJsf7CWuvolw5Icn
	Pp8VCUnK2kvVcfRBIrcy4NA=
X-Google-Smtp-Source: AK7set/LmqdUGTRG0UwY9Qh4GkQeF6QtFlWo/pfbR7nbatsjy8kzmx6aTeaAA2f2T0KeNHxl7Nl95A==
X-Received: by 2002:a05:622a:488:b0:3b6:3b60:e0 with SMTP id p8-20020a05622a048800b003b63b6000e0mr6850728qtx.31.1676992773250;
        Tue, 21 Feb 2023 07:19:33 -0800 (PST)
Received: from gmail.com (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id o16-20020ac84290000000b003b63b8df24asm2500388qtl.36.2023.02.21.07.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 07:19:32 -0800 (PST)
Date: Tue, 21 Feb 2023 10:19:30 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bhabu Bindu <bindudaniel1996@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, virendrak@kpit.com,
	akash.hadke@kpit.com, Omkar Patil <omkar.patil@kpit.com>
Subject: Re: [meta-virtualization][dunfell][PATCH] lxc: Fix CVE-2022-47952
Message-ID: <Y/ThAuqvluHZM+/x@gmail.com>
References: <20230220063904.32127-1-bindudaniel1996@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230220063904.32127-1-bindudaniel1996@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Feb 2023 15:19:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7889

There are newer 4.0.x releases of LXC available.

We should confirm that they address this CVE, and do an update,
versus a single patch.

Also, when sending a CVE fix for a stable/maintained branch,
we also need to indicate that the CVE is already covered by
the newer versions of the package on those branches (since
we don't only want to fix a CVE on an older branch).

This came in three times .. I'm dropping all three from my
queue and will wait to hear about the 4.0.12+ version bump.

Bruce

In message: [meta-virtualization][dunfell][PATCH] lxc: Fix CVE-2022-47952
on 20/02/2023 Bhabu Bindu wrote:

> From: Omkar Patil <omkar.patil@kpit.com>
> 
> lxc-user-nic install setuid root, and may allow local users to infer
> whether any file exists, even within a protected directory tree, because
> “Failed to open” often indicates that a file does not exist, whereas
> “does not refer to a network namespace path” often indicates that a file
> exists.
> 
> Reference: https://bugs.launchpad.net/ubuntu/+source/lxc/+bug/1783591
> 
> Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> ---
>  .../lxc/files/CVE-2022-47952.patch            | 74 +++++++++++++++++++
>  recipes-containers/lxc/lxc_4.0.9.bb           |  1 +
>  2 files changed, 75 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/CVE-2022-47952.patch
> 
> diff --git a/recipes-containers/lxc/files/CVE-2022-47952.patch b/recipes-containers/lxc/files/CVE-2022-47952.patch
> new file mode 100644
> index 0000000..eca2ad6
> --- /dev/null
> +++ b/recipes-containers/lxc/files/CVE-2022-47952.patch
> @@ -0,0 +1,74 @@
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
> +Signed-off-by: MaherAzzouzi <maherazz04@gmail.com>
> +Acked-by: Serge Hallyn <serge@hallyn.com>
> +
> +Upstream-Status: Backport [https://github.com/lxc/lxc/commit/1b0469530d7a38b8f8990e114b52530d1bf7f3b8]
> +CVE: CVE-2022-47952
> +Comment: No Hunk refreshed
> +Signed-off-by: Virendra Thakur <virendrak@kpit.com>
> +---
> + src/lxc/cmd/lxc_user_nic.c | 15 ++++++---------
> + 1 file changed, 6 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/lxc/cmd/lxc_user_nic.c b/src/lxc/cmd/lxc_user_nic.c
> +index a91e2259d5..69bc6f17d1 100644
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
> diff --git a/recipes-containers/lxc/lxc_4.0.9.bb b/recipes-containers/lxc/lxc_4.0.9.bb
> index f7cab78..7240589 100644
> --- a/recipes-containers/lxc/lxc_4.0.9.bb
> +++ b/recipes-containers/lxc/lxc_4.0.9.bb
> @@ -55,6 +55,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}/${BPN}-${PV}.tar.gz \
>          file://skip_rootfs_pinning_for_read_only_filesystem.patch \
>          file://add_lxc_init_groups_config_key.patch \
>          file://lxc-conf-improve-read-only-sys-with-read-write-sys-devic.patch \
> +        file://CVE-2022-47952.patch \
>  	"
>  
>  SRC_URI[md5sum] = "365fcca985038910e19a1e0fff15ed07"
> -- 
> 2.17.1
> 

