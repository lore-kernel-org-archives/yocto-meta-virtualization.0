Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDB0AC71136
	for <webhook@archiver.kernel.org>; Thu, 12 Jun 2025 14:42:35 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web11.14829.1749739346477359840
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 12 Jun 2025 07:42:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hX7/g7xw;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6fabb948e5aso12121696d6.1
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 07:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749739345; x=1750344145; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=A3sCCwzWhxx/ENb7X81PE/C/Q5ZtQxSdBzd+6vhRruE=;
        b=hX7/g7xw7TDYHn5P7LM4zZmPxk5TJ3dT26WB5yL4LWK96zyAKh6J1fIdf/aLc+fsGB
         DI9lbE9qe+SJXjxfO4JOJHWf4QMsRKyL+FT97IPqowDxmzugLostMY1CbreISIGs92EY
         eiVNQRu6ruKjTymyj4cVHZP0YWF6xBBVRQid9ZDdLyb40vgZrWA8UsrayQDUp498U3zy
         TlnXqyivY5lq7rNsIhkPGPt7fE92FFrOkxGCkiqSpaQqkZAd+IABW3Xeb6mZqL55/eLo
         3F2z0txMbxm9Mz8NWq86TcXhkbflF3aZ/c7qsmL/fvYldThc87Wu6+v5DiFjKZ/vqeJx
         AGTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749739345; x=1750344145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A3sCCwzWhxx/ENb7X81PE/C/Q5ZtQxSdBzd+6vhRruE=;
        b=jwpHB7uXBFE+MzFqlrl0id0tzjV0XhU+V+xtmwe8FXVdXAS7CeYWkXRA1WoDQ6U1d7
         2CeoQkk++DHLyXIJ/TveT882WA5d9ey3e0x4e2WqugeovHtUg8q6QKcvufdFmYpKml8n
         4MEkJhSiZ7Qwbak1HVeZM6Vs4HZ+g1W9VvyEcj8U4EKmNFz//a+NXzGIyLAA8aT76EK8
         gMmFlBj2HniYoP6u8GozHarLnkVtM9aiDeXOJL9LDYJkM+I1xDI3B/fybuRZOB4jA+ZU
         Ymis54vO15p6Ml7KOv2WYWR9ku1qiaAAEn9W2p63nBtZickPJ5/PBqP4dNgCeCi44x/1
         OC6Q==
X-Gm-Message-State: AOJu0YyVDGyISVuMmyp86ZmQNFdJnO5Ex5CJ1kybO9kIC9xp/pw95XsU
	2bne4/GE879sVhruPfxaWGvxdTp7LulNIa7TD4Rtbfcp+DIOzYs0bG+KfTM3PED7VoE=
X-Gm-Gg: ASbGncuv5BsJgZoB1g4tJfaMXxvJYLfoUKO8rRMEzqn193PGFhuEkRfHiwfvKyyYKsO
	QFCsX57HPfwMO3sqcCrHoNVVMPapOtA0mNVW/eHgII2mPqesnEipg2r608mLPUqKBJiR7vEtTtC
	JYT0uS+pfknnShGb9lp85UTIwoTnIQk/o+ckFFn6MDRiWC2AktNe9gtvGf9o87fSzVEDG7k4wHA
	DukUmOWM0sd/WAl/ypRdXRWxlLHx1/BDfDW9TkOZqpKoAC5LQhNN0zHypMuDtbkZN74sRMyIk7A
	pzY48ysGjqclzMfNsvPoqk6x7zfEqLQPwOybm78D1pON1AnSlLEHLFumryCVr+wPGlQWWsXvEf6
	BSA8Mf7KvRdhikc71KaqNWmRLv8Ut2i78WcdS+pl4JMLtnIbQtY4=
X-Google-Smtp-Source: AGHT+IFAiU4Yjb6qLrIu9KiC4qNYbyUvnfTdcBZVrHNhjhRWvtW/CfOEkYewbxo+QMcLwZfu6S0UPg==
X-Received: by 2002:a05:6214:21a6:b0:6fa:fd30:e2e9 with SMTP id 6a1803df08f44-6fb34d276d5mr50751036d6.5.1749739345186;
        Thu, 12 Jun 2025 07:42:25 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35c8662esm10623956d6.115.2025.06.12.07.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 07:42:24 -0700 (PDT)
Date: Thu, 12 Jun 2025 10:42:22 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Qi.Chen@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] podman: remove ptest
Message-ID: <aErnTuMOh4t/3eOI@gmail.com>
References: <20250611072342.1850153-1-Qi.Chen@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611072342.1850153-1-Qi.Chen@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 12 Jun 2025 14:42:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9282

In message: [meta-virtualization][PATCH] podman: remove ptest
on 11/06/2025 Chen Qi via lists.yoctoproject.org wrote:

> From: Chen Qi <Qi.Chen@windriver.com>
> 
> The ptest was added almost three years ago and since then nobody
> ever fixed anything. It's almost impossible that the ptest never
> failed. As an evidence, for the current version, the test cases
> cannot even run.
> 
> Remove this ptest. People who care about podman ptest should be
> maintaining it.

And that is my policy for all the ptets. I don't typically run
them, since I focus on integration and full system testing when
I do the package upgrades

I'm doing exactly that right now, and expect to have the next
set of package bumps validated by end of next week.

This is merged.

Bruce

> 
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
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
> index 46c6c969..8d8e0f05 100644
> --- a/recipes-containers/podman/podman_git.bb
> +++ b/recipes-containers/podman/podman_git.bb
> @@ -20,7 +20,6 @@ SRCREV = "227df90eb7c021097c9ba5f8000c83648a598028"
>  SRC_URI = " \
>      git://github.com/containers/libpod.git;branch=v5.4;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
>      ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
> -    file://run-ptest \
>  "
>  
>  LICENSE = "Apache-2.0"
> @@ -55,7 +54,7 @@ export BUILDFLAGS = "${GOBUILDFLAGS}"
>  
>  inherit go goarch
>  inherit container-host
> -inherit systemd pkgconfig ptest
> +inherit systemd pkgconfig
>  
>  do_configure[noexec] = "1"
>  
> @@ -128,17 +127,6 @@ do_install() {
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
> @@ -169,16 +157,3 @@ RRECOMMENDS:${PN} += "slirp4netns \
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
> 2.34.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9278): https://lists.yoctoproject.org/g/meta-virtualization/message/9278
> Mute This Topic: https://lists.yoctoproject.org/mt/113584670/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


