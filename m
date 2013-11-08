Return-Path: <cjp256@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00E98E01830
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Nov 2013 04:50:21 -0800 (PST)
Received: by mail-la0-f52.google.com with SMTP id ev20so1651265lab.25
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Nov 2013 04:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=n27yxGuUHo0LJ0cA+17DzGxF9Xza3qkw0NAe6hCY3bQ=;
	b=BahDBFVrDkHv7GxMUYxqPztqt8OsGeYFq5WqUc5dY9BC8B78ZhCHQ6ES3GsK1SNrQO
	34nm0XlRKjrXZjQsPiHirQM5OGiXc/VTrCwO3dVP+GmLaiBfwtLmCx0A8RYxGjQwJF9L
	VLZH9nOQSz0Sot2/glz6e3fYlYCPSJeUryLAnhawMGMsBCtbmaG4ug5E8OpMchHfYO24
	/MHAAKtkdTmbSkYFcPdbCo4bFbqym8K3Du7R7WWfoeNseILCRuhwcQC899Y0xuzocsmD
	sy3PZyeYH2Z0rUErjFX92X9EdTfzXSvFmeempoJ7cqmgBj2X2QW3425vlzHC1AaUsW47
	N77w==
MIME-Version: 1.0
X-Received: by 10.112.16.67 with SMTP id e3mr12760lbd.55.1383915019468; Fri,
	08 Nov 2013 04:50:19 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Fri, 8 Nov 2013 04:50:19 -0800 (PST)
In-Reply-To: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
References: <1383883267-31992-1-git-send-email-cjp256@gmail.com>
Date: Fri, 8 Nov 2013 07:50:19 -0500
Message-ID: <CABZSBQd_Nn4KdPohN6PyiAH-RGsU7zrTuuEj-1bb6gMzG_z1zQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2 00/10] xen cleanup and upgrades
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
X-List-Received-Date: Fri, 08 Nov 2013 12:50:24 -0000
Content-Type: multipart/alternative; boundary=001a11c3f9b22284d904eaa9d3ce

--001a11c3f9b22284d904eaa9d3ce
Content-Type: text/plain; charset=ISO-8859-1

Bounce messages say patches 2 & 8 are subject to moderator approval.

For future reference, it states a limit of 40 KB in the message body.

Cheers,
-Chris


On Thu, Nov 7, 2013 at 11:00 PM, Chris Patterson <cjp256@gmail.com> wrote:

