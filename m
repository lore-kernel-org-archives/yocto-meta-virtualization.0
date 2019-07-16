Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8DC30E00D8F; Tue, 16 Jul 2019 12:42:35 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0E4FE006B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:31 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id s19so14606291lfb.9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1a5pilDdAMs4fyKbYZ+v3x9pSXzsWpNfgkdwmkT6V+c=;
	b=uKePQNXPW2RPONEWvWMDVj2L5VKqfNu1wPR8RteHQSnEYxZ/COwNBscwRWHMi1HhSw
	lHJCP1oRlZz7BH/J4M4OK1yt9WwukzdTS9ncZzzRQF8x7n4GpKGPY395zyvtplKVsoWs
	Gpf3gir+RbX3vF/AzY+d2epz+lhPSTCzFPeAY0bqwHQSfNT89/b+uA5oGpyD2wXESydw
	vsjBlN4j8AXGVmbKlZpkde0NiU+nvvQL54p8LQg+9MkJkqjj0FxHAl8sWAyIBIt5hR2d
	UuAAuNVrRht198y/JZetCEpRjH9/8eMuSNUTX/RwOlX5I69h7Cq5loXKKp79G6My7wER
	AWXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1a5pilDdAMs4fyKbYZ+v3x9pSXzsWpNfgkdwmkT6V+c=;
	b=XnIOc64CZn+DsdgFgOxWxzC3p9fqHvxd0bKexeIr7Qkz95GjUTHxioaU6/n1kipn56
	Esyunrrr36wc5y+ysOrPDuXkQr1lHJ6FHjFerOLtDdeAGMeWPDYcebsOWvCPa4PmpY29
	xQ+rAbyZLg/jB7rSajUPlZCLXznUnGuBzWBTl0ReEmyN8ruPgFK/b/cK/8XbelQGaviz
	FSWSZyZexc9ZGSsUo/pOlmK9J6LkM3V5af0Za3xqdmIQX+CrxcwO2ilXiv69jfhGT6cz
	xOy7918gCy1yI2osdji3ljnRn7at9qpeBoCjqU22zhRIXeeKXgl4XWP3JbkTSFsXvqU5
	6VqQ==
X-Gm-Message-State: APjAAAWNSWDSy9wQqAbFVUJbXqfKeIIAhEsM4r+xlqX5EAL0I5ClAnZB
	JKFT+K0TgcOncVC10w2lGnBLwLflSZyuROJ0s+ta0Bcw
X-Google-Smtp-Source: APXvYqzhAXzWFtpjb+cDdlSgLJgdyOoBeeupF/fpzGBnpXeMdI57YaWDz39Gwi6sRt5k/+xdMt02pCyzX9DJ99QJP9g=
X-Received: by 2002:ac2:4c84:: with SMTP id d4mr15566685lfl.1.1563306150559;
	Tue, 16 Jul 2019 12:42:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190712061511.22577-1-zangrc.fnst@cn.fujitsu.com>
In-Reply-To: <20190712061511.22577-1-zangrc.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Jul 2019 15:42:18 -0400
Message-ID: <CADkTA4NKQ+O2qkgkMqO3bC_ioWwcewyk2=kZeKkfspRGX9aPcg@mail.gmail.com>
To: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pycadf: upgrade 1.1.0 -> 2.9.0
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
X-List-Received-Date: Tue, 16 Jul 2019 19:42:35 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 12, 2019 at 2:16 AM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>
> -python-pycadf: upgrade from 1.1.0 to 2.9.0.
>
> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-pycadf_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> index 58cb5bf..6b63f5a 100644
> --- a/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pycadf_git.bb
> @@ -4,8 +4,8 @@ SECTION = "devel/python"
>  LICENSE = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
>
> -PV = "1.1.0+git${SRCPV}"
> -SRCREV = "c5dc0d9577e455f149edb5331a6e493def6928d5"
> +PV = "2.9.0+git${SRCPV}"
> +SRCREV = "4398b7d34e40f250a42e2ba537ca995a8c37376d"
>
>  SRCNAME = "pycadf"
>  SRC_URI = "git://github.com/openstack/${SRCNAME}.git"
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

