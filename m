Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 19E64E00EC7; Tue, 10 Jul 2018 06:43:04 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BDC2CE00CCC
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:43:02 -0700 (PDT)
Received: by mail-lf0-f65.google.com with SMTP id m13-v6so18340678lfb.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CX+r9hRRxN95NbhdoGuYyvy1yXAX+3pVdRB8Ll52vEg=;
	b=UDczvB8hsKaaE0d/7tQKBMJGIblgbCtA+wDCymeFSese0bR+EsMpZmIk93jejSdh57
	u4uAGGq3ojBzbx+ytUMi5WU8OcvKcr8YRY3z/Z+rbFR+YoALHaokNoSfvEoXBDQWUMs5
	oKGsMukY4QLJdzi9mcOaVqNjcMTiAJSEzT9J3hn1cHu9QftI0U5FSqcZoT1lilAHWroW
	UEstzWWQ49riVG8+4AoftAZyQERKVVG15EX7MsQv1Rz+3nm89JVRauVZ+A7p3n305W6S
	dQMO6bTdtAzA+y3agsIrVNkFfExn9qAY8Hpus4yHXTeQLwTexKo2VHrcsdWGCgnNc8Ud
	tnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CX+r9hRRxN95NbhdoGuYyvy1yXAX+3pVdRB8Ll52vEg=;
	b=b2Pe8MdwwQZZoGp9G8wm9YUtebOGEcLVBct7vbccGhtbzEmNqpVL7rJzIpXinkjt0+
	pXZC9xX0P0lqIr3mL0XGiIUeYGj+dLZocL3f3prmOCVT39PzIfVMzspIR55Wk4J3e69s
	FOr7kdwhAX7SUwX47lmAJtJjW14u6Z4ruYjGEYXOO4fY3V74214xdLRYiBi5u0JrzxZw
	RDLPtP+EokZ936vXqtaDwkFl8d1GQGLxUIS/h3QZWOqdASu3fR2FgVy8GtmBbbL8BVbn
	yX23amn4wIYXdJeD0twbdLvTkLwQnsE6VZW3upMNxjYYYoclHpUS3X27DEn3Ugzjei0L
	dOqQ==
X-Gm-Message-State: APt69E2PsPnI/NPIfSWQ3k0KexXL95q3xemynOI1QeoX5Eli/crdOOal
	3dymsOUvoBqYvLdSEzt6s/k2GUW8c7C6hx0Mz1+IgQ==
X-Google-Smtp-Source: AAOMgpcnrBv8gtjHCr9GWLvD3D2myjXSeQve+gXiYUiRfEY2W2hOGPK0jNSmOtq76ZoLWKdThPigFX8PTIoYHWE8loo=
X-Received: by 2002:a19:c403:: with SMTP id u3-v6mr2825450lff.87.1531230181636;
	Tue, 10 Jul 2018 06:43:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:43:00
	-0700 (PDT)
In-Reply-To: <1530707794-106222-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
References: <1530707794-106222-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:43:00 -0400
Message-ID: <CADkTA4NCdxU5OYwNHMoDSyw=1MupjfC=RdgEVeTwaJHGkC1qJQ@mail.gmail.com>
To: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] [PATCH] criu: upgrade to 3.9
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
X-List-Received-Date: Tue, 10 Jul 2018 13:43:04 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the uprev, but I have a few questions below.

On Wed, Jul 4, 2018 at 8:36 AM, Zheng Ruoqin
<zhengrq.fnst@cn.fujitsu.com> wrote:
> Upgrade criu from 3.4 to 3.9.
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

I see this patch being removed from the SRC_URI, but not the delete of the
patch, or an explanation of why it is no longer required.

>            "
>
>  COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> @@ -46,9 +45,11 @@ EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir} SYSTEMDUNITDIR=${systemd_unit
>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
>
>  CFLAGS += " -I${STAGING_INCDIR} -I${STAGING_INCDIR}/libnl3"
> +CFLAGS_arm += "-D__WORDSIZE"

Can we document why this is required, and what the error is without it ?

>
>  # overide LDFLAGS to allow criu to build without: "x86_64-poky-linux-ld: unrecognized option '-Wl,-O1'"
>  export LDFLAGS=""
> +export C_INCLUDE_PATH="${STAGING_INCDIR}/libnl3"

Likewise, we need to document why this is now required.

Cheers,

Bruce

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

