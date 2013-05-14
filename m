Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4C296E014FF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 06:25:15 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id fo13so527294lab.11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 May 2013 06:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=IkPRRex6M1vN3c3ftVfcdVny7CR6gyK/VhoUj2Tt3kE=;
	b=kFFsp+gd9XOrN/S6jcmL45Ptrb1W78q3FfoSBQwIpSztWek7nBS0JL8AEmPfS0i2ej
	z3ZPbppJfLbG8SOpKYdPDzj8rWZqK0Hk9ZEjNdLk3GkKLOAXdVaai5yKHRYnG0xMOFNU
	DUEope6EDSGWnJXJq3dneX2CYVsxxMARwOfNakoSw0PvBd2hPQD7np6N8mGWhph8d2EU
	xCw0aK6SFAf5xfyoMdxaSa16joCsq7eA2m73xyUvVbYR3ebc6zRsYC9Gz252GMjVt+aK
	kzo4PC7C7yY3/DpAnnEaaJ8fU5t2987FTpyS1SxIGN4y7wGqS10e6Kt/IQ6FgMmjG1RX
	Nugg==
MIME-Version: 1.0
X-Received: by 10.112.159.136 with SMTP id xc8mr15046343lbb.57.1368537912848; 
	Tue, 14 May 2013 06:25:12 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Tue, 14 May 2013 06:25:12 -0700 (PDT)
In-Reply-To: <1368524486-30880-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1368524486-30880-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Tue, 14 May 2013 09:25:12 -0400
Message-ID: <CADkTA4NYfBWHsP2a+U0=u1+Ab0=5aVZNsLPRLTaGckJ+65r-_g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc-busybox: check when bind-mounting host libdirs
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
X-List-Received-Date: Tue, 14 May 2013 13:25:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

FYI: your local gitconfig is picking up your login ID as the sender, I changed
the reply manually.

On Tue, May 14, 2013 at 5:41 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> The patch checks bind mounting lib directories when starting a
> busybox container on a 64bit platform. Some entries in the host
> filesystem are not present but the busybox template expects them
> to be there, and thus container start fails.

Looks sensible/reasonable to me. I haven't run into this myself, probably just
by luck!

I'll wait a bit for more comments, but will push the change after that.

Bruce

>
> Please see further details in added patch description.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...xc-0.9.0-check-when-bind-mounting-libdirs.patch | 44 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>  2 files changed, 45 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch b/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
> new file mode 100644
> index 0000000..4d21a02
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
> @@ -0,0 +1,44 @@
> +From 9e74f8161b8db05365fde0646b0c29c852afc3a0 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Tue, 14 May 2013 11:54:23 +0300
> +Subject: [PATCH] lxc-busybox: check when bind-mounting host libdirs
> +
> +The patch changes the busybox template behavior to automatically
> +mount /lib and /usr/lib. In case one of these folders does not exist,
> +starting the container will fail. Also, if there are other lib entries
> +on the host - e.g. /usr/lib64 -  mount them as well.
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + templates/lxc-busybox.in | 8 +-------
> + 1 file changed, 1 insertion(+), 7 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index cb425ec..49effae 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -240,13 +240,6 @@ lxc.pts = 1
> + #lxc.aa_profile = unconfined
> + EOF
> +
> +-if [ -d "$rootfs/lib" ]; then
> +-cat <<EOF >> $path/config
> +-lxc.mount.entry = /lib $rootfs/lib none ro,bind 0 0
> +-lxc.mount.entry = /usr/lib $rootfs/usr/lib none ro,bind 0 0
> +-EOF
> +-fi
> +-
> +     libdirs="\
> +         lib \
> +         usr/lib \
> +@@ -255,6 +248,7 @@ fi
> +
> +     for dir in $libdirs; do
> +         if [ -d "/$dir" ] && [ -d "$rootfs/$dir" ]; then
> ++            echo "lxc.mount.entry = /$dir $rootfs/$dir none ro,bind 0 0" >> $path/config
> +             echo "lxc.mount.entry = /$dir $dir none ro,bind 0 0" >> $path/config
> +         fi
> +     done
> +--
> +1.7.11.7
> +
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 63ce2d6..1cbbad0 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -24,6 +24,7 @@ RDEPENDS_${PN} = " \
>  SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
>         file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>         file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
> +    file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
>         "
>  SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
>  SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
> --
> 1.7.11.7
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

