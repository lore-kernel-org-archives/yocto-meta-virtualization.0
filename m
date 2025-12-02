Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FB26CFD2F6
	for <webhook@archiver.kernel.org>; Tue,  2 Dec 2025 05:02:57 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.947.1764651775881081243
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 01 Dec 2025 21:02:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lHkblhVU;
 spf=pass (domain: gmail.com, ip: 209.85.160.180, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ee0ce50b95so52375731cf.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 01 Dec 2025 21:02:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764651775; x=1765256575; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=p3bXPCnv/MAWqYbqaJjcl7X9CodNjiCApYWIgRUfNq8=;
        b=lHkblhVUIEu1ld+y24PXzOemNEpx97xK5B9W/fwC9br4L/OxbXh2Wl8JoN6pia3rC4
         92OOsme2uHMdCBiArTjlY2KVSkH5aVszFVVpDU9QqyYJZcIqhwJ6ZGlrEilNlQJeGNDk
         fYMAVWoSFnDgOORhaY07LKebJgJ4xSx+oYq1rPJV8kH7WcSoKr1dofStNzWma1uyR3DC
         q/KzoZ9fyXC76ek3ivhqCV3CML3AbFXqNe4SqzZ5FVOfb2RmgrJs4IB52nJP49XwxV6S
         fHNLoBiUjMAbp7C+YSde1LGAhBRVZW2NcGlmGaXrgUMGX3TKF2/Mj0edzXxdJpUflDSi
         Y1NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764651775; x=1765256575;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3bXPCnv/MAWqYbqaJjcl7X9CodNjiCApYWIgRUfNq8=;
        b=WcDjkTPa/pr2SKuSUKQ/x0zk5u/XME/JKMP9MhPgdgcOZJfIsbYNwgUirT3mX5pM7G
         eVLDO2N6FGn1v+oK6wjpKfj2C0FiFvAQozUeG46ZkRVMxEhqTf85ZejIajD6LxtSlWJX
         YTe80XeEqvOwSGgFfqOeh0PBPWIeSQ77syMw/AW8ypPS+9aTOQE7RLhSDyu/hl0mYNEg
         fxaXTvaMHFUdGYzkD9RoMZfAqdxxdnkXDclVVWjQ++2DAsurxXQAcoVdsFRwAlJDx1zw
         nmdhDIhAkHsacEgpwGBGDzUJhYGJGqvHoerJrGFBs0D/d13mDHrOQewvF7Id4nOPy/wp
         wRXA==
X-Gm-Message-State: AOJu0YzNnsTkb7GyyRDHGH25AnRUqh+8gWJflE3GWHjK2mNEo178rxMS
	56A36ucKhjwzKsgXpvgxfl5SLK4Fzg6N8LRDpj9edpo/cXJLIDIAv4Tx
X-Gm-Gg: ASbGncsRAgopJTCWHsTPALZI7/GbRRtimjobdodoc7ZoAlXk/PSvxsPQ/5YIvvM/UjT
	b3OroweONQIilcxKx0nSotICbty5IXn2b5VNBxgszqW7f/bNsLxLQs5fz1KyRc88yY0EW2gGHsg
	BThJ2LcVWPr6DUaEhyOV7Y3JAGdEmv8Jj+EfIyIusXcxlAAsPYHODWX7WgFBGsrlCC0sKQSxuH1
	6j7xFoHePKnnoEltETUuXVabkEchPG822s3/Rn1GMQsSnWi+nWdsdUlfjw24X2ljL4GmKbC4aF2
	NTCldHrvyeRmqb3+rFyl11AeiahEe9gQgb1olrCGu6RZs3TnTt/IxBfKN43NkGIM8dNLR25nQlX
	+aJUGIL7uImMdzNOg0FmHiDiNbra+91g8ABO60tKMjKQMMbPjD/h4chtQRsaKroPTnVCplw0VoI
	OstruW4Xh+b+fL+gPZ7dCiPU9FWZwinNKno5WiIcFbP6TqwSQhWEXo6NENFzYEhc8j
X-Google-Smtp-Source: AGHT+IGzsc2t71g3DQVkDAc6jbxCDl5hcMKR3Hw6FYFMY1bu7B6QSZ0qrUg6tGDA45DoBRHUAZwh+w==
X-Received: by 2002:ac8:578c:0:b0:4e8:a560:d980 with SMTP id d75a77b69052e-4f008be54b8mr22626061cf.38.1764651774735;
        Mon, 01 Dec 2025 21:02:54 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4efd3444557sm86831371cf.30.2025.12.01.21.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Dec 2025 21:02:53 -0800 (PST)
Date: Tue, 2 Dec 2025 00:02:51 -0500
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: praveen.kumar@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 1/1] libvirt: fix
 CVE-2025-13193
