Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74650C46467
	for <webhook@archiver.kernel.org>; Tue, 10 Jan 2023 15:39:46 +0000 (UTC)
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
 by mx.groups.io with SMTP id smtpd.web10.106777.1673365183287520992
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Jan 2023 07:39:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hZeCq9fh;
 spf=pass (domain: gmail.com, ip: 209.85.166.178, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-il1-f178.google.com with SMTP id u8so6564122ilq.13
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 07:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lWRP6CuM2Vqn3uHU7k4Ca7LezklL5YPwEk/Dzk4tQ78=;
        b=hZeCq9fhXAs30wGFkzJ7NdrELndx/SxR2XKi75gz/WW7/XJCmISGd6CRNBO0uCiQd+
         XUuT4la4uZJCFDB04TsjPqJE3GvXG8cyCMsGMvN2QW+X7BClW0Zml9JYILS6wu3mmDdi
         JYrMv+MkQWuSDoZq6BtQswrCuiOcFqWboOFbMBaRBCVInQ/P6d128xR+EfwaR0FC5uMU
         2XAYcsTNMnCpyNni9oPaiDpFoBVUPDitG1VKhBulrKc6DgR3ydCAqSg9Uv7b4nooHpPR
         EOOiU1ylQ7F+0hgSXuGjcM+adNRsPQF9Ymdvc5d+2e4jRq8rjZkBVW8qASevHePmGwM4
         vfkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lWRP6CuM2Vqn3uHU7k4Ca7LezklL5YPwEk/Dzk4tQ78=;
        b=AntyO0eI/xra02P59Mew6xz9D6PwRDcQfUjrqlWzwAhk4txBsAoV+8i5m5sqVboGct
         0YrYEmFr4JOh1sHx6y9F+lIi47h+7IJcMc4GfPiWky5WEmcxtVIzTqdw0z7rMEUpCWFs
         4IX4gvi8NEWWjUyk2QIB102geMIsKNd0ypv8MLNqH1xqkaMFGDc+UQDFB2XtBn1dbtb3
         sUk2yZaLbOe75DN0yZXpI6/Nrwa7L+xdZFbfBMxz4ppC//EYKDRBbYThJHTIRY2QppAF
         CkmvEBwPxRtgNf1K3omK8i6rhs4YpB9/P5EC2KdZ8bgKP9XzjGyT9o5Pmbxqd2lCFEPT
         pLKA==
X-Gm-Message-State: AFqh2kqj0FuMWpwnCOa0e5YqFVg9YucOsoVAnV4Kba0aU9mWNBq+z1Da
	Rv/EFKptDYQFVRNr1RSqT1lvP4SjTBEkeNUf8sw=
X-Google-Smtp-Source: AMrXdXumDsC1yBu1/ZaFzTeAWJWa8XLWT7LHstmmfVqALv5M9IdimwaEbIptqT/wweDzd7YhhCLAC1AEKc6Mynt8fLA=
X-Received: by 2002:a92:cda1:0:b0:30c:21d5:5ce0 with SMTP id
 g1-20020a92cda1000000b0030c21d55ce0mr6067286ild.28.1673365178695; Tue, 10 Jan
 2023 07:39:38 -0800 (PST)
MIME-Version: 1.0
References: <20230110151432.3434073-1-jose.quaresma@foundries.io>
In-Reply-To: <20230110151432.3434073-1-jose.quaresma@foundries.io>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jan 2023 10:39:27 -0500
Message-ID: <CADkTA4Oa0DppORwgKT8m4JUWzQ7bj7zFsRrrxcEkLQTdA5Q0iw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] skope: fix build with btrfs-progs 6.1
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 10 Jan 2023 15:39:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7810

This is one of the breakages I warned about earlier, I have a version
bump in master-next, and pending fix that I'm about to push.

If those don't sort it out, I'll have a closer look at this.

Bruce

