Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60AB4E008F9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:20 -0800 (PST)
Received: by mail-la0-f54.google.com with SMTP id mc6so956959lab.41
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 11:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pM5Yt8Pjd+yD64VT5B6BmDbFmeR7NyG6tjraV+8akk0=;
	b=az09UnfC3q73QRF5nT6VL7kLX5BN/SLR1f+lpcc3QVnTKSmliFXLFjNPgbuDRTllJD
	nbh81GJgMUauY/TM7igFyU64/2u0FOpiPgOkxcBCEvhT+SABqRZmTsahVHGtxHvDU9Y3
	suwVuOaafiY1cfdile7C4cRqqG18JVtgJ6nG78PG+PCbzH1ODaXTxgVbVpCn1FxQQIz1
	QX9F9AqTjgSLUDtZRDQPwy3E/RIAA1m0ZM7sIWlyoFh9XrF6rrX7eUrt2Pk2kDX2lked
	RIIzmXR6fsZaikxT1EFFoAz7Rv6tzNEE3L+Gb+bQFUya94QTBqkvKNsYc8M4trxmtORF
	53VA==
MIME-Version: 1.0
X-Received: by 10.112.202.36 with SMTP id kf4mr2177684lbc.66.1393443319006;
	Wed, 26 Feb 2014 11:35:19 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Wed, 26 Feb 2014 11:35:18 -0800 (PST)
In-Reply-To: <1393409277-17451-5-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
	<1393409277-17451-5-git-send-email-jonas.eriksson@enea.com>
Date: Wed, 26 Feb 2014 14:35:18 -0500
Message-ID: <CADkTA4MLq+++C73-kBM9eFtyC-uBM_Wkfoj8Ar8YGWSnBpmThQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Jonas Eriksson <jonas.eriksson@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 4/5] libvirt: Use DISTRO_FEATURES to enable Xen support
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
X-List-Received-Date: Wed, 26 Feb 2014 19:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 26, 2014 at 5:07 AM, Jonas Eriksson <jonas.eriksson@enea.com> wrote:
> The Xen drivers in libvirt is needed when the build file system image
> and kernel are running as dom0. The parts of the kernel needed to run as
> dom0 are controlled by DISTRO_FEATURES, and thus there is no need for
> the Xen drivers if DISTRO_FEATURES does not contain 'xen'.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

>
> Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
> ---
>  recipes-extended/libvirt/libvirt_1.2.1.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
> index dbc6ef3..a75cc45 100644
> --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
> +++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
> @@ -109,10 +109,11 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>  #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>
>  # full config
> -PACKAGECONFIG ??= "qemu yajl xen libxl xen-inotify uml openvz vmware vbox esx iproute2 \
> -                   polkit test remote macvtap libvirtd netcf udev python ebtables \
> +PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit test \
> +                   remote macvtap libvirtd netcf udev python ebtables \
>                     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'lxc', 'lxc', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
>                    "
>
>  # enable,disable,depends,rdepends
> --
> 1.9.rc1
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

