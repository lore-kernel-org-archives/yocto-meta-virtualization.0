Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC9A1E00DDC; Tue, 22 Oct 2019 19:59:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.8 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com
	[209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51980E00D85
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 19:59:54 -0700 (PDT)
Received: by mail-qt1-f196.google.com with SMTP id z22so9660025qtq.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 19:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=fzfKteBrYOfXPtvZkUo6/hjHbsAA1JzUd5rg2qVZOaw=;
	b=gGYB5YmhRvTWU6Tizq/wtCrttTLINec3w2AT2ZZQOoFo4Y3QYshFmrfxHcHueInhfo
	C9rGGaToCmxe0+Pj/QHXio/Z6V7peibBemp0ImEWydU/TiqhWC+allFK6IpTR5eSlUa9
	sce77wYBLf5IBKf5PsgwFGOrzAMAYNKNcdwbV5rt5ikE1Ei9txAAI64FTOCG8Ab5FynF
	JfFxqJ6DKpaCuJ/ve0vvPORJQ/YUU4j9Rd28p6u69GkdCaSxgMfrPqzCKcSwX1N8gIL8
	/DUrERH59CsWXT1sdua/XyK4eHKRV9wPkEivpdmiNVRWT4I2ALe7SzyGkDytH3FOR2aB
	IANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=fzfKteBrYOfXPtvZkUo6/hjHbsAA1JzUd5rg2qVZOaw=;
	b=STAXMP1R8t6rxvkZKOunGhEdVe9HHNY+t2X3UawLc2EGR9cDpYVi4m2HYCb8D2U+yY
	6t6nhD+KUS/kly8UrEuTwH1Lfaqi+d4v67HiHlMWxgo5ikIVuaaJ02qyuiNesK/7+rOL
	icDl8g8kl4OonZ2w5st1O2Nyp7idJL8n2UB2WMapqpteM0xFS3AwzehwX3jPs3Rd5LVU
	v+bKulr1ImWpQQylnLY+zKs+no+oAV1FSEEMRagN+HNrqywkivITrDTMizAcwtJRuJNG
	Vi7mLX2NXJjxKRxvYNIjodF/ypuZJc7VSpKgyDLW36jriiRc3doG6N54VC3OpHdpzXuD
	dOBw==
X-Gm-Message-State: APjAAAXTl33KUu+hJ8iyqEML9uPgvVBn8+Ln31GGXVTe97q0b8fwrbfz
	ZDhzbE9YMFy5/GkAgd8YLps=
X-Google-Smtp-Source: APXvYqzK/j/Pjw9tiEDBzNPEBBncuziU5Gi/zyyTELzCWgwx0f7VOnDfWx4RToKlsiF4whoNYn0h5Q==
X-Received: by 2002:ac8:fda:: with SMTP id f26mr7053266qtk.34.1571799593518;
	Tue, 22 Oct 2019 19:59:53 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95])
	by smtp.gmail.com with ESMTPSA id 15sm833222qke.120.2019.10.22.19.59.52
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 19:59:52 -0700 (PDT)
Date: Tue, 22 Oct 2019 22:59:50 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20191023025948.GA60338@gmail.com>
References: <20191021075845.22601-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20191021075845.22601-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-designateclient: upgrade 2.7.0 -> 3.0.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Oct 2019 02:59:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-designateclient: upgrade 2.7.0 -> 3.0.0
on 21/10/2019 Zang Ruochen wrote:

> The latest version cannot be found in branch stable/pike,so switch to master.
> 
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-designateclient_git.bb           | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
> index a6f7cbf..42efb08 100644
> --- a/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-designateclient_git.bb
> @@ -28,10 +28,10 @@ RDEPENDS_${PN} += " \
>          "
>  
>  SRCNAME = "designateclient"
> -SRC_URI = "git://github.com/openstack/${BPN}.git;branch=stable/pike"
> +SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
>  
> -PV = "2.7.0+git${SRCPV}"
> -SRCREV = "77a705857f2c303a03fdbccd4460a68b61d92fd0"
> +PV = "3.0.0+git${SRCPV}"
> +SRCREV = "093d8d7170cbf6ef8c7a7c0ff2a4dcd7ecd6361b"
>  S = "${WORKDIR}/git"
>  
>  inherit setuptools
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

