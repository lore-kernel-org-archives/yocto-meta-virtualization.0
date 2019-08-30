Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77184E00E00; Thu, 29 Aug 2019 21:20:17 -0700 (PDT)
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
	*      [209.85.208.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
	[209.85.208.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A97F2E00D89
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:20:14 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id h15so5113016ljg.10
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hrtjDp8cxlsAUVKUnhgJkbjPgctEiGQoH/XSoXeteNI=;
	b=cAUmRDC+PTGp0Rp1PpsdF1VwnT0e0YPLWKDMivFQiIf1n3NzIHJ0f2jEfDv0tCCElu
	IG1fE0btfqqeOYvntvnCn+1v4dTYEn4r8r0zcX+0VBjKuiW3i7asVZojZOU7RMQNqgkd
	xmIJgiohd0JFKRZCTleUlYDKpODHD4Tpnabu8MLki+u2hvUpPzzQXK3qV+sq9vD/qWma
	BYYqhsFUC5j4seDZ8I51fRjGDenzvoZd271l+xfYDuVwv6O+m7tRnK5Rh/ytcY8RCxzv
	KP7GrkTnFnrTfxvs+tGSRcgmzbIqmsyg7VHXwfwzZAYT4GzfRn3bqzwu8P/iQdwoVVDE
	BIKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hrtjDp8cxlsAUVKUnhgJkbjPgctEiGQoH/XSoXeteNI=;
	b=IGqmaSeLtL8Js5xpQ2pFpYOQ8Ps3d5wD/4a4K7XSJXTBJ1K70B3BS8bQCGKFdmyAzK
	3MuB6GZw7SD+0IaxX4JmA72bDq/PS5rUQHiZ8WaWINddrEUAM6hCWPrXFMZv1FwORwUf
	NtaOqK8XYm1C0J+Wjfwv7PrziwtBKZlsNCDdTc9ZNm/cQJ3t9WHn84SLSkgn4/QU7xYV
	LRdYv7jwkPshkWgUSRChBbJrYRoqn6YVpw+4P3zAQZL7uaLJWQ1HolIq5vkDoqSl/dkW
	pfTmm9s6dyOMZ1SBBY3okZsjUxTGzGD6rIHQjX/YomExM3pYT2mTIV9OzWjyu2VqqjZB
	T/4A==
X-Gm-Message-State: APjAAAWSgi5cti/9/H2St5QR1DO4pybyMLCUG3OferltbmyvEeyjNYV4
	euRGn4k3LiQk7TrBZFEZ2B4bHYW7/zFgv6xyQqCgMetu
X-Google-Smtp-Source: APXvYqxlW7ltqLVerpiVCluvKQIWplfruN5GwpINSyyQS5EpcF+vhEzzB51ua2mx5E4wJeEUfVlgDtdLdFy2On3INPM=
X-Received: by 2002:a2e:83d6:: with SMTP id s22mr981346ljh.104.1567138813160; 
	Thu, 29 Aug 2019 21:20:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190826075457.30580-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190826075457.30580-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:20:01 -0400
Message-ID: <CADkTA4ODyxmg-+QCM05dWS24KqNepXwdxnP8y5sARx0wb=35SA@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-troveclient: upgrade 1.3.0 -> 2.18.0
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
X-List-Received-Date: Fri, 30 Aug 2019 04:20:17 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Mon, Aug 26, 2019 at 3:55 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-troveclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> index 95ec5ae..a86fa7f 100644
> --- a/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-troveclient_git.bb
> @@ -10,8 +10,8 @@ SRC_URI = "\
>         git://github.com/openstack/python-troveclient.git;branch=master \
>         "
>
> -PV = "1.3.0+git${SRCPV}"
> -SRCREV = "7132f5ff78af75645c3430d35094b3c9aba49200"
> +PV = "2.18.0+git${SRCPV}"
> +SRCREV = "50ac153dc53881dbb066723d77ad13092e9d15ac"
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



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

