Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 92D9AE00B43; Thu, 18 May 2017 00:48:19 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.218.47 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.47 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-oi0-f47.google.com (mail-oi0-f47.google.com
	[209.85.218.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8481AE00B2F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 May 2017 00:48:16 -0700 (PDT)
Received: by mail-oi0-f47.google.com with SMTP id h4so44206584oib.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 May 2017 00:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=btZ3CchD98hAKiQLmsijjFkb8N1BJpQ6U+cfPI6wHO0=;
	b=PJ0knkpD+TbsekvMEfZIcu+mYEXFgcKWO4Id9+ErMK6mNOaTTyNDdTJ8AMFwqfP7lw
	QJNvNwQMB6T8TxjAK8FRrf57i1TIK6goqukTeXPpDy2Ztw3yi8LxNroVJvvXfewysaMv
	+N6k/AsTEyC36MxG+QjNsry/SGEpJfA4P6Gsk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=btZ3CchD98hAKiQLmsijjFkb8N1BJpQ6U+cfPI6wHO0=;
	b=jaYkA0lFQJeKFP4ufSzKF6+HmDW1XdQ7rB+dRBampCSRbHOqM5zdZvaAjqR+lEF0QO
	2DdETXi6c33/BqnA8lBtJNmOiURJrlqmnvMIGCAEggxrd/UHhMlxqrT3a5sawINDseIi
	Fp6Nb2x25Ww80zq/kN/p95lJHscYAG/hh4LIGgw0zpRVdWa9wqsD1az3Gjk4WxgoKmLW
	IyCqTpc6OWcRtg0G8X1lcWy0Ws3VN0kIZwFpe3u4nXw75hgAcO0/UJVlYbIBPOx0gUgh
	xJ1LPAFrphionYcgM+zT0Q8bWT2YyyT58R1IuqN/A2cBemp2fVI++jweyF2nj1gNRauX
	Rukg==
X-Gm-Message-State: AODbwcC9PzSEmDk0+xrK8bPrsmxOpNEgMh7q5G5jbG8k1nlNKjqeVrxV
	7mCG8b1CnovwxricSipZHTWdMdBZDl96
X-Received: by 10.202.97.86 with SMTP id v83mr1386555oib.113.1495093695427;
	Thu, 18 May 2017 00:48:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Thu, 18 May 2017 00:48:15 -0700 (PDT)
In-Reply-To: <CAKmqyKMsM_mZs-R9SkBogZhJaG+KTRVv_Y3DEdTn0sLvYo=rww@mail.gmail.com>
References: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
	<CAKmqyKMsM_mZs-R9SkBogZhJaG+KTRVv_Y3DEdTn0sLvYo=rww@mail.gmail.com>
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Thu, 18 May 2017 09:48:15 +0200
Message-ID: <CAFL6qn6H5zJpKM9x2JvgJFu_qU4H-wk2szdgxucapE5RASNXpw@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
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
X-List-Received-Date: Thu, 18 May 2017 07:48:19 -0000
Content-Type: multipart/alternative; boundary="001a113d3fb89f665f054fc7a049"

--001a113d3fb89f665f054fc7a049
Content-Type: text/plain; charset="UTF-8"

Hi Alistair,

I have deleted the two lines that you have told me:

-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
xf86-video-fbdev', '', d)}"
-IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
xf86-video-vesa', '', d)}"

Anyway, now I'm getting another problem:

generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ bitbake
xen-guest-image-minimal
Loading cache: 100% |############################################| Time:
0:00:00
Loaded 2865 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time:
0:00:01
Parsing of 2097 .bb files complete (2079 cached, 18 parsed). 2881 targets,
198 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'nativesdk-smartpm' (but
/opt/yocto_GE/poky/master/meta/recipes-core/meta/buildtools-tarball.bb
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-smartpm' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-smartpm']
ERROR: Required build target 'xen-guest-image-minimal' has no buildable
providers.
Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
'buildtools-tarball', 'nativesdk-smartpm']

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.
generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$

Do you know how can I solve this issue?

Best regards,
Pello


2017-05-17 17:16 GMT+02:00 Alistair Francis <alistair23@gmail.com>:

> On Wed, May 17, 2017 at 12:37 AM, Pello Heriz
> <pello.heriz@alumni.mondragon.edu> wrote:
> > Hi all,
> >
> > I'm trying to build a xen-guest-image-minimal, but I have the next error:
> >
> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$
> bitbake
> > xen-guest-image-minimal
> > Loading cache: 100% |############################################| Time:
> > 0:00:01
> > Loaded 2865 entries from dependency cache.
> > Parsing recipes: 100% |##########################################| Time:
> > 0:00:01
> > Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881
> targets,
> > 198 skipped, 0 masked, 0 errors.
> > WARNING: No recipes available for:
> >
> > /opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-
> smartpm_%.bbappend
> > NOTE: Resolving any missing task queue dependencies
> > ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but
> > /opt/yocto_GE/poky/master/meta-virtualization/recipes-extended/images/
> xen-guest-image-minimal.bb
> > RDEPENDS on or otherwise requires it)
> > ERROR: xf86-video-vesa was skipped: incompatible with host
> > aarch64-poky-linux (not in COMPATIBLE_HOST)
> > NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
> > Missing or unbuildable dependency chain was: ['xf86-video-vesa']
> > ERROR: Required build target 'xen-guest-image-minimal' has no buildable
> > providers.
> > Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
> > 'xf86-video-vesa']
> >
> > Summary: There was 1 WARNING message shown.
> > Summary: There were 2 ERROR messages shown, returning a non-zero exit
> code.
> >
> > As you can see next, this requiring file is in the meta directory so I
> don't
> > know why I'm getting the issue.
> >
> > generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ cd
> > ../meta/recipes-graphics/xorg-driver/
> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/meta/recipes-graphics/xorg-driver$
> > ls
> > xf86-input-evdev_2.10.5.bb     xf86-video-omap_0.4.5.bb
> > xf86-input-keyboard_1.9.0.bb   xf86-video-omapfb
> > xf86-input-libinput_0.24.0.bb  xf86-video-omapfb_git.bb
> > xf86-input-mouse_1.9.2.bb      xf86-video-vesa_2.3.4.bb
> > xf86-input-synaptics_1.9.0.bb  xf86-video-vmware
> > xf86-input-vmmouse_13.1.0.bb   xf86-video-vmware_13.2.1.bb
> > xf86-video-cirrus_1.5.3.bb     xorg-driver-common.inc
> > xf86-video-fbdev_0.4.4.bb      xorg-driver-input.inc
> > xf86-video-intel               xorg-driver-video.inc
> > xf86-video-intel_git.bb
> > generalelectric@mlan11214m117linux:/opt/yocto_
> GE/poky/master/meta/recipes-graphics/xorg-driver$
> >
> > Can any body help me with this problem?
>
> It looks like this should fix your problem:
>
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
> b/recipes-extended/images/xen-guest-image-minimal.bb
> index ab7e92c..0143867 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -7,9 +7,6 @@ IMAGE_INSTALL += " \
>      ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
> 'kernel-module-xen-acpi-processor', '', d)} \
>      "
>
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
> -
>  LICENSE = "MIT"
>
>  # Send console messages to xen console
>
> It's a bug in meta-virtualisation, I just don't know how to fix it
> without just deleting the code.
>
> Thanks,
>
> Alistair
>
> >
> > Any answer will be welcome,
> >
> > Best regards,
> > Pello
> >
> >
> > --
> > _______________________________________________
> > meta-xilinx mailing list
> > meta-xilinx@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-xilinx
> >
>

