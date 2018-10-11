Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3A241E00A54; Thu, 11 Oct 2018 11:35:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E8A19E00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:35:49 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id w21-v6so7451291lff.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 11:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ly0wVjAurU1olX4mmytp5vBbYVu3ZV2igs1ZczMelKg=;
	b=Ln7g4900ZudSXxM+rfQ8ZzuU+Txn/IlSqgR9aTGBE7daat73Z7o2II0M+Nm4rHrSOW
	vM7vIfMJe6j8pyTltxpXfxuNApPc0TYX92Z8Go+mtau6CHoVLoME3UHbrwcM6B91UTXZ
	sLNPZKv6ffnaPbgm029E3j6MqN0hLX/jcZp8JFBvNtUMdutA8bay+yS5lR2u5wHtq+Ww
	jjB1gKOW0uwto9qTRY+Mz2Jibmz7uoKyOi6rDy5t66AgMJx/BYVfEGqi3WwhIqNFfb5j
	pV4+zU2/dPYwrKnh160+w0vddxHbEgJ+9AJaLj+EChUEAmuVeewaXw8DdQkZZZ3ypQ6V
	UNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ly0wVjAurU1olX4mmytp5vBbYVu3ZV2igs1ZczMelKg=;
	b=FsKM4G1KeoidWo0wAePT7464NWawuaf1CopYoX6Gz4UxqHJqHvcEq4JFFdSe2l0SQR
	dZ8oEf+y+w8KYn8ekNodaA4p3zzjvsyHIhJdSkptTxrpLA2dp3a/gdm7cn46qQOUYuRf
	ylIB0lwuRWL3cmtjT8fQJAPbPIP4HWRwBI+szF0j1lCQMhSXsL90L5DfkHWU/JhRBaQY
	I6GELuNlLjb26Ez0nIWv1I2/z7DG6hBX+6DYH7SXkaYoNO12OPdUfzkj/ZtWBnj3rR35
	SQs67Ibrzbm/4WzB8ppvFnNY7T2o2lL0JAZjUmIAs0qoc1Te4zvjLvnJ9K4YtcapbYu3
	U+8Q==
X-Gm-Message-State: ABuFfoj0VJO4PLjU4Fj5wns68PkCzD7rx636WXux/7/zsgWR8mgiC/nD
	iNacdFtx9owo2BelKoj8zyZmRvmcvyygIo6UITA=
X-Google-Smtp-Source: ACcGV60+XGC+DN//5zlFxld38xTdIAax5lKw1DCJxDRu1asfLwbzXt30xH2QR+2Xm9rsrOEwk0AGakl8Pd8cJ4M3N68=
X-Received: by 2002:a19:d824:: with SMTP id
	p36-v6mr1802623lfg.23.1539282948768; 
	Thu, 11 Oct 2018 11:35:48 -0700 (PDT)
MIME-Version: 1.0
References: <1539154754-137572-1-git-send-email-changqing.li@windriver.com>
	<1539154754-137572-6-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1539154754-137572-6-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 14:35:37 -0400
Message-ID: <CADkTA4Pv__+YJpTxbLkTnAf7qQd0Js=BYrYRhy8rB19hU851Xw@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] oci-runtime-tools: fix do package qa warning
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
X-List-Received-Date: Thu, 11 Oct 2018 18:35:51 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce
On Wed, Oct 10, 2018 at 3:00 AM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> 1. After security flag PIE is enabled by default, we might met
> below QA warning on some arch, like aarch64, fix it by skip
> textrel QA check refer commit b689c72a of oe-core
>
> oci-runtime-tools-0.1.0+gitAUTOINC+6e7da8148f-r0 do_package_qa: QA Issue:
> ELF binary 'work/aarch64-poky-linux/oci-runtime-tools/0.1.0+gitAUTOINC+6e7
> da8148f-r0/packages-split/oci-runtime-tools/usr/sbin/oci-runtime-tool'
> has relocations in .text [textrel]
>
> 2. This problem is caused since security_flags.inc is used by default.
>    so alternative work around is:
>       SECURITY_CFLAGS_pn-oci-runtime-tools = "${SECURITY_NOPIE_CFLAGS}"
>       SECURITY_LDFLAGS_pn-oci-runtime-tools = ""
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> index 61b68b5..adbfc1e 100644
> --- a/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> +++ b/recipes-containers/oci-runtime-tools/oci-runtime-tools_git.bb
> @@ -11,7 +11,7 @@ SRCREV = "6e7da8148f4de2c9e9c9d3b345576898d4f412cb"
>  PV = "0.1.0+git${SRCPV}"
>  GO_IMPORT = "import"
>
> -INSANE_SKIP_${PN} += "ldflags"
> +INSANE_SKIP_${PN} += "ldflags textrel"
>
>  inherit goarch
>  inherit go
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

