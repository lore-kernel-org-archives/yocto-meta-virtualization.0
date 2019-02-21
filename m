Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E724AE00CB9; Wed, 20 Feb 2019 19:17:19 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.177 listed in list.dnswl.org]
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com
	[209.85.208.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 430F1E00B92
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:19 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id l5so19282375lje.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Feb 2019 19:17:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=r+QY3opTEuOdxRR5ZpfiTdY2Sm3Wc54cAfrkh+xT1Gc=;
	b=Vd7KAPImdRNImK8b6MtAwySoc/C0BzP1WlencT9ZfKxeQ9mt8YDn1AWEwDl5qwsXt3
	vjVIBwO6U+5E/5dcIqauByZAVS+ErbpBp3OBG25lUhdZNnxwS612Fwzb63jqWkXVF4m8
	1z7aG/cXFJL8s6x9k8lXc2ezslqcvGvHYqY6gFX33SUSIAhCOXoGQ9JxLZyQDzoNyzy9
	A+sSbl47HzSSNlVeSxwSJRQM31CCM7gqj6yijxFeWlBSpzomC1dExvVm3+Wrp3rNhXSZ
	+tW9dydOAP0KmwpIqtWG9jTDH/5j1o4VQjl3Cd2s7i5y0BlXx5W/x1D7G8TDz4OokyPR
	2qPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=r+QY3opTEuOdxRR5ZpfiTdY2Sm3Wc54cAfrkh+xT1Gc=;
	b=nfLTfeGLXyI5qb2Dth2TiDtipq/pEqMp+6TJJqiyGj7W+EHbVFBfeg8f/JIRLGCL44
	v2eM+yAA+X12V1BK5uTCrgpU0ZgHzuBeQ9Pn49AWc88AyJB/26S29uT3Vi2emN4RWM3J
	PKx9hSvtj5iHX/naPi/EZpsT4ls8hWRKdoSWE7bcBPgpNT9JnTLU3a+RAxL8iS5YV6uX
	gnhS1oHxMqUaJO3DR4vCJuz8ju8AWKo5iCFBJPajM5l7/Jc6dShWgevuMUhXFfPSA6WI
	hNRn15eZPLf08ViDCR0+qO8h7mi8yk+XcVNfTCW1HC5msqsDR4JvQu6EKFg1860qUA2r
	Nhyw==
X-Gm-Message-State: AHQUAuZcQkAVcPBCivk3sjeAGeIa3vKqIzryOIQbcSF/D2JtWyFy5BG+
	jRupd/Gx4vTXIkYvY4y5csGR1mPtkSFPVFKmTTc=
X-Google-Smtp-Source: AHgI3IasRLH3UQwWyp4pWFeUR/VIiadtDYzkctoRvGOsuiGCPfvp7BCBdNFe0IUBqsswA66te5peDB0lqGDbdp2OJW4=
X-Received: by 2002:a2e:9a55:: with SMTP id k21mr11285152ljj.191.1550719037863;
	Wed, 20 Feb 2019 19:17:17 -0800 (PST)
MIME-Version: 1.0
References: <20190221002627.163588-1-joe.slater@windriver.com>
In-Reply-To: <20190221002627.163588-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Feb 2019 22:17:06 -0500
Message-ID: <CADkTA4MTXoX2rAWn+dHkBcOKs8yn=K7og45DLsz1rcxQPkNJZQ@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virt][m-c-s][PATCH 1/1] consul: do not try to build for mips
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
X-List-Received-Date: Thu, 21 Feb 2019 03:17:20 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Feb 20, 2019 at 7:27 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Use COMPATIBLE_HOST to prevent building for mipsarch.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-connectivity/consul/consul_git.bb | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
> index ee49c5e..b0afa03 100644
> --- a/recipes-connectivity/consul/consul_git.bb
> +++ b/recipes-connectivity/consul/consul_git.bb
> @@ -14,6 +14,10 @@ S = "${WORKDIR}/git"
>
>  inherit systemd go
>
> +# Besides the hosts specified in goarch, we do not build for mips.
> +#
> +COMPATIBLE_HOST_mipsarch = "null"
> +
>  SYSTEMD_SERVICE_${PN} = "consul.service"
>  SYSTEMD_AUTO_ENABLE_${PN} = "enable"
>
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

