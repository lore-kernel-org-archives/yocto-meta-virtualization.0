Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 469ECE00B47; Wed, 19 Sep 2018 01:00:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
	[209.85.167.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC737E0095C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:10 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id g24-v6so4260937lfb.11
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Sep 2018 01:00:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=gVqN+PZHD9cMChUXjjgLsOsrl2GNJ3lnDrUuWXoI6gw=;
	b=Bw8DNvgXM4/fHmZP4q6cF9nasTJpVhgb1LYp13Sfi6K7cDAFYrCkuYAaHNdnzt/qg4
	9nEbZxooipUA9ZSDC4f70lugLO6BY2pkIdvE4z4h5FgYbaXmVEikWbZo3B6zVYu/AST+
	DJ0rsbf9CMXjcWLX1Jbu0g+BXoZDVYwsr0PChFtG3KLpcnzSYw+ErEba6TGG9ScsBfds
	yahu7IAgLqPeUe/n+6+ch8wHDztHkO+idduVq3E6Lw9Ekw33vQEpXtTzcaRmPRIXlMib
	Y5MBtvCC04AL7FcnWGG0H3DjskIO0RfN4SRdmcTTSu+o/Von2GgquyHbl5u+/1FXNznP
	iCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gVqN+PZHD9cMChUXjjgLsOsrl2GNJ3lnDrUuWXoI6gw=;
	b=pqga/71Yc+XnvDr0pz91oyxf1QF9mp9+NSPzYutcnrTr3309uAJVUCPIHILpzq1BLn
	q2NWexp807mIggj4YzKbe3HPA7VdAQfgQZ6jqRlyuImdG+XGpo/2HPBk/wTdHrq9Ae5f
	oGNMgC/9ti25hdrju8zBKcCtVZFT9BTydq0Pdn32t2tm92j8+EYoTVXLM9xldoZHhbLn
	zeVWbJpGlo8kLk2IDkf2+TlbomwJ869WZE+6FzjoN4JvdDvJ98aoIgWQqoVzHRpNS3c6
	6Wf+3teeZUrvNTJkjFUt4tReaF+vy6iassr+8LWduEALd1SVJSQA3PjLR3w5r2DOQRxD
	lQPQ==
X-Gm-Message-State: APzg51D6bioerTeghSM5ZPGhyKvxTvExHDcCclLKJXwQZCPWjoUGy6nq
	CzpMV1TWpUIN1EH09pQTHMYjTY+Wgk83b/xwlB9HbQ==
X-Google-Smtp-Source: ANB0VdaLOpwWhbzbLKty36TbiKqbjbEi1JJuqu9DtD9chyB7STvsQHOCV6FnfCuCU9sdPJeL0lNhQk+aj0l60WGQ0b4=
X-Received: by 2002:a19:96:: with SMTP id 144-v6mr4432492lfa.101.1537344009730;
	Wed, 19 Sep 2018 01:00:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:86c9:0:0:0:0:0 with HTTP; Wed, 19 Sep 2018 01:00:09
	-0700 (PDT)
In-Reply-To: <20180918093631.1253-3-hongl.fnst@cn.fujitsu.com>
References: <20180918093631.1253-1-hongl.fnst@cn.fujitsu.com>
	<20180918093631.1253-3-hongl.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 19 Sep 2018 04:00:09 -0400
Message-ID: <CADkTA4M73agRwobT03vNLUxGSWQhuLehbUgR9Wfi+CXO=JrLog@mail.gmail.com>
To: Hong Liu <hongl.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [meta-cloud-services][patch]:python-swiftclient:3.5.0->3.6.0
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
X-List-Received-Date: Wed, 19 Sep 2018 08:00:12 -0000
Content-Type: text/plain; charset="UTF-8"

merged

On Tue, Sep 18, 2018 at 5:36 AM, Hong Liu <hongl.fnst@cn.fujitsu.com> wrote:
> Upgrade python-swiftclient from 3.5.0 to 3.6.0.
>
> Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
> ---
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index f668155..0ee9680 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -9,8 +9,8 @@ SRCNAME = "swiftclient"
>
>  SRC_URI = "git://github.com/openstack/python-swiftclient.git;branch=master"
>
> -PV = "3.5.0+git${SRCPV}"
> -SRCREV = "b91651eba09ed43903c55f24e3a1a52aefeea75f"
> +PV = "3.6.0+git${SRCPV}"
> +SRCREV = "1cf074f4da62b7a42f88aef3c8571e7b6e850823"
>  S = "${WORKDIR}/git"
>
>  inherit setuptools python-dir
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

