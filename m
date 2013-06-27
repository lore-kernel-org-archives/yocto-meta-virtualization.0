Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F1B26E013CB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 10:42:21 -0700 (PDT)
Received: by mail-lb0-f171.google.com with SMTP id 13so561302lba.16
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 10:42:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=eveOOU9BfGtQ1VV42X8oaCLwbgo6o+SQmdxOTx8pJG4=;
	b=aZ9xnH/Lo2ZGsR49a8w299qijA1TGsqAt/FB9bkdSBIUxUMiCQ94ViF2lS2nA8zAWr
	GMvQcY42WUYOINGtUL5AQnfYi9ZKffZIhW+OVjmHA/EvW8HQBuj8P9Nnj/k0NMpI0BpT
	91byPSbt3DVJxAUj/7cn6KC8xal8KkJpsTBS04jQwVGLEs5aGtAox2tqGLaFqjDZz3cD
	xw/q6BtbWB332Ak4/RWuoAgDKtKXGDaAHsmKU4fSe0psSOIuhyEXHjpHVolwWxK/3sHb
	t7+vgamyGDjg1svnO6YZYOGWhgHpEQxZx2JWBrdtjR1Kk3hTHY4fKzkjF6zlZygZQ8mq
	ADjg==
MIME-Version: 1.0
X-Received: by 10.112.171.66 with SMTP id as2mr4767298lbc.57.1372354940356;
	Thu, 27 Jun 2013 10:42:20 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Thu, 27 Jun 2013 10:42:20 -0700 (PDT)
In-Reply-To: <1371749105-24841-2-git-send-email-jslater@windriver.com>
References: <1371749105-24841-1-git-send-email-jslater@windriver.com>
	<1371749105-24841-2-git-send-email-jslater@windriver.com>
Date: Thu, 27 Jun 2013 13:42:20 -0400
Message-ID: <CADkTA4M3MWyCxFLB2MU=rrGK=-HC+pf7ph4EgPaEwWjo2+ShmQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH 2/2] irqbalance: disable numa by default
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
X-List-Received-Date: Thu, 27 Jun 2013 17:42:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 1:25 PM, Joe Slater <jslater@windriver.com> wrote:
> Create a PACKAGECONFIG[] for numa.  This will disable it
> by default.  The current behavior is auto-detect and will
> vary depending on when numactl is built.

merged.

Bruce

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc |    8 ++++++++
>  1 files changed, 8 insertions(+), 0 deletions(-)
>
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> index c076913..789cc9b 100644
> --- a/recipes-extended/irqbalance/irqbalance.inc
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -24,6 +24,14 @@ inherit update-rc.d
>  EXTRA_OECONF = "--program-transform-name= \
>                "
>
> +# let the recipes or appends define options
> +#
> +PACKAGECONFIG ?= ""
> +
> +# enable,disable,depends,rdepends
> +#
> +PACKAGECONFIG[numa] = "--enable-numa,--disable-numa,numactl,"
> +
>  do_install () {
>          oe_runmake 'DESTDIR=${D}' install
>          install -d ${D}${sysconfdir}/init.d
> --
> 1.7.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

