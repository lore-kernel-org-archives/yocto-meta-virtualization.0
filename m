Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D8CB6E00812; Tue, 23 May 2017 02:39:03 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.46 listed in dnsbl.sorbs.net]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.46 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f46.google.com (mail-oi0-f46.google.com
	[209.85.218.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A10FCE00724
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 May 2017 02:39:00 -0700 (PDT)
Received: by mail-oi0-f46.google.com with SMTP id w10so194333226oif.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 23 May 2017 02:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=y3X4VM82L++wnNbcfQ2/aWtS3T2F8mEu3L3X/NGRzlU=;
	b=KEovRgLPgE9I9BayIFBy6EByzL6LtvBm/3wxdWf78ypjnHayph0aHIUtC59YFlOM9k
	f11QMIPuTljnQyJKC/fu2x18gG3nV0x7C+NeJgDZp2HiHfUN7dUqWvkEoiFc9wW6Lj0+
	GQFKJlXcLT8t6fg4C72jBhXeiT6pcJalw6t+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=y3X4VM82L++wnNbcfQ2/aWtS3T2F8mEu3L3X/NGRzlU=;
	b=WILsdKxXs3QLpxPqd9B2m+nafFjF3orAuOwWslhNeCKY7Zgc4Gh6MfuLiVuqO73Eid
	WkM6tCZij42j+ZcJBLDh5C5x/Qw6TXuuIiB6dfS4l9QfhzDoi5pdYb4JGZqX+TmyNw+6
	sA3JiAq5gyctljyLtz56UaDdSm2d1HM3xoawWSV9KfV8466dL+hrQ50h8kP9yJKkWcfH
	np/iU6QU6SYOefGhcoNcYk/8dIqZmYjqKxzy2bohLu/YrqBYDE63di7vcBIRyT1dGnPD
	vjoIdr0CW7C+KVtKDsDuVXfxQx0LRyoQtmc2l1cuZQTHHLtxtNm1cNlOy8+DOj6OCZ5L
	ICGA==
X-Gm-Message-State: AODbwcCmraC2DGpKqrKo6m+VJsoLd5Fra0rmBygZHeEGLYkcMr7DbF2v
	aU84YyRWTxLcyW33j3U/lFCKxBB4PxZx
X-Received: by 10.157.39.133 with SMTP id c5mr1317818otb.3.1495532339647; Tue,
	23 May 2017 02:38:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Tue, 23 May 2017 02:38:59 -0700 (PDT)
In-Reply-To: <CAKmqyKOKqpdwc-HOc5azoxiXLKm4odd1myeTBA7YjzjNddELQQ@mail.gmail.com>
References: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
	<CAKmqyKMsM_mZs-R9SkBogZhJaG+KTRVv_Y3DEdTn0sLvYo=rww@mail.gmail.com>
	<CAFL6qn6H5zJpKM9x2JvgJFu_qU4H-wk2szdgxucapE5RASNXpw@mail.gmail.com>
	<CAKmqyKNLi0p0aT5TcjA-oZ2UW8EuW8BMYH7Kn0y1Fr7YT3HHfw@mail.gmail.com>
	<CAFL6qn7wcvBSD-_9baYMajAdqry0fuUXqjO4HG_GWf_3zzDp2w@mail.gmail.com>
	<CAKmqyKOKqpdwc-HOc5azoxiXLKm4odd1myeTBA7YjzjNddELQQ@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Tue, 23 May 2017 11:38:59 +0200
Message-ID: <CAFL6qn5RSS7K+3k+cVWw-ww2fHQtGJReqobF2x-K+4JtZ8dtgQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>, meta-xilinx@yoctoproject.org, 
	meta-virtualization@yoctoproject.org,
	meta-xilinx-request@yoctoproject.org, yocto@yoctoproject.org
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
X-List-Received-Date: Tue, 23 May 2017 09:39:03 -0000
Content-Type: multipart/alternative; boundary="94eb2c040a4cdae97305502dc14f"

--94eb2c040a4cdae97305502dc14f
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

I have checked that all the included layers belong to the same branch
(master branch in this case). Anyway, the compiling error is still there.
If you don't know what's happening, can you please put me on contact with
someone that knows more about it?

In the other hand, what do you mean by 'you can also try searching the
error on the mailing list'?

Thanks for your help,
Best regards,
Pello

2017-05-23 1:44 GMT+02:00 Alistair Francis <alistair23@gmail.com>:

> On Thu, May 18, 2017 at 11:23 PM, Pello Heriz
> <pello.heriz@alumni.mondragon.edu> wrote:
> > Hi Alistair,
> >
> > how can I assure that all the cloned layers match the same version? Which
> > command do I need to use?
>
> You will manually need to check to make sure the releases all line up.
> For example they should all be morty.
>
> You can also try searching the error on the mailing list, sometimes
> there are already patches posted.
>
> Thanks,
>
> Alistair
>
> >
> > Thanks,
> > Pello
> >
> > 2017-05-19 0:17 GMT+02:00 Alistair Francis <alistair23@gmail.com>:
> >>
> >> On Thu, May 18, 2017 at 12:48 AM, Pello Heriz
> >> <pello.heriz@alumni.mondragon.edu> wrote:
> >> > Hi Alistair,
> >> >
> >> > I have deleted the two lines that you have told me:
> >> >
> >> > -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> >> > xf86-video-fbdev', '', d)}"
> >> > -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> >> > xf86-video-vesa', '', d)}"
> >> >
> >> > Anyway, now I'm getting another problem:
> >> >
> >> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$
> >> > bitbake
> >> > xen-guest-image-minimal
> >> > Loading cache: 100% |############################################|
> Time:
> >> > 0:00:00
> >> > Loaded 2865 entries from dependency cache.
> >> > Parsing recipes: 100% |##########################################|
> Time:
> >> > 0:00:01
> >> > Parsing of 2097 .bb files complete (2079 cached, 18 parsed). 2881
> >> > targets,
> >> > 198 skipped, 0 masked, 0 errors.
> >> > WARNING: No recipes available for:
> >> >
> >> >
> >> > /opt/yocto_GE/poky/master/meta-petalinux/recipes-
> devtools/python/python-smartpm_%.bbappend
> >> > NOTE: Resolving any missing task queue dependencies
> >> > ERROR: Nothing RPROVIDES 'nativesdk-smartpm' (but
> >> > /opt/yocto_GE/poky/master/meta/recipes-core/meta/buildto
> ols-tarball.bb
> >> > RDEPENDS on or otherwise requires it)
> >> > NOTE: Runtime target 'nativesdk-smartpm' is unbuildable, removing...
> >> > Missing or unbuildable dependency chain was: ['nativesdk-smartpm']
> >> > ERROR: Required build target 'xen-guest-image-minimal' has no
> buildable
> >> > providers.
> >> > Missing or unbuildable dependency chain was:
> ['xen-guest-image-minimal',
> >> > 'buildtools-tarball', 'nativesdk-smartpm']
> >> >
> >> > Summary: There was 1 WARNING message shown.
> >> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> >> > code.
> >> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$
> >> >
> >> > Do you know how can I solve this issue?
> >>
> >> Strange, I haven't seen this before. Are you sure you have all the
> >> layers that you need and that the versions match?
> >>
> >> Thanks,
> >>
> >> Alistair
> >>
> >> >
> >> > Best regards,
> >> > Pello
> >> >
> >> >
> >> > 2017-05-17 17:16 GMT+02:00 Alistair Francis <alistair23@gmail.com>:
> >> >>
> >> >> On Wed, May 17, 2017 at 12:37 AM, Pello Heriz
> >> >> <pello.heriz@alumni.mondragon.edu> wrote:
> >> >> > Hi all,
> >> >> >
> >> >> > I'm trying to build a xen-guest-image-minimal, but I have the next
> >> >> > error:
> >> >> >
> >> >> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/build$
> >> >> > bitbake
> >> >> > xen-guest-image-minimal
> >> >> > Loading cache: 100% |############################################|
> >> >> > Time:
> >> >> > 0:00:01
> >> >> > Loaded 2865 entries from dependency cache.
> >> >> > Parsing recipes: 100% |##########################################|
> >> >> > Time:
> >> >> > 0:00:01
> >> >> > Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881
> >> >> > targets,
> >> >> > 198 skipped, 0 masked, 0 errors.
> >> >> > WARNING: No recipes available for:
> >> >> >
> >> >> >
> >> >> >
> >> >> > /opt/yocto_GE/poky/master/meta-petalinux/recipes-
> devtools/python/python-smartpm_%.bbappend
> >> >> > NOTE: Resolving any missing task queue dependencies
> >> >> > ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but
> >> >> >
> >> >> >
> >> >> > /opt/yocto_GE/poky/master/meta-virtualization/recipes-
> extended/images/xen-guest-image-minimal.bb
> >> >> > RDEPENDS on or otherwise requires it)
> >> >> > ERROR: xf86-video-vesa was skipped: incompatible with host
> >> >> > aarch64-poky-linux (not in COMPATIBLE_HOST)
> >> >> > NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
> >> >> > Missing or unbuildable dependency chain was: ['xf86-video-vesa']
> >> >> > ERROR: Required build target 'xen-guest-image-minimal' has no
> >> >> > buildable
> >> >> > providers.
> >> >> > Missing or unbuildable dependency chain was:
> >> >> > ['xen-guest-image-minimal',
> >> >> > 'xf86-video-vesa']
> >> >> >
> >> >> > Summary: There was 1 WARNING message shown.
> >> >> > Summary: There were 2 ERROR messages shown, returning a non-zero
> exit
> >> >> > code.
> >> >> >
> >> >> > As you can see next, this requiring file is in the meta directory
> so
> >> >> > I
> >> >> > don't
> >> >> > know why I'm getting the issue.
> >> >> >
> >> >> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/build$
> >> >> > cd
> >> >> > ../meta/recipes-graphics/xorg-driver/
> >> >> >
> >> >> >
> >> >> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/meta/recipes-graphics/xorg-driver$
> >> >> > ls
> >> >> > xf86-input-evdev_2.10.5.bb     xf86-video-omap_0.4.5.bb
> >> >> > xf86-input-keyboard_1.9.0.bb   xf86-video-omapfb
> >> >> > xf86-input-libinput_0.24.0.bb  xf86-video-omapfb_git.bb
> >> >> > xf86-input-mouse_1.9.2.bb      xf86-video-vesa_2.3.4.bb
> >> >> > xf86-input-synaptics_1.9.0.bb  xf86-video-vmware
> >> >> > xf86-input-vmmouse_13.1.0.bb   xf86-video-vmware_13.2.1.bb
> >> >> > xf86-video-cirrus_1.5.3.bb     xorg-driver-common.inc
> >> >> > xf86-video-fbdev_0.4.4.bb      xorg-driver-input.inc
> >> >> > xf86-video-intel               xorg-driver-video.inc
> >> >> > xf86-video-intel_git.bb
> >> >> >
> >> >> >
> >> >> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/meta/recipes-graphics/xorg-driver$
> >> >> >
> >> >> > Can any body help me with this problem?
> >> >>
> >> >> It looks like this should fix your problem:
> >> >>
> >> >> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
> >> >> b/recipes-extended/images/xen-guest-image-minimal.bb
> >> >> index ab7e92c..0143867 100644
> >> >> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> >> >> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> >> >> @@ -7,9 +7,6 @@ IMAGE_INSTALL += " \
> >> >>      ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
> >> >> 'kernel-module-xen-acpi-processor', '', d)} \
> >> >>      "
> >> >>
> >> >> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> >> >> xf86-video-fbdev', '', d)}"
> >> >> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> >> >> xf86-video-vesa', '', d)}"
> >> >> -
> >> >>  LICENSE = "MIT"
> >> >>
> >> >>  # Send console messages to xen console
> >> >>
> >> >> It's a bug in meta-virtualisation, I just don't know how to fix it
> >> >> without just deleting the code.
> >> >>
> >> >> Thanks,
> >> >>
> >> >> Alistair
> >> >>
> >> >> >
> >> >> > Any answer will be welcome,
> >> >> >
> >> >> > Best regards,
> >> >> > Pello
> >> >> >
> >> >> >
> >> >> > --
> >> >> > _______________________________________________
> >> >> > meta-xilinx mailing list
> >> >> > meta-xilinx@yoctoproject.org
> >> >> > https://lists.yoctoproject.org/listinfo/meta-xilinx
> >> >> >
> >> >
> >> >
> >
> >
>

