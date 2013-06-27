Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9B5C1E013CB
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 10:42:05 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id ea20so1156033lab.36
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Jun 2013 10:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=qyT7ydQtEDQjk+zyjS9q9xA2ZukuJymReSOg9Hh71xs=;
	b=rRStQvpxl5LNTiQZ1oP+1N9cDBcnK09Jr8IR10itofdLescun2CprEFdtXfzgRfHIe
	IgkisnLV1u36CW/3Wy9KPnmNIcDVXdqFNLc5tzWVEfcdRA7YZeUQ0xyNmVLch0IRUge7
	RupoO5ii3FdATklyDSvO+rQ+UisYlNFSu0NjEfMzJ6VAmxSWRxU6WJStXCC40e7w1M4N
	xO1g6KU1h5T0d+BJPOTHaP75GavXYrt1Saf0BcAwYMlEKFdHnVfowQRUe55hk656RgNo
	xxnAgyE+94DAKJG3c7Qljt6tyrLEbCC12wnEhW/1jmUUreFC24LuN012J5tirKk5LixT
	e03Q==
MIME-Version: 1.0
X-Received: by 10.152.8.72 with SMTP id p8mr4768587laa.70.1372354923885; Thu,
	27 Jun 2013 10:42:03 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Thu, 27 Jun 2013 10:42:03 -0700 (PDT)
In-Reply-To: <1371749105-24841-1-git-send-email-jslater@windriver.com>
References: <1371749105-24841-1-git-send-email-jslater@windriver.com>
Date: Thu, 27 Jun 2013 13:42:03 -0400
Message-ID: <CADkTA4M3wixakKyu5FQOEGjxWTEK9n7y-tOHjLzheTK1AaeQjA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH 1/2] Uprev irqbalance to 1.0.5
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
X-List-Received-Date: Thu, 27 Jun 2013 17:42:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Jun 20, 2013 at 1:25 PM, Joe Slater <jslater@windriver.com> wrote:
> From: Amy Fong <amy.fong@windriver.com>
>
> CQID: WIND00393798

Dropped.

