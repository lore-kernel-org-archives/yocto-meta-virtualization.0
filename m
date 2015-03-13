Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71E81E00754; Fri, 13 Mar 2015 11:46:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.176 listed in list.dnswl.org]
Received: from mail-lb0-f176.google.com (mail-lb0-f176.google.com
	[209.85.217.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B1A8E003A8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Mar 2015 11:46:23 -0700 (PDT)
Received: by lbiw7 with SMTP id w7so24744590lbi.7
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Mar 2015 11:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WavEAoSTgPCK+bR8xthrlB41uq+08McqEDwIiJVMIOs=;
	b=aQRGJD5yLObz9PCtOkUgaeWvpicR7AccVHV1HpeojSW9HIJ52sl/6yd7d1WHN/sP2Z
	zB4jXpHSYcIQlOPGobd10uivuQbFZnKdiKIr+fnzjXO8w4kVVDxdyJzrAO6ci5s1fVTE
	xz81aBoBkSEYY+0sfZciBXS4cKn8MuHGJtK86SSWBxcVEx5Y4MM7nuOCbmV1yzpm5HwX
	LgyQqvg2G7sHxoNDm6S7y36llEKWC8iv4f0oIYO/u6q5CnkeojJ2TcjpcOgIOikBHBA5
	r+y50tk6GHMoh3/wsN+x8uaC/G7ZxFKxG0oEwp4UbSFmPJOFMUh3utT/10HcHdE2qdbA
	JXgg==
MIME-Version: 1.0
X-Received: by 10.152.28.5 with SMTP id x5mr43821632lag.112.1426272381856;
	Fri, 13 Mar 2015 11:46:21 -0700 (PDT)
Received: by 10.112.170.70 with HTTP; Fri, 13 Mar 2015 11:46:21 -0700 (PDT)
In-Reply-To: <1426063952-1217-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1426063952-1217-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Fri, 13 Mar 2015 14:46:21 -0400
Message-ID: <CADkTA4NXNm0gRUJHdGkNxA_TnAsF35t=JtWUMzwP+2sM0aWoRQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 1/2] lxc: Add PACKAGECONFIG for seccomp
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
X-List-Received-Date: Fri, 13 Mar 2015 18:46:28 -0000
Content-Type: text/plain; charset=UTF-8

Thanks!

I've merged v2.

Bruce

On Wed, Mar 11, 2015 at 4:52 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  recipes-containers/lxc/lxc_1.0.7.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.7.bb b/recipes-containers/lxc/lxc_1.0.7.bb
> index c618c84..b01c006 100644
> --- a/recipes-containers/lxc/lxc_1.0.7.bb
> +++ b/recipes-containers/lxc/lxc_1.0.7.bb
> @@ -49,6 +49,7 @@ PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>  PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
>  PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
> +PACKAGECONFIG[seccomp] ="--enable-seccomp,--disable-seccomp,libseccomp,libseccomp"
>
>  inherit autotools pkgconfig ptest update-rc.d systemd
>
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

