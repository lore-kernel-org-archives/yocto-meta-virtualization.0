Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02F0EE01458
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 May 2013 18:41:16 -0700 (PDT)
Received: by mail-la0-f43.google.com with SMTP id ez20so8038161lab.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 28 May 2013 18:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Q2mhQ8IIBuRoq+lr1rjw13ZEj/WlroL2DVeYbKadmBw=;
	b=WJHZv9SdaHy2ffbrIkUD9uSdd4zzVPU8H5IXDcIGPpkjiAkG6G67m3QKyrfWrNfrfd
	YOHxlaDMzlAPBLjeHv8xkWfSm8yR9VsSPc+EGHUYIBMKO5guM2LFIlONd/Cb2ePf08CJ
	sVAejlj4tdtB6ckKLVCjIswih4i+zDuR2T0Ebko9Ld4fiVH+ffraLaSgaZ2NylqlRFAd
	exY/T5fd91JhJj2NMqF16erwdW1boONv+muUJ2TVqHfWAoBHa6dAS8ks3gjH6/eF4oHL
	2yngqgRleKibRKaedqWRMAW31B26bOVCvumJt4F6guJIMOHDMCnkQ9xm3C9e1egstJFl
	//1g==
MIME-Version: 1.0
X-Received: by 10.112.146.233 with SMTP id tf9mr504646lbb.33.1369791675432;
	Tue, 28 May 2013 18:41:15 -0700 (PDT)
Received: by 10.112.71.14 with HTTP; Tue, 28 May 2013 18:41:15 -0700 (PDT)
In-Reply-To: <1369782921-9572-1-git-send-email-jslater@windriver.com>
References: <1369782921-9572-1-git-send-email-jslater@windriver.com>
Date: Tue, 28 May 2013 21:41:15 -0400
Message-ID: <CADkTA4OhhOhetLGQr15e_SKd8xuJS5UFRFsvoXJj=k8yevCjxA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Joe Slater <jslater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, "Slater,
	Joseph" <joe.slater@windriver.com>
Subject: Re: [PATCH 1/1] libvirt: move libvirt-guests.sh to /etc/init.d
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
X-List-Received-Date: Wed, 29 May 2013 01:41:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 28, 2013 at 7:15 PM, Joe Slater <jslater@windriver.com> wrote:
> CQID: 418962
>
> The script does not seem to meet the definition
> of what should go into /usr/libexec and is a superset
> of a normal "service" script, so we move it to
> /etc/init.d.
>
> Signed-off-by: Joe Slater <jslater@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_1.0.3.bb |    6 +++++-
>  1 files changed, 5 insertions(+), 1 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index ea136bc..63fa598 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r3"
> +PR = "r5"

This won't apply as is. You need to cherry pick your patch onto the
top of meta-virt
master, and resend.

Yes, it's trivial for me to resolve, but it's good practice to have
your patches on the
tip of the branch.

Cheers,

Bruce

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

