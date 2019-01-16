Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 57ED4E00C6D; Wed, 16 Jan 2019 07:29:11 -0800 (PST)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20553E00BF9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2019 07:29:10 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id n18-v6so5784600lji.7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 16 Jan 2019 07:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=VQ09Npe+92RC4UzdPPdFbkAvsLMLXxE7NK0uBhqmiE4=;
	b=RjmBb1csUMHM6Pk+nHZFGU7S/L9SotzPofZOsBF4LIhPEMY3GX/oBkZvbYVm8892LD
	OnA/bTY8mlf+5j7DkTBLlDF9YgaNNxKyzXLd6Jt7Aevr63JXhfKQd3tQTX+7H4A4FXpA
	4+vn+r6rECEQSloBiOS+Bhp3Fhm/e5oKaX7CJiYhpFrAMGZAit0HdvLXPy83aAbF4M5k
	mHRIjcZzoaoSWdqmC2uaqdig4O0M6LMNMdvHqqXkBrueb3UTL3sJzrdrl2pWYM8LPiIK
	6ze7TmCWFmy8dqtB/Xo4Y9FyJjKfpCR3V88FlZS/mz2qQjWHm2De+2mA0FPXb4NegaTP
	yxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=VQ09Npe+92RC4UzdPPdFbkAvsLMLXxE7NK0uBhqmiE4=;
	b=f637AEgxQx/7OLB8N25nWwrtWquXuPQN/9+6QSH/5BkdbdvbwZB1JXkIkTlfo1uoVc
	jyKnuFbGG5/0MIjZsae+zAphbPx8tO+K3S9wVev7r71XNhlfKWAoB4PUMzgKU6edS9tJ
	04pJ+ItziljQKxE6duFBrEnwanlY8djIWhB2lYN5ex6rzti9KhAipGBiVjmIXyEmAEgd
	khHP+s2VyIe5k93VI0nwpZZgWzHj7lk3C4v+z9Zd7IVKnJO3osQ6v0H0CZYc6uMat+Cy
	WXWj5+qbqTeniE0yLGdOfdH2xAK1pq7fm1On6jEuRizRp3kOshdGlqwJBFaMH2BMDpwb
	tHGQ==
X-Gm-Message-State: AJcUukfS902+hBdw9mz1gGY10q2jUvdo9sAAiLFCx0DedYf0KRKDnQ2T
	blR3Fo1KyEmX+Te7WEdnTwbrBkiwuGWquASbC14s0Q==
X-Google-Smtp-Source: ALg8bN5r94j3X+QpNJyI5+DT/XsFCcb8KjG0FCvQTVSaLCPach7R9nFHADY2i+Dz94WZmi4YXZe6zsBgS5xKnW2MNA0=
X-Received: by 2002:a2e:8596:: with SMTP id
	b22-v6mr7030433lji.122.1547652548868; 
	Wed, 16 Jan 2019 07:29:08 -0800 (PST)
