Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B86DFCCD183
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 01:59:45 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.5901.1760407183183439117
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 18:59:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=aZqXCKHE;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-86278558cdeso658758185a.1
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 18:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760407182; x=1761011982; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y+gvIvkZr1LktP7Vq5Mj5ljhVJXmmz/yr92gKx9jKFE=;
        b=aZqXCKHEdNnXjDH7EPBYePDvVUWEslx+DRS1pJ5cFGWEYDTswKOdQlGl2gFOcKU8Ji
         zjqsjomLi+AsbHkhNibQzgo9Uh1NfrUExyaXQdPEJ8n7ik7/OzDqpWm+bAeMdVLnMQB4
         HEp9xnBN743OX2WPHoyislEmQRB587S87VaIsZbmAtgRIKgXaCPx670oZ9Oa7WkOVQxc
         EAQJpOUwhNdtMtVXG9WMP/UvRWs0Js5a57SMz8zBi9tacVeztUad8mgQO7JiB0aZruNG
         y96f1qTj+Qpx41YLZ/eC4ZfPyJU6/SAiQUHwyYgQeGD+lw5Hk+KxZet+wH0SlaXewICA
         Z+AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760407182; x=1761011982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y+gvIvkZr1LktP7Vq5Mj5ljhVJXmmz/yr92gKx9jKFE=;
        b=FeW97P8RA6ahEa4Hq4an6rGclYBmgmpN+dyKpmmH+kTuauBxaArNkxXDl7Rfmhdd34
         towy76eDjeIhzlBtQwZoZ13R69SxBpjLC5/FAsRGv+zuaVi+7TLdNrMV+fVpThO5eYws
         KAEyAjKeko2CF8Uud0VYAn23tmcseKvHM8hdu+7iA9UBybvqfJe0LyXWuqOuhiNnL/Xy
         EBOsg5uCMSfn6xKYSqANDh5kdBBBXoaeLmyc56NXEfue+Ajzfw0LaJpXqsLvOM2kOCIQ
         sLt/C2Hvl7Pz4kR8CJ7O174QejaDeypfFUAXken5jo47B+NDELZV8w4NppilxixK+Z2O
         +eiA==
X-Gm-Message-State: AOJu0Yzy2j1+geKMRw6Z2xy3xgtmGDiCrBai/nonqHMwk9c5hHWzjnea
	h5jhqCyZqR9Je0xCqfOf1XLdEzL+95I9M2/c6094ucGW0yKvogjq72SBn+0IxYujxCk=
X-Gm-Gg: ASbGncswV/APEoZlW43xUmucH1S5czvZDt+K+TTO3ZhD+tYcSqFQw+IPpsPot4Gdqh/
	D2RHFQiKWvFPwnaGMIe59At4NVcBiUP8Nf6J0kMLgsxqTIhOrPtBCcXpM39wLn+/KT5xBpFA0gW
	4DpmtpMmx57H6SOZgwfPgVv9logvvEZRJ8+/sHrxiOdDVYn02dYTWJi9+RBZveiN6aiOVkGLrWA
	OTncKR0c9gZSdCyZ/UdnlKZZgV8SpiMRMxhReeSUjMYpOuBpUSLi8dakXIm1qZjArPK0b1RlzPu
	F27u1GnBVw8ATy/k/hMtROGFmHjFF/loWlsI+uZPYhuh86AfrxN+YYw6OD3/1twXoOvEPpQvOuD
	UaX384YvIodD+XhZRZ1V1dNjQeVy4dV5j0q3ah5Wz61bq13BoJPiKOS1aukrKZpbZkPJj72D7cS
	091qppgx8c01p5/jx7or4=
X-Google-Smtp-Source: AGHT+IGykTA35WgDp4c5cMmOxGe6YRtg0Jc7XZK5bK4cLTL0hNTVOtvYgvTRXfu4Asx37JlTEAq0+Q==
X-Received: by 2002:a05:620a:3949:b0:84f:9d72:40f9 with SMTP id af79cd13be357-883502b6cfdmr3028843285a.15.1760407181996;
        Mon, 13 Oct 2025 18:59:41 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8849f3d8b39sm1115123385a.8.2025.10.13.18.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 18:59:41 -0700 (PDT)
