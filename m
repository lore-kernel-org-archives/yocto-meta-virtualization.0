Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F995E00C4F; Fri, 25 Mar 2016 18:27:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.218.68 listed in list.dnswl.org]
Received: from mail-oi0-f68.google.com (mail-oi0-f68.google.com
	[209.85.218.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E5D90E00AEA
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 18:27:04 -0700 (PDT)
Received: by mail-oi0-f68.google.com with SMTP id q133so108221oib.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Mar 2016 18:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U5Dy0cXRWnBW/c4AyMI6ZGGkmS2VTQY8W37uWttjBmU=;
	b=EpR+kNkPdY9IqrHcQytHHNu5G1VoPu7YpVIIj8Ft33gP/g5dr3UrU0/31QB3948omH
	P5SGTPLXymAPIMXDDqTgJD45DofDQ1UJL7PciEO6riUfsqVRen5ieqaxmNlupJA7b1j1
	dPhchrKFp6y3dxXOJp43ZvVf1GT5HhMnuWSWP/PLgAJXfZR1iKSL5N1+tToktimIlEJB
	4N4QSMl659PaV5wehNmjTl/Ks9d2UEfVob4ji3To4zElZIfzGGsjwEE2OUqoxhaIQtpO
	PYlZxKXN5p7LRlfSM1B6GWaXR59/m6mjIYcGFrBfFFvTjcVlS0GIPpAxxAkNZzz6QkiZ
	C6Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U5Dy0cXRWnBW/c4AyMI6ZGGkmS2VTQY8W37uWttjBmU=;
	b=ImD5xZesfumJdq8x+OzqTSB77jONWKt3Vab9Zufhz2LzoutiZz6M16D5edFbga75F4
	vK5d0qAsWFumSqrrdA8jesYzF8j4h5i2qU+IJWMI8i7Y+YkQKvJrkXOXc4CVoOGTlr9i
	8E0DG8VtJ89847EWxcqnCYScNA2tMocj8+V5Nci8/776SkxxmRJAp/PcUcgOFqbVT1Qo
	rGhKoC65ePtgOkDvH5BXtXnrdimVDnUqHy+aikBrVHWWavyXcbzaPe7cpIceeV9/Fbzn
	/nW0+TL33is9W+w1DGbqeEygB+t/KOLGfVU8HGAFLboaMxJekkXUGlrSO9zo7m169YS+
	m2Yw==
X-Gm-Message-State: AD7BkJItNDzvubbywubRcIsjk2/4UfVtcv3trRofKcYWGsHGcchsajq1pPs+YxLuEAtut9HE23VzZRTjTKHEww==
X-Received: by 10.157.57.199 with SMTP id y65mr8422506otb.27.1458955623212;
	Fri, 25 Mar 2016 18:27:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.15.72 with HTTP; Fri, 25 Mar 2016 18:26:43 -0700 (PDT)
In-Reply-To: <1458833491-7717-2-git-send-email-derek@asterius.io>
References: <1458833491-7717-1-git-send-email-derek@asterius.io>
	<1458833491-7717-2-git-send-email-derek@asterius.io>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 25 Mar 2016 21:26:43 -0400
Message-ID: <CABZSBQea8AKjtfr+TdpVp9kk4uohFof9wHkLNBHZUXGZS4OKWw@mail.gmail.com>
To: Derek Straka <derek@asterius.io>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/4] xen: add the ability to configure the name of the policy
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
X-List-Received-Date: Sat, 26 Mar 2016 01:27:10 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 24, 2016 at 11:31 AM, Derek Straka <derek@asterius.io> wrote:
> When using non-release versions, the policy files may have a different name (xenpolicy-${PV}-unstable).  Allow the policy file name to be configured by the xen recipe.
>
> Signed-off-by: Derek Straka <derek@asterius.io>
> ---
>  recipes-extended/xen/xen.inc | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index bc5ff85..77740cf 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -17,6 +17,8 @@ PACKAGECONFIG ??= " \
>      ${@bb.utils.contains('XEN_TARGET_ARCH', 'x86_64', 'hvm', '', d)} \
>      "
>
> +FLASK_POLICY_FILE ?= "xenpolicy-${PV}"
> +
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>  PACKAGECONFIG[systemd] = "--enable-systemd,--disable-systemd,systemd,"
> @@ -343,7 +345,7 @@ FILES_${PN}-devd = "\
>      "
>
>  FILES_${PN}-flask = "\
> -    /boot/xenpolicy-${PV} \
> +    /boot/${FLASK_POLICY_FILE} \

Looks fine to me, but could this just simply be a wildcard (i.e.
/boot/xenpolicy-*)?  Is there a case where it would generate multiple
images and you would want to key off just one?

