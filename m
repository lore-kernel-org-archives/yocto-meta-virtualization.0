Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0774AE00AF0; Wed, 17 May 2017 08:17:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.66 listed in list.dnswl.org]
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1CB8E00ADB;
	Wed, 17 May 2017 08:17:20 -0700 (PDT)
Received: by mail-oi0-f66.google.com with SMTP id h4so2624522oib.0;
	Wed, 17 May 2017 08:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DdB6RLTs/OTl0vJ734f0p0NQDu2QG0ogvBYkjR2T6yo=;
	b=LHyzwwppyBA6tg4ITAzfH+SYg583z3y89QMOp5bv4jgzFSCgs7QLK+nbhRin5v7rZG
	6oZK3qtw6YlmuRqlaFFG4Ys3XAb7nAFn2JoiB600aQVTkSnGAMzIDqy375gLUShcIwQr
	DDgEOIdK2uXcjWQFwWTeCSY4h+MTdrYHwJ95QGvMlTXm4NRZK9FYfQmBhRxM4HGF1uek
	2+Kb23OcFiA16izOrnY08ILO6yNjgQIvzw2tX71VHcIbSwRwyKTo/fw1UhTZ66tFCmJ7
	rnvydrJoeKpcfGguU3B3CiGp7cqpRacc7Fuxu/K/cnZHYsFw1RQsjSsPsX7HPi8j7ZRZ
	8K4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DdB6RLTs/OTl0vJ734f0p0NQDu2QG0ogvBYkjR2T6yo=;
	b=iXUJMnv0TCdKPIRzSYYBTaDpmUHaPyq4exgGTkBcBorvFzZmjFv0eISHTFS6kb3YKV
	GpAkYhpE6xKQZzftF42Ljiw3MbfeUMy+c0yyYdFdVHZMcs7ZTvjH1PA7KPpxs76TB0qL
	W+0R9+WoXKVzPWM1ubte82VKdRj0P1kVxCGLSzmVOvsxqs/X1AYTYuKEPWqd38YLV3mM
	cnr6QZjqwQUcuC+ZJFgqVAAWc8+mVRX6tLTbA2CpKj1lyXr+l43lbXiKcbEoZ9Dvzrq/
	txP3VqUG09KEtm6aBBqid6UAo+gDCX27tcQp81EOllFXR9DvGMS0bWA8fHJdNN/9MsIB
	OthA==
X-Gm-Message-State: AODbwcBjnuU6Ek9VAByKPEq4C7a2eTkFokUoVp7cZyZR3X4eS5UMr9LG
	Tk5M8luTwqi+wg7tCmL4ZIqFDgNehw==
X-Received: by 10.202.80.142 with SMTP id e136mr2428710oib.40.1495034240314;
	Wed, 17 May 2017 08:17:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.16.163 with HTTP; Wed, 17 May 2017 08:16:50 -0700 (PDT)
In-Reply-To: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
References: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Wed, 17 May 2017 08:16:50 -0700
Message-ID: <CAKmqyKMsM_mZs-R9SkBogZhJaG+KTRVv_Y3DEdTn0sLvYo=rww@mail.gmail.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Cc: yocto@yoctoproject.org, meta-virtualization@yoctoproject.org,
	meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org
Subject: Re: [meta-xilinx] Trying to build xen-guest-image-minimal
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
X-List-Received-Date: Wed, 17 May 2017 15:17:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 17, 2017 at 12:37 AM, Pello Heriz
<pello.heriz@alumni.mondragon.edu> wrote:
> Hi all,
>
> I'm trying to build a xen-guest-image-minimal, but I have the next error:
>
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ bitbake
> xen-guest-image-minimal
> Loading cache: 100% |############################################| Time:
> 0:00:01
> Loaded 2865 entries from dependency cache.
> Parsing recipes: 100% |##########################################| Time:
> 0:00:01
> Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881 targets,
> 198 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>
> /opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but
> /opt/yocto_GE/poky/master/meta-virtualization/recipes-extended/images/xen-guest-image-minimal.bb
> RDEPENDS on or otherwise requires it)
> ERROR: xf86-video-vesa was skipped: incompatible with host
> aarch64-poky-linux (not in COMPATIBLE_HOST)
> NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['xf86-video-vesa']
> ERROR: Required build target 'xen-guest-image-minimal' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
> 'xf86-video-vesa']
>
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
>
> As you can see next, this requiring file is in the meta directory so I don't
> know why I'm getting the issue.
>
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ cd
> ../meta/recipes-graphics/xorg-driver/
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$
> ls
> xf86-input-evdev_2.10.5.bb     xf86-video-omap_0.4.5.bb
> xf86-input-keyboard_1.9.0.bb   xf86-video-omapfb
> xf86-input-libinput_0.24.0.bb  xf86-video-omapfb_git.bb
> xf86-input-mouse_1.9.2.bb      xf86-video-vesa_2.3.4.bb
> xf86-input-synaptics_1.9.0.bb  xf86-video-vmware
> xf86-input-vmmouse_13.1.0.bb   xf86-video-vmware_13.2.1.bb
> xf86-video-cirrus_1.5.3.bb     xorg-driver-common.inc
> xf86-video-fbdev_0.4.4.bb      xorg-driver-input.inc
> xf86-video-intel               xorg-driver-video.inc
> xf86-video-intel_git.bb
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$
>
> Can any body help me with this problem?

It looks like this should fix your problem:

diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
b/recipes-extended/images/xen-guest-image-minimal.bb
index ab7e92c..0143867 100644
--- a/recipes-extended/images/xen-guest-image-minimal.bb
+++ b/recipes-extended/images/xen-guest-image-minimal.bb
@@ -7,9 +7,6 @@ IMAGE_INSTALL += " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
'kernel-module-xen-acpi-processor', '', d)} \
     "

-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
xf86-video-fbdev', '', d)}"
-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
xf86-video-vesa', '', d)}"
-
 LICENSE = "MIT"

 # Send console messages to xen console

It's a bug in meta-virtualisation, I just don't know how to fix it
without just deleting the code.

Thanks,

Alistair

>
> Any answer will be welcome,
>
> Best regards,
> Pello
>
>
> --
> _______________________________________________
> meta-xilinx mailing list
> meta-xilinx@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-xilinx
>

