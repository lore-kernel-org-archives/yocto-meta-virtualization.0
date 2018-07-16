Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CEACE010FE; Mon, 16 Jul 2018 08:41:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 136DBE00C76
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:41:38 -0700 (PDT)
Received: by mail-yb0-f194.google.com with SMTP id x10-v6so15590582ybl.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Jul 2018 08:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=I12+nxPiIkqpNBvd9MAGzL9KCyjRGx3hWj51YaQf+7k=;
	b=hvf7JNxrCwG/B887tjOBeKJXmoFsnvKsHbTYk+NPsWE8FctFGStTIEQll6g7V4doH3
	zJphoJUYYAulmQHZGMNEZITDY41ikpUYXlxMdbIc0GONtDa/uA2Dtyf9PMQdZIC++q1i
	Rm0tUUNkpCDgJ3RLIhPmcRCZpGPmpHV8+MupdNi5X6yCdUU9eFJWDfEZVJo7EIMIxbQF
	XHfSijqKG7b9A6C6b14ptMEn/TSk7LkWvPz6/hZoV6HO51/Chuj3+mjENff1d3GIpWgc
	5o8fJcbKqVI1fcjFpG0zYFGy+kx/YAjglK0r9BoOP1Mxlb6wrq5hMsamCk49j3zGB4iy
	YvRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=I12+nxPiIkqpNBvd9MAGzL9KCyjRGx3hWj51YaQf+7k=;
	b=ierbapgbpwt90YaCN36T9S2xQmlZiJIpqUPCFJo0e6cc9oOY14jOuHjIE1SIMxYt0e
	borAsUOL+rvFWX0O/Bxff9CXMdEe1GkAoq/oUAH4WEZJJdnG6IKXKePUM6+HbvJbeYFl
	rk1h1iqDy6vtcl+tqrbsjawG0QOr7CSa3ffaSj2g55EUG2BzLZV/P5MfvmaoAHjVdiQY
	x4r775RwMg1+xHg6u3BFr/W61JkxW+6p5kVte9ffK/m3Hf3jJRaSiBBc83bhs6nEE4sv
	ci8fF1qbXQVtMnh1V3nq914F5ZFGIjYG+LKibZGlV2jj5FvzZ4JwGZjvPJU9XMRZUByi
	FszQ==
X-Gm-Message-State: AOUpUlEqEPWsHyugAYI6z2ES6WPrPkLrOyN+9VmMJ/JN4w/LduEm964V
	WCOt5QcJOZkG92Zj15DcRDIx0998GcLVA8qkRn0=
X-Google-Smtp-Source: AAOMgpcaVhuKAy8a5z6ZuKFaI02Bddg/ajFC8gughmUOeSRcxVTl6atAVdT0p0+T0QwqiiHIADH0exJTexB6R0Mrntw=
X-Received: by 2002:a25:ce49:: with SMTP id
	x70-v6mr9164053ybe.18.1531755697442; 
	Mon, 16 Jul 2018 08:41:37 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Mon, 16 Jul 2018 08:41:36 -0700 (PDT)
In-Reply-To: <20180716093631.27024-2-hongl.fnst@cn.fujitsu.com>
References: <20180716093631.27024-1-hongl.fnst@cn.fujitsu.com>
	<20180716093631.27024-2-hongl.fnst@cn.fujitsu.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 16 Jul 2018 11:41:36 -0400
X-Google-Sender-Auth: 3Po7qPNIohKR9qC4Pyge_FIffR8
Message-ID: <CAPuovEJ7sCGdzR9uh6SCO0cHQYCyaG+51WQTijotET2_-_pX9Q@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-httplib2 : 0.10.3 -> 0.11.3
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
X-List-Received-Date: Mon, 16 Jul 2018 15:41:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Jul 16, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> 1.Upgrade python-httplib2 from 0.10.3 to 0.11.3.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---

Looking at the versions in requirements.txt for depends seems to
indicate this should be OK.

MarkA


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

