Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A2E21E00744
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 21:06:42 -0800 (PST)
Received: by mail-lb0-f172.google.com with SMTP id z5so2202212lbh.17
	for <meta-virtualization@yoctoproject.org>;
	Sat, 23 Nov 2013 21:06:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=oC3gU+apIzVwh7MuUx6BBUqRaYt0U+Dy0N0ZORec+aA=;
	b=Xu2Tk8uqBdOe8QQWb1xgdhygFzcj6vAZvtTJzNwemj7CQ5e5Nj78ohNi0joEKNqT+s
	sFifBvzE7YbZ/8RITapBklpsqQIS84b8GjATfAAHuIeC5KK6r2ges5518Qk48JciwPKh
	6Eim4DWMaOMsYDOI7rIKsfwonXS+TgWF3VN4hhVDO2qO8OeTmpeL5UUf0z/cfu6xBJ76
	jSipPq6nQZMQ2sf8v1hyW7NecXPPEgRK3V7XVfPTikG6SxVWLSZ9TUrMB3UdRBLLDuyF
	9wnHN2yYSP8ABFWRIdzf/jx3a9D40yzHM2Lt90zY/9/4gSDQHZc3oU/vwKzoKKVI+0Ew
	6jmQ==
MIME-Version: 1.0
X-Received: by 10.152.203.168 with SMTP id kr8mr44114lac.44.1385269601096;
	Sat, 23 Nov 2013 21:06:41 -0800 (PST)
Received: by 10.112.14.200 with HTTP; Sat, 23 Nov 2013 21:06:41 -0800 (PST)
In-Reply-To: <1385267103-25565-1-git-send-email-asselsm@gmail.com>
References: <1385267103-25565-1-git-send-email-asselsm@gmail.com>
Date: Sun, 24 Nov 2013 00:06:41 -0500
Message-ID: <CADkTA4MjYsfxjRByPrnj0XVpQJbip2iGHpQd_WCOvW_rkYAF+w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Mark Asselstine <asselsm@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] lxc: correct use of PN vs. BPN to fix multilib builds
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
X-List-Received-Date: Sun, 24 Nov 2013 05:06:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Nov 23, 2013 at 11:25 PM, Mark Asselstine <asselsm@gmail.com> wrote:
> BPN should be used in place of PN otherwise the fetcher will attempt
> to download a file with the multilib prefix,and fail, and S will not
> be what is expected, causing patching and other failures.

merged.

Bruce

>
> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
> ---
>  recipes-containers/lxc/lxc_0.9.0.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-containers/lxc/lxc_0.9.0.bb b/recipes-containers/lxc/lxc_0.9.0.bb
> index 03d4589..24e0249 100644
> --- a/recipes-containers/lxc/lxc_0.9.0.bb
> +++ b/recipes-containers/lxc/lxc_0.9.0.bb
> @@ -21,7 +21,7 @@ RDEPENDS_${PN} = " \
>                 perl-module-exporter-heavy \
>  "
>
> -SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
> +SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
>         file://lxc-0.9.0-disable-udhcp-from-busybox-template.patch \
>         file://lxc-0.9.0-enable-chroot-chpasswd-functionality-for-busybox-hosts.patch \
>         file://lxc-0.9.0-check-when-bind-mounting-libdirs.patch \
> @@ -31,7 +31,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${PN}-${PV}.tar.gz \
>  SRC_URI[md5sum] = "8552a4479090616f4bc04d8473765fc9"
>  SRC_URI[sha256sum] = "1e1767eae6cc5fbf892c0e193d25da420ba19f2db203716c38f7cdea3b654120"
>
> -S = "${WORKDIR}/${PN}-${PV}"
> +S = "${WORKDIR}/${BPN}-${PV}"
>
>  # Let's not configure for the host distro.
>  #
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

