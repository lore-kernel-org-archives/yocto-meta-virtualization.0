Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7FAB7E00753; Tue, 17 Mar 2015 06:42:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.49 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B3989E00746
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:42:49 -0700 (PDT)
Received: by lagg8 with SMTP id g8so8874407lag.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Mar 2015 06:42:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BR/vfQknF4FJPF9NBv27FokjIKDiwQijan8sjgGDkis=;
	b=rkTAbbCDCK1cXqpaQCBsPDCEgbBwKvxVZfuW/Oeykf96BcacklkQGmj81P6ZOu3qNY
	yG8zblKj786pFX9cWywQ01OQOrsbupzzpCAsR99Q3cfwLkd/qjSbXTfsTAMFZKELbb6f
	vP/3dl/WdGDhJT8X5Fd64vqV3N/F0JhdKPZ3cZ5Xg6Xu6RwzsDUMxHuI8JtiSuJWdews
	1bEc3R2Va5mRFJ5cJAfNkaPnzSrN3QK8Kxivld1l3EhPzoo4uYbUVe/OKOqAOK9ZHRZl
	/lgisymq5nkJwAGR22Erw0I4macVpZLQUN5hXQHCy/xGG6sVeyVP4u7elUJPLmY2xDlU
	g0PQ==
MIME-Version: 1.0
X-Received: by 10.152.115.169 with SMTP id jp9mr60184204lab.121.1426599767080; 
	Tue, 17 Mar 2015 06:42:47 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Tue, 17 Mar 2015 06:42:47 -0700 (PDT)
In-Reply-To: <1426532133-30849-1-git-send-email-kergoth@gmail.com>
References: <1426532133-30849-1-git-send-email-kergoth@gmail.com>
Date: Tue, 17 Mar 2015 09:42:47 -0400
Message-ID: <CADkTA4MvZ7UXMxjVTB0Rv6wgudZeoNUUx0aPOHjAKjd-eo2OvA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: avoid parse time errors for non-xen-archs
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
X-List-Received-Date: Tue, 17 Mar 2015 13:42:50 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 16, 2015 at 2:55 PM, Christopher Larson <kergoth@gmail.com> wrote:
> XEN_TARGET_ARCH, when expanded, would emit a bb.error(). Referencing
> XEN_TARGET_ARCH in PACKAGECONFIG resulted in its expansion at the up front
> parse time, rather than at compile time, so non-xen-supported-archs like
> powerpc would see parse time errors, resulting in non-zero bitbake exit codes.
>
> Naturally this isn't ideal, so instead have the mapping function return
> 'INVALID' in the unsupported case, and in anonymous python, raise SkipPackage
> if the mapped architecture is invalid, so it's seen as unbuildable in that
> case.

Looks good to me.

merged.

Bruce

>
> Signed-off-by: Christopher Larson <kergoth@gmail.com>
> ---
>  recipes-extended/xen/xen-arch.inc | 2 +-
>  recipes-extended/xen/xen.inc      | 5 +++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen-arch.inc b/recipes-extended/xen/xen-arch.inc
> index bcf9f54..fb0093e 100644
> --- a/recipes-extended/xen/xen-arch.inc
> +++ b/recipes-extended/xen/xen-arch.inc
> @@ -14,5 +14,5 @@ def map_xen_arch(a, d):
>      elif re.match("aarch64.*", a):   return "arm64"
>      elif a in valid_archs:           return a
>      else:
> -        bb.error("cannot map '%s' to a xen architecture" % a)
> +        return "INVALID"
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index 0e4136a..432bf4d 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -663,6 +663,11 @@ export STAGING_LIBDIR
>  export XEN_TARGET_ARCH = "${@map_xen_arch(d.getVar('TARGET_ARCH', True), d)}"
>  export XEN_COMPILE_ARCH = "${@map_xen_arch(d.getVar('BUILD_ARCH', True), d)}"
>
> +python () {
> +    if d.getVar('XEN_TARGET_ARCH', True) == 'INVALID':
> +        raise bb.parse.SkipPackage('Cannot map `%s` to a xen architecture' % d.getVar('TARGET_ARCH', True))
> +}
> +
>  # hardcoded as Linux, as the only compatible hosts are Linux.
>  export XEN_OS = "Linux"
>
> --
> 2.2.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

