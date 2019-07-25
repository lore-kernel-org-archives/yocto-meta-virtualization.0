Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33685E00C27; Thu, 25 Jul 2019 11:28:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9AB7FE00BA1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 11:28:46 -0700 (PDT)
Received: by mail-lj1-f194.google.com with SMTP id v18so48900218ljh.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 25 Jul 2019 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SxQzXRjHQrUby40k0hXRvkzdcI+NULXubTbBv2FNGfg=;
	b=dBq/ShHMVKxVua2p9w9ETsQSX+a/hDKt6bayIQUWfG0bJ7ZW0v32okfw+mp1HNj4YJ
	t8FKnMYUtmbOcefY0WdYzk10lzGMR/d/EFVIIe9b2dqrYwcdfalhsY9nBVHmF1eF3z9s
	tTU7tHsaUefhKjPasy9P+krG/1WLN2himgJEVqzgtPpqXEIHUiSY4wPLJGnE+QfFLTtE
	TPhmQE66HQo8mFxr6vhkSuYCyvsIOo+nONkB8keQl2rURAdbpO0xXS+YHvk5xhPLGrxl
	IZ3O3ZL73oLygAxyhO4FxpK56PCwNs28b10QlCqg75rCQE7Z0qe/9Ip+RXN+4wNthC1z
	MyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SxQzXRjHQrUby40k0hXRvkzdcI+NULXubTbBv2FNGfg=;
	b=sDi6DdSNBjdahTr7OfDQhEVmFRZw9i0TSMWanXVJIK10RCCGF0f//C/HrG9z4KDUcE
	PlBR04IXl9W6c8xgV1UV1rGdBpYrPaNLdAFlcoaD968Hcv0nAgcvJV2nNiTfx3Gx+olD
	XVSXVgGlOv6Uyo7VJgqLHbDKYVuKV7rY8S8i91IAELrDfv77nslSwPR9Osq5EVeMg0Bf
	na1UhMwqjvXcUol1SLOpyXqyw+fwxbPYUU1zxsbbXyuH3L9zsht1/mrztrafA96nsgMQ
	Vs+vQgNH12MzaE+axQ/RmnL/p3qrIvOqd4gotqgToywxXr6Ex/CeeNGQcgyi+0mhStQf
	VGzg==
X-Gm-Message-State: APjAAAUhArUDZd9o7f0MntxNqeoUI6RO8lDpHfrzPvla5uegG87Hc7/j
	ELcqEcSTYp7p0uEUQ4dXpBPTeoBZAeWq6fbXvag=
X-Google-Smtp-Source: APXvYqwFLYiQj/OjLFmQFnLBn0TF4DZMdvhQ+VSngQ3mAye0Trmm2CS3Dtzgwxg6G6wLVsumy6LKFJpS4AfuEl6qVU0=
X-Received: by 2002:a2e:8449:: with SMTP id u9mr3372178ljh.104.1564079325406; 
	Thu, 25 Jul 2019 11:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1564026221-359201-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Jul 2019 14:28:34 -0400
Message-ID: <CADkTA4NTnUsV_MzAgCT-tdZ4ikr_dYcg29oDquDrUkqRfiDZ=Q@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] meta-virtualization: add layer depends on selinux
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
X-List-Received-Date: Thu, 25 Jul 2019 18:28:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jul 24, 2019 at 11:43 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> Since cri-o of meta-virtualization depends on
> libselinux which comes from selinux, add missing
> layer depends back.

This is already covered in the README. Since cri-o is optional, I
didn't want it to be a hard depends.

Required for cri-o:
URI: git://github.com/advancedtelematic/meta-updater
URI: git://git.yoctoproject.org/meta-selinux
URI: git://git.yoctoproject.org/meta-security
branch: master
revision: HEAD
prio: default


I haven't seen a way to do a conditional depends .. has anyone else ?

Bruce

>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  conf/layer.conf | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/conf/layer.conf b/conf/layer.conf
> index be1f222..23efcb8 100644
> --- a/conf/layer.conf
> +++ b/conf/layer.conf
> @@ -21,6 +21,7 @@ LAYERDEPENDS_virtualization-layer = " \
>      networking-layer \
>      filesystems-layer \
>      meta-python \
> +    selinux \
>  "
>
>  # webserver: naigos requires apache2
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

