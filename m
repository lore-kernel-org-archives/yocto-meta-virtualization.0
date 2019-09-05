Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7867AE00E16; Thu,  5 Sep 2019 07:10:04 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.174 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com
	[209.85.208.174])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 75C6AE00D77
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Sep 2019 07:10:03 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id a4so2639500ljk.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Sep 2019 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Jq/88ACrwvhOtZEZkRwQxS+A5fC7r8MxbUgMSPZoXs4=;
	b=L3XrjeoJvHaO8znDs49xVP/mzO3jkPW+5NhuKvgi42jTwK7tfAMVsdaP5TG99D4NKb
	seQ9NXviZ5hAivqcgRsKLWPafObTbhAq73JU0+zBDugRDcDHPn6/hx/9f929HnLcUeMX
	TxT3oc1Kt8j26e54fv0IFI2S45IxSrQ5LHdMqrZ/igiVCLhIPS5nIDN6pVYgLBvjt509
	T93/grnpynlWbxpsmDgYGoSDOYsvobEY7apbcs8jFetLK95TGTggd34uKowLY6LiIAPy
	Jtf0X2dA3R2X0D1yQ7mEIRbywoX95kUFrd/OZFA0Ocw+fkSRuOxuzSXi8fF2d6yZgN3u
	D3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Jq/88ACrwvhOtZEZkRwQxS+A5fC7r8MxbUgMSPZoXs4=;
	b=ZruCzWJjfAYiX263a94M+43HADmiHBPlfy8kPPKyts8hUAYUaR9pH62hXiCSzEFxiT
	E3aWlqm6bNiLd8SQBzYO/WtNIpOVgOY6q0eri+7yi/kkXXYUJYblset7atvv+fyAicc4
	zkhJWcNLJGtI9/yUqmACewJmJwL0Eq0ceFlCHGIGwSXl2Ai+Gg21N2+oUoSXx+Gr68kj
	spl1gIkz7hQ+Xy4MFqwMKLc/0J+btxzV2ufZK2H/UVKkdsryy39yzuNpMC/zpt5i4eal
	ll49P0aKSErOrsQWayHOj6d1zENp9Jzp+PCgoh768JDqKDHkEJw+UVcPpOgha+diSaCi
	JDrQ==
X-Gm-Message-State: APjAAAW6/6drZdL30dAKuC0LMcVuOC/rbKRZtkHHIAOwA3rI/ACPANGP
	u9jL2y3UtGC/Mg8dQNisRm6bqO0sTr3/AHbDh0a367KV
X-Google-Smtp-Source: APXvYqzTAFZPaTImzzaj0oalG+73S32EZkx/cPWCL18AwxAtCmA71LVSIQnx2RTZ3NZmxQGbgnbOoszbL4gkuyV29N8=
X-Received: by 2002:a2e:8594:: with SMTP id b20mr2141452lji.232.1567692602350; 
	Thu, 05 Sep 2019 07:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190905032042.39761-1-yuanc.fnst@cn.fujitsu.com>
In-Reply-To: <20190905032042.39761-1-yuanc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Sep 2019 10:09:51 -0400
Message-ID: <CADkTA4NQkw--DhOmU4JnT8z2MNuwnqE3OhsauSO9fFLCpSYvwQ@mail.gmail.com>
To: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-debtcollector: upgrade 1.21.0 -> 1.22.0
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
X-List-Received-Date: Thu, 05 Sep 2019 14:10:04 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Sep 4, 2019 at 11:21 PM Yuan Chao <yuanc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Yuan Chao <yuanc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-debtcollector.inc          | 4 ++--
>  ...debtcollector_1.21.0.bb => python-debtcollector_1.22.0.bb} | 0
>  ...ebtcollector_1.21.0.bb => python3-debtcollector_1.22.0.bb} | 0
>  3 files changed, 2 insertions(+), 2 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-debtcollector_1.21.0.bb => python-debtcollector_1.22.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-debtcollector_1.21.0.bb => python3-debtcollector_1.22.0.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector.inc b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> index 629a059..d519bfd 100644
> --- a/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> +++ b/meta-openstack/recipes-devtools/python/python-debtcollector.inc
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2"
>  LIC_FILES_CHKSUM = "file://${COMMON_LICENSE_DIR}/MIT;md5=0835ade698e0bcf8506ecda2f7b4f302"
>
> -SRC_URI[md5sum] = "ec899623b37fdee65b888243f0a46735"
> -SRC_URI[sha256sum] = "f6ce5a383ad73c23e1138dbb69bf45d33f4a4bdec38f02dbf2b89477ec5e55bc"
> +SRC_URI[md5sum] = "0d12694a93a16824b1c67bece341229e"
> +SRC_URI[sha256sum] = "d1756440d25a50e3eca2fc399c9e5f1ca2f9e6b837570a80b9450999f4290525"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python-debtcollector_1.22.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-debtcollector_1.21.0.bb
> rename to meta-openstack/recipes-devtools/python/python-debtcollector_1.22.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb b/meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-debtcollector_1.21.0.bb
> rename to meta-openstack/recipes-devtools/python/python3-debtcollector_1.22.0.bb
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

