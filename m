Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E06EEE677E2
	for <webhook@archiver.kernel.org>; Sat,  2 Nov 2024 04:05:16 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.11148.1730520310202110877
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 01 Nov 2024 21:05:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mSKROx91;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b14554468fso181347585a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 01 Nov 2024 21:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730520309; x=1731125109; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3HIWWVO2BbW17IVMiv7GD2de7fC7knU13Ov6VX4izbQ=;
        b=mSKROx91m0mY0A4BhasFySKdqur4Hc2Ix7jZiWzGSjQDcvOd2KnZmG0UMMcCafF5rR
         nwrZFfUjBb5IBY6OFOPaiLQDgxba5eBTRZXMGALbiNMugRyH4lP9/jF4lGh1XGTkxaCm
         VvsXSquCR7nra7uR6AjqUkEJH23x6EYXUIBvdM7xx/j/86o6lFGyVDnnRQHqZdzh8VrM
         ljvxaOZzgs/4gX5FZwfwoN0B4oXE7Wuio+DiPpIPLGpshdzL8kVDRX0dYvQbZUhPO1go
         PB1vWDnRdtO/hy+F9/kBufanU6bxyG7AP9Khdzg28hhBkMVfUqeRRWKPTK1DPW4khlWf
         uR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730520309; x=1731125109;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HIWWVO2BbW17IVMiv7GD2de7fC7knU13Ov6VX4izbQ=;
        b=VjnyBskKIVeRikNFIRDTxlb24ZERT3ckt21/h4E/PDGCYk3ThPW0Z84F3UYkIHhdR7
         JMMcxQ67XTCxMfOnbyncPBUpdPBcHNbziG0yEOL+ZOM+M9G0wCZ89th614rSYba3DOEd
         ueCZH78E7sDv7x/XG0PWUC/3Ryi3ifGulzsk1ErMA3nGnoRwJ9b/bZoIZxxQDBaepEAb
         05IFLlAg+wrLvTLZx50LOKb8SdZZodEnsqCIMbrQe/gIKcEUS/neqryDZ+GcSRKDk2Qc
         B1dQ5uYKfJuYt6nG/O8Uj0zaFrZidb1ygyhBd/Ohjdenx+C0Lschdl9/PchqdSHSTOqG
         W+bg==
X-Gm-Message-State: AOJu0YyJCvrB0z9rJfNcGYUWPhDbEdKZthoJXhVQdpMkJdrjTaBYhC2R
	tIWA6BN1s15JOFCRznx9GxNpCXEcmR0RMteFiVYdj5OsDjuVUKEZ4hGvew==
X-Google-Smtp-Source: AGHT+IHQI/Ij2A4B1TqhxsJ5U3+8G/YdeXEGT+oEI7DKOdS1ghMSthvmiNfAPswxNa4PziKA8EK4jQ==
X-Received: by 2002:a05:620a:24c5:b0:7b1:1269:44bc with SMTP id af79cd13be357-7b193f0b86emr3867881285a.39.1730520309165;
        Fri, 01 Nov 2024 21:05:09 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a6fd7csm230355085a.74.2024.11.01.21.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 21:05:08 -0700 (PDT)
Date: Sat, 2 Nov 2024 00:05:06 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: bin.lan.cn@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [master][PATCH] openvswitch: fix ptest
 contains reference to TMPDIR [buildpaths]
Message-ID: <ZyWk8nbXVs8cPV4C@gmail.com>
References: <20241021112343.2793593-1-bin.lan.cn@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021112343.2793593-1-bin.lan.cn@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Sat, 02 Nov 2024 04:05:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8952

merged.

Bruce

In message: [meta-virtualization] [master][PATCH] openvswitch: fix ptest contains reference to TMPDIR [buildpaths]
on 21/10/2024 Bin Lan via lists.yoctoproject.org wrote:

> The EGREP in ptest/tests/atlocal contains the build paths.
> The CFLAGS in ptest/tests/atlocal contains the build paths.
> This change set fixs:
>  - set EGREP to "grep -E" in ptest/tests/atlocal
>  - set CFLAGS to " " in ptest/tests/atlocal
> by updating the patch
> openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch.
> 
> Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> ---
>  ...est-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> index 571753a5..abad1458 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> @@ -16,6 +16,13 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>  refresh patch to fix patch-fuzz warning
>  Signed-off-by: Changqing Li <changqing.li@windriver.com>
>  
> +Refresh patch to fix file ptest/tests/atlocal 
> +contains reference to TMPDIR [buildpaths]. The fix is:
> + - set EGREP to "grep -E" in ptest/tests/atlocal
> + - set CFLAGS to " " in ptest/tests/atlocal
> +
> +Signed-off-by: Bin Lan <bin.lan.cn@windriver.com>
> +
>  Upstream-Status: Inappropriate [embedded specific]
>  ---
>   Makefile.am |  1 +
> @@ -37,7 +44,7 @@ new file mode 100644
>  index 0000000..0b4587c
>  --- /dev/null
>  +++ b/test.mk
> -@@ -0,0 +1,74 @@
> +@@ -0,0 +1,76 @@
>  +TEST_DEST ?= ${prefix}/lib/openvswitch
>  +TEST_ROOT ?= ${prefix}/lib/openvswitch
>  +TEST_DEPEND =
> @@ -112,3 +119,5 @@ index 0000000..0b4587c
>  +	sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
>  +	sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
>  +	sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g' $(TEST_DEST)/tests/testsuite
> ++	sed -i 's|EGREP=.*|EGREP='"'"'grep -E'"'"'|g' $(TEST_DEST)/tests/atlocal
> ++	sed -i 's|CFLAGS=.*|CFLAGS='"'"' '"'"'|g' $(TEST_DEST)/tests/atlocal
> -- 
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8933): https://lists.yoctoproject.org/g/meta-virtualization/message/8933
> Mute This Topic: https://lists.yoctoproject.org/mt/109130169/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


