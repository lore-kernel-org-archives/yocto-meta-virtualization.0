Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 320C5E00AC5; Sun, 22 Jul 2018 20:21:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84E97E008E0
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:35 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id v22-v6so5344812lfe.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=XO3LHKTCAf6g6R3mQn1vd794rm1ObODzPtjT0MmsQgE=;
	b=s9Tn9aFBqbqPjJKA9TrX65/0t67CGTNpK60bp8VVhGKHGqAFuMCY0sJUcC4V1nXMib
	x5rKLKbjNVqhrhMToPEGLhXoEzfIAuOtUOkvbeTaCEzcKbFL0i6nEd0YHRQ4tG5SX1C/
	RTOSfe4Fx7kTY+o0xZWX378rYMRxH1RHFZvPIOTaWLh1JvmXzD9kLnTkotHQy9jLamX4
	GJYhWOkyOYezUaxjo9kz94Ctf84Vl+Vj2ZdzhhX/rR0RxU3S7RiSDtjVcqYahUcuHxTm
	5kQbXUKbWaNLSkEPzS2svxjsq/S7T/WSNzSrOxJuE9pHsox+SxMrVdQLEaXR1bndf7/6
	ujrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=XO3LHKTCAf6g6R3mQn1vd794rm1ObODzPtjT0MmsQgE=;
	b=kun7eb1xvPJk1vaWxq2heSYYPw+ic14LTJWtSka/IVX0uonPuoUbauRLHHoHHqYko6
	dWg9sS7PPYJz+rLSeFQeVKBQoCvC+8hXmKYIAHQynZI7CpEl1cBTuyx+OTOKAZhsqYw6
	rNaF44o5hphWVcUzDQlWKfiDFdSY/7hed4Xh4XCZMxzSHl08Th7tXTH2vyycidvFFi6U
	VIr/OhYU9LXxysl74Utp07fQMI38LBBTWGKCJFrwy32/uyHzXAEN1j1WIwph0YaHwIkA
	yh4lWq23x/a/pJYB27d+WPvEETQsm1tNruz8hV1Gd2HqSNBa4ve4p7eJeEwhCljFt6j9
	xOgQ==
X-Gm-Message-State: AOUpUlEcF4GJ9eCz8sGh1tTfx+a2aNFbDJOkuRVbTu/6fIk2+K3U3wJ0
	nCG8gC4lPXbYBgTLgKU4dJ5Aly5otnGmqwmt5aw=
X-Google-Smtp-Source: AAOMgpe5TPQWNa3dJWBxBV2yg8WD5ptKjVQK5Jo2yqNfN3Km9K+l3AgbSD9Sca8WHmm8ezOe+7zYa9cLL/TUr8jt1J0=
X-Received: by 2002:a19:ca09:: with SMTP id
	a9-v6mr5866336lfg.142.1532316094517; 
	Sun, 22 Jul 2018 20:21:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:21:34
	-0700 (PDT)
In-Reply-To: <20180716093631.27024-2-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-2-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:21:34 -0400
Message-ID: <CADkTA4N4-jLV2X8WHXu=pXLzpV05PwC2WvX9tXDcgFaMb-K45A@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-httplib2 : 0.10.3 -> 0.11.3
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
X-List-Received-Date: Mon, 23 Jul 2018 03:21:36 -0000
Content-Type: text/plain; charset="UTF-8"

Merged.

Bruce

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-httplib2 from 0.10.3 to 0.11.3.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  .../python/{python-httplib2_0.10.3.bb => python-httplib2_0.11.3.bb} | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.10.3.bb => python-httplib2_0.11.3.bb} (59%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
> similarity index 59%
> rename from meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
> index c5ced3f..f59aa5b 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2_0.10.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2_0.11.3.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
>  HOMEPAGE = "https://code.google.com/p/httplib2/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=41a98bc55b04b2a38acdb5c8ab0ae6b2"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=4d159ceca4925adea3407818d4a87968"
>
> -SRC_URI[md5sum] = "709c305e1b00e9c0af49ee816429569c"
> -SRC_URI[sha256sum] = "e404d3b7bd86c1bc931906098e7c1305d6a3a6dcef141b8bb1059903abb3ceeb"
> +SRC_URI[md5sum] = "9aa3e074da9a235cd675dd65e1fbcf39"
> +SRC_URI[sha256sum] = "e71daed9a0e6373642db61166fa70beecc9bf04383477f84671348c02a04cbdf"
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

