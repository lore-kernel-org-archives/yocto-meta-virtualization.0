Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D2D8FE00A4C; Sun, 22 Jul 2018 20:17:55 -0700 (PDT)
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
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EBD9E00874
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:17:55 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id r13-v6so15586646ljg.10
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 Jul 2018 20:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8E6vnqqTOFGfMml4Ul4n3Sm/yARNpt+ec9uh9cxufD4=;
	b=pVNdM51WY8pjrAwhwm1coIrB/BOkRbY+nEP/NQreMm5ED5ORXDwWPlXN6K92fziuo9
	NVlSQvzKedG/qNTQFw2i3P0+8eMa08dCzL6CjLdCzW4ytUBI76QTvBqmNSx87vr33keU
	koZezlPERBGBmpP2XsjXW172I2RJGs+Iy7TJ8MSdRA0waethHzgmKFjElAb9kqhZXWfX
	nYtvvXcfyppE6jVgaGunGAGvYTOt8VNH9FsyRGdz1KdbvWkOE9M7wPIqnCYnU65j48UF
	Arwy4HHMlTfEP7sgc8/zkI6FHQzOZChCKFyMgLFGCWq2+rlui8EvqMPEwcbb3/ZIW2Mo
	ZGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8E6vnqqTOFGfMml4Ul4n3Sm/yARNpt+ec9uh9cxufD4=;
	b=tLCJube0DHqoGbbdRGflPl2IBnCke5sqCQ3vyDVBvabGBtg3BesILovpJWN+iDk/Ou
	1cix0Zy6FGcTpWc3hg3ZJTzcKhzk/0ILNWrhdBFTkDqhQmn1pCjD6hRf/Al8W6UthiT/
	hFgk7hkaDhZIVlFadMKIvg09IeHNJ4ztkdHkU+LoR0zrjq2KcoHQTIp9gXH/4ObvCBGb
	0lg19WuBjpQ7WUzgAJoDQ9k0kY+4TDK8oK+ZNJ6deEclqj5Y7QFeR9HVFoYDFvvl2wbP
	3FzXvf5uysOGjFuCqo0rkyth5Ssdj0U+v/SNFanLKyBCxwLScM00kWBF5HpJUpmjV/fN
	JFTA==
X-Gm-Message-State: AOUpUlFqP17uUpJZMDXrPKJiUlJLNk9sH2wZqldriFb4ug8yQKUXjuCe
	gZ+fYL/lXkPW6HBR0CDD2YENzi4tVyjtCqBPJngwNw==
X-Google-Smtp-Source: AAOMgpfJBHAiHA107QMc7XrTC1tMe/cSfy//+XNuN7njRQXLQ6iEyQ0Eexc9DRn6yKOpQdCEyQjFXJLbnrEAV7Imsyc=
X-Received: by 2002:a2e:439b:: with SMTP id
	z27-v6mr7393842lje.84.1532315874278; 
	Sun, 22 Jul 2018 20:17:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Sun, 22 Jul 2018 20:17:53
	-0700 (PDT)
In-Reply-To: <1531704768-17848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1531704768-17848-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 22 Jul 2018 23:17:53 -0400
Message-ID: <CADkTA4Ow_tkixbnNH37dhMT2E0c+QaRGu5aRiLJa1TsPx7PAVg@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] criu: upgrade to 3.9
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
X-List-Received-Date: Mon, 23 Jul 2018 03:17:55 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sun, Jul 15, 2018 at 9:32 PM, Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
> 1) Upgrade criu from 3.4 to 3.9.
>
> 2) Delete fix-building-on-newest-glibc-and-kernel.patch for it has been merged in upstream.
>
> 3) Add CFLAGS_arm += "-D__WORDSIZE"
>    add this CFLAGS to solve the compile problem for arm.
>    The log is as following:
>    | ....../tmp/work/armv5e-poky-linux-gnueabi/criu/3.9+gitAUTOINC+202b7745bd-r0/recipe-sysroot/usr/include/bits/wordsize.h:36:2: error: #error "__WORDSIZE is not defined"
>    |  #error "__WORDSIZE is not defined"
>    |   ^
>    | ....../tmp/work/armv5e-poky-linux-gnueabi/criu/3.9+gitAUTOINC+202b7745bd-r0/recipe-sysroot/usr/include/bits/wordsize.h:59:2: error: #
>
> 4) Add export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
>    add C_INCLUDE_PATH to solve the compile problem for arm.
>    which is libnetlink.c can't find head file.
>
>    | In file included from criu/libnetlink.c:5:
>    | ....../tmp/work/armv5e-p
>    | oky-linux-gnueabi/criu/3.9+gitAUTOINC+202b7745bd-r0/recipe-sysroot/usr/include/libnl3/netlink/attr.h:15:10: fatal error: netlink/netlink.h: No such file or directory  #include <netlink/netlink.h>
>
> Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
> ---
>  recipes-containers/criu/{criu_git.bb => criu_3.9.bb} | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>  rename recipes-containers/criu/{criu_git.bb => criu_3.9.bb} (94%)
>
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_3.9.bb
> similarity index 94%
> rename from recipes-containers/criu/criu_git.bb
> rename to recipes-containers/criu/criu_3.9.bb
> index 7d62f35..36c356d 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_3.9.bb
> @@ -13,15 +13,14 @@ EXCLUDE_FROM_WORLD = "1"
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=412de458544c1cb6a2b512cd399286e2"
>
> -SRCREV = "a31c1854e10580a09621e539c3ec052b875a8e06"
> -PV = "3.4+git${SRCPV}"
> +SRCREV = "202b7745bd0c37a1732ebe2fb009a157d338bf95"
> +PV = "3.9+git${SRCPV}"
>
>  SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
>             file://0001-criu-Fix-toolchain-hardcode.patch \
>             file://0002-criu-Skip-documentation-install.patch \
>             file://0001-criu-Change-libraries-install-directory.patch \
>             file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> -           file://fix-building-on-newest-glibc-and-kernel.patch \
>            "
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> @@ -46,9 +45,11 @@ EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unit
>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
>
>  CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
> +CFLAGS_arm += "-D__WORDSIZE"
>
>  # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
>  export LDFLAGS=""
> +export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"
>
>  export BUILD_SYS
>  export HOST_SYS
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

