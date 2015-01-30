Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6C75EE00828; Thu, 29 Jan 2015 20:45:05 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,HTML_MESSAGE,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC2B5E007CF
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 20:44:58 -0800 (PST)
Received: by mail-la0-f41.google.com with SMTP id gm9so21869390lab.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Jan 2015 20:44:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=L1ripEBPYWh7HnlWBFgoLwScyM2oRjixq4KJfUE/vSk=;
	b=BNhvDc8lbgv8hG9pBfp9rIy55voad9kZjk86WWm6wYAWmckamUN/t/hCZbXyQ4AgKA
	qW68i81yw+k7ea73IN20HhlLgCpgiZXCHDJe3dv3sCqE1Qr08ZWGXdFLmHesGPCZR9ZD
	B36hGMxpqCG8eu6dzru9o84T+4IDWye4xnvD+wK5nyLqHYaknuX2gioYBE9JYQY8Ei8t
	YluK2ksaBvcshQDzeZDq8O8EbMeqllJFhflNmgi+2M8Vdua4nfo3fHsV6b1L5hM5+/75
	hy23ApKvs22/vBmmf7h2Scy8NlraEd8b5JNTHp+sZJ1WxHxpcefBjcNx1HHTMzf0vbNX
	1lpg==
MIME-Version: 1.0
X-Received: by 10.152.87.210 with SMTP id ba18mr4608026lab.3.1422593096147;
	Thu, 29 Jan 2015 20:44:56 -0800 (PST)
Received: by 10.114.182.115 with HTTP; Thu, 29 Jan 2015 20:44:56 -0800 (PST)
In-Reply-To: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
References: <fa0c0be68aa042b6bede0c2f644a2c42@BN1BFFO11FD008.protection.gbl>
Date: Thu, 29 Jan 2015 23:44:56 -0500
Message-ID: <CABZSBQfHtwWRJ62pW3XnAQRBX6HW06d3fqUDG8=zqNv5f+R5-w@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Nathan Rossi <nathan.rossi@xilinx.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [RFC 0/8] Update to Xen 4.5.0 and add AArch64 support
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
X-List-Received-Date: Fri, 30 Jan 2015 04:45:05 -0000
Content-Type: multipart/alternative; boundary=001a11c23d6427e7ee050dd74496

--001a11c23d6427e7ee050dd74496
Content-Type: text/plain; charset=UTF-8

Nice! :)  I'll try to take this for a test drive this weekend and provide
some feedback.

On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi <nathan.rossi@xilinx.com>
wrote:

> This patch series updates the Xen recipes to use version 4.5.0 as well as
> refactoring and adding support for AArch64.
>
> The first 6 patches of this series are relatively trivial changes: adding
> additional files to packages, updating dependencies and adding support for
> additional architectures ontop of x86-64. The most important change is the
> moving of some x86 of the packages from xen-base RDEPENDS to RRECOMMENDS.
>
> Patches 7 and 8 are the reason for this set being a RFC instead of just a
> patch
> set, I am after feedback regarding the changes I have made for these
> patches.
> In these two patches I disabled the building of xen-qemu and seabios from
> within the xen build system. There are a number of issues in wrapping the
> xen
> build system within OE (including source fetching and cross building).
>
> Instead of building qemu from within xen, I have configured the qemu which
> is
> part of oe-core to build with xen support (PACKAGECONFIG_append = "xen").
> Since
> xen support is available in mainline qemu this allows for easier support
> of the
> xen device emulation via qemu. The PACKAGECONFIG option in oe-core does
> need to
> be updated to point to the correct depends (which is seperate to this patch
> set).
>
> SeaBIOS is disabled due to fetching issues as well as only being supported
> on
> x86. I have not worked out the issues around this yet. I am querying as to
> whether supporting it is desired, if so should it be via the xen build
> system
> or as a seperate recipe?
>
> Thanks,
> Nathan
>
> Nathan Rossi (8):
>   xen: Fix and refactor common include
>   xen: Add Build and Target architecture mapping
>   xen: Move x86/arch specific components into RRECOMMENDS
>   xen: Fix up architecture specific steps
>   xen: Add aarch64 as compatible host
>   xen-*image-minimal: Setup conditional based on MACHINE_FEATURES
>   xen: Update recipe to 4.5.0
>   xen-image-minimal: Install qemu instead of xen-qemu
>
>  recipes-extended/images/xen-guest-image-minimal.bb |   2 +-
>  recipes-extended/images/xen-image-minimal.bb       |   6 +-
>  ...lask-avoid-installing-policy-file-as-boot.patch |  26 -----
>  recipes-extended/xen/xen-arch.inc                  |  18 ++++
>  recipes-extended/xen/xen.inc                       | 113
> +++++++++++++++++----
>  recipes-extended/xen/xen_4.3.1.bb                  |  24 -----
>  recipes-extended/xen/xen_4.5.0.bb                  |  36 +++++++
>  7 files changed, 150 insertions(+), 75 deletions(-)
>  delete mode 100644
> recipes-extended/xen/files/flask-avoid-installing-policy-file-as-boot.patch
>  create mode 100644 recipes-extended/xen/xen-arch.inc
>  delete mode 100644 recipes-extended/xen/xen_4.3.1.bb
>  create mode 100644 recipes-extended/xen/xen_4.5.0.bb
>
> --
> 2.1.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a11c23d6427e7ee050dd74496
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Nice! :) =C2=A0I&#39;ll try to take this for a test drive =
this weekend and provide some feedback.</div><div class=3D"gmail_extra"><br=
><div class=3D"gmail_quote">On Thu, Jan 29, 2015 at 10:31 PM, Nathan Rossi =
<span dir=3D"ltr">&lt;<a href=3D"mailto:nathan.rossi@xilinx.com" target=3D"=
_blank">nathan.rossi@xilinx.com</a>&gt;</span> wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">This patch series updates the Xen recipes to use version 4.5.=
0 as well as<br>
refactoring and adding support for AArch64.<br>
<br>
The first 6 patches of this series are relatively trivial changes: adding<b=
r>
additional files to packages, updating dependencies and adding support for<=
br>
additional architectures ontop of x86-64. The most important change is the<=
br>
moving of some x86 of the packages from xen-base RDEPENDS to RRECOMMENDS.<b=
r>
<br>
Patches 7 and 8 are the reason for this set being a RFC instead of just a p=
atch<br>
set, I am after feedback regarding the changes I have made for these patche=
s.<br>
In these two patches I disabled the building of xen-qemu and seabios from<b=
r>
within the xen build system. There are a number of issues in wrapping the x=
en<br>
build system within OE (including source fetching and cross building).<br>
<br>
Instead of building qemu from within xen, I have configured the qemu which =
is<br>
part of oe-core to build with xen support (PACKAGECONFIG_append =3D &quot;x=
en&quot;). Since<br>
xen support is available in mainline qemu this allows for easier support of=
 the<br>
