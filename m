Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.44260.1795390192571415316
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Nov 2026 15:29:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=S+RxxD67;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-921375f52b8so30182676d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 15:29:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795390191; x=1795994991; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=V8g74mW+m6O69WcBQ6wTd/EkQ7YoyZWyCPbXE1L5ZzE=;
        b=S+RxxD67JjFenizZ5uiHkf+z6giAfRoJFRYXQuCofBpr3jnpVS85KAwMPxv2z+42vP
         DvpPpC9bDsOfsZB8E42bZr6TR2bbsXx211uGED7DD/FTa02TK2ZGJ/zbuqZK/25ueA5n
         /fHt512r6LE8LJ1N0MsEdaTINpWEzPQrCEsWuygW9uGMbnNpQi3qBVolohbLI5qmZVAl
         /bcuqz9dagaE+bs3JuHMrpL+0TYBvaQJX/46QBV2gG2wumspcs80vtqEMdjjW099chVG
         RR3FpJe80FjGJQme6+bYn/SjspFU0nmUMnwhrNeoXIDsOKR5qcUw4Er1I4CPAKXcJPxm
         Rxtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795390191; x=1795994991;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8g74mW+m6O69WcBQ6wTd/EkQ7YoyZWyCPbXE1L5ZzE=;
        b=UQNNuNZ+AAbCBKSJx4fuXYfvr7R6EjppFfpFKb4Wca9JVMtUWyK9jdg4ArDWwYFG3l
         FLbgoBl3MSbjnoqHvcMjfpXFmhjtMNhIRId+8DRrEp8nQYoI74cAXqA67kKbn/2NzjBt
         Hrb2BjjcMfXKixpHEswgkf2aWZ3ocSucFpGnd1tqxWU5SYARllVsbJ8N+wv6xKaVneYj
         a/crKS49ZezqGu6Uvp6UgdUMoL/fuTgC7PyI2SUqMehSI9dWoNFlXvXeYlfTAFuLGDuP
         PgxasmX/yjNGslGVukXLJz9xBAgVRksgvMYNnhlTYjvc/RJJlycHWroai3YkeVfiu0zq
         iztQ==
X-Gm-Message-State: APuU4Z9fkUfrP5PxVGbSWP4HzYY5TBcVq5zc7eu20jyAjR93QTD+Wob3
	1bbFFK9THc7FWwwJx3J+GwFTzma9uhboiqFbG/dcH1RuT2w+0QhK5NtG
X-Gm-Gg: AZFdTZfZwJXG8g98pmNa76pWKZ1BpS29r+wPsgoEgI6+1oCYS9dGVgdG4Fq3H5YCs9o
	eNTcS0w3WlAf09BnO8Xj/7oeQ6ZkE28l/NIZg3WOvCKgiHXd1RZnnAoSnRdC/khjDM5B6WHsSNz
	M/kLc27zozVajCtJEfGS3M/388Q2CDnQGpNyGFczieQVxQXUFYDsdvsp5c+I3O3cQixH2xMdp4r
	fY+TqgZlTB4E2uFL/4U1GnkkaXgVkp4rRz45VQJ0xB4189KbP0fvEdv0po9cIBoTglM4HwWFuyJ
	dsvwNbGupvJaAohSBDpdKfl5nGTLgeZIFlVmoVEG92e1qm5KDcXyfvkhLAafBKBWhBDT5mbydZN
	PhT7ho4mbI2UDUL4tOZzjYhwd7hCZbDZUi4wuKz9Dnk+ykpqDpLEZ2iRJcEWpvvYuPMyuoHQBYc
	GdKX32UvXcdbPxEP6EjelgIyVe9rbpcGHWXHr9IaX84hqaYJGxsG/jIEyzyu86TMA+2mXMMsj4+
	JyyPUNcdQvMW5Bi4S5wTfA+Dolhrk2BD1IGhk96SZGaZWsTq9oY1JJbLgNXVpcwXlPZPpnwB6FY
	ZsFj/ailtyR8duPNfS/TfZokRWfL9qpFwPSS+rbYb/xqu8WQoYRwKmry9mrciEasuO2GLb/bmeN
	45tgsd9dW3K+YYoNaScyjx1iTLUS8iVDThMBJpjKAw3uWm5mWbA==
