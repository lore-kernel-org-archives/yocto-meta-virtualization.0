Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E6BF3E006BF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2013 18:14:57 -0700 (PDT)
Received: by mail-lb0-f173.google.com with SMTP id t10so1490232lbi.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 21 May 2013 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=hgs1TFOXp0eybnvgdgNqbBT2jXMeK8B4IDT5kgMB/Bw=;
	b=klWuDntB2IfwNpB9ibJlKpI6/NEvQFviAn0VMF/R8o5d8yJozPTwIEZNz1j0qR+kZu
	l+RUG3wS4PQfMkOt4DC00bez6W56RcgvBbZisT2OnggmQLrC56x/QOO/MGKgzZxz6CJu
	ZfMe84N3tIF5ADhbg2fHvL2sY15AUlLuadWHH0fnl3jl61rbPzr9ZX2wlWuAVzW9ua3q
	KVvICyhFhJ2ifOeYi35D4WGdo/qwE/FJq1uELEQ8GpePL0jBRvHIGMnpLMMAyxn329/v
	eGNvbibEcok90SZj4JF8bbhEvuMZyFPJWggzkR7fSGxU3W3Yre/avfsnZwXP2WNp4GiQ
	M+0A==
MIME-Version: 1.0
X-Received: by 10.112.88.133 with SMTP id bg5mr2661775lbb.109.1369185296431;
	Tue, 21 May 2013 18:14:56 -0700 (PDT)
Received: by 10.112.162.136 with HTTP; Tue, 21 May 2013 18:14:56 -0700 (PDT)
In-Reply-To: <1369091230-6272-1-git-send-email-jslater@windriver.com>
References: <1369091230-6272-1-git-send-email-jslater@windriver.com>
Date: Tue, 21 May 2013 21:14:56 -0400
Message-ID: <CADkTA4MUOUbszU=8Bm782+2f2+krOBg==ugKjTC-s87zooFKOg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH 1/1] libvirt: add RDEPENDS on gettext-runtime
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
X-List-Received-Date: Wed, 22 May 2013 01:14:58 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, May 20, 2013 at 7:07 PM, Joe Slater <jslater@windriver.com> wrote:
> The libvirt-guests script needs gettext.sh which is
> in the gettext-runtime package.

merged!

Bruce

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 0364421..049166d 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r3"
> +PR = "r4"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline"
> @@ -11,6 +11,10 @@ DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux
>  # These might be included by PACKAGECONFIG
>  #RRECOMMENDS+= "polkit qemu yajl libnl lxc netcf"
>
> +# libvirt-guests.sh needs gettext.sh
> +#
> +RDEPENDS_${PN} = "gettext-runtime"
> +
>  RDEPENDS_libvirt-libvirtd += "bridge-utils iptables pm-utils dnsmasq netcat-openbsd"
>  RDEPENDS_libvirt-libvirtd_append_x86-64 = " dmidecode"
>  RDEPENDS_libvirt-libvirtd_append_x86 = " dmidecode"
> --
> 1.7.3.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

