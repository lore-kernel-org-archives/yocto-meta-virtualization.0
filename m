Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8B2C2E00CF1; Thu, 14 Sep 2017 13:32:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.68 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.213.68 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A219DE00CE4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:31:57 -0700 (PDT)
Received: by mail-vk0-f68.google.com with SMTP id w23so123689vkw.3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Sep 2017 13:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=l7s+B7OFMwt3pj11l2gKM5gdWzsll7zyvqaeLq9QKYg=;
	b=mdRGzFUGF5TYCi0Bbz1MHfOEiHAasyOoGcfe3DtbKkvcklqt4psmnHS97OOIhRXR9U
	Wx/No+qg9uu4sAEQy9Oyl/Ssih1AIELo6Qid1yGHLrQBbXuCfLOFYf0m+06wFKeK+QC+
	QTi4FHQFNxzncKLelNJ91kC/nizFIWih1iUkWzEssTeq6RiG88iIVKCEpmRJCkjJD2Bz
	/Gge0I1Z3czttjgZoLGJ8XUBIoXsqFzeG68Yw19IIZxZjRs+X1FbKizZlbSffdGcY8+g
	HMfX4fYhjp1jv/So4zikv6lD38hJYiXQyiE3YW3LIDTvOicL8IX0FX8s6p2lziHrxUzx
	j6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=l7s+B7OFMwt3pj11l2gKM5gdWzsll7zyvqaeLq9QKYg=;
	b=t/jBIxjhoOF0PhFr9uTtcaK4DARJmsAfpP+OYJJzwp6fRJcmvEhsXSZt6x49hdKwfC
	Ku5KvSDTJjQYOB2iludlWWDx6m49ogXw/7Ni9SppkWbh09PEJS+WtlAK11nOIsqEeuuk
	iPmjbf29ASpldv+3uojvrp77/M9CCKP+j1FvV/h4if+jLN7w+sV0BRmPn/KmaBxu0IRR
	vUS0T/ARhXiMNd74vvtVIO48SC1LKJjkj6gLntrZFL1LBEJRoTzFY2w+P/4VJIK4NH+X
	1EIHvWzmYxR9lNF/f06TUH4pvpsWmhYLO2K/Ja+iGH2fHilwkC4JONIoyzNSTuSe1TjD
	8ALA==
X-Gm-Message-State: AHPjjUh0uZg0+skhV0mSLiKcj/7b7yKv1JZrps5+Rybv7ZOX5PoPd/Mb
	d1fSOfK0ck3OvO7z/+yNJKplO1sZS2B+xrxyyyM=
X-Google-Smtp-Source: AOwi7QB1ftrtfohT4/Mh/4xENVMdgRPboA3FyT8om3ugz6iNSbYuBvo/WczNPTxL99Vmghe0XXnLIKHxdSHZ/5nMpwY=
X-Received: by 10.31.33.87 with SMTP id h84mr17329958vkh.101.1505421117094;
	Thu, 14 Sep 2017 13:31:57 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.59.18 with HTTP; Thu, 14 Sep 2017 13:31:56 -0700 (PDT)
In-Reply-To: <1504739341-28234-2-git-send-email-christopher.w.clark@gmail.com>
References: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
	<1504739341-28234-2-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Sep 2017 16:31:56 -0400
Message-ID: <CADkTA4Pq3E4=sSx-Ne2YBbv_Umz1fd4BYmDV6BPGXppH3HmKxg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	nathan.studer@dornerworks.com
Subject: Re: RFC: [PATCH] xen-guest-image-minimal: Fix non-x86.
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
X-List-Received-Date: Thu, 14 Sep 2017 20:32:02 -0000
Content-Type: multipart/alternative; boundary="001a11c00044ec02ab05592c2af3"

--001a11c00044ec02ab05592c2af3
Content-Type: text/plain; charset="UTF-8"

I haven't heard any objections to this series, did you want to send it
again as a non RFC
and I'll get it merged.

Bruce