X-Received: by 2002:a05:6214:1c0a:b0:921:3861:674f with SMTP id 6a1803df08f44-92138616da1mr154650196d6.21.1795390191216;
        Sun, 22 Nov 2026 15:29:51 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349ec64csm90017776d6.28.2026.11.22.15.29.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 15:29:50 -0800 (PST)
Message-ID: <6b037aee.b322084d.36a5a7.c153@mx.google.com>
Date: Sun, 22 Nov 2026 15:29:50 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tim Orling <tim.orling@konsulko.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/3] image-oci: track multi-layer
 rootfs directories with pseudo
In-Reply-To: <20261122182910.35849-2-tim.orling@konsulko.com>
References: <20261122182910.35849-1-tim.orling@konsulko.com>
 <20261122182910.35849-2-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Nov 2026 23:29:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10179

> Since oe-core moved to dnf 5.4.7.0, every layer install fails:
>
>   error: cannot open Packages database in
>   Failed to load system repo from root ".../oci-layer-rootfs/layer-1-base":
>   rpmtsOpenDB failed: Invalid argument
>
> dnf creates var/lib/rpm in the layer rootfs but the rpmdb is never
> created, while do_rootfs of the same recipe installs the same packages
> successfully. The rpm macros (%_dbpath=3D/var/lib/rpm) and the
> RPM_CONFIGDIR/RPM_ETCCONFIGDIR environment are identical in both tasks;
> the only difference found is pseudo coverage of the install root.

Thanks for chasing this, I hadn't hit it yet since my oe-core is still
on dnf 4 and I haven't started my M2 update cycle.

This change tells me that tracking the layer rootfs with pseudo makes
the error go away, but not why rpm can't open its database without it.

Before going this way, I need to be sure. The OCI classes have been
moving ownership and special permissions out of pseudo, not into it
.. umoci runs rootless and records owners in its own xattrs, the
setuid/setgid bits are restored with pseudo disabled before each
repack, and the runtime bundles on master-next are archived by a
script that runs with pseudo disabled. The layer rootfs is copied into
the bundle with --no-owner --no-group anyway, so whatever pseudo
tracks there never makes it into the image. Adding pseudo coverage
only to get rpm to open its database goes against all of that.

What is dnf5/rpm doing in the installroot that fails with EINVAL when
the path isn't tracked? If we can find that, then there's a shot at
fixing that root cause. If not, it all needs to be captured in the
commit message.

> +# AI-generated (Claude Code, Claude Opus 5.5).
> +# Multi-layer package layers are installed by RpmPM/OpkgPM into
> +# ${WORKDIR}/oci-layer-rootfs/layer-N-<name> from do_image_oci, which runs
> +# under pseudo. Like ${WORKDIR}/rootfs for do_rootfs, the layer rootfs must
> +# be tracked by pseudo or dnf5/rpm6 cannot open the rpmdb in the installro=
ot
> +# ("rpmtsOpenDB failed: Invalid argument"). Same approach as image.bbclass
> +# uses for MULTILIB_TEMP_ROOTFS.
> +PSEUDO_INCLUDE_PATHS .=3D ",${WORKDIR}/oci-layer-rootfs"

Two things here, and they apply to 2/3 and 3/3 as well.

The AI-Generated trailer in the commit message is fine, but I don't
want the attribution line in the code itself. It stays in the layer
long after anyone cares how the patch was written.

The comments are also too long, and mostly repeat the commit message.
A line or two on what the code is for is enough, the rest belongs in
the commit.

Finally, the patches came through the list as "Tim Orling via
meta-virtualization <ticotimo=3Dgmail.com@lists.yoctoproject.org>" with
no From: in the body, so git am picks that up as the author and the
push gets rejected. If you send a v2 with --from (or format.from set)
the konsulko address will survive the list.

2/3 and 3/3 look right to me otherwise .. the inherit_defer ordering
for empty_var_volatile seem right. But putting some reproducing
instructions in the commits (or a test) would be better.

Bruce
