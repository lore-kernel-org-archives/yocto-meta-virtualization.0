Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8511AE01710; Mon, 16 Jul 2018 08:35:21 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F160FE006B4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:34:19 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id e84-v6so15586503ybb.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wZg70/Mf0E+Qdo8gaJttVwBfriiMJOBWSBKZyjb5Tz0=;
	b=cm4nGhiHFt21xmPdzzrbAuqQVR5vgsTkxKdsF1LVZfdCMUIky5xMYEA/BSeFbSRmmK
	2CpCpbPgaWB8euPfKa5I6GCdkgWvduv8JOHEfAfHqUosMEwuVGexDarOUC3tc0n26lbg
	yiNe+FLzmmRUl18Rq05U7uth5kEfhfPsHlVrOJvma6jeUJjgne59dEUxrrODyMFqA04J
	n7iBLL5TW42pidvS9S0MbYqa+A2Ch8FKR04HbgoXzroanJw7E83Vrxbv4Ye9eaUJH+Gf
	oFunarj2C8FbbCzPR9Kd5KB1nCWJmXkXJ7JiV1L72cMhy9PKz8MyOf9pEriP+fQNAx+B
	FDzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=wZg70/Mf0E+Qdo8gaJttVwBfriiMJOBWSBKZyjb5Tz0=;
	b=hznN+rsxHwPcS1dOBNsF0zrCHLYdiWOVZpKMjT/FF2yiFASwGTr0oxZg9l7m5R9GMM
	1n4X13xVzErbRl94kLHjIhr/hFPp8Tl5uSgX71qTJSjc/HQ26LXgfs41a29bLPf0KsO7
	377foSBkt68j22thKIcpK1jqIfXxK85myAUyZDecY6p0DuclcpZyZiwybBpYCiOZxsot
	Opj+7m0+Vx+PywSl0EcgMA5oG7dla3vaDEUpqv5p/+3DW0afMxSFQGcYwb+gUoMFPSga
	5QuX6Ep0DzNJK2S3/wlnnYP0bDGsp+MsykFXRwHb4RRdOf5OoMkrdZlyWf09AKXh5bAo
	5qrg==
X-Gm-Message-State: AOUpUlH8Cs6YaZcvjc/wYFnesNGONhxIBVZ/ipunfzn4VZyz2PZ9bLV5
	OV9T4sV0O5OpaEm52bXmOsr898cf342zK873Ebc=
X-Google-Smtp-Source: AAOMgpfRLTEZwzYeRM3pO3nRZkgK0k1o4Y3uI9PZKKuoNRXSkTrYI5UeOEH0z2hWMIkb/n3jPvbYw1YSPO6ie5WfcVI=
X-Received: by 2002:a25:4103:: with SMTP id o3-v6mr8638951yba.48.1531755259256;
	Mon, 16 Jul 2018 08:34:19 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 08:34:18 -0700 (PDT)
In-Reply-To: <20180716093631.27024-3-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-3-hongl.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 16 Jul 2018 11:34:18 -0400
X-Google-Sender-Auth: Ag2mOT-pcCz8x0XgjIxm5X2gfHw
Message-ID: <CAPuovEK+=gbDkaF2t7=QS-kxfeeq9skkf9-xBHrVKZE8=YwSuA@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-httpretty:0.8.14 -> 0.9.5
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
X-List-Received-Date: Mon, 16 Jul 2018 15:35:21 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-httpretty from 0.8.14 to 0.9.5.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---

This should be fine.

Mark

>  .../{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb}       | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.14.bb => python-httpretty_0.9.5.bb} (54%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> similarity index 54%
> rename from meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> rename to meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> index a315fff..e39ad05 100644
> --- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.14.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.9.5.bb
> @@ -5,10 +5,10 @@ DESCRIPTION = "HTTP client mock for Python"
>  HOMEPAGE = "https://pypi.python.org/pypi/httpretty"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=88d874c445b42d9bcea5d211bbc6b8bd"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=113a91608a1d89039af9393c39bcaa2c"
>
> -SRC_URI[md5sum] = "2a6bbf270fafc77647b0479d95d0544c"
> -SRC_URI[sha256sum] = "83c176bbac9d68a45a5cca54f2d5be7e6b16a063adf6f334e7fd0eee272e976e"
> +SRC_URI[md5sum] = "e0e4294987c02181b1141c9ceb81783f"
> +SRC_URI[sha256sum] = "543fa2bd9c319bfa1e1de9e37d7c9c08fa926a692b65b0be5df4b2f069fd0ad7"
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