--94eb2c040a4cdae97305502dc14f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Alistair, <br><br></div>I have=
 checked that all the included layers belong to the same branch (master bra=
nch in this case). Anyway, the compiling error is still there. If you don&#=
39;t know what&#39;s happening, can you please put me on contact with someo=
ne that knows more about it?<br><br></div>In the other hand, what do you me=
an by &#39;you can also try searching the error on the mailing list&#39;? <=
br><br></div>Thanks for your help,<br></div>Best regards, <br></div>Pello<b=
r></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">2017-05-2=
3 1:44 GMT+02:00 Alistair Francis <span dir=3D"ltr">&lt;<a href=3D"mailto:a=
listair23@gmail.com" target=3D"_blank">alistair23@gmail.com</a>&gt;</span>:=
<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">On Thu, May 18, 2017 at 11:23 PM, Pello =
Heriz<br>
&lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.heriz@alumni.=
mondragon.<wbr>edu</a>&gt; wrote:<br>
&gt; Hi Alistair,<br>
&gt;<br>
<span class=3D"">&gt; how can I assure that all the cloned layers match the=
 same version? Which<br>
&gt; command do I need to use?<br>
<br>
</span>You will manually need to check to make sure the releases all line u=
p.<br>
For example they should all be morty.<br>
<br>
You can also try searching the error on the mailing list, sometimes<br>
there are already patches posted.<br>
<br>
Thanks,<br>
<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks,<br>
&gt; Pello<br>
&gt;<br>
&gt; 2017-05-19 0:17 GMT+02:00 Alistair Francis &lt;<a href=3D"mailto:alist=
air23@gmail.com">alistair23@gmail.com</a>&gt;:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, May 18, 2017 at 12:48 AM, Pello Heriz<br>
&gt;&gt; &lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.heri=
z@alumni.mondragon.<wbr>edu</a>&gt; wrote:<br>
&gt;&gt; &gt; Hi Alistair,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I have deleted the two lines that you have told me:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; -IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<w=
br>FEATURES&#39;, &#39;x11&#39;, &#39;<br>
&gt;&gt; &gt; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt; -IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<w=
br>FEATURES&#39;, &#39;x11&#39;, &#39;<br>
&gt;&gt; &gt; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Anyway, now I&#39;m getting another problem:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/po=
ky/master/build$<br>
&gt;&gt; &gt; bitbake<br>
&gt;&gt; &gt; xen-guest-image-minimal<br>
&gt;&gt; &gt; Loading cache: 100% |#############################<wbr>######=
#########| Time:<br>
&gt;&gt; &gt; 0:00:00<br>
&gt;&gt; &gt; Loaded 2865 entries from dependency cache.<br>
&gt;&gt; &gt; Parsing recipes: 100% |#############################<wbr>####=
#########| Time:<br>
&gt;&gt; &gt; 0:00:01<br>
&gt;&gt; &gt; Parsing of 2097 .bb files complete (2079 cached, 18 parsed). =
2881<br>
&gt;&gt; &gt; targets,<br>
&gt;&gt; &gt; 198 skipped, 0 masked, 0 errors.<br>
&gt;&gt; &gt; WARNING: No recipes available for:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; /opt/yocto_GE/poky/master/<wbr>meta-petalinux/recipes-<wbr>de=
vtools/python/python-<wbr>smartpm_%.bbappend<br>
&gt;&gt; &gt; NOTE: Resolving any missing task queue dependencies<br>
&gt;&gt; &gt; ERROR: Nothing RPROVIDES &#39;nativesdk-smartpm&#39; (but<br>
&gt;&gt; &gt; /opt/yocto_GE/poky/master/<wbr>meta/recipes-core/meta/<a href=
=3D"http://buildtools-tarball.bb" rel=3D"noreferrer" target=3D"_blank">buil=
dto<wbr>ols-tarball.bb</a><br>
&gt;&gt; &gt; RDEPENDS on or otherwise requires it)<br>
&gt;&gt; &gt; NOTE: Runtime target &#39;nativesdk-smartpm&#39; is unbuildab=
le, removing...<br>
&gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;nativesdk-=
smartpm&#39;]<br>
&gt;&gt; &gt; ERROR: Required build target &#39;xen-guest-image-minimal&#39=
; has no buildable<br>
&gt;&gt; &gt; providers.<br>
&gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;xen-guest-=
image-minimal&#39;,<br>
&gt;&gt; &gt; &#39;buildtools-tarball&#39;, &#39;nativesdk-smartpm&#39;]<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Summary: There was 1 WARNING message shown.<br>
&gt;&gt; &gt; Summary: There were 2 ERROR messages shown, returning a non-z=
ero exit<br>
&gt;&gt; &gt; code.<br>
&gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/po=
ky/master/build$<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Do you know how can I solve this issue?<br>
&gt;&gt;<br>
&gt;&gt; Strange, I haven&#39;t seen this before. Are you sure you have all=
 the<br>
