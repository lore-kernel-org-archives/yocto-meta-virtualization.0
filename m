Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BF81E01466
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2013 06:11:18 -0700 (PDT)
Received: by mail-lb0-f169.google.com with SMTP id m4so929695lbo.28
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 Mar 2013 06:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=ijsbVu32UmAzFcbEFkq0/ccISzSSBK88Mlm1qnS7IME=;
	b=w9RgMR4grT1kM5nnP9J2sVq3/wjjBXxlX++p+wQ2S6sq4XK/qvbHXKT/KslV6U4SQz
	KiufkN4nZOq4k+kRL/hMPnfIAt35HhlfahQ+pwVyDBspRH6ZjDrGl3OC4hogQLKm5ucR
	P9X44EecjPIiAN0u6YGmnmtlemuJc5VDLQkgjPOMObPymuWTcmNz4YrSP0xqYjzEhaZT
	PRfjgLWbz7dGXKHHP7CjOZadIgrEoNAG+AsgWL7UqKC5LV23FWTzVVfH04uI7cxIw4Yc
	iLtTsP/O9vuCvC+NHMqGSUvnzXM5/m/0KaBEY8QAq0/irutgQfBWZmxPNQLJeL7FkK32
	f5Dg==
MIME-Version: 1.0
X-Received: by 10.152.132.170 with SMTP id ov10mr17450774lab.21.1363180276627; 
	Wed, 13 Mar 2013 06:11:16 -0700 (PDT)
Received: by 10.112.61.3 with HTTP; Wed, 13 Mar 2013 06:11:16 -0700 (PDT)
In-Reply-To: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
References: <1363152493-25261-1-git-send-email-hong-hua.yin@freescale.com>
Date: Wed, 13 Mar 2013 08:11:16 -0500
Message-ID: <CADkTA4N1wugSgFowPCCyjtcMVeGSrVOHO+CqUwO8KuuKutZ2nw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Olivia Yin <hong-hua.yin@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] libvirt: upgrade to 1.0.3
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
X-List-Received-Date: Wed, 13 Mar 2013 13:11:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Mar 13, 2013 at 12:28 AM, Olivia Yin <hong-hua.yin@freescale.com> wrote:
> Signed-off-by: Olivia Yin <hong-hua.yin@freescale.com>

Can you quickly summarize what testing was done with libvirt ? Just
so we can get a feel for the arches that have been covered, and what
functionality has been exercised.

Since this patch removes the 1.0 version, we won't have a fallback in
tree if things break.

Cheers,

Bruce

> ---
>  .../libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
>  rename recipes-extended/libvirt/{libvirt_1.0.0.bb => libvirt_1.0.3.bb} (97%)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.0.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> similarity index 97%
> rename from recipes-extended/libvirt/libvirt_1.0.0.bb
> rename to recipes-extended/libvirt/libvirt_1.0.3.bb
> index 90d7dbb..372e874 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.0.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -22,8 +22,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>         file://libvirtd.sh \
>         file://libvirtd.conf"
>
> -SRC_URI[md5sum] = "7c8b006de7338e30866bb56738803b21"
> -SRC_URI[sha256sum] = "14c8a30ebfb939c82cab5f759a95d09646b43b4210e45490e92459ae65123076"
> +SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
> +SRC_URI[sha256sum] = "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
>
>  inherit autotools gettext update-rc.d
>
> --
> 1.6.4
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

