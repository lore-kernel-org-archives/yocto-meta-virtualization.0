Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 1123EE0051D
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:13:54 -0700 (PDT)
Received: by mail-lb0-f180.google.com with SMTP id o10so3577072lbi.25
	for <meta-virtualization@yoctoproject.org>;
	Thu, 16 May 2013 14:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=PNTVZ2TogqtsxWH+YoRu9DQpUWiM2s65/d42Eutceqc=;
	b=gX4YvCBqeC+pBSXS8IbDlnEH7oXkeodQkSKN1Aww+bG7DRmP1MqVT9jaeOyow7s/mP
	Ac9iFWfGJfDCTbiBhupggxYHx9FVm8ucrTQhI5cyCeWEeBUM7tjISip8EpLAeqHRGSsH
	9zLSlxy0wZAiE1X0C0/favV4i9P4O3wP3VLxTUZAXYEXv6yi32rwUIVAfgbfu71ZSUk6
	cB4hvSDgssBKA5VfOYm8Fob0eiFUCd0cfN3paeU5QJjLjyfsSFhVn3SIur8N31R4nCTr
	6MesrDt0+7i1WTiCRjafDuu4gRZnsx84W/Qr2TQzp6FGAtPxpqj0b/rtqqvPY6t69uCT
	hNug==
MIME-Version: 1.0
X-Received: by 10.112.158.71 with SMTP id ws7mr16680436lbb.49.1368738833947;
	Thu, 16 May 2013 14:13:53 -0700 (PDT)
Received: by 10.112.234.166 with HTTP; Thu, 16 May 2013 14:13:53 -0700 (PDT)
In-Reply-To: <1368695397-23171-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1368695397-23171-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Thu, 16 May 2013 17:13:53 -0400
Message-ID: <CADkTA4NH4VB5_Yu9fChMGZbhiNj2t2uZwr4Lj6+cXRTwjUZ-BQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc-clone: don't let LXC_PATH end in failure
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
X-List-Received-Date: Thu, 16 May 2013 21:13:55 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, May 16, 2013 at 5:09 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> This patch has been included in the upstream repo as the first
> patch after LXC 0.9.0 release. Including it in meta-virtualization
> for proper functioning of the lxc-clone command.

I've grabbed and staged this change. I'll push it tomorrow if no one
objects.

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch | 29 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>  2 files changed, 30 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch b/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
> new file mode 100644
> index 0000000..fe9f8cc
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
> @@ -0,0 +1,29 @@
> +From fd95f2402dc70ad41fa2db8fb101f950196458a9 Mon Sep 17 00:00:00 2001
> +From: Serge Hallyn <serge.hallyn@ubuntu.com>
> +Date: Tue, 9 Apr 2013 16:23:05 -0500
> +Subject: [PATCH] lxc.functions: don't let LXC_PATH= line end in failure
> +
> +Otherwise if called from dash with set -e, dash will exit.  This
> +causes lxc-clone to fail.
> +
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/lxc.functions.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/lxc/lxc.functions.in b/src/lxc/lxc.functions.in
> +index b41f9b8..aa5717d 100644
> +--- a/src/lxc/lxc.functions.in
> ++++ b/src/lxc/lxc.functions.in
> +@@ -26,7 +26,7 @@ templatedir=@LXCTEMPLATEDIR@
> + lxcinitdir=@LXCINITDIR@
> +
> + get_default_lxcpath() {
> +-      LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=")
> ++      LXC_PATH=$(grep -v "^#" "$globalconf" 2>/dev/null | grep "[ \t]*lxcpath[ \t]*=") || true
> +       if [ -n "$LXC_PATH" ]; then
> +               echo $LXC_PATH | awk -F= '{ print $2 }'
> +       else
> +--
> +1.7.11.7
> +
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 1cbbad0..bed7e4a 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -25,6 +25,7 @@ SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
>         file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>         file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
>      file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
> +    file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
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

