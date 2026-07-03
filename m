Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8326C43458
	for <webhook@archiver.kernel.org>; Fri,  3 Jul 2026 15:27:46 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.95639.1783092464350715690
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 03 Jul 2026 08:27:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=qOUHf5mZ;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: ticotimo@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38005a36edbso517561a91.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 08:27:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783092464; x=1783697264; darn=lists.yoctoproject.org;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96YdBMnINKwtw1vPiGFO610ZZJlcFMR7nVAYTRfxowQ=;
        b=qOUHf5mZfr6HYp2JRFp6hJzr6RR/2O8udZYxrlw+c6xz8kVhwkH5xQCBJVyQkKiXQD
         6M5TxZzBa+6jFL6PTnsvwjrTuctbWk1o/CIB1nI0wJKtjdRLqbeZjc/kQ6iQBfKhZ2Vp
         R0/Z7qGtWds587K3ynCxS39UGetHCMd7S2sGFFr9g2KMBr9k0zK+92BkkD9Jf8XDVhPt
         PHB3jQAWJKzofhunAmHInGiNuZ8UtLcN2h+jRXRYl9XbIyjtpj/MHeyaph7s5oRB0FDo
         3ay6R2qgARFK+9plSW6f9iZwCR3bNkIo+aJI1w+btAtCsgC2cIkzLNw6QEtMs/ulHTCd
         PJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783092464; x=1783697264;
        h=message-id:date:references:in-reply-to:cc:to:subject
         :content-transfer-encoding:mime-version:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=96YdBMnINKwtw1vPiGFO610ZZJlcFMR7nVAYTRfxowQ=;
        b=N61IImVKjQCh0TJk/ff2OfigSJNgoiT95KW3fDEzhFEsMDpgqclEN9qzqBR+OHv5ee
         e6b+cD0d6+ga5CUTobHahiu7XBxVVzeXutielz4khShdcNgSaJGVuT9OsMgP4ZVP5xSx
         CE1G+MzNcnqDIxSFLWFKxY0JtY62v1PwcKQNsQGgyAjPgopf+btWbb3Qpw9bcSd82Q8r
         hY8iFsTGTN2tjVohjkp8Hqp7ST70ujkp5LIZc5MmXocfrZlLkFN7HfqCMfgXRCRTIRyX
         0i+f0GIGYS/oechCyu9sZ6QYzaprCsTO7vqBmySQfSdL1ZLsJigL47b4MSS29A7ESyb4
         0hwA==
X-Forwarded-Encrypted: i=1; AHgh+Rq8DyWXLuoy0hOh6azJe2d+mNrEFd6hIzBWhdg5m2Wjmgql7gf5wju//4mHtQ+PxKcMD6OfFUQXp5Ea0ogEOjzGRa/P@lists.yoctoproject.org
X-Gm-Message-State: AOJu0Yw5mlIzVYKP06s1EmVtd8Amx5Z8iIq9Yn90JKuoNxTjGWqK0SmY
	jNPPyupLMCPvSAv3MjVcQXZa6yHoJ+0cpDbkNzUpJ3oMjIKVsdqB6XEA
X-Gm-Gg: AfdE7cl79JAxyD+d5SHQdYVomeE99sF33c/j2P9Et5nQekF/vC//+nWreVQLKwRocji
	mUdtAr85dAQNh6EDHj3WJqOpzepBkYb72V2q2l1QFc5AzDW8AxnSfa3hlGqbyjcyg4aMvCiYcjW
	L4m09FfM8N4/0FCEg0TO8ayFDOysqRpizdMkC0Tqqid68Gx8hulc7wKaB8g9wE9yT3WHM64GRqn
	7mo47MyfDUai6VndegesrOofq3w79kBteK2i5ei87BbTVFEcctGXcvKOQxgt3DY1SUJEfh4BnzO
	AIh+rzIaDzrTexuMIqt673FofFeqptxy5fIJwFPkStYofcok+xAU0BO/tTb8uXZIQ+rkJE+ft/S
	qEZXlAWeCSJiig/8quGQ7zqphrQAbPsyFoDZS+QCYxU7bQK+GK9wf5Z1vLUHY8W+Jsxbzi/h0en
	XOeYHtuQdG44hSdDGWoQmvsyFhYM7gBuO6XCDExUGjBpcb9Q==
X-Received: by 2002:a17:90b:1d04:b0:380:8b14:d8e6 with SMTP id 98e67ed59e1d1-3829f0fe669mr3389a91.17.1783092463554;
        Fri, 03 Jul 2026 08:27:43 -0700 (PDT)
