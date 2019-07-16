Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2FC56E00D77; Tue, 16 Jul 2019 12:42:51 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D3D6E006B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:50 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id 16so21146204ljv.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=n6oukDa+5uHb/oR7SOGl7kDrgp+ccgEpqsG13Rmnt3M=;
	b=UAdbIifz1YT4RjmTeTyWSSEy3ErZvnwa/WvwVQTEYzEtc79yDLLal1VWnckwS2bCqG
	QfVQMyHq9J0zjuIiS7SyJwJvQKYcGZCmidBii7vhrXlgygZacJWKznFRKxOLpXPHdzfu
	ouFDo6iiVdV1ula7gLc7Da7i4k+6BdeAYtanCGk8+YUWXI0tosnm5MnJE+1rvLcNjybV
	zl4hivBr00r4Xlm/KbiXkgryzoqohuGOjlq3lnof3jpJepEFBQ6Rd+R5O54q9FdGq/g+
	+lxlqsE5gtyxiVaZJmwJXUnnwjnd3otac/5AE3dGYKr7apnegcPIBli7MTMEl3jDtsjs
	9/ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=n6oukDa+5uHb/oR7SOGl7kDrgp+ccgEpqsG13Rmnt3M=;
	b=ZU1FG7phxtXWNIDklyzAmBmNlMKFSkno3Xgv8KEMB0eJzAzSVo6afPhZGsDTXVS0Nb
	Xq4V5Jz3r4L3ex2DjaHuqi4+5sXuxNr1urHQ719J5D/IUEQyRWnLI3MsP6ZFOW7pRZ14
	HWWjPz+KcI/nZuUUjBULCTLstyaSlkptXmqwnPp0v43Ia1mQt+17WSqOtJlMw+kxW0v8
	lF2wO/+nr8uOa6o/aCDruxw6OUhea5JUNXuq/P5jC3gVl0VJnsU1vLD1Io8yk239MkJi
	MmaksguV8TMllySRg+kI7M4YuSk8pdPadSgCOXi75VJFoN/NaWAbGmWe9WSrCv/2tkLn
	I79w==
X-Gm-Message-State: APjAAAVERoswWdOz27HnLi8jQWTBNA2ZLWOl7SLDI/XSM5e4YSxuPl6j
	F3L0jyCG2cYIIoa7tAeuOaTaVYYeWVP9f433BX18ur5u
X-Google-Smtp-Source: APXvYqz4s/l4ikbFOajzUHkyf00U3LSYbQD69ls7ijV80NMb+SXI0e6MJDd2zK73HW+kyiM0jaXBiEhymW4+QTGktrU=
X-Received: by 2002:a2e:a171:: with SMTP id u17mr18833428ljl.209.1563306168989;
	Tue, 16 Jul 2019 12:42:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADkTA4PL3SUPhj0aNj2n=Pr-71RgwhnvPsDC1AWWr6EpRAJ9AA@mail.gmail.com>
	<1563156571-38921-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1563156571-38921-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Jul 2019 15:42:38 -0400
Message-ID: <CADkTA4PJ8z-0q78DvfZ1yOB2d890zuvNm0he8M4FBSCEfFjq6Q@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] libvirt: Only add polkit to PACKAGECONFIG if polkit is in DISTRO_FEATURES
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
X-List-Received-Date: Tue, 16 Jul 2019 19:42:51 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks for the rebase.

Merged.

Bruce

On Sun, Jul 14, 2019 at 10:10 PM <mingli.yu@windriver.com> wrote:
>
> From: Mingli Yu <Mingli.Yu@windriver.com>
>
> At first, the polkit support is always enabled in
> PACKAGECONFIG and since Feb 27 2014, use x11
> DISTRO_FEATURES to control the polkit support
> with below commit.
> =========================================================
> commit ce991a62d5f2ce006074ee4b8a97c6029308548c
> Author: Jonas Eriksson <jonas.eriksson@enea.com>
> Date:   Thu Feb 27 17:10:09 2014 +0100
>
>     libvirt: Disable polkit driver when there is no x11
>
>     To avoid having the default build of libvirt depend on virtual/x11
>     through polkit and consolekit, check for x11 in DISTRO_FEATURES before
>     enabling the polkit support in the default PKG_CONFIG.
>
>     Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
>     Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>     Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
>
>  diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
>  index 5365b8d..4c9cf36 100644
>  --- a/recipes-extended/libvirt/libvirt_1.2.1.bb
>  +++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
>  @@ -109,10 +109,11 @@ INITSCRIPT_PARAMS_${PN}-libvirtd = "defaults 72"
>   #PACKAGECONFIG ??= "xen libxl xen-inotify test remote libvirtd"
>
>   # full config
>  -PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 polkit lxc test \
>  +PACKAGECONFIG ??= "qemu yajl uml openvz vmware vbox esx iproute2 lxc test \
>                     remote macvtap libvirtd netcf udev python ebtables \
>                     ${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)} \
>                     ${@base_contains('DISTRO_FEATURES', 'xen', 'xen libxl xen-inotify', '', d)} \
>  +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
>                    "
> =========================================================
>
> After below commits to add polkit as a required distro feature
> in meta-oe, we should unify altogether to enable polkit if
> polkit distro feature is set.
> 97a1a55 polkit: add polkit as a required distro
> feature c049e02 polkit: inherit distro_features_check
>
> Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
> ---
>  recipes-extended/libvirt/libvirt_5.5.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index 222654a..7ed40a6 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -188,7 +188,7 @@ PACKAGECONFIG ??= "qemu yajl openvz vmware vbox esx iproute2 lxc test \
>                     fuse iproute2 firewalld libpcap \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'selinux audit libcap-ng', '', d)} \
>                     ${@bb.utils.contains('DISTRO_FEATURES', 'xen', 'libxl', '', d)} \
> -                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'polkit', '', d)} \
> +                   ${@bb.utils.contains('DISTRO_FEATURES', 'polkit', 'polkit', '', d)} \
>                     ${@bb.utils.contains('KARCH', 'arm', '', 'numactl', d)} \
>                    "
>
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

