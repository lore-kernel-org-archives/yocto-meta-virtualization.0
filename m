Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FFAFE909BC
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 03:01:52 +0000 (UTC)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28144.1771815708284255256
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 22 Feb 2026 19:01:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iZ/G1Apo;
 spf=pass (domain: gmail.com, ip: 209.85.219.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-896f4627dffso53548916d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 22 Feb 2026 19:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771815707; x=1772420507; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e8kO2ujp16Zpj6mO4gQkFAJV15vxcbGxwbg9/iRRePM=;
        b=iZ/G1Apo8VY4w23DN7n1dMc1sdpQUJJMJ0pZP/rxDeeP+UJbSchRpm9m5ZYhjvwOnV
         srvEknSnB71FKu3KQiEpKPrRl5cx63xl+LuQx0DCX6w3CPVO0mM1hm1faYd4tYixJg5F
         HBqN1G0vhaL+UbtImaTA/qpEcYb2OSgc/vSHjY3nFbZs/HOuhSQAwkK2VF3jURpjJOjQ
         bRLJVAFrGPkHfd94umMPfBh4/b6BeKEQgUEypwFBLt4IoLFkkkBaO/7+ozoyHWrj8pVj
         yH4D8Bzdr30Zs6iC/ifjy4JUlHXqAXuwHo4RRTROIw7oEXZt9zjOIuJtJoxyxFftEbYq
         gEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771815707; x=1772420507;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e8kO2ujp16Zpj6mO4gQkFAJV15vxcbGxwbg9/iRRePM=;
        b=Zj01vuwysxGN1ey3CRCVgzCvRS1wiG8JoyP1jdMAzHGx47Se0DQhmXlloki/HJvN85
         V8ebBc+N2vgswQSFBsrUJPwLVQvv1mMUcRuxV8jV1eUxu+rslyE/xYKN0Q/Uv0LjOD3P
         zBf9JzaWDiYwuf6EapMcxRbfmTm7FriqLMOJjGCl/nubAiQGWa6KotvO5jDT+Qyo6Fzh
         TVsQ5kGzuDoYM7vFM7sudWWQgBPct8SA2FXQtX463NqN+ihZmu2EziY7aiEO/mxxc6Fj
         xB2yc6jhAgele8mtAMgenH3WysRWPAUaVxcbO7VqrDe9oAgJOubSfZyjw+4+h44mGQrz
         gI8w==
X-Forwarded-Encrypted: i=1; AJvYcCWTPxNDxWhgrtoO+sYlSEdYcnQ3ZGf0Sna04vdAC0WJAEPDH553M/I5pDyhEVaCIMknMagFOU2lKRdSOrtmacMXjEU4@lists.yoctoproject.org
X-Gm-Message-State: AOJu0YxN4EeVp1Tq+6/5i6+bq0+HuYex8eiKGAsFlPBNJgX0SAf0xTma
	2TPXJVkFBE1megyv2YxW8o6eUTM4MOJQW9ZA25Wurllr/dinVRTpcXkL
X-Gm-Gg: AZuq6aJ2i0XlbNjnV7Mb954PtDfXXdWt1uO69RJlhPI0dx4rWnn+IeLCJtVXbFG7Ufj
	vvjJSinAUCuTIJtrEXax7bGmTcVsyf7lMM37V4QfZuoi1aOzRYljn0NZ+9jfAGUOHyyyouI/vt2
	TaWEdSTEaPtwIh0Ac+f10eLG6B5w542kYC67PvyMhq9/MAAwQPHQnLfx3dNqRyilxJyLE+UpKjo
	eBDJet2WGmFmnpoTeZHfP/4VHmurLLzq84B3hqQR+8UV8w4bJ5+RHSWHrqaMd6iwPUwS23t6fJL
	Kmt578l1ahUtZbMMWYwbFOwn96PhIUzso6AsBtrhmWWvLKXu72/m6yDlMF6shMnPGYqMMXI4vnc
	WED9rU5QpocfG977jp8VZTthT0NKoVb6kA0oC2AdJ0AvdJK+EGJ0C+z4ZxjshLLEWUXkhdyTIp5
	sp+b8Ss8NSKqFs9V+4mZHniDdNPhV9g4wXLx3Olztru27O2NFisBZbk7SvhfmryoHRpBLfpS58B
	/9N7RWi/sjy8787pg8dg0cHuQwk2+b46pAZ
X-Received: by 2002:a05:6214:246e:b0:88f:ca72:6ae8 with SMTP id 6a1803df08f44-89979d534eamr108864576d6.45.1771815707210;
        Sun, 22 Feb 2026 19:01:47 -0800 (PST)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e247b7bsm56049826d6.27.2026.02.22.19.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 19:01:46 -0800 (PST)
Date: Mon, 23 Feb 2026 03:01:44 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
Cc: anujmitt@qti.qualcomm.com, vkraleti@qti.qualcomm.com,
	sbanerje@qti.qualcomm.com,
	meta-virtualization@lists.yoctoproject.org
Subject: Re: [PATCH v4 1/1] crosvm: add recipe for ChromeOS Virtual Machine
 Monitor (VMM)
Message-ID: <aZvDGPW1kT_ZVu_h@gmail.com>
References: <20260219113015.3269886-1-kraghava@qti.qualcomm.com>
 <20260219113015.3269886-2-kraghava@qti.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219113015.3269886-2-kraghava@qti.qualcomm.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 23 Feb 2026 03:01:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9601

Thanks for the contribution! See below for questions.

In message: [PATCH v4 1/1] crosvm: add recipe for ChromeOS Virtual Machine Monitor (VMM)
on 19/02/2026 Keerthivasan Raghavan wrote:

> Introduces a new recipe for integrating crosvm into the
> meta-virtualization layer. crosvm is a lightweight, Rust-based virtual

We can drop the "meta-virtualization layer" from the description,
we know the layer just by it being here :)

