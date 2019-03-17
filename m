Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 432FAE00C45; Sat, 16 Mar 2019 17:21:43 -0700 (PDT)
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
	*      [209.85.167.47 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
	[209.85.167.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B652E00AA9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:21:42 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id u2so9248929lfd.4
	for <meta-virtualization@yoctoproject.org>;
	Sat, 16 Mar 2019 17:21:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=S+zloscXsW9hzFWHy+ZinY+8MESGKKYwvkoP8EaRQXQ=;
	b=HiYwLHASYn1j++ehG0K7UF3y7M7JUfikOul1CqQoNPpqXPGigfkQvBqj7zeiAu4Yxf
	UCIFWmUlfLsQ90hdaMVy9Lisd+PZWA75wAsYoHDTzh534zZPrgwYqCsFbGBAsSXOhVmc
	neO8/lyN1E0E2oemqIxLtcXmZiUNXt0K23NnP1MCNWf8bi4uCHEWkvp1LtWIEBd5rK6F
	ZssBLRHyqC6rNNvg4VSPZcWmKNqv9nckrbg8d6iRYqjFQ2wWVhAk6MRCnfd29wA56I+8
	wR/UB235LfIQdeUlybjzTyeunJjbRmxTzVqj9QAIPz4jtEQZKmGBacWGCoH8U6j+CZzE
	WT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=S+zloscXsW9hzFWHy+ZinY+8MESGKKYwvkoP8EaRQXQ=;
	b=dBFaxPGMYr2KV3iGoGQ1oXe+5qhp+geZfyht5p63ImoE8wMFk/8xTzxwGXhnsITIQY
	YpCf4qmYUT7U2uqPvVivspWrO5h+aBicHS3G/ZJLSVp4GVhA+7CFf5lVqKC6bGP86Wxi
	wBHw9+nnDiRQ5EXLBywIBvnB8lnFq+vZ2Yy3F4oF9d9xjjw/gPXb6nlHawQ6c6UZOiut
	4ZeQY0TuvTVJeeYRxT9vKGrrWa7/E5MdRc8FUhv9NbMWTkal1g7ETWEnQCBI2F9XMvwE
	KkBNYPpVu4LyOo7+mqlTJ+0uXmZ5Ht3NUYSkl6Wy6JQwa+glMpBZIJy1v8esFx0ixxlr
	qd1Q==
X-Gm-Message-State: APjAAAVipVLPHaHti2aUfHgRSnQoNTKkJj5OWi97LUk3VZKVhhEjvLu/
	Cy4AkCREfAhhP8cT5Ypd8SWpKazOMbAQoxozW/E=
X-Google-Smtp-Source: APXvYqzbI2Bc1xa+1x7gpmPUXtGlPq1QuYkkpsgURhKzbDruab9M5ikHvlxw71rOCGufZbcvbHO8jjasm1rQQCgMHO8=
X-Received: by 2002:ac2:5966:: with SMTP id h6mr5787466lfp.86.1552782101057;
	Sat, 16 Mar 2019 17:21:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190312090514.30087-1-hongl.fnst@cn.fujitsu.com>
	<20190312090514.30087-2-hongl.fnst@cn.fujitsu.com>
In-Reply-To: <20190312090514.30087-2-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 16 Mar 2019 20:21:29 -0400
Message-ID: <CADkTA4OeSZ5dtejQEBROF8NHdAsoiSRLphdFLTsDs0BhWez5tg@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-croniter: Upgrade to 0.3.27
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
X-List-Received-Date: Sun, 17 Mar 2019 00:21:43 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Mar 12, 2019 at 5:03 AM Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
>
> 1.Upgrade python-croniter from 0.3.5 to 0.3.27.
>
> 2.Modified PKG-INFO due to version update.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  ...python-croniter_0.3.5.bb => python-croniter_0.3.27.bb} | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>  rename meta-openstack/recipes-devtools/python/{python-croniter_0.3.5.bb => python-croniter_0.3.27.bb} (65%)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb b/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
> similarity index 65%
> rename from meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
> rename to meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
> index 128a4aa..97df2a9 100644
> --- a/meta-openstack/recipes-devtools/python/python-croniter_0.3.5.bb
> +++ b/meta-openstack/recipes-devtools/python/python-croniter_0.3.27.bb
> @@ -2,13 +2,13 @@ DESCRIPTION = "croniter provides iteration for datetime object with cron like fo
>  HOMEPAGE = "https://pypi.python.org/pypi/croniter/0.3.4"
>  SECTION = "devel/python"
>  LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://PKG-INFO;md5=2c82e6382ef84397e2341a04f039abcc"
> +LIC_FILES_CHKSUM = "file://PKG-INFO;md5=21cc5101d5b0c940e3354fb1bd26c7e5"
>
>  # Archived version so we have to overwrite what the pypi class will derive
> -PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.zip"
> +PYPI_SRC_URI = "https://pypi.python.org/packages/source/c/croniter/croniter-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "63cf9e4d6778dc4102a4794a39a1b45b"
> -SRC_URI[sha256sum] = "ecd5cda855668ae11ed5ea341e9c2145bbab88bfd0763666951cfe15bab23f50"
> +SRC_URI[md5sum] = "f5543f9f165fe725b2133b698f520380"
> +SRC_URI[sha256sum] = "fbd72189a0ff38c27e953d15175c5fedafb953479559240a1afcf8e8e7523757"
>
>  inherit setuptools pypi
>
> --
> 2.20.1
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

