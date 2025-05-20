Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF6B9C54754
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 02:47:48 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web10.12015.1747709260291035349
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 19 May 2025 19:47:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=NssYU9k7;
 spf=pass (domain: gmail.com, ip: 209.85.219.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-6f8b2682d61so39896126d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 19 May 2025 19:47:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747709259; x=1748314059; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fhc4EhZL/axI/IoWwDyGqdDCREGecIH9KmJSijm9trY=;
        b=NssYU9k7BXInEqPFwuXQoHpG2Z7FxmkR42Lx5i95WQauxsPCWpjxN+Ko8kS4I1OzfC
         B8UFRE8aOlxU9A4ZB5PLvE0K1kh42OU6xTXGVmx0GK/6/Bud9l2PljRSzS934A9WBBtQ
         jEw1BG+tVV+MOhK7LyZbxQSA1LlSxTXftVByeYBhYzMbqa0/sg19XdKhom8RhR3WoHGY
         Dr2uR6zzvAUvJF5uCtDxDkwdsIUUgF+Ri0H0aMbByUvu1vvEaaCsYbsVI/VhqOsl0FTk
         M62PXnRUTsIOgWajZu4XWY0/d586NAGpt/yvvURETJKWoiIHgIv5460IKj+Uum3tv1bv
         aplA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747709259; x=1748314059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fhc4EhZL/axI/IoWwDyGqdDCREGecIH9KmJSijm9trY=;
        b=EV4HpKo27iGzvZlA/PWj4gq0TTkr1ztPdxcR7Qee7p7ePrPukUz9Axn4BFMKMR3v5U
         ML868SEORdbQ1fR5laMmJpS/VTDP1oIbqLxRv2EEK4eb6phNZgEMaE2vfH/YNjv/Hd6d
         vsOWybastCqeiPZVyyBnoaaV4lRvl7wJF1WfWcDpd9aCB6Rs3BnJ4Coexce21sfiSreL
         99kXJvnxJpWKkT6/zpaRmbafr3xK66x5lNZzHCMj3hTtxNRP4Y0FjA+fG7e4iY/F/tij
         Xo6FsNlOwQMtxFOHYtTwLfeamO2fH4aTd6PaJCEXXqoOMbF5hsSm+ZYfKAQ409EM1YV5
         cr+A==
X-Gm-Message-State: AOJu0YwHJx+pSwCBG0FVn2XBFGSYQfwrLZL2QBEy/5v6BtctVieCaV2t
	7au29uzaIOsXk5FEOp9JAOSS+wOoJBhPQVeMfqhN7OAcxIkHExp1Pok/
X-Gm-Gg: ASbGncv5/Qg/0FceUr2O8IOYzENTLDbGyYXhpwR0axrXDXTLcQizuMGEwuBnoKy9Zdp
	gxkeH9xI9PXQHnUbyAaEu6kldHVDZANx7nkJnOYImG8+BWi3SGwkl7/Quw98oe0FIYmcUBVeSFv
	S9T/egF4psEZePMWb0b/BFcHWlmOJ+3D0TPv/hYFPAtbk56Sc3trWmeqUlI6uzB6DoVztbdaTDf
	2ZvGNNPlSbC3QIasuuZx4NCtT0m8N2stx6wvIOUHdkINuacil6eKUIrEfG8n4T7m/oxFlXxcl1h
	Pywq/1JEt34KxStd2gCqmYZ3XoXY5NGdKyL77dvboiZPZAvdkdc0GDpP+DtRk+03RYXGEaLgImj
	WHNOaoutKsvatQ/YuylyNHZbRvratOg==
X-Google-Smtp-Source: AGHT+IGKF/f1+ebGPb9ImTpZJxafvK5EMh99WZl0jVTBTGdp5nnUJk7WoE99CyJMdCn9ZkaGy+BRJw==
X-Received: by 2002:a05:6214:a03:b0:6f8:b2c7:6ce8 with SMTP id 6a1803df08f44-6f8b2c7780emr190599556d6.1.1747709259129;
        Mon, 19 May 2025 19:47:39 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b0883f45sm66107286d6.23.2025.05.19.19.47.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 19:47:38 -0700 (PDT)
Date: Mon, 19 May 2025 22:47:37 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wojciech.slenska@gmail.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] fuse-overlayfs: update to v1.14
Message-ID: <aCvtSWl7cErSue9k@gmail.com>
References: <20250416083932.36075-1-wojciech.slenska@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250416083932.36075-1-wojciech.slenska@gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 20 May 2025 02:47:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9251

I somehow managed to miss this patch.

I'm just starting an upgrade cycle on the packages of m-virt, but
I don't always do fuse-overlayfs .. so I've grabbed the patch and
pushed it to master.

Bruce

In message: [meta-virtualization][PATCH] fuse-overlayfs: update to v1.14
on 16/04/2025 Wojciech Slenska via lists.yoctoproject.org wrote:

