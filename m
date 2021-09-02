Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
 by mx.groups.io with SMTP id smtpd.web11.2846.1630615049012432212
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 02 Sep 2021 13:37:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IFCeLeOm;
 spf=pass (domain: gmail.com, ip: 209.85.160.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f173.google.com with SMTP id t35so2768432qtc.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 02 Sep 2021 13:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=XeRFY9/ZZy14mpyplSaZf4wNb7e0AsyvHIX0H/HUifk=;
        b=IFCeLeOm9tbYO1l7G92fq0ylxbBsgCG14ssXxbqH4bPqRVDLru2Zr2fQNepDSPazo8
         38E99xtJtl+B4LLCtQM17kIxKuT0Yo0WNrGOviNgAmXGGh0yFjN5GHQP3eXQsRRS2HRO
         EtlEFqei1pSzSxzwrZjVsMHmuPk7yETjpfcrSaNso5CK590kIkvMXK6ZMRwzRHzKv+qT
         JwU04m/dDvNFOZCADq8nf6sxgHpxokkJnNoS41FII+3WVIUDTlKf0ZQ7Zvnak63a9mEJ
         AXgafiJS8v/1nc840pWDNrMQYQCMBlJ10+gQ4nACsGnI3ZYvZyX7bshnlvXWihl+mytY
         u6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=XeRFY9/ZZy14mpyplSaZf4wNb7e0AsyvHIX0H/HUifk=;
        b=LbS3VpQdXF7SRLc0RPf7AybEQlOcIn7HfE6gMSVGy5YgE0pZmj0Hi7tbODX23EjsEX
         D0/UnLPnb8TbtmWmLnGnyexWa2wHK7DzdmJRobzeNyP/wb1do7zNZvi11sv5VtV5lv42
         GCc4RrolDktVtPScxwN3gWm3oWGzYO3d/AMpmeLFlnI/p4/EXXhyNjBxYDt68hSOGfFv
         VTTwQU5c3FNJxisoPV5nW1Tl98VHJR0jMkxiF34W3UvnVDaZJzWI4skc14deFLZjKohZ
         YX5cbY61DSAY+guAdTg5elY32c5nFYkqTlSLXBt1B5jgXFSA+TlAW7oNdYzq+KCI+hNi
         A+tw==
X-Gm-Message-State: AOAM531dvuwTgQ2KEL2gcmCzZcsIaD9ciAY2BQNqMbq4m6+O4C+63b05
	QnRs4f1FfKXmA9HyjvHfj3c=
X-Google-Smtp-Source: ABdhPJz5IG03Ji1DLKNlp4L3sx/jqTZ3uYkiQJlG6rGSLLm2VaJKD4UUSlKdYok+huQWjiFyvkpjCw==
X-Received: by 2002:ac8:5802:: with SMTP id g2mr207608qtg.391.1630615048161;
        Thu, 02 Sep 2021 13:37:28 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (cpe04d4c4975b80-cmf4c11490699b.cpe.net.cable.rogers.com. [174.112.63.222])
        by smtp.gmail.com with ESMTPSA id u27sm2311352qku.9.2021.09.02.13.37.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Sep 2021 13:37:27 -0700 (PDT)
Date: Thu, 2 Sep 2021 16:37:25 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, cardoe@gentoo.org,
	Bertrand.Marquis@arm.com, andrew.cooper3@citrix.com,
	dpsmith@apertussolutions.com, persaur@gmail.com,
	scott.davis@starlab.io, adam.schwalm@starlab.io, jdmason@kudzu.us
Subject: Re: [meta-virtualization][PATCH 0/4] Xen Test Framework OEQA
Message-ID: <20210902203723.GA13022@gmail.com>
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

I'm cycle constrained while I finish up my ELC presentation and demo,
so I haven't had a chance to test this yet.

But i have queued it and pushed it to master-next, so others can
more easily try it out.

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
