Received: from mail-ed1-f66.google.com (mail-ed1-f66.google.com [209.85.208.66])
 by mx.groups.io with SMTP id smtpd.web11.5642.1606797747136472457
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 30 Nov 2020 20:42:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hvzNXwKK;
 spf=pass (domain: gmail.com, ip: 209.85.208.66, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f66.google.com with SMTP id m16so1171013edr.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 30 Nov 2020 20:42:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ecwsMKtM+8FrFM8zawet5jPEdz/67XfDMmehpuJrEsE=;
        b=hvzNXwKK1zltfsaMbH5pe/E9NKQ6TDgOHQTL92aZeQ1BVtyWz2mNjehEwKLbqK1OnI
         //eKFNwUdAQN1XX92LgTe2vY7wxn27VrI60zP8pDFBXlFsznbTYplUKib+PiF0Fcz1d3
         HEUqfrI7M4LoDLngId0POonvN6KLnH/Ff1kmNfjW+6ozPP+iL5U8RROrSRTCtrn/ZK98
         fR+Mbg4Dq/hqBiWgrRcZDewEg2qbZ1fyRmToFCEEbuwJVxAvO7qxrQuQP/a0MFkcN+uq
         bwATwBddrFcMk+8JeOetdgbbwe66Bq/L6Q1W0L+lSYVhBv4I/e3W8Q7kaCLcIQcL+hZP
         Hmpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ecwsMKtM+8FrFM8zawet5jPEdz/67XfDMmehpuJrEsE=;
        b=OsRLoEnJSXbOqvwMUQT9tiG7ty8xKbzVBaPIl9FtsIA/AbpXsy6mgeZw9+dZEZCjik
         Ioi4Qd5notOETkiQwCWmdsChWST3Ot9aaBvt9uI9xExEEM3cVL8cwx4SkrXEPczGaGKz
         r9ws96WVk9RCJEHXQhbUbNHWDf2l3Pb9ysvZj/y6Jeiq1CN9DI8Jwbh71j6qWEKu4e23
         27Cc4JTWwnU8ORvyS+oiPzhNKN+pnmxV+smfdJ8LWO248+3O1yoGBpVJpveT/uoTvscG
         KEcllxHUgI2IgzewGARsnKgnQKuPMdo/rMC6UuXwErJ2UD7HLmAtelBH2zPrsxzcwqzw
         mBKg==
X-Gm-Message-State: AOAM531IMeR6GIcpO3e3BEdb/z352UYN2nKYawF8k4or9F+3qrY/GJTW
	efZ95SYavY9hR5Q1nMxOkwAnBThdOqw6qmv3OSE=
X-Google-Smtp-Source: ABdhPJyW5j5FQCkHsiUbqp+w+sJ67PPgI6Z7pMmt4cc/bulsuOMMGGxQ5v5QW7UrCkt7HLIdMYcFrUuAPq8ICxrUjBU=
X-Received: by 2002:a05:6402:44b:: with SMTP id p11mr1246519edw.164.1606797745542;
 Mon, 30 Nov 2020 20:42:25 -0800 (PST)
MIME-Version: 1.0
References: <20201201014408.26562-1-ricardo@foundries.io>
In-Reply-To: <20201201014408.26562-1-ricardo@foundries.io>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 30 Nov 2020 23:42:14 -0500
Message-ID: <CADkTA4O1Kx71-oqq0BqVaP-aC2-E9u_SJ9j3LsFHnSqpmMnaCg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] containerd: update to v1.4.3
To: Ricardo Salveti <ricardo@foundries.io>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Thanks Ricardo,

I'm still sitting on a queue of updates to the various packages in the
layer as I work through some final kubernetes issues.

But I've grabbed this and will double check it in my integration runs,
hopefully everything will be updated by end of week.

Bruce

