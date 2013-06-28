Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4FD1E00348
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 11:10:04 -0700 (PDT)
Received: by mail-la0-f49.google.com with SMTP id ea20so2424313lab.22
	for <meta-virtualization@yoctoproject.org>;
	Fri, 28 Jun 2013 11:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LLrwXVDnYSAUkSAoTVR/Rx7HUGsTDvcm3XG85YlcCjw=;
	b=rzldcgVXRXOyBDTaAocvKx+WNBcaYECXVPnQwQ9zGot2SlhrqokfDAHq3y+xd37vgN
	gpQp0KdydEnFBYhBSGdSpYCTfnhdXhPZHx11S5weU+2dSsskRbVvKuWWRcqV/XqcsY11
	vwyO3bAFVy8iAiZHgqJj/PUf7q+DlObyF4tJf2AXjHCfgr3FH2kT3Dvxoxyrnc1TAMnv
	r1vhZnC/JikAV0QgrHAdeJUqbIf8GpYLHGZoKneNqGTv6ZCQIouIbDk1FbJwboSh9M49
	4pEiLG4rEF2yNCkyoq56sfCgHOYWwfw6nvD7GTY3rIPPssVCpThEe+NBKUG1A4WiD2CF
	MU8w==
MIME-Version: 1.0
X-Received: by 10.152.23.168 with SMTP id n8mr6949327laf.88.1372443003439;
	Fri, 28 Jun 2013 11:10:03 -0700 (PDT)
Received: by 10.112.133.234 with HTTP; Fri, 28 Jun 2013 11:10:03 -0700 (PDT)
In-Reply-To: <1372440363-25329-1-git-send-email-mark.asselstine@windriver.com>
References: <1372440363-25329-1-git-send-email-mark.asselstine@windriver.com>
Date: Fri, 28 Jun 2013 14:10:03 -0400
Message-ID: <CADkTA4NFjNZpvRObzff38HC8bDX1PSDG5skSApaUW6m6cGxnwA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/3] libvirt: fix libvirtd crash if path part of URI is missing
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
X-List-Received-Date: Fri, 28 Jun 2013 18:10:08 -0000
Content-Type: text/plain; charset=ISO-8859-1

Merged these three and the dangling single patch!

Bruce

On Fri, Jun 28, 2013 at 1:26 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> From: thomas tai <ttai@ala-lpd-test3.wrs.com>
>
> If the user forgets to include the path portion of the URI, instead of
> receiving an error message, libvirtd crashes.
>
> So for example attempting to make this call will cause libvirtd to
> fall over.
>
> virsh -c qemu+ssh://root@my.host.com list
> (forgetting the trailing /system after the host name)
>
> The reason for the crash is that libvirtd is trying to output an error
> message with a uninitialized variable. This problem is already fixed
> in the upstream so applying this fix to our tree allows this issue to
> be avoided.
>
> Signed-off-by: Thomas Tai <thomas.tai@windriver.com>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  .../libvirt/qemu-fix-crash-in-qemuOpen.patch       | 39 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_1.0.3.bb          |  5 +--
>  2 files changed, 42 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
>
> diff --git a/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch b/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
> new file mode 100644
> index 0000000..3cf9e83
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/qemu-fix-crash-in-qemuOpen.patch
> @@ -0,0 +1,39 @@
> +From 74bff2509080912ea8abf1de8fd95fa2412b659a Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?J=C3=A1n=20Tomko?= <jtomko@redhat.com>
> +Date: Thu, 11 Apr 2013 11:37:25 +0200
> +Subject: [PATCH] qemu: fix crash in qemuOpen
> +
> +commit 74bff2509080912ea8abf1de8fd95fa2412b659a from upsteam
> +git://libvirt.org/libvirt.git
> +
> +If the path part of connection URI is not present, cfg is used
> +unitialized.
> +
> +https://bugzilla.redhat.com/show_bug.cgi?id=950855
> +---
> + src/qemu/qemu_driver.c |    2 +-
> + 1 files changed, 1 insertions(+), 1 deletions(-)
> +
> +diff --git a/src/qemu/qemu_driver.c b/src/qemu/qemu_driver.c
> +index 2c0d7d1..0d41e39 100644
> +--- a/src/qemu/qemu_driver.c
> ++++ b/src/qemu/qemu_driver.c
> +@@ -1026,6 +1026,7 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
> +             goto cleanup;
> +         }
> +
> ++        cfg = virQEMUDriverGetConfig(qemu_driver);
> +         if (conn->uri->path == NULL) {
> +             virReportError(VIR_ERR_INTERNAL_ERROR,
> +                            _("no QEMU URI path given, try %s"),
> +@@ -1033,7 +1034,6 @@ static virDrvOpenStatus qemuOpen(virConnectPtr conn,
> +             goto cleanup;
> +         }
> +
> +-        cfg = virQEMUDriverGetConfig(qemu_driver);
> +         if (cfg->privileged) {
> +             if (STRNEQ(conn->uri->path, "/system") &&
> +                 STRNEQ(conn->uri->path, "/session")) {
> +--
> +1.7.1
> +
> diff --git a/recipes-extended/libvirt/libvirt_1.0.3.bb b/recipes-extended/libvirt/libvirt_1.0.3.bb
> index 768ccc8..845baf5 100644
> --- a/recipes-extended/libvirt/libvirt_1.0.3.bb
> +++ b/recipes-extended/libvirt/libvirt_1.0.3.bb
> @@ -3,7 +3,7 @@ HOMEPAGE = "http://libvirt.org"
>  LICENSE = "GPLv2+"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=fb919cc88dbe06ec0b0bd50e001ccf1f"
>  SECTION = "console/tools"
> -PR = "r6"
> +PR = "r7"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables ebtables dnsmasq readline"
> @@ -25,7 +25,8 @@ RCONFLICTS_${PN}_libvirtd = "connman"
>  SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.gz \
>    file://libvirt-1.0.3-fix-thread-safety-in-lxc-callback-handling.patch \
>         file://libvirtd.sh \
> -       file://libvirtd.conf"
> +       file://libvirtd.conf \
> +       file://qemu-fix-crash-in-qemuOpen.patch "
>
>  SRC_URI[md5sum] = "3d9f85d586c9aa3d819b626622f3fc97"
>  SRC_URI[sha256sum] = "f64f4acd7cdcfc6ab5e803195ed58b949f262b54e3659d8c37b33f0fec112757"
> --
> 1.8.1.2
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

