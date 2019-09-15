Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B8A1CE00BE6; Sat, 14 Sep 2019 21:04:30 -0700 (PDT)
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
	*      [209.85.166.49 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40A65E00B1B
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:30 -0700 (PDT)
Received: by mail-io1-f49.google.com with SMTP id r8so46319303iol.10
	for <meta-virtualization@yoctoproject.org>;
	Sat, 14 Sep 2019 21:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=7joDXIjO6Ck66xtdxiqTVMUveQIqm1OAe0xFE1nYnx8=;
	b=BjURm87/S7RvkQuseVT9L63o6adsFkY0oFASXV7XBS9abiY+JeMbUqf91/V5ZcXwXV
	HLXknNcoFnbPDhmTpr6v9Gz4sc20Q5RF71jm30qtmgpHJFvS9MgJYcnXfTPvte2h4+GH
	LjlcdzO1gngv/2Y5KSyfGzIgy3e8iamXu3nCiHe/b+ZrKDWqy+8psSVLAixBSeBmkicL
	Qq95UQjPrHmOUt91tcM4GzvQfvhMyhTt0X9/dcd+Ai/AKCCA5PaWbUz8yGniPQIoEROi
	tsU5fMjjx/IDHqrETAKBkb8NgiTrc7aQx006HHu3afkKcVY/uYSrMrjahTsHGYPTNCGZ
	zT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=7joDXIjO6Ck66xtdxiqTVMUveQIqm1OAe0xFE1nYnx8=;
	b=txRQjFm37K4RvoRsdxneoxP/aOEys9TCXcqYd9tWhWmAl02r0NnVZROEhhz7Jc65nJ
	uPSv9JH5AmuPPVpTGw35fNMAj0+FKGHFZU5WOB74D4xNXEA2rElY8XiEpwXKVBNf9b0s
	N4Wp987yEugo3y8McGLILENeLNZtrL8Bs5P/3vu44QKh8DrGxDVX9Csa/h1ofAQckYK4
	20YgDPj5OUaEW8DRvoTWRPGFgqWgAjfasjJgB6pq7C3HNxCW3/JzD2LrmnhKCChBH5PD
	USgwL37mSGlklQQ4EROCb6+v1ze1RpROS3l6NUH1IlvOFsLYagLXk8C5yAKspXParzkq
	BI5w==
X-Gm-Message-State: APjAAAXnnmuAMexg5iyn2gJXle5ACbicLVbD1rpo0UfaSzchYDKl+moI
	mzXOb7Z1cT6FyfRbOAP2ZD88MWaYYC4=
X-Google-Smtp-Source: APXvYqxNRbxDHhcfsUxGTTczTcFCZjwe5U9KAZuJ2f3vS7aMjWs7cVoXyXjcHLg8Jg4rQA6ob/7f9w==
X-Received: by 2002:a6b:f80a:: with SMTP id o10mr9123727ioh.148.1568520269552; 
	Sat, 14 Sep 2019 21:04:29 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	q5sm22344864iob.65.2019.09.14.21.04.28
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sat, 14 Sep 2019 21:04:29 -0700 (PDT)
Date: Sun, 15 Sep 2019 00:04:27 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190915040426.GB4367@gmail.com>
References: <20190910021343.22438-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190910021343.22438-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-keystoneauth1: upgrade 3.17.0 -> 3.17.1
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
X-List-Received-Date: Sun, 15 Sep 2019 04:04:30 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-keystoneauth1: upgrade 3.17.0 -> 3.17.1
on 10/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-keystoneauth1.inc       | 4 ++--
>  ...{python-keystoneauth1_3.17.0.bb => python-keystoneauth1_3.17.1.bb} | 0
>  ...ython3-keystoneauth1_3.17.0.bb => python3-keystoneauth1_3.17.1.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.17.0.bb => python-keystoneauth1_3.17.1.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-keystoneauth1_3.17.0.bb => python3-keystoneauth1_3.17.1.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> index 3d6309d..14893d6 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
>  
> -SRC_URI[md5sum] = "599340c2b3ccbcf9996870478abb5407"
> -SRC_URI[sha256sum] = "59a4488ceae0c1210cba468945013b875b2ce09d99c54c9fcc9c926aea55dfd7"
> +SRC_URI[md5sum] = "0864f3485db8709d1dec0c8fa6073a31"
> +SRC_URI[sha256sum] = "db91ccab5cc43dac4a25dc2c090642d7c31f9ceb28df2c685620d7c12335a8cd"
>  
>  inherit pypi
>  
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.0.bb
> rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
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