On Mon, Nov 30, 2020 at 8:44 PM Ricardo Salveti <ricardo@foundries.io> wrote:
>
> Relevant changes:
> - 269548fa2 Merge pull request from GHSA-36xw-fx78-c5r4
> - 727e1728d Prepare 1.4.3 release notes
> - ae3a64aa1 containerd-shim: use path-based unix socket
> - 428f10fd2 Use path based unix socket for shims
> - b321d358e Merge pull request #4768 from dmcgowan/prepare-1.4.2
> - f2e4291b6 Prepare 1.4.2 release
> - 76f3d1955 Update mailmap for 1.4.2 release
> - ca9950755 Update cri version to pickup unknown state fix
> - 21baf7109 Merge pull request #4767 from dmcgowan/update-1.4-cri
> - 3458984bb Merge pull request #4766 from dmcgowan/backport-4765
> - 0b97c6204 Update cri plugin
> - c0f1add3c Fix Windows service panic file to not be read-only
> - 9c24574c9 Merge pull request #4763 from estesp/cp-tests-fix-1.4
> - fbe18caa1 Update btrfs vendor for chkptr fix for Go >= 1.14
> - cbbf257ab Add Go test runs to GitHub Actions CI
> - 19776b75b Adjust overlay tests to expect "index=off"
> - 7eb852214 Allow oom adj test to run in environments with a score
> - 036ede698 Import crypto for all snapshotters during testsuite
> - 8d839c4b3 Merge pull request #4751 from amrmahdi/amrh/cherry-pick-cc3785-1.4
> - 31bbc1f7d Merge pull request #4754 from thaJeztah/1.4_restore_nil_pointer
> - 5618423a0 Add comments clarifying copyWithBuffer implementation
> - a2ebee357 replicate io.Copy optimizations
> - 9b2156aa8 Improve image pull performance from http 1.1 container registries
> - 7fe3f1301 Merge pull request #4749 from thaJeztah/1.4_backport_windows_int_overflow
> - 56291a221 bug fix:#3448
> - 16e51fc31 Fix integer overflow on windows
> - 957bcaa9f Merge pull request #4746 from estesp/cp-4745-1.4
> - 6ebd9a94a Update other actions for env/path CVE fix
> - 49889957e Merge pull request #4743 from estesp/fix-ci
> - 0a3488c71 Fix GH Actions CI deprecations
> - 882e39618 Merge pull request #4733 from thaJeztah/1.4_backport_update_seccomp_profile
> - da9705a64 Merge pull request #4736 from AkihiroSuda/go-1.15.5-containerd-1.4
> - cc3be9ae3 Bump Golang 1.15.5
> - ebffce3ad seccomp: add pidfd_getfd syscall (gated by CAP_SYS_PTRACE)
> - 229f5ea4e seccomp: add pidfd_open and pidfd_send_signal
> - 457dafa4c Merge pull request #4711 from AkihiroSuda/go115-1.4
> - e45f41e3a update to golang 1.15.2
> - f8c187fcf Merge pull request #4696 from estesp/cp-4692-1.4
> - 695516287 Remove setuid gosu in favor of "sudo -E PATH=$PATH ..."
> - c562e8d2b Merge pull request #4690 from samuelkarp/backport1.4-critest
> - 77931f801 ci: run critest target for all runtimes
> - e46c29945 Merge pull request #4689 from estesp/cp-4665
> - c745d237e Revendor CRI to get disabled annotation config default
> - ded2577d6 Merge pull request #4660 from kevpar/1.4-update-hcsshim
> - 8b8494ec0 Merge pull request #4661 from kevpar/1.4-lcow-tar
> - 88e7f23bc Read trailing data from tar reader
> - 856a12fca Update github.com/Microsoft/hcsshim to v0.8.10
> - 013411ac1 Merge pull request #4650 from estesp/cp-4645-1.4
> - cc6f72a00 Check if a process exists before returning it
>
> Signed-off-by: Ricardo Salveti <ricardo@foundries.io>
> ---
>  .../containerd/containerd-opencontainers_git.bb               | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index d0ea715..2279a74 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -1,4 +1,4 @@
> -SRCREV = "e44e8ebeaaa2d605f539dffa3788a53c92458c4d"
> +SRCREV = "269548fa27e0089a8b8278fc4fc781d7f65a939b"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.4 \
>             file://0001-build-use-oe-provided-GO-and-flags.patch \
>             file://0001-Add-build-option-GODEBUG-1.patch \
> @@ -8,7 +8,7 @@ include containerd.inc
>
>  LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=1269f40c0d099c21a871163984590d89"
>
> -CONTAINERD_VERSION = "v1.4.1"
> +CONTAINERD_VERSION = "v1.4.3"
>
>  EXTRA_OEMAKE += "GODEBUG=1"
>
> --
> 2.29.2
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
