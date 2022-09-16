Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD17ECAAA1
	for <webhook@archiver.kernel.org>; Fri, 16 Sep 2022 15:24:10 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web10.7454.1663341842210984912
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 08:24:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=iNAM0fKM;
 spf=pass (domain: gmail.com, ip: 209.85.160.177,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f177.google.com with SMTP id h21so16177666qta.3
        for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Sep 2022 08:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2KAG0Jyy05KNBSuvuGGRcuMR9VT7W+pUFBa/QYGy2dc=;
        b=iNAM0fKM8kjUV0vCFM2PLuW8RAxqnRYq3uEW5i1larKuwP2Tza2R/MIVuwfP2DGCsH
         tRUZRgzIv7NjFHYUh6hn5YFqahfbH0OanY5glk3c1xRpSEF4ZEKCiaMZ104366hlLFfm
         UnBA320ChGtXZa5faiu5wf1yivTmD866gt69kVEmX16XZwBQUJcNRt2l+3iwTqD/A8zV
         mOvbvddpSmX3iuWhK8MtdnnUXPzbVtqHrzIZECiHxJJC+3WdGL6tZ8FFj41fiE4kUqVy
         DwF8Y9w6lk9Jz66EJfuChqlhp7mo1NAeNT4Hqlb7WLxzB0USxF5SY7WLh5pLOjXG7+wk
         TwmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2KAG0Jyy05KNBSuvuGGRcuMR9VT7W+pUFBa/QYGy2dc=;
        b=DSF3DTsOCf584oxnOzvVFiqovH9dtlfgaNouAZx3bp1gkgvtVlSeVz7tlzu4udoqK3
         VukQSbSmfFmAalz9Z0wcb1K41c9eLwtuA6pODjeiiV7ponwz6MvaYFzoJfxqY3O+ilp9
         qdtFsDO0VTB9mU8K3IRqy64xP/AdXx3hepYQOml0PHQiv8G1bWhppYkyPLg9IiCbmBjl
         dE8jTrdWbIU1Jed3OugLdP2pFgiiWZmUNWKQWAr4lTV0yomUQNX93kfVDJ+kn/esoA73
         sjWDGxBX21PifDCiIeGHnlkIDRTxQTVlcbofK5ZFwcUmzX84uzK0xkj6GBoTkr5S7ndz
         1eVg==
X-Gm-Message-State: ACrzQf3vtoLS3BNCWqdHO/Ky9mQns/XTZta7Eqxkz+wXjfD0Al651YX9
	KgJLdJm2wEHY0isO1mtBvrE=
X-Google-Smtp-Source: 
 AMsMyM7KgX9tCp5iD5OSTnJziP68fntBBXBg7pinPnPnkV3hDVjLXtnJuQnlIlv9CNsqRIs8MSpZIg==
X-Received: by 2002:a05:622a:1486:b0:35c:c98b:eea2 with SMTP id
 t6-20020a05622a148600b0035cc98beea2mr4886892qtx.555.1663341841160;
        Fri, 16 Sep 2022 08:24:01 -0700 (PDT)
Received: from gmail.com
 (cpe7c9a54441c1f-cm7c9a54441c1d.cpe.net.cable.rogers.com. [173.34.238.88])
        by smtp.gmail.com with ESMTPSA id
 r18-20020a05620a299200b006ce7cd81359sm7052268qkp.110.2022.09.16.08.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 08:24:00 -0700 (PDT)
Date: Fri, 16 Sep 2022 11:23:59 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Andrei Gherzan <andrei@gherzan.com>
Cc: meta-virtualization@lists.yoctoproject.org,
	Andrei Gherzan <andrei.gherzan@huawei.com>
Subject: Re: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate
 version 0.1.7
Message-ID: <20220916152356.GA33896@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220905113003.1730364-2-andrei@gherzan.com>
 <20220905113003.1730364-1-andrei@gherzan.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Sep 2022 15:24:10 -0000
X-Groupsio-URL: 
 https://lists.yoctoproject.org/g/meta-virtualization/message/7615

These two changes are merged to master.

With respect to kirkstone, the issue is that by default the ptests
are built .. as such we are bringing in new dependencies to the
default build. That carries a bit of risk.

If there was a way to make the ptest build and dependencies optional,
and disabled by default, I'd be willing to merge that to kirkstone.

Bruce

In message: [meta-virtualization][master][PATCH 1/2] catatonit: Integrate version 0.1.7
on 05/09/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> This is useful for podman system tests.
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-containers/catatonit/catatonit_0.1.7.bb | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>  create mode 100644 recipes-containers/catatonit/catatonit_0.1.7.bb
> 
> diff --git a/recipes-containers/catatonit/catatonit_0.1.7.bb b/recipes-containers/catatonit/catatonit_0.1.7.bb
> new file mode 100644
> index 0000000..da3973d
> --- /dev/null
> +++ b/recipes-containers/catatonit/catatonit_0.1.7.bb
> @@ -0,0 +1,16 @@
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: MIT
> +
> +SUMMARY = "A container init that is so simple it's effectively brain-dead."
> +HOMEPAGE = "https://github.com/openSUSE/catatonit"
> +DESCRIPTION = "${SUMMARY}"
> +SECTION = "base"
> +LICENSE = "GPL-3.0-or-later"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
> +
> +SRC_URI = "git://github.com/openSUSE/${BPN};protocol=https;branch=main"
> +SRCREV = "d8d72fea155c144ed3bf298a35a1aba5625a5656"
> +S = "${WORKDIR}/git"
> +
> +inherit autotools
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7594): https://lists.yoctoproject.org/g/meta-virtualization/message/7594
> Mute This Topic: https://lists.yoctoproject.org/mt/93476479/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][master][PATCH 2/2] podman: Add ptest support for system tests
on 05/09/2022 Andrei Gherzan wrote:

