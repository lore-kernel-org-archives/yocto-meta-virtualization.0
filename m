Return-Path: <pello.heriz@alumni.mondragon.edu>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AE06E00AA2; Wed, 17 May 2017 00:37:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, HTML_MESSAGE, HTML_OBFUSCATE_05_10,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.3 HTML_OBFUSCATE_05_10 BODY: Message is 5% to 10% HTML
	obfuscation
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.218.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.218.67 listed in dnsbl.sorbs.net]
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA1C1E00AA2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 May 2017 00:37:54 -0700 (PDT)
Received: by mail-oi0-f67.google.com with SMTP id w10so760218oif.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 17 May 2017 00:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=alumni.mondragon.edu; s=google;
	h=mime-version:from:date:message-id:subject:to;
	bh=X7aWYj8l2LlnCSgOlKoTAxbASxz55px5vai28/8zBcs=;
	b=B40lnmKnh6H3JWovsCrGISjP4EtzalRHcvGxfFkrAnUoXdcXri5TOuBhIu396Yv7ga
	YRDKXM8W/vcCv93SShHlNr9Zy3qMS/Hi0cck200UBtbn8F/ejCRez5eQsVh9rzmzz4w4
	SIa6p69mhScekfpvR1VKbIennikYtVYkEsH8k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=X7aWYj8l2LlnCSgOlKoTAxbASxz55px5vai28/8zBcs=;
	b=dLRCwCjp1V8BaM323MzjbdmVoSAIBdtCfpTQ1LAUZWnSZoU6j6mxXqVZyaZh55/mCh
	feChFSdej6B2q+hw+su39Gj+8kKl/cFhz2ZNkEDyr7xZrEdps8ScBH+H3ThP0cDoCsgq
	SGSv4S6mWmiGgX2pxtoXjL3kDR7Sx7mk/CJLa0vJ0kqcUZuN3/wOXMaVGF8ZDwMuH9+J
	0XgQhNx/+ov+Rr3pRMZVrKkukKWuReZngA0YQeXW2c2NsbCddsTzShRWOxh19fBEKZVR
	CBqfXKBaGNC0aysxy2Nf9HH5ZI4UPnokDrW9Do1a4atEEy7WhVC3lwH6AyTj/nibKXDD
	6psg==
X-Gm-Message-State: AODbwcAaNkNn7uf6b8S+GMH4Aizc3AsOkE2Ildn2Vv8gkyfO5h+12J2G
	xHgvb6DpPYOWBSERRTkbDnFyJSbZWnUE
X-Received: by 10.157.53.39 with SMTP id o36mr1184760otc.139.1495006673203;
	Wed, 17 May 2017 00:37:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.12.181 with HTTP; Wed, 17 May 2017 00:37:52 -0700 (PDT)
From: Pello Heriz <pello.heriz@alumni.mondragon.edu>
Date: Wed, 17 May 2017 09:37:52 +0200
Message-ID: <CAFL6qn7X7uTeF1xuMMOyoWbGWvmLXpCScHgq7Lq259Uej6xZoQ@mail.gmail.com>
To: meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org, 
	meta-virtualization@yoctoproject.org, yocto@yoctoproject.org
Subject: Trying to build xen-guest-image-minimal
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
X-List-Received-Date: Wed, 17 May 2017 07:37:57 -0000
Content-Type: multipart/alternative; boundary="001a1145a004b188a2054fb35de0"

--001a1145a004b188a2054fb35de0
Content-Type: text/plain; charset="UTF-8"

Hi all,

I'm trying to build a xen-guest-image-minimal, but I have the next error:

generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ bitbake
xen-guest-image-minimal
Loading cache: 100% |############################################| Time:
0:00:01
Loaded 2865 entries from dependency cache.
Parsing recipes: 100% |##########################################| Time:
0:00:01
Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881 targets,
198 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:

/opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/python-smartpm_%.bbappend
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing RPROVIDES 'xf86-video-vesa' (but
/opt/yocto_GE/poky/master/meta-virtualization/recipes-extended/images/
xen-guest-image-minimal.bb RDEPENDS on or otherwise requires it)
ERROR: xf86-video-vesa was skipped: incompatible with host
aarch64-poky-linux (not in COMPATIBLE_HOST)
NOTE: Runtime target 'xf86-video-vesa' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['xf86-video-vesa']
ERROR: Required build target 'xen-guest-image-minimal' has no buildable
providers.
Missing or unbuildable dependency chain was: ['xen-guest-image-minimal',
'xf86-video-vesa']

Summary: There was 1 WARNING message shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

As you can see next, this requiring file is in the meta directory so I
don't know why I'm getting the issue.

generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build$ cd
../meta/recipes-graphics/xorg-driver/
generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$
ls
xf86-input-evdev_2.10.5.bb     xf86-video-omap_0.4.5.bb
xf86-input-keyboard_1.9.0.bb   xf86-video-omapfb
xf86-input-libinput_0.24.0.bb  xf86-video-omapfb_git.bb
xf86-input-mouse_1.9.2.bb      xf86-video-vesa_2.3.4.bb
xf86-input-synaptics_1.9.0.bb  xf86-video-vmware
xf86-input-vmmouse_13.1.0.bb   xf86-video-vmware_13.2.1.bb
xf86-video-cirrus_1.5.3.bb     xorg-driver-common.inc
xf86-video-fbdev_0.4.4.bb      xorg-driver-input.inc
xf86-video-intel               xorg-driver-video.inc
xf86-video-intel_git.bb
generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$


