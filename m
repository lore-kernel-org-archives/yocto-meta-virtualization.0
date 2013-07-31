Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 35628E002F9
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2013 20:00:19 -0700 (PDT)
Received: by mail-la0-f53.google.com with SMTP id el20so112404lab.26
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2013 20:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BleNJX0ONzChQWW3OaMrmGZDOpPDjNP4fLkXzHyOKsw=;
	b=gKqAolqr2F8acheImIOewbroKsSEAvVvRB3ztOvF1LFFnzSXPKlirEYXmVHqB5s7U5
	eoQczUQ2FFOUi9ZXHouPnpcXLFs9mL+YjwxsUvkhxo4c5OmAqoyPvNg32Hl2A4/RiMG1
	ah/MYNzOKZ2x8nObSP2/wMRVpOAaB/CGgywn0W5ksjT2jW0sMCufFdxLRowdgEKo7qva
	mg3FTuZwMA598o0PaccYBVj0OK5pezVD+/b/lg8aC/AIPy47cGlgNBTSEXA/p5mcgkMZ
	PWckjA7TtIBc8nTc5iG3hxgAN4gqWOsgEw3Q+iveLmfmZ9n75X5LB0QIRXsZdi5SGoHz
	VNpA==
MIME-Version: 1.0
X-Received: by 10.152.8.72 with SMTP id p8mr30692733laa.70.1375239617891; Tue,
	30 Jul 2013 20:00:17 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Tue, 30 Jul 2013 20:00:17 -0700 (PDT)
In-Reply-To: <1374847253-18653-1-git-send-email-mihai.prica@intel.com>
References: <1374847253-18653-1-git-send-email-mihai.prica@intel.com>
Date: Tue, 30 Jul 2013 23:00:17 -0400
Message-ID: <CADkTA4NLmeHOckbWP7AtVdPe-05GwEWyFXDaA459EVM=iDemsQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mihai Prica <mihai.prica@intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] openvswitch: Add coreutils runtime dependency
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
X-List-Received-Date: Wed, 31 Jul 2013 03:00:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 26, 2013 at 10:00 AM, Mihai Prica <mihai.prica@intel.com> wrote:
> The install and nice programs from coreutils are required by openvswitch.
>

Sorry for the delay.

merged.

Bruce

> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
> ---
>  .../openvswitch/openvswitch_1.10.0.bb              |    4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> index 2e9506f..fff597c 100644
> --- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> +++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
> @@ -6,7 +6,7 @@ LICENSE = "Apache-2"
>
>  DEPENDS += "bridge-utils openssl python perl"
>
> -RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid \
> +RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
>                python perl perl-module-strict ${PN}-switch ${PN}-controller"
>  RDEPENDS_${PN}-controller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
> @@ -14,7 +14,7 @@ RDEPENDS_${PN}-pki = "${PN}"
>  RDEPENDS_${PN}-brcompat = "${PN} ${PN}-switch"
>  RRECOMMENDS_${PN} += "kernel-module-openvswitch"
>
> -PR = "r0"
> +PR = "r1"
>
>  SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
>         file://openvswitch-switch \
> --
> 1.7.9.5
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

