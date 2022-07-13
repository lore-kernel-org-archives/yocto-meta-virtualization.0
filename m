Return-Path: <andrei@gherzan.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9107C43334
	for <webhook@archiver.kernel.org>; Wed, 13 Jul 2022 10:24:45 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by mx.groups.io with SMTP id smtpd.web10.20496.1657707877199755165
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 13 Jul 2022 03:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gherzan.com header.s=fm1
 header.b=AiQwRLA7;
 spf=pass (domain: gherzan.com, ip: 66.111.4.26, mailfrom: andrei@gherzan.com)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 8A8D65C02C0;
	Wed, 13 Jul 2022 06:24:36 -0400 (EDT)
Received: from imap41 ([10.202.2.91])
  by compute3.internal (MEProxy); Wed, 13 Jul 2022 06:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gherzan.com; h=
	cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1657707876; x=1657794276; bh=jns4yIO+DQ
	Ct2IwDfaeUmHAWv3o28Q/QT3ziAY7r0FM=; b=AiQwRLA72zb3nBn+zkEYB2kmx+
	WBqm11klrl+oUnAFjCEwBQp58jyPsvpIOL4Ornbr+szD8yiuW05r2p0Ql2zGYjrj
	WiZlz8BmIY19J2njwEuNjkMK50CdG3noij84XjeA0677XRAiGYIbNWZ+/7I/5t36
	DVMsLa0wOS8SUXxTzmWtss1BmaPggFSGLUtQQI0mOjUaUnJl7wlDqIFrsx7F7QFj
	z8OHA5v9IC0g0yInLyZ57ziiZuvpx8+ht1r75PRId4y3N/ycb8R6buX08dwuNwuW
	NqfNPGuCNl61PrcsrdocReFc44WHnkHh8HOznzmCzpLHiv/vC6VS56DLPoaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1657707876; x=1657794276; bh=jns4yIO+DQCt2IwDfaeUmHAWv3o2
	8Q/QT3ziAY7r0FM=; b=DWHXiEvhncmBZSj6r6g1B9NYTzQO9k1bB/iwFdjcTrv4
	Q4B0OpKpkc1BLmdANBzQcb/PPC4qpCe4b6HRpXxCDZr4VnOx++37UXfKPemb9zgC
	lkwuaJqBgRFfRR7tL0GtMT5mIH+JaA1+TfgtvMdz2GzEvlFvv7+elt3SgFd48DvK
	sDXVQDWfrIubMDLpHxm3Z/MW88VxNUcpt0VTX0jiCvE9Su908sHBgUpbHjXMOFrL
	K9ShyAXktLSACFiQdJ7+QHjXiB+6HnvZI2p+hJirqQ+UjOyDO0dOp4XNhh0Sk6On
	lwLi6yVzPpIR65WU8Bi8pRv0E6cA2eZ5rvUH1yoLXA==
X-ME-Sender: <xms:ZJ3OYjTsUuSAgaQlkzIaSU630_kKz0w1r7enK2znZcytY1RbDFIrdA>
    <xme:ZJ3OYkxma9erM94bexWBzxbjhH8sjzhzEweNfpacJF87e79P50O5zCyAXzP-c4KBC
    J6BzwQ5SRNRVewWi7Q>
X-ME-Proxy-Cause: 
 gggruggvucftvghtrhhoucdtuddrgedvfedrudejjedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvvefutgesth
    dtredtreertdenucfhrhhomhepfdetnhgurhgvihcuifhhvghriigrnhdfuceorghnughr
    vghisehghhgvrhiirghnrdgtohhmqeenucggtffrrghtthgvrhhnpedtheevvdeutdekie
    efheehtdevhedtjeejvdfhgfeffefhfeeffeeltdetkeeiteenucffohhmrghinhepghhi
    thhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilh
    hfrhhomheprghnughrvghisehghhgvrhiirghnrdgtohhm