> machine monitor originally developed for ChromeOS, and provides an
> alternative to traditional VMMs such as QEMU.
> 
> Adding crosvm to meta-virtualization offers users of the layer a modern,
> secure-by-design VMM option suited for embedded, containerized, and edge
> computing deployments.

We can drop the marketing for crosvm from the commit. Users
will make their own choice on what they want to use, so we
don't need the elevator pitch.

> 
> Build tested using meta-qcom MACHINE(qcs9100-ride-sx, aarch64)
> and meta-qcom-distro DISTRO(qcom-distro-kvm). Runtime is validated by
> running VM till boot-to-shell. The kernel and rootfs used are same
> as that of the target.

Which unfortunately means I'd have no way of being able to
build and test it myself. Getting this working under
genericarm64 or better qemuarm64 machine definitions (at list
minimal functionality is critical for being able to support
it).

> 
> Command used to run the VM:
> crosvm --log-level "debug,disk=off" run \
>        --disable-sandbox  /boot/Image \
>        --block /rootfs.img,root \
>        -p "console=ttyS0 root=/dev/vda rw"

I've started creating a pytest infrastructure for new packages
(and eventually the old ones) in the layer. If we get a machine
working that is more generic, we can add those. At a minimum
a README along side the recipe with testing instructions should
be done.

> 
> Signed-off-by: Keerthivasan Raghavan <kraghava@qti.qualcomm.com>
> ---
>  recipes-devtools/crosvm/crosvm-crates.inc | 966 ++++++++++++++++++++++
>  recipes-devtools/crosvm/crosvm_0.1.0.bb   |  26 +
>  2 files changed, 992 insertions(+)
>  create mode 100644 recipes-devtools/crosvm/crosvm-crates.inc
>  create mode 100644 recipes-devtools/crosvm/crosvm_0.1.0.bb
> 
> diff --git a/recipes-devtools/crosvm/crosvm-crates.inc b/recipes-devtools/crosvm/crosvm-crates.inc
> new file mode 100644
> index 00000000..5cc3fa9e
> --- /dev/null
> +++ b/recipes-devtools/crosvm/crosvm-crates.inc
> @@ -0,0 +1,966 @@
> +# Autogenerated with 'bitbake -c update_crates crosvm'
> +
> +# from Cargo.lock
> +SRC_URI += " \
> +    crate://crates.io/addr2line/0.21.0 \
> +    crate://crates.io/adler/1.0.2 \
> +    crate://crates.io/ahash/0.8.6 \
> +    crate://crates.io/aho-corasick/0.7.18 \

