Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 52734E00D8F; Wed, 18 Sep 2019 11:01:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: **
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,FSL_HELO_FAKE,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000] *  2.6 FSL_HELO_FAKE FSL_HELO_FAKE
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.166.52 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid *  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F877E00C87
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 11:01:01 -0700 (PDT)
Received: by mail-io1-f52.google.com with SMTP id f12so1202955iog.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 18 Sep 2019 11:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:mime-version:content-disposition
	:in-reply-to:user-agent;
	bh=VfmrKK/VNxKNt0bosR5RoXs/CKsJ/vqOODgCF8aYUyY=;
	b=KTBpP9zGnaYyalaz6lnVW3HEZ5n4GIkV/fcsYaSMb05jWHvQPaI6/NVuMvaQlzmibZ
	SNjq4RPdiMx560MI3GsDAsLrCgM/IVnGBUez579MAL6ITqatRej7yR+sHlR/5mg0eR+W
	ltGT0q3OBOVmd9vaaN2Vb6kkBdztfPNlUu4PHiOSju0gw4Uf9X+p/QTUst57809cS/p2
	f/JBMGli4dDm88BqCAQ6VGXR5C2oLQql0BmrUZcug4tLmK71lrRZ8J3WhImdRcatGaoP
	2UvPNJITaNb9cbsP7wEBYdGFecj9ap9Cgv1Xc2M59o8sf2osPRpqBnprTB1QiiO4lPsx
	HChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=VfmrKK/VNxKNt0bosR5RoXs/CKsJ/vqOODgCF8aYUyY=;
	b=mZViq3MZeai+CYkbAdp3IKSoh7aYLhBuosVbTVucVDGFxt2Np1DHCb6KsrDywFA/Ki
	UgAXnGr87Qj71Wu7zHGopeFjXmWB0jl8PggkVeLoU7sfq92NWevijyqLTDAVwlSmg7NJ
	SRne0UCKkttOh20v33zv5rL88Cc9XNQO0Fdwrg6OEGYzJ7ftLL7HFF2JSIJAo5TTkXND
	o53n8Ew013kmu9Ko11ilKtPYfxG7vkHf1eNB2UJF1sim0WBpqulBm1BdP/laTME5AfPZ
	ppw1+q4HVHCfiBNZlrBiORViK3wFRzZHRNNXlO9n5S2cJTausHAPmwCsci8CMWpkrRj6
	9/7w==
X-Gm-Message-State: APjAAAXjnEevJoyOlyycsbkuuUGTmVglp/KNd4EH67yQSML/zjLy/9d6
	JmtvyQtCZz2ApbMvbqakVBge6nP8tx4bLA==
X-Google-Smtp-Source: APXvYqxabPewrPKYadubCTq+RZqy8bigU2tTQzMYr5bL8BGYguEtSKjoA0GLO84zdNrOYcxa7MtiIA==
X-Received: by 2002:a5e:cb49:: with SMTP id h9mr1802771iok.307.1568829660450; 
	Wed, 18 Sep 2019 11:01:00 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.112.251.208]) by smtp.gmail.com with ESMTPSA id
	s201sm8228600ios.83.2019.09.18.11.00.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 18 Sep 2019 11:00:59 -0700 (PDT)
Date: Wed, 18 Sep 2019 14:00:57 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>,
	Zang Ruochen <zangrc.fnst@cn.fujitsu.com>,
	Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Message-ID: <20190918180054.GA22313@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20190916023911.2653-1-zangrc.fnst@cn.fujitsu.com>
	<1568601944-47504-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
	<20190916031234.2983-1-zangrc.fnst@cn.fujitsu.com>
	<20190916032639.3150-1-zangrc.fnst@cn.fujitsu.com>
	<20190916035549.3440-1-zangrc.fnst@cn.fujitsu.com>
	<20190916040956.3619-1-zangrc.fnst@cn.fujitsu.com>
	<20190916060324.5111-1-zangrc.fnst@cn.fujitsu.com>
	<20190916061343.5261-1-zangrc.fnst@cn.fujitsu.com>
	<20190916062545.5489-1-zangrc.fnst@cn.fujitsu.com>
	<20190916063709.5662-1-zangrc.fnst@cn.fujitsu.com>
	<20190917094846.64815-1-yuanc.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-manilaclient: upgrade 1.28.0 -> 1.29.0
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
X-List-Received-Date: Wed, 18 Sep 2019 18:01:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Trying a single reply to save time.

All of the below are now merged.

Bruce

In message: [meta-virtualization] [PATCH] python-manilaclient: upgrade 1.28.0 -> 1.29.0
on 17/09/2019 Yuan Chao wrote:

> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-manilaclient_git.bb        | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> index a64c4d4..6984a9e 100644
> --- a/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-manilaclient_git.bb
> @@ -33,8 +33,8 @@ RDEPENDS_${PN} +=" \
>  SRCNAME = "manilaclient"
>  SRC_URI = "git://github.com/openstack/${BPN}.git;branch=master"
>  
> -PV = "1.28.0+git${SRCPV}"
> -SRCREV = "3e3dfb1d5a401fb0e0003c6fab0a41bd3479b7c8"
> +PV = "1.29.0+git${SRCPV}"
> +SRCREV = "1b2cafb008bee70242b68a03212bcc575df683b9"
>  S = "${WORKDIR}/git"
>  
>  inherit setuptools rmargparse
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

In message: [meta-virtualization] [PATCH] python-troveclient: upgrade 2.19.0 -> 3.0.0
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-troveclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> index 637cf9b..e19ab4b 100644
> --- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> @@ -10,8 +10,8 @@ SRC_URI = "\
>  	git://github.com/openstack/python-troveclient.git;branch=master \
>  	"
>  
> -PV = "2.19.0+git${SRCPV}"
> -SRCREV = "855ca07481afbb90c6276a4ebbeb0d659b058197"
> +PV = "3.0.0+git${SRCPV}"
> +SRCREV = "960843de8142db6e61cc4d148a51f55862acbba0"
>  S = "${WORKDIR}/git"
>  
>  inherit setuptools hosts default_configs rmargparse


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

