Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2D30E00B20; Tue,  3 Jun 2014 08:21:48 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.52 listed in list.dnswl.org]
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C703E0073D
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Jun 2014 08:21:37 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id s18so1565312lam.25
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Jun 2014 08:21:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=MrLBNCMIhybGozcRJ2+6ABvlXKa0m+isLdkluJYYZ0g=;
	b=et2xAe8qotz/tmyztlxcq+pA9nUaYnSavSw/C1md92djLyxPXI8RzJACP/G2NmaVys
	YC5XSj9umf9722jsOTDuuBgmHZJIkXYac/fzdFAHyIAHGavyYG0IfOidWtim5hEs/5XY
	6/s4XFItM/Uvas88K8QKH05W+f81S6hUCAPBta9qIPUZGSJpomKdmczTSCwHq3WWLKP0
	MMsT2rLk2jNDeEDuNUXDaV92svfhYvYDC2V26WAv0Qwt6LzRedkfG+TA7IGG7YJ9FgOX
	cifEaG+5urqbJ+1u/5LN2NDmTOuwBj7BN83eFlA0ql3rDabzJGGjkxYgCv7s3xjcg7/O
	pp5A==
MIME-Version: 1.0
X-Received: by 10.112.89.66 with SMTP id bm2mr2519796lbb.91.1401808896298;
	Tue, 03 Jun 2014 08:21:36 -0700 (PDT)
Received: by 10.112.124.146 with HTTP; Tue, 3 Jun 2014 08:21:36 -0700 (PDT)
In-Reply-To: <1401459839-22714-1-git-send-email-mihaela.sendrea@enea.com>
References: <1401459839-22714-1-git-send-email-mihaela.sendrea@enea.com>
Date: Tue, 3 Jun 2014 11:21:36 -0400
Message-ID: <CADkTA4MBk-BdUYiT5ASLqKoU5gz5Ogfe=dBB+pLjFC=XM0k-2g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihaela Sendrea <mihaela.sendrea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: fix PTEST_DIR
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
X-List-Received-Date: Tue, 03 Jun 2014 15:21:48 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 30, 2014 at 10:23 AM, Mihaela Sendrea
<mihaela.sendrea@enea.com> wrote:
> The default PTEST_DIR only works for 32bit.

Looks fine to me. I grabbed and applied these to master and daisy.

Bruce

>
> Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
> ---
>  recipes-extended/libvirt/libvirt/runptest.patch |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt/runptest.patch b/recipes-extended/libvirt/libvirt/runptest.patch
> index cdc0f65..873a959 100644
> --- a/recipes-extended/libvirt/libvirt/runptest.patch
> +++ b/recipes-extended/libvirt/libvirt/runptest.patch
> @@ -12,7 +12,7 @@ Index: libvirt-1.2.4/tests/Makefile.am
>         -I$(top_srcdir)/src/conf \
>         $(GETTEXT_CPPFLAGS)
>
> -+PTEST_DIR ?= /usr/lib/libvirt/ptest
> ++PTEST_DIR ?= $(libdir)/libvirt/ptest
>  +
>   AM_CFLAGS = \
>  -      -Dabs_builddir="\"$(abs_builddir)\"" \
> --
> 1.7.10.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

