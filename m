Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8CA0E00D81; Tue, 19 Dec 2017 19:43:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.181 listed in list.dnswl.org]
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0FBEE00D6B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 19:43:33 -0800 (PST)
Received: by mail-qk0-f181.google.com with SMTP id x7so7768259qkb.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Dec 2017 19:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=+t96BY4Rnf6iB+I3GuDx3nq4+JwqYeqgy231XoNNe7w=;
	b=YHqcrkuU7iHcsmGMGs9S/F25oq1lJojp8XQ27xD6mOJMuQZ9yctFbpL0220Tz2jI8U
	j/J51GrkgMnLp+NWfOWXWKYf+NTF2wTbm399u+c+6vC5nYkynxcH+qGEoRfNMz+3Mk6G
	1+0C8TwqhTglbuQK1GJf8LI61W3R9NuddYihOKSFb855FsHNaA/ETc+bksYbLPcNIR5u
	XNP2mbb0/m8ddspeD7uFi8g0Y9P1shsAr4l3owxNKwAzhi3v3bvzYNMuSWwmkmfoVQ1Q
	InXe4/u5Os2sTHqCmb8tdfX+TIvlVRrGAnw/mTTgwLHvBaRLjByFdbt6cM12wGTD0tUC
	IBvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+t96BY4Rnf6iB+I3GuDx3nq4+JwqYeqgy231XoNNe7w=;
	b=tknWeHCocZKoe1q3dO2jmTQHOtExzwHhLUlWfyytO7cfnHLtmoTe+l2f5ddu0t/oHO
	s1Mat66C0757I5aU0lUoA4bcRp4fCzFfvP+QI3KfpSNssQq/tdq6n4H2D1VakT1AlN1k
	/YiVRCVR/EcWw/nvHFt557h55ccprWSiq91JC0/lbU6YkO+iOJwtHUCXQoopJLTL4rNK
	PrwD5dgLKOvWVJektzDxIc62DCjBXxizPxSN2TqDHSgbWCXsBTFxKqPa+qKEYGaFEl2V
	lvquWucC5AEmhd4hJCMIoXwG3+eB3ssyLaaAWw0ZOj8qitbDSnx3Sy9378WKcrMgkr7F
	DWvQ==
X-Gm-Message-State: AKGB3mIDUBwsTxPYugltCHGhfPrIraU636tsZy1cBgG7Pu0nVIH66xqM
	UQLmdjyTfYaf127DJjQXD6SIkGH0HiewEbedQyjpVw==
X-Google-Smtp-Source: ACJfBouukcepKW35WCvnaw+E1o4SDLnC+AsFJ8sR2pNdhMBFyEsNBQVlTu7TaiaeJqT5X12OWhHo2E4+MgiHBFW9s0o=
X-Received: by 10.55.18.92 with SMTP id c89mr7605695qkh.19.1513741412657; Tue,
	19 Dec 2017 19:43:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.96 with HTTP; Tue, 19 Dec 2017 19:43:31 -0800 (PST)
In-Reply-To: <1513375944-10887-1-git-send-email-mark.asselstine@windriver.com>
References: <1513375944-10887-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Dec 2017 22:43:31 -0500
Message-ID: <CADkTA4OvxMyrnEsi8tceuO-WVmUTq7nA6dkMDL0jscj0YkNMgQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] libibverbs: don't do battle when meta-dpdk is in play
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
X-List-Received-Date: Wed, 20 Dec 2017 03:43:34 -0000
Content-Type: text/plain; charset="UTF-8"

merged!

Bruce

On Fri, Dec 15, 2017 at 5:12 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> The meta-dpdk layer has its own special version of libibverbs which
> will conflict with our version:
>
>   Error: Transaction check error:
>   file /usr/lib64/libibverbs.so.1.0.0 conflicts between attempted installs of \
>   libibverbs1-1.1.7-r0.corei7_64 and dpdk-dev-libibverbs-1.2.1+3.4+2.0.0.0-r0.corei7_64
>
> Ensure only our version or the meta-dpdk version is in use. With
> current layer priorities and such this should result in the meta-dpdk
> version being used, which is fine since if DPDK is desired we are best
> using the version recommended by meta-dpdk. Users can use
> PREFERRED_VERSION or other tools to override the default behavior.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-extended/libibverbs/libibverbs_1.1.7.bb | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/recipes-extended/libibverbs/libibverbs_1.1.7.bb b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> index e75f90d..9fc0d6e 100644
> --- a/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> +++ b/recipes-extended/libibverbs/libibverbs_1.1.7.bb
> @@ -25,3 +25,5 @@ do_install_append() {
>          mkdir -p ${D}${sysconfdir}/libibverbs.d
>          rm -f ${D}${libdir}/libibverbs.la
>  }
> +
> +RCONFLICTS_${PN} = "dpdk-dev-libibverbs"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

