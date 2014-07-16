Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71137E00559; Wed, 16 Jul 2014 10:13:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 05542E00543
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 10:13:29 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id s18so881279lam.14
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jul 2014 10:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=tCtNY2Gy0gRVJBxHlMlg47VMe+kU9AoYIAQa9To9Vig=;
	b=XxCjzB8v0MBKMvKsKAHuYkJVZG65YsHPjikoGADUC20USKdsU9O8aXKEaxImkeGBi7
	qeyYylueByoBwtKtHtcKev4yvKX9fiIMm0bDhyUbTGQ+30qobcpO1SDygvxilnNxtuT1
	DXsuNQsVUCHiA/Xljdc9xPZDSsuxVM12L9XJ7oxYZ5LslQcq4TNOBygaYusQAb6mxXA8
	0lGbUzx1CqJr+7xJuwo6HOdyvIhn0/uxqvLZV5UhVF2JaNPPTdSNLrxqz/ph6DMZLjmm
	XfYknhXTzhHb98Ew03q3NNK7PcMcaqQpWW/fDelkFBTTQd6QwYVNs+3eVBfhUh3BwmEA
	Qgnw==
MIME-Version: 1.0
X-Received: by 10.152.6.170 with SMTP id c10mr26929087laa.9.1405530808644;
	Wed, 16 Jul 2014 10:13:28 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Wed, 16 Jul 2014 10:13:28 -0700 (PDT)
In-Reply-To: <1405525392-4829-1-git-send-email-maxin.john@enea.com>
References: <1405525392-4829-1-git-send-email-maxin.john@enea.com>
Date: Wed, 16 Jul 2014 13:13:28 -0400
Message-ID: <CADkTA4P_aSB_pONk_vmwta-hb83Rcioe=z1ygVzn-KNPJXRFMA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Maxin B. John" <maxin.john@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] kvm-image-minimal: Fix warning
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
X-List-Received-Date: Wed, 16 Jul 2014 17:13:34 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 16, 2014 at 11:43 AM, Maxin B. John <maxin.john@enea.com> wrote:
> Fix this warning:
> WARNING: Function remove_packaging_data_files doesn't exist
>
> The remove_packaging_data_files function is now handled automatically when
> "package-management" is not in IMAGE_FEATURES. We should remove the lines,
> as they are not needed and might interfere with correct operation of
> postinstall scripts.

Looks good.

merged!

Bruce

>
> Signed-off-by: Maxin B. John <maxin.john@enea.com>
> ---
>  recipes-extended/images/kvm-image-minimal.bb | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/recipes-extended/images/kvm-image-minimal.bb b/recipes-extended/images/kvm-image-minimal.bb
> index abc0fee..c96edca 100644
> --- a/recipes-extended/images/kvm-image-minimal.bb
> +++ b/recipes-extended/images/kvm-image-minimal.bb
> @@ -21,5 +21,3 @@ LICENSE = "MIT"
>  inherit core-image
>
>  IMAGE_ROOTFS_SIZE = "8192"
> -
> -ROOTFS_POSTPROCESS_COMMAND += "remove_packaging_data_files ; "
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