> * fuse-overlayfs-1.14
>     - isolate security xattrs for STAT_OVERRIDE_CONTAINERS.  Prefix all
>       security xattrs with XATTR_CONTAINERS_OVERRIDE_PREFIX.
>     - prefer user.containers.override_stat over user.fuseoverlayfs.
>     - do not force -1 for owner overriding extended attributes.  Otherwise
>       the value is written to the override extended attribute.
>     - fix file owner retrieval for chmod.
>     - honor umask with xattr_permissions.
>     - honor mode for devices with xattr_permissions.
>     - propagate extended attributes permissions with copyup.
> 
> * fuse-overlayfs-1.13
>     - fix a performance issue when dealing with big directories.
> 
> * fuse-overlayfs-1.12
>     - change license to GPL-2.0-or-later.
> 
> * fuse-overlayfs-1.11
>     - main: if a lower layer doesn't support ACLs do not enable them.
> 
> * fuse-overlayfs-1.10
>     - main: use /proc/self/fd to read xattrs.
>     - main: inherit ACLs for new files/dirs.
>     - main: fix passing noatime.
>     - main: add checks for valid /proc mount.
>     - main: fix copy_file_range for deleted files.
>     - main: fix creating links of just deleted files.
> 
> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  ...tils-Add-missing-include-on-limits.h.patch | 36 -------------------
>  .../fuse-overlayfs/fuse-overlayfs_1.14.bb     | 15 ++++++++
>  .../fuse-overlayfs/fuse-overlayfs_1.9.bb      | 18 ----------
>  3 files changed, 15 insertions(+), 54 deletions(-)
>  delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
>  create mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
>  delete mode 100644 recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> 
> diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch b/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
> deleted file mode 100644
> index cd504ce5..00000000
> --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs/0001-utils-Add-missing-include-on-limits.h.patch
> +++ /dev/null
> @@ -1,36 +0,0 @@
> -From b48e958aaecfdfc3bb48db082a548a09d6487181 Mon Sep 17 00:00:00 2001
> -From: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Date: Wed, 13 Jul 2022 12:05:07 +0200
> -Subject: [PATCH] utils: Add missing include on limits.h
> -
> -This happens to not be an issue with glibc because it gets indirectly
> -included via dirent.h:
> -
> -.. /usr/include/dirent.h
> -[...]
> -..... /usr/include/linux/limits.h
> -
> -When using the musl libc implementation, that is not the case anymore
> -and the build fails.
> -
> -Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> -Upstream-Status: Submitted [https://github.com/containers/fuse-overlayfs/pull/362]
> ----
> - utils.h | 1 +
> - 1 file changed, 1 insertion(+)
> -
> -diff --git a/utils.h b/utils.h
> -index 13a177e..6fbc328 100644
> ---- a/utils.h
> -+++ b/utils.h
> -@@ -32,6 +32,7 @@
> - # include <sys/types.h>
> - # include <fcntl.h>
> - # include "fuse-overlayfs.h"
> -+# include <limits.h>
> - 
> - # define XATTR_OVERRIDE_STAT "user.fuseoverlayfs.override_stat"
> - # define XATTR_PRIVILEGED_OVERRIDE_STAT "security.fuseoverlayfs.override_stat"
> --- 
> -2.25.1
> -
> diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
> new file mode 100644
> index 00000000..0f6d0fb6
> --- /dev/null
> +++ b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.14.bb
> @@ -0,0 +1,15 @@
> +SUMMARY = "FUSE implementation of overlayfs."
> +DESCRIPTION = "An implementation of overlay+shiftfs in FUSE for rootless \
> +containers."
> +
> +LICENSE = "GPL-2.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +
> +SRCREV = "33cb788edc05f5e3cbb8a7a241f5a04bee264730"
> +SRC_URI = "git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https"
> +
> +DEPENDS = "fuse3"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit autotools pkgconfig
> diff --git a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb b/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> deleted file mode 100644
> index 31199928..00000000
> --- a/recipes-extended/fuse-overlayfs/fuse-overlayfs_1.9.bb
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -SUMMARY = "FUSE implementation of overlayfs."
> -DESCRIPTION = "An implementation of overlay+shiftfs in FUSE for rootless \
> -containers."
> -
> -LICENSE = "GPL-3.0-or-later"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
> -
> -SRCREV = "51592ea406f48faeccab288f65dcba6c4a67cd90"
> -SRC_URI = " \
> -	git://github.com/containers/fuse-overlayfs.git;nobranch=1;protocol=https \
> -	file://0001-utils-Add-missing-include-on-limits.h.patch \
> -"
> -
> -DEPENDS = "fuse3"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools pkgconfig
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9228): https://lists.yoctoproject.org/g/meta-virtualization/message/9228
> Mute This Topic: https://lists.yoctoproject.org/mt/112291695/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


