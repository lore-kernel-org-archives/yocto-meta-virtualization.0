Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF907E00B96; Sun, 13 Nov 2016 20:44:51 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_LOW, UPPERCASE_50_75 autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.172 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.0 UPPERCASE_50_75 message body is 50-75% uppercase
Received: from mail-qt0-f172.google.com (mail-qt0-f172.google.com
	[209.85.216.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9825BE00AF2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Nov 2016 20:44:46 -0800 (PST)
Received: by mail-qt0-f172.google.com with SMTP id c47so41085251qtc.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 13 Nov 2016 20:44:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=s3Bmeb8394SlcpH4qt1kusCrxMKOssDCDX2kKvT4e7s=;
	b=oqcplYfLD9HB7YE2mPNvsNCzON1Or3Q5VYRmBYi5PcuphwQ+wDk0DMY2BvxEhq897a
	cx76vfKNHum4+BaF2gYpA0r7VQqfrnjNZxGbuGRKx4JB7JyxuulLBABkLxz0uq80N7Uq
	Aew6uTpE/g4t250ct/vYXZT/wlLZTsfjfdqKJMi46QSJ1zUDOAwLwPkUmgZMTb/ieZa7
	sB6rtqaLHvujU2j+hPD2DlwBJPEhdOgPg5qq6SaXGA+deF5TPKUemPbo1MA7eJNIxrAW
	D+0xOikkCKq4IgZOBW/cl3oChia/p1Jpi2sO2AaQjPbs+LcWLjLGnYCO75to+7wmKSQk
	swYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=s3Bmeb8394SlcpH4qt1kusCrxMKOssDCDX2kKvT4e7s=;
	b=EVBCeU7LoEtiOniImIqiroIm36I41CmSebyPzBwHgjuDe7aW1V24yRCDL1Dj02I/oT
	oaRqvkolkvntJS1vJ/xACnsv4AmyZzh16BPgURomL6tiHK7VDD2Zh6chDXzIdeAYeC9J
	22CrGu7BCLcVzgez6LOGrn1yCI32hF5uUvYnqwWe+OgpP1gwCp9B68TdwsI8Np3m92Iv
	Ll0cYTljESbvSxqjd8JlC+epUdoQG5OBfH9+EIY2oLdKnHgk3npJwPLWhSs3WnrFv1+N
	ZdLYYShGVVrakeYSpozooaulWxYDVizratt037t0XxLRf9TSIJsgmpAH7YTzpX/qtEym
	/eyQ==
X-Gm-Message-State: ABUngvd2HiYnCFJGh5pRcLOVCQCtIZfpbyvI9vVqiaK5jxrMRnwCXYyvOoLPTrtoevv20kA4e4sO55dAyf2H9A==
X-Received: by 10.200.47.19 with SMTP id j19mr5837633qta.214.1479098685507;
	Sun, 13 Nov 2016 20:44:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.200.45.220 with HTTP; Sun, 13 Nov 2016 20:44:44 -0800 (PST)
In-Reply-To: <689434D1-C433-4938-9F84-8F24C30093F6@supercoders.com.au>
References: <689434D1-C433-4938-9F84-8F24C30093F6@supercoders.com.au>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 13 Nov 2016 23:44:44 -0500
Message-ID: <CADkTA4PE=-S4AV59jE8Ui0Djnz-wgpWphE+GkXe3RwCZO+qGwQ@mail.gmail.com>
To: Andrew Stuart <andrew.stuart@supercoders.com.au>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: How do I enable all Xen device drivers?
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
X-List-Received-Date: Mon, 14 Nov 2016 04:44:52 -0000
Content-Type: multipart/alternative; boundary=001a1137dab8bcd17f05413b7f34

--001a1137dab8bcd17f05413b7f34
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 12, 2016 at 12:14 AM, Andrew Stuart <
andrew.stuart@supercoders.com.au> wrote:

> The problem I have is that I do not see an eth0 when running on Xen / EC2
>
> I am trying to enable the correct Xen drivers.
>
> I can see that this file contains what appars to be the correct kernel
> settings:
>
> Could comeone please explain to me - like I=E2=80=99m five years old beca=
use I=E2=80=99m
> new to Yocto - what I need to do to get my build to use these settings
> please?
>

What branch are you building (of poky/oe-core and of meta-virt) ? It really
shouldn't
matter, but it can be relevant .. so best to ask right away.

Also have you put 'xen' in your DISTRO_FEATURES ? (it can be done in your
local.conf). Those kernel configs are only added/enabled when xen is found
in
the distro config.

Bruce





>
> thanks!
>
>
> poky/meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg
>
> CONFIG_HYPERVISOR_GUEST=3Dy
> CONFIG_PARAVIRT=3Dy
> CONFIG_XEN=3Dy
> CONFIG_XEN_DOM0=3Dy
> CONFIG_XEN_PVHVM=3Dy
> CONFIG_XEN_MAX_DOMAIN_MEMORY=3D500
> CONFIG_XEN_SAVE_RESTORE=3Dy
> # CONFIG_XEN_DEBUG_FS is not set
> CONFIG_XEN_PVH=3Dy
> CONFIG_MMU_NOTIFIER=3Dy
> CONFIG_HIBERNATE_CALLBACKS=3Dy
> CONFIG_PCI_XEN=3Dy
> CONFIG_XEN_PCIDEV_FRONTEND=3Dy
> CONFIG_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_BLKDEV_FRONTEND=3Dy
> CONFIG_XEN_BLKDEV_BACKEND=3Dm
> CONFIG_XEN_SCSI_FRONTEND=3Dm
> CONFIG_XEN_NETDEV_FRONTEND=3Dy
> CONFIG_XEN_NETDEV_BACKEND=3Dm
> CONFIG_INPUT_MISC=3Dy
> CONFIG_INPUT_XEN_KBDDEV_FRONTEND=3Dy
> CONFIG_HVC_IRQ=3Dy
> CONFIG_HVC_XEN=3Dy
> CONFIG_HVC_XEN_FRONTEND=3Dy
> CONFIG_XEN_WDT=3Dm
> CONFIG_FB_SYS_FILLRECT=3Dy
> CONFIG_FB_SYS_COPYAREA=3Dy
> CONFIG_FB_SYS_IMAGEBLIT=3Dy
> CONFIG_FB_SYS_FOPS=3Dy
> CONFIG_FB_DEFERRED_IO=3Dy
> CONFIG_XEN_FBDEV_FRONTEND=3Dy
> CONFIG_XEN_BALLOON=3Dy
> CONFIG_XEN_SCRUB_PAGES=3Dy
> CONFIG_XEN_DEV_EVTCHN=3Dy
> CONFIG_XEN_BACKEND=3Dy
> CONFIG_XENFS=3Dy
> CONFIG_XEN_COMPAT_XENFS=3Dy
> CONFIG_XEN_SYS_HYPERVISOR=3Dy
> CONFIG_XEN_XENBUS_FRONTEND=3Dy
> CONFIG_XEN_GNTDEV=3Dm
> CONFIG_XEN_GRANT_DEV_ALLOC=3Dm
> CONFIG_SWIOTLB_XEN=3Dy
> CONFIG_XEN_PCIDEV_BACKEND=3Dm
> CONFIG_XEN_PRIVCMD=3Dy
> CONFIG_XEN_ACPI_PROCESSOR=3Dm
> CONFIG_XEN_MCE_LOG=3Dy
> CONFIG_XEN_HAVE_PVMMU=3Dy
> CONFIG_XEN_EFI=3Dy
> CONFIG_XEN_AUTO_XLATE=3Dy
> CONFIG_XEN_ACPI=3Dy
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a1137dab8bcd17f05413b7f34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, Nov 12, 2016 at 12:14 AM, Andrew Stuart <span dir=3D"ltr">&lt;<=
a href=3D"mailto:andrew.stuart@supercoders.com.au" target=3D"_blank">andrew=
.stuart@supercoders.com.au</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex">The problem I have is that I do not see an eth0 when running on Xen=
 / EC2<br>
<br>
I am trying to enable the correct Xen drivers.<br>
<br>
I can see that this file contains what appars to be the correct kernel sett=
ings:<br>
<br>
Could comeone please explain to me - like I=E2=80=99m five years old becaus=
e I=E2=80=99m new to Yocto - what I need to do to get my build to use these=
 settings please?<br></blockquote><div><br></div><div>What branch are you b=
uilding (of poky/oe-core and of meta-virt) ? It really shouldn&#39;t</div><=
div>matter, but it can be relevant .. so best to ask right away.</div><div>=
<br></div><div>Also have you put &#39;xen&#39; in your DISTRO_FEATURES ? (i=
t can be done in your</div><div>local.conf). Those kernel configs are only =
added/enabled when xen is found in</div><div>the distro config.</div><div><=
br></div><div>Bruce</div><div><br></div><div><br></div><div><br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
thanks!<br>
<br>
<br>
poky/meta-virtualization/<wbr>recipes-kernel/linux/linux-<wbr>yocto/xen.cfg=
<br>
<br>
CONFIG_HYPERVISOR_GUEST=3Dy<br>
CONFIG_PARAVIRT=3Dy<br>
CONFIG_XEN=3Dy<br>
CONFIG_XEN_DOM0=3Dy<br>
CONFIG_XEN_PVHVM=3Dy<br>
CONFIG_XEN_MAX_DOMAIN_MEMORY=3D<wbr>500<br>
CONFIG_XEN_SAVE_RESTORE=3Dy<br>
# CONFIG_XEN_DEBUG_FS is not set<br>
CONFIG_XEN_PVH=3Dy<br>
CONFIG_MMU_NOTIFIER=3Dy<br>
CONFIG_HIBERNATE_CALLBACKS=3Dy<br>
CONFIG_PCI_XEN=3Dy<br>
CONFIG_XEN_PCIDEV_FRONTEND=3Dy<br>
CONFIG_SYS_HYPERVISOR=3Dy<br>
CONFIG_XEN_BLKDEV_FRONTEND=3Dy<br>
CONFIG_XEN_BLKDEV_BACKEND=3Dm<br>
CONFIG_XEN_SCSI_FRONTEND=3Dm<br>
CONFIG_XEN_NETDEV_FRONTEND=3Dy<br>
CONFIG_XEN_NETDEV_BACKEND=3Dm<br>
CONFIG_INPUT_MISC=3Dy<br>
CONFIG_INPUT_XEN_KBDDEV_<wbr>FRONTEND=3Dy<br>
CONFIG_HVC_IRQ=3Dy<br>
CONFIG_HVC_XEN=3Dy<br>
CONFIG_HVC_XEN_FRONTEND=3Dy<br>
CONFIG_XEN_WDT=3Dm<br>
CONFIG_FB_SYS_FILLRECT=3Dy<br>
CONFIG_FB_SYS_COPYAREA=3Dy<br>
CONFIG_FB_SYS_IMAGEBLIT=3Dy<br>
CONFIG_FB_SYS_FOPS=3Dy<br>
CONFIG_FB_DEFERRED_IO=3Dy<br>
CONFIG_XEN_FBDEV_FRONTEND=3Dy<br>
CONFIG_XEN_BALLOON=3Dy<br>
CONFIG_XEN_SCRUB_PAGES=3Dy<br>
CONFIG_XEN_DEV_EVTCHN=3Dy<br>
CONFIG_XEN_BACKEND=3Dy<br>
CONFIG_XENFS=3Dy<br>
CONFIG_XEN_COMPAT_XENFS=3Dy<br>
CONFIG_XEN_SYS_HYPERVISOR=3Dy<br>
CONFIG_XEN_XENBUS_FRONTEND=3Dy<br>
CONFIG_XEN_GNTDEV=3Dm<br>
CONFIG_XEN_GRANT_DEV_ALLOC=3Dm<br>
CONFIG_SWIOTLB_XEN=3Dy<br>
CONFIG_XEN_PCIDEV_BACKEND=3Dm<br>
CONFIG_XEN_PRIVCMD=3Dy<br>
CONFIG_XEN_ACPI_PROCESSOR=3Dm<br>
CONFIG_XEN_MCE_LOG=3Dy<br>
CONFIG_XEN_HAVE_PVMMU=3Dy<br>
CONFIG_XEN_EFI=3Dy<br>
CONFIG_XEN_AUTO_XLATE=3Dy<br>
CONFIG_XEN_ACPI=3Dy<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--001a1137dab8bcd17f05413b7f34--
