Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0528E0162E
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2013 21:01:14 -0800 (PST)
Received: by mail-la0-f49.google.com with SMTP id er20so2311507lab.22
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2013 21:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f//hZpJvm78STkGeYiW2DaV3TLnl8W5kEADcLgh6Gdk=;
	b=Vv/zLsoKcLw3wyHMNN3l/HZLRbrJDCdsDdq11qu5f5n7ttvnKhewNEscmCJ/fVuh70
	pBVMRHnLtJRGJxFk7B7q/m/vrnVpD52VxmZvhJ158Hb2TTBFTWDTSEwgHUHdlUkibUEb
	cFw+Hiepj+J7XFC1x1MtJ3tT4v6ySlBwD3n+Q44IFKU9DBV3UGQWnS3VDCe64JYsMU3v
	JZd6h7OzMmCpf5/QX2tMqqR9r5jwPEt5NF4DdHKdXo96gnhmaeym3b64C2LNYXJrcX9T
	7MJTg0QGgj4sqXJHrq67oPMI4Fpy8sRYZOnkSCpIuJ3V1FRVYIwm8k4AuouLoOsg6Twg
	lWRw==
MIME-Version: 1.0
X-Received: by 10.112.136.163 with SMTP id qb3mr2811181lbb.14.1384491673579;
	Thu, 14 Nov 2013 21:01:13 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Thu, 14 Nov 2013 21:01:13 -0800 (PST)
In-Reply-To: <1384445080-1030-1-git-send-email-bogdan.purcareata@freescale.com>
References: <1384445080-1030-1-git-send-email-bogdan.purcareata@freescale.com>
Date: Fri, 15 Nov 2013 00:01:13 -0500
Message-ID: <CADkTA4OpaC8DBOz0dXY=gOcnLPU=ViY-DAK1V3d-_KP8H_NRaw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Bogdan Purcareata <bogdan.purcareata@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] LXC: setup_netdev: re-read ifindex in LXC_NET_PHYS case
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
X-List-Received-Date: Fri, 15 Nov 2013 05:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 14, 2013 at 11:04 AM, Bogdan Purcareata
<bogdan.purcareata@freescale.com> wrote:
> Patch to fix interface netns transition when
> assigning a physical interface to a container.
> Pushed to the upstream LXC repo, to be included
> in future versions of LXC.

Looks fine to me.

merged.

Bruce

>
> Further details in included patch description.
>
> Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> ---
>  ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch | 49 ++++++++++++++++++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |  5 ++-
>  2 files changed, 52 insertions(+), 2 deletions(-)
>  create mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
>
> diff --git a/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch b/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
> new file mode 100644
> index 0000000..5cebb50
> --- /dev/null
> +++ b/recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
> @@ -0,0 +1,49 @@
> +From 8712c58ab896f072cf95e3ffa3ceac1fa10f6295 Mon Sep 17 00:00:00 2001
> +From: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Date: Thu, 14 Nov 2013 12:31:55 +0200
> +Subject: [PATCH] setup_netdev: re-read ifindex in LXC_NET_PHYS case
> +
> +When moving an interface from the host netns to a container's,
> +the ifindex might not remain the same. This happens when the
> +index of the host interface is already assigned to another interface
> +in the new netns.
> +
> +For veth/vlan/macvlan, virtual interfaces are first created on the host,
> +and then moved in the container. Since they are created after all other
> +interfaces are discovered, there is no chance for its assigned ifindex
> +to be already present in a freshly created netns, since its a greater
> +number.
> +
> +However, when moving a physical interface, there is a chance that its
> +ifindex in the host netns is not free in the new netns. The patch
> +forces ifindex re-read for the LXC_NET_PHYS case to update the
> +lxc_netdev structure.
> +
> +Signed-off-by: Bogdan Purcareata <bogdan.purcareata@freescale.com>
> +Signed-off-by: Serge Hallyn <serge.hallyn@ubuntu.com>
> +---
> + src/lxc/conf.c | 8 ++++++++
> + 1 file changed, 8 insertions(+)
> +
> +diff --git a/src/lxc/conf.c b/src/lxc/conf.c
> +index 6b3f318..08b0d0f 100644
> +--- a/src/lxc/conf.c
> ++++ b/src/lxc/conf.c
> +@@ -1846,6 +1846,14 @@ static int setup_netdev(struct lxc_netdev *netdev)
> +               return 0;
> +       }
> +
> ++      /* get the new ifindex in case of physical netdev */
> ++      if (netdev->type == LXC_NET_PHYS)
> ++              if (!(netdev->ifindex = if_nametoindex(netdev->link))) {
> ++                      ERROR("failed to get ifindex for %s",
> ++                              netdev->link);
> ++                      return -1;
> ++              }
> ++
> +       /* retrieve the name of the interface */
> +       if (!if_indextoname(netdev->ifindex, current_ifname)) {
> +               ERROR("no interface corresponding to index '%d'",
> +--
> +1.7.11.7
> +
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 8f7736b..03d4589 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -24,8 +24,9 @@ RDEPENDS_${PN} = " \
>  SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
>         file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>         file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
> -    file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
> -    file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
> +       file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
> +       file://lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch \
> +       file://lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch \
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

