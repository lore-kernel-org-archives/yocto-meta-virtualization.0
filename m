Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3D4E6E00D82; Fri, 18 Oct 2019 21:38:42 -0700 (PDT)
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
	*      [209.85.208.194 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 81B7EE00D72
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:41 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id q64so8124650ljb.12
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Oct 2019 21:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bMpNhqotC/lZGvDBu4rVMf0Q6fGSsyj+gl2rE2TQtVk=;
	b=B0RHvMV9XMSpj2kthjUCKeV6iqxm3U+iQRYOyTDezdT2pP8zkW3xStfkx0xOTA/xsW
	WB8hnu4f3QyjUxrus2W4r5qPWxMj+q4rUiGGCgw68Ru/hKZkb+zhpQ/mS37jHl3pG6qi
	KspB7NLYbdGH7KR3W0prQwFn3Y1YDzdfZIfkDp86PoA6dNxJO7v9tiZgNNyu4lBPZuqx
	FO8XWGRNu91CUISWsWDUassm5rvekZ9Flw6/rrtKSBBUnQ9Cm6vNDb2KMivwn8C3XBNv
	8bdbpzevdi/v5aq9OIcTJKAeu27glnD85xETHLIzxgX08GI9l8q8S1xDQWwee0S5x7m0
	ZsdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bMpNhqotC/lZGvDBu4rVMf0Q6fGSsyj+gl2rE2TQtVk=;
	b=Olv5wfusWbnGavxUcGbQ8voNbTmTQy66E3//9ZXdBtREL9WHN1zRzPIItrEpFoeX3k
	sgjBsqmXjNfeUUiZJhOhGq6qsMXlsG8UZNV6TesVG4cwue4wRM2OQ8tNS7nMFVPSZSiQ
	eNyXhi7DLHkrEdiiNky5/2T7yFV7ypV62mGXMV1IJUfdhcKqMeoF1wrajcy4DKo6y+E5
	H/frDLYEALin9nu8yk3NdJ3vIPKwGm1gOkV4TUbzT63POPBK3ykG+eM60VyP7+fXclJo
	ZnObez8tCMz9O/GtPGuO/EbDmsimU477+zCWgfq5+n91kTW1MZ/R11t4ZuIST+nObRsE
	GHwA==
X-Gm-Message-State: APjAAAWcBnZCnEUxt8K6mMTdB07REwRouupk2pkUpdi9A5HNdcdAOhvn
	JRCGO2A85RllIpsxw8H19TAhSgjivmq3YKMEIBQ=
X-Google-Smtp-Source: APXvYqygZ8amSYxji0KPXKDYXhu75Wm+Uf2ZLNPQim4VYPP7gXK2c7tfHFo7IaX0OWIwVj9O4Fj3j0ESN5qqqBw+C3g=
X-Received: by 2002:a2e:7312:: with SMTP id o18mr8183459ljc.32.1571459920373; 
	Fri, 18 Oct 2019 21:38:40 -0700 (PDT)
MIME-Version: 1.0
References: <20191018080538.7425-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191018080538.7425-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 19 Oct 2019 00:38:29 -0400
Message-ID: <CADkTA4Mun4nonKGuvAVF1nPyyKZdQUNXh9HqYMU5vSEfjUC+5Q@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-httplib2: upgrade 0.13.1 -> 0.14.0
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
X-List-Received-Date: Sat, 19 Oct 2019 04:38:42 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Oct 18, 2019 at 4:05 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-httplib2.inc          | 6 +++---
>  .../python/{python-httplib2_0.13.1.bb => python-httplib2_0.14.0.bb} | 0
>  .../{python3-httplib2_0.13.1.bb => python3-httplib2_0.14.0.bb}      | 0
>  3 files changed, 3 insertions(+), 3 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-httplib2_0.13.1.bb => python-httplib2_0.14.0.bb} (100%)
>  rename meta-openstack/recipes-devtools/python/{python3-httplib2_0.13.1.bb => python3-httplib2_0.14.0.bb} (100%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2.inc b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> index 75473ab..35c8b1c 100644
> --- a/meta-openstack/recipes-devtools/python/python-httplib2.inc
> +++ b/meta-openstack/recipes-devtools/python/python-httplib2.inc
> @@ -2,10 +2,10 @@ DESCRIPTION = "A comprehensive HTTP client library"
>  HOMEPAGE = "https://code.google.com/p/httplib2/"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=e199474a42f8d1baba57f39b790a557e"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2d0e1e5a49b6ead3380e3ac544351eb9"
>
> -SRC_URI[md5sum] = "ff90c595c6a58a954a65088b6a470999"
> -SRC_URI[sha256sum] = "6901c8c0ffcf721f9ce270ad86da37bc2b4d32b8802d4a9cec38274898a64044"
> +SRC_URI[md5sum] = "427cda9f4d55762db325bd2eb46b7fe0"
> +SRC_URI[sha256sum] = "34537dcdd5e0f2386d29e0e2c6d4a1703a3b982d34c198a5102e6e5d6194b107"
>
>  inherit pypi
>
> diff --git a/meta-openstack/recipes-devtools/python/python-httplib2_0.13.1.bb b/meta-openstack/recipes-devtools/python/python-httplib2_0.14.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python-httplib2_0.13.1.bb
> rename to meta-openstack/recipes-devtools/python/python-httplib2_0.14.0.bb
> diff --git a/meta-openstack/recipes-devtools/python/python3-httplib2_0.13.1.bb b/meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
> similarity index 100%
> rename from meta-openstack/recipes-devtools/python/python3-httplib2_0.13.1.bb
> rename to meta-openstack/recipes-devtools/python/python3-httplib2_0.14.0.bb
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
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

