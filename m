Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web12.3427.1631212660815219498
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 11:37:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=h5J8w/Ve;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id t4so2873852qkb.9
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 09 Sep 2021 11:37:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=FlfquHuE46EffcJyxINNwWAMiCXCeqW/xtlkU95S4Hs=;
        b=h5J8w/Ve/Hk6GG2DnwujOCGkzawiWCEeXyLbhXf5njFXeJqjw2jb0xex+QsCJv96Xm
         rSNxLB1PpJWpyOlrakSaTSHerZwn0wDSDi8sjgep24U1QPwPG0h0Rm13qhefReh0fqNF
         Sb5OCw4KCi/70BLBhvs3yPbh7ecLsHdZyP9IkAZsqKwtBSBqupXaNE6eoanff+xNb/cY
         AG2lwTAMmnJwU13QIHo5/+r/GNbgIW3LzeS9MK7Tvyo2uL4+bha8Nyay437olWLxjsP/
         OXh2YB2VLg7W2jiuPzPbfAv3m5sEYDObKmwkp7wNAGzBIko298w1czQVF93QzV/bVhPH
         PTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=FlfquHuE46EffcJyxINNwWAMiCXCeqW/xtlkU95S4Hs=;
        b=LcFuFRckFFqpi77UWz/mrAVvodWBcpLcqYZTOtgWD9M4ZcJaD1xVXQLc5pMLEv25J/
         5s4rz015lg/cEVcTtA3U+P46LbaA/k4zRWM868dQhIja6C4PHp5Q+NY/UGjfhfB6yvS7
         3JibBrR7KrJUX3vBvQ5GtSkCdPLPZ4vqvHjpKkzJONrjBv3kwKG1esKu2ECChkjqVffs
         MYTyvkbQF9J2s4pbAhjcpRKV5TnAgWwZWZcAANICT15rxWYxaP8ZGqWqw+ZLoBiENK/P
         goIM5/i3F6tYZfKU96V1Yxb44YXzfRN9Sy+4NodEVPnCUuTuVjisZNVbkOy/QXUbI/CC
         toOQ==
X-Gm-Message-State: AOAM532yrSHliKfQKjlgzrw5CnRFeMNdbuLUu/3j0VS8CyTu4fs6IEl8
	OeTd3LUfc39cmgqWiLoHxG0=
X-Google-Smtp-Source: ABdhPJw4MX89pm8fXgK4D5yRdt9mPSJ7vt+Tp/9W8UTSIpn/vBHG7Slfo6yr6evKqFKjG+IUJ+45xw==
X-Received: by 2002:a05:620a:d87:: with SMTP id q7mr4103959qkl.173.1631212659817;
        Thu, 09 Sep 2021 11:37:39 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id h4sm1868870qkp.86.2021.09.09.11.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Sep 2021 11:37:39 -0700 (PDT)
Date: Thu, 9 Sep 2021 14:37:37 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com, persaur@gmail.com,
	scott.davis@starlab.io, adam.schwalm@starlab.io, jdmason@kudzu.us
Subject: Re: [meta-virtualization][PATCH 0/4] Xen Test Framework OEQA
Message-ID: <20210909183734.GA35070@gmail.com>
References: <20210831232743.252498-1-christopher.w.clark@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210831232743.252498-1-christopher.w.clark@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


In message: [meta-virtualization][PATCH 0/4] Xen Test Framework OEQA
on 31/08/2021 Christopher Clark wrote:

> This series integrates the Xen Test Framework (XTF) into the
> OpenEmbedded QA (OEQA) structure and enables testing of Xen with XTF
> test cases in Qemu via the standard OE testimage mechanism.
> It builds upon the earlier work to package XTF and the XTF image.
> 
> I am aiming for this test to be enabled by default to support test
> coverage for the Xen hypervisor and initial virtual machines, the
> Xen toolstack and XTF.
> 
> Since many XTF test cases have hardware-dependent behaviour, the list of
> XTF test cases to run is minimal by default but able to be extended as
> appropriate for a particular downstream image or machine via provided
> configuration variables documented within the test.

These have now been merged to master!

Thanks for the series.

Bruce

> 
> thanks,
> 
> Christopher
> 
> 
> Christopher Clark (4):
>   xen-image-minimal: supply bootloader config for qemux86-64 machine
>   xtf-image: fix QB_DEFAULT_FSTYPE: only needed for x86-64 qemu
>   xtf-image: update qemuboot settings
>   xtf: add testimage integration to run XTF test cases in OEQA
> 
>  .gitignore                                   |   1 +
>  classes/qemuboot-testimage-network.bbclass   |  17 +++
>  lib/oeqa/runtime/cases/xtf_minimal.py        | 116 +++++++++++++++++++
>  recipes-extended/images/xen-image-minimal.bb |   3 +-
>  recipes-extended/images/xtf-image.bb         |  20 +++-
>  wic/qemuboot-xen-x86-64.cfg                  |   8 ++
>  wic/qemuboot-xen-x86-64.wks                  |  12 ++
>  7 files changed, 171 insertions(+), 6 deletions(-)
>  create mode 100644 classes/qemuboot-testimage-network.bbclass
>  create mode 100644 lib/oeqa/runtime/cases/xtf_minimal.py
>  create mode 100644 wic/qemuboot-xen-x86-64.cfg
>  create mode 100644 wic/qemuboot-xen-x86-64.wks
> 
> -- 
> 2.25.1
> 
