Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 77E71E00BEA; Mon, 25 Jan 2016 14:22:00 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DCC4AE00BE3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:21:57 -0800 (PST)
Received: by mail-ig0-f195.google.com with SMTP id h5so6067005igh.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Jan 2016 14:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=THFn47m4xSarY0xoGPetxxolEqwbK5doJDgT6SdGhPk=;
	b=CC5hI9AVMIhn8kuVHAwoFPwANOlZ3+x1+GszlulOikA/EI/f5VgWYsOc5tGnBXuCp7
	mEOP+EE04HnIvobdBxZaoVVfOqlX58TD71fyH3jOODM3FAKqYFyyfZ7bRYMHMKnoRL8D
	UwmAuFlMT6978KhW7NqhqG8IFRz6L6G04o5zzVgrUVj07yCfAvELfF2kn3KgkQtdF5ub
	ZJ1mS2O/4s7HIJliVSI9Ucxh5ZSVeJ68q/zeJM5IQrXQ3QWWiIOEMqQpowP7mHPGXSS3
	9nmu4FLbc7C0Rq1/NQViI/GrQ39dRKR0I52uO6IsHLH1mc33DmhmkY0NfazHrwL1aRyK
	WpBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=THFn47m4xSarY0xoGPetxxolEqwbK5doJDgT6SdGhPk=;
	b=iumPdbgK+Z709IrpYPHso2qlF9DbpCcg3SwA3d/jRgB3GkfcET72Dzd+7jRZmsjMR1
	FXtaMEPHr6JntE71D66ftAWohM8T7NJccO/St2VX5UqWUSGXDHVznZ6J9NAfyGqNicBH
	K4l4g9h/SrQD91lkSOjkYm55CucLzRzKWBbhEAGPp6CTAFkpJM+ba+NjeV/u5V2gwiOG
	uUDD5oWZewe9JFp+2Dh91IrOxYOklcBXLiyA/7/CGrigQQQwDrWnVQ0t+7Ny+IFInvI5
	TSE0bzaDyiGz+rL3Aqb+4kwO0x1QQCiUYwQGq2WkUfXKHBsciTOybbgzszbsA778iqL4
	6BZw==
X-Gm-Message-State: AG10YOQn1eZ6JcB7ZlTR2aWQ6hN+vx+1sY5NMTmCShbIwKxq69jvn9JPt8qUHo43ueMJmtyMjtMP7gEFoXq1rA==
MIME-Version: 1.0
X-Received: by 10.50.79.231 with SMTP id m7mr20051585igx.15.1453760517049;
	Mon, 25 Jan 2016 14:21:57 -0800 (PST)
Received: by 10.79.125.142 with HTTP; Mon, 25 Jan 2016 14:21:57 -0800 (PST)
In-Reply-To: <1453735752-966-3-git-send-email-cardoe@cardoe.com>
References: <1453735752-966-1-git-send-email-cardoe@cardoe.com>
	<1453735752-966-3-git-send-email-cardoe@cardoe.com>
Date: Mon, 25 Jan 2016 17:21:57 -0500
Message-ID: <CABZSBQc=fM76iCmLEyxrjc3SnSOwLafNQGg2Jwb+mdB4+QqyAA@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Doug Goldstein <cardoe@cardoe.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 3/5] xen: fix up typo in XSM comments
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
X-List-Received-Date: Mon, 25 Jan 2016 22:22:00 -0000
Content-Type: text/plain; charset=UTF-8

+1, LGTM

On Mon, Jan 25, 2016 at 10:29 AM, Doug Goldstein <cardoe@cardoe.com> wrote:
> Signed-off-by: Doug Goldstein <cardoe@cardoe.com>
> ---
>  recipes-extended/xen/xen.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index c0acbcd..2df7525 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -720,7 +720,7 @@ EXTRA_OECONF += " \
>      --disable-ocamltools \
>      "
>
> -# check for XSM in package config to allow XSM_ENABLE to be set
> +# check for XSM in package config to allow XSM_ENABLE to be set
>  python () {
>      pkgconfig = d.getVar('PACKAGECONFIG', True)
>      if ('xsm') in pkgconfig.split():
> @@ -741,7 +741,7 @@ do_configure() {
>          fi
>      fi
>
> -    #./configure --enable-xsm does not set XSM_ENABLE must be done manually
> +    #./configure --enable-xsmpolicy does not set XSM_ENABLE must be done manually
>      if [ "${XSM_ENABLED}" = "1" ]; then
>          echo "XSM_ENABLE := y" > ${S}/.config
>      fi
> --
> 2.4.10
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