> Cleaned out old xen bits, upgraded to 4.3.1, moved to common xen.inc,
> and added git recipe pointing to xen-unstable.
>
> I broke out the cleanup into smaller patches in hopes that it will make it
> through.
>
> If not, you can find these patches in branch=xen-upgrades-and-cleanup-v2
> at:
> https://github.com/cjp256/meta-virtualization.git
>
> Chris Patterson (10):
>   xen: remove xsm from default PACKAGECONFIG options.
>   xen: remove 4.1.2 recipe and patches
>   xen: remove xen-hg recipe and patches
>   xen: remove xen-rt recipe and patches
>   xen: remove old xen.inc and xen-python.inc
>   xen: remove old patches
>   xen: rename xen patches directory from xen-4.3.0 to files.
>   xen: upgrade to 4.3.1
>   xen: improve organization with new xen.inc
>   xen: add xen_git recipe.
>
>  .../xen/files/allow_disable_xend.patch             |   75 -
>  ...lask-avoid-installing-policy-file-as-boot.patch |   26 +
>  .../xen/files/ioemu-cross-gl-check.patch           |   29 -
>  recipes-extended/xen/files/xend-config.sxp         |  304 -
>  recipes-extended/xen/files/xenminiinit.sh          |   59 -
>  .../xen/xen-4.1.2/allow_disable_xend.patch         |   75 -
>  ...lask-avoid-installing-policy-file-as-boot.patch |   26 -
>  recipes-extended/xen/xen-hg.bb                     |   29 -
>  .../xen/xen-hg/ioemu-cross-gl-check.patch          |   29 -
>  .../xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch  |   48 -
>  recipes-extended/xen/xen-python.inc                |   49 -
>  recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch | 6785
> --------------------
>  recipes-extended/xen/xen-rt_4.0.1.bb               |   25 -
>  recipes-extended/xen/xen.inc                       |  902 ++-
>  recipes-extended/xen/xen_4.1.2.bb                  |   24 -
>  recipes-extended/xen/xen_4.3.0.bb                  |  650 --
>  recipes-extended/xen/xen_4.3.1.bb                  |   24 +
>  recipes-extended/xen/xen_git.bb                    |   18 +
>  18 files changed, 677 insertions(+), 8500 deletions(-)
>  delete mode 100644 recipes-extended/xen/files/allow_disable_xend.patch
>  create mode 100644
> recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>  delete mode 100644 recipes-extended/xen/files/ioemu-cross-gl-check.patch
>  delete mode 100644 recipes-extended/xen/files/xend-config.sxp
>  delete mode 100755 recipes-extended/xen/files/xenminiinit.sh
>  delete mode 100644 recipes-extended/xen/xen-4.1.2/allow_disable_xend.patch
>  delete mode 100644
> recipes-extended/xen/xen-4.3.0/flask-avoid-installing-policy-file-as-boot.patch
>  delete mode 100644 recipes-extended/xen/xen-hg.bb
>  delete mode 100644 recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patch
>  delete mode 100644
> recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch
>  delete mode 100644 recipes-extended/xen/xen-python.inc
>  delete mode 100644 recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch
>  delete mode 100644 recipes-extended/xen/xen-rt_4.0.1.bb
>  delete mode 100644 recipes-extended/xen/xen_4.1.2.bb
>  delete mode 100644 recipes-extended/xen/xen_4.3.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.3.1.bb
>  create mode 100644 recipes-extended/xen/xen_git.bb
>
> --
> 1.8.4.rc3
>
>

--001a11c3f9b22284d904eaa9d3ce
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Bounce messages say patches 2 &amp; 8 are subjec=
t to moderator approval.<br><br>For future reference, it states a limit of =
40 KB in the message body.<br><br></div>Cheers,<br></div>-Chris<br></div><d=
iv class=3D"gmail_extra">
<br><br><div class=3D"gmail_quote">On Thu, Nov 7, 2013 at 11:00 PM, Chris P=
atterson <span dir=3D"ltr">&lt;<a href=3D"mailto:cjp256@gmail.com" target=
=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"=
gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-=
left:1ex">
Cleaned out old xen bits, upgraded to 4.3.1, moved to common xen.inc,<br>
and added git recipe pointing to xen-unstable.<br>
<br>
I broke out the cleanup into smaller patches in hopes that it will make it =
through.<br>
<br>
If not, you can find these patches in branch=3Dxen-upgrades-and-cleanup-v2 =
at:<br>
<a href=3D"https://github.com/cjp256/meta-virtualization.git" target=3D"_bl=
ank">https://github.com/cjp256/meta-virtualization.git</a><br>
<br>
Chris Patterson (10):<br>
=A0 xen: remove xsm from default PACKAGECONFIG options.<br>
=A0 xen: remove 4.1.2 recipe and patches<br>
=A0 xen: remove xen-hg recipe and patches<br>
=A0 xen: remove xen-rt recipe and patches<br>
=A0 xen: remove old xen.inc and xen-python.inc<br>
=A0 xen: remove old patches<br>
=A0 xen: rename xen patches directory from xen-4.3.0 to files.<br>
=A0 xen: upgrade to 4.3.1<br>
=A0 xen: improve organization with new xen.inc<br>
=A0 xen: add xen_git recipe.<br>
<br>
=A0.../xen/files/allow_disable_xend.patch =A0 =A0 =A0 =A0 =A0 =A0 | =A0 75 =
-<br>
=A0...lask-avoid-installing-policy-file-as-boot.patch | =A0 26 +<br>
=A0.../xen/files/ioemu-cross-gl-check.patch =A0 =A0 =A0 =A0 =A0 | =A0 29 -<=
br>
=A0recipes-extended/xen/files/xend-config.sxp =A0 =A0 =A0 =A0 | =A0304 -<br=
>
=A0recipes-extended/xen/files/xenminiinit.sh =A0 =A0 =A0 =A0 =A0| =A0 59 -<=
br>
=A0.../xen/xen-4.1.2/allow_disable_xend.patch =A0 =A0 =A0 =A0 | =A0 75 -<br=
>
=A0...lask-avoid-installing-policy-file-as-boot.patch | =A0 26 -<br>
=A0recipes-extended/xen/<a href=3D"http://xen-hg.bb" target=3D"_blank">xen-=
hg.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 29 -<br>
=A0.../xen/xen-hg/ioemu-cross-gl-check.patch =A0 =A0 =A0 =A0 =A0| =A0 29 -<=
br>
=A0.../xen/xen-hg/tools_qemu_xen_remove_CFLAGS.patch =A0| =A0 48 -<br>
=A0recipes-extended/xen/xen-python.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
 49 -<br>