On Wed, Sep 6, 2017 at 7:09 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Fix xen-guest-image-minimal image for non-x86, both with and
> without x11 included.
>
> * Only install xf86-video-vesa on x86 platforms as it is not
>   available elsewhere.
>
> * In the absence of xf86-video-vesa (ie. on non-x86 platforms)
>   enable opengl and remove wayland from IMAGE_INSTALL to
>   satisfy build requirements for x11.
>
> * Use IMAGE_FEATURES instead of DISTRO_FEATURES to enable x11
>   inclusion in the image.
>
> * Verify the required DISTRO_FEATURE of 'xen' and if enabled, 'x11'.
>
> * When building the Xserver with Xen in DISTRO_FEATURES, on non-x86,
>   turn off glamor by default, to remove dependency on egl.
>   Introduces: xserver-xorg_%.bbappend
>
> Signed-off-by: Christopher Clark <christopher.w.clark@gmail.com>
> ---
>  recipes-extended/images/xen-guest-image-minimal.bb    | 16
> +++++++++++++---
>  recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 14 ++++++++++++++
>  2 files changed, 27 insertions(+), 3 deletions(-)
>  create mode 100644 recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
>
> diff --git a/recipes-extended/images/xen-guest-image-minimal.bb
> b/recipes-extended/images/xen-guest-image-minimal.bb
> index ab7e92c..bca6017 100644
> --- a/recipes-extended/images/xen-guest-image-minimal.bb
> +++ b/recipes-extended/images/xen-guest-image-minimal.bb
> @@ -1,14 +1,24 @@
>  DESCRIPTION = "A Xen guest image."
>
> -inherit core-image
> +inherit core-image distro_features_check
>
>  IMAGE_INSTALL += " \
>      packagegroup-core-boot \
>      ${@bb.utils.contains('MACHINE_FEATURES', 'acpi',
> 'kernel-module-xen-acpi-processor', '', d)} \
>      "
>
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> -IMAGE_INSTALL += "${@bb.utils.contains('DISTRO_FEATURES', 'x11', '
> xf86-video-vesa', '', d)}"
> +IMAGE_INSTALL += "${@bb.utils.contains('IMAGE_FEATURES', 'x11', '
> xf86-video-fbdev', '', d)}"
> +
> +# Install xf86-video-vesa on x86 platforms.
> +IMAGE_INSTALL_append_x86-64 = "${@bb.utils.contains('IMAGE_FEATURES',
> 'x11', ' xf86-video-vesa', '', d)}"
> +IMAGE_INSTALL_append_x86    = "${@bb.utils.contains('IMAGE_FEATURES',
> 'x11', ' xf86-video-vesa', '', d)}"
> +
> +# When xf86-video-vesa is not present, add opengl and don't require
> wayland:
> +DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
> +                             bb.utils.contains('IMAGE_INSTALL',
> 'xf86-video-vesa', '', ' opengl', d), '', d)}"
> +DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL',
> 'xf86-video-vesa', '', 'wayland', d)}"
> +
> +REQUIRED_DISTRO_FEATURES += "${@bb.utils.contains('IMAGE_FEATURES',
> 'x11', ' x11', '', d)} xen"
>
>  LICENSE = "MIT"
>
> diff --git a/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> new file mode 100644
> index 0000000..ff4b5b6
> --- /dev/null
> +++ b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> @@ -0,0 +1,14 @@
> +# Modify the default Xserver build for Xen images on non-x86:
> +# deselect glamor to remove the dependency on libegl,
> +# which simplifies domU builds.
> +# To override this (eg. if wanted for dom0 images) define:
> +#   REMOVED_OPENGL_PKGCONFIGS = ""
> +
> +DETECT_X86_ARCH        = "0"
> +DETECT_X86_ARCH_x86-64 = "1"
> +DETECT_X86_ARCH_x86    = "1"
> +
> +REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'xen', \
> +                                 bb.utils.contains('DETECT_X86_ARCH',
> '1', '', 'glamor', d), '', d)}"
> +
> +OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a11c00044ec02ab05592c2af3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I haven&#39;t heard any objections to this series, did you=
 want to send it again as a non RFC<div>and I&#39;ll get it merged.</div><d=
iv><br></div><div>Bruce</div></div><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Wed, Sep 6, 2017 at 7:09 PM,  <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:christopher.w.clark@gmail.com" target=3D"_blank">christophe=
r.w.clark@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>From: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.co=
m">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
<br>
Fix xen-guest-image-minimal image for non-x86, both with and<br>
without x11 included.<br>
<br>
* Only install xf86-video-vesa on x86 platforms as it is not<br>
=C2=A0 available elsewhere.<br>
<br>
* In the absence of xf86-video-vesa (ie. on non-x86 platforms)<br>
=C2=A0 enable opengl and remove wayland from IMAGE_INSTALL to<br>
=C2=A0 satisfy build requirements for x11.<br>
<br>
* Use IMAGE_FEATURES instead of DISTRO_FEATURES to enable x11<br>
=C2=A0 inclusion in the image.<br>
<br>
* Verify the required DISTRO_FEATURE of &#39;xen&#39; and if enabled, &#39;=
x11&#39;.<br>
<br>
* When building the Xserver with Xen in DISTRO_FEATURES, on non-x86,<br>
=C2=A0 turn off glamor by default, to remove dependency on egl.<br>
=C2=A0 Introduces: xserver-xorg_%.bbappend<br>
<br>
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.w.clark@=
gmail.com">christopher.w.clark@gmail.com</a><wbr>&gt;<br>
---<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a>=
=C2=A0 =C2=A0 | 16 +++++++++++++---<br>
=C2=A0recipes-graphics/xorg-xserver/<wbr>xserver-xorg_%.bbappend | 14 +++++=
+++++++++<br>
=C2=A02 files changed, 27 insertions(+), 3 deletions(-)<br>
=C2=A0create mode 100644 recipes-graphics/xorg-xserver/<wbr>xserver-xorg_%.=
bbappend<br>
<br>
diff --git a/recipes-extended/images/<a href=3D"http://xen-guest-image-mini=
mal.bb" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.b=
b</a> b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.b=
b" rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a>=
<br>
index ab7e92c..bca6017 100644<br>
--- a/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a><b=
r>
+++ b/recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a><b=
r>
@@ -1,14 +1,24 @@<br>
=C2=A0DESCRIPTION =3D &quot;A Xen guest image.&quot;<br>
<br>
-inherit core-image<br>
+inherit core-image distro_features_check<br>
<br>
=C2=A0IMAGE_INSTALL +=3D &quot; \<br>
=C2=A0 =C2=A0 =C2=A0packagegroup-core-boot \<br>
=C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;MACHINE_<wbr>FEATURES&#39;, &=
#39;acpi&#39;, &#39;kernel-module-xen-acpi-<wbr>processor&#39;, &#39;&#39;,=
 d)} \<br>
