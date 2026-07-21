Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CE2C44524
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 02:40:24 +0000 (UTC)
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14341.1784601615529243602
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2026 19:40:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=fZhYgYmG;
 spf=pass (domain: gmail.com, ip: 209.85.219.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-902f92b8504so104056416d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2026 19:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784601614; x=1785206414; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2SmEGQOyNndXYrwwT3onsxIVRGb1huzQew2qzxgtoe8=;
        b=fZhYgYmGlg9bx4glgP460fStwxblTiORuXYSCVGXRnBkTYntfpACJdhO/IHI5U1M8L
         1rRW/o4bXz/XCFwF2/WMP+NKQJ4ofZdUnXy94JuDVZ8pOGwWPGGVs0FkwMqYMRiq44kr
         nxmsJR9GWx5GusEhlg8gp4c4+r+7TA/+gBpDPLEjfZqMtFjohC0zoSVbKXdebrKB9f4x
         rfu5zzF7+4fudus/YHtHsFzLDYyLRT/4c+rkWYSrR2KbS+y1N/OnR3/Hd09YWCF1DYwL
         te02D/VDe1cBmFJ4kV3dustbE8k/77hawFXcqvavXVvEIqypoeAVnpCpSWevTMbZTUym
         AjoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784601614; x=1785206414;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2SmEGQOyNndXYrwwT3onsxIVRGb1huzQew2qzxgtoe8=;
        b=EoIzr0YFpJDpIcIWQc6M7tlHbVJTHsOozcJuKmTZ3rEO0zpRVOL60qFcmfYVrospNB
         oA/4iMICXX9/7yHpmtbaYZslJ5LKdrAnoLwm4tD21zevLrLju353PNwgbh2N9c8L0b35
         UTlPWoIddkTqCRVWEOzG+D+AgS/TNIlfj4IS0ZWYuWi+3uPKSUUb8XmxopNRu2l1BUp7
         VBojyLH8hNhpBCy5UnuSx1frp6X/Msd90dG/5v83/DmRHeE0bzjV2gO4Vk5M3YSncu7Z
         0FaRA0LrLsI+0nzLPGSQu7GUkQvWUSkP8Rzx/O+uvddnu15rM5mnSfh+I34cTf1GOPmS
         vK2A==
X-Forwarded-Encrypted: i=1; AHgh+Rq9HZv1OTQ0MPvAQqiCpAkQlJA00LrkPQuzdki72UvCsqOetr902Sd2iwfJa/u7WeqGY4slkx856PC4tm7NrL6bvD9g@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YzB7IcjHWP12YGC9z7jmsPCfzk+e0uM12FbaJopsXDfQYRH0RoK
	X4kdz3K1spgnAdZW/tSGPWaBKAk3o3LoKWbJZG0sJU6CgpSmKb9fy+zW
X-Gm-Gg: AR+sD10oOVgykQY9zz2qe7cuw9vgGDGZRYIfXv+etOQMl0DJRUKHcAe/mDmxmHpeI0T
	i+Ak4Qq0MXV3nub45kTTXwcP38MgSnIlKbYYM9XLcBgSduhjSFIzio4zwbmMoVwj/+u9w/zn/p5
	epxakYD3GEPsEWgyLbp1v3+ayedr1WtoqGLV61L8/zpQ1eABQlAwLkleEhr6szm/gbS4BiiGzju
	plZE1OrkGZWYQRj7FaKXkMk8mwy4bEOiNAhDxC+s1LLwACs84h0+Ao2J88tsk2ux7KhRCMVnMek
	0EZh06VZMFLH+sSUJy+mmjFg8LpWy3cXUoSTCzrdz+8O65O+FL+svRzNg7U5OLykGB8COqYYTIF
	Z79VP1F5fgETzZtx7vymWUYo9JS5rZDLGX+eqKQe8vlKFMWv8kVgbkW7ROnUDnGexLTO8C5aSpS
	gfMN0UHXL9/Ec6RrdKg5R4HPxevyQ+nahsL7LlR3dEI+GZZ69N5mkaCU9VI8QO4TpQNH58fsgVM
	fptnS6ZFhui1nZWlZ06srgIzcxGU4L1iw8iNzeCO4oLX88oG9ULyELrdXp2nE9AY9kA2U8P95vr
	STOrUoJVCM53oA==
X-Received: by 2002:a05:6214:4287:b0:8ef:aad6:dada with SMTP id 6a1803df08f44-9077837060amr186117246d6.20.1784601614210;
        Mon, 20 Jul 2026 19:40:14 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90778541910sm105114936d6.4.2026.07.20.19.40.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 19:40:13 -0700 (PDT)
Message-ID: <6a5edc0d.3c73b6eb.36cfbc.df23@mx.google.com>
Date: Mon, 20 Jul 2026 19:40:13 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: kaloyan.rusev@elektrobit.com, meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] Add Eclipse Ankaios container
 orchestrator recipe