xen device emulation via qemu. The PACKAGECONFIG option in oe-core does nee=
d to<br>
be updated to point to the correct depends (which is seperate to this patch=
<br>
set).<br>
<br>
SeaBIOS is disabled due to fetching issues as well as only being supported =
on<br>
x86. I have not worked out the issues around this yet. I am querying as to<=
br>
whether supporting it is desired, if so should it be via the xen build syst=
em<br>
or as a seperate recipe?<br>
<br>
Thanks,<br>
Nathan<br>
<br>
Nathan Rossi (8):<br>
=C2=A0 xen: Fix and refactor common include<br>
=C2=A0 xen: Add Build and Target architecture mapping<br>
=C2=A0 xen: Move x86/arch specific components into RRECOMMENDS<br>
=C2=A0 xen: Fix up architecture specific steps<br>
=C2=A0 xen: Add aarch64 as compatible host<br>
=C2=A0 xen-*image-minimal: Setup conditional based on MACHINE_FEATURES<br>
=C2=A0 xen: Update recipe to 4.5.0<br>
=C2=A0 xen-image-minimal: Install qemu instead of xen-qemu<br>
<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-guest-image-minimal.bb"=
 target=3D"_blank">xen-guest-image-minimal.bb</a> |=C2=A0 =C2=A02 +-<br>
=C2=A0recipes-extended/images/<a href=3D"http://xen-image-minimal.bb" targe=
t=3D"_blank">xen-image-minimal.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
=C2=A0...lask-avoid-installing-policy-file-as-boot.patch |=C2=A0 26 -----<b=
r>
=C2=A0recipes-extended/xen/xen-arch.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 18 ++++<br>
=C2=A0recipes-extended/xen/xen.inc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 113 +++++++++++++++++----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.3.1.bb" target=3D"_blank=
">xen_4.3.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 24 -----<br>
=C2=A0recipes-extended/xen/<a href=3D"http://xen_4.5.0.bb" target=3D"_blank=
">xen_4.5.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 |=C2=A0 36 +++++++<br>
=C2=A07 files changed, 150 insertions(+), 75 deletions(-)<br>
=C2=A0delete mode 100644 recipes-extended/xen/files/flask-avoid-installing-=
policy-file-as-boot.patch<br>
=C2=A0create mode 100644 recipes-extended/xen/xen-arch.inc<br>
=C2=A0delete mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.3.1.b=
b" target=3D"_blank">xen_4.3.1.bb</a><br>
=C2=A0create mode 100644 recipes-extended/xen/<a href=3D"http://xen_4.5.0.b=
b" target=3D"_blank">xen_4.5.0.bb</a><br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.1<br>
<br>
--<br>
_______________________________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</font></span></blockquote></div><br></div>

--001a11c23d6427e7ee050dd74496--
