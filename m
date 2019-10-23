Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DED95E00DE1; Tue, 22 Oct 2019 20:00:21 -0700 (PDT)
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
	*      [209.85.160.172 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com
	[209.85.160.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1F011E00DFA
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 20:00:18 -0700 (PDT)
Received: by mail-qt1-f172.google.com with SMTP id g50so16021334qtb.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Oct 2019 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=/x58Q7cjHOi6jN2UC/6QMdyKXWFhhI7hsxSsb5TD09g=;
	b=K/CP9CqWah836gCXUyNR39Kc1W2B4A6xEslroHUPxW7AT0gCe1fSMfcbwuOlyM4APf
	UCtnkcpp8VrA9imPFXyZyRhqKkIrBRrrIOyRCoGazIIIDUehUh7E7pTaorZ3Xmqezt6I
	KASLPnIsXlmJTNZfDhEK/gkxGpYc679eugt82Vrkopz2a5ONnUn/+O+Q3M4cmJqZQIvz
	ZUlEvxyYuLbD9k9glC+eqKoXE18kIXs17jUc+2l8urg0mzgDqHwE0e/F4xWJPMuC1lnG
	AQpiIR+gqHoQ46TbkJgyqgAGEm2d0l/H/d3UNVB40CmuAQq6XPocfZr9ubyN44deQmlj
	Z4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=/x58Q7cjHOi6jN2UC/6QMdyKXWFhhI7hsxSsb5TD09g=;
	b=rwbNmN+yCmUjTRtCDCrtmeD0hMmPWNvc1VcjBvZBU/oVd/0bepSWQFY+LJCXer2+u+
	sb+OcJEfxYB1UodKubMsIAdNp0ism+QMpfCNNwPpBLROfcrng+i2jrijUqhshK8pY1S4
	eD0dhcCuWuUJaJ/7BMCFZYqwGfk9x1nmZiBtX76yG5ewrZHFW2EV9XrUdSNCm1Y8FUPT
	YVh5hkwz15pLboNmNlXtqN4NO3RoEVzUS4xJNErNBBg4XlmibgWkQ3k1NGUodokYljEN
	7Er+vzQPnrth62VrOa5RROHnOeiAadk+ogrY+3nx5EKqka8tBxKUba6cl7uF8G7LxVux
	H+fA==
X-Gm-Message-State: APjAAAWIugTJSREg2uq/sT6WxM725Q2U/CESqR9U0VcLHYnNUXiOaWJU
	VGraPWevofEb2M+tngr0GfvgxbpoxRwOdw==
X-Google-Smtp-Source: APXvYqwQCE8ms73T3G4957ukvhw9q8lzT388FXceHwxsbXUpZd+xQqpOEWp95MCoVfRw51SJfQhPow==
X-Received: by 2002:a0c:9a0a:: with SMTP id p10mr6579186qvd.153.1571799617488; 
	Tue, 22 Oct 2019 20:00:17 -0700 (PDT)
Received: from gmail.com
	(CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com.
	[174.113.11.95]) by smtp.gmail.com with ESMTPSA id
	x133sm9865253qka.44.2019.10.22.20.00.16
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 22 Oct 2019 20:00:16 -0700 (PDT)
Date: Tue, 22 Oct 2019 23:00:14 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
Message-ID: <20191023030013.GC60338@gmail.com>
References: <1571753912-14150-1-git-send-email-maciej.pijanowski@3mdeb.com>
MIME-Version: 1.0
In-Reply-To: <1571753912-14150-1-git-send-email-maciej.pijanowski@3mdeb.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: meta-virtualization@yoctoproject.org, piotr.krol@3mdeb.com
Subject: Re: [m-c-s][PATCH] python-oauth2client: add python3 version
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
X-List-Received-Date: Wed, 23 Oct 2019 03:00:25 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce

In message: [meta-virtualization] [m-c-s][PATCH] python-oauth2client: add python3 version
on 22/10/2019 Maciej Pijanowski wrote:

> Signed-off-by: Maciej Pijanowski <maciej.pijanowski@3mdeb.com>
> ---
>  .../recipes-devtools/python/python-oauth2client.inc  | 18 ++++++++++++++++++
>  .../python/python-oauth2client_4.1.2.bb              | 20 ++------------------
>  .../python/python3-oauth2client_4.1.2.bb             |  2 ++
>  3 files changed, 22 insertions(+), 18 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-oauth2client.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
> 
> diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client.inc b/meta-openstack/recipes-devtools/python/python-oauth2client.inc
> new file mode 100644
> index 000000000000..d91fc463a6d1
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-oauth2client.inc
> @@ -0,0 +1,18 @@
> +DESCRIPTION = "OAuth 2.0 client library"
> +AUTHOR = "Google Inc."
> +HOMEPAGE = "http://github.com/google/oauth2client/"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
> +
> +inherit pypi
> +
> +SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
> +SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
> +
> +RDEPENDS_${PN} += " \
> +        ${PYTHON_PN}-httplib2 \
> +        ${PYTHON_PN}-pyasn1 \
> +        ${PYTHON_PN}-pyasn1-modules \
> +        ${PYTHON_PN}-rsa \
> +        ${PYTHON_PN}-six \
> +        "
> diff --git a/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
> index db0452fe4c87..5622422c4c30 100644
> --- a/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oauth2client_4.1.2.bb
> @@ -1,18 +1,2 @@
> -DESCRIPTION = "OAuth 2.0 client library"
> -AUTHOR = "Google Inc."
> -HOMEPAGE = "http://github.com/google/oauth2client/"
> -LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=038e1390e94fe637991fa5569daa62bc"
> -
> -inherit setuptools pypi
> -
> -SRC_URI[md5sum] = "bc30976cd1e859cd6199264a50c5ba72"
> -SRC_URI[sha256sum] = "bd3062c06f8b10c6ef7a890b22c2740e5f87d61b6e1f4b1c90d069cdfc9dadb5"
> -
> -RDEPENDS_${PN} += " \
> -        python-httplib2 \
> -        python-pyasn1 \
> -        python-pyasn1-modules \
> -        python-rsa \
> -        python-six \
> -        "
> +inherit setuptools
> +require python-oauth2client.inc
> diff --git a/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
> new file mode 100644
> index 000000000000..96508007b2f3
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-oauth2client_4.1.2.bb
> @@ -0,0 +1,2 @@
> +inherit setuptools3
> +require python-oauth2client.inc
> -- 
> 2.7.4
> 
> -- 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