Date: Mon, 13 Oct 2025 21:59:39 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Divya.Chellam@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][walnascar][PATCH 1/2] podman: remove ptest
Message-ID: <aO2uiwdx3jXAHSQ9@gmail.com>
References: <20251013114725.2268483-1-divya.chellam@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251013114725.2268483-1-divya.chellam@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 01:59:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9417

The tests don't do anything, but shouldn't actually break a build, etc.

As such, I don't think we really need to backport this to walnascar.

I've grabbed the CVE fix though.

Bruce


In message: [meta-virtualization][walnascar][PATCH 1/2] podman: remove ptest
on 13/10/2025 dchellam via lists.yoctoproject.org wrote:

> From: Divya Chellam <divya.chellam@windriver.com>
> 
> The ptest was added almost three years ago and since then nobody
> ever fixed anything. It's almost impossible that the ptest never
> failed. As an evidence, for the current version, the test cases
> cannot even run.
> 
> Remove this ptest. People who care about podman ptest should be
> maintaining it.
> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> (master rev: a8175deded4decb9b889901caabb48bf8c4edc73)
> 
> Signed-off-by: Divya Chellam <divya.chellam@windriver.com>
> ---
>  recipes-containers/podman/podman/run-ptest | 13 -----------
>  recipes-containers/podman/podman_git.bb    | 27 +---------------------
>  2 files changed, 1 insertion(+), 39 deletions(-)
>  delete mode 100644 recipes-containers/podman/podman/run-ptest
> 
> diff --git a/recipes-containers/podman/podman/run-ptest b/recipes-containers/podman/podman/run-ptest
> deleted file mode 100644
> index 108ff451..00000000
> --- a/recipes-containers/podman/podman/run-ptest
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -#!/bin/sh
> -
> -# SPDX-FileCopyrightText: Huawei Inc.
> -#
> -# SPDX-License-Identifier: MIT
> -
> -#
> -# Podman system tests
> -#
> -
> -# The system tests don't need any go related variables. Dummy-define them to
> -# avoid useless warnings/errors.
> -GOOS=undefined GO=true BUILDTAGS= make localsystem
> diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
> index d98521ba..a83764fc 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,7 +20,6 @@ SRCREV = "227df90eb7c021097c9ba5f8000c83648a598028"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
> -    file://run-ptest \
>      file://CVE-2025-6032.patch;patchdir=src/import \
>  "
>  
> @@ -56,7 +55,7 @@ export BUILDFLAGS = "${GOBUILDFLAGS}"
>  
>  inherit go goarch
>  inherit container-host
> -inherit systemd pkgconfig ptest
> +inherit systemd pkgconfig
>  
>  do_configure[noexec] = "1"
>  
> @@ -129,17 +128,6 @@ do_install() {
>  	fi
>  }
>  
> -do_install_ptest () {
> -	cp ${S}/src/import/Makefile ${D}${PTEST_PATH}
> -	install -d ${D}${PTEST_PATH}/test
> -	cp -r ${S}/src/import/test/system ${D}${PTEST_PATH}/test
> -
> -	# Some compatibility links for the Makefile assumptions.
> -	install -d ${D}${PTEST_PATH}/bin
> -	ln -s ${bindir}/podman ${D}${PTEST_PATH}/bin/podman
> -	ln -s ${bindir}/podman-remote ${D}${PTEST_PATH}/bin/podman-remote
> -}
> -
>  FILES:${PN} += " \
>      ${systemd_unitdir}/system/* \
>      ${nonarch_libdir}/systemd/* \
> @@ -170,16 +158,3 @@ RRECOMMENDS:${PN} += "slirp4netns \
>                        kernel-module-xt-tcpudp \
>                        "
>  RCONFLICTS:${PN} = "${@bb.utils.contains('PACKAGECONFIG', 'docker', 'docker', '', d)}"
> -
> -RDEPENDS:${PN}-ptest += " \
> -	bash \
> -	bats \
> -	buildah \
> -	coreutils \
> -	file \
> -	gnupg \
> -	jq \
> -	make \
> -	skopeo \
> -	tar \
> -"
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9414): https://lists.yoctoproject.org/g/meta-virtualization/message/9414
> Mute This Topic: https://lists.yoctoproject.org/mt/115732681/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