X-ME-Proxy: <xmx:ZJ3OYo0uE2TyKW7QVLtHiBLjohPMedP-aaCP6guCAEA25hGb4LuqkQ>
    <xmx:ZJ3OYjDs3EwFcExfdY4VeRcTZotYQpx8Mi4w1NuwxgRANUX3K9XJtQ>
    <xmx:ZJ3OYsh0x84SLxHRfqcKiOA-BFaWqGK-qWrFlKR5_AL9P7TkTnCaqA>
    <xmx:ZJ3OYqeWIea_I5qs_nokNXjN8N2AgMiB8e70RH21lJKPSKPCMLg9hA>
Feedback-ID: i68994715:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 31746234007E; Wed, 13 Jul 2022 06:24:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-755-g3e1da8b93f-fm-20220708.002-g3e1da8b9
Mime-Version: 1.0
Message-Id: <bfc46925-3e47-4c98-96c2-0faf8f89ab06@www.fastmail.com>
In-Reply-To: <20220712141719.879382-1-andrei@gherzan.com>
References: <20220712141719.879382-1-andrei@gherzan.com>
Date: Wed, 13 Jul 2022 11:24:15 +0100
From: "Andrei Gherzan" <andrei@gherzan.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: "Andrei Gherzan" <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs: Update to v1.9
Content-Type: text/plain
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 13 Jul 2022 10:24:45 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7452

On Tue, 12 Jul 2022, at 15:17, Andrei Gherzan wrote:
> From: Andrei Gherzan <andrei.gherzan@huawei.com>
>
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  ...-Fix-buffer-overflow-on-workdir-path.patch | 32 -------------------
>  ...erlayfs_0.6.4.bb => fuse-overlayfs_1.9.bb} |  7 ++--
>  2 files changed, 2 insertions(+), 37 deletions(-)
>  delete mode 100644 
> recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
>  rename recipes-extended/fuse-overlayfs/{fuse-overlayfs_0.6.4.bb => 
> fuse-overlayfs_1.9.bb} (60%)
>
> diff --git 
> a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch 
> b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> deleted file mode 100644
> index 129423d..0000000
> --- 
> a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-Fix-buffer-overflow-on-workdir-path.patch
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -From 7e5992d6121aed0cfcbfaf70472f28d87cff1426 Mon Sep 17 00:00:00 2001
> -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Date: Mon, 11 Jul 2022 20:36:06 +0200
> -Subject: [PATCH] Fix buffer overflow on workdir path
> -
> -We make sure that the path used for workdir is reallocated before
> -appending. This was initially included in upstream as part of
> -https://github.com/containers/fuse-overlayfs/commit/d5b725b6f18a437db66bfc1456d04c3bf658f66a.
> -
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Upstream-Status: Backport
> ----
> - main.c | 3 +++
> - 1 file changed, 3 insertions(+)
> -
> -diff --git a/main.c b/main.c
> -index e5bdda1..118a6cb 100644
> ---- a/main.c
> -+++ b/main.c
> -@@ -5039,6 +5039,9 @@ main (int argc, char *argv[])
> -       if (path == NULL)
> -         goto err_out1;
> -       mkdir (path, 0700);
> -+      path = realloc(path, strlen(path)+strlen("/work")+1);
> -+      if (!path)
> -+        error (EXIT_FAILURE, errno, "allocating workdir path");
> -       strcat (path, "/work");
> -       mkdir (path, 0700);
> -       free (lo.workdir);
> --- 
> -2.25.1
> -
> diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb 
> b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> similarity index 60%
> rename from recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> rename to recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> index 4f793bd..18e9dfa 100644
> --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_0.6.4.bb
> +++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> @@ -5,11 +5,8 @@ containers."
>  LICENSE = "GPL-3.0-or-later"
>  LIC_FILES_CHKSUM = 
> "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> 
> -SRCREV = "098d9ad79fdbb8538adde08628408aa32a8b4b17"
> -SRC_URI = " \
> -	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https 
> \
> -	file://0001-Fix-buffer-overflow-on-workdir-path.patch \
> -"
> +SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
> +SRC_URI = 
> "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
> 
>  DEPENDS = "fuse3"
> 
> -- 
> 2.25.1

Stand by for a v2 on this one. It needs a musl fix. Also, do you see any issues in using 1.9 vs 1.9.0 as a version? They both are semver compliant.

-- 
Andrei Gherzan 
gpg: rsa4096/D4D94F67AD0E9640