--001a113d3fb89f665f054fc7a049
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div>Hi Alistair,<br><br></div>I have =
deleted the two lines that you have told me:<br><br>-IMAGE_INSTALL +=3D &qu=
ot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39=
;<br>
xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
-IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, &#39;<br>
xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br><br></div>Anyway, now I&#39;=
m getting another problem:<br><br>generalelectric@mlan11214m117linux:/opt/y=
octo_GE/poky/master/build$ bitbake xen-guest-image-minimal<br>Loading cache=
: 100% |############################################| Time: 0:00:00<br>Load=
ed 2865 entries from dependency cache.<br>Parsing recipes: 100% |##########=
################################| Time: 0:00:01<br>Parsing of 2097 .bb file=
s complete (2079 cached, 18 parsed). 2881 targets, 198 skipped, 0 masked, 0=
 errors.<br>WARNING: No recipes available for:<br>=C2=A0 /opt/yocto_GE/poky=
/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend<br=
>NOTE: Resolving any missing task queue dependencies<br>ERROR: Nothing RPRO=
VIDES &#39;nativesdk-smartpm&#39; (but /opt/yocto_GE/poky/master/meta/recip=
es-core/meta/<a href=3D"http://buildtools-tarball.bb">buildtools-tarball.bb=
</a> RDEPENDS on or otherwise requires it)<br>NOTE: Runtime target &#39;nat=
ivesdk-smartpm&#39; is unbuildable, removing...<br>Missing or unbuildable d=
ependency chain was: [&#39;nativesdk-smartpm&#39;]<br>ERROR: Required build=
 target &#39;xen-guest-image-minimal&#39; has no buildable providers.<br>Mi=
ssing or unbuildable dependency chain was: [&#39;xen-guest-image-minimal&#3=
9;, &#39;buildtools-tarball&#39;, &#39;nativesdk-smartpm&#39;]<br><br>Summa=
ry: There was 1 WARNING message shown.<br>Summary: There were 2 ERROR messa=
ges shown, returning a non-zero exit code.<br>generalelectric@mlan11214m117=
linux:/opt/yocto_GE/poky/master/build$ <br><br></div>Do you know how can I =
solve this issue?<br><br></div>Best regards, <br></div>Pello<br><div><div><=
div><br></div></div></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">2017-05-17 17:16 GMT+02:00 Alistair Francis <span dir=3D"l=
tr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_blank">alistair2=
3@gmail.com</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D=
"HOEnZb"><div class=3D"h5">On Wed, May 17, 2017 at 12:37 AM, Pello Heriz<br=
>
&lt;<a href=3D"mailto:pello.heriz@alumni.mondragon.edu">pello.heriz@alumni.=
mondragon.<wbr>edu</a>&gt; wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m trying to build a xen-guest-image-minimal, but I have the next=
 error:<br>
&gt;<br>
&gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/poky/master=
/build$ bitbake<br>
&gt; xen-guest-image-minimal<br>
&gt; Loading cache: 100% |#############################<wbr>###############=
| Time:<br>
&gt; 0:00:01<br>
&gt; Loaded 2865 entries from dependency cache.<br>
&gt; Parsing recipes: 100% |#############################<wbr>#############=
| Time:<br>
&gt; 0:00:01<br>
&gt; Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881 targ=
ets,<br>
&gt; 198 skipped, 0 masked, 0 errors.<br>
&gt; WARNING: No recipes available for:<br>
&gt;<br>
&gt; /opt/yocto_GE/poky/master/<wbr>meta-petalinux/recipes-<wbr>devtools/py=
thon/python-<wbr>smartpm_%.bbappend<br>
&gt; NOTE: Resolving any missing task queue dependencies<br>
&gt; ERROR: Nothing RPROVIDES &#39;xf86-video-vesa&#39; (but<br>
&gt; /opt/yocto_GE/poky/master/<wbr>meta-virtualization/recipes-<wbr>extend=
ed/images/<a href=3D"http://xen-guest-image-minimal.bb" rel=3D"noreferrer" =
target=3D"_blank">xen-guest-<wbr>image-minimal.bb</a><br>
&gt; RDEPENDS on or otherwise requires it)<br>
&gt; ERROR: xf86-video-vesa was skipped: incompatible with host<br>
&gt; aarch64-poky-linux (not in COMPATIBLE_HOST)<br>
&gt; NOTE: Runtime target &#39;xf86-video-vesa&#39; is unbuildable, removin=
g...<br>
&gt; Missing or unbuildable dependency chain was: [&#39;xf86-video-vesa&#39=
;]<br>
&gt; ERROR: Required build target &#39;xen-guest-image-minimal&#39; has no =
buildable<br>
&gt; providers.<br>
&gt; Missing or unbuildable dependency chain was: [&#39;xen-guest-image-min=
imal&#39;,<br>
&gt; &#39;xf86-video-vesa&#39;]<br>
&gt;<br>
&gt; Summary: There was 1 WARNING message shown.<br>
&gt; Summary: There were 2 ERROR messages shown, returning a non-zero exit =
code.<br>
&gt;<br>
&gt; As you can see next, this requiring file is in the meta directory so I=
 don&#39;t<br>
&gt; know why I&#39;m getting the issue.<br>
&gt;<br>
&gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/poky/master=
/build$ cd<br>
&gt; ../meta/recipes-graphics/xorg-<wbr>driver/<br>
&gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/poky/master=
/meta/recipes-<wbr>graphics/xorg-driver$<br>
&gt; ls<br>
&gt; <a href=3D"http://xf86-input-evdev_2.10.5.bb" rel=3D"noreferrer" targe=
t=3D"_blank">xf86-input-evdev_2.10.5.bb</a>=C2=A0 =C2=A0 =C2=A0<a href=3D"h=
ttp://xf86-video-omap_0.4.5.bb" rel=3D"noreferrer" target=3D"_blank">xf86-v=
ideo-omap_0.4.5.bb</a><br>
&gt; <a href=3D"http://xf86-input-keyboard_1.9.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">xf86-input-keyboard_1.9.0.bb</a>=C2=A0 =C2=A0xf86-video-omap=
fb<br>
&gt; <a href=3D"http://xf86-input-libinput_0.24.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">xf86-input-libinput_0.24.0.bb</a>=C2=A0 <a href=3D"http://x=
f86-video-omapfb_git.bb" rel=3D"noreferrer" target=3D"_blank">xf86-video-om=
apfb_git.bb</a><br>
&gt; <a href=3D"http://xf86-input-mouse_1.9.2.bb" rel=3D"noreferrer" target=
=3D"_blank">xf86-input-mouse_1.9.2.bb</a>=C2=A0 =C2=A0 =C2=A0 <a href=3D"ht=
tp://xf86-video-vesa_2.3.4.bb" rel=3D"noreferrer" target=3D"_blank">xf86-vi=
deo-vesa_2.3.4.bb</a><br>
&gt; <a href=3D"http://xf86-input-synaptics_1.9.0.bb" rel=3D"noreferrer" ta=
rget=3D"_blank">xf86-input-synaptics_1.9.0.bb</a>=C2=A0 xf86-video-vmware<b=
r>
&gt; <a href=3D"http://xf86-input-vmmouse_13.1.0.bb" rel=3D"noreferrer" tar=
get=3D"_blank">xf86-input-vmmouse_13.1.0.bb</a>=C2=A0 =C2=A0<a href=3D"http=
://xf86-video-vmware_13.2.1.bb" rel=3D"noreferrer" target=3D"_blank">xf86-v=
ideo-vmware_13.2.1.bb</a><br>
&gt; <a href=3D"http://xf86-video-cirrus_1.5.3.bb" rel=3D"noreferrer" targe=
t=3D"_blank">xf86-video-cirrus_1.5.3.bb</a>=C2=A0 =C2=A0 =C2=A0xorg-driver-=
common.inc<br>
&gt; <a href=3D"http://xf86-video-fbdev_0.4.4.bb" rel=3D"noreferrer" target=
=3D"_blank">xf86-video-fbdev_0.4.4.bb</a>=C2=A0 =C2=A0 =C2=A0 xorg-driver-i=
nput.inc<br>
&gt; xf86-video-intel=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0xorg-driver-video.inc<br>
&gt; <a href=3D"http://xf86-video-intel_git.bb" rel=3D"noreferrer" target=
=3D"_blank">xf86-video-intel_git.bb</a><br>
&gt; generalelectric@<wbr>mlan11214m117linux:/opt/yocto_<wbr>GE/poky/master=
/meta/recipes-<wbr>graphics/xorg-driver$<br>
&gt;<br>
&gt; Can any body help me with this problem?<br>
<br>
</div></div>It looks like this should fix your problem:<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://xen-guest-image-mini=
mal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.b=
b</a><br>
b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb" rel=
=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a><br>
index ab7e92c..0143867 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a><b=
r>
+++ b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a><b=
r>
@@ -7,9 +7,6 @@ IMAGE_INSTALL +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;MACHINE_<wbr>FEATURES&#39;, &=
#39;acpi&#39;,<br>
&#39;kernel-module-xen-acpi-<wbr>processor&#39;, &#39;&#39;, d)} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, &#39;<br>
xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
-IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, &#39;<br>
xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
-<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<br>
=C2=A0# Send console messages to xen console<br>
<br>
It&#39;s a bug in meta-virtualisation, I just don&#39;t know how to fix it<=
br>
without just deleting the code.<br>
<br>
Thanks,<br>
<br>
Alistair<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Any answer will be welcome,<br>
&gt;<br>
&gt; Best regards,<br>
&gt; Pello<br>
&gt;<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; ______________________________<wbr>_________________<br>
&gt; meta-xilinx mailing list<br>
&gt; <a href=3D"mailto:meta-xilinx@yoctoproject.org">meta-xilinx@yoctoproje=
ct.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-xilinx" rel=3D=
"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listinfo=
/meta-xilinx</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a113d3fb89f665f054fc7a049--
