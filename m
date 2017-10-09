Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 56147E00D52; Mon,  9 Oct 2017 09:39:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 80520E00D2E
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 09:39:25 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id 1so4074211qtn.3
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 09:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=SefzEAFKjh3r3vTabV0nz2tuism1seQHcEndG+UYINs=;
	b=h+buY3jCHBr0F30hZPN76GxjMTLwEHiRtn5MOybWPnC6PcaYGnfe06cNj4aoOQ7xso
	UbGpN/+SiWtzI+ul3wAGj10gO1HEZ/bVwrS6W9rE1Ctu647rryZu96X3+u3BlXRdGwkl
	FPB1rkVG+MwmvVopcUjRrh1V/49+XL6Keato4Z+U0+F8ehIAOT/xSXUH/vrLCJrLE29V
	iDCAZg+TpVVn34BOTN1jCRh6ipXFPviA8ZWQblSEoOPvDnRNB0+qH4Y7jKyIvJojAbLn
	kTTnGp5pt1AfjhjyzaBg9jb/cbxOSLqvsHyGYecPEH9B+234P2WNpschVz9GA9qpDsc7
	XRew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=SefzEAFKjh3r3vTabV0nz2tuism1seQHcEndG+UYINs=;
	b=dMnHn2/WuE9YfbZjcfO3Uhu9vBH8rafPOXxsz+5v11ZT+KoQLU4ImuD4lJxy67j34D
	G3+M7ogCeVo9hphLUCApI5VInAYDViGrjeMUANS9yvak8HlXYo4VUZqCteFzsX4Qp+uS
	DOpGqoKCbumyT5q5xBekJ6kCLx00M60q6a7xpDcK0ySyKPR3i9nRI4ZzNQBt5V8z31z8
	nVx/4n4sjV0mlec+L3H7bYFI1HC8wlhIeqJR1NO3qEnHlakeC2KoP+X3eYreCqvyXVO1
	o7kRe9i9lZPPJzDb3qdDEeb5pxeVWT7eGexOU2e8rC7dNnveD82O9knRF7/fF06MtgTm
	xw8g==
X-Gm-Message-State: AMCzsaXu0aNoOAT2lX1K0AL36WydEPN2+ODwoQJpeyE39OYf7orSQxKV
	kzUrZq7/WYoqP5bclKZnf+RFk1w03rp2dcgG34E=
X-Google-Smtp-Source: AOwi7QAl77YMbN4qOPKswdoSPrY5PZ5S3czCy1OAFNXgzi791NftjjNZrU4J8nR5hFdMzSEHgaSEREt7SzN5QXsRJDs=
X-Received: by 10.237.59.77 with SMTP id q13mr15706895qte.80.1507567164687;
	Mon, 09 Oct 2017 09:39:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 9 Oct 2017 09:39:23 -0700 (PDT)
In-Reply-To: <1507398755-15398-1-git-send-email-dariusz.pelowski@gmail.com>
References: <1507398755-15398-1-git-send-email-dariusz.pelowski@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Oct 2017 12:39:23 -0400
Message-ID: <CADkTA4MLx9ZTceLEtwNdcnyH-XCv+oOO6ixghD9=SFBbHd1GLg@mail.gmail.com>
To: Dariusz Pelowski <dariusz.pelowski@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen-image-minimal: corrected popoulation xen.gz for syslinux
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
X-List-Received-Date: Mon, 09 Oct 2017 16:39:26 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sat, Oct 7, 2017 at 1:52 PM, Dariusz Pelowski
<dariusz.pelowski@gmail.com> wrote:
> syslinux images cannot boot because they're missing of xen.gz
> file. Current poky doesn't use populate() function, instead
> syslinux_populate() can be used.
>
> Signed-off-by: Dariusz Pelowski <dariusz.pelowski@gmail.com>
> ---
>  recipes-extended/images/xen-image-minimal.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/images/xen-image-minimal.bb b/recipes-extended/images/xen-image-minimal.bb
> index 827cc87..c39d378 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -47,7 +47,7 @@ grubefi_populate_append() {
>         install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}${EFIDIR}/xen.gz
>  }
>
> -populate_append() {
> +syslinux_populate_append() {
>         install -m 0644 ${DEPLOY_DIR_IMAGE}/xen-${MACHINE}.gz ${DEST}/xen.gz
>  }
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
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