Received: from macbookpro.home.local ([69.9.132.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c8b700sm1149423a91.11.2026.07.03.08.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 08:27:41 -0700 (PDT)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [meta-virtualization][PATCH 2/7] recipes-containers/images:
 add app-container-python
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: ticotimo@gmail.com, meta-virtualization@lists.yoctoproject.org
In-Reply-To: <6a2c4892.b63906d5.2d75f7.2d6d@mx.google.com>
References: <cover.1780104071.git.tim.orling@konsulko.com>
 <2c612245431bf2ebcfe9c4f188be1e27117cc0db.1780104071.git.tim.orling@konsulko.com>
 <6a2c4892.b63906d5.2d75f7.2d6d@mx.google.com>
Date: Fri, 03 Jul 2026 08:27:40 -0700
Message-Id: <178309246044.29524.753835150477235730.b4-reply@b4>
X-Mailer: b4 0.16-dev
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 03 Jul 2026 15:27:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9918

On 2026-06-12 10:57:38-07:00, Bruce Ashfield wrote:
> Hi Tim,
> 
> Just a couple of comments ...
> 
> On Fri, May 29, 2026 at 18:31 -0700, Tim Orling wrote:
> 
> > Add OCI container image recipe for Python to use as a base for
> > other Python app containers. The image uses multi-layer mode with
> > separate base, terminal and python layers.
> 
> [...]
> 
> > +OCI_LAYERS = "\
> > +    base:packages:base-files+base-passwd+netbase \
> > +    terminal:packages:ncurses-terminfo-base \
> > +    python:packages:python3+coreutils${@bb.utils.contains('PACKAGECONFIG', 'dev', '+python3-pip', '', d)} \
> > +"
> 
> I like this conditional. Putting the bb.utils.contains() directly inside
> the layer's package list (instead of duplicating the OCI_LAYERS
> declaration in two PACKAGECONFIG branches).
> 
> Worth calling out in our multi-layer mode docs as the recommended way
> to do conditional packages-per-layer. I'll do a patch for that.

Just capturing that conditional packages-per-layer docs merged in:
27e41b91 docs/container-bundling: refresh multi-layer mode section

> 
> > +# IMAGE_INSTALL triggers package builds via do_rootfs recrdeptask.
> > +# Even for multi-layer mode, list packages here to ensure they're built.
> > +# The PM will install them directly to layers from DEPLOY_DIR_IPK.
> > +# Note: IMAGE_ROOTFS is still created but ignored for packages layers.
> > +IMAGE_INSTALL = "base-files base-passwd netbase"
> > +IMAGE_INSTALL += "ncurses-terminfo-base"
> > +IMAGE_INSTALL += "python3 coreutils"
> > +IMAGE_INSTALL += "${@bb.utils.contains('PACKAGECONFIG', 'dev', 'python3-pip', '', d)}"
> 
> This is correct today but it doubles the source of truth. The packages
> listed in OCI_LAYERS:packages: and the packages listed in IMAGE_INSTALL
> have to be kept in sync.
> 
> If they drift (change OCI_LAYERS but forget IMAGE_INSTALL or vice
> versa), the build silently breaks at layer assembly time when the
> missing package isn't in DEPLOY_DIR_IPK.
> 
> Two paths I'd consider, either as part of this series or as a follow-up:
> 
>   a) Add a "# KEEP IN SYNC WITH OCI_LAYERS" comment so the next
>      maintainer knows.
> 
>   b) Better: derive IMAGE_INSTALL from OCI_LAYERS:packages: layers
>      inside image-oci.bbclass, so the recipe only sets it once. That
>      fixes the problem for every multi-layer recipe, not just python.
> 
> I've staged b) on master-next (shortly), if you can do a) .. or maybe
> it isn't needed at all now.

Option b) was merged in:
5470cd0a image-oci: auto-derive IMAGE_INSTALL from OCI_LAYERS packages layers

I don't think a) is needed anymore, since b) is proven to be working

Refactored to remove the redundant/brittle IMAGE_INSTALL in v2.

> 
> We can do the same for all the other similar recipes in the series.

Other similar recipes addressed in v2.

> 
> One more, also non-blocking — the other 4 new image recipes in this
> series (mosquitto, valkey, nginx, curl) all carry the
> rootfs_fixup_var_volatile postprocess to create /var/volatile/{tmp,log}.
> 
> This one doesn't. Intentional because python doesn't touch /var/log? Or
> worth adding for consistency in case someone runs as 'dev' and pip
> wants a writable spot?

Added rootfs_fixup_var_volatile via 'inherit container-volatile-fixup'
in v2.

> 
> Bruce



