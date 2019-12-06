Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web11.8745.1575659622361955776
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 06 Dec 2019 11:13:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=pvmwBUKu;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3C9EAE01157; Fri,  6 Dec 2019 11:13:42 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FAKE_REPLY_C,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.160.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.5 FAKE_REPLY_C FAKE_REPLY_C
Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id AFC85E010E4
	for <meta-virtualization@yoctoproject.org>; Fri,  6 Dec 2019 11:13:40 -0800 (PST)
Received: by mail-qt1-f196.google.com with SMTP id d5so8173084qto.0
        for <meta-virtualization@yoctoproject.org>; Fri, 06 Dec 2019 11:13:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :in-reply-to:user-agent;
        bh=8H7stRK15sMrCQDHhqzeSauY1lJu2yEnWtHyRxsDR9k=;
        b=pvmwBUKuoMTxgt66QTw/d6KNooh1J0dXnEvycIJ+c0PgWjMA0Hn9wLlOXrQapsOs3u
         3FfdHaUAF1dcntQmEXRvMFG3vrFsl8+9oZrzbIyKNiDPSCClchCOsBUAH4w94iOL1cqB
         M2W2p7rQ3zkEcdEEauOFNrv/opWYTsrFH7xNgPGUswo9HErFgfmdA9OjYNsrJefxGkj+
         62XN6NlU2IRIhcruC2Pecxg4DriDHLB1Ecwyzx+QSoTGKPMP7FE5PrMKUw96QmrnS/9D
         1ipGx4vN5KIyPH3HdU+jlmOEUys786xoDdQa23irSCR/2nBNiCrib5yxrMQG5VrdtNJ0
         DtGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8H7stRK15sMrCQDHhqzeSauY1lJu2yEnWtHyRxsDR9k=;
        b=a1Pj7lha65iZJ1p5/6d1MggJR3MqVw+jgMN+UcELuNpcUZkvfGrsvMPRE5RG5zK8bM
         iqzTeXka1kBlNiACkvph1MpynPoL9rOxAo5swRyB54Jr9+C1KUGd46B9t8MP0Dkb6VIW
         7ePA+vG1s1F+RorifqQj6vMqJoJ99Y8Jb4TSu4apmknNct1TtbrIuQ6W11nP1DV4vtb4
         edJlrhHH1l2UEwZ/0VPlcH4M1kPKotiJ0I9ZgSRyRCQ6A6vJdAM0R22jTtHC0dh/szw5
         5EQJy2wYZG5pkP+TdsgqPWVlrd2oLioTWpmVRinKlr0su/NcCuXVzvSIghuvn4P0oe7z
         viGA==
X-Gm-Message-State: APjAAAXFCXD0ADLeFjybMVPTNxRll+htG8YqnX36lM8b3BXYu7vc8u8/
	W6bpIL8C6IzXsqJZYEQyYc+V11YWsA6viA==
X-Google-Smtp-Source: APXvYqwrb0OSHtHYdGeP6THUyI68cEVieLpfMgWh3+iZ/yo+36pIqY20nouvLoB0Sy9dhSVqKxM0pA==
X-Received: by 2002:ac8:25b0:: with SMTP id e45mr8566110qte.181.1575659619770;
        Fri, 06 Dec 2019 11:13:39 -0800 (PST)
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id 17sm6880691qtz.85.2019.12.06.11.13.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2019 11:13:39 -0800 (PST)
Date: Fri, 6 Dec 2019 14:13:37 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Wang Mingyu <wangmy@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] python-futurist: 1.9.0 -> 1.10.0
Message-ID: <20191206191337.GC37280@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1575384511-121432-2-git-send-email-wangmy@cn.fujitsu.com>
 <1575384511-121432-4-git-send-email-wangmy@cn.fujitsu.com>
 <1575384511-121432-3-git-send-email-wangmy@cn.fujitsu.com>
 <1575384511-121432-1-git-send-email-wangmy@cn.fujitsu.com>
 <1575471849-11822-2-git-send-email-wangmy@cn.fujitsu.com>
 <1575471849-11822-1-git-send-email-wangmy@cn.fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

These patches are now merged.

Cheers,

Bruce

