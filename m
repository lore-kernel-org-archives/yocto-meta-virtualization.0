Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94492E014FD
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2013 19:32:17 -0700 (PDT)
Received: by mail-lb0-f177.google.com with SMTP id o10so59272lbi.22
	for <meta-virtualization@yoctoproject.org>;
	Wed, 29 May 2013 19:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=fGWgANNwO1EBOjSzWPjiJit5+47NolMqvWbOq5/cfIg=;
	b=DbS6tFoCni5jUZ3l0C0KuKQ3EEiJT/CEY1sp6hlgXc8fsyowyAMdFxrTzibhWSr7Q1
	zyJZ6oKHjgvBCNSC2Z0oVoEoHaALT1K5hXVKMfCI378oeTRWH/N4i2SWHwjTES5Iuf8e
	yA/9vhd6aFPQXBlkABg4q6bY8Zwa1DzFivgfGt+dbUegkR9U4FJmpvUMpjfsS6nK+MnP
	2OGoo+vGH2ybmqQb3lQKkT4INjO3cEC5OYizqGPblgQ43ze2+lVG4KkN4RHvsRYnqRAI
	pg9KGL4ykSgnU0Am0nqIdRWXOVtlbVjwl4r2MaQAwE2It5S7enL1IYKJFFk/ruEEqP5Q
	G/sQ==
MIME-Version: 1.0
X-Received: by 10.112.35.165 with SMTP id i5mr2746992lbj.17.1369881136518;
	Wed, 29 May 2013 19:32:16 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Wed, 29 May 2013 19:32:16 -0700 (PDT)
In-Reply-To: <1369858596-719-1-git-send-email-jslater@windriver.com>
References: <1369858596-719-1-git-send-email-jslater@windriver.com>
Date: Wed, 29 May 2013 22:32:16 -0400
Message-ID: <CADkTA4MPRP_r5J60xi34vbGxovdBu48BUTX7rDU5TZg5nJpv6g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [v2][PATCH 1/1] libvirt: move libvirt-guests.sh to /etc/init.d
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
X-List-Received-Date: Thu, 30 May 2013 02:32:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, May 29, 2013 at 4:16 PM, Joe Slater <jslater@windriver.com> wrote:
> CQID: 418962
>
> The script does not seem to meet the definition
> of what should go into /usr/libexec and is a superset
> of a normal "service" script, so we move it to
> /etc/init.d.

Thanks Joe. I've grabbed the patch, it'll go out soon.

Bruce

>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 989b8b1..9ced413 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r4"
> +PR = "r5"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline"
> @@ -146,4 +146,8 @@ do_install_append() {
>
>         install -m 0755 ${WORKDIR}/libvirtd.sh ${D}/etc/init.d/libvirtd
>         install -m 0644 ${WORKDIR}/libvirtd.conf ${D}/etc/libvirt/libvirtd.conf
> +
> +       # This will wind up in the libvirtd package, but will NOT be invoked by default.
> +       #
> +       mv ${D}/usr/libexec/libvirt-guests.sh ${D}/${sysconfdir}/init.d
>  }
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

