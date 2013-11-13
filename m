Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 598A9E0178C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Nov 2013 09:53:42 -0800 (PST)
Received: by mail-lb0-f173.google.com with SMTP id w7so649419lbi.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Nov 2013 09:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xqNjilhuhczTCdT46jRMP93rXJ6hJe8UxMYC7C8VS2o=;
	b=RhTtkTuGkzHp3zH7yGexIcbuF6qMPoo7szSL2AernuR50ZSJK9ypEi9XCnPkkCczkY
	aToJ3SGx9/Y8bSou20bqB2cWxEzclROy/2reDSE8FUzjSdvZrwGKqO8JTy4DwT7F6AiI
	zihh9ZRi3DKFwEUqAK39Kja15iZW+1sMNbART0dQ1G9NFYH9rcA8Uu0+fKfLbmP7MZnS
	hS2ImZDQlGdmIylMWEFEgJnXTihV9RXObejB07XASucEbwx2IL1Txo+ERPEdzNQnrhzd
	LZrhoSn4Andcn8A/I8Pvz68WcbfNWu8mOkwPGhj6sqJjOGqQDhoMm0Jc+m9LdJF6aRzs
	mHoA==
MIME-Version: 1.0
X-Received: by 10.112.136.163 with SMTP id qb3mr31111993lbb.14.1384365220793; 
	Wed, 13 Nov 2013 09:53:40 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Wed, 13 Nov 2013 09:53:40 -0800 (PST)
In-Reply-To: <1384334721-3625-1-git-send-email-riku.voipio@linaro.org>
References: <1384334721-3625-1-git-send-email-riku.voipio@linaro.org>
Date: Wed, 13 Nov 2013 12:53:40 -0500
Message-ID: <CADkTA4NVvGYJmPHqnmJdDXA7XtbCYEZhyX=D0ycrVGN=JDfrnQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] fix inittab install when Xen not in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 13 Nov 2013 17:53:44 -0000
Content-Type: text/plain; charset=ISO-8859-1

merged!

Bruce

On Wed, Nov 13, 2013 at 4:25 AM, Riku Voipio <riku.voipio@linaro.org> wrote:
> With the latest patch, OE builds may file like:
>
> https://ci.linaro.org/jenkins/job/openembedded-armv7ab-rootfs/gcc_version=4.8,label=oe_persistent_cloud,rootfs=minimal/127/consoleText
>
> By having the "failing" grep within the if block, set -e
> in shell code will not bite configurations where meta-virtualization
> is included but xen is not in DISTRO_FEATURES.
>
> Signed-off-by: Riku Voipio <riku.voipio@linaro.org>
> ---
>  recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> index 2edbedf..1b89aec 100644
> --- a/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> +++ b/recipes-core/sysvinit/sysvinit-inittab_2.88dsf.bbappend
> @@ -1,6 +1,5 @@
>  do_install_append() {
> -       echo "${DISTRO_FEATURES}" | grep -q 'xen'
> -       if [ $? -eq 0 ]; then
> +       if echo "${DISTRO_FEATURES}" | grep -q 'xen'; then
>                 echo "" >> ${D}${sysconfdir}/inittab
>                 echo "X0:12345:respawn:/sbin/getty 115200 hvc0" >> ${D}${sysconfdir}/inittab
>         fi
> --
> 1.8.3.1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

