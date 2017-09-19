Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 894D4E009F5; Tue, 19 Sep 2017 06:23:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D920E009F5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 06:23:28 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id t46so2294448qtj.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 19 Sep 2017 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ZKPWptA/nnuxzM3OTWWg5od8QfqyIO86Oqa/LHuWMaA=;
	b=vA2d4W3qgLhB6THaOOxfDa7HtACM3/c7w+6JT+DQuXksEHTqsM0lFvhhTNiQiTfRK9
	4wcY6+XNZ88yvguWQfnNOJ7uS4LPOXE20QdIKsarxWi9kaPb1TT/RH9hupLTiE8PfA+H
	VaJf3eFHItoa5EJJlG7xhZHsxeK4MiOfpJyWb8YyfD8BA3dTCjnygK8QVd1GjKpndD3y
	3uLulMbV0YG7QTM/msCuRv61nfAYSUOqHT9PGEfmRN1/MeyN70OS6Z5I1x5a6gQDf9NR
	7DcUMh4GLtAEk2aeUg1kSUwGR94MQUMaQqdkbhPWcDd2EUY7/QB4k/vRNGigqMEGOnyn
	8hhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ZKPWptA/nnuxzM3OTWWg5od8QfqyIO86Oqa/LHuWMaA=;
	b=eyZcQMbxIjApGsugkqFI20YaLxHJ9EX8yU4skLkMpr+3gLi0dbKZEjr8upxEOYYh1C
	UrKJV/QGezvHGutEulYPORK7CnZGY+3zfi9ztpgNv71LLORzbjypMpZeNkrBrxL2JVJy
	1NsrTmZKZqprBxQIB8hev6kmJq1DC+cH2Fzo2R9eooHiq/KH+6OE14hZanK8ZH+KaAdh
	8GNo5Twx3P56F7fYrSwijsA5/WtqEa/opYMr84uCZ5BZUu8FHxLI0o4jcZEZssMujVPw
	uLAj2H+HYa9I/HbgFvr6w22H26c5Ts+6D0aG6/XiRmHCpSP3LPJ3S9xfHIkC/xGx/F3j
	5ASQ==
X-Gm-Message-State: AHPjjUjnIxKLOca2Nk66YQ6SDBj+Ce8J8OKgs6/QtHjNqs2UhtLZbxHu
	oolW0gF6vB6WhTxvwldQXOvtgoTZeZgt+UeRfvM=
X-Google-Smtp-Source: AOwi7QB/VmpljXnQIKKWCg3LFl7eYUkz/tOVrCiBJ61bdqofCOPAfYYNvLa/rUWa8dtVL8QgycepAr3Ltd1bG+YZ25w=
X-Received: by 10.200.28.117 with SMTP id j50mr2019975qtk.312.1505827407219;
	Tue, 19 Sep 2017 06:23:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.148.104 with HTTP; Tue, 19 Sep 2017 06:23:26 -0700 (PDT)
In-Reply-To: <1505697698-15124-1-git-send-email-christopher.w.clark@gmail.com>
References: <1505697698-15124-1-git-send-email-christopher.w.clark@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 19 Sep 2017 09:23:26 -0400
Message-ID: <CADkTA4OkOKbv74DQN=DXBXpQxVr7d-XZ-5rqdjETRUak5eGpbg@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	nathan.studer@dornerworks.com
Subject: Re: [PATCH] xen-guest-image-minimal: Fix non-x86. Select x11 via IMAGE_FEATURES.
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
X-List-Received-Date: Tue, 19 Sep 2017 13:23:29 -0000
Content-Type: multipart/alternative; boundary="94eb2c114eeeb34fcd05598ac367"

--94eb2c114eeeb34fcd05598ac367
Content-Type: text/plain; charset="UTF-8"

All outstanding Xen patches are now merged.

Bruce

On Sun, Sep 17, 2017 at 9:21 PM, <christopher.w.clark@gmail.com> wrote:

> From: Christopher Clark <christopher.w.clark@gmail.com>
>
> Fix the image for non-x86, both with and without x11 included.
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
> Signed-off-by: Christopher Clark <christopher.clark6@baesystems.com>
> ---
>
> Changes in this non-RFC patch version: simplified the xorg-xserver
> bbappend.
>
> Please use my gmail address for any correspondence.
>
>  recipes-extended/images/xen-guest-image-minimal.bb    | 16
> +++++++++++++---
>  recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend | 13 +++++++++++++
>  2 files changed, 26 insertions(+), 3 deletions(-)
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
> index 0000000..9503404
> --- /dev/null
> +++ b/recipes-graphics/xorg-xserver/xserver-xorg_%.bbappend
> @@ -0,0 +1,13 @@
> +# Change the default Xserver OpenGL configuration for non-x86 distros
> with Xen: deselect 'glamor'.
> +# This removes the dependency on libegl to simplify the domU build.
> +#
> +# To override this (eg. if wanted for dom0 images) define:
> +#   REMOVED_OPENGL_PKGCONFIGS = ""
> +
> +XEN_REMOVED_OPENGL_PKGCONFIGS ?= "glamor"
> +XEN_REMOVED_OPENGL_PKGCONFIGS_x86 = ""
> +XEN_REMOVED_OPENGL_PKGCONFIGS_x86-64 = ""
> +
> +REMOVED_OPENGL_PKGCONFIGS ?= "${@bb.utils.contains('DISTRO_FEATURES',
> 'xen', "${XEN_REMOVED_OPENGL_PKGCONFIGS}", '', d)}"
> +
> +OPENGL_PKGCONFIGS_remove = "${REMOVED_OPENGL_PKGCONFIGS}"
> --
> 2.7.4
>
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c114eeeb34fcd05598ac367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">All outstanding Xen patches are now merged.<div><br></div>=
<div>Bruce</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_qu=
ote">On Sun, Sep 17, 2017 at 9:21 PM,  <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:christopher.w.clark@gmail.com" target=3D"_blank">christopher.w.clark@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">From: Chris=
topher Clark &lt;<a href=3D"mailto:christopher.w.clark@gmail.com">christoph=
er.w.clark@gmail.com</a><wbr>&gt;<br>
<br>
Fix the image for non-x86, both with and without x11 included.<br>
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
Signed-off-by: Christopher Clark &lt;<a href=3D"mailto:christopher.clark6@b=
aesystems.com">christopher.clark6@<wbr>baesystems.com</a>&gt;<br>
---<br>
<br>
Changes in this non-RFC patch version: simplified the xorg-xserver bbappend=
.<br>
<br>
Please use my gmail address for any correspondence.<br>
<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 rel=3D"noreferrer" target=3D"_blank">xen-<wbr>guest-image-minimal.bb</a>=
=C2=A0 =C2=A0 | 16 +++++++++++++---<br>
=C2=A0recipes-graphics/xorg-xserver/<wbr>xserver-xorg_%.bbappend | 13 +++++=
++++++++<br>
=C2=A02 files changed, 26 insertions(+), 3 deletions(-)<br>
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
index 0000000..9503404<br>
--- /dev/null<br>
+++ b/recipes-graphics/xorg-<wbr>xserver/xserver-xorg_%.<wbr>bbappend<br>
@@ -0,0 +1,13 @@<br>
+# Change the default Xserver OpenGL configuration for non-x86 distros with=
 Xen: deselect &#39;glamor&#39;.<br>
+# This removes the dependency on libegl to simplify the domU build.<br>
+#<br>
+# To override this (eg. if wanted for dom0 images) define:<br>
+#=C2=A0 =C2=A0REMOVED_OPENGL_PKGCONFIGS =3D &quot;&quot;<br>
+<br>
+XEN_REMOVED_OPENGL_PKGCONFIGS ?=3D &quot;glamor&quot;<br>
+XEN_REMOVED_OPENGL_<wbr>PKGCONFIGS_x86 =3D &quot;&quot;<br>
+XEN_REMOVED_OPENGL_<wbr>PKGCONFIGS_x86-64 =3D &quot;&quot;<br>
+<br>
+REMOVED_OPENGL_PKGCONFIGS ?=3D &quot;${@bb.utils.contains(&#39;DISTRO_<wbr=
>FEATURES&#39;, &#39;xen&#39;, &quot;${XEN_REMOVED_OPENGL_<wbr>PKGCONFIGS}&=
quot;, &#39;&#39;, d)}&quot;<br>
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

--94eb2c114eeeb34fcd05598ac367--