<snip>

> +    crate://crates.io/zerocopy-derive/0.8.14 \
> +    crate://crates.io/zeroize/1.5.7 \
> +    crate://crates.io/zstd/0.13.2 \
> +    crate://crates.io/zstd-safe/7.2.1 \
> +    crate://crates.io/zstd-sys/2.0.13+zstd.1.5.6 \
> +"
> +
> +SRC_URI[addr2line-0.21.0.sha256sum] = "8a30b2e23b9e17a9f90641c7ab1549cd9b44f296d3ccbf309d2863cfe398a0cb"
> +SRC_URI[adler-1.0.2.sha256sum] = "f26201604c87b1e01bd3d98f8d5d9a8fcbb815e8cedb41ffccbeb4bf593a35fe"
> +SRC_URI[ahash-0.8.6.sha256sum] = "91429305e9f0a25f6205c5b8e0d2db09e0708a7a6df0f42212bb56c32c8ac97a"

<snip>

> +SRC_URI[windows_i686_msvc-0.52.0.sha256sum] = "ffe5e8e31046ce6230cc7215707b816e339ff4d4d67c65dffa206fd0f7aa7b9a"
> +SRC_URI[windows_x86_64_gnu-0.52.0.sha256sum] = "3d6fa32db2bc4a2f5abeacf2b69f7992cd09dca97498da74a151a3132c26befd"
> +SRC_URI[windows_x86_64_gnullvm-0.52.0.sha256sum] = "1a657e1e9d3f514745a572a6846d3c7aa7dbe1658c056ed9c3344c4109a6949e"
> +SRC_URI[windows_x86_64_msvc-0.52.0.sha256sum] = "dff9641d1cd4be8d1a070daf9e3773c5f67e78b4d9d42263020c057706765c04"
> diff --git a/recipes-devtools/crosvm/crosvm_0.1.0.bb b/recipes-devtools/crosvm/crosvm_0.1.0.bb
> new file mode 100644
> index 00000000..4cbe9879
> --- /dev/null
> +++ b/recipes-devtools/crosvm/crosvm_0.1.0.bb
> @@ -0,0 +1,26 @@
> +SUMMARY = "crosvm"

crossvm is a little bit short for SUMMARY :)

> +
> +DESCRIPTION = "Rust-based KVM virtual machine monitor with a minimal, \
> +               security-focused architecture and sandboxed device processes."
> +
> +HOMEPAGE = "https://github.com/google/crosvm"
> +
> +LICENSE = "BSD-3-Clause-Clear"

With that many crates. Are there really no variation in
the license at all ? Note: other recipes are guilty of this as
well, and it's on my list to fix the up as well.

> +LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD-3-Clause-Clear;md5=7a434440b651f4a472ca93716d01033a"
> +
> +inherit cargo pkgconfig cargo-update-recipe-crates features_check
> +
> +SRC_URI = "gitsm://chromium.googlesource.com/crosvm/crosvm.git;branch=main;protocol=https"

I'm on the record as really not liking gitsm fetched repos
(see the ones I've expanded in meta-virtualization previously),
since it makes it very hard to bump the components of have
visibility into what is being cloned.

I probably won't insist on it, but have you tried breaking
this down into the individual clones ?

> +SRCREV = "b04c13a65b93034010b20612e3566d4f9d83c4f0"
> +
> +PKGV = "0.1.0+git${SRCPV}"

I think there are some stragglers in the layer, and maybe it
is my memory of PV crossing with PKGV (I prefer we use PV), but
do we need the ${SRCPV} ? the +git normally triggers it to
be filled in.

> +
> +DEPENDS += "libcap wayland wayland-native protobuf-native wayland-protocols"

With the hard dependency on wayland, is this always graphical ?

> +
> +REQUIRED_DISTRO_FEATURES = "kvm"
> +
> +COMPATIBLE_HOST = "(aarch64|x86_64).*-linux.*"
> +
> +BBCLASSEXTEND = "native"

Why the native variant ?

Bruce

> +
> +require crosvm-crates.inc
> -- 
> 2.34.1
> 

