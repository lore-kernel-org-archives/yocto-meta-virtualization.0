Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f178.google.com (mail-lb0-f178.google.com
	[209.85.217.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FDE1E014D0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 05:53:21 -0700 (PDT)
Received: by mail-lb0-f178.google.com with SMTP id q13so485328lbi.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Apr 2013 05:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=Nfh9IDPKW3tn+AsxCEbJjWwtwPQuYmaNF+fidNrRIbw=;
	b=AJICzwC40oS96kLSDHgnfZso4nSdnlunAwoCOK7j40esR48uKz48CIjFa9ANJYsPBo
	JcLMffmXMRVmDPkBP+PwF4Hnth1kVElrKBIf4HugIG75tDPbz9de00kRuce0PzjPAhgW
	wgAhJF+gyBHoFlfqVlPxHduMUTgSA9Q1SebQpNjFOe0t9YQZ/0Lkn0WB4qFIlUdZ5YLL
	zmqxmty7GoMzJWoBsqP5C3yDFK7NtHtBNFvA1pE7yYpdrE/5sMRgBeg4Qlvzw1gG79u2
	9f+MzR/7PIhy++ILC/ebD1gBaBHmCQOSuIzuIgSewolT2/KAH5q5+XD+FmyVYcByYUOj
	wmpw==
MIME-Version: 1.0
X-Received: by 10.112.132.166 with SMTP id ov6mr1146079lbb.71.1365598400178;
	Wed, 10 Apr 2013 05:53:20 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Wed, 10 Apr 2013 05:53:20 -0700 (PDT)
In-Reply-To: <1365587401-8284-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1365587401-8284-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Wed, 10 Apr 2013 08:53:20 -0400
Message-ID: <CADkTA4NmLke-mcwgVUXgcYacH0Bfy5Nn_ndLCqw7Ub-bGvdNbA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Add LXC 0.9.0 recipe
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
X-List-Received-Date: Wed, 10 Apr 2013 12:53:22 -0000
Content-Type: text/plain; charset=ISO-8859-1

Can we get a bit of a long log that describes how this was testing ? Or
an entry in the meta-virtualization/docs directory ?

There's no reason to keep this the existing recipe around, so the 0.8.0
recipe should be removed, and we can see the differences between the
two and ensure that functionality drops and adds are understood.

Cheers,

Bruce

On Wed, Apr 10, 2013 at 5:50 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> ---
>  recipes-containers/lxc/lxc_0.9.0.bb | 38 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
>
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> new file mode 100644
> index 0000000..292285d
> --- /dev/null
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -0,0 +1,38 @@
> +DESCRIPTION = "lxc aims to use these new functionnalities to provide an userspace container object"
> +SECTION = "console/utils"
> +LICENSE = "GPLv2"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
> +PRIORITY = "optional"
> +PR = "r1"
> +DEPENDS = "libxml2 libcap"
> +RDEPENDS_${PN} = " \
> +               rsync \
> +               gzip \
> +               libcap-bin \
> +               bridge-utils \
> +               dnsmasq \
> +               perl-module-strict \
> +               perl-module-getopt-long \
> +               perl-module-vars \
> +               perl-module-warnings-register \
> +               perl-module-exporter \
> +               perl-module-constant \
> +               perl-module-overload \
> +               perl-module-exporter-heavy \
> +"
> +
> +SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
> +       "
> +SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
> +SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
> +
> +S = "${WORKDIR}/${PN}-${PV}"
> +
> +PACKAGECONFIG ??= ""
> +PACKAGECONFIG[doc] = "--enable-doc,--disable-doc"
> +PACKAGECONFIG[rpath] = "--enable-rpath,--disable-rpath"
> +PACKAGECONFIG[apparmour] = "--enable-apparmor,--disable-apparmor,apparmor,apparmor"
> +
> +inherit autotools
> +
> +FILES_${PN}-dbg += "${libexecdir}/lxc/.debug"
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