In message: [meta-virtualization] [PATCH] python-osprpfiler: upgrade 2.8.1 -> 2.8.2
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-osprofiler_2.8.1.bb => python-osprofiler_2.8.2.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.1.bb => python-osprofiler_2.8.2.bb} (83%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
> similarity index 83%
> rename from meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
> rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
> index b299709..408bbdb 100644
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>  
> -SRC_URI[md5sum] = "ec8ef752caf49591941fba063ca40fb4"
> -SRC_URI[sha256sum] = "ee6d8a40daa3909b7c594378986b8c93ec2561dd8c329bad0aa54d4795c8fa57"
> +SRC_URI[md5sum] = "b192bdcbf201101a97d163d7ec6f4783"
> +SRC_URI[sha256sum] = "525b2becd692e3c6ed77a6fdf8a9ad8a52127f18e48a3abc1264c16d7fc5208a"
>  
>  inherit setuptools pypi
>  
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

In message: [meta-virtualization] [PATCH] python-pycadf: upgrade 2.9.0 -> 2.10.0
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-pycadf_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> index 6b63f5a..d86356b 100644
> --- a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
>  
> -PV = "2.9.0+git${SRCPV}"
> -SRCREV = "4398b7d34e40f250a42e2ba537ca995a8c37376d"
> +PV = "2.10.0+git${SRCPV}"
> +SRCREV = "d113c1564d49d93451d9330955e8a42b7db04149"
>  
>  SRCNAME = "pycadf"
>  SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
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

In message: [meta-virtualization] [PATCH] python-swiftclient: upgrade 3.8.0 -> 3.8.1
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index 15449e4..e5dea82 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>  
>  SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
>  
> -PV = "3.8.0+git${SRCPV}"
> -SRCREV = "47d5f44c3dbb5b9172a6ac7e894bf2b940ad5707"
> +PV = "3.8.1+git${SRCPV}"
> +SRCREV = "72b90fed4c62cf75497a7d66714f5fb0aa91f18b"
>  S = "${WORKDIR}/git"
>  
>  inherit setuptools python-dir
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

In message: [meta-virtualization] [PATCH] python-glanceclient: upgrade 2.16.0 -> 2.17.0
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> index e828cba..393cc45 100644
> --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> @@ -7,8 +7,8 @@ SRC_URI = "git://github.com/openstack/python-glanceclient.git \
>             file://glance-api-check.sh \
>          "
>  
> -PV = "2.16.0+git${SRCPV}"
> -SRCREV = "44a4dbd6ce2642daeaca9f45ac99e2d1b39e805a"
> +PV = "2.17.0+git${SRCPV}"
> +SRCREV = "40c19aa44361e13ac997d325d357d3e4748fa063"
>  S = "${WORKDIR}/git"
>  
>  DEPENDS += " \
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

In message: [meta-virtualization] [PATCH] python-barbicanclient: upgrade 4.8.1 -> 4.9.0
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> index 3c5043b..a4bcdea 100644
> --- a/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-barbicanclient_git.bb
> @@ -8,8 +8,8 @@ SRC_URI = "\
>  	git://github.com/openstack/python-barbicanclient.git \
>  	"
>  
> -PV = "4.8.1+git${SRCPV}"
> -SRCREV = "1b282358166fe4c1d4dea896bd336b2850584f56"
> +PV = "4.9.0+git${SRCPV}"
> +SRCREV = "9c0e02d367b86eb5bdebda4e0ff1434d70db5f61"
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

In message: [meta-virtualization]  [PATCH] python-routes: Add python3 version
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-routes.inc           | 15 +++++++++++++++
>  .../recipes-devtools/python/python-routes_git.bb        | 17 +----------------
>  .../recipes-devtools/python/python3-routes_git.bb       |  2 ++
>  3 files changed, 18 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-routes.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-routes_git.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-routes.inc b/meta-openstack/recipes-devtools/python/python-routes.inc
> new file mode 100644
> index 0000000..4224552
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-routes.inc
> @@ -0,0 +1,15 @@
> +DESCRIPTION = "A Python re-implementation of the Rails routes system."
> +HOMEPAGE = "http://routes.groovie.org"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
> +
> +PV = "2.4.1+git${SRCPV}"
> +SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
> +
> +SRCNAME = "Routes"
> +SRC_URI = "git://github.com/bbangert/routes.git"
> +
> +S = "${WORKDIR}/git"
> +
> +RDEPENDS_${PN} += "${PYTHON_PN}-repoze.lru"
> diff --git a/meta-openstack/recipes-devtools/python/python-routes_git.bb b/meta-openstack/recipes-devtools/python/python-routes_git.bb
> index 408f0a8..11fea85 100644
> --- a/meta-openstack/recipes-devtools/python/python-routes_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-routes_git.bb
> @@ -1,17 +1,2 @@
> -DESCRIPTION = "A Python re-implementation of the Rails routes system."
> -HOMEPAGE = "http://routes.groovie.org"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=90976c1a0e3029278f882cfe2e84a6ae"
> -
> -PV = "2.4.1+git${SRCPV}"
> -SRCREV = "2dcef8079cf09f427eeb0be62374f6c1a52bf59d"
> -
> -SRCNAME = "Routes"
> -SRC_URI = "git://github.com/bbangert/routes.git"
> -
> -S = "${WORKDIR}/git"
> -
>  inherit setuptools
> -
> -RDEPENDS_${PN} += "python-repoze.lru"
> +require python-routes.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-routes_git.bb b/meta-openstack/recipes-devtools/python/python3-routes_git.bb
> new file mode 100644
> index 0000000..06dd1ad
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-routes_git.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-routes.inc
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

In message: [meta-virtualization]  [PATCH] python-pecan: Add python3 version
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-pecan.inc           | 16 ++++++++++++++++
>  .../recipes-devtools/python/python-pecan_1.3.3.bb      | 18 ++----------------
>  .../recipes-devtools/python/python3-pecan_1.3.3.bb     |  2 ++
>  3 files changed, 20 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-pecan.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-pecan.inc b/meta-openstack/recipes-devtools/python/python-pecan.inc
> new file mode 100644
> index 0000000..884ce75
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-pecan.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "WSGI object-dispatching web framework"
> +HOMEPAGE = "https://pypi.python.org/pypi/pecan/"
> +SECTION = "devel/python"
> +LICENSE = "BSD"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
> +
> +SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
> +SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
> +
> +inherit pypi
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-mako \
> +                  ${PYTHON_PN}-webtest \
> +                  ${PYTHON_PN}-six \
> +                  ${PYTHON_PN}-logutils \
> +"
> diff --git a/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
> index 62f29fa..6fa052e 100644
> --- a/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pecan_1.3.3.bb
> @@ -1,16 +1,2 @@
> -DESCRIPTION = "WSGI object-dispatching web framework"
> -HOMEPAGE = "https://pypi.python.org/pypi/pecan/"
> -SECTION = "devel/python"
> -LICENSE = "BSD"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=d846877d24bbb3d7a00a985c90378e8c"
> -
> -SRC_URI[md5sum] = "8f006ed860f7fbdf0c0bf5ad0cf2f3b4"
> -SRC_URI[sha256sum] = "b5461add4e3f35a7ee377b3d7f72ff13e93f40f3823b3208ab978b29bde936ff"
> -
> -inherit setuptools pypi
> -
> -RDEPENDS_${PN} = "python-mako \
> -                  python-webtest \
> -                  python-six \
> -                  python-logutils \
> -"
> +inherit setuptools
> +require python-pecan.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb b/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
> new file mode 100644
> index 0000000..2e6a223
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-pecan_1.3.3.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-pecan.inc
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

In message: [meta-virtualization] [PATCH] python-osc-lib: Python3 version fix
on 16/09/2019 Zheng Ruoqin wrote:

> Specifies the major Python version being built using PYTHON_PN.
> 
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  .../python/python-osc-lib.inc                 | 27 ++++++++++++-------
>  .../python/python-osc-lib_1.13.0.bb           |  7 +----
>  .../python/python3-osc-lib_1.13.0.bb          |  8 +-----
>  3 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib.inc b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> index 58e994c..0589137 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib.inc
> @@ -7,17 +7,24 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>  SRC_URI[md5sum] = "5e91028524b50a72f9913ccd2994cf77"
>  SRC_URI[sha256sum] = "9dcd3b55bd887525a7020a8adbabb661a340fc4a4a707950dc1c6f0b286cce77"
>  
> +inherit pypi
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        ${PYTHON_PN}-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
> -        python-pbr \
> -        python-six \
> -        python-babel \
> -        python-cliff \
> -        python-keystoneauth1 \
> -        python-os-client-config \
> -        python-oslo.i18n \
> -        python-oslo.utils \
> -        python-simplejson \
> -        python-stevedore \
> +        ${PYTHON_PN}-pbr \
> +        ${PYTHON_PN}-six \
> +        ${PYTHON_PN}-babel \
> +        ${PYTHON_PN}-cliff \
> +        ${PYTHON_PN}-keystoneauth1 \
> +        ${PYTHON_PN}-os-client-config \
> +        ${PYTHON_PN}-oslo.i18n \
> +        ${PYTHON_PN}-oslo.utils \
> +        ${PYTHON_PN}-simplejson \
> +        ${PYTHON_PN}-stevedore \
>          "
>  
>  CLEANBROKEN = "1"
> diff --git a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> index 4ea2de2..d8c72e7 100644
> --- a/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.13.0.bb
> @@ -1,7 +1,2 @@
> -inherit setuptools pypi
> +inherit setuptools
>  require python-osc-lib.inc
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python-pbr-native \
> -        "
> diff --git a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> index 63265d9..256c286 100644
> --- a/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python3-osc-lib_1.13.0.bb
> @@ -1,8 +1,2 @@
> -inherit setuptools3 pypi
> +inherit setuptools3
>  require python-osc-lib.inc
> -
> -# Satisfy setup.py 'setup_requires'
> -DEPENDS += " \
> -        python3-pbr-native \
> -        "
> -
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

In message: [meta-virtualization] [PATCH] python-amqplib: Add python3 version
on 16/09/2019 Zang Ruochen wrote:

> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-amqplib.inc          | 16 ++++++++++++++++
>  .../recipes-devtools/python/python-amqplib_1.0.2.bb     | 17 +----------------
>  .../recipes-devtools/python/python3-amqplib_1.0.2.bb    |  2 ++
>  3 files changed, 19 insertions(+), 16 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-amqplib.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-amqplib.inc b/meta-openstack/recipes-devtools/python/python-amqplib.inc
> new file mode 100644
> index 0000000..d9f22cb
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-amqplib.inc
> @@ -0,0 +1,16 @@
> +DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
> +HOMEPAGE = "http://code.google.com/p/py-amqplib/"
> +SECTION = "devel/python"
> +LICENSE = "LGPL-3.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
> +
> +PR = "r1"
> +SRCNAME = "amqplib"
> +
> +SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
> +
> +SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
> +SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
> +
> +S = "${WORKDIR}/py-amqplib-${PV}"
> +
> diff --git a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
> index 1afc76e..a39284a 100644
> --- a/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-amqplib_1.0.2.bb
> @@ -1,17 +1,2 @@
> -DESCRIPTION = "Python client for the Advanced Message Queuing Procotol (AMQP)"
> -HOMEPAGE = "http://code.google.com/p/py-amqplib/"
> -SECTION = "devel/python"
> -LICENSE = "LGPL-3.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=1702a92c723f09e3fab3583b165a8d90"
> -
> -PR = "r1"
> -SRCNAME = "amqplib"
> -
> -SRC_URI = "https://github.com/barryp/py-amqplib/archive/${PV}.tar.gz"
> -
> -SRC_URI[md5sum] = "ff405a7b57aa98cdf07d02bd8090fa29"
> -SRC_URI[sha256sum] = "9461d73f75ca704e6b656738b5dad42a1948e61dfbc8233077d84d00f74c3936"
> -
> -S = "${WORKDIR}/py-amqplib-${PV}"
> -
>  inherit setuptools
> +require python-amqplib.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
> new file mode 100644
> index 0000000..7623d17
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-amqplib_1.0.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-amqplib.inc
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


