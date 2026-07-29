Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB0CCC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 13:44:31 +0000 (UTC)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11638.1785332661925609922
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 29 Jul 2026 06:44:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=lPin+ezm;
 spf=pass (domain: gmail.com, ip: 209.85.208.44, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-698acd36d67so1672447a12.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 06:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785332660; x=1785937460; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=K1tUN9/wIn4gl+v37CP6X0LRZ1+FyVenuEzGkeTXxwQ=;
        b=lPin+ezmnQCLZM29DOIKWGVyz/X5467o5Y3zSArAvWiDLusGNzq/9utGrPAadIRKHr
         KqTvdAqQKYKqaXNg4wgTHV9lc7MF972ACG9DP87rOhaLa5X3Hxt8MWWb3tBomg6fuqeO
         hrx5R9spV0GAQU1TiIZszBbBIJYSEIT1uJ82H5nt+8EylNsCC/n44EUzE9PkWIXd2iDS
         mUQIaNww/lYHAPSnSWhtVUYoCwhmJPDMmThg9HuDIAWe1QcQjcFMdkCezgDfpTvhU96w
         RQr+RVDaSfaZy0wsrXaGm8eEta5QV7XpyukZS3Nx3f6stVT1rulZ3FDnHVeMVHdbXye+
         2KKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785332660; x=1785937460;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K1tUN9/wIn4gl+v37CP6X0LRZ1+FyVenuEzGkeTXxwQ=;
        b=DOYjtcqOGViiMgPLHAlyMHsTTiKJRtO2Vk9Fze8ezwK2ykUXbIqqhaDS0YO8jA5SQL
         tcak7cTMv3tIPTX0XPCXZ/Jlc4qsKblLNC2eukzlW2aZY3JegaZjLA+uNIedv3I0FUiZ
         j9mqw1B24AB41Dh2FexeufKQEVgs2gXA9RUv3g5d75Vv/oTzsCSAGRyFmy4vKd5DFNPQ
         NQJsRCOMhgI6+iDOTADPd+rFK03yOe/SxdkZaefahRJF0l6Ob2jiWv8M/ppXib2FFbsC
         7lBoVU+vDWQOjH3tba9FaBL4YUw/5oKqbAABv6FuP+0slWEdcBzgeYzyl+Nz1bPajbb7
         Wr9Q==
X-Gm-Message-State: AOJu0YzJKfpaiEWbgIlZ6sYr7ltCZqiBIUfmLYcPc+aGQiPBLUSggokY
	Zr6M2l+Lf+x2iZj85b8TrzLsM7oK26UMCZ/HtLh2tuQnk5X/69TtkAIDpPLm9U5R
X-Gm-Gg: AR+sD12VZWgTLmkWN4JHDAZ5hjioAFU0f36LXcjVAm4MFG7w30auyU5RldHf3CjjaPA
	yVGZddmDzgJS/58uQ60UuT0Iw9QPWTHGoGW2d7AvX9M7khzSPpl1dWNGtouKIvv5yh8SuSelxSx
	tYlRkWgL/fLDBlWK8sue1H/jKrhZlzpW0JHLS+y19uI+QPSIdEZUWz41BLU6DNoMpzhS21HiI4J
	0CZLJyYBCPiIvo9SE0tO+Kc06Ukm8undVsECEU9EsO/bYwzgmjA60ULhOD3Yyo+GLWuhMG5go/f
	Zzjzdvjp+udUkeg90sCFJqL94YFXNy5xVnVkFyk4BP3ySzhdRp0P9+2KH4sRgEaDUE8I9+BqzHp
	BjwK+7zIqyCWH1sUQDt0X8XrRalJ7TbmczWOGJ2XjGHdxQAu1gX1nCiEgqoxzxqvAMGbJm4OWJa
	tSxG5IBVXPtuAUEjpoZgMCR5F95AL2bQV/5Ivte7RZeOYw7VqTfMJu3XwwOI4HXl74rkEtuRK5v
	deX4JZuwxPJAljSOkAq47TKB+wDKEV9Bk5Zt94qKYSSPHRnKHYkwr3ZHvOP7/YXwXEqdnNkIeiv
	nNiOz2nm1RSlzo+RSQNkI8LTmGa4wAzX3UXbNrNz0OQy76D3HvxzBpWThtrS2w==
X-Received: by 2002:a05:6402:28c4:b0:69c:7798:407c with SMTP id 4fb4d7f45d1cf-6a0349f627amr3190422a12.6.1785332659864;
        Wed, 29 Jul 2026 06:44:19 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a050c78e65sm889108a12.31.2026.07.29.06.44.18
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:44:19 -0700 (PDT)
Message-ID: <6a6a03b3.f7311dcd.2016ce.3464@mx.google.com>
Date: Wed, 29 Jul 2026 06:44:19 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH 2/2] image-oci: drop *-initial
 sysroot deps in do_image_oci to avoid libgcc collision