>
> Uprev irqbalance to the latest version.
>
>   * consolidate logging
>   * Implement user policy script callout
>     (http://code.google.com/p/irqbalance/issues/detail?id=35)
>   * Replace fscanf(%as) by getline
>   * manpage: Improve the readability of the --banirq text
>   * glib-local: ad call for g_list_remove
>
> Also splitting files into inc and bb files.

And merged.

Bruce

>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-extended/irqbalance/irqbalance.inc      |   32 +++++++++++++++++++
>  recipes-extended/irqbalance/irqbalance_1.0.4.bb |   37 ++++------------------
>  recipes-extended/irqbalance/irqbalance_1.0.5.bb |   14 ++++++++
>  3 files changed, 53 insertions(+), 30 deletions(-)
>  create mode 100644 recipes-extended/irqbalance/irqbalance.inc
>  create mode 100644 recipes-extended/irqbalance/irqbalance_1.0.5.bb
>
> diff --git a/recipes-extended/irqbalance/irqbalance.inc b/recipes-extended/irqbalance/irqbalance.inc
> new file mode 100644
> index 0000000..c076913
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance.inc
> @@ -0,0 +1,32 @@
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#
> +SUMMARY = "IRQ allocation daemon"
> +DESCRIPTION = "A daemon to balance interrupts across multiple CPUs, \
> +which can lead to better performance and IO balance on SMP systems."
> +
> +HOMEPAGE = "http://code.google.com/p/irqbalance/"
> +BUGTRACKER = "http://code.google.com/p/irqbalance/issues/list"
> +
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> +                   file://irqbalance.c;beginline=6;endline=8;md5=b94e153694672307b503b1bc87dc9e24 \
> +                  "
> +
> +DEPENDS = "glib-2.0"
> +
> +INITSCRIPT_NAME = "irqbalanced"
> +INITSCRIPT_PARAMS = "defaults"
> +
> +inherit autotools
> +inherit update-rc.d
> +
> +EXTRA_OECONF = "--program-transform-name= \
> +              "
> +
> +do_install () {
> +        oe_runmake 'DESTDIR=${D}' install
> +        install -d ${D}${sysconfdir}/init.d
> +        cat ${S}/irqbalance.init | sed -e's,/usr/sbin,${sbindir},g' > ${D}${sysconfdir}/init.d/irqbalanced
> +        chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
> +}
> diff --git a/recipes-extended/irqbalance/irqbalance_1.0.4.bb b/recipes-extended/irqbalance/irqbalance_1.0.4.bb
> index aa9941c..33703f8 100644
> --- a/recipes-extended/irqbalance/irqbalance_1.0.4.bb
> +++ b/recipes-extended/irqbalance/irqbalance_1.0.4.bb
> @@ -1,39 +1,16 @@
>  #
>  # Copyright (C) 2013 Wind River Systems, Inc.
>  #
> -SUMMARY = "IRQ allocation daemon"
> -DESCRIPTION = "A daemon to balance interrupts across multiple CPUs, \
> -which can lead to better performance and IO balance on SMP systems."
>
> -HOMEPAGE = "http://code.google.com/p/irqbalance/"
> -BUGTRACKER = "http://code.google.com/p/irqbalance/issues/list"
> +require irqbalance.inc
>
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
> -                   file://irqbalance.c;beginline=6;endline=8;md5=b94e153694672307b503b1bc87dc9e24 \
> -                  "
> -
> -DEPENDS = "glib-2.0"
> -SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.bz2 \
> -          file://add-initscript.patch \
> -         "
> +PR = "r1"
>
>  SRC_URI[md5sum] = "f7ca283c46331db73f27e686a643dcfb"
> -SRC_URI[sha256sum] = "15725edf4a6f20258620cbd05ebf02d0c25aadd5ffa4871ef8507c9215021c43"
> -
> -INITSCRIPT_NAME = "irqbalanced"
> -INITSCRIPT_PARAMS = "defaults"
> +SRC_URI[sha256su] = "15725edf4a6f20258620cbd05ebf02d0c25aadd5ffa4871ef8507c9215021c43"
>
> -inherit autotools
> -inherit update-rc.d
> +EXTRA_OECONF += "--with-sysroot=${STAGING_DIR_TARGET}"
>
> -EXTRA_OECONF = "--program-transform-name= \
> -               --with-sysroot=${STAGING_DIR_TARGET} \
> -              "
> -
> -do_install () {
> -        oe_runmake 'DESTDIR=${D}' install
> -        install -d ${D}${sysconfdir}/init.d
> -        cat ${S}/irqbalance.init | sed -e's,/usr/sbin,${sbindir},g' > ${D}${sysconfdir}/init.d/irqbalanced
> -        chmod 755 ${D}${sysconfdir}/init.d/irqbalanced
> -}
> +SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.bz2 \
> +           file://add-initscript.patch \
> +          "
> diff --git a/recipes-extended/irqbalance/irqbalance_1.0.5.bb b/recipes-extended/irqbalance/irqbalance_1.0.5.bb
> new file mode 100644
> index 0000000..49c3acd
> --- /dev/null
> +++ b/recipes-extended/irqbalance/irqbalance_1.0.5.bb
> @@ -0,0 +1,14 @@
> +#
> +# Copyright (C) 2013 Wind River Systems, Inc.
> +#
> +
> +require irqbalance.inc
> +
> +PR = "r0"
> +
> +SRC_URI[md5sum] = "b6403fa067c96adce448a48c9993654d"
> +SRC_URI[sha256sum] = "1123e75224b9c0b63ac85892e920bc4a9c76211278ea3d5d4bcbbde44815685c"
> +
> +SRC_URI = "http://irqbalance.googlecode.com/files/irqbalance-${PV}.tar.gz \
> +           file://add-initscript.patch \
> +          "
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

