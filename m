Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2378.1595271112303579437
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 11:51:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=YNsripoj;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 28431E01ED0; Mon, 20 Jul 2020 11:51:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.222.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDB68E01ECE
	for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:50 -0700 (PDT)
Received: by mail-qk1-f196.google.com with SMTP id d14so4820693qke.13
        for <meta-virtualization@yoctoproject.org>; Mon, 20 Jul 2020 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=1kQaizrNfFAMMReKtFgtAvseiLxQ41NWiB3Fg4Xf43c=;
        b=YNsripoj5EXdIY4IAzLFpav8fK4h8WdIH1aHLv6grGA3BzSKjTqzOd3sL0QNnEfBmB
         /hWu4V+tZkbApuHePAf/Q5nZwG/gp5nNQHm3XP+yO2hc0gJ/IjgQ32QaoxKLiDE7d3pB
         yvZQqcOgVY3DER0Td0iksCrUeWDNkGnM9bIrfj6rUIs/dilnr2WK46FDPpRl8VPM3xCA
         zViH8qXjLeS38Hou0RYOrjFcEM74Mr/k2lRJ4jpLacYTOp0TR7CBFYLYotCR/pRJCoce
         I9w9kGndcVQGQ8pbGltrefmaQep7tC9cWpdyeXDWlgvvlB9GhyZtcqNnXxAEc9w/GaOL
         +K4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1kQaizrNfFAMMReKtFgtAvseiLxQ41NWiB3Fg4Xf43c=;
        b=EPhsyz92sLwTixW0PfCLHcWtg5+FznM4AhkES42f/a/FIhHHc1NDk4GDTZ/1wibjsg
         raEnAP1DPIqHZU3tusCbgooRto+oahySq2UPcFXofgFr2usRsHRvudSZ1HGhuq1yVcJq
         FJt763Jh5GiC7j5gLfkE+l3szarb+d7oMD3jpLUeZAraCoKs2wQjrS2lg1JwkxE061oV
         6TGlZIxRI2jA5OpdfMA7qP7g3dc5htRGz7PbKpN0byepVi5UHdt/QuaqMeXxDN9AjoUQ
         udi0Ojpk3lZ5Fd77CM5Qeojs2N7hIz5bBYt5WtNwTiMfS0RNsZAHj1uoPbFPhzhrPg8O
         jrKQ==
X-Gm-Message-State: AOAM5329gv/+XF0kH6t1n6tqgg2ykp+QgijRmEnL1cNuEB2RlMrVxEDY
	ZYd7qrYbIl0ELI86WvTqcbk=
X-Google-Smtp-Source: ABdhPJyRrRgfVXiZaGTXyO+LtiDo44y4hLjumxCMN3n1T+YLsiVs8fW0NaRTvP6yITp0gXRz2oj/kA==
X-Received: by 2002:a37:9b15:: with SMTP id d21mr6848046qke.87.1595271110013;
        Mon, 20 Jul 2020 11:51:50 -0700 (PDT)
Received: from gmail.com (CPE04d4c4975b80-CM64777d5e8820.cpe.net.cable.rogers.com. [174.112.240.214])
        by smtp.gmail.com with ESMTPSA id i26sm395162qkh.14.2020.07.20.11.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 11:51:49 -0700 (PDT)
Date: Mon, 20 Jul 2020 14:51:47 -0400
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python3-deprecation: upgrade 1.0.1 -> 2.1.0
Message-ID: <20200720185146.GC40605@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1595255817-77606-3-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1595255817-77606-4-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1595255817-77606-2-git-send-email-zangrc.fnst@cn.fujitsu.com>
 <1595255817-77606-1-git-send-email-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce



In message: [meta-virtualization] [PATCH] python3-deprecation: upgrade 1.0.1 -> 2.1.0
on 20/07/2020 zangrc wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/python3-deprecation_1.0.1.bb                |  2 --
>  ...on-deprecation.inc => python3-deprecation_2.1.0.bb} | 10 +++++++---
>  2 files changed, 7 insertions(+), 5 deletions(-)
>  delete mode 100644 meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
>  rename meta-openstack/recipes-devtools/python/{python-deprecation.inc => python3-deprecation_2.1.0.bb} (53%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb b/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
> deleted file mode 100644
> index d2e0f1c..0000000
> --- a/meta-openstack/recipes-devtools/python/python3-deprecation_1.0.1.bb
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -require python-deprecation.inc
> -inherit setuptools3
> diff --git a/meta-openstack/recipes-devtools/python/python-deprecation.inc b/meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
> similarity index 53%
> rename from meta-openstack/recipes-devtools/python/python-deprecation.inc
> rename to meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
> index eec4dd1..c819529 100644
> --- a/meta-openstack/recipes-devtools/python/python-deprecation.inc
> +++ b/meta-openstack/recipes-devtools/python/python3-deprecation_2.1.0.bb
> @@ -4,7 +4,11 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://${S}/LICENSE;md5=e3fc50a88d0a364313df4b21ef20c29e"
>  
> -SRC_URI[md5sum] = "d8a318c66d442dc4b900e070267ed9aa"
> -SRC_URI[sha256sum] = "b9bff5cc91f601ef2a8a0200bc6cde3f18a48c2ed3d1ecbfc16076b14b3ad935"
> +SRC_URI[md5sum] = "6b79c6572fb241e3cecbbd7d539bb66b"
> +SRC_URI[sha256sum] = "72b3bde64e5d778694b0cf68178aed03d15e15477116add3fb773e581f9518ff"
>  
> -inherit pypi
> +RDEPENDS_${PN} += "\
> +	python3-packaging \
> +"
> +
> +inherit setuptools3 pypi
> -- 
> 2.25.1
> 
> 
> 

> 


