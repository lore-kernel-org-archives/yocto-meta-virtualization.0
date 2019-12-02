Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.114.1575260483813117058
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Dec 2019 20:21:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=m6WRs70d;
 spf=softfail (domain: gmail.com, ip: 140.211.169.56, mailfrom: bruce.ashfield@gmail.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7C06E010EC; Sun,  1 Dec 2019 20:21:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [209.85.208.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
	*      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com [209.85.208.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ACD90E008DB
	for <meta-virtualization@yoctoproject.org>; Sun,  1 Dec 2019 20:21:21 -0800 (PST)
Received: by mail-ed1-f68.google.com with SMTP id m8so8251967edi.13
        for <meta-virtualization@yoctoproject.org>; Sun, 01 Dec 2019 20:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=I4V7G6OGKHkPrJIIJbmtsOMyQzXIfkZi+DS9GDh7BK4=;
        b=m6WRs70dtTkboq97cP9Z8J1o62SrwTBNwrcZj+jN1tx+KKfw5SyUiR++++9OUyp90X
         /Ju/bJ4OhTnwKfECVPofxLuOFgbBh0wO8dIKYNBBbZdLiGGX5svjBChkbF988A2Fjpih
         iebq83MuzWz3QuCO4S90wsTHEaTgjbWGWEFnBjt92WsTNULDGaIh5JNVmNcTB1zzxo7z
         9gF/ltw1orSbya4iZsp4juk5Z2rwS/2vt0XsxchFN2Ks+QgZ94Ka1rFeYk2aKCzSjSW3
         LZgMJJiqp9AHev1p+u6sTmtblAb+cgcoko/rgEQ8dv9DNbNH4sxpRde1nQAkIv9D4Epq
         Mrow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=I4V7G6OGKHkPrJIIJbmtsOMyQzXIfkZi+DS9GDh7BK4=;
        b=EMREowG5KpdKWWrIXaFsUf0GRoAUfOUQAA54vq12gVHxF63JOE9QkpPr4faG9ZZqKH
         v8+TbkhGUxc/n0ZmlC0gwdJyy/DP4+uvqqvE1CbCS54uihqgJJPMyvyP0mf4+HFp4EXR
         TXFEWCRYnQtmCya0I0JpXxKp05IuHoy7CUJHHVVdATGtzl2IvC+3VnM8NR+boZC4t6pq
         DmQFmZ0wj1ND0f6Kwvr3yvccUMzkuEiA+3fj3rvfgKe7CB64D+eAZEyAEbDr8ren0KnU
         +3Q93fRumJOlyYRKCovnHqUU0OTOYHmqm/han7q/HOVlJISdvb/1x2qK2sS47YuLDNWM
         8YPw==
X-Gm-Message-State: APjAAAUAxhaAYxNA5/JbMPbe4gerfs3nQgKWLnbh8ViHwh3RdOCSHHRr
	xE8Vyycf8vT/iBZh0i/nT0q1f4onUWL5LgEL1WE=
X-Google-Smtp-Source: APXvYqwX7hMia71DAjNgjc15m73EqSJzGikRNBk1/ML2VQ+K1rxvgTkM1eRmBVw1VSo0nnIJ/nmhYgKas/LuvJvvN5o=
X-Received: by 2002:a17:906:680b:: with SMTP id k11mr26700019ejr.0.1575260480594;
 Sun, 01 Dec 2019 20:21:20 -0800 (PST)
MIME-Version: 1.0
References: <20191128063011.16384-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20191128063011.16384-1-zangrc.fnst@cn.fujitsu.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Sun, 1 Dec 2019 23:21:09 -0500
Message-ID: <CADkTA4N3qR6AKK5z0Mu-A1r86nAo2oh1XCLBXYioucbucpdi=g@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python-anyjson: Add python3 version
To: zangrc <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"

I've merged all of the python3 additions.

That being said, we really should be making meta-virt master python3
only, since only python3 testing is going to happening for all new
releases.

I'll do the cleanup a bit later in the cycle, once we are sure that
the python3 updates are working .. at that point, we can decide if the
python2 variants are deleted, or move to a sub-layer.

Cheers,

Bruce

On Thu, Nov 28, 2019 at 1:29 AM zangrc <zangrc.fnst@cn.fujitsu.com> wrote:
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  .../recipes-devtools/python/python-anyjson.inc     | 12 ++++++++++++
>  .../python/python-anyjson_0.3.3.bb                 | 14 ++------------
>  .../python/python3-anyjson_0.3.3.bb                |  2 ++
>  3 files changed, 16 insertions(+), 12 deletions(-)
>  create mode 100644 meta-openstack/recipes-devtools/python/python-anyjson.inc
>  create mode 100644 meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
>
> diff --git a/meta-openstack/recipes-devtools/python/python-anyjson.inc b/meta-openstack/recipes-devtools/python/python-anyjson.inc
> new file mode 100644
> index 0000000..19e03e9
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python-anyjson.inc
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "Loads the best available JSON implementation available in a common interface"
> +HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> +SECTION = "devel/python"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> +
> +inherit pypi
> +
> +SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> +SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> +
> +RDEPENDS_${PN} = "${PYTHON_PN}-simplejson"
> diff --git a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> index cffff66..2b90a2a 100644
> --- a/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> +++ b/meta-openstack/recipes-devtools/python/python-anyjson_0.3.3.bb
> @@ -1,12 +1,2 @@
> -DESCRIPTION = "Loads the best available JSON implementation available in a common interface"
> -HOMEPAGE = "https://bitbucket.org/runeh/anyjson"
> -SECTION = "devel/python"
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=989aa97e73c912a83a3c873fa11deb08"
> -
> -inherit setuptools pypi
> -
> -SRC_URI[md5sum] = "2ea28d6ec311aeeebaf993cb3008b27c"
> -SRC_URI[sha256sum] = "37812d863c9ad3e35c0734c42e0bf0320ce8c3bed82cd20ad54cb34d158157ba"
> -
> -RDEPENDS_${PN} = "python-simplejson"
> +require python-anyjson.inc
> +inherit setuptools
> diff --git a/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> new file mode 100644
> index 0000000..d4d13ac
> --- /dev/null
> +++ b/meta-openstack/recipes-devtools/python/python3-anyjson_0.3.3.bb
> @@ -0,0 +1,2 @@
> +require python-anyjson.inc
> +inherit setuptools3
> --
> 2.20.1
>
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#4769): https://lists.yoctoproject.org/g/meta-virtualization/message/4769
> Mute This Topic: https://lists.yoctoproject.org/mt/63859622/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub  [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