On Tue, Jan 10, 2023 at 10:15 AM Jose Quaresma <quaresma.jose@gmail.com> wrote:
>
> | # github.com/containers/storage/drivers/btrfs
> | vendor/github.com/containers/storage/drivers/btrfs/btrfs.go:387:11: args.lim.max_referenced undefined (type _Ctype_struct_btrfs_qgroup_limit has no field or method max_referenced)
> | recipe skopeo-v1.8.0+gitAUTOINC+b95e081162-r0: task do_compile: Failed
>
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>  ...ound_field_rename_in_btrfs-progs_6_1.patch | 38 +++++++++++++++++++
>  recipes-containers/skopeo/skopeo_git.bb       |  1 +
>  2 files changed, 39 insertions(+)
>  create mode 100644 recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch
>
> diff --git a/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch
> new file mode 100644
> index 0000000..cd3c70f
> --- /dev/null
> +++ b/recipes-containers/skopeo/files/0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch
> @@ -0,0 +1,38 @@
> +From 246ba3062e8b551026aef2708eee747014ce5c52 Mon Sep 17 00:00:00 2001
> +From: Rui Chen <rui@chenrui.dev>
> +Date: Wed, 28 Dec 2022 18:26:39 -0500
> +Subject: [PATCH] fix: workaround field rename in btrfs-progs 6.1
> +
> +same as kdave/btrfs-progs@0345143
> +
> +Signed-off-by: Rui Chen <rui@chenrui.dev>
> +
> +Upstream-Status: Backport [https://github.com/containers/storage/commit/246ba3062e8b551026aef2708eee747014ce5c52]
> +Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> +---
> + drivers/btrfs/btrfs.go | 5 ++++-
> + 1 file changed, 4 insertions(+), 1 deletion(-)
> +
> +diff --git a/drivers/btrfs/btrfs.go b/drivers/btrfs/btrfs.go
> +index e8b16b858e..3d9053297b 100644
> +--- a/drivers/btrfs/btrfs.go
> ++++ b/drivers/btrfs/btrfs.go
> +@@ -6,6 +6,9 @@ package btrfs
> + /*
> + #include <stdlib.h>
> + #include <dirent.h>
> ++
> ++// keep struct field name compatible with btrfs-progs < 6.1.
> ++#define max_referenced max_rfer
> + #include <btrfs/ioctl.h>
> + #include <btrfs/ctree.h>
> +
> +@@ -382,7 +385,7 @@ func subvolLimitQgroup(path string, size uint64) error {
> +       defer closeDir(dir)
> +
> +       var args C.struct_btrfs_ioctl_qgroup_limit_args
> +-      args.lim.max_referenced = C.__u64(size)
> ++      args.lim.max_rfer = C.__u64(size)
> +       args.lim.flags = C.BTRFS_QGROUP_LIMIT_MAX_RFER
> +       _, _, errno := unix.Syscall(unix.SYS_IOCTL, getDirFd(dir), C.BTRFS_IOC_QGROUP_LIMIT,
> +               uintptr(unsafe.Pointer(&args)))
> diff --git a/recipes-containers/skopeo/skopeo_git.bb b/recipes-containers/skopeo/skopeo_git.bb
> index a2fff2c..3eaddfd 100644
> --- a/recipes-containers/skopeo/skopeo_git.bb
> +++ b/recipes-containers/skopeo/skopeo_git.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>      file://storage.conf \
>      file://registries.conf \
>      file://0001-makefile-add-GOBUILDFLAGS-to-go-build-call.patch \
> +    file://0002-fix_workaround_field_rename_in_btrfs-progs_6_1.patch;patchdir=src/import/vendor/github.com/containers/storage \
>  "
>
>  SRCREV = "b95e081162382f9a28f400bee10046ce72b957fe"
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7809): https://lists.yoctoproject.org/g/meta-virtualization/message/7809
> Mute This Topic: https://lists.yoctoproject.org/mt/96178786/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

