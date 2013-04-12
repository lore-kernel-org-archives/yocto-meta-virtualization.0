Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1D1BE014DB
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 10:08:32 -0700 (PDT)
Received: by mail-lb0-f172.google.com with SMTP id u10so2852690lbi.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Apr 2013 10:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=lgpRjuRAOaplpGrU5pz99Ymx1KnLmsqRUi1hnqCjQFA=;
	b=sBocTseE9UvO3BYNcyynBQMYbQcc5Ux9jbbdejMePosaza1lZPOxoMNqNyxT2yd7TE
	caPFPmW9QC7uZGLZiZu3ka7KD1LLdg0GU4PpnX7VrOQOdFKvi2B8oAlYNTi2S599CRvp
	rCLDgNIvA3oORqeDP2ptLRQLpAlkMPp8Z5iQ2UAOaoycAyiWH4vmFixV5k8TFDW9Fz+/
	dawf5S77q6YUdTjIzOtZtZNDHUpzWvHwlNU4orMnUSQXeC+FWEEAiSFkXWIbkaGJz2GX
	eyPIR1OhPyLp4T5/VEBlTE+I8O6scW9MTyNg+0cTmHvTLAMILbYPycIZCb3/QoHDjT2D
	k7oA==
MIME-Version: 1.0
X-Received: by 10.112.136.33 with SMTP id px1mr5772542lbb.95.1365786511513;
	Fri, 12 Apr 2013 10:08:31 -0700 (PDT)
Received: by 10.112.75.161 with HTTP; Fri, 12 Apr 2013 10:08:31 -0700 (PDT)
In-Reply-To: <1365776519-8929-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1365776519-8929-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Fri, 12 Apr 2013 13:08:31 -0400
Message-ID: <CADkTA4NNG0C4mJa7Nt-Xz4QzL2JQDWEci14BjmgDo13oqJ8Enw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] containers - lxc-template: enable chroot + chpasswd functionality for Busybox hosts
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
X-List-Received-Date: Fri, 12 Apr 2013 17:08:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Apr 12, 2013 at 10:21 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> This patch enables installation of Buysbox containers on Busybox hosts.
> Please see patch message for detailed information.
>
> The patch has been submitted and accepted upstream by LXC maintainers.
> The functionality hasn't made it to LXC 0.9.0, but will (most probably)
> be included upstream in future releases of LXC.

Since you've already sent this upstream, I have no issues with merging the patch
here as well.

The only addition that I'd suggest is adding the yocto upstream-status
field to the
patch itself, so the state is clear. I can do that during merge,
rather than forcing
you to resend the series.

Cheers,

Bruce

>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...-chpasswd-functionality-for-busybox-hosts.patch | 70 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch b/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
> new file mode 100644
> index 0000000..d07c658
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
> @@ -0,0 +1,70 @@
> +From 4ddc14bd0866ff769421857044dd14867f1944d5 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Thu, 11 Apr 2013 16:15:43 +0300
> +Subject: [PATCH v2] lxc-template: enable chroot + chpasswd functionality for
> + Busybox hosts
> +
> +This patch supports the scenario where a user wants to install a
> +busybox container on a busybox host.
> +
> +When running the template, in order to change the root password,
> +the template needs to do the chroot. On busybox-powered hosts, chroot
> +is not part of the coreutils package - it's part of busybox. And the
> +busybox implementation or chroot only works if it has /lib in the new
> +root populated with the right binaries (or at least that's the
> +solution I found to make it work).
> +
> +The temporarily bind-mounts /lib in the NEWROOT, chroots there,
> +changes the password, goes back and unmounts. This set of operations
> +is contained in a new MOUNT namespace, using the lxc-unshare call.
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +---
> + templates/lxc-busybox.in | 30 ++++++++++++++++++++++++++++--
> + 1 file changed, 28 insertions(+), 2 deletions(-)
> +
> +diff --git a/templates/lxc-busybox.in b/templates/lxc-busybox.in
> +index cb425ec..2ca2bfd 100644
> +--- a/templates/lxc-busybox.in
> ++++ b/templates/lxc-busybox.in
> +@@ -189,9 +189,35 @@ configure_busybox()
> +     # passwd exec must be setuid
> +     chmod +s $rootfs/bin/passwd
> +     touch $rootfs/etc/shadow
> +-    echo "setting root passwd to root"
> +-    echo "root:root" | chroot $rootfs chpasswd
> +
> ++    # setting passwd for root
> ++    CHPASSWD_FILE=$rootfs/root/chpasswd.sh
> ++
> ++    cat <<EOF >$CHPASSWD_FILE
> ++echo "setting root password to \"root\""
> ++
> ++mount --bind /lib $rootfs/lib
> ++if [ \$? -ne 0 ]; then
> ++    echo "Failed bind-mounting /lib at $rootfs/lib"
> ++    exit 1
> ++fi
> ++
> ++chroot $rootfs chpasswd <<EOFF 2>/dev/null
> ++root:root
> ++EOFF
> ++
> ++
> ++if [ \$? -ne 0 ]; then
> ++    echo "Failed to change root password"
> ++    exit 1
> ++fi
> ++
> ++umount $rootfs/lib
> ++
> ++EOF
> ++
> ++    lxc-unshare -s MOUNT -- /bin/sh < $CHPASSWD_FILE
> ++    rm $CHPASSWD_FILE
> +
> +     # add ssh functionality if dropbear package available on host
> +     which dropbear >/dev/null 2>&1
> +--
> +1.7.11.7
> +
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index fcda0ba..63ce2d6 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -23,6 +23,7 @@ RDEPENDS_${PN} = " \
>
>  SRC_URI = "http://lxc.sourceforge.net/download/lxc/${PN}-${PV}.tar.gz \
>         file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
> +       file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
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

