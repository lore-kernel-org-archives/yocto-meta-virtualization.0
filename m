Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D3C17E00B58; Thu, 18 Apr 2019 06:13:25 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 318D4E0088B
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:13:25 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id p14so1898399ljg.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Apr 2019 06:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=lh4/WpJoxdocC6HgA+0roJh9xBJknzbo7dFvzoxmdvg=;
	b=MCd2pj+5M8k23GJMq53DS0/AGAw9R4cKsbHjFKPRgTtJvKuISCWdhWYDlEcLz4mLfH
	F5//ZrSCv8L20VXh1i8eSuaZjVfPvVD1fJgHgvqeNVMVa8qsWZk1qop9Gz8lUz1QehbJ
	yo9iL74DACaRy0TqUK8O4sTab1dXVq6qZ+ZFh9aursGLvvbNbnfA5jTOra8iOpiKUwAJ
	eg5MaiIzcibpWhv1Lugb9Lle5Hu/ueqnWg3I8ufxvBee+b8nDv+nDk29jEBiJ59Nh+ex
	FYUoMRrEW4dRvzLQ/o/VI+pAu9Ekz9iNzCVZjvSMXXAjDTD2PiCmGATDmQiGOzex0+p/
	JK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=lh4/WpJoxdocC6HgA+0roJh9xBJknzbo7dFvzoxmdvg=;
	b=HpLokpAQaD3bOHiF5uIGmbxVTZL5UJ+FMR9zJA8asEtLNPOJVe5kY7IKzT1bGJS7YL
	MfxJJPVD/ahMzwWhCCS34hj/LbzMKnPnDMXr0JhL7AIehNlyRPqCESEL0J+Lc3lb2u+T
	iRT7RVIa76uzGl1iJGyYnx/4UG8TPaNo2DojDkIQYuaIkbaVGVbQnJIINvOuXUiQbV0g
	14lwBO7HlEGFp8bYoqFC6RZeKLZ23P0gFJ1PlKGiciMHKOKk9/S+wgCVaNpO9x/ZdTuF
	5WEvDwQPrcCYg3LOwsTv1r9i8u6HJNsPHttR/g7g5U4cqvkHYG9XdJHAYYn1MyiYraZc
	axlg==
X-Gm-Message-State: APjAAAXmQlz6LCkac2/Hd16U3I7h+RNziYqgekB5kuJsPVNaGdb/OlJG
	dWRq4kOusVZM7dHUaahGN9Vc0k8aD+04CDkcbCG/QlBlcbU=
X-Google-Smtp-Source: APXvYqws/PeUnVxrYy21OWBYg9/ZvGHVWkCvNM3L7fqEWV/unSZA3UPBh6WgXQ74f7H/PBkzZ+FpU+JKChaaBIZSIuo=
X-Received: by 2002:a2e:7007:: with SMTP id l7mr1306497ljc.101.1555593204032; 
	Thu, 18 Apr 2019 06:13:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190417075133.84331-1-kai.kang@windriver.com>
In-Reply-To: <20190417075133.84331-1-kai.kang@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Apr 2019 09:13:12 -0400
Message-ID: <CADkTA4M2_79fvZSOuDisnKhe69O1ehKJUs0Y0Gg9CAh0Z59U2w@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH] glusterfs/librdmacm: fix dependency issue with libibverbs
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
X-List-Received-Date: Thu, 18 Apr 2019 13:13:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 17, 2019 at 3:51 AM <kai.kang@windriver.com> wrote:
>
> From: Kai Kang <kai.kang@windriver.com>
>
> glusterfs and librdmacm depend on libibverbs. But libibverbs has been
> set imcompatible with mipsarch and arm. Update glusterfs and librdmacm
> accordingly.
>
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> ---
>  recipes-extended/glusterfs/glusterfs.inc      | 3 +++
>  recipes-extended/librdmacm/librdmacm_1.1.0.bb | 3 +++
>  2 files changed, 6 insertions(+)
>
> diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
> index 5843d7c6..3fc04ffb 100644
> --- a/recipes-extended/glusterfs/glusterfs.inc
> +++ b/recipes-extended/glusterfs/glusterfs.inc
> @@ -51,6 +51,9 @@ EXTRA_OECONF = "ac_cv_file__etc_debian_version=no \
>                 "
>
>  PACKAGECONFIG ??= "georeplication libibverbs"
> +PACKAGECONFIG_remove_mipsarch = "libibverbs"
> +PACKAGECONFIG_remove_arm = "libibverbs"
> +
>  PACKAGECONFIG[bd-xlator] = "--enable-bd-xlator,--disable-bd-xlator,lvm2,"
>  PACKAGECONFIG[debug] = "--enable-debug,--disable-debug,,"
>  PACKAGECONFIG[georeplication] = "--enable-georeplication,--disable-georeplication,,rsync"
> diff --git a/recipes-extended/librdmacm/librdmacm_1.1.0.bb b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> index 30a0c943..edf92f01 100644
> --- a/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> +++ b/recipes-extended/librdmacm/librdmacm_1.1.0.bb
> @@ -39,3 +39,6 @@ do_install_append() {
>          rm -f ${D}${libdir}/librdmacm.la
>          rm -f ${D}${libdir}/rsocket/librspreload.la
>  }
> +
> +COMPATIBLE_HOST_mipsarch = "none"
> +COMPATIBLE_HOST_arm = "none"

This should be a separate commit. We shouldn't mix the default
packageconfig change
and the marking of librdmacm as incompatible with mips/arm into the same commit.

In particular, since I'd like the error message you get if librdmacm
is compiled for arm/mips
to be logged in the commit where we make it incompatible.

Bruce

> --
> 2.20.0
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

