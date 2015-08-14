Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7330E00A3C; Thu, 13 Aug 2015 20:42:58 -0700 (PDT)
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
	*      [209.85.160.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26928E00767
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:42:57 -0700 (PDT)
Received: by ykfw73 with SMTP id w73so5720382ykf.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 13 Aug 2015 20:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xm3DiT7Ttg4Uahw+z5zihIoVsYHJZQkbuxayIAEU06U=;
	b=ilbhtA8CmA6bKSFS6B7aR7W70sgKswPvwYBHei3xHX809KDOdPMAUJ7OBFPpwYJd9m
	xDdEhUaV69wpp8dZTqGXfGHI5+Un3XPOBGNBoAljIVzhywlGVi+7YaFNfTkA4tSEP08p
	8+ZPoT2cebHDuonvm2YZRfwhEWOgQ5pM74bWazWb7B9dIvZn/Wur4+haTZsmpyFSg8dt
	sz5T6rvMT14IkgS+48arHOyj+8MWhzxyEEtovwAwUxdUAeqGRfPw7RHDmLNiJ7Mz68lR
	P4lpxy1VrRTAH6pJcItzO1AfcM/k5OlCV8Dq/Lgzfqh75Y2KGnM9382y799BicD+/1PH
	8fnw==
MIME-Version: 1.0
X-Received: by 10.129.16.215 with SMTP id 206mr41234473ywq.13.1439523777223;
	Thu, 13 Aug 2015 20:42:57 -0700 (PDT)
Received: by 10.13.216.216 with HTTP; Thu, 13 Aug 2015 20:42:57 -0700 (PDT)
In-Reply-To: <1439390388-16012-1-git-send-email-cardoe@cardoe.com>
References: <1439390388-16012-1-git-send-email-cardoe@cardoe.com>
Date: Thu, 13 Aug 2015 23:42:57 -0400
Message-ID: <CADkTA4N=6H08SZfJ1URz1yXrLZBNgPt2PBZx=hTT1Of3_Knm4w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] Revert "dev86: Adjusted the SRC_URI of the source code."
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
X-List-Received-Date: Fri, 14 Aug 2015 03:42:59 -0000
Content-Type: text/plain; charset=UTF-8

merged both patches. But I squashed them into a single patch .. we don't
need the revert as part of the change, simply adjusting it to the new site
and fixing the hashes are fine in the single commit.

Bruce

On Wed, Aug 12, 2015 at 10:39 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> While the change to the SRC_URI switched to one that did not 404, the
> hashes are not correct. The previous md5sum and sha256 are the same that
> Gentoo and Arch Linux have.
>
> This reverts commit 2892c53779f4cf2e58e3c60302b7e9ef792f938e.
> ---
>  recipes-extended/dev86/dev86_0.16.19.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-extended/dev86/dev86_0.16.19.bb b/recipes-extended/dev86/dev86_0.16.19.bb
> index 5e26a75..807504e 100644
> --- a/recipes-extended/dev86/dev86_0.16.19.bb
> +++ b/recipes-extended/dev86/dev86_0.16.19.bb
> @@ -5,10 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
>  SECTION = "console/tools"
>  PR="r0"
>
> -SRC_URI="https://github.com/lkundrak/dev86/archive/v${PV}.zip"
> +SRC_URI="http://www.debath.co.uk/dev86/Dev86src-${PV}.tar.gz"
>
> -SRC_URI[md5sum] = "1308759f36f9907e7dae92c46f35c51e"
> -SRC_URI[sha256sum] = "efd33d456ff87d6d0308608f6a34052b22ea8629913d0597d98c73815ed0f9f0"
> +SRC_URI[md5sum] = "442e98e1afa23fe00d40c5a996385942"
> +SRC_URI[sha256sum] = "33398b87ca85e2b69e4062cf59f2f7354af46da5edcba036c6f97bae17b8d00e"
>
>  S = "${WORKDIR}/dev86-${PV}"
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

