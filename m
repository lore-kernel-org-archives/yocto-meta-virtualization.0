Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8CEC4E00799
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:47:26 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id y1so6205984lam.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Feb 2014 12:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=UguX+tvPIdZ+X9G0oUI0luqxvbim750kuTNbIaxiHts=;
	b=R4Yms3j40Z1PFcXdSh5wJ34GYWVBJu+bCxrJKuMt+YUKJOqSYw1NTGzQoEQ6AUQ6vy
	ZTGGQometXvPx+Fpl8JhD1M5n+gIi6GUknCEBsu2fhaIOemHA2AdX0U28w9ob12laHb3
	sqkdNmP3U+B9U4Lynu4i1FggLyvbHBaY+pnpCWyWszs4kIRu/7WIRxTonffK82OePrGV
	wCejN/lGKYwLvflykhj9HaoJJ6HuDif3tfoNbPRPqTNZNlZF7B0uzgqAp6pVk/bWR77O
	3Buvl4HfZy6z9W6fiiPZyqGrDojSgkEghn7g9zTT1ziYIglc4iJQVII1MF2V3fnV0+Oe
	OAlw==
MIME-Version: 1.0
X-Received: by 10.152.164.199 with SMTP id ys7mr12261494lab.31.1392151645883; 
	Tue, 11 Feb 2014 12:47:25 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Tue, 11 Feb 2014 12:47:25 -0800 (PST)
In-Reply-To: <1392120846-28138-1-git-send-email-flihp@twobit.us>
References: <CABZSBQdi7nw7g4mwHV+pxv23ynLVtkT4vhzp25RgqiLT+kN4ag@mail.gmail.com>
	<1392120846-28138-1-git-send-email-flihp@twobit.us>
Date: Tue, 11 Feb 2014 15:47:25 -0500
Message-ID: <CADkTA4MQ9n=yhemgzohfuUxASbHfP=hLcRw86T4XnorSFig_pw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Philip Tricca <flihp@twobit.us>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: Remove dependency on python-setuptools-native.
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
X-List-Received-Date: Tue, 11 Feb 2014 20:47:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 11, 2014 at 7:14 AM, Philip Tricca <flihp@twobit.us> wrote:
> oe-core fixed some overlap between the python-setuptools-native and
> python-distribute-native recently. This made python-setuptools
> obsolite. See: http://patchwork.openembedded.org/patch/66085/
> The Xen recipe already DEPENDS on python-distribute-native by
> inheriting setuptools so we only need to remove the dependency on
> python-setuptools-native.

merged

Bruce

>
> Signed-off-by: Philip Tricca <flihp@twobit.us>
> ---
>  recipes-extended/xen/xen.inc |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
> index e0d01a5..b238ddb 100644
> --- a/recipes-extended/xen/xen.inc
> +++ b/recipes-extended/xen/xen.inc
> @@ -17,7 +17,7 @@ PACKAGECONFIG ??= " \
>  PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>  PACKAGECONFIG[xsm] = "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
>
> -DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python python-setuptools-native xz xz-native glib-2.0"
> +DEPENDS = "util-linux util-linux-native file-native zlib ncurses openssl bison-native flex-native gettext dev86-native iasl-native pciutils bridge-utils iproute2 procps yajl pixman python xz xz-native glib-2.0"
>
>  # inherit setuptools adds python to RDEPENDS, override it
>  RDEPENDS_${PN} = ""
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