&gt;&gt; layers that you need and that the versions match?<br>
&gt;&gt;<br>
&gt;&gt; Thanks,<br>
&gt;&gt;<br>
&gt;&gt; Alistair<br>
&gt;&gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Best regards,<br>
&gt;&gt; &gt; Pello<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; 2017-05-17 17:16 GMT+02:00 Alistair Francis &lt;<a href=3D"ma=
ilto:alistair23@gmail.com">alistair23@gmail.com</a>&gt;:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; On Wed, May 17, 2017 at 12:37 AM, Pello Heriz<br>
&gt;&gt; &gt;&gt; &lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">p=
ello.heriz@alumni.mondragon.<wbr>edu</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; Hi all,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I&#39;m trying to build a xen-guest-image-minimal, b=
ut I have the next<br>
&gt;&gt; &gt;&gt; &gt; error:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<=
wbr>GE/poky/master/build$<br>
&gt;&gt; &gt;&gt; &gt; bitbake<br>
&gt;&gt; &gt;&gt; &gt; xen-guest-image-minimal<br>
&gt;&gt; &gt;&gt; &gt; Loading cache: 100% |#############################<w=
br>###############|<br>
&gt;&gt; &gt;&gt; &gt; Time:<br>
&gt;&gt; &gt;&gt; &gt; 0:00:01<br>
&gt;&gt; &gt;&gt; &gt; Loaded 2865 entries from dependency cache.<br>
&gt;&gt; &gt;&gt; &gt; Parsing recipes: 100% |#############################=
<wbr>#############|<br>
&gt;&gt; &gt;&gt; &gt; Time:<br>
&gt;&gt; &gt;&gt; &gt; 0:00:01<br>
&gt;&gt; &gt;&gt; &gt; Parsing of 2097 .bb files complete (2080 cached, 17 =
parsed). 2881<br>
&gt;&gt; &gt;&gt; &gt; targets,<br>
&gt;&gt; &gt;&gt; &gt; 198 skipped, 0 masked, 0 errors.<br>
&gt;&gt; &gt;&gt; &gt; WARNING: No recipes available for:<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; /opt/yocto_GE/poky/master/<wbr>meta-petalinux/recipe=
s-<wbr>devtools/python/python-<wbr>smartpm_%.bbappend<br>
&gt;&gt; &gt;&gt; &gt; NOTE: Resolving any missing task queue dependencies<=
br>
&gt;&gt; &gt;&gt; &gt; ERROR: Nothing RPROVIDES &#39;xf86-video-vesa&#39; (=
but<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; /opt/yocto_GE/poky/master/<wbr>meta-virtualization/r=
ecipes-<wbr>extended/images/<a href=3D"http://xen-guest-image-minimal.bb" r=
el=3D"noreferrer" target=3D"_blank">xen-guest-<wbr>image-minimal.bb</a><br>
&gt;&gt; &gt;&gt; &gt; RDEPENDS on or otherwise requires it)<br>
&gt;&gt; &gt;&gt; &gt; ERROR: xf86-video-vesa was skipped: incompatible wit=
h host<br>
&gt;&gt; &gt;&gt; &gt; aarch64-poky-linux (not in COMPATIBLE_HOST)<br>
&gt;&gt; &gt;&gt; &gt; NOTE: Runtime target &#39;xf86-video-vesa&#39; is un=
buildable, removing...<br>
&gt;&gt; &gt;&gt; &gt; Missing or unbuildable dependency chain was: [&#39;x=
f86-video-vesa&#39;]<br>
&gt;&gt; &gt;&gt; &gt; ERROR: Required build target &#39;xen-guest-image-mi=
nimal&#39; has no<br>
&gt;&gt; &gt;&gt; &gt; buildable<br>
&gt;&gt; &gt;&gt; &gt; providers.<br>
&gt;&gt; &gt;&gt; &gt; Missing or unbuildable dependency chain was:<br>
&gt;&gt; &gt;&gt; &gt; [&#39;xen-guest-image-minimal&#39;,<br>
&gt;&gt; &gt;&gt; &gt; &#39;xf86-video-vesa&#39;]<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Summary: There was 1 WARNING message shown.<br>
&gt;&gt; &gt;&gt; &gt; Summary: There were 2 ERROR messages shown, returnin=
g a non-zero exit<br>
&gt;&gt; &gt;&gt; &gt; code.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; As you can see next, this requiring file is in the m=
eta directory so<br>
&gt;&gt; &gt;&gt; &gt; I<br>
&gt;&gt; &gt;&gt; &gt; don&#39;t<br>
&gt;&gt; &gt;&gt; &gt; know why I&#39;m getting the issue.<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<=
wbr>GE/poky/master/build$<br>
&gt;&gt; &gt;&gt; &gt; cd<br>
&gt;&gt; &gt;&gt; &gt; ../meta/recipes-graphics/xorg-<wbr>driver/<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<=
wbr>GE/poky/master/meta/recipes-<wbr>graphics/xorg-driver$<br>
&gt;&gt; &gt;&gt; &gt; ls<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-evdev_2.10.5.bb" rel=3D=
"noreferrer" target=3D"_blank">xf86-input-evdev_2.10.5.bb</a>=C2=A0 =C2=A0 =
=C2=A0<a href=3D"http://xf86-video-omap_0.4.5.bb" rel=3D"noreferrer" target=
=3D"_blank">xf86-video-omap_0.4.5.bb</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-keyboard_1.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-input-keyboard_1.9.0.bb</a>=C2=A0 =
=C2=A0xf86-video-omapfb<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-libinput_0.24.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-input-libinput_0.24.0.bb</a>=C2=A0 <=
a href=3D"http://xf86-video-omapfb_git.bb" rel=3D"noreferrer" target=3D"_bl=
ank">xf86-video-omapfb_git.bb</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-mouse_1.9.2.bb" rel=3D"=
noreferrer" target=3D"_blank">xf86-input-mouse_1.9.2.bb</a>=C2=A0 =C2=A0 =
=C2=A0 <a href=3D"http://xf86-video-vesa_2.3.4.bb" rel=3D"noreferrer" targe=
t=3D"_blank">xf86-video-vesa_2.3.4.bb</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-synaptics_1.9.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-input-synaptics_1.9.0.bb</a>=C2=A0 x=
f86-video-vmware<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-input-vmmouse_13.1.0.bb" rel=
=3D"noreferrer" target=3D"_blank">xf86-input-vmmouse_13.1.0.bb</a>=C2=A0 =
=C2=A0<a href=3D"http://xf86-video-vmware_13.2.1.bb" rel=3D"noreferrer" tar=
get=3D"_blank">xf86-video-vmware_13.2.1.bb</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-video-cirrus_1.5.3.bb" rel=3D=
"noreferrer" target=3D"_blank">xf86-video-cirrus_1.5.3.bb</a>=C2=A0 =C2=A0 =
=C2=A0xorg-driver-common.inc<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-video-fbdev_0.4.4.bb" rel=3D"=
noreferrer" target=3D"_blank">xf86-video-fbdev_0.4.4.bb</a>=C2=A0 =C2=A0 =
=C2=A0 xorg-driver-input.inc<br>
&gt;&gt; &gt;&gt; &gt; xf86-video-intel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0xorg-driver-video.inc<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"http://xf86-video-intel_git.bb" rel=3D"no=
referrer" target=3D"_blank">xf86-video-intel_git.bb</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<=
wbr>GE/poky/master/meta/recipes-<wbr>graphics/xorg-driver$<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Can any body help me with this problem?<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It looks like this should fix your problem:<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; diff --git a/recipes-extended/images/<a href=3D"http://xe=
n-guest-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>gue=
st-image-minimal.bb</a><br>
&gt;&gt; &gt;&gt; b/recipes-extended/images/<a href=3D"http://xen-guest-ima=
ge-minimal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-mi=
nimal.bb</a><br>
&gt;&gt; &gt;&gt; index ab7e92c..0143867 100644<br>
&gt;&gt; &gt;&gt; --- a/recipes-extended/images/<a href=3D"http://xen-guest=
-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-imag=
e-minimal.bb</a><br>
&gt;&gt; &gt;&gt; +++ b/recipes-extended/images/<a href=3D"http://xen-guest=
-image-minimal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-imag=
e-minimal.bb</a><br>
&gt;&gt; &gt;&gt; @@ -7,9 +7,6 @@ IMAGE_INSTALL +=3D &quot; \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 ${@bb.utils.contains(&#39;MACHINE_<wb=
r>FEATURES&#39;, &#39;acpi&#39;,<br>
&gt;&gt; &gt;&gt; &#39;kernel-module-xen-acpi-<wbr>processor&#39;, &#39;&#3=
9;, d)} \<br>
&gt;&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; -IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTR=
O_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39;<br>
&gt;&gt; &gt;&gt; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; -IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTR=
O_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39;<br>
&gt;&gt; &gt;&gt; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
&gt;&gt; &gt;&gt; -<br>
&gt;&gt; &gt;&gt;=C2=A0 LICENSE =3D &quot;MIT&quot;<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt;=C2=A0 # Send console messages to xen console<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; It&#39;s a bug in meta-virtualisation, I just don&#39;t k=
now how to fix it<br>
&gt;&gt; &gt;&gt; without just deleting the code.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Thanks,<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Alistair<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Any answer will be welcome,<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; Best regards,<br>
&gt;&gt; &gt;&gt; &gt; Pello<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; --<br>
&gt;&gt; &gt;&gt; &gt; ______________________________<wbr>_________________=
<br>
&gt;&gt; &gt;&gt; &gt; meta-xilinx mailing list<br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"mailto:meta-xilinx@yoctoproject.org">meta=
-xilinx@yoctoproject.org</a><br>
&gt;&gt; &gt;&gt; &gt; <a href=3D"https://lists.yoctoproject.org/listinfo/m=
eta-xilinx" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject=
.<wbr>org/listinfo/meta-xilinx</a><br>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;<br>
&gt;<br>
</div></div></blockquote></div><br></div>

--94eb2c040a4cdae97305502dc14f--
