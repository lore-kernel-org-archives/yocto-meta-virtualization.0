Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8FDC7E00D53; Fri, 12 Jul 2019 07:52:30 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 68014E00A96
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jul 2019 07:52:28 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id q26so6681472lfc.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Jul 2019 07:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=gjPQH0DDNPxtd/8oiyLBM6dWM3om4S+LrTZC4ApC5Z0=;
	b=fxwtEvqOl9sidwvxKOPtKgdaFvMJy9k1az7cB3jrc4il7yTVmNp65csAjL84UES9iM
	VfF5QgME/CVuHBYr95hBCUumP+by9C5CTh3IAxflKVZEjYmvfTM1ZCFOHhNGfaj5uM8p
	GwPzIX8mqQ6DKPtIt3vWlgv1UX6yBmu1zz0BQhSzzt8VsiBJq2Irg7jo270vXkJS8AWd
	CNLGHZF9Lnbiqvk9H9snSzj3wrIB5CuxZFfYeo86KWqoAHBJc/Uo6ja/TzpbTn68A25I
	GDZYPTSpuias2X5cUcpF1jYFQHJMRHD/S+gtZzgwoBNjKuS1ZEGFEatCVU7olFw4JxSH
	Umtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=gjPQH0DDNPxtd/8oiyLBM6dWM3om4S+LrTZC4ApC5Z0=;
	b=IfITCAl8VrVs2lu1iDZMeoXhgfG/EtIo99qpGxcimFNmWxKAMpR0gagSGqv34i7E6w
	L5jAgNcB1k4Xdt+S54rkXeIytkV7nuxBkF3bUAfZLh69ghYkP2dnEhC1U7lJV+ZW1tGj
	tzQr2kG4x8b5/6OraKlhv2MpqFxsuQH9eTR+HnDL5CkPslPiRw3LCI40cZ429MPxFoQo
	2n6GOsW2J9vu4Nz4hkLs4WfzbrUruIYZm8JoGbiI9fuGi6YovfYygIKQJweCNKjsh/fS
	xR78xikosaGJKtQQW5KsVmdCMqzuh4SGImC+m3BOCkMF2shlcFM6aAaOakd28okvGONF
	t1lQ==
X-Gm-Message-State: APjAAAUbt1o67PDfMUULKXLJ2nSzuHTrGiYxL0t9RIrLWK/fCAKcgUFU
	eZuusdtu0z4HTouAAGiBbAibezZTakYTbDmkZv4=
X-Google-Smtp-Source: APXvYqy2omv9p2csVZeY9JX4CkrP8EYJxgcOM+n+/f/NP//OoFOA8DjoeWk6/31QEdcPlCyhFWm2Ugu099XBtdDKfPo=
X-Received: by 2002:a19:491d:: with SMTP id w29mr5063793lfa.149.1562943147042; 
	Fri, 12 Jul 2019 07:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <1562913942-36813-1-git-send-email-mingli.yu@windriver.com>
In-Reply-To: <1562913942-36813-1-git-send-email-mingli.yu@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Jul 2019 10:52:15 -0400
Message-ID: <CADkTA4PL3SUPhj0aNj2n=Pr-71RgwhnvPsDC1AWWr6EpRAJ9AA@mail.gmail.com>
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: Only add polkit to PACKAGECONFIG if polkit is in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 12 Jul 2019 14:52:30 -0000
Content-Type: text/plain; charset="UTF-8"

I just pushed an update to libvirt to master. Can you rebase and
resend this on top of the latest ?

Bruce

On Fri, Jul 12, 2019 at 2:46 AM <mingli.yu@windriver.com> wrote:
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
>  recipes-extended/libvirt/libvirt_5.3.0.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended/libvirt/libvirt_5.3.0.bb
> index c54a99e..286f0de 100644
> --- a/recipes-extended/libvirt/libvirt_5.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
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
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

