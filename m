Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2C76AE00563; Mon, 18 Aug 2014 10:59:26 -0700 (PDT)
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
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7B59EE004F5
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Aug 2014 10:59:19 -0700 (PDT)
Received: by mail-lb0-f176.google.com with SMTP id u10so4445493lbd.21
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Aug 2014 10:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Rg9g3BHW0+U+E9FZ7e7x1aknrO0Jfi+v4U9Shst5vPQ=;
	b=ZOcItWl9Dh8Edm+XTFLF/zV+ntaArCiK8pyweQc6YFbRMOSOZYmKAW1cx1UcoelbRf
	zeqd0btHDLQJUYBWnMZH5jvaMKdZT9Ucrd46GpsgNZEdIL8pxxG5IjHg0vFXwToIz3W6
	wYllnp7N2EuPTSD2n7pGqhuwP/bxgAdUBtsJEb5WBr3kFx5JvYLyabBeK4QPs2Lp4m8K
	NHgT3HV3jXNrqO1JGUKBeXwFT7JcH3VLCA9QlssZ1d2VqlPU5yJ4UoBIl8jxbHhZH1dX
	0E4gELWkAX5n2gSXRDB+BZVwN9c0ISDu/ejr+EN0VeELFGseticFisTJ+CTNp3eCHMET
	WRxA==
MIME-Version: 1.0
X-Received: by 10.112.163.103 with SMTP id yh7mr29738525lbb.73.1408384757785; 
	Mon, 18 Aug 2014 10:59:17 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Mon, 18 Aug 2014 10:59:17 -0700 (PDT)
In-Reply-To: <1407827345-8097-1-git-send-email-bobadeshrikant@gmail.com>
References: <1407827345-8097-1-git-send-email-bobadeshrikant@gmail.com>
Date: Mon, 18 Aug 2014 13:59:17 -0400
Message-ID: <CADkTA4MCXjFKLd=+c5NQzJG2Ev9Dw=VNpsgqUQEED4swVnY2vA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Shrikant Bobade <bobadeshrikant@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Shrikant Bobade <Shrikant_Bobade@mentor.com>
Subject: Re: [daisy][PATCH] libvirt: set path to pkcheck
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
X-List-Received-Date: Mon, 18 Aug 2014 17:59:26 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 12, 2014 at 3:09 AM, Shrikant Bobade
<bobadeshrikant@gmail.com> wrote:
> From: Shrikant Bobade <Shrikant_Bobade@mentor.com>
>
> The libvirt build would fail whenever x11 was in DISTRO_FEATURES and the host
> didn't have polkit installed (either no polkit/policykit at all, or just old
> policykit).
>
> Ensure that libvirt uses polkit rather than policykit, whether the host has
> pkcheck installed or not, and ensure the path is correct per our config.


Sorry for the delay, I was out of the office.

I applied the patch to daisy and master, let me know if anyone has problems!

Cheers,

Bruce

>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> Signed-off-by: Shrikant Bobade <Shrikant_Bobade@mentor.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.2.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.2.bb b/recipes-extended/libvirt/libvirt_1.2.2.bb
> index 0cd6b99..a14d465 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.2.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.2.bb
> @@ -67,6 +67,10 @@ ac_cv_path_LVS=/usr/sbin/lvs \
>  ac_cv_path_PARTED=/usr/sbin/parted \
>  ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>
> +# Ensure that libvirt uses polkit rather than policykit, whether the host has
> +# pkcheck installed or not, and ensure the path is correct per our config.
> +CACHED_CONFIGUREVARS += "ac_cv_path_PKCHECK_PATH=${bindir}/pkcheck"
> +
>  # Some other possible paths we are not yet setting
>  #ac_cv_path_RPCGEN=
>  #ac_cv_path_XSLTPROC=
> @@ -75,7 +79,6 @@ ac_cv_path_DMSETUP=/usr/sbin/dmsetup"
>  #ac_cv_path_EBTABLES_PATH=
>  #ac_cv_path_PKG_CONFIG=
>  #ac_cv_path_ac_pt_PKG_CONFIG
> -#ac_cv_path_PKCHECK_PATH=
>  #ac_cv_path_POLKIT_AUTH=
>  #ac_cv_path_DTRACE=
>  #ac_cv_path_ISCSIADM=
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

