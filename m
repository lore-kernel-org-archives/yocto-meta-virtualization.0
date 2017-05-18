Return-Path: <alistair23@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E6319E00B8A; Thu, 18 May 2017 15:18:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (alistair23[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4EB23E00BAD;
	Thu, 18 May 2017 15:18:18 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id m17so9674353oik.2;
	Thu, 18 May 2017 15:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5dWPHwSGbbzmovJG++40FlDO31BtfF0PZbMqtG3/brM=;
	b=GzWncOpZkh/BsPLp4BoMfya+/zssUu6o81I/8FdRG2gemHlgXw3RSZk7d3c9D169Sh
	YjoCKwQX0tOiHkYt4GhODceIfzrkg2LBbDbI+aWJoTbkN5ROQ33N8Keb6T+24zTcQWIc
	jjx8dr5OC8jYAK0Bwmv4b85Jq1A/3a/wU1SkAdqP0lXSu/XxeRuLdraWdkjHzTdlMDVT
	EYhBhPS+waPPgl56swdmqiRMyI+tCqewqWrKs70VQK6CNCT7H2wRg1Lx5DDjay9ysydy
	PoP4PALXEROub0iQwtg7aZWUNdK1/rEBV1vlGMv6Gz2j8XVnFQkA+4p5urSLcccDxtT8
	bXyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5dWPHwSGbbzmovJG++40FlDO31BtfF0PZbMqtG3/brM=;
	b=IqymTBuQTtv4gdrrAPqpkIULnO+cmxzWZ0Uqkq8k8jpx/W5Z7/XKQakQZmceMfN/09
	i7R+3oGQGAnHdRn19nfiZBRgt31Yk1X7t6ugEkEABD1HrSPOgpaQ0quyKMcsXx7noQDB
	XF6PgtGEIZ4aB+6SY76PVNYL5wJcG1NYT8Wc7nrszaACjfihri+8wdIIgXw7GHbddRfI
	Ba0lVs4pyQUETDbLFRQGOdXCt0RFhLS3pBXtSe7N0/YH90Gk2z8zCFp9xbxTpT5jtFa3
	+BoDoNfs+UK3lHAJIaSJGR1F7oX9R23V+QY/NQKj0oZ4w50zrWA+o2+sO80s5ofIbW9N
	BJAw==
X-Gm-Message-State: AODbwcDR/7iitL/sh1k4o4YwVXWNBxO7srg2fq5K+HB1E3cosQdqDu9f
	0pHKxXKOne0F58Z+FsdBf1Y3NVqJ8A==
X-Received: by 10.202.80.142 with SMTP id e136mr4012150oib.40.1495145897826;
	Thu, 18 May 2017 15:18:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.16.163 with HTTP; Thu, 18 May 2017 15:17:47 -0700 (PDT)
In-Reply-To: <CAFL6qn6H5zJpKM9x2JvgJFu_qU4H-wk2szdgxucapE5RASNXpw@mail.gmail.com>
References: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
	<CAKmqyKMsM_mZs-R9SkBogZhJaG+KTRVv_Y3DEdTn0sLvYo=rww@mail.gmail.com>
	<CAFL6qn6H5zJpKM9x2JvgJFu_qU4H-wk2szdgxucapE5RASNXpw@mail.gmail.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 18 May 2017 15:17:47 -0700
Message-ID: <CAKmqyKNLi0p0aT5TcjA-oZ2UW8EuW8BMYH7Kn0y1Fr7YT3HHfw@mail.gmail.com>
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
X-List-Received-Date: Thu, 18 May 2017 22:18:27 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 12:48 AM, Pello Heriz
<pello.heriz@alumni.mondragon.edu> wrote:
> Hi Alistair,
>
> I have deleted the two lines that you have told me:
>
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
>
> Anyway, now I'm getting another problem:
>
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ bitbake
> xen-guest-image-minimal
> Loading cache: 100% |############################################| Time:
> 0:00:00
> Loaded 2865 entries from dependency cache.
> Parsing recipes: 100% |##########################################| Time:
> 0:00:01
> Parsing of 2097 .bb files complete (2079 cached, 18 parsed). 2881 targets,
> 198 skipped, 0 masked, 0 errors.
> WARNING: No recipes available for:
>
> /opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend
> NOTE: Resolving any missing task queue dependencies
> ERROR: Nothing RPROVIDES 'nativesdk-smartpm' (but
> /opt/yocto_GE/poky/master/meta/recipes-core/meta/buildtools-tarball.bb
> RDEPENDS on or otherwise requires it)
> NOTE: Runtime target 'nativesdk-smartpm' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['nativesdk-smartpm']
> ERROR: Required build target 'xen-guest-image-minimal' has no buildable
> providers.
> Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
> 'buildtools-tarball', 'nativesdk-smartpm']
>
> Summary: There was 1 WARNING message shown.
> Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
> generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$
>
> Do you know how can I solve this issue?

Strange, I haven't seen this before. Are you sure you have all the
layers that you need and that the versions match?

Thanks,

Alistair

>
> Best regards,
> Pello
>
>
> 2017-05-17 17:16 GMT+02:00 Alistair Francis <alistair23@gmail.com>:
>>
>> On Wed, May 17, 2017 at 12:37 AM, Pello Heriz
>> <pello.heriz@alumni.mondragon.edu> wrote:
>> > Hi all,
>> >
>> > I'm trying to build a xen-guest-image-minimal, but I have the next
>> > error:
>> >
>> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$
>> > bitbake
>> > xen-guest-image-minimal
>> > Loading cache: 100% |############################################| Time:
>> > 0:00:01
>> > Loaded 2865 entries from dependency cache.
>> > Parsing recipes: 100% |##########################################| Time:
>> > 0:00:01
>> > Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881
>> > targets,
>> > 198 skipped, 0 masked, 0 errors.
>> > WARNING: No recipes available for:
>> >
>> >
>> > /opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend
>> > NOTE: Resolving any missing task queue dependencies
>> > ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but
>> >
>> > /opt/yocto_GE/poky/master/meta-virtualization/recipes-extended/images/xen-guest-image-minimal.bb
>> > RDEPENDS on or otherwise requires it)
>> > ERROR: xf86-video-vesa was skipped: incompatible with host
>> > aarch64-poky-linux (not in COMPATIBLE_HOST)
>> > NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
>> > Missing or unbuildable dependency chain was: ['xf86-video-vesa']
>> > ERROR: Required build target 'xen-guest-image-minimal' has no buildable
>> > providers.
>> > Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
>> > 'xf86-video-vesa']
>> >
>> > Summary: There was 1 WARNING message shown.
>> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
>> > code.
>> >
>> > As you can see next, this requiring file is in the meta directory so I
>> > don't
>> > know why I'm getting the issue.
>> >
>> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ cd
>> > ../meta/recipes-graphics/xorg-driver/
>> >
>> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$
>> > ls
>> > xf86-input-evdev_2.10.5.bb     xf86-video-omap_0.4.5.bb
>> > xf86-input-keyboard_1.9.0.bb   xf86-video-omapfb
>> > xf86-input-libinput_0.24.0.bb  xf86-video-omapfb_git.bb
>> > xf86-input-mouse_1.9.2.bb      xf86-video-vesa_2.3.4.bb
>> > xf86-input-synaptics_1.9.0.bb  xf86-video-vmware
>> > xf86-input-vmmouse_13.1.0.bb   xf86-video-vmware_13.2.1.bb
>> > xf86-video-cirrus_1.5.3.bb     xorg-driver-common.inc
>> > xf86-video-fbdev_0.4.4.bb      xorg-driver-input.inc
>> > xf86-video-intel               xorg-driver-video.inc
>> > xf86-video-intel_git.bb
>> >
>> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$
>> >
>> > Can any body help me with this problem?
>>
>> It looks like this should fix your problem:
>>
>> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
>> b/recipes-extended/images/xen-guest-image-minimal.bb
>> index ab7e92c..0143867 100644
>> --- a/recipes-extended/images/xen-guest-image-minimal.bb
>> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
>> @@ -7,9 +7,6 @@ IMAGE_INSTALL += " \
>>      ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
>> 'kernel-module-xen-acpi-processor', '', d)} \
>>      "
>>
>> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
>> xf86-video-fbdev', '', d)}"
>> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
>> xf86-video-vesa', '', d)}"
>> -
>>  LICENSE = "MIT"
>>
>>  # Send console messages to xen console
>>
>> It's a bug in meta-virtualisation, I just don't know how to fix it
>> without just deleting the code.
>>
>> Thanks,
>>
>> Alistair
>>
>> >
>> > Any answer will be welcome,
>> >
>> > Best regards,
>> > Pello
>> >
>> >
>> > --
>> > _______________________________________________
>> > meta-xilinx mailing list
>> > meta-xilinx@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-xilinx
>> >
>
>

