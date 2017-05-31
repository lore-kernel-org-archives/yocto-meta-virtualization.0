Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B54CE00B01; Wed, 31 May 2017 10:22:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.213.196 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.196 listed in dnsbl.sorbs.net]
Received: from mail-yb0-f196.google.com (mail-yb0-f196.google.com
	[209.85.213.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 36C1EE00992
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 May 2017 10:22:44 -0700 (PDT)
Received: by mail-yb0-f196.google.com with SMTP id o185so691217yba.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 May 2017 10:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0jbasl5ssk0a1PyvIhZOo4QkNsUmSz0I5X0FFjhSg68=;
	b=H4VTudjq5YbuUaZzIbrY7+HaDVmwqtyZaCAxpbX/FpOw2j0C08CdlaDL+in7HoOL7b
	wDUg6OuilFORbKBXnpn7zti4j1+oPpD7AwTBa5kyQcibymRbLBKh7qu/fZc32mlGe1vE
	6UPeDAcISEKimxajtKCaNyTx1TxFoQm/M/MVpgtV6QSrPahejROJBlkSjFVcZ5m1bsqJ
	lFA3ryNa8GlmXc5YvOdMQL7hQUpvc3dqFeYi98OuR5m6DrTEiYGUbLCPcASib+AydCvi
	RP3VZZhLuRR+MdSYGAvRMNlkP6e7Pofy6oMaueAMlcBHE1MofoVIaS9U5GZUq750JBuz
	iKyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=0jbasl5ssk0a1PyvIhZOo4QkNsUmSz0I5X0FFjhSg68=;
	b=Mc+LTIgJY7rLgHqGldHuqtWVpc6lZ9MVZFlqTFIREuP6LSJens3LfiY8CvNQQxMPAz
	uNcf7dHEzngs2h3cBxht6BeQLHOlJMOWtUpNKhECguhD3pSp05tihp3gVVuPaiQKlc0J
	x8EwTA/DNkezgzGv+HI7C/GmXT0cTV5NGlIyXefbNTAcavyCqGH0xHlSDYv0WOsBlByA
	fuMxOFo4F5WCQQ6UZWV0rxnGhxAk46G8Y8fF9JTt0b+il7UKlUUNdQY7E4/8LUdRCGyW
	cMQo6JW1W3sA5pOewUp8PltnWP1CktpE1mIqgNPYFmZP4Xh8MF4jSk+Dyva2rf9lfO8Y
	/lHw==
X-Gm-Message-State: AODbwcB+QGp9i7LqwtyYawMT5zOGzXaPc1yoEHPSuUcDaMvG1wMw8Jd8
	b7YlpGhzruCCuN4IyglAi15Ev4ksag==
X-Received: by 10.37.207.7 with SMTP id f7mr5915092ybg.93.1496251364307; Wed,
	31 May 2017 10:22:44 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.162 with HTTP; Wed, 31 May 2017 10:22:43 -0700 (PDT)
In-Reply-To: <1495543547-3174-1-git-send-email-adrian.dudau@enea.com>
References: <1495543547-3174-1-git-send-email-adrian.dudau@enea.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 31 May 2017 13:22:43 -0400
X-Google-Sender-Auth: C4Iv_8I8tIFyztcBMs2STvQKN9g
Message-ID: <CAPuovEKZsigukzeG8pZ5nASU_9DTuHbN8a0yH-1XQ=4BMA--xw@mail.gmail.com>
To: Adrian Dudau <adrian.dudau@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] openstack-image-*: Remove ROOTFS_PKGMANAGE_BOOTSTRAP
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 31 May 2017 17:22:46 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, May 23, 2017 at 8:45 AM, Adrian Dudau <adrian.dudau@enea.com> wrote:
> run-postinsts is now installed by default in image.bbclass, so no need
> to include it in each image.
>
> Reference: OE-core rev 529244ee212fe14019e35a5f163fab705ddbf141

^^^^^^^Yocto reference
But often see this as one or the other and don't know if folks are
strict about this or not.

At any rate the change looks fine.

Mark

>
> Signed-off-by: Adrian Dudau <adrian.dudau@enea.com>
> ---
>  meta-openstack/recipes-extended/images/openstack-image-aio.bb        | 1 -
>  meta-openstack/recipes-extended/images/openstack-image-compute.bb    | 1 -
>  meta-openstack/recipes-extended/images/openstack-image-controller.bb | 1 -
>  meta-openstack/recipes-extended/images/openstack-image-network.bb    | 1 -
>  4 files changed, 4 deletions(-)
>
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-aio.bb b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> index 2df8536..2fbb85e 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-aio.bb
> @@ -6,7 +6,6 @@ OPENSTACK_COMPUTE_EXTRA_INSTALL ?= ""
>  OPENSTACK_AIO_EXTRA_INSTALL ?= ""
>
>  IMAGE_INSTALL = " \
> -    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>      ${CORE_IMAGE_BASE_INSTALL} \
>      packagegroup-core-full-cmdline \
>      packagegroup-cloud-compute \
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-compute.bb b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> index 979e525..897efc4 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-compute.bb
> @@ -5,7 +5,6 @@ OPENSTACK_COMPUTE_EXTRA_INSTALL ?= ""
>
>  IMAGE_INSTALL = " \
>      packagegroup-core-boot \
> -    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>      packagegroup-cloud-compute \
>      packagegroup-cloud-debug \
>      packagegroup-cloud-extras \
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-controller.bb b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
> index 89a4d07..6f324d8 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-controller.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-controller.bb
> @@ -5,7 +5,6 @@ OPENSTACK_CONTROLLER_EXTRA_INSTALL ?= ""
>
>  IMAGE_INSTALL = "\
>      ${CORE_IMAGE_BASE_INSTALL} \
> -    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>      packagegroup-core-full-cmdline \
>      packagegroup-cloud-controller \
>      packagegroup-cloud-network \
> diff --git a/meta-openstack/recipes-extended/images/openstack-image-network.bb b/meta-openstack/recipes-extended/images/openstack-image-network.bb
> index 8c94357..370c273 100644
> --- a/meta-openstack/recipes-extended/images/openstack-image-network.bb
> +++ b/meta-openstack/recipes-extended/images/openstack-image-network.bb
> @@ -3,7 +3,6 @@ LICENSE = "MIT"
>
>  IMAGE_INSTALL = "\
>      ${CORE_IMAGE_BASE_INSTALL} \
> -    ${ROOTFS_PKGMANAGE_BOOTSTRAP} \
>      packagegroup-core-full-cmdline \
>      packagegroup-cloud-network \
>      "
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

