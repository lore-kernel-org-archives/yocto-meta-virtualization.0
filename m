Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BBDFDE014C1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 05:54:45 -0700 (PDT)
Received: by mail-la0-f53.google.com with SMTP id fp13so391266lab.26
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=/te2pUqXugYVhGRceujDvISvliUOpjzDJq9f9ZkVBKE=;
	b=xeV6KGXWkW9Hl8XxImQ1U3MJqnX4N6RkIznoa5ej9JSAyXrIIeCgEpVFMD2Ej1y5k3
	swXYKISHZzgalu1bCmnLD8mFKSoIJeEUDODJ6ID7/PLe9oVbD2SUaeGkfonZC+990SDq
	CkpTVbjtz3cXtcR9sOjGrTZtmlTq64SkNTwg//1DlAUh8c17kurCSRFhEikDOyjwhjDW
	P/sQhB2NKPPVx025ketslmV15cqUqtEwyTrDD7WxQ4iqKjpyqDonvT5Kik9D5gwW+V0a
	LBJmElCbiuX2B7+h+5l5SA2WiuxPAXe7H2eBhzbUAQSQcKIUIBa5CNZJFW6y/SNi5/Tf
	ILnA==
MIME-Version: 1.0
X-Received: by 10.112.128.231 with SMTP id nr7mr1169280lbb.26.1365598481599;
	Wed, 10 Apr 2013 05:54:41 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 10 Apr 2013 05:54:41 -0700 (PDT)
In-Reply-To: <1365592743-24488-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1365586806-8155-1-git-send-email-bogdan.purcareata@freescale.com>
	<1365592743-24488-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Wed, 10 Apr 2013 08:54:41 -0400
Message-ID: <CADkTA4OTJH-deN7=zRkgSm9O=krEAhVHsAAmM2YYYFmO+iUkLw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add disable udhcp patch to LXC recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 12:54:46 -0000
Content-Type: text/plain; charset=ISO-8859-1

Can we get a long log here ? Why would we need to do this, and when ? What
is this trying to fix ? This is unconditionally applied, so it will
always be off .. that
alone warrants and explanation in the long log.

Bruce

On Wed, Apr 10, 2013 at 7:19 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...0.9.0-disable-udhcp-from-busybox-template.patch | 24 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>  2 files changed, 25 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
> new file mode 100644
> index 0000000..723be27
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
> @@ -0,0 +1,24 @@
> +From d7e07e7acb1cbad33806f49143a2a30b4468c369 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Mon, 8 Apr 2013 18:30:19 +0300
> +Subject: [PATCH] lxc-0.9.0-disable-udhcp-from-busybox-template
> +
> +---
> + templates/lxc-busybox.in | 1 -
> + 1 file changed, 1 deletion(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index cb425ec..bb8c951 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -84,7 +84,6 @@ EOF
> + #!/bin/sh
> + /bin/syslogd
> + /bin/mount -a
> +-/bin/udhcpc
> + EOF
> +
> +     # executable
> +--
> +1.7.11.7
> +
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 292285d..1d6ce71 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -22,6 +22,7 @@ RDEPENDS_${PN} = " \
>  "
>
>  SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
> +       file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
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