In-Reply-To: <5437D436-C625-4B0C-8639-94E02C91640E@oss.qualcomm.com>
References: <20260728115516.1107990-1-koen.kooi@oss.qualcomm.com>
 <20260728115516.1107990-3-koen.kooi@oss.qualcomm.com>
 <6a6970bd.406b8c64.14ed61.8fa1@mx.google.com>
 <5437D436-C625-4B0C-8639-94E02C91640E@oss.qualcomm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 29 Jul 2026 13:44:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10016

Aha .. I missed some of the details your cover-letter reply until just
now.  Rereading it now, along with today's do_image_complete report,
changes what I think we should do here.

Disregard the shortened variant I posted.  It inherits the same scope
limitation as 2/2. If the reachability path is actually

  do_image_oci -> do_image -> do_create_rootfs_spdx
      -> libgcc-initial.do_create_spdx
      -> libgcc-initial.do_populate_sysroot

then libgcc-initial is coming in through do_rootfs's own SPDX chain,
not through do_image_oci[depends] at all. Which means:

  * Anything that inherits image has the same reachable node,
    which matches exactly what you're seeing on do_image_complete
    hitting the same crtendS.o collision.
  * Patching only do_image_oci's prefunc is whack-a-mole. There
    are more image tasks in that chain and each one hits the
    same wall for the same reason.
  * I agree with your original thought in the cover letter --
    "blacklisting -initial feels a bit too specific and narrow
    to me" .. but I still don't have a solid idea either.

So: not merging 2/2, and dropping the shortened version I sent as
an alternative. Neither addresses the actual scope.

On next steps.  I'd like to try your reproducer myself so we're both
looking at the same failure. My boost-in-a-packages-layer recipe ran 8
clean-sstate cycles without triggering it; whatever crosses the
"sstate has to populate both libgcc variants" line was clearly missing
in my effort, so tensorflow-lite as the actual C++-heavy trigger might
actually trigger it for me.

Once I can hit it locally, I want to look at your first option --
fixing SSTATE_EXCLUDEDEPS_SYSROOT's gating in oe-core to key off the
dependency being *-initial instead of requiring the consuming task to
be do_populate_sysroot. That's the root-cause fix, and if it we fix it
in oe-core it covers do_image_oci, do_image_complete, and whatever the
next image task in the SPDX chain is that we haven't hit yet, all at
once.

The current gating is could arguably a bug of its own -- the exclusion
regex is named SSTATE_EXCLUDEDEPS_SYSROOT, not
SSTATE_EXCLUDEDEPS_DO_POPULATE_SYSROOT_ONLY, and the gate narrows it
to only one consumer for reasons that don't seem to be documented
anywhere I could find.

The other two options you named: keeping do_image_oci off the generic
prefunc path, or giving do_image_oci its own sysroot .. I think they
would still leave do_image_complete and friends broken by the same
root cause .. so we'd just be chasing similar things popping up.

I'll try and get set up to see the problem here, that way either of
us could potentially take a run at the oe-core fix.

If that fails, we'll come up with something that can live in meta-virt
since this does need to be fixed.

Bruce