=A0recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch | 6785 --------------=
------<br>
=A0recipes-extended/xen/<a href=3D"http://xen-rt_4.0.1.bb" target=3D"_blank=
">xen-rt_4.0.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 25 -<br>
=A0recipes-extended/xen/xen.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 | =A0902 ++-<br>
=A0recipes-extended/xen/<a href=3D"http://xen_4.1.2.bb" target=3D"_blank">x=
en_4.1.2.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 24 -<br>
=A0recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" target=3D"_blank">x=
en_4.3.0.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0650 --<br>
=A0recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_blank">x=
en_4.3.1.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 24 +<br>
=A0recipes-extended/xen/<a href=3D"http://xen_git.bb" target=3D"_blank">xen=
_git.bb</a> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 18 +<br>
=A018 files changed, 677 insertions(+), 8500 deletions(-)<br>
=A0delete mode 100644 recipes-extended/xen/files/allow_disable_xend.patch<b=
r>
=A0create mode 100644 recipes-extended/xen/files/flask-avoid-installing-pol=
icy-file-as-boot.patch<br>
=A0delete mode 100644 recipes-extended/xen/files/ioemu-cross-gl-check.patch=
<br>
=A0delete mode 100644 recipes-extended/xen/files/xend-config.sxp<br>
=A0delete mode 100755 recipes-extended/xen/files/xenminiinit.sh<br>
=A0delete mode 100644 recipes-extended/xen/xen-4.1.2/allow_disable_xend.pat=
ch<br>
=A0delete mode 100644 recipes-extended/xen/xen-4.3.0/flask-avoid-installing=
-policy-file-as-boot.patch<br>
=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen-hg.bb" tar=
get=3D"_blank">xen-hg.bb</a><br>
=A0delete mode 100644 recipes-extended/xen/xen-hg/ioemu-cross-gl-check.patc=
h<br>
=A0delete mode 100644 recipes-extended/xen/xen-hg/tools_qemu_xen_remove_CFL=
AGS.patch<br>
=A0delete mode 100644 recipes-extended/xen/xen-python.inc<br>
=A0delete mode 100644 recipes-extended/xen/xen-rt/rt-xen_0.3_4.0.1.patch<br=
>
=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen-rt_4.0.1.b=
b" target=3D"_blank">xen-rt_4.0.1.bb</a><br>
=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.1.2.bb" =
target=3D"_blank">xen_4.1.2.bb</a><br>
=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.3.0.bb" =
target=3D"_blank">xen_4.3.0.bb</a><br>
=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" =
target=3D"_blank">xen_4.3.1.bb</a><br>
=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_git.bb" ta=
rget=3D"_blank">xen_git.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
1.8.4.rc3<br>
<br>
</font></span></blockquote></div><br></div>

--001a11c3f9b22284d904eaa9d3ce--
