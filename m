Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EED43E00D6B; Tue, 16 Jul 2019 12:42:21 -0700 (PDT)
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
	*      [209.85.167.68 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f68.google.com (mail-lf1-f68.google.com
	[209.85.167.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A1C3E00D67
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:20 -0700 (PDT)
Received: by mail-lf1-f68.google.com with SMTP id 62so9723343lfa.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mfnHAJqi+LhS6VjhxHi1lHue4hfwrHaYKJlnkx62rGI=;
	b=cKWyrEy4vDEWR/p0pHI7QOJADUem/X4Qh5O4T0yFKEwANkXZ4etqSX1bviccsvQaoM
	aqJmm+4+6RSuJmbZq5bHjBHqS+Oiezk1hGC9chgohU0ngTqdJNVDuIjuKAQaYGPssuvq
	FbZHoqtFpuG0rhu6lSRkSFwqAbiJS85j9jmfvmtxX+0C1mQZv9XURqNLWmKiZpkDf7GO
	+CLTo1SOlhVQH4vAvImJy9h6msgX93FDO6oCUvNIeqDRuAWzOz/ZiwUf/iOBFJQ64iDN
	OWQ/j4OT9rcL4E+PkQ6+VJ5FOsKlvWmoM0z01UBBgjGu5JKnKt7uf+UrvFuWfNDEPtE9
	SsXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mfnHAJqi+LhS6VjhxHi1lHue4hfwrHaYKJlnkx62rGI=;
	b=czOQU0eAdu+ck2iurVwIduHiaJJ8I6YIRY1XjDMdnfIfAeOQYCnSoWgxsHOslc6kkk
	t7OuDLy9GYGgbrErTP00FOG8Bw8YGsSEaODXZasV0qkCf7XljON8qMFwd7N/G5noOaz9
	d0xlxeFc8XvUHGRZC6OwMh0fv6Hn0UmRBzUYGJrm0abpTV6zjR2tsDr1+5LZKuQDGy2d
	NstbIFebVKUbI6qGaGP5KuBIs0jTvOov+Kme9b8Bhu8W+SzkDE7lna2CAtxlGt9u9vjH
	EyElltjnSgA74EOapWBDbduHCtesuBSpS8g7N3KNagPe16/SjG55XfZJGTP7lCjY2LeV
	UrTw==
X-Gm-Message-State: APjAAAWN76v0viS1EIHdbc2mDb7aCXeqLj3ve8DvAwLDFAaBn+lRYysR
	s0F5ofPXZB1NKlM0l8YEAJQ/xYRg01kteU/A90wNw5lW
X-Google-Smtp-Source: APXvYqzo/FFGlTlOyfsQLO381aA/mE4kqYJ+Jp3HoWRv9SYK2l9WRVneApTQO2838E9S3QBv46+4lH4Cw2vfzr4WP7U=
X-Received: by 2002:a19:a87:: with SMTP id 129mr15042482lfk.98.1563306139091; 
	Tue, 16 Jul 2019 12:42:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190712054158.22312-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190712054158.22312-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Jul 2019 15:42:07 -0400
Message-ID: <CADkTA4PNicFuHJPmG8AzWfZsbbOow=3j2vu89=5vbceRecA61g@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-swiftclient: upgrade 3.6.0 -> 3.7.0
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
X-List-Received-Date: Tue, 16 Jul 2019 19:42:22 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 12, 2019 at 1:42 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -python-swiftclient: upgrade from 3.6.0 to 3.7.0.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index 0ee9680..f00fab5 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>
>  SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
>
> -PV = "3.6.0+git${SRCPV}"
> -SRCREV = "1cf074f4da62b7a42f88aef3c8571e7b6e850823"
> +PV = "3.7.0+git${SRCPV}"
> +SRCREV = "991a6cebb900f9ece5279f1c3c2bf33bcbb74086"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools python-dir
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

