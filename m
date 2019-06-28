Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 347D2E00CDF; Thu, 27 Jun 2019 20:31:58 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8491E00994
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 20:31:56 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id k18so4442953ljc.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2019 20:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=fk1JuFncL9WYW3rC9JiI6B2OfwfQviG0XtkWs/1Lq78=;
	b=iOopBMHrhIl9ahoxjzBvgUv+wSdeijCVB4+IvgFv3HInLXv4F6EpjS1z/rRgV39OKL
	XTW3W75WN0KdrETsJr82qP4bPFPll74s0eYKeFPRgvGVB10WqqfJr3ygpjQLK8E/opD9
	zlQ8qzaLkmhJHD+b6Elsv+kFMUvvyAw1YDT8+XvtBxAkqdz7Bns+YK/Q4xcyz63SEUee
	OoIXrbEde5qFX/FIJtuzRwAtnW2TxHcgF55M6IX5zEQnZNaRC+GmwIOt5KwTTMZ0tnLU
	oAggvx42h2fZ+SRuK6fTThVPtJmUd3JJxYObDFqCGYFFUG5l5kfewRTY2pnVsH7hXZ57
	VTAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=fk1JuFncL9WYW3rC9JiI6B2OfwfQviG0XtkWs/1Lq78=;
	b=P3zIhKujXL899ZgjkWxqetSBqZO7qwI8Q3iyLLf2bPKOMh/hIlYN9bP6pAJVPLk1Ix
	o3Hp6MaWODctMTidCT11rfSaAYp+LWtWNniZSPE7kslhvsc0QLQQk1ASvU/zO9YUgH3u
	jltdm447t1JkXUe8MKis9FH4s53qyEYc6RueAQqXtPB1+2uxP7mE1oCecpXq7j1Qke62
	5sqGzHGHe+nBggfU6tMJjLNyQp2PolylQMWarIQIVioJ25azIVzwHU+lv0VDKKjIwqo6
	zLP4Oed4P9/a2pcj0UIIeXORRmHiQYtJg21LEG2oofwUWGYpdDt33i0IENeUNi5HMqYz
	7uiA==
X-Gm-Message-State: APjAAAXe5M5OHa1Rz26prII8s2QUGrjKJy33p6F2IbOa+Fb/oqoHLkho
	y1vA6duqHHPthg4Tr95X5iN/Uldo+0eCpORYUOc=
X-Google-Smtp-Source: APXvYqzEhk7ZLOyu5NqfaaC9nZAtO0T+huf+Up70ALuio7Xl4kMlP4JnVMQWYLXC2OrQCWaJ6bONNoC/dMK5T9QPf98=
X-Received: by 2002:a2e:5cc8:: with SMTP id q191mr4785700ljb.118.1561692715675;
	Thu, 27 Jun 2019 20:31:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190625190407.29291-1-joe.slater@windriver.com>
In-Reply-To: <20190625190407.29291-1-joe.slater@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 27 Jun 2019 23:31:44 -0400
Message-ID: <CADkTA4OxeEBD_huphoKu-5DWEXDj2sb0JehxvBUz6V6ZztyfJQ@mail.gmail.com>
To: Joe Slater <joe.slater@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [meta-virt][PATCH 1/1] irqbalance: use git repo for source
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
X-List-Received-Date: Fri, 28 Jun 2019 03:31:58 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jun 25, 2019 at 3:04 PM Joe Slater <joe.slater@windriver.com> wrote:
>
> Avoid src-uri-bad qa warning when getting source from github.com/../archive.
>
> Signed-off-by: Joe Slater <joe.slater@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance_1.5.0.bb | 14 --------------
>  recipes-extended/irqbalance/irqbalance_git.bb   | 18 ++++++++++++++++++
>  2 files changed, 18 insertions(+), 14 deletions(-)
>  delete mode 100644 recipes-extended/irqbalance/irqbalance_1.5.0.bb
>  create mode 100644 recipes-extended/irqbalance/irqbalance_git.bb
>
> diff --git a/recipes-extended/irqbalance/irqbalance_1.5.0.bb b/recipes-extended/irqbalance/irqbalance_1.5.0.bb
> deleted file mode 100644
> index f73b106..0000000
> --- a/recipes-extended/irqbalance/irqbalance_1.5.0.bb
> +++ /dev/null
> @@ -1,14 +0,0 @@
> -#
> -# Copyright (C) 2015 Wind River Systems, Inc.
> -#
> -
> -require irqbalance.inc
> -
> -SRC_URI[md5sum] = "3daa34066d28e2ff44fdac9c39952822"
> -SRC_URI[sha256sum] = "3318eddc03782cfdad22b20eff18eaf378c498c5de286e8cbaa5521ddf4f810b"
> -
> -SRC_URI = "https://github.com/Irqbalance/irqbalance/archive/v${PV}.tar.gz;downloadfilename=irqbalance-${PV}.tar.gz \
> -           file://add-initscript.patch \
> -           file://irqbalance-Add-status-and-reload-commands.patch \
> -           file://irqbalanced.service \
> -          "
> diff --git a/recipes-extended/irqbalance/irqbalance_git.bb b/recipes-extended/irqbalance/irqbalance_git.bb
> new file mode 100644
> index 0000000..0571b1b
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance_git.bb
> @@ -0,0 +1,18 @@
> +#
> +# Copyright (C) 2015 Wind River Systems, Inc.
> +#
> +
> +require irqbalance.inc
> +
> +# commit tagged as version 1.5.0
> +#
> +SRCREV = "e783d132e96a7ccc2a60ac8b87802ab782bb27be"
> +PV = "1.5.0"
> +
> +SRC_URI = "git://github.com/Irqbalance/irqbalance \
> +           file://add-initscript.patch \
> +           file://irqbalance-Add-status-and-reload-commands.patch \
> +           file://irqbalanced.service \
> +          "
> +
> +S = "${WORKDIR}/git"
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

