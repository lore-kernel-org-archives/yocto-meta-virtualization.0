Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f43.google.com (mail-la0-f43.google.com
	[209.85.215.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 608FEE007E1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:42:53 -0800 (PST)
Received: by mail-la0-f43.google.com with SMTP id e16so1776771lan.2
	for <meta-virtualization@yoctoproject.org>;
	Thu, 27 Feb 2014 11:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=wNkKjCcs2pFTQmj7QhzNnWG7Fjd5752dP90uWv5mCTc=;
	b=qlqnaMyDIcZpFSXdEieaZpdJUZfLkx7wAHtwiEFvdjZCdEhLsFwBwlv0L6cWAqXcRw
	ChScW+o7P3XjALjHnGJ5xJH069tVcTzPq9+ospOya5Xh5QFVJiPb0bmrYeNtp7ydYq6S
	ndUzQ1ZJydqKHnYaO9pegnX1uNzRRQwpVJFIbvsfokhAxtMkXP2fedG5yrubxTd7TzCW
	scqV567CCbIGuptxAnVoGcOMEpZELifvA/8WB9kRtVL6XTXTfYAEinApXI36slWdgVFp
	AhfKMLBXps6t0kZwShW+TXASx3BSTSHF9VvNLHJQLzTyQY22DjiiMTkq92jIZphg8q9G
	X/nw==
MIME-Version: 1.0
X-Received: by 10.112.172.198 with SMTP id be6mr7510849lbc.5.1393530172558;
	Thu, 27 Feb 2014 11:42:52 -0800 (PST)
Received: by 10.112.170.166 with HTTP; Thu, 27 Feb 2014 11:42:52 -0800 (PST)
In-Reply-To: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
References: <1393500786-16877-1-git-send-email-josep.puigdemont@enea.com>
Date: Thu, 27 Feb 2014 14:42:52 -0500
Message-ID: <CADkTA4M1qW4ZTzieAZo=Pb+Ybdkw9FvSXw1qDQpzo-KWC10M8A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update lxc recipe to 1.0.0
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
X-List-Received-Date: Thu, 27 Feb 2014 19:42:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Feb 27, 2014 at 6:33 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> LXC 1.0 was released last week [1], this is an update of the lxc recipe to use
> the latest stable version.
> There are not many changes from the 0.9.0 recipe, just the hashes and the fetch
> url. Some patches have been removed since they have already been included
> in lxc-1.0.0.

Nice to stay so quickly up to date :)

The series looks good to me, did you do any runtime testing to show basic
functionality was still intact ? I assume it is, but I didn't ask once, and was
bitten by a init error!

Bruce

>
> [1] https://lists.linuxcontainers.org/pipermail/lxc-users/2014-February/006260.html
>
> Josep Puigdemont (1):
>   Update Linux Containers to lxc-1.0.0
>
>  .../lxc-0.9.0-always-strdup-rootfs-mount.patch     |   27 --------
>  ...xc-0.9.0-check-when-bind-mounting-libdirs.patch |   44 ------------
>  .../lxc-0.9.0-configure-allow-subdir-objects.patch |   35 ----------
>  ...0.9.0-disable-udhcp-from-busybox-template.patch |   24 -------
>  ...c-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch |   29 --------
>  ...-chpasswd-functionality-for-busybox-hosts.patch |   70 --------------------
>  ...tdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch |   49 --------------
>  .../files/lxc-0.9.0-use-susv3-head-arguments.patch |   46 -------------
>  ...1.0.0-disable-udhcp-from-busybox-template.patch |   24 +++++++
>  recipes-containers/lxc/lxc_0.9.0.bb                |   69 -------------------
>  recipes-containers/lxc/lxc_1.0.0.bb                |   62 +++++++++++++++++
>  11 files changed, 86 insertions(+), 393 deletions(-)
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-always-strdup-rootfs-mount.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-check-when-bind-mounting-libdirs.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-configure-allow-subdir-objects.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-disable-udhcp-from-busybox-template.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-don-t-let-LXC_PATH-end-in-failure.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-setup_netdev-re-read-ifindex-in-LXC_NET_PHYS-case.patch
>  delete mode 100644 recipes-containers/lxc/files/lxc-0.9.0-use-susv3-head-arguments.patch
>  create mode 100644 recipes-containers/lxc/files/lxc-1.0.0-disable-udhcp-from-busybox-template.patch
>  delete mode 100644 recipes-containers/lxc/lxc_0.9.0.bb
>  create mode 100644 recipes-containers/lxc/lxc_1.0.0.bb
>
> --
> 1.7.10.4
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

