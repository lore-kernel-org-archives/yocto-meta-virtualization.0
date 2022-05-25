Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E950C433EF
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 15:45:57 +0000 (UTC)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by mx.groups.io with SMTP id smtpd.web10.8465.1653493554335359415
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:45:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=VCm1Vnmz;
 spf=pass (domain: gmail.com, ip: 209.85.160.170,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f170.google.com with SMTP id s31so1841022qtc.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 May 2022 08:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=HzVxs0QsjAFzRhX9efAqNBsO172Gd4FMwJIFIFmWKOo=;
        b=VCm1VnmzUAutdQ7muZvJ1nQemcTPz+mpggIcnq+5JG89dDIOxKQ5bgH0wPl3rqyDL7
         tXKq7n7zhnLRA5SsWsJ/Z6hOftkQ5STPS7cnNSRhIR5oDiLRrQoxR/q6NM42UNfeo3tk
         UvSH65FjFZl9GxOiq4P8YZy5+9I1GLTDoJ37wR11aKpxpKjmVEAo5dZKtYxwM5MIs4GE
         ny0gyYGmvCXrx4cZBkoHJpeGF40NkqxT7WjXuDP7H5cFlZq/P88mNSYiR15m3YDQyGy8
         eleQAa3Jckyi0r+SthbxnwYCqgHnkyxte0xjFpUwGoRAJZcbJUt9OTEhjztnydUIBfES
         Fvvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=HzVxs0QsjAFzRhX9efAqNBsO172Gd4FMwJIFIFmWKOo=;
        b=lYgH/JvOaRbOHTDmoGLlm6vq++qzfx5MWMEkV+C1hCTpfpMaEfk1WfWvvgflXR6vRU
         A2D5Jg6R6bigEtYrR29eIAYfyYGHXTdpolNUKxzoP66aAUcjrV7WCNiFwamd4URZBtwJ
         k6g+yZBq9sGnVn2v4pgTs/0daNJdBnCAypGiBxR0q29KndjIWTKBntM/FHlt5PQkZd4R
         tQ4foTz1m21CRYLOdSeUK076kBxn9qtRNTXGEXj09FdKDvRjlauMzo7lYWNdh0mfwVhP
         gsD4XxoOj1HvDRewjneKPNcbmWlNSnGgOA3bAZ5jIXxukrymigU/23/jP/QKjoz8ZKBY
         tUeQ==
X-Gm-Message-State: AOAM532Kw17QHbJd8DrROxhqURXg1wFW2d7pMwkopdnTAsn5LlyIcxaf
	8D1hGgzWIAnYtxQ6AF0cw5I=
X-Google-Smtp-Source: 
 ABdhPJzS4ELNwdJIkFbSdmc9Z3JNBfPCxJydt1eehVxFCNeHfLa9IdZRlLsdKiG+xDAPfuvpfsqYIA==
X-Received: by 2002:a05:622a:4c9:b0:2f3:c6a9:39d with SMTP id
 q9-20020a05622a04c900b002f3c6a9039dmr25209605qtx.363.1653493553159;
        Wed, 25 May 2022 08:45:53 -0700 (PDT)
Received: from gmail.com ([173.34.88.218])
        by smtp.gmail.com with ESMTPSA id
 h3-20020ac85043000000b002f918680d80sm1419377qtm.78.2022.05.25.08.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 May 2022 08:45:52 -0700 (PDT)
Date: Wed, 25 May 2022 11:45:51 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: leimaohui <leimaohui@fujitsu.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [PATCH] open-iscsi-user: Upgraded from
 2.1.4 to 2.1.7.
Message-ID: <20220525154550.GB42310@gmail.com>
References: <1653359314-24039-1-git-send-email-leimaohui@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1653359314-24039-1-git-send-email-leimaohui@fujitsu.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 25 May 2022 15:45:57 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7321

merged.

Bruce

In message: [meta-virtualization] [PATCH] open-iscsi-user: Upgraded from 2.1.4 to 2.1.7.
on 24/05/2022 leimaohui wrote:

> Changelog:
>       Fix issues discovered by gcc12
>       Fix more issues discovered by gcc12
>       Build: add libsystemd CFLAGS for building objects
>       Build: remove redundant definition in utils Makefile
>       Build: add RULESDIR to top-level Makefile
>       Create an systemd iBFT rule generator
>       Build: install systemd generator file with svc files
>       Use kernel initiatorname when setting local iname
>       utils: remove errant spaces in script
>       Check for root in iscsi-gen-initiatorname
>       Make fwparam_ibft build more reliable.
>       Fix ibft-rule-generator shell error
>       ......
> 
> Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> ---
>  .../files/0001-Fix-usr-bin-sed-to-sed.patch        | 53 +++++++++++++++++++
>  ...1-Makefile-Fix-build-error-of-cross-build.patch | 25 +++++++++
>  ...th-of-systemd-service-from-usr-lib-to-lib.patch | 25 +++++++++
>  .../open-iscsi/open-iscsi-user_2.1.4.bb            | 60 ----------------------
>  .../open-iscsi/open-iscsi-user_2.1.7.bb            | 45 ++++++++++++++++
>  5 files changed, 148 insertions(+), 60 deletions(-)
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
>  delete mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
>  create mode 100644 meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> 
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
> new file mode 100644
> index 0000000..ef11366
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Fix-usr-bin-sed-to-sed.patch
> @@ -0,0 +1,53 @@
> +From 569886070a273e914f2662d10b03e1767d488aee Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Wed, 18 May 2022 11:32:29 +0900
> +Subject: [PATCH] Fix /usr/bin/sed to sed.
> +
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + doc/Makefile   | 2 +-
> + etc/Makefile   | 2 +-
> + utils/Makefile | 2 +-
> + 3 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/doc/Makefile b/doc/Makefile
> +index 9ed025d..e121270 100644
> +--- a/doc/Makefile
> ++++ b/doc/Makefile
> +@@ -7,7 +7,7 @@ ifeq ($(TOPDIR),)
> +	TOPDIR = ..
> + endif
> +
> +-SED = /usr/bin/sed
> ++SED = sed
> + INSTALL = install
> +
> + DESTDIR ?=
> +diff --git a/etc/Makefile b/etc/Makefile
> +index d065319..2d98027 100644
> +--- a/etc/Makefile
> ++++ b/etc/Makefile
> +@@ -19,7 +19,7 @@ initddir ?= $(etcdir)/init.d
> +
> + HOMEDIR ?= $(etcdir)/iscsi
> +
> +-SED = /usr/bin/sed
> ++SED = sed
> + INSTALL = install
> +
> + SYSTEMD_SOURCE_FILES	= iscsid.socket iscsiuio.socket
> +diff --git a/utils/Makefile b/utils/Makefile
> +index a7eb352..15539eb 100644
> +--- a/utils/Makefile
> ++++ b/utils/Makefile
> +@@ -7,7 +7,7 @@
> + # from the top-level make file.
> + #
> +
> +-SED = /usr/bin/sed
> ++SED = sed
> + INSTALL = install
> + CHMOD = chmod
> +
> +--
> +2.25.1
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
> new file mode 100644
> index 0000000..bdb9e45
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Makefile-Fix-build-error-of-cross-build.patch
> @@ -0,0 +1,25 @@
> +From 69fa594af5a09e356319cc0ec2e71809ac964d9b Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Wed, 18 May 2022 10:28:53 +0900
> +Subject: [PATCH] Makefile: Fix build error of cross build.
> +
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index d2f143b..127ba90 100644
> +--- a/Makefile
> ++++ b/Makefile
> +@@ -69,7 +69,7 @@ user: iscsiuio/Makefile
> +	@echo "Read README file for detailed information."
> +
> + iscsiuio/Makefile: iscsiuio/configure iscsiuio/Makefile.in
> +-	cd iscsiuio; ./configure $(WITHOUT_ARG) --sbindir=$(SBINDIR)
> ++	cd iscsiuio; ./configure $(WITHOUT_ARG) --sbindir=$(SBINDIR) $(CONFIGURE_ARGS)
> +
> + iscsiuio/configure: iscsiuio/configure.ac iscsiuio/Makefile.am
> +	cd iscsiuio; autoreconf --install
> +--
> +2.25.1
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
> new file mode 100644
> index 0000000..8cea597
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/files/0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch
> @@ -0,0 +1,25 @@
> +From 280fbda492256d2ef70c6d377e8bd8935e7a4f9c Mon Sep 17 00:00:00 2001
> +From: Lei Maohui <leimaohui@fujitsu.com>
> +Date: Fri, 20 May 2022 17:59:03 +0900
> +Subject: [PATCH] Modified path of systemd service from /usr/lib to /lib.
> +
> +Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
> +---
> + etc/Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/etc/Makefile b/etc/Makefile
> +index 2d98027..d24fd03 100644
> +--- a/etc/Makefile
> ++++ b/etc/Makefile
> +@@ -7,7 +7,7 @@ ifeq ($(TOPDIR),)
> +	TOPDIR = ..
> + endif
> +
> +-prefix = /usr
> ++prefix =
> + DESTDIR ?=
> + SBINDIR ?= /sbin
> +
> +--
> +2.25.1
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> deleted file mode 100644
> index 928290f..0000000
> --- a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.4.bb
> +++ /dev/null
> @@ -1,60 +0,0 @@
> -DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
> -HOMEPAGE = "http://www.open-iscsi.org/"
> -LICENSE = "GPL-2.0-only"
> -PR = "r1"
> -
> -inherit systemd autotools pkgconfig
> -
> -LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> -DEPENDS = "kmod openssl util-linux open-isns"
> -DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> -
> -SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
> -           file://0001-fix-build-error-of-cross-build.patch \
> -           "
> -
> -SRCREV = "095f59ca464220eae285de6b5f2ee31185a6a84c"
> -
> -S = "${WORKDIR}/git"
> -B = "${S}"
> -
> -TARGET_CC_ARCH += "${LDFLAGS}"
> -EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}'"
> -
> -do_configure () {
> -    :
> -}
> -
> -do_compile () {
> -        oe_runmake user
> -}
> -
> -do_install () {
> -        oe_runmake DESTDIR="${D}" install_user
> -        install ${S}/etc/initd/initd.debian ${D}/etc/init.d/open-iscsi
> -        install -m 0644 ${S}/etc/iscsid.conf ${D}/etc/iscsi/
> -
> -        install -d ${D}${libdir}
> -        install -Dm 0644 ${S}/libopeniscsiusr/libopeniscsiusr.so.0.2.0 ${D}${libdir}/
> -        ln -sf ${libdir}/libopeniscsiusr.so.0.2.0 ${D}${libdir}/libopeniscsiusr.so
> -}
> -
> -# systemd support
> -PACKAGES =+ "${PN}-systemd"
> -RDEPENDS:${PN} += "bash"
> -RDEPENDS:${PN}-systemd += "${PN}"
> -FILES:${PN}-systemd +=  "${base_libdir}/systemd                  \
> -                         ${sysconfdir}/default/iscsi-initiator   \
> -                        "
> -SYSTEMD_PACKAGES = "${PN}-systemd"
> -SYSTEMD_SERVICE:${PN}-systemd = "iscsi.service \
> -                                 iscsiuio.service \
> -                                 iscsid.service \
> -                                 iscsi-init.service \
> -                                 iscsid.socket \
> -                                 iscsiuio.socket "
> -
> -do_install:append () {
> -        install -d ${D}${systemd_unitdir}/system
> -        install -m 0644 ${S}/etc/systemd/* ${D}${systemd_unitdir}/system/
> -}
> diff --git a/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> new file mode 100644
> index 0000000..b4b9ebc
> --- /dev/null
> +++ b/meta-openstack/recipes-connectivity/open-iscsi/open-iscsi-user_2.1.7.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "Open-iSCSI project is a high performance, transport independent, multi-platform implementation of RFC3720."
> +HOMEPAGE = "http://www.open-iscsi.org/"
> +LICENSE = "GPL-2.0-only"
> +PR = "r1"
> +
> +inherit autotools systemd pkgconfig
> +
> +LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
> +DEPENDS = "kmod openssl util-linux open-isns"
> +DEPENDS:append = " ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
> +
> +SRC_URI = "git://github.com/open-iscsi/open-iscsi.git;protocol=https;branch=master \
> +           file://0001-Makefile-Fix-build-error-of-cross-build.patch \
> +           file://0001-Fix-usr-bin-sed-to-sed.patch \
> +           file://0001-Modified-path-of-systemd-service-from-usr-lib-to-lib.patch \
> +           "
> +
> +SRCREV = "7b53fcc502da8617110fd64d675b476772c28a6f"
> +
> +S = "${WORKDIR}/git"
> +B = "${S}"
> +
> +PARALLEL_MAKEINST = ""
> +TARGET_CC_ARCH += "${LDFLAGS}"
> +EXTRA_OEMAKE += "CONFIGURE_ARGS='--host=${HOST_SYS}' MFLAGS='' LIB_DIR=${libdir}"
> +RDEPENDS:${PN} += "bash"
> +
> +SYSTEMD_PACKAGES = "${PN}"
> +SYSTEMD_SERVICE:${PN} = "iscsi.service \
> +                         iscsid.socket \
> +                         iscsiuio.socket \
> +                         iscsid.service \
> +                         iscsi-init.service \
> +                         iscsiuio.service \
> +"
> +SYSTEMD_AUTO_ENABLE = "disable"
> +FILES:${PN} += " \
> +    ${systemd_system_unitdir}/iscsi.service \
> +    ${systemd_system_unitdir}/iscsid.socket \
> +    ${systemd_system_unitdir}/iscsiuio.socket \
> +    ${systemd_system_unitdir}/iscsid.service \
> +    ${systemd_system_unitdir}/iscsi-init.service \
> +    ${systemd_system_unitdir}/iscsiuio.service \
> +    ${systemd_unitdir}/system-generators/ibft-rule-generator \
> +"
> -- 
> 1.8.3.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7317): https://lists.yoctoproject.org/g/meta-virtualization/message/7317
> Mute This Topic: https://lists.yoctoproject.org/mt/91303968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


