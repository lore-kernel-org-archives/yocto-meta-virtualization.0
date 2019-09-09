Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 73C9FE00E1F; Mon,  9 Sep 2019 10:35:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  1.7 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.222.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com
	[209.85.222.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48C58E00E0B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 10:35:45 -0700 (PDT)
Received: by mail-qk1-f172.google.com with SMTP id o11so13886039qkg.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Sep 2019 10:35:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3++kCoa43Tu7ogX916vX3/VLCp7YRgb4ZpHcthyh3O0=;
	b=CfMZx2d26P3Pfn8CVf0lKngqXZE4hcTJeVrB5JKi7yPJmhASyGsc5d2V+xGKi6OgLm
	29E2gzj2gz/DCl9k5LFjORcQbqMjkhLnP4dtlg7asxat7wcIfy7GYmVkiMSnxWAa///D
	mv2CXnYZbHg5Ln7Irzma0BnXcLS+1rcmgj7vR4wQWUXZ/R6RB8D1tn+dZRR9r0Uwrdzr
	KLbGFxL5JVyiIQdRJM1RSMEm36FFDqyfPqdFourXDr9kiPnCrLe+lM2xP58KabVHIN2+
	T3Us8SmPe1dFd3lkasf65zIlcO0mj27UdOcIU/+OkwPnwJ4N9Q7PEriiupz1sQrgPDuN
	Cgdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3++kCoa43Tu7ogX916vX3/VLCp7YRgb4ZpHcthyh3O0=;
	b=THIsFMWWPP2I0Y9ytJYuFQnYEfaJumsH91se1x2cTsUcmPVhee7lb6AAznL9tkKlFQ
	AlcwV2yEZo6fNoIwLL8OcJXGQn8J8p9Df/lCUn4ovz/0mL0pHMFDUDASKIYIBqHzK66f
	IIQstTnJoEaLzFTHqVm/Z0qQAEd2f81NpP+CkidTGAcxgjgTKJNms3iWI0HMdd1mGVC9
	OyposOmTZphPOY8DuPKxIlGu6q29HdFiQCPKG0eRCbm9Krc73+HtyLS9z+h1/PbHx8fF
	IxEVP59taDunAyZ4YhPvzuypZUNLfzi24dlWfj8XS0zOYZtFlEc1uotMt2GX4FiDw3Dv
	qXlw==
X-Gm-Message-State: APjAAAVzOUlR7VXw/uoDvG/i9HJL4IJ9R69g8yQXXQ0a/40RffUxjBw9
	moPW/UX6609QW7awY3yzulw=
X-Google-Smtp-Source: APXvYqwu/eCXSiuS+Fdfm3rYBF6CmaiQTnlq4cOm+s3L7R+MQDI/vp61uZuQDlEQNIp45VeGnOYoRQ==
X-Received: by 2002:a37:6813:: with SMTP id d19mr24308786qkc.101.1568050544173;
	Mon, 09 Sep 2019 10:35:44 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	d13sm6657201qkj.18.2019.09.09.10.35.43
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Sep 2019 10:35:43 -0700 (PDT)
Date: Mon, 9 Sep 2019 13:35:41 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20190909173540.GB27188@gmail.com>
References: <1568007027-112665-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1568007027-112665-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-cliff: upgrade 2.15.0 -> 2.16.0
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
X-List-Received-Date: Mon, 09 Sep 2019 17:35:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-cliff: upgrade 2.15.0 -> 2.16.0
on 09/09/2019 Zheng Ruoqin wrote:

> 1) Upgrade python-cliff from 2.15.0 to 2.16.0.
> 
> 2) Remove repetitive RDEPENDS python-prettytable.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../{python-cliff_2.15.0.bb => python-cliff_2.16.0.bb}      | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-cliff_2.15.0.bb => python-cliff_2.16.0.bb} (77%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> similarity index 77%
> rename from meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
> rename to meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> index cfcd424..0d49f8c 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_2.15.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_2.16.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  
> -SRC_URI[md5sum] = "f51df6220d4a57c2b84d4b5a9e59e711"
> -SRC_URI[sha256sum] = "fe044273539250a99a5b9915843902e40e4e9b32ac5698c1fae89e31200d649f"
> +SRC_URI[md5sum] = "89e96c6c8c5922832e124ed81c21a55b"
> +SRC_URI[sha256sum] = "622e777b8ac2eb479708fe53893c37b2fd5469ce2c6c5b794a658246f05c6b81"
>  
>  inherit setuptools pypi
>  
> @@ -18,7 +18,7 @@ DEPENDS += " \
>      python-pbr-native \
>      "
>  
> -RDEPENDS_${PN} += "python-prettytable \
> +RDEPENDS_${PN} += " \
>              python-cmd2 \
>              python-pbr \
>              python-pyparsing \
> -- 
> 2.17.1
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

