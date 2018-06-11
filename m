Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9663FE0229B; Mon, 11 Jun 2018 05:40:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D215E02298
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 05:40:15 -0700 (PDT)
Received: by mail-yw0-f194.google.com with SMTP id s201-v6so6244141ywg.8
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Jun 2018 05:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5VjnEx7XTBxbppTKNlP1uOoFL/ozplZ5rur+Y1QijN0=;
	b=nAUnpYiSFUVh7Z36Vj4reBUtX2sm7xIFD3LT+BxjH2+z+yHPUtn4xRXIUBcLw0v4rv
	djtr5v3Yr9g/E/XHb+T0atBvigLcpQvqDdRUC+iPULR3pQYCuhYSiSK/cp6sjy/X5WUG
	Fyzpc4JQ778C5tM6couZ2jSNKELC9KbmbKDmob9by9zdHN5iA9qz4nM8kE58BWzEHm0e
	8GnqROMzy0pxeUF9Rm9euHLm6bDoDfKpQeP7cTaJIKj1Rv/SuXtD7LaU6nUQLYWicFnC
	Fes/+hYQs80ET4TiLQ6RCL6nGqFuyUxk4cWmlMecenKn4ALyOfN0hdge2gwwAV8KmNvb
	k6yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=5VjnEx7XTBxbppTKNlP1uOoFL/ozplZ5rur+Y1QijN0=;
	b=DCrX+UbarsH7UOpddcQzIb+ULxea6MdHXmQazNaWDkBTwe9tulDPn+nIF7pcAs40rP
	/C667fyXZaf1X2xKz5F/HdFzFnyRIcaCfbgulTEQIDuGXEQbUg+YW+fSAfqdgAwU7ttV
	RzAqtnLrQ1eOP5yYHWR/Nx+4ABeR7x3S7pC4togqFhN5H+0Gsm4CwYL+p8jU6YQ1htHV
	fmNAnfqCrh0gdyZVvV7EUqJfZJ1dDqTHmcuUc5LUe/Cr8/6/ffnqF6vw50pPlt5cSO/P
	tDWIuteRzjH+1nzJ4oWtjcKiLFggnnfb4vI1FiClhdKjU/e7+4UkMpZ4sqi0yWSox8IT
	LNXA==
X-Gm-Message-State: APt69E3Ud7a8ql3eUv8lWx7JVDEssaa4k1stcwQfyp2Zhyxe41iV/28j
	x/TnR2qrFDY4eKMajNGMkGnp8Ri8fqYhOLVX/6hKIw==
X-Google-Smtp-Source: ADUXVKKfCku0KU9SjfGcGmepVExIW21P44UfyOhWytGBcwR0g+ECBCrbhZCjMql8pIu4roztqaoPs30NvYFl//N6ZyU=
X-Received: by 2002:a81:2e0e:: with SMTP id
	u14-v6mr9647882ywu.341.1528720815134; 
	Mon, 11 Jun 2018 05:40:15 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:bf83:0:0:0:0:0 with HTTP; Mon, 11 Jun 2018 05:40:14
	-0700 (PDT)
In-Reply-To: <1528499291-7920-1-git-send-email-jpuhlman@mvista.com>
References: <1528499291-7920-1-git-send-email-jpuhlman@mvista.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 11 Jun 2018 08:40:14 -0400
X-Google-Sender-Auth: 0BhAP_nBmWpo5n5vecM_O9jfehk
Message-ID: <CAPuovE+rkseSS_+McU9Jy2OQs=PzxiJQr7kWPbeVfoXuQz43bg@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] lxc: uprev 3.0.1
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 11 Jun 2018 12:40:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 8, 2018 at 7:08 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> - Bug fix release
> - Fixes gcc8 build failures
> - Update patch for fuzz issues.
> - remove --disable-python and --disable-lua as they have been removed
>
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---


Thanks Jeremy,

Looks good and you have taken care of something on my todo list.

Thanks,
Mark

>  .../templates-actually-create-DOWNLOAD_TEMP-directory.patch    | 10 +++++-----
>  recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb}          |  6 ++----
>  2 files changed, 7 insertions(+), 9 deletions(-)
>  rename recipes-containers/lxc/{lxc_3.0.0.bb => lxc_3.0.1.bb} (96%)
>
> diff --git a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> index 359f662..44959db 100644
> --- a/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> +++ b/recipes-containers/lxc/files/templates-actually-create-DOWNLOAD_TEMP-directory.patch
> @@ -22,12 +22,12 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
>  diff --git a/templates/lxc-download.in b/templates/lxc-download.in
> -index f875183..5f1138c 100644
> +index 973783b..015a679 100644
>  --- a/templates/lxc-download.in
>  +++ b/templates/lxc-download.in
> -@@ -320,7 +320,7 @@ fi
> - if ! command -V mktemp >/dev/null 2>&1; then
> -   DOWNLOAD_TEMP="${DOWNLOAD_TEMP}/tmp/lxc-download.$$"
> +@@ -323,7 +323,7 @@ elif [ -n "${DOWNLOAD_TEMP}" ]; then
> +   mkdir -p "${DOWNLOAD_TEMP}"
> +   DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
>   else
>  -  DOWNLOAD_TEMP="${DOWNLOAD_TEMP}$(mktemp -d)"
>  +  DOWNLOAD_TEMP="$(mktemp -p ${DOWNLOAD_TEMP} -d)"
> @@ -35,5 +35,5 @@ index f875183..5f1138c 100644
>
>   # Simply list images
>  --
> -2.7.4
> +2.11.1
>
> diff --git a/recipes-containers/lxc/lxc_3.0.0.bb b/recipes-containers/lxc/lxc_3.0.1.bb
> similarity index 96%
> rename from recipes-containers/lxc/lxc_3.0.0.bb
> rename to recipes-containers/lxc/lxc_3.0.1.bb
> index 4f7526b..a77dd09 100644
> --- a/recipes-containers/lxc/lxc_3.0.0.bb
> +++ b/recipes-containers/lxc/lxc_3.0.1.bb
> @@ -47,8 +47,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-net \
>         "
>
> -SRC_URI[md5sum] = "ca1db4f9dc35df9203a58ab606cdfb7a"
> -SRC_URI[sha256sum] = "6230224c27f050201b372b18a9f39cd220ed584899c5f0cf73c6b313dabc8d8a"
> +SRC_URI[md5sum] = "8eb396dde561e5832ba2d505513a1935"
> +SRC_URI[sha256sum] = "45986c49be1c048fa127bd3e7ea1bd3347e25765c008a09a2e4c233151a2d5db"
>
>  S = "${WORKDIR}/${BPN}-${PV}"
>
> @@ -76,8 +76,6 @@ PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
>  PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>  PACKAGECONFIG[systemd] = "--with-systemdsystemunitdir=${systemd_unitdir}/system/,--without-systemdsystemunitdir,systemd,"
> -PACKAGECONFIG[python] = "--enable-python,--disable-python,python3,python3-core"
> -PACKAGECONFIG[lua] = "--enable-lua,--disable-lua,lua,lua"
>
>  # required by python3 to run setup.py
>  export BUILD_SYS
> --
> 2.6.2
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