In message: [meta-virtualization] [PATCH] python-futurist: 1.9.0 -> 1.10.0
on 04/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/{python-futurist_1.9.0.bb => python-futurist_1.10.0.bb}    | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-futurist_1.9.0.bb => python-futurist_1.10.0.bb} (78%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
> similarity index 78%
> rename from meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
> rename to meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
> index 06624c1..3571c77 100644
> --- a/meta-openstack/recipes-devtools/python/python-futurist_1.9.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-futurist_1.10.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
>  
> -SRC_URI[md5sum] = "cbfa47202a5724215edc83cc91bdf0ac"
> -SRC_URI[sha256sum] = "0c58c359d0fa09852841efc587870db4c186c7a9175768176f69013c8acd83a6"
> +SRC_URI[md5sum] = "d7f98e9a5cb09fe9706e4afcbeab1552"
> +SRC_URI[sha256sum] = "139d223503d47275636285ae98e7b470085b2b3b6fb2fc9a0d04a76de4b3d30e"
>  
>  inherit setuptools pypi
>  
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4822): https://lists.yoctoproject.org/g/meta-virtualization/message/4822
> Mute This Topic: https://lists.yoctoproject.org/mt/66414379/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization][PATCH] python-dogpile.cache: 0.8.0 -> 0.9.0
on 04/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-dogpile.cache.inc       | 4 ++--
>  .../{python-dogpile.cache_0.8.0.bb => python-dogpile.cache_0.9.0.bb}  | 0
>  ...{python3-dogpile.cache_0.8.0.bb => python3-dogpile.cache_0.9.0.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-dogpile.cache_0.8.0.bb => python-dogpile.cache_0.9.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-dogpile.cache_0.8.0.bb => python3-dogpile.cache_0.9.0.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> index 020b171..5074acf 100644
> --- a/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> +++ b/meta-openstack/recipes-devtools/python/python-dogpile.cache.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=e8d5890806254a2648269bb4029f74c6"
>  
> -SRC_URI[md5sum] = "62512dea6839d2fd1f88532fb573077c"
> -SRC_URI[sha256sum] = "70f5eae4aec908f76188a2c287e07105f60c05d879bb9a4efcc5ba44563d8de6"
> +SRC_URI[md5sum] = "d48b4752b404e2e2a33f984d261fff7d"
> +SRC_URI[sha256sum] = "b348835825c9dcd251d9aad1f89f257277ac198a3e35a61980ab4cb28c75216b"
>  
>  inherit pypi
>  
> diff --git a/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb b/meta-openstack/recipes-devtools/python/python-dogpile.cache_0.9.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-dogpile.cache_0.8.0.bb
> rename to meta-openstack/recipes-devtools/python/python-dogpile.cache_0.9.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb b/meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.8.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-dogpile.cache_0.9.0.bb
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4823): https://lists.yoctoproject.org/g/meta-virtualization/message/4823
> Mute This Topic: https://lists.yoctoproject.org/mt/66414381/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization][PATCH] python-sqlalchemy-migrate: 0.12.0 -> 0.13.0
on 03/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  ...lalchemy-migrate_0.12.0.bb => python-sqlalchemy-migrate_0.13.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.12.0.bb => python-sqlalchemy-migrate_0.13.0.bb} (80%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
> similarity index 80%
> rename from meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
> rename to meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
> index dcb6d9d..ce9ccac 100644
> --- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.12.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.13.0.bb
> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://setup.py;beginline=32;endline=32;md5=d41d8cd98f00b204
>  
>  inherit pypi
>  
> -SRC_URI[md5sum] = "6a4920f2a2e07d193e95cf712d762b08"
> -SRC_URI[sha256sum] = "8cfada30bbcf79a83b3a2d1bcd637de7e1f43e390d54de33e4f3249fd9aacfae"
> +SRC_URI[md5sum] = "86572c92ae84334907f5e3a2cecc92a6"
> +SRC_URI[sha256sum] = "0bc02e292a040ade5e35a01d3ea744119e1309cdddb704fdb99bac13236614f8"
>  
>  inherit setuptools
>  
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4803): https://lists.yoctoproject.org/g/meta-virtualization/message/4803
> Mute This Topic: https://lists.yoctoproject.org/mt/65653062/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization][PATCH] python-kombu: 4.6.5 -> 4.6.6
on 03/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-kombu.inc               | 4 ++--
>  .../python/{python-kombu_4.6.5.bb => python-kombu_4.6.6.bb}           | 0
>  .../python/{python3-kombu_4.6.5.bb => python3-kombu_4.6.6.bb}         | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-kombu_4.6.5.bb => python-kombu_4.6.6.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-kombu_4.6.5.bb => python3-kombu_4.6.6.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu.inc b/meta-openstack/recipes-devtools/python/python-kombu.inc
> index 923278a..8029707 100644
> --- a/meta-openstack/recipes-devtools/python/python-kombu.inc
> +++ b/meta-openstack/recipes-devtools/python/python-kombu.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "BSD"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=daea7c168428449fbee05e644df929f4"
>  
> -SRC_URI[md5sum] = "6279c780cfa64beda3a303f54cb19a7a"
> -SRC_URI[sha256sum] = "c9078124ce2616b29cf6607f0ac3db894c59154252dee6392cdbbe15e5c4b566"
> +SRC_URI[md5sum] = "5f751ea817b1f6a4293d4e3a01040d4f"
> +SRC_URI[sha256sum] = "1760b54b1d15a547c9a26d3598a1c8cdaf2436386ac1f5561934bc8a3cbbbd86"
>  
>  inherit pypi
>  
> diff --git a/meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb b/meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-kombu_4.6.5.bb
> rename to meta-openstack/recipes-devtools/python/python-kombu_4.6.6.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb b/meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-kombu_4.6.5.bb
> rename to meta-openstack/recipes-devtools/python/python3-kombu_4.6.6.bb
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4806): https://lists.yoctoproject.org/g/meta-virtualization/message/4806
> Mute This Topic: https://lists.yoctoproject.org/mt/65653386/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization][PATCH] python-keystoneauth1: 3.17.1 -> 3.18.0
on 03/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-keystoneauth1.inc       | 4 ++--
>  ...{python-keystoneauth1_3.17.1.bb => python-keystoneauth1_3.18.0.bb} | 0
>  ...ython3-keystoneauth1_3.17.1.bb => python3-keystoneauth1_3.18.0.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-keystoneauth1_3.17.1.bb => python-keystoneauth1_3.18.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-keystoneauth1_3.17.1.bb => python3-keystoneauth1_3.18.0.bb} (100%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> index 14893d6..bca6ce9 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneauth1.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=96f840d59b245a1c817fbcb901afc574"
>  
> -SRC_URI[md5sum] = "0864f3485db8709d1dec0c8fa6073a31"
> -SRC_URI[sha256sum] = "db91ccab5cc43dac4a25dc2c090642d7c31f9ceb28df2c685620d7c12335a8cd"
> +SRC_URI[md5sum] = "6104205044175fa8aac659582fdd0260"
> +SRC_URI[sha256sum] = "3ae67c6542ed66a37cddcd26a35457c1ff5cd14b20f5490973273cf9eb555a52"
>  
>  inherit pypi
>  
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb b/meta-openstack/recipes-devtools/python/python-keystoneauth1_3.18.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-keystoneauth1_3.17.1.bb
> rename to meta-openstack/recipes-devtools/python/python-keystoneauth1_3.18.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb b/meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.17.1.bb
> rename to meta-openstack/recipes-devtools/python/python3-keystoneauth1_3.18.0.bb
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4805): https://lists.yoctoproject.org/g/meta-virtualization/message/4805
> Mute This Topic: https://lists.yoctoproject.org/mt/65653376/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


