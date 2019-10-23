Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FCAFE00DDC; Tue, 22 Oct 2019 20:00:14 -0700 (PDT)
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
	*      [209.85.160.193 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f193.google.com (mail-qt1-f193.google.com
	[209.85.160.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2EC56E00D85
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 20:00:06 -0700 (PDT)
Received: by mail-qt1-f193.google.com with SMTP id r5so30231512qtd.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 20:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=IwMrtPZds4AeDUcHRsxAgr1VqzKxYSw19ERBp1/ci5w=;
	b=sVjWvxgi8Bnuz1qU3VxYo2jXxwCwsopqb4NuJrFeXtl3U46Rgh4LWlJeBfVF5VqqBK
	34ZyWNowv1o0X/Ln8LbWbrPsI2m3OzOls2iV3mATYM69y3iNam6Ub2nJ/lHjtqD4Phx3
	umFX2W4ZYWPrwqrvPGxoJvNVNd+ksA6nlZ0+Gv1KIHE0D6G/NNfM9fh6ZGTWkWHkSJcV
	izM9pUJWe0S97EfmHtLeXEbfvve91yGQS8jda8PjlmQKWAu5KcPzYeryEfa7aFt+s+Iu
	1amwIWamf7gdHTAc18Lbx/Ni3WEpAHWD7CKrZBXXrC+/aETEXPaKVwkZVi6tYoXEvB3I
	1ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=IwMrtPZds4AeDUcHRsxAgr1VqzKxYSw19ERBp1/ci5w=;
	b=MmU0huv3C1MCc+4mwW3EfqAI/oJOzN0xjLtXM46eJrmBix4/P5Mm+9roLQekgaBBhI
	8xtxmspLnokn0gxPXuFyTVck+zZzVuFUfdejJwKu6Gblj3aHPPgfCod1WvDLPO0Y3qWE
	q1ei0XgbY4QXaICsUQMkRnnSuNW/5/G60K0BZfaZBrss8eb6A6pHHwnfYbScSzWmLSjU
	fg7Ac7kvrM7Bt1JwfoMv4mE2DSMxojm6alN0GI74ywDu5hmHbYZq+VwnwzoHA9Rytb+M
	4En7aM8FUoDERnVFIGAfvWShta/B3vZCbgAh3tvjIivxLJRPoLCh+Ri71vItgEZ9su2X
	8IdA==
X-Gm-Message-State: APjAAAW5dg6DwQl+AkbEPGyc654Qne6qLgVEzCgHxD6ke0iFtGMwANv3
	u2+UY94+DULMAzlXgzH6ZC3URq1YrUsXLA==
X-Google-Smtp-Source: APXvYqwuTIMhmJc46t/3QjTRGxjTeLAdNWab4/1d28VJN2OiHyVok2QFtGvCmFYI9Ii+uJ5FGopC/Q==
X-Received: by 2002:ac8:7608:: with SMTP id t8mr6902123qtq.356.1571799605360; 
	Tue, 22 Oct 2019 20:00:05 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	q44sm14566303qtk.16.2019.10.22.20.00.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 20:00:04 -0700 (PDT)
Date: Tue, 22 Oct 2019 23:00:02 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <20191023030001.GB60338@gmail.com>
References: <1571753872-13999-1-git-send-email-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
In-Reply-To: <1571753872-13999-1-git-send-email-maciej.pijanowski@3mdeb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org, piotr.krol@3mdeb.com
Subject: Re: [m-c-s][PATCH] python-rsa: add python3 version
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
X-List-Received-Date: Wed, 23 Oct 2019 03:00:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged

Bruce

In message: [meta-virtualization] [m-c-s][PATCH] python-rsa: add python3 version
on 22/10/2019 Maciej Pijanowski wrote:

> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  meta-openstack/recipes-devtools/python/python-rsa.inc     | 13 +++++++++++++
>  .../recipes-devtools/python/python-rsa_3.4.2.bb           | 15 ++-------------
>  .../recipes-devtools/python/python3-rsa_3.4.2.bb          |  2 ++
>  3 files changed, 17 insertions(+), 13 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-rsa.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-rsa.inc b/meta-openstack/recipes-devtools/python/python-rsa.inc
> new file mode 100644
> index 000000000000..ccb65d5a4e89
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-rsa.inc
> @@ -0,0 +1,13 @@
> +SUMMARY = "Pure-Python RSA implementation"
> +AUTHOR = "Sybren A. Stuvel"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
> +
> +inherit pypi
> +
> +SRC_URI[md5sum] = "b315f47882c24030ee6b5aad628cccdb"
> +SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-pyasn1 \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb b/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
> index c7df0a8b644e..349e7cd97727 100644
> --- a/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-rsa_3.4.2.bb
> @@ -1,13 +1,2 @@
> -SUMMARY = "Pure-Python RSA implementation"
> -AUTHOR = "Sybren A. Stuvel"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=c403f6882d4f97a9cd927df987d55634"
> -
> -inherit setuptools pypi
> -
> -SRC_URI[md5sum] = "b315f47882c24030ee6b5aad628cccdb"
> -SRC_URI[sha256sum] = "25df4e10c263fb88b5ace923dd84bf9aa7f5019687b5e55382ffcdb8bede9db5"
> -
> -RDEPENDS_${PN} += " \
> -        python-pyasn1 \
> -        "
> +inherit setuptools
> +require python-rsa.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb b/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
> new file mode 100644
> index 000000000000..2d6c93cee2dd
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-rsa_3.4.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-rsa.inc
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