=C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
-IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, &#39; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
-IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr>FEATURES&#3=
9;, &#39;x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&#39;, d)}&quot;<br>
+IMAGE_INSTALL +=3D &quot;${@bb.utils.contains(&#39;IMAGE_<wbr>FEATURES&#39=
;, &#39;x11&#39;, &#39; xf86-video-fbdev&#39;, &#39;&#39;, d)}&quot;<br>
+<br>
+# Install xf86-video-vesa on x86 platforms.<br>
+IMAGE_INSTALL_append_x86-64 =3D &quot;${@bb.utils.contains(&#39;IMAGE_<wbr=
>FEATURES&#39;, &#39;x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&#39;, d)}&=
quot;<br>
+IMAGE_INSTALL_append_x86=C2=A0 =C2=A0 =3D &quot;${@bb.utils.contains(&#39;=
IMAGE_<wbr>FEATURES&#39;, &#39;x11&#39;, &#39; xf86-video-vesa&#39;, &#39;&=
#39;, d)}&quot;<br>
+<br>
+# When xf86-video-vesa is not present, add opengl and don&#39;t require wa=
yland:<br>
+DISTRO_FEATURES_append =3D &quot;${@bb.utils.contains(&#39;IMAGE_<wbr>FEAT=
URES&#39;, &#39;x11&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.contains(&#39;IMAGE_<wbr>INSTALL&#3=
9;, &#39;xf86-video-vesa&#39;, &#39;&#39;, &#39; opengl&#39;, d), &#39;&#39=
;, d)}&quot;<br>
+DISTRO_FEATURES_remove =3D &quot;${@bb.utils.contains(&#39;IMAGE_<wbr>INST=
ALL&#39;, &#39;xf86-video-vesa&#39;, &#39;&#39;, &#39;wayland&#39;, d)}&quo=
t;<br>
+<br>
+REQUIRED_DISTRO_FEATURES +=3D &quot;${@bb.utils.contains(&#39;IMAGE_<wbr>F=
EATURES&#39;, &#39;x11&#39;, &#39; x11&#39;, &#39;&#39;, d)} xen&quot;<br>
<br>
=C2=A0LICENSE =3D &quot;MIT&quot;<br>
<br>
diff --git a/recipes-graphics/xorg-<wbr>xserver/xserver-xorg_%.<wbr>bbappen=
d b/recipes-graphics/xorg-<wbr>xserver/xserver-xorg_%.<wbr>bbappend<br>
new file mode 100644<br>
index 0000000..ff4b5b6<br>
--- /dev/null<br>
+++ b/recipes-graphics/xorg-<wbr>xserver/xserver-xorg_%.<wbr>bbappend<br>
@@ -0,0 +1,14 @@<br>
+# Modify the default Xserver build for Xen images on non-x86:<br>
+# deselect glamor to remove the dependency on libegl,<br>
+# which simplifies domU builds.<br>
+# To override this (eg. if wanted for dom0 images) define:<br>
+#=C2=A0 =C2=A0REMOVED_OPENGL_PKGCONFIGS =3D &quot;&quot;<br>
+<br>
+DETECT_X86_ARCH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;0&quot;<br>
+DETECT_X86_ARCH_x86-64 =3D &quot;1&quot;<br>
+DETECT_X86_ARCH_x86=C2=A0 =C2=A0 =3D &quot;1&quot;<br>
+<br>
+REMOVED_OPENGL_PKGCONFIGS ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr=
>FEATURES&#39;, &#39;xen&#39;, \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.contains(&#39;DETECT_=
X86_<wbr>ARCH&#39;, &#39;1&#39;, &#39;&#39;, &#39;glamor&#39;, d), &#39;&#3=
9;, d)}&quot;<br>
+<br>
+OPENGL_PKGCONFIGS_remove =3D &quot;${REMOVED_OPENGL_PKGCONFIGS}&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--001a11c00044ec02ab05592c2af3--
