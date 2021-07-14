Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web09.11839.1626291291825361576
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Jul 2021 12:34:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=RRa/mimu;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id bu12so5219421ejb.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 14 Jul 2021 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9usDkzHJukXGJEuL29BwXaP40XpP2J1rdzUzk3tV2Eo=;
        b=RRa/mimurxtA3O9fOGcG9zF0GZ+fDbU/Vb+7NNvn2nrTTz23luXO76P5boEWVd7o+o
         4d1N0l1rvl9s81XQ0vtd2uVoIZSI0DPit8nvNG34kry9avsb2j1MqAHFRCGSbCi93peG
         kH9gtK8iMsrs/ONm6DaxHbCwVnmSTtA6esEZ/SBY6ntnVWxYYZOVk+NB7O5dtlevvOZi
         NvfBiY0w4qmVhCgRhf+mLC3H5K4BSwtzeS3MXNYjOsfA3J1VJoWmYgByKCzV5/SVN+Zg
         70L90JBJ5bGfKLLSvJJwHryhWV1oe+f2tS+X5mVw4rYXQeEd6c5tfQGagJ9/natpppNg
         Jrtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9usDkzHJukXGJEuL29BwXaP40XpP2J1rdzUzk3tV2Eo=;
        b=eP6CdBSUC1oBkOqbDuV6DukLFaNoTtgIIEvyL/LCz3itP7UgLmyM94AHwhoTcWF2iU
         5hrlubAk3az0ZmkjIXM1HxSDmh2bNHMe19GClJzcFQItqsFFejmfOr88HNLmtOycOgw7
         Eo9Ur9rtIGPU2HBZnQPrepGPSP3nD25B0rwCn31d21dxEIS4atxP63ee7/l4YK9yKYfV
         2N6UOYc+r6ULQJMf70zQ6lBgyNLZnSO7gKajRTVhM3BF+r1kJqj3QNCn73kzfnXDWgmI
         bfivlmYoSWAv+M3+oiKL3ZGKTDHLx2QiCCyDvOUKL/aJINSXA5+ljPPXOrdWnuRfW/3Q
         9IHg==
X-Gm-Message-State: AOAM533xBprlmqGz97tEVdfsxQPGinhf0J+vcEk0s/sysw4z+kTAgRNh
	pkCeWeVUF/KDFtiCTxZ3IdjpglBVJXq6/PnteT4=
X-Google-Smtp-Source: ABdhPJw+O0iLfLYdHMRo6WYgw48x8zZv3/pDg6k21FPfTm4MCf5+WZOUQCrJ/f1HDC8vFDld8JI7kM0PdkL4r8D1FcM=
X-Received: by 2002:a17:907:1b29:: with SMTP id mp41mr13817737ejc.459.1626291290434;
 Wed, 14 Jul 2021 12:34:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210708044300.127016-1-christopher.w.clark@gmail.com>
In-Reply-To: <20210708044300.127016-1-christopher.w.clark@gmail.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 14 Jul 2021 15:34:39 -0400
Message-ID: <CADkTA4N7bm138tw-h1QLGMJJ-WTOYAwAhL3bvW58woyTTb35sw@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH 0/2] Xen: qemuboot device tree support (Arm 64-bit)
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, christopher.clark@starlab.io, 
	Doug Goldstein <cardoe@gentoo.org>, Diego Sueiro <diego.sueiro@arm.com>, 
	Bertrand Marquis <Bertrand.Marquis@arm.com>, andrew.cooper3@citrix.com, 
	Daniel Smith <dpsmith@apertussolutions.com>, Rich Persaud <persaur@gmail.com>, scott.davis@starlab.io, 
	adam.schwalm@starlab.io
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 8, 2021 at 12:43 AM Christopher Clark
<christopher.w.clark@gmail.com> wrote:
>
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

This looks great, and something that I've been looking for as well.

I just need to carve out a bit more time to take it for a spin, but I
don't see any issues with the changes. (I've reviewed the new recipes,
etc, and nothing major jumped out).

Bruce

>
> Christopher Clark (2):
>   lopper, python-dtc: add new recipes for device tree tools
>   qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images
>
>  classes/qemuboot-xen-defaults.bbclass        |  29 +++
>  classes/qemuboot-xen-dtb.bbclass             | 209 +++++++++++++++++++
>  conf/distro/include/meta-virt-xen.inc        |   3 +
>  recipes-extended/images/xen-image-minimal.bb |   6 +-
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb      |  26 +++
>  recipes-kernel/lopper/lopper.bb              |  45 ++++
>  6 files changed, 316 insertions(+), 2 deletions(-)
>  create mode 100644 classes/qemuboot-xen-defaults.bbclass
>  create mode 100644 classes/qemuboot-xen-dtb.bbclass
>  create mode 100644 recipes-kernel/dtc/python3-dtc_1.6.1.bb
>  create mode 100644 recipes-kernel/lopper/lopper.bb
>
> --
> 2.25.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
