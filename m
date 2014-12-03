Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8BC2CE00950; Wed,  3 Dec 2014 07:22:03 -0800 (PST)
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
	*      [209.85.215.50 listed in list.dnswl.org]
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 775DDE00920
	for <meta-virtualization@yoctoproject.org>;
	Wed,  3 Dec 2014 07:21:53 -0800 (PST)
Received: by mail-la0-f50.google.com with SMTP id pn19so11807451lab.23
	for <meta-virtualization@yoctoproject.org>;
	Wed, 03 Dec 2014 07:21:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pqOVTk0UdaT8L44TlICMIKDpgnPKBg3xJ+6TkOqoVig=;
	b=NRh37T+IKj3n3Aoy8DRRLG0NTmzoLp3z8Wk+066a6Bs8J34/i9hbvxPVMXmj5w5F+u
	zoVgoIfdR2icJqT8pYk98UL6g94Z2L+c/EU86ECVzj/1cWGtlCQ7gbgVVMiQxqM+DxLs
	KaO/kQqgettjMUqoM8a+eCNUTnAOluj1TA4cEV5O8OK3zkz4iU0d0uw1xSAalGWTtPyf
	3/gPR2aT+Qe5l6K7R4tiVYFJeB11mfH0oONkM8Y8pZ0N18PzKl7INZ9KnSzaFHUHybST
	awpsjgXJL4bRga8H+a6jpWdYYIaTgKJGqxys8WqAB79HAwk5xhGoteUpyITrbnBt2svc
	ANjw==
MIME-Version: 1.0
X-Received: by 10.112.166.5 with SMTP id zc5mr4882101lbb.20.1417620111856;
	Wed, 03 Dec 2014 07:21:51 -0800 (PST)
Received: by 10.112.48.41 with HTTP; Wed, 3 Dec 2014 07:21:51 -0800 (PST)
In-Reply-To: <1417592470-7582-1-git-send-email-wenzong.fan@windriver.com>
References: <1417592470-7582-1-git-send-email-wenzong.fan@windriver.com>
Date: Wed, 3 Dec 2014 10:21:51 -0500
Message-ID: <CADkTA4OVSTsx578cRF6ecHA2QkGMuEsE=yA-Ebrd8tscEre8qA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: wenzong.fan@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: add PACKAGECONFIG for selinux
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
X-List-Received-Date: Wed, 03 Dec 2014 15:22:03 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 3, 2014 at 2:41 AM,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Add PACKAGECONFIG for 'selinux', otherwise there would be warnings like
> below:
>
> WARN: lxc: lxc rdepends on libselinux, but it isn't a build dependency?

merged.

Bruce

>
> Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
> ---
>  recipes-containers/lxc/lxc_1.0.6.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/recipes-containers/lxc/lxc_1.0.6.bb b/recipes-containers/lxc/lxc_1.0.6.bb
> index 0805573..e6ec68d 100644
> --- a/recipes-containers/lxc/lxc_1.0.6.bb
> +++ b/recipes-containers/lxc/lxc_1.0.6.bb
> @@ -40,11 +40,14 @@ S = "${WORKDIR}/${BPN}-${PV}"
>  PTEST_CONF = "${@base_contains('DISTRO_FEATURES', 'ptest', '--enable-tests', '', d)}"
>  EXTRA_OECONF += "--with-distro=${DISTRO} ${PTEST_CONF}"
>
> -PACKAGECONFIG ??= "templates"
> +PACKAGECONFIG ??= "templates \
> +    ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
> +"
>  PACKAGECONFIG[doc] = "--enable-doc --enable-api-docs,--disable-doc --disable-api-docs,,"
>  PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath,,"
>  PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
>  PACKAGECONFIG[templates] = ",,, ${PN}-templates"
> +PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
>
>  inherit autotools pkgconfig ptest
>
> --
> 1.7.9.5
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

