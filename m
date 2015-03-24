Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4F4AE0091D; Tue, 24 Mar 2015 11:24:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C1FCE008D4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 11:24:55 -0700 (PDT)
Received: by lbcgn8 with SMTP id gn8so913924lbc.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 24 Mar 2015 11:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f5jqPJK4tCoXq0LSQnMuP0KQEjymQzeWyLDBYMkvgA4=;
	b=x5UXy9OsKQ3lWczyi0iPk9igO1GI1zUAAbpT4KD10OeQ04dieHW1dEbAihiDidlYT7
	oocSOsBWYkw890x5BzB9FCnrLQBFGWbeKGxJj3ZfcuxavLtRfp9O0cJGeEz96UbbrRqj
	OZSGebilE4s8zGludiDIJYiFcX134TgW0wxrOakzHC55hjNpRy6Mz6rhUa+rmfuhGhf0
	6HSlhRDYvjwSx/dnkA1gcXdeIqWBct6lSBr8UG74fOu1p9C2Qpkg+sJYBlCSl2qVT444
	UGXpomtwfBKgnZb/BFD+9MhcTUaPanzhVxmXXf/e2zjBL/jURjNTEyQ818hVQUg0Fw0u
	/g5A==
MIME-Version: 1.0
X-Received: by 10.112.160.227 with SMTP id xn3mr2972731lbb.112.1427221493706; 
	Tue, 24 Mar 2015 11:24:53 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 24 Mar 2015 11:24:53 -0700 (PDT)
In-Reply-To: <20150323173319.GA17882@windriver.com>
References: <20150323173319.GA17882@windriver.com>
Date: Tue, 24 Mar 2015 14:24:53 -0400
Message-ID: <CADkTA4Pw-t=V1GPARrk0ZPqFCcW1TjP7RcqeNSASpVY_nUzzyA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory
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
X-List-Received-Date: Tue, 24 Mar 2015 18:24:58 -0000
Content-Type: text/plain; charset=UTF-8

merged.

Bruce

On Mon, Mar 23, 2015 at 1:33 PM, Amy Fong <amy.fong@windriver.com> wrote:
> From b80338aa436fa115cc0c8d9b7fc5345d4171c56a Mon Sep 17 00:00:00 2001
> From: Amy Fong <amy.fong@windriver.com>
> Date: Mon, 23 Mar 2015 13:29:39 -0400
> Subject: [PATCH] libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file
>  or directory'
>
> In some circumstances where the build tree differs from the source,
> libvirt's compile will try to create the symlink for cpu_map.xml before
> creating the directory $(abs_builddir)/cpu.
>
> Add a test to create this directory if it hasn't already been created.
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  ...virt-Fix-cannot-symlink-cpu_map.xml-error.patch | 34 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.2.12.bb         |  1 +
>  2 files changed, 35 insertions(+)
>  create mode 100644 recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
> new file mode 100644
> index 0000000..090bc6e
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch
> @@ -0,0 +1,34 @@
> +libvirt: do_compile fails 'src/cpu/cpu_map.xml': No such file or directory'
> +
> +In some very rare circumstances, libvirt's compile will try to create the
> +symlink for cpu_map.xml before creating the directory $(abs_builddir)/cpu.
> +
> +Add a test to create this directory if it hasn't already been created.
> +
> +Signed-off-by: Amy Fong <amy.fong@windriver.com>
> +
> +---
> + src/Makefile.am |    1 +
> + src/Makefile.in |    1 +
> + 2 files changed, 2 insertions(+)
> +
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -1053,6 +1053,7 @@
> + libvirt_cpu_la_DEPENDENCIES = $(abs_builddir)/cpu/cpu_map.xml
> +
> + $(abs_builddir)/cpu/cpu_map.xml:
> ++      if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
> +       $(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
> +
> + if WITH_VMX
> +--- a/src/Makefile.in
> ++++ b/src/Makefile.in
> +@@ -10338,6 +10338,7 @@
> +         $(srcdir)/lxc/lxc_controller_dispatch.h
> +
> + $(abs_builddir)/cpu/cpu_map.xml:
> ++      if [ ! -d $(abs_builddir)/cpu ]; then $(MKDIR_P) $(abs_builddir)/cpu/; fi
> +       $(AM_V_GEN)ln -s $(abs_srcdir)/cpu/cpu_map.xml $@
> +
> + %protocol.c: %protocol.x %protocol.h $(srcdir)/rpc/genprotocol.pl
> diff --git a/recipes-extended/libvirt/libvirt_1.2.12.bb b/recipes-extended/libvirt/libvirt_1.2.12.bb
> index ef46e22..dca2d1b 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.12.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.12.bb
> @@ -30,6 +30,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz;name=libvirt \
>             file://runptest.patch \
>             file://run-ptest \
>             file://tests-allow-separated-src-and-build-dirs.patch \
> +           file://libvirt-Fix-cannot-symlink-cpu_map.xml-error.patch \
>            "
>
>  SRC_URI[libvirt.md5sum] = "2ae99535265ce4687d8718d744024c27"
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