In-Reply-To: <20260708121158.3505748-1-kaloyan.rusev@elektrobit.com>
References: <20260708121158.3505748-1-kaloyan.rusev@elektrobit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 21 Jul 2026 02:40:24 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9972

Hi Kaloyan,

Thanks for the Ankaios recipe. Reviewed against the meta-virt layer
conventions and against what we generally ask for when a new orchestrator
lands. Overall content is good: sensible package split (ank / ank-agent /
ank-server + meta), correct FILES/CONFFILES gating on the systemd vs
sysvinit DISTRO_FEATURES, LIC_FILES_CHKSUM points at the in-source
LICENSE (not a template), SRCREV pinned to the v1.0.1 tag. No blocking
issues on the mechanics.

There are three structural asks and a handful of polish notes below.

Structural — please address in a v2
-----------------------------------

1. Missing COMPATIBLE_HOST and no container-runtime coupling in RDEPENDS

   Convention in the layer for anything that orchestrates containers:
   set COMPATIBLE_HOST to exclude architectures we can't build for
   (the k3s/cri-o pattern is "^(?!(qemu)?mips).*"), and RDEPEND on
   the actual runtime the agent invokes. Right now the meta-package
   ships binaries with no runtime, so `apt install ankaios` on the
   target gives you the tools but no way to start a workload.

   Ankaios' upstream docs mention podman + Kata Containers as the
   supported runtimes. Which one the recipe should require (or
   RRECOMMEND) is a decision for the recipe. Whichever you pick will
   also bring the seccomp DISTRO_FEATURE requirement transitively —
   Ankaios itself doesn't use seccomp (nothing in the 740-crate list
   references libseccomp/seccompiler/apparmor), so there's no need to
   set REQUIRED_DISTRO_FEATURES = "seccomp" on ankaios directly.

2. Testability in QEMU — required for maintenance in this layer

   For meta-virt to accept and maintain a new recipe, we need to be
   able to boot it in QEMU and exercise the primary use case
   end-to-end. Not a synthetic build-only test. Something like the
   crosvm-image-minimal + README-crosvm.md pattern we merged recently:

     * A minimal image recipe that lands ankaios + the chosen runtime
       + a small default state.yaml exercising a hello-world workload
     * A README alongside the recipe describing the QEMU boot invocation,
       the expected `ank get workloads` output, and how to tear down.
     * MACHINE = "qemux86-64" as the reference target.

   The current recipe is a component-only recipe with no test image
   and no how-to-boot documentation. We can't accept that as-is
   because the moment upstream breaks something we won't have a
   reproducer.

3. License audit for the 740 vendored crates

   The recipe declares LICENSE = "Apache-2.0" — that's the upstream
   Ankaios project's own license, but with 740 vendored Rust crates
   the actual license mix is almost certainly wider (MIT/BSD/ISC
   commonly show up in the Rust ecosystem). Please run a real audit
   this round rather than deferring — one of:

     * `cargo license` or `cargo-deny` against the Cargo.lock,
       aggregate the SPDX identifiers, expand LICENSE to the union.
     * Or the `oe-go-mod-fetcher` license-scan machinery we use for
       Go recipes has a Rust-side equivalent; check if any of your
       tooling can consume Cargo.lock.

   I've been sweeping this cleanup across the layer's other Rust
   recipes (crosvm, netavark, aardvark-dns, podlet, fuse-overlayfs)
   as a follow-up, but it's easier for you to do it once upfront than
   for us to do it later without knowledge of the vendored graph.

Polish (fold into v2 or address per your judgment)
--------------------------------------------------

  * `SECTION = "base"` is unusual for an orchestrator — other recipes
    in the layer use `console/utils`, `virtualization/tools`, or
    leave it unset.

  * Recipe comment says "Add cargo-update-recipe-crates to generate
    the crates.inc file automatically" but the inherit line only has
    `cargo systemd update-rc.d`. Add cargo-update-recipe-crates so
    `bitbake -c update_crates ankaios` works for future maintenance.

  * Systemd units are minimalist: no reference to the /etc/ankaios/
    config file that the recipe installs, no Restart=on-failure. If
    ank-server/ank-agent default to reading /etc/ankaios/*.conf, the
    unit should either ExecStart with the path or you should confirm
    the default location matches. Otherwise the config file is
    orphaned.

  * SYSTEMD_AUTO_ENABLE = "enable" is global to the recipe. Cleaner
    per-package (SYSTEMD_AUTO_ENABLE:ank-server = "enable", etc.) so
    a downstream can toggle one without the other.

  * The sysvinit scripts source /etc/default/${NAME} but no template
    is installed. A one-line stub with RUST_LOG=info commented out
    would spare users from having to create the file from scratch.

I'll hold the recipe until v2 with the structural items addressed.
Happy to review a v2 when you send it.

Bruce

