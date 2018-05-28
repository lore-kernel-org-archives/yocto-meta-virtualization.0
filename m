Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71A65E00AE4; Mon, 28 May 2018 11:17:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3C0BAE007CE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:17:52 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id p22-v6so4301640yba.13
	for <meta-virtualization@yoctoproject.org>;
	Mon, 28 May 2018 11:17:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=G4/G2ReMwL7ZbFEwGIPLViuFcteF0rcb4GtRfk24FPM=;
	b=Zb0qopE8FxRcAvkeMO/Mml/E1A5DxK4UYQVDYLFsdGJDFKZfcdAqHX4h/6pyJlo8Nx
	cl0d9Ne3i6sM4oNSfutDeT/KLVFrMd7TriHLKFSoR3Y7iJFjHlY79YOUdq4yr7vYyzkC
	8V7oQ1TfH5gWD1cNah+zO60SdvO9RR52MzFzCkSLzi4IsikoR5drkkb5m//Vcs+RGxDe
	1+RbtiY3yEzOmuiOPLmLgrHytDvSjON188rcwyR84P6y7iL1BhLpiBYiVXqTgVLdJTwZ
	+FH8cuOAp/OQR6XQMszngq8T7WT1fj62JVKH7UJd5wyN8Qrn6LhHgSGKWSdKMaVrca3w
	r4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to;
	bh=G4/G2ReMwL7ZbFEwGIPLViuFcteF0rcb4GtRfk24FPM=;
	b=PZizhVzvRXB2k5xKHnbaRhU0MONJYxLXgBnBmc595f6H8Iim3g9bispOf1jiNfg6gI
	FsXF/S4053Fy5JBA4FAPGtXYx3Qx64rMzxlA9S+j2UdKyOhuwg1eGxtH9Nn1FcBc6efJ
	uWxx/Cpfh4Lg9+GucQcvY7W0RUHRzWaif4yQPFtgvWYIb/A5H19fu+JQ4kixcCOw3otj
	ufY6BAYxACHfEQhFly6kNxDe0/D2NKtEQxuUAbS8Wg7GX/N1h+wnyk7gjdX9Wo3J6Glr
	QwoBy63venXJLryEybUs12juVsU75yE10nEvX6zQ+RsQKVAGMjSJm2jE06rxdZvTXs0h
	Nrdw==
X-Gm-Message-State: ALKqPwc4CnutAdFLTvYfOE/ku2te35okHbNvYRMjwmCdB5yEyrMhzHjO
	cXmAX2rbwfVYvFMw9ChMMPpVpeYL54iGzrTuPPqtVg==
X-Google-Smtp-Source: ADUXVKIQr7qHtltvtSWSZw9WE27dVWbyNnHCL1ib+6ZpwMl9nx4DrauPEAQVAatTh/gbBJ/Teje417U3ci/b5kZMGnw=
X-Received: by 2002:a25:3291:: with SMTP id
	y139-v6mr3580698yby.431.1527531472107; 
	Mon, 28 May 2018 11:17:52 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:3dc7:0:0:0:0:0 with HTTP; Mon, 28 May 2018 11:17:51
	-0700 (PDT)
In-Reply-To: <1527523214-18904-1-git-send-email-mark.asselstine@windriver.com>
References: <1527523214-18904-1-git-send-email-mark.asselstine@windriver.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 28 May 2018 14:17:51 -0400
X-Google-Sender-Auth: IHpcVOi1cUDGdk-Dh24XyMwRu2U
Message-ID: <CAPuovEJWB3t7EYQKpnCW_VNusK4KOALPHqiFwYvxmEZ+rF5+2A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvmtool: uprev to latest version
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
X-List-Received-Date: Mon, 28 May 2018 18:17:54 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, May 28, 2018 at 12:00 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Currently on the master branch builds of kvmtool are failing due to
> several missing headers. We need to only use the uapi headers and we
> also need the kvmtool upstream commit 1cc05b24bfe0 [x86/kvm-cpu.c:
> don't include <asm/msr-index.h>] to get the builds to work. So we
> can't do this as a fix and uprev and must do both at once in this
> single commit.
>
> The upstream project does not have releases so using the latest commit
> and setting the version to 4.14.0 to reflect the kernel version we
> currently build and which tests were done with, when using Yocto
> master.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---

Some changes were missed. I will send a V2.

Mark

>  recipes-extended/kvmtool/kvmtool.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
> index 33fec31..63cc847 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -21,7 +21,7 @@ PV = "3.18.0+git${SRCREV}"
>
>  S = "${WORKDIR}/git"
>
> -EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_DIR}/arch/${ARCH}/include -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated/"'
> +EXTRA_OEMAKE='V=1 EXTRA_CFLAGS="-I${STAGING_KERNEL_BUILDDIR}/include/generated -I${STAGING_KERNEL_BUILDDIR}/arch/${ARCH}/include/generated"'
>
>  do_install() {
>      install -d ${D}${bindir}
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