> From: Andrei Gherzan <andrei.gherzan@huawei.com>
> 
> Signed-off-by: Andrei Gherzan <andrei.gherzan@huawei.com>
> ---
>  recipes-containers/podman/podman/run-ptest | 13 +++++++++++
>  recipes-containers/podman/podman_git.bb    | 27 +++++++++++++++++++++-
>  2 files changed, 39 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/podman/podman/run-ptest
> 
> diff --git a/recipes-containers/podman/podman/run-ptest b/recipes-containers/podman/podman/run-ptest
> new file mode 100644
> index 0000000..108ff45
> --- /dev/null
> +++ b/recipes-containers/podman/podman/run-ptest
> @@ -0,0 +1,13 @@
> +#!/bin/sh
> +
> +# SPDX-FileCopyrightText: Huawei Inc.
> +#
> +# SPDX-License-Identifier: MIT
> +
> +#
> +# Podman system tests
> +#
> +
> +# The system tests don't need any go related variables. Dummy-define them to
> +# avoid useless warnings/errors.
> +GOOS=undefined GO=true BUILDTAGS= make localsystem
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index e999192..e0d7164 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -23,6 +23,7 @@ SRC_URI = " \
>      file://0001-Rename-BUILDFLAGS-to-GOBUILDFLAGS.patch;patchdir=src/import \
>      file://0002-Define-ActKillThread-equal-to-ActKill.patch;patchdir=src/import/vendor/github.com/seccomp/libseccomp-golang \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
> +    file://run-ptest \
>  "
>  
>  LICENSE = "Apache-2.0"
> @@ -48,7 +49,7 @@ export LDFLAGS=""
>  TOOLCHAIN = "gcc"
>  
>  inherit go goarch
> -inherit systemd pkgconfig
> +inherit systemd pkgconfig ptest
>  
>  do_configure[noexec] = "1"
>  
> @@ -109,6 +110,17 @@ do_install() {
>  	fi
>  }
>  
> +do_install_ptest () {
> +	cp ${S}/src/import/Makefile ${D}${PTEST_PATH}
> +	install -d ${D}${PTEST_PATH}/test
> +	cp -r ${S}/src/import/test/system ${D}${PTEST_PATH}/test
> +
> +	# Some compatibility links for the Makefile assumptions.
> +	install -d ${D}${PTEST_PATH}/bin
> +	ln -s ${bindir}/podman ${D}${PTEST_PATH}/bin/podman
> +	ln -s ${bindir}/podman-remote ${D}${PTEST_PATH}/bin/podman-remote
> +}
> +
>  FILES:${PN} += " \
>      ${systemd_unitdir}/system/* \
>      ${systemd_unitdir}/user/* \
> @@ -128,3 +140,16 @@ RDEPENDS:${PN} += "\
>  "
>  RRECOMMENDS:${PN} += "slirp4netns kernel-module-xt-masquerade kernel-module-xt-comment"
>  RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
> +
> +RDEPENDS:${PN}-ptest += " \
> +	bash \
> +	bats \
> +	buildah \
> +	catatonit \
> +	coreutils \
> +	file \
> +	gnupg \
> +	jq \
> +	make \
> +	tar \
> +"
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#7595): https://lists.yoctoproject.org/g/meta-virtualization/message/7595
> Mute This Topic: https://lists.yoctoproject.org/mt/93476480/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