Message-ID: <aS5y+4lGAfNI5f0x@gmail.com>
References: <20251127123734.2467391-1-praveen.kumar@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251127123734.2467391-1-praveen.kumar@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 02 Dec 2025 05:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9473

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 1/1] libvirt: fix CVE-2025-13193
on 27/11/2025 Praveen Kumar via lists.yoctoproject.org wrote:

> From: Praveen Kumar <praveen.kumar@windriver.com>
> 
> A flaw was found in libvirt. External inactive snapshots for
> shut-down VMs are incorrectly created as world-readable, making it
> possible for unprivileged users to inspect the guest OS contents.
> This results in an information disclosure vulnerability.
> 
> Reference:
> https://nvd.nist.gov/vuln/detail/CVE-2025-13193
> 
> Upstream-patch:
> https://gitlab.com/libvirt/libvirt/-/commit/a379327d8abcde8ac8d3e16fe5e4ba6f790d767a
> 
> Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> ---
>  .../libvirt/libvirt/CVE-2025-13193.patch      | 40 +++++++++++++++++++
>  recipes-extended/libvirt/libvirt_10.0.0.bb    |  1 +
>  2 files changed, 41 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/CVE-2025-13193.patch
> 
> diff --git a/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch b/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch
> new file mode 100644
> index 00000000..1ce5de38
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/CVE-2025-13193.patch
> @@ -0,0 +1,40 @@
> +From a379327d8abcde8ac8d3e16fe5e4ba6f790d767a Mon Sep 17 00:00:00 2001
> +From: Peter Krempa <pkrempa@redhat.com>
> +Date: Wed, 12 Nov 2025 17:52:05 +0100
> +Subject: [PATCH] qemu: snapshot: Set umask for 'qemu-img' when creating
> + external inactive snapshots
> +
> +External inactive snapshots are created by invoking 'qemu-img' which
> +creates the file. Currently qemu-img creates image with mode 644 based
> +on default umask as libvirt doesn't set any.
> +
> +Having a world-readable image is obviously wrong so set the umask to
> +077 to have the file readable only by the owner.
> +
> +Resolves: https://bugs.debian.org/1120119
> +
> +CVE: CVE-2025-13193
> +
> +Upstream-Status: Backport [https://gitlab.com/libvirt/libvirt/-/commit/a379327d8abcde8ac8d3e16fe5e4ba6f790d767a]
> +
> +Signed-off-by: Praveen Kumar <praveen.kumar@windriver.com>
> +---
> + src/qemu/qemu_snapshot.c | 3 +++
> + 1 file changed, 3 insertions(+)
> +
> +diff --git a/src/qemu/qemu_snapshot.c b/src/qemu/qemu_snapshot.c
> +index 73ff533..9819448 100644
> +--- a/src/qemu/qemu_snapshot.c
> ++++ b/src/qemu/qemu_snapshot.c
> +@@ -233,6 +233,9 @@ qemuSnapshotCreateQcow2Files(virQEMUDriver *driver,
> +                                          NULL)))
> +             return -1;
> +
> ++        /* ensure that new files are only readable by the user */
> ++        virCommandSetUmask(cmd, 0077);
> ++
> +         /* adds cmd line arg: backing_fmt=format,backing_file=/path/to/backing/file */
> +         virBufferAsprintf(&buf, "backing_fmt=%s,backing_file=",
> +                           virStorageFileFormatTypeToString(defdisk->src->format));
> +--
> +2.40.0
> diff --git a/recipes-extended/libvirt/libvirt_10.0.0.bb b/recipes-extended/libvirt/libvirt_10.0.0.bb
> index 22193ff3..c6e6069c 100644
> --- a/recipes-extended/libvirt/libvirt_10.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_10.0.0.bb
> @@ -37,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://CVE-2024-1441.patch \
>             file://CVE-2024-2494.patch \
>             file://CVE-2024-4418.patch \
> +           file://CVE-2025-13193.patch \
>            "
>  
>  SRC_URI[libvirt.sha256sum] = "8ba2e72ec8bdd2418554a1474c42c35704c30174b7611eaf9a16544b71bcf00a"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9462): https://lists.yoctoproject.org/g/meta-virtualization/message/9462
> Mute This Topic: https://lists.yoctoproject.org/mt/116499869/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


