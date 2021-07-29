Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web08.10780.1627570589842207097
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 29 Jul 2021 07:56:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HWjkXOLF;
 spf=pass (domain: gmail.com, ip: 209.85.160.170, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id h10so4107535qth.5
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 29 Jul 2021 07:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hgbdjFuwPM/+byrNzTA1y5U1QqN+s1aJJj8Huxrrp7I=;
        b=HWjkXOLFmBRD9y7xqCXKYJqWz0Pykgc45l8zekmbsHDiQGPZZetGNITU0AkOK7vRDw
         loWRoJlhV91lCIkzFMxCLOfaA2kjM7N3TIqLmA08SReqvnNYtC8B4cqgFVJuNWrc5Q0H
         i4TtycuGsmf9a/PAqxMRqPHQyhyPQV3tHUnBno8THBkK8jWz2HO6ZOSrtaFqv85g8ht1
         owqCXHTZ15w3gCBJWnL8ohS6M2wH4z14k+1Xd+vgUQzmx0xyf99SZ4BbllUrbJVO56lE
         IISYsXKK64Cd6b/hQ1U+nETmNJnNR3cYR1EsAA/6tPBuFtwdWDN67zYIpaV1+LmUK37+
         IPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hgbdjFuwPM/+byrNzTA1y5U1QqN+s1aJJj8Huxrrp7I=;
        b=UTBnUWwth1S3rZOgvM9gWHjIa+AIbFs2q78KAOuyaMqnh7esfNuqJvh18ZA2QlHaAu
         LsF2lqMFjzfn2ae/MkzEVyTJpFrTB2t8qrurwXfiwzGX+e8MucRoAYB3oF7zavYdV6MY
         D4676zLk4im2GQAJQHtF0ylVHgX+dssUOz0BPV1wsWKLmIRR0EsxYWgpSpny0VbahOSf
         tku72Ts7d70ZQcXc+nD7wj1FppAVcCsZO/8aGb7b8rvdcuan4ZWucBLa5puGyKaPmaC8
         1nFsJA0Ycyy8Gy0egym34IJDwMdfRZZZ0lpEaluJXb3bCihmCNi9dhAGF5PO6GgEueJ0
         hblQ==
X-Gm-Message-State: AOAM5328cvgA7dD+8v8fIMWjO72VIimBPzFxeLGJVgXU2y3bUtZr67c2
	Gm+7qH9myLuOGvf9OQlnlxM=
X-Google-Smtp-Source: ABdhPJwvp5F+s80lpS0z9TgABo84+a1WWGfu0ULWbdJ0Cj2j6vKXJoyfLkC0SnheT3ES27E5vWIs+g==
X-Received: by 2002:ac8:72d2:: with SMTP id o18mr4527071qtp.170.1627570588928;
        Thu, 29 Jul 2021 07:56:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id f24sm1272901qtq.82.2021.07.29.07.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 07:56:28 -0700 (PDT)
Date: Thu, 29 Jul 2021 10:56:26 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	diego.sueiro@arm.com, Bertrand.Marquis@arm.com,
	andrew.cooper3@citrix.com, dpsmith@apertussolutions.com,
	persaur@gmail.com, scott.davis@starlab.io, adam.schwalm@starlab.io
Subject: Re: [meta-virtualization][PATCH v2 0/2] Xen: qemuboot device tree support (Arm 64-bit)
Message-ID: <20210729145624.GA40673@gmail.com>
References: <20210728000740.11070-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210728000740.11070-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

In message: [meta-virtualization][PATCH v2 0/2] Xen: qemuboot device tree support (Arm 64-bit)
on 27/07/2021 Christopher Clark wrote:

> This series introduces tools and class structure in the layer for
> enabling testing Xen system images with Qemu, booting with a device tree
> that describes the target system.
> 
> A device tree is required for launching Xen systems on Arm platforms and
> is part of the Hyperlaunch design for Xen.
>   https://wiki.xenproject.org/wiki/Hyperlaunch
> 
> This series adds a recipe for Lopper, a device tree tool, and its
> dependencies. It provides a class that implements a bitbake task to
> generate a device tree for qemuboot, and a set of defaults to enable
> 'runqemu xen-image-minimal nographic slirp' to boot images compiled for
> Arm 64-bit machines.


Looks good to me.

this is now merged.

Bruce

> 
> Christopher Clark (2):
>   lopper, python-dtc: add new recipes for device tree tools
>   qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
> 
>  classes/qemuboot-xen-defaults.bbclass        |  30 +++
>  classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
>  conf/distro/include/meta-virt-xen.inc        |   3 +
>  recipes-extended/images/xen-image-minimal.bb |   5 +-
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb      |  28 +++
>  recipes-kernel/lopper/lopper.bb              |  45 ++++
>  6 files changed, 318 insertions(+), 2 deletions(-)
>  create mode 100644 classes/qemuboot-xen-defaults.bbclass
>  create mode 100644 classes/qemuboot-xen-dtb.bbclass
>  create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
>  create mode 100644 recipes-kernel/lopper/lopper.bb
> 
> -- 
> 2.25.1
> 