MIME-Version: 1.0
References: <20190111164915.14771-1-paul@betafive.co.uk>
In-Reply-To: <20190111164915.14771-1-paul@betafive.co.uk>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 16 Jan 2019 10:28:55 -0500
Message-ID: <CADkTA4PcQT8W136vTR7mAqnqCqX+DqAMWAaZFvgZ0EX-1ftqNg@mail.gmail.com>
To: Paul Barker <paul@betafive.co.uk>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Use SRCPV instead of SRCREV where possible
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
X-List-Received-Date: Wed, 16 Jan 2019 15:29:11 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Fri, Jan 11, 2019 at 11:55 AM Paul Barker <paul@betafive.co.uk> wrote:
>
> This change reduces the length of ${PV} for several recipes and gives us
> auto-incrementing version numbers.
>
> Signed-off-by: Paul Barker <paul@betafive.co.uk>
> ---
>  recipes-containers/containerd/containerd.inc      | 2 +-
>  recipes-devtools/go/go-cli_git.bb                 | 2 +-
>  recipes-devtools/go/go-dbus_git.bb                | 2 +-
>  recipes-devtools/go/go-fsnotify_git.bb            | 2 +-
>  recipes-devtools/go/go-logrus_git.bb              | 2 +-
>  recipes-devtools/go/go-systemd_git.bb             | 2 +-
>  recipes-extended/hyperstart/hyperstart_git.bb     | 2 +-
>  recipes-extended/kvmtool/kvmtool.bb               | 2 +-
>  recipes-networking/openvswitch/openvswitch_git.bb | 2 +-
>  9 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/recipes-containers/containerd/containerd.inc b/recipes-containers/containerd/containerd.inc
> index 0eca5a6..a3f1301 100644
> --- a/recipes-containers/containerd/containerd.inc
> +++ b/recipes-containers/containerd/containerd.inc
> @@ -12,7 +12,7 @@ SRC_URI += "file://containerd.service"
>
>  S = "${WORKDIR}/git"
>
> -PV = "${CONTAINERD_VERSION}+git${SRCREV}"
> +PV = "${CONTAINERD_VERSION}+git${SRCPV}"
>
>  inherit go
>  inherit goarch
> diff --git a/recipes-devtools/go/go-cli_git.bb b/recipes-devtools/go/go-cli_git.bb
> index 21d01ac..434594c 100644
> --- a/recipes-devtools/go/go-cli_git.bb
> +++ b/recipes-devtools/go/go-cli_git.bb
> @@ -10,7 +10,7 @@ PKG_NAME = "github.com/codegangsta/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "27ecc97192df1bf053a22b04463f2b51b8b8373e"
> -PV = "1.1.0+git${SRCREV}"
> +PV = "1.1.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-dbus_git.bb b/recipes-devtools/go/go-dbus_git.bb
> index 9b206a1..2390861 100644
> --- a/recipes-devtools/go/go-dbus_git.bb
> +++ b/recipes-devtools/go/go-dbus_git.bb
> @@ -10,7 +10,7 @@ PKG_NAME = "github.com/godbus/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "5f6efc7ef2759c81b7ba876593971bfce311eab3"
> -PV = "4.0.0+git${SRCREV}"
> +PV = "4.0.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-fsnotify_git.bb b/recipes-devtools/go/go-fsnotify_git.bb
> index 1d9fbdc..0826aa7 100644
> --- a/recipes-devtools/go/go-fsnotify_git.bb
> +++ b/recipes-devtools/go/go-fsnotify_git.bb
> @@ -10,7 +10,7 @@ PKG_NAME = "github.com/fsnotify/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "836bfd95fecc0f1511dd66bdbf2b5b61ab8b00b6"
> -PV = "1.2.11+git${SRCREV}"
> +PV = "1.2.11+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
> index 5c0c359..aa89033 100644
> --- a/recipes-devtools/go/go-logrus_git.bb
> +++ b/recipes-devtools/go/go-logrus_git.bb
> @@ -10,7 +10,7 @@ PKG_NAME = "github.com/Sirupsen/${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
> -PV = "0.11.0+git${SRCREV}"
> +PV = "0.11.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-devtools/go/go-systemd_git.bb b/recipes-devtools/go/go-systemd_git.bb
> index b61c97a..0f89c0f 100644
> --- a/recipes-devtools/go/go-systemd_git.bb
> +++ b/recipes-devtools/go/go-systemd_git.bb
> @@ -10,7 +10,7 @@ PKG_NAME = "github.com/coreos/go-${SRCNAME}"
>  SRC_URI = "git://${PKG_NAME}.git"
>
>  SRCREV = "b4a58d95188dd092ae20072bac14cece0e67c388"
> -PV = "4+git${SRCREV}"
> +PV = "4+git${SRCPV}"
>
>  RDEPENDS_${PN} += "bash"
>
> diff --git a/recipes-extended/hyperstart/hyperstart_git.bb b/recipes-extended/hyperstart/hyperstart_git.bb
> index 3c64f24..9f98419 100644
> --- a/recipes-extended/hyperstart/hyperstart_git.bb
> +++ b/recipes-extended/hyperstart/hyperstart_git.bb
> @@ -10,7 +10,7 @@ SRC_URI = "git://github.com/hyperhq/hyperstart.git"
>  SRC_URI += "file://0001-container.c-Fix-compiler-errors-that-gcc-8.1.0-repor.patch"
>
>  SRCREV = "15bb718ad34045aa1962a8204f602c6afe9a76ab"
> -PV = "v0.2+git${SRCREV}"
> +PV = "v0.2+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-extended/kvmtool/kvmtool.bb b/recipes-extended/kvmtool/kvmtool.bb
> index d487ee2..cb09c66 100644
> --- a/recipes-extended/kvmtool/kvmtool.bb
> +++ b/recipes-extended/kvmtool/kvmtool.bb
> @@ -17,7 +17,7 @@ SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/will/kvmtool.git \
>             "
>
>  SRCREV = "0e1882a49f81cb15d328ef83a78849c0ea26eecc"
> -PV = "4.14.0+git${SRCREV}"
> +PV = "4.14.0+git${SRCPV}"
>
>  S = "${WORKDIR}/git"
>
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index b8bbb3a..81a66a9 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,7 +14,7 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.10.1+${SRCREV}"
> +PV = "2.10.1+${SRCPV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> --
> 2.17.1
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