In message: [meta-virtualization][PATCH] python-osprofiler: 2.8.2 -> 2.9.0
on 03/12/2019 Wang Mingyu wrote:

> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../python/{python-osprofiler_2.8.2.bb => python-osprofiler_2.9.0.bb} | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-osprofiler_2.8.2.bb => python-osprofiler_2.9.0.bb} (83%)
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
> similarity index 83%
> rename from meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
> rename to meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
> index 408bbdb..8dcab0d 100644
> --- a/meta-openstack/recipes-devtools/python/python-osprofiler_2.8.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-osprofiler_2.9.0.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=19cbd64715b51267a47bf3750cc6a8a5"
>  
> -SRC_URI[md5sum] = "b192bdcbf201101a97d163d7ec6f4783"
> -SRC_URI[sha256sum] = "525b2becd692e3c6ed77a6fdf8a9ad8a52127f18e48a3abc1264c16d7fc5208a"
> +SRC_URI[md5sum] = "75f190b00ac248b3d547b67a480801db"
> +SRC_URI[sha256sum] = "6915cbf8ac390dc3e125340b0ff368dd53f5889e3d053f9122dd83ba0dd366f7"
>  
>  inherit setuptools pypi
>  
> -- 
> 2.7.4
> 
> 
> 

> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> 
> View/Reply Online (#4804): https://lists.yoctoproject.org/g/meta-virtualization/message/4804
> Mute This Topic: https://lists.yoctoproject.org/mt/65653361/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-


