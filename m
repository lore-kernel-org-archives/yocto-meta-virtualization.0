Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web10.3637.1594263975197771448
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Jul 2020 20:06:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ELTqsUCa;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC40AE01E2F; Wed,  8 Jul 2020 20:06:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,PDS_BTC_ID,
	RCVD_IN_DNSWL_NONE,URIBL_RED autolearn=no version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 URIBL_RED Contains an URL listed in the URIBL redlist
	*      [URIs: yoctoproject.org]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.219.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.5 PDS_BTC_ID FP reduced Bitcoin ID
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24BCBE01E2D
	for <meta-virtualization@yoctoproject.org>; Wed,  8 Jul 2020 20:06:12 -0700 (PDT)
Received: by mail-qv1-f68.google.com with SMTP id t11so363714qvk.1
        for <meta-virtualization@yoctoproject.org>; Wed, 08 Jul 2020 20:06:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=5SZOCkL2hyM5bQ5nVDhq0Nha51VCD3EhlaykAtqG5vM=;
        b=ELTqsUCaURAWfm6JnK2r+hA3TJ8FPG54MgToGV1jcg6ZCbRG4N5LQ96MHSDIsYIXp/
         QeF9rSNfb2FAtLbUlXJihoBgVt+s9E/a9WkEB5Q1qidEUgn+/9uJhhdpVDpHWIFc8/vn
         V5omL2cT+hEYi9vlTWXTVTVBMuCz3a8C2syGXmqx1S+qJC3khG9vrroUsZuvn90eX9zE
         GuzB1yvvtYqaOvqjrDVb3I0kGg5yG/xOtJCBdiEVtyRNASnLYTbCIibLUMWnIyFm9GEC
         Hl5bFI7oxmMrrR+fF9I6o2GBSU/6VQZCzWIRrPeXNjCXVHNE2k+PPuPSQWG394Czc3B/
         5nkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=5SZOCkL2hyM5bQ5nVDhq0Nha51VCD3EhlaykAtqG5vM=;
        b=YAVRdP9Q63bGlHfAFfN9xQ0XazmW7+oFpbFPiztR3JmcCYU96hOfznV3EWaOkUSqOn
         2DBPcszNZ/jz01pFm5nACoE3ZMJKS3CSdtUt6ZOYi5dlgyD8ywhp25zdN1BXd1F57GuZ
         CTZwqWaLo3qYdmqALps5o0Bis4R4sujghfT5fwun29Kwf0i0t3AlNIv67AnXFAbO9eN8
         oZOcDsdfblHK5MxEQWVSNVK2pdcxEI/PWWwhEFA8ovShY8OJjG+qznhjSt0/u3LPuUmb
         ZiOhHxL4ZjjcHc8A81j/LemNulAgcvzYk20ViH2crsvzj8JKJT5JG8zU8EoOoUw7t/8X
         lYpQ==
X-Gm-Message-State: AOAM5316T5DyANWh1e8EMcj3HKgDUbbYoWf3Vrr7+IsStGvZTxR0ulgt
	9d7w/lpkuk+xA3jUsXOhEpU=
X-Google-Smtp-Source: ABdhPJxgdxKqpXiRHg1/3Jj+N15iaQnwgN1/PFb4LLRjUkgYaMU22irJGob0nFa7jiJhhMNhiI1Ggg==
X-Received: by 2002:a0c:aa9b:: with SMTP id f27mr61470469qvb.9.1594263970775;
        Wed, 08 Jul 2020 20:06:10 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id r5sm2292816qtc.20.2020.07.08.20.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 20:06:10 -0700 (PDT)
Date: Wed, 8 Jul 2020 23:06:08 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zhengruoqin <zhengrq.fnst@cn.fujitsu.com>,
	zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-coverage: Remove recipe
Message-ID: <20200709030607.GB7843@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1594024588-6636-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594024588-6636-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594024588-6636-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594024588-6636-5-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594024588-6636-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1594025195-53329-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1594025208-53366-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
 <1594025238-53404-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There's no longer a reason to pin the versions of these, or to have the _git
variants around .. so I've merge this change.

Thanks for the cleanup.

Bruce


In message: [meta-virtualization] [PATCH] python3-coverage: Remove recipe
on 06/07/2020 zhengruoqin wrote:

> This recipe already exists in meta-openembedded, the path is:
> meta-openembedded/meta-python/recipes-devtools/python/python3-coverage_5.1.bb
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-coverage.inc                 | 18 ------------------
>  .../python/python3-coverage_4.0a5.bb           |  2 --
>  2 files changed, 20 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python-coverage.inc
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-coverage.inc b/meta-openstack/recipes-devtools/python/python-coverage.inc
> deleted file mode 100644
> index f1c5022..0000000
> --- a/meta-openstack/recipes-devtools/python/python-coverage.inc
> +++ /dev/null
> @@ -1,18 +0,0 @@
> -#
> -# Copyright (C) 2014 Wind River Systems, Inc.
> -#
> -DESCRIPTION = "Code coverage measurement for Python"
> -HOMEPAGE = "https://pypi.python.org/pypi/coverage"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/BSD;md5=3775480a712fc46a69647678acb234cb"
> -
> -SRC_URI[md5sum] = "37f4d8ae679b2c43a87da8d519817a3b"
> -SRC_URI[sha256sum] = "07a36ac3c82f5961c45565fd5575b4c568a8fc59e8d5d29a5b04dc8597a07e0e"
> -
> -inherit pypi
> -
> -DEPENDS += " \
> -        ${PYTHON_PN}-pip \
> -        "
> -
> diff --git a/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb b/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
> deleted file mode 100644
> index 917a06c..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-coverage_4.0a5.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-coverage.inc
> -inherit setuptools3
> -- 
> 2.17.1
> 
> 
> 

> 


