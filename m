Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7F7AFE00DFB; Thu,  8 Mar 2018 13:09:19 -0800 (PST)
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
	*      [209.85.215.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0EF9DE00DC2
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 Mar 2018 13:09:17 -0800 (PST)
Received: by mail-lf0-f65.google.com with SMTP id a196-v6so4013425lfa.13
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 Mar 2018 13:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aTZKPIRVaFD1bCsgB9NOKGNV4+5jyjobbvxQA/9Co1w=;
	b=ELxiissY9dfr7r/pIt0D/FjviDCRgg4T8t22jXzYIaSC103l9bOvEeJC5HtuqBT/MB
	68xMhkngTaaXL3LzbUBP93odtLH2LQF93EHViAGw7eFckjGIn7AYL1F0JOts87V/bM97
	/OwjaAeW8JomGBZk3TnO9xwFEuIDeDE1hpKf5ZSHAVTKhYNzA0F/M8+zs/pMNTjybsNy
	9jCm/ipbur6p8pmpr4vaWboLkk2m5Om2u+9VIxa/m9QdhvK2hhJB2+OdUR/F2oni/iKB
	cYxMlh3wJ41z3xLYAvWlSz81Nf4eK1dq5/wDqkNxEu6zU9CgA9342/rcObQlyaxagYrY
	6jbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aTZKPIRVaFD1bCsgB9NOKGNV4+5jyjobbvxQA/9Co1w=;
	b=e0E9vwSa8oqEugpOe491DKCMzktQYD9eQlJo6paINcEdhHGHWi4KtuPi1OGXNgagIO
	JB2gXH4kXkBs7aPWbv9jyEK1HVnPU9GGBm5F+AyuUjEOOKoPPjY3Nnb4tMxQk2l3qBaz
	LENRW+f7PWETlN9TpO0nlcLYCUqyiNmXa/ORjC78e889SWlIaXpjLnL/DfUy7twK12+G
	gnE1lz5IS2vOnMlJfSXjF39MfbAZhxRFXsFKFhatspSer/UHHqZLO3HqmiOk4e0eiquU
	32H756oHJomQvAx0O5LjBO7vi7ndbKBDA7hpEvcV6t2Rfs78spgvA0R9Jld+Cuhkmzgd
	bWig==
X-Gm-Message-State: AElRT7EloB5vqUGkbOS9LkgyO0rqwKWw9bbjCQuk2eMZdPD02xJsC64w
	m6E7SI2e5GgAL7VEdutWHUlIfTEAe3wyt66va5Aj4g==
X-Google-Smtp-Source: AG47ELsVj1IQPi/xoNSekKegU+b6y+sI6qx2ArSk1Cs4mXPNcFegwdcoccOHAUltR+GgLPbMZ3u26YEk4gPIadcsyhs=
X-Received: by 10.25.215.197 with SMTP id q66mr18289268lfi.89.1520543356554;
	Thu, 08 Mar 2018 13:09:16 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Thu, 8 Mar 2018 13:09:15 -0800 (PST)
In-Reply-To: <ff49a2ee32a8f0593c308fa95f0ea39c8946ab2c.1519915283.git.kurt.bodiker@braintrust-us.com>
References: <cover.1519915283.git.kurt.bodiker@braintrust-us.com>
	<ff49a2ee32a8f0593c308fa95f0ea39c8946ab2c.1519915283.git.kurt.bodiker@braintrust-us.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 8 Mar 2018 16:09:15 -0500
Message-ID: <CADkTA4Pcq7y1HpaCVv=ZFvZvytMOyLVArNaM1YRUyGw7soE7Sw@mail.gmail.com>
To: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 4/7] xen: PolarSSL recipe and patches for Xen stubdoms
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
X-List-Received-Date: Thu, 08 Mar 2018 21:09:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 5, 2018 at 10:35 AM, Kurt Bodiker
<kurt.bodiker@braintrust-us.com> wrote:
> From: kebodiker <kurt.bodiker@braintrust-us.com>
>
> PolarSSL (now mbedTLS) is a lightweight SSL library optimized for
> embedded systems.  In the case of Xen stubdomains, we are using MiniOS.
> This PolarSSL recipe creates a static library that is cross-compiled
> against MiniOS, Xen, LWIP, and Newlib headers and subsequently used
> during the cross-compilation and linking of the stubdom specific GMP,
> TPM Emulator, and the Xen vTPM and vTPM Manager stubdomains.
>
> The current Xen source code is hardcoded to fetch a specific version of
> this package.  The patch files originate from the Xen/stubdom source
> tree. This recipe provides the flexibility to change version or modify
> the patches.
>
> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> ---
>  recipes-extended/xen/files/polarssl.patch | 64 +++++++++++++++++++++++++++++++
>  recipes-extended/xen/polarssl.inc         | 25 ++++++++++++
>  recipes-extended/xen/polarssl_1.1.4.bb    | 17 ++++++++
>  3 files changed, 106 insertions(+)
>  create mode 100644 recipes-extended/xen/files/polarssl.patch
>  create mode 100644 recipes-extended/xen/polarssl.inc
>  create mode 100644 recipes-extended/xen/polarssl_1.1.4.bb
>
> diff --git a/recipes-extended/xen/files/polarssl.patch b/recipes-extended/xen/files/polarssl.patch
> new file mode 100644
> index 0000000..d387d4e
> --- /dev/null
> +++ b/recipes-extended/xen/files/polarssl.patch
> @@ -0,0 +1,64 @@
> +diff -Naur polarssl-1.1.4/include/polarssl/config.h polarssl-x86_64/include/polarssl/config.h
> +--- polarssl-1.1.4/include/polarssl/config.h   2011-12-22 05:06:27.000000000 -0500
> ++++ polarssl-x86_64/include/polarssl/config.h  2012-10-30 17:18:07.567001000 -0400
> +@@ -164,8 +164,8 @@
> +  * application.
> +  *
> +  * Uncomment this macro to prevent loading of default entropy functions.
> +-#define POLARSSL_NO_DEFAULT_ENTROPY_SOURCES
> +  */
> ++#define POLARSSL_NO_DEFAULT_ENTROPY_SOURCES
> +
> + /**
> +  * \def POLARSSL_NO_PLATFORM_ENTROPY
> +@@ -175,8 +175,8 @@
> +  * standards like the /dev/urandom or Windows CryptoAPI.
> +  *
> +  * Uncomment this macro to disable the built-in platform entropy functions.
> +-#define POLARSSL_NO_PLATFORM_ENTROPY
> +  */
> ++#define POLARSSL_NO_PLATFORM_ENTROPY
> +
> + /**
> +  * \def POLARSSL_PKCS1_V21
> +@@ -426,8 +426,8 @@
> +  * Requires: POLARSSL_TIMING_C
> +  *
> +  * This module enables the HAVEGE random number generator.
> +- */
> + #define POLARSSL_HAVEGE_C
> ++ */
> +
> + /**
> +  * \def POLARSSL_MD_C
> +@@ -490,7 +490,7 @@
> +  *
> +  * This module provides TCP/IP networking routines.
> +  */
> +-#define POLARSSL_NET_C
> ++//#define POLARSSL_NET_C
> +
> + /**
> +  * \def POLARSSL_PADLOCK_C
> +@@ -644,8 +644,8 @@
> +  * Caller:  library/havege.c
> +  *
> +  * This module is used by the HAVEGE random number generator.
> +- */
> + #define POLARSSL_TIMING_C
> ++ */
> +
> + /**
> +  * \def POLARSSL_VERSION_C
> +diff -Naur polarssl-1.1.4/library/bignum.c polarssl-x86_64/library/bignum.c
> +--- polarssl-1.1.4/library/bignum.c    2012-04-29 16:15:55.000000000 -0400
> ++++ polarssl-x86_64/library/bignum.c   2012-10-30 17:21:52.135000999 -0400
> +@@ -1101,7 +1101,7 @@
> +             Z.p[i - t - 1] = ~0;
> +         else
> +         {
> +-#if defined(POLARSSL_HAVE_LONGLONG)
> ++#if 0 //defined(POLARSSL_HAVE_LONGLONG)
> +             t_udbl r;
> +
> +             r  = (t_udbl) X.p[i] << biL;
> diff --git a/recipes-extended/xen/polarssl.inc b/recipes-extended/xen/polarssl.inc
> new file mode 100644
> index 0000000..f90cd2f
> --- /dev/null
> +++ b/recipes-extended/xen/polarssl.inc
> @@ -0,0 +1,25 @@
> +# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +require stubdom.inc
> +
> +DEPENDS += "\
> +    newlib \
> +"
> +STUBDOM_CFLAGS += "-Wno-memset-elt-size -Wno-implicit-fallthrough"
> +
> +# even though there's nothing to configure, we still need this to run the "make links" target in mini-os
> +do_configure(){
> +}
> +
> +do_compile() {
> +    ${MAKE} CC="${HOST_PREFIX}gcc --sysroot=${RECIPE_SYSROOT} ${STUBDOM_CPPFLAGS} ${STUBDOM_CFLAGS}"

Is there a reason why oe_runmake doesn't work here ?

> +}
> +
> +do_install() {
> +    install -d ${D}${includedir}
> +    cp -r -t ${D}${includedir} ${S}/include/polarssl
> +
> +    install -d ${D}/${libdir}
> +    install -m 644 -t ${D}/${libdir} ${S}/library/libpolarssl.a
> +}
> diff --git a/recipes-extended/xen/polarssl_1.1.4.bb b/recipes-extended/xen/polarssl_1.1.4.bb
> new file mode 100644
> index 0000000..2d4c2e0
> --- /dev/null
> +++ b/recipes-extended/xen/polarssl_1.1.4.bb
> @@ -0,0 +1,17 @@
> +# Copyright (C) 2017 Kurt Bodiker <kurt.bodiker@braintrust-us.com>
> +# Released under the MIT license (see COPYING.MIT for the terms)
> +
> +DESCRIPTION = "PolarSSL (now 'mbed TLS') is an open source, portable, easy to use, readable and flexible SSL library."
> +HOMEPAGE = "https://tls.mbed.org"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
> +
> +S="${WORKDIR}/${PN}"
> +B="${S}/library"
> +
> +SRC_URI += "\
> +    git://github.com/ARMmbed/mbedtls.git;protocol=https;rev=${PN}-${PV};destsuffix=${PN};nobranch=1;name=${PN} \
> +    file://polarssl.patch;striplevel=1 \

same striplevel comment.

Bruce

> +"
> +
> +require polarssl.inc
> --
> 2.14.2
>
>
> --
>
> *This email and all attachments are considered confidential and the
> proprietary information of BrainTrust Holdings.  Unauthorized disclosure is
> prohibited.  *
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

