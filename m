Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A6CEAE00905; Tue,  3 Apr 2018 07:06:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f194.google.com (mail-yb0-f194.google.com
	[209.85.213.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DAC21E008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 07:06:01 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id k199-v6so6208451ybk.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 07:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Txjqwdbn9x0Yj5OsZpKOO0MO2nMVzaGTngKOdMsc2u8=;
	b=ATElZ2MNw/F3BpB9ddPWPp/CopdYJresEtXPFPrFzZsxPp+7CW1MqGp/Ems0xquNZm
	QTYGgd4y26wp1Ja6eVDn48+v6rEsXQ0HbDknUK7/H+WL7XU4vMGa9EX9l9tTQVnxGCGz
	4Jznzv7GczUI7LIUHHNaBDRXkEqLKRuNPXdnr058lu3yqSDM63h0sZN5Fn4r0vhEvVuM
	KmeM0ISPGfzZH9ehsyBUBNYr9T9fC7IwObXcfx3KSGsOfenayHinzJfcMvvCHaqUx1qr
	9F7kFMhWfsuuNJi5IvXdsKFH3rgSVCt0w6wrQ/je3d1Zh4oMavO/UGikpzC8MCTPnbIj
	TZzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=Txjqwdbn9x0Yj5OsZpKOO0MO2nMVzaGTngKOdMsc2u8=;
	b=IPtSNcmV0MbUmNyREu+3VDbgOIDTBuZPMKXlrMeF34NzqGaoDPy4RH+U38tdPhCuOf
	1rLxZ8OBmeeSHAkvTl9qSeqT0A1aaHPuk+Ct6+zitM4Lnyn3MsbUBp6lBmnWTS1sSwQ9
	mf4n+KNuTybVtc8Oo9aYkWZnX8b32zUvHa4Xx/RJ05AyzEA0eZ2lgvh2pTQJFBOOnMVD
	dg2tuo/NarxDmt+97Cz+l8nouaD99yZTHpl8Gzd5WoRwA7jDsTPtEZgv7Eybe1X33saI
	Ayy5+uc5OZ9De4rAdYwZdIH7pHxip9XfGf1rB0sBsAjQL7ez4J8bZabA1kwDNjewgDSa
	91YQ==
X-Gm-Message-State: ALQs6tAyaaJDa4T1RajdANwR2dpXcj2LGyt/YBQv2FwklsWSji/b96SK
	8YL6O3ZlXvFyiu4X151ughl8bXCID1aqynfPLdQ=
X-Google-Smtp-Source: AIpwx48TlA+Hx/TWV+1RWv7W2hAIJFGMpSUssdlxBgkcoDRWAw2nTzC5UMJL4r/jveD8YYfP5psjNcOBZ7Br1EwG0ig=
X-Received: by 2002:a25:aea2:: with SMTP id
	b34-v6mr7938960ybj.443.1522764360644; 
	Tue, 03 Apr 2018 07:06:00 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:dec6:0:0:0:0:0 with HTTP;
	Tue, 3 Apr 2018 07:06:00 -0700 (PDT)
In-Reply-To: <1522402120-7482-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1522402120-7482-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1522402120-7482-3-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 3 Apr 2018 10:06:00 -0400
X-Google-Sender-Auth: sXt-Nxez6aiXgrriYJcUwf8GVkM
Message-ID: <CAPuovEJrFaE6PbcukgUPUt4nUZ5AEhAHgyD2XBm7oS1xptScaA@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-cloud-services][PATCH] python-webtest: 2.0.21 -> 2.0.29
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 03 Apr 2018 14:06:02 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Mar 30, 2018 at 5:28 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-webtest from 2.0.21 to 2.0.29.
> 2.Update the checksum of LIC_FILES_CHKSUM, since the README.rst has been changed.
>   Changed from https://webtest.readthedocs.org/en/latest/ to https://webtest.readthedocs.io/en/latest/.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---

Bruce, this looks safe to merge.

Mark

>  .../python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb}   | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-webtest_2.0.21.bb => python-webtest_2.0.29.bb} (52%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> similarity index 52%
> rename from meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> rename to meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> index c0f6c94..c075a55 100644
> --- a/meta-openstack/recipes-devtools/python/python-webtest_2.0.21.bb
> +++ b/meta-openstack/recipes-devtools/python/python-webtest_2.0.29.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "Helper to test WSGI applications"
>  HOMEPAGE = "https://pypi.python.org/pypi/WebTest/"
>  SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
> -LIC_FILES_CHKSUM = "file://README.rst;md5=7ddcdd3b8e69edc8c5ae7e6bb64f0bc5"
> +LIC_FILES_CHKSUM = "file://README.rst;md5=c7fb282fc7269ea1ef7dd689470b528b"
>
>  PYPI_PACKAGE = "WebTest"
>
>  RDEPENDS_${PN} += "python-beautifulsoup4"
>
> -SRC_URI[md5sum] = "98e8b59da3cc6c150cebca8c92b66041"
> -SRC_URI[sha256sum] = "3dc92ecd7604e21fc7c97578e4c43aff2a67cebdd4884a2aa804d85e85b34b55"
> +SRC_URI[md5sum] = "30b4cf0d340b9a5335fac4389e6f84fc"
> +SRC_URI[sha256sum] = "dbbccc15ac2465066c95dc3a7de0d30cde3791e886ccbd7e91d5d2a2580c922d"
>
>  inherit setuptools pypi
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

