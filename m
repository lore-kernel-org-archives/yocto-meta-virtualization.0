Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 32BF7E00D75; Tue, 24 Sep 2019 14:55:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
	[209.85.166.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 192E1E00D63
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:01 -0700 (PDT)
Received: by mail-io1-f68.google.com with SMTP id n197so8263160iod.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Sep 2019 14:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=3Tcoc23AkmjYgDlChObBiILI8bfC72caM04w4Fnih4A=;
	b=WKp/9wtzYNdZ58GRyFYLexip8LM8g8+MGaSE+DycJJSWKKxtcvl/xQK9brFIhPM8Nz
	J1/N2b7D6yVEg9srMZjqOpULophhtARisYj50Pt9wZUHtwn6zNIF35I6FB9ep3ywtFRC
	fVhy3VxScNSH+fVXrsd45yXdMEzMm+M7P61TGPJ/iF6xcl12nKAiP3/JivFKnXS9HnIs
	7WNOQUnnAoeQanG07CIfSYdr9vstYyeZljQ+SwT3+vBTyb87f0yRSmsha0jmzt9yt/qS
	QJc3zH8LwQVhon7INPGE6EM+Gx0KvSCUB725GYbqtxAL0LBIj1Hdm8JAo7uWkTH1cy5R
	8zUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=3Tcoc23AkmjYgDlChObBiILI8bfC72caM04w4Fnih4A=;
	b=Jwz4p5RhSziG5txmyIgeuWFR5rSLMdE1Ptv6PmnHnuie4kQkGCm6AXQR4R9J8IMFqP
	ZShcBPI1XMVSWZkDAiqvTWalSzLdyqpN7M2aaCbD/FznIf8ombJuxWFQFmNBUNuxXDaG
	qWtt+uUVErfbGYT83JTys+QbD9xxKwAYYtBVWs/ENauujcY9AiZenlsfzc+YU6ivnDA5
	ZlX5Lwn+AB6RzKHqkO8EZ8BgjPJ/5tDHv/fdS0/tpqUxpQ0kecgoM/1Ky+y9/xX5fmTd
	mXOdcPigkl05WSrETkzwdX6D/pPfneh0EQ7IgcAMOHn5sqzSUYC+Fp0LfrTjJ+U1WOxg
	8ehw==
X-Gm-Message-State: APjAAAUv9OyA7gaUehXX1nwVCrRkCwr8xO2aMBH09A9IEgF/CZ8/FD9n
	uFCLeSDieglC49/qyjS72Go=
X-Google-Smtp-Source: APXvYqxd0bR53y6N0+ecXV74xYVwsMOcCqFa8FB2tul8zjKAn9B1ArmtarHhGmwK9K/ok6gN3gsbFA==
X-Received: by 2002:a02:b156:: with SMTP id s22mr1264011jah.102.1569362100166; 
	Tue, 24 Sep 2019 14:55:00 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	u11sm4079188iof.22.2019.09.24.14.54.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 24 Sep 2019 14:54:59 -0700 (PDT)
Date: Tue, 24 Sep 2019 17:54:57 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Message-ID: <20190924215453.GA54158@gmail.com>
References: <20190923073844.1402-1-zangrc.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <20190923073844.1402-1-zangrc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-contextlib2: upgrade 0.5.5 -> 0.6.0
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
X-List-Received-Date: Tue, 24 Sep 2019 21:55:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [PATCH] python-contextlib2: upgrade 0.5.5 -> 0.6.0
on 23/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-contextlib2.inc | 4 ++--
>  ...ython-contextlib2_0.5.5.bb => python-contextlib2_0.6.0.bb} | 0
>  ...hon3-contextlib2_0.5.5.bb => python3-contextlib2_0.6.0.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-contextlib2_0.5.5.bb => python-contextlib2_0.6.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-contextlib2_0.5.5.bb => python3-contextlib2_0.6.0.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2.inc b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> index 0a45008..d409034 100644
> --- a/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> +++ b/meta-openstack/recipes-devtools/python/python-contextlib2.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "PSF"
>  LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=43d1c7827e8fad6454b553caf0e1d734"
>  
> -SRC_URI[md5sum] = "95fe420941ebc64951cd9d89edc41870"
> -SRC_URI[sha256sum] = "509f9419ee91cdd00ba34443217d5ca51f5a364a404e1dce9e8979cea969ca48"
> +SRC_URI[md5sum] = "d03a631073b40073b5c41364ad8f5979"
> +SRC_URI[sha256sum] = "7197aa736777caac513dbd800944c209a49765bf1979b12b037dce0277077ed3"
>  
>  DEPENDS += " \
>          ${PYTHON_PN}-pip \
> diff --git a/meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-contextlib2_0.5.5.bb
> rename to meta-openstack/recipes-devtools/python/python-contextlib2_0.6.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb b/meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-contextlib2_0.5.5.bb
> rename to meta-openstack/recipes-devtools/python/python3-contextlib2_0.6.0.bb
> -- 
> 2.20.1
> 
> 
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

