Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ABA79E00C43; Wed,  6 Feb 2019 12:54:36 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.51 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
	[209.85.167.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 121E9E00C06
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Feb 2019 12:54:35 -0800 (PST)
Received: by mail-lf1-f51.google.com with SMTP id b20so6425193lfa.12
	for <meta-virtualization@yoctoproject.org>;
	Wed, 06 Feb 2019 12:54:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tDZmjAVAE19T26hCDyI8+d6y2l/FX53Aal0CQu9pRPU=;
	b=m2Z1taRL4bjMtGocW+HJ0yS4ab8+jBLlTDhyFmE63psZRldhvcbf/ln3WXW4ZzT5Md
	owdhCydO6bR80gEOQGRIp2/+xyFrswWw/dhnSF70NSW2xgDkPXdihVft+xhvU0xR0nJv
	hY+wH5qoqQe89IENIOHwO/N4Pf8HNs3dA0XjvcNfnU/W0GIo3zueRQCCKKf4kBXdG8e/
	0Xc/5lIr021FLtClxlGQnJjmND+eybmIitk+s16DHBIHSwlpUJ+AzE1hFbT7sKFdAeY0
	F4BlOBLwewjgTnUy0Bw6YNFY9rxwfnS3Nie3I5XJtgroqljkZsbNiFCv2z75IDD7NbVq
	k5og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tDZmjAVAE19T26hCDyI8+d6y2l/FX53Aal0CQu9pRPU=;
	b=RqWGr24AXYkvyn6NKkfUXRAeJGqqC4zRv/Hpr+1SGc4Zfud5DVFH1MER75JDDRMhR9
	bxcBnOAmBOgf2ZXDfQ8uTjMfXxxUW0dmHiQp0NZM5npLQI0k9CyZfUtxr9Zqk2tlnQZe
	MhUmb3ozOyUtJvbHQTD1qOtmBBogBTGRgh3mVAq9QPCqd9ToOW3wb6A14VwPAttIfdfn
	2u4mST9PNk8lz9euX2vKqMlPoA4q74bmYZ7ZGdWWGO6AKLfOX6ei0hGE/6Z+r+IsjEpP
	vSnyCbMP4Xlwl6NpsHdG6Q3uilALpUJhMkVSY+kxT49LjN/BWYCOeSR5PTdCBYQUc5ne
	ya6w==
X-Gm-Message-State: AHQUAuZdI1yuxXMWHRjAMl4jBKwhhC0C8LUjUKCWN9jjgmmR+vrgvEE6
	oomfBLhXpkK9utdwYUQulvriiSgqRXwgYmBcIok=
X-Google-Smtp-Source: AHgI3IY6NJx3nJrkz8ukBh4N5F2JN40yfhVT36YD/w+4W7OUwTlLup4Rul5w/DRbZIH+bAL5aBxzTvaxS8m1Uj/J9k8=
X-Received: by 2002:ac2:4243:: with SMTP id m3mr7543732lfl.5.1549486474927;
	Wed, 06 Feb 2019 12:54:34 -0800 (PST)
MIME-Version: 1.0
References: <20190205191447.29387-1-joe.slater@windriver.com>
In-Reply-To: <20190205191447.29387-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 6 Feb 2019 15:54:23 -0500
Message-ID: <CADkTA4NZE3mJD=MM-xE9o9QFyeFLtEdy1N6+L-9=-J3HJv_dxw@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virt][PATCH 1/1] riddler: do not try to build for mips
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
X-List-Received-Date: Wed, 06 Feb 2019 20:54:36 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Tue, Feb 5, 2019 at 2:15 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> This recipe does not build for mips, so set COMPATIBLE_HOST to avoid that.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-containers/riddler/riddler_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-containers/riddler/riddler_git.bb b/recipes-containers/riddler/riddler_git.bb
> index 9f7fe6b..0897606 100644
> --- a/recipes-containers/riddler/riddler_git.bb
> +++ b/recipes-containers/riddler/riddler_git.bb
> @@ -13,6 +13,10 @@ S = "${WORKDIR}/git"
>  inherit goarch
>  inherit go
>
> +# In addition to hosts go does not like, we do not build for mips.
> +#
> +COMPATIBLE_HOST_mipsarch = "null"
> +
>  # This disables seccomp and apparmor, which are on by default in the
>  # go package.
>  EXTRA_OEMAKE="BUILDTAGS=''"
> --
> 2.7.4
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

