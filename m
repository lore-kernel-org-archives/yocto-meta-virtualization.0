Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7E49E00A7D; Mon, 10 Aug 2015 06:52:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f175.google.com (mail-yk0-f175.google.com
	[209.85.160.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 584C5E007B1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:36 -0700 (PDT)
Received: by ykdz80 with SMTP id z80so28061640ykd.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Aug 2015 06:52:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=ICxpFk6EMlH9fMo5qF2ik5i/TU6xXO3YLVOENeELrEc=;
	b=E385CQsnMiqJwDfup6HeS8M//AE+zTv3fvFnkdaUKjlCEQAlDu3jC8XszCxkwqVLcj
	DU3fK4vJF7WZ1Mz4FiVaTUTKjyRBW0uJzP7+/uYsZ4ZHQaVTCJ66L5tOmOAKASM1Zb8u
	d3IiHRhCkGhfji91/oWd/AcFhlwaBUhmp3Bi14sPqNRsfLHA+DTPHUBLijOfGv0e+XdO
	9HFbUONprmmi9aaa/5ag1htjESQ8smVV/ETzRZJmHEJ1TT0yEvnxfExDDUlMLf5hcm1N
	oEcbcacYjSqChjMuYpiiTjvbhj1PQYGVK0/HARDEOVP6/88fY9VuXNj9ptVo+S5V8k6S
	NrBQ==
MIME-Version: 1.0
X-Received: by 10.170.121.9 with SMTP id n9mr9903100ykb.54.1439214756523; Mon,
	10 Aug 2015 06:52:36 -0700 (PDT)
Received: by 10.13.226.203 with HTTP; Mon, 10 Aug 2015 06:52:36 -0700 (PDT)
In-Reply-To: <1438934469-1986-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <1438934469-1986-1-git-send-email-lixin.fnst@cn.fujitsu.com>
Date: Mon, 10 Aug 2015 09:52:36 -0400
Message-ID: <CADkTA4MKfFw2zvZ4ZPsMC0A8CF5bePo5725Mw2t_GS8ZZYCd0A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Li xin <lixin.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] python-heatclient: upgrade 0.4.0 -> 0.6.0
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
X-List-Received-Date: Mon, 10 Aug 2015 13:52:38 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Fri, Aug 7, 2015 at 4:01 AM, Li xin <lixin.fnst@cn.fujitsu.com> wrote:
> Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index b83fc77..10428c2 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -23,8 +23,8 @@ SRCNAME = "heatclient"
>
>  SRC_URI = "git://github.com/openstack/python-heatclient.git;branch=master"
>
> -PV = "0.4.0+git${SRCPV}"
> -SRCREV = "6d528f005742263837d05250662bf6214a703da8"
> +PV = "0.6.0+git${SRCPV}"
> +SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools
> --
> 1.8.4.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