Can any body help me with this problem?

Any answer will be welcome,

Best regards,
Pello

--001a1145a004b188a2054fb35de0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hi all, <br><br></div>I&#39;m trying to build a =
xen-guest-image-minimal, but I have the next error:<br><br>generalelectric@=
mlan11214m117linux:/opt/yocto_GE/poky/master/build$ bitbake xen-guest-image=
-minimal<br>Loading cache: 100% |##########################################=
##| Time: 0:00:01<br>Loaded 2865 entries from dependency cache.<br>Parsing =
recipes: 100% |##########################################| Time: 0:00:01<br=
>Parsing of 2097 .bb files complete (2080 cached, 17 parsed). 2881 targets,=
 198 skipped, 0 masked, 0 errors.<br>WARNING: No recipes available for:<br>=
=C2=A0 /opt/yocto_GE/poky/master/meta-petalinux/recipes-devtools/python/pyt=
hon-smartpm_%.bbappend<br>NOTE: Resolving any missing task queue dependenci=
es<br>ERROR: Nothing RPROVIDES &#39;xf86-video-vesa&#39; (but /opt/yocto_GE=
/poky/master/meta-virtualization/recipes-extended/images/<a href=3D"http://=
xen-guest-image-minimal.bb">xen-guest-image-minimal.bb</a> RDEPENDS on or o=
therwise requires it)<br>ERROR: xf86-video-vesa was skipped: incompatible w=
ith host aarch64-poky-linux (not in COMPATIBLE_HOST)<br>NOTE: Runtime targe=
t &#39;xf86-video-vesa&#39; is unbuildable, removing...<br>Missing or unbui=
ldable dependency chain was: [&#39;xf86-video-vesa&#39;]<br>ERROR: Required=
 build target &#39;xen-guest-image-minimal&#39; has no buildable providers.=
<br>Missing or unbuildable dependency chain was: [&#39;xen-guest-image-mini=
mal&#39;, &#39;xf86-video-vesa&#39;]<br><br>Summary: There was 1 WARNING me=
ssage shown.<br>Summary: There were 2 ERROR messages shown, returning a non=
-zero exit code.<br><br></div>As you can see next, this requiring file is i=
n the meta directory so I don&#39;t know why I&#39;m getting the issue.<br>=
<div><br>generalelectric@mlan11214m117linux:/opt/yocto_GE/poky/master/build=
$ cd ../meta/recipes-graphics/xorg-driver/<br>generalelectric@mlan11214m117=
linux:/opt/yocto_GE/poky/master/meta/recipes-graphics/xorg-driver$ ls<br><a=
 href=3D"http://xf86-input-evdev_2.10.5.bb">xf86-input-evdev_2.10.5.bb</a>=
=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"http://xf86-video-omap_0.4.5.bb">xf86-v=
ideo-omap_0.4.5.bb</a><br><a href=3D"http://xf86-input-keyboard_1.9.0.bb">x=
f86-input-keyboard_1.9.0.bb</a>=C2=A0=C2=A0 xf86-video-omapfb<br><a href=3D=
"http://xf86-input-libinput_0.24.0.bb">xf86-input-libinput_0.24.0.bb</a>=C2=
=A0 <a href=3D"http://xf86-video-omapfb_git.bb">xf86-video-omapfb_git.bb</a=
><br><a href=3D"http://xf86-input-mouse_1.9.2.bb">xf86-input-mouse_1.9.2.bb=
</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 <a href=3D"http://xf86-video-vesa_2.3.4.=
bb">xf86-video-vesa_2.3.4.bb</a><br><a href=3D"http://xf86-input-synaptics_=
1.9.0.bb">xf86-input-synaptics_1.9.0.bb</a>=C2=A0 xf86-video-vmware<br><a h=
ref=3D"http://xf86-input-vmmouse_13.1.0.bb">xf86-input-vmmouse_13.1.0.bb</a=
>=C2=A0=C2=A0 <a href=3D"http://xf86-video-vmware_13.2.1.bb">xf86-video-vmw=
are_13.2.1.bb</a><br><a href=3D"http://xf86-video-cirrus_1.5.3.bb">xf86-vid=
eo-cirrus_1.5.3.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0 xorg-driver-common.inc<br><a=
 href=3D"http://xf86-video-fbdev_0.4.4.bb">xf86-video-fbdev_0.4.4.bb</a>=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 xorg-driver-input.inc<br>xf86-video-intel=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 xorg-driver-video.inc<br><a href=3D"http://xf86-video-intel_git.bb">xf8=
6-video-intel_git.bb</a><br>generalelectric@mlan11214m117linux:/opt/yocto_G=
E/poky/master/meta/recipes-graphics/xorg-driver$ <br><br></div><div>Can any=
 body help me with this problem?<br><br></div><div>Any answer will be welco=
me,<br><br></div><div>Best regards,<br></div><div>Pello<br></div><div><br><=
/div></div>

--001a1145a004b188a2054fb35de0--
