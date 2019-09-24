Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1371EE00D8A; Tue, 24 Sep 2019 14:55:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.166.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 96F9BE00D88
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:51 -0700 (PDT)
Received: by mail-io1-f67.google.com with SMTP id j4so8245779iog.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=DtgEwbATmawtCpr8nuBxlF3K0ke6QojJqDlVJjfw+NI=;
	b=WPeQ+6sbfpTloJsbV3htfC51uOCWh+sgYOvO1Hqjv4E0+DvG3HVolaNfJ4Rp1Ytik4
	waVJvdGEFlPbXJBrfYW86y/vX6wPd9vyNtfOSY714yx85WPZenmkmsGrHBZdKgsr8Ewh
	gMQDSTIEPrIzhcrQ39qquji+46wTYbWjpz0vvxp4+piYg2Viy8EtzqIK8TZ5UmNMHuLG
	HyiHKPqcbYApetKtiQC7NKI4FEXR7IsxbQH02BAzMRRCu6AN9+2mjpFINkv7+U9w8p92
	ZkVJSgZNHQPhxcpIUWalRcXN34b7hJhtlKhzFvAwE35WVu/y3f+LWhP35XNt3nV55lzS
	u0xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=DtgEwbATmawtCpr8nuBxlF3K0ke6QojJqDlVJjfw+NI=;
	b=VZz4dIGNmydxPlnINkfqZyHueeqpxetKDCeZSYvdS/H+XnlMFk8NCxTE4kp4SYv6c5
	Xf0MRyb+FqhSsa03B+eQYieR9bTLelawKEkOox2+Z35ADGFYedZAdQPBKipWaOEz96vF
	FM7qV3fGG/+0f3miKtxmQESCiruVHcg7QjBEtqhuLbivvwvUt0qGHd4QkcvBFk0MHqK8
	6vEGO//d4Ixflp0Kwjhuw3lJNSfDeJJfTxPI/VGfQz2emN6TFwKbWc4TdnxQ64QbrJzj
	jTzEF2Dv/n8bTixh6M4udoL1RKIthmJGfTjWCAKTKOrYlxzGNYC0Ea5tRIOVNwH49uaA
	HghA==
X-Gm-Message-State: APjAAAWlKX9gFb0ffgDkWbkhTSIJwhRiij0EZ/Lv+EyHP2RiN1bnAcIC
	crbtsyeKUQn5ngAaELw8PSM=
X-Google-Smtp-Source: APXvYqz30GC2Ur3rprdDPywtdn1t3BS0G/gL1vgdU/xK9av1klh2YeVBDI4s71mxtxMcq0fuLKWsNQ==
X-Received: by 2002:a02:b387:: with SMTP id p7mr1277561jan.98.1569362150611;
	Tue, 24 Sep 2019 14:55:50 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208])
	by smtp.gmail.com with ESMTPSA id w7sm4308666iob.17.2019.09.24.14.55.49
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:55:49 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:55:47 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215546.GE54158@gmail.com>
References: <20190924063945.7907-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190924063945.7907-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-saharaclient: upgrade 0.8.0 -> 2.3.0
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
X-List-Received-Date: Tue, 24 Sep 2019 21:55:52 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [PATCH] python-saharaclient: upgrade 0.8.0 -> 2.3.0
on 24/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-saharaclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> index 170d460..0d571c9 100644
> --- a/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-saharaclient_git.bb
> @@ -22,8 +22,8 @@ SRCNAME = "saharaclient"
>  
>  SRC_URI = "git://github.com/openstack/python-saharaclient.git;branch=master"
>  
> -PV = "0.8.0+git${SRCPV}"
> -SRCREV = "319ceb6acf55382218dcd971367613aecb3e4afc"
> +PV = "2.3.0+git${SRCPV}"
> +SRCREV = "3107b452467537f4eef3d9ecfb5e35d110d19662"
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

