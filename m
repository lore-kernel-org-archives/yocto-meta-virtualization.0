Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24F41E00DBD; Wed, 19 Jun 2019 11:08:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.65 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  0.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
	[209.85.208.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 48B51E00DA7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Jun 2019 11:08:06 -0700 (PDT)
Received: by mail-ed1-f65.google.com with SMTP id z25so567031edq.9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 19 Jun 2019 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=V6/d0hKaR3HG2cP5de4LoQp1e3eUX1Bke0OxHKPLB0Q=;
	b=UAue18vM4ZpcKEROhXTdXPVNQmNFGwXF4d6u21mMEKXFxxvZYi0T3uEnUhU/XsfSW6
	i32+xJhokZmN4O0GA8t57/SXP2fCihYyD0fVN5V+3643j1i9Yt6Q6+oF0uhIfAXo5gHK
	OWh8520/KDwS1PRnIIBm+w0xhlkJqnrsLay9hnnx7qpCbngWVB7mLdHAhnCnzBTLPzWb
	w5Erq3pcj27pSJ336D3r+Z5ByVlpZWT8MoWtCSaZpi06VCgwnFhvkIpTNTqi1ILDv4qa
	zCTd9tyfuJE7pHS863zTA448+TSQbnP8A0MDm/aXg4MAgVS6AWY0a14WkTZ/0DpVVzlV
	6YTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=V6/d0hKaR3HG2cP5de4LoQp1e3eUX1Bke0OxHKPLB0Q=;
	b=l03cNXH1tApoxHaNBOYnQwL7LU2WGsMNdMjwkyC3qn0+JZ5uA/gIBT4rHXaaLd5JHj
	KsS0lw7O7zbdha0xiNA4T44s/sKFIPr7w+cNh7gzJSAJuh8gYBEleb9l9ulzikJgWm6X
	VZdYhJOXdSf5uzuZ3HF70wMxGJkkNuf0ovnoTpohGkJU0SG+1pHIga9ITcwUt1sQh7na
	zIPXOVWahS4ZQhz36w3C8oJj3ZCVzYqAIA00E0NJfIPVia16KSCjX/FozqVWTSfl1zlH
	o01aHZMuyNIRNMdz3McdSBq5eTjjyTpL6RKAUsKXU0oOm31NfIw8wNkHxkGaBXuNRdZ/
	u1EQ==
X-Gm-Message-State: APjAAAXnGolBiVrnNC704UG5UpUFBMvzxgaVkt4Q6RkrznSaPmgRLbfc
	uHq+69Kcc9qsbfVh6Ka49dDCYa1nXxeNONLXfuk=
X-Google-Smtp-Source: APXvYqyzoZd1ba+sUvrmwb0IfJ/S8N3oFvLQaVYwWdG+ixtGiUN0pqEdJq7GuxmnkaBV+KvcZm6tf+FEG4YTr3CI3CQ=
X-Received: by 2002:a17:906:5a46:: with SMTP id
	l6mr37230079ejs.160.1560967684942; 
	Wed, 19 Jun 2019 11:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <1560628531-12119-1-git-send-email-bostancioglucevat@gmail.com>
	<CADkTA4MyGz2U=KKGN+E6FGJPFioekxoz736KUoFo8PxNGJiVUA@mail.gmail.com>
In-Reply-To: <CADkTA4MyGz2U=KKGN+E6FGJPFioekxoz736KUoFo8PxNGJiVUA@mail.gmail.com>
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Wed, 19 Jun 2019 21:07:53 +0300
Message-ID: <CABPcKDPbnnZ0F0iR8KCtg37ewjJ+eQ1XgiQGDJfHsjKfPj4gCQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
X-Mailman-Approved-At: Wed, 19 Jun 2019 11:39:27 -0700
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] kvmtool: Werror Disabled Patch
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
X-List-Received-Date: Wed, 19 Jun 2019 18:08:14 -0000
Content-Type: multipart/alternative; boundary="0000000000005deefa058bb11cf5"

--0000000000005deefa058bb11cf5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

These patch fixes, sizeof-pointer-memaccess, format-truncation gcc erros. I
am disabling Werror because in makefile, they are adding Werror check last
and what we add in CFLAGS is not important for warnings.
i fixed the logs.


Bruce Ashfield <bruce.ashfield@gmail.com>, 18 Haz 2019 Sal, 07:06 tarihinde
=C5=9Funu yazd=C4=B1:

> On Sat, Jun 15, 2019 at 3:56 PM Cevat Bostancioglu
> <bostancioglucevat@gmail.com> wrote:
> >
> > Couple of compile time warnings turned into errors with Werror command,
> this patch disables this feature.
>
> Out of curiosity. Is there no way to fix the warnings ? Versus
> disabling Werror ? We want to log the reason why we've made this
> choice, since it is useful information when an eventual uprev of the
> package is done.
>
> >
> > Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > ---
> >  .../files/0003-kvmtool-Werror-disabled.patch       | 640
> +++++++++++++++++++++
> >  1 file changed, 640 insertions(+)
> >  create mode 100644
> recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> >
> > diff --git
> a/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> > new file mode 100644
> > index 0000000..46f5be1
> > --- /dev/null
> > +++ b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patch
> > @@ -0,0 +1,640 @@
> > +From 21b712587a3c424ddf4df897a28dfda7e2af0bd9 Mon Sep 17 00:00:00 2001
> > +From: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > +Date: Sat, 15 Jun 2019 19:41:16 +0000
> > +Subject: [PATCH] kvmtool: Werror disabled "DEBUG: Executing shell
> function
>
> Something has gone wrong with the patch itself. The text "DEBUG:
> Executing shell function
> will be in the patch shortlog, when it shouldn't be.
>
> > + do_compile NOTE: make -j 8 V=3D1
> > +
> EXTRA_CFLAGS=3D-I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated
>
> While we want to capture some details .. it is hard to actually see
> the warnings that are becoming errors in this long log. Can it be cut
> down a bit ?
>
> Bruce
>
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + Makefile:310: Skipping optional libraries: bfd KVMTOOLS_VERSION =3D
> 3.18.0
> > + Makefile:310: Skipping optional libraries: bfd
> arm-poky-linux-gnueabi-gcc
> > + -march=3Darmv5e -marm -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2
> -Wformat
> > + -Wformat-security -Werror=3Dformat-security
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-balloon.o.d  -O2 -pipe -g
> > + -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-balloon.c -o
> builtin-balloon.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-debug.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-debug.c -o builtin-debug=
.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-help.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-help.c -o builtin-help.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-list.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-list.c -o builtin-list.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-stat.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stat.c -o builtin-stat.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-pause.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-pause.c -o builtin-pause=
.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-resume.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-resume.c -o
> builtin-resume.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-run.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-run.c -o builtin-run.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-setup.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-setup.c -o builtin-setup=
.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-stop.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stop.c -o builtin-stop.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.devices.o.d  -O2 -pipe -g -feliminate-unused-debug-type=
s
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT devices.c -o devices.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,disk/.core.o.d  -O2 -pipe -g -feliminate-unused-debug-type=
s
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT disk/core.c -o disk/core.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.builtin-version.o.d  -O2 -pipe -g
> > + -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-version.c -o
> builtin-version.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.framebuffer.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT framebuffer.c -o framebuffer.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.guest_compat.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT guest_compat.c -o guest_compat.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,hw/.rtc.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/rtc.c -o hw/rtc.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,hw/.serial.o.d  -O2 -pipe -g -feliminate-unused-debug-type=
s
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/serial.c -o hw/serial.o
> > + builtin-run.c: In function 'kvm_run_write_sandbox_cmd.isra.1':
> > + builtin-run.c:412:28: error: '%s' directive output may be truncated
> writing
> > + up to 4095 bytes into a region of size 4091
> [-Werror=3Dformat-truncation=3D]
> > + snprintf(dst, len, "/host%s", resolved_path);
>    ^~
> > +  ~~~~~~~~~~~~~ In file included from
> > +
> /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5=
e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26=
eecc-r0/recipe-sysroot/usr/include/stdio.h:873,
> > +                  from include/kvm/util.h:13,                  from
> > + include/kvm/builtin-run.h:4,                  from builtin-run.c:1:
> > +
> /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5=
e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26=
eecc-r0/recipe-sysroot/usr/include/bits/stdio2.h:67:10:
> > + note: '__builtin___snprintf_chk' output between 6 and 4101 bytes into=
 a
> > + destination of size 4096    return __builtin___snprintf_chk (__s, __n=
,
> > + __USE_FORTIFY_LEVEL - 1,
> > + ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>  __bos
> > + (__s), __fmt, __va_arg_pack ());
> > + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ arm-poky-linux-gnueabi-gcc
> > + -march=3Darmv5e -marm -fstack-protector-strong  -D_FORTIFY_SOURCE=3D2
> -Wformat
> > + -Wformat-security -Werror=3Dformat-security
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.ioport.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT ioport.c -o ioport.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.irq.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT irq.c -o irq.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.kvm-cpu.o.d  -O2 -pipe -g -feliminate-unused-debug-type=
s
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm-cpu.c -o kvm-cpu.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.kvm.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm.c -o kvm.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.main.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT main.c -o main.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.mmio.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT mmio.c -o mmio.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.pci.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT pci.c -o pci.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,./.term.o.d  -O2 -pipe -g -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT term.c -o term.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.blk.o.d  -O2 -pipe -g -feliminate-unused-debug-typ=
es
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/blk.c -o virtio/blk.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.scsi.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/scsi.c -o virtio/scsi.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.console.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/console.c -o
> virtio/console.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.core.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/core.c -o virtio/core.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.net.o.d  -O2 -pipe -g -feliminate-unused-debug-typ=
es
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/net.c -o virtio/net.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.rng.o.d  -O2 -pipe -g -feliminate-unused-debug-typ=
es
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/rng.c -o virtio/rng.o
> > + arm-poky-linux-gnueabi-gcc  -march=3Darmv5e -marm
> -fstack-protector-strong
> > + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-sec=
urity
> > +
> --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tm=
p/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83=
a78849c0ea26eecc-r0/recipe-sysroot
> > + -c -Wp,-MD,virtio/.balloon.o.d  -O2 -pipe -g
> -feliminate-unused-debug-types
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882a49f8=
1cb15d328ef83a78849c0ea26eecc-r0
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D
> > +
> -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/bui=
ld_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb1=
5d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D
> > +
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/include/generated
> > +
> -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work-sha=
red/qemuarm/kernel-build-artifacts/arch/arm/include/generated
> > + -march=3Darmv7-a -DCONFIG_GUEST_INIT  -DCONFIG_ARM -D_FILE_OFFSET_BIT=
S=3D64
> > + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D'"3.18.0"' -DBUILD_ARCH=3D'"arm"'
> -Iinclude
> > + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wall
> > + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes
> > + -Wnested-externs -Wno-system-headers -Wold-style-definition
> -Wredundant-decls
> > + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var
> > + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB
> > + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/balloon.c -o
> virtio/balloon.o
> > + cc1: all warnings being treated as errors Makefile:431: recipe for
> target
> > + 'builtin-run.o' failed make: *** [builtin-run.o] Error 1 make: ***
> Waiting
> > + for unfinished jobs.... virtio/net.c: In function
> 'virtio_net__tap_init':
> > + virtio/net.c:336:47: error: argument to 'sizeof' in 'strncpy' call is
> the
> > + same expression as the source; did you mean to use the size of the
> > + destination? [-Werror=3Dsizeof-pointer-memaccess]
> strncpy(ifr.ifr_name,
> > + ndev->tap_name, sizeof(ndev->tap_name));
> > +           ^ virtio/net.c:348:47: error: argument to 'sizeof' in
> 'strncpy'
> > + call is the same expression as the source; did you mean to use the
> size of
> > + the destination? [-Werror=3Dsizeof-pointer-memaccess]
> strncpy(ifr.ifr_name,
> > + ndev->tap_name, sizeof(ndev->tap_name));
> > +           ^ cc1: all warnings being treated as errors Makefile:431:
> recipe
> > + for target 'virtio/net.o' failed make: *** [virtio/net.o] Error 1
> ERROR:
> > + oe_runmake failed WARNING: exit code 1 from a shell command. ERROR:
> Function
> > + failed: do_compile (log file is located at
> > +
> /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/armv5=
e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c0ea26=
eecc-r0/temp/log.do_compile.7489)
> > + "
> > +
> > +Signed-off-by: Cevat Bostancioglu <bostancioglucevat@gmail.com>
> > +---
> > + Makefile | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/Makefile b/Makefile
> > +index 030ff4e..fc5e177 100644
> > +--- a/Makefile
> > ++++ b/Makefile
> > +@@ -2,6 +2,7 @@
> > + # Define WERROR=3D0 to disable -Werror.
> > + #
> > +
> > ++WERROR =3D 0
> > + ifeq ($(strip $(V)),)
> > +       E =3D @echo
> > +       Q =3D @
> > +--
> > +2.7.4
> > +
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>

--0000000000005deefa058bb11cf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">These patch fixes, sizeof-pointer-memaccess, format-trunca=
tion gcc erros. I am disabling Werror because in makefile, they are adding =
Werror check last and what we add in CFLAGS is not important for warnings.<=
br>i fixed the logs.<div><br></div></div><br><div class=3D"gmail_quote"><di=
v dir=3D"ltr" class=3D"gmail_attr">Bruce Ashfield &lt;<a href=3D"mailto:bru=
ce.ashfield@gmail.com">bruce.ashfield@gmail.com</a>&gt;, 18 Haz 2019 Sal, 0=
7:06 tarihinde =C5=9Funu yazd=C4=B1:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Sat, Jun 15, 2019 at 3:56 PM Cevat Bostancioglu<br>
&lt;<a href=3D"mailto:bostancioglucevat@gmail.com" target=3D"_blank">bostan=
cioglucevat@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Couple of compile time warnings turned into errors with Werror command=
, this patch disables this feature.<br>
<br>
Out of curiosity. Is there no way to fix the warnings ? Versus<br>
disabling Werror ? We want to log the reason why we&#39;ve made this<br>
choice, since it is useful information when an eventual uprev of the<br>
package is done.<br>
<br>
&gt;<br>
&gt; Signed-off-by: Cevat Bostancioglu &lt;<a href=3D"mailto:bostanciogluce=
vat@gmail.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../files/0003-kvmtool-Werror-disabled.patch=C2=A0 =C2=A0 =C2=A0=
 =C2=A0| 640 +++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 640 insertions(+)<br>
&gt;=C2=A0 create mode 100644 recipes-extended/kvmtool/files/0003-kvmtool-W=
error-disabled.patch<br>
&gt;<br>
&gt; diff --git a/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabl=
ed.patch b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patc=
h<br>
&gt; new file mode 100644<br>
&gt; index 0000000..46f5be1<br>
&gt; --- /dev/null<br>
&gt; +++ b/recipes-extended/kvmtool/files/0003-kvmtool-Werror-disabled.patc=
h<br>
&gt; @@ -0,0 +1,640 @@<br>
&gt; +From 21b712587a3c424ddf4df897a28dfda7e2af0bd9 Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Cevat Bostancioglu &lt;<a href=3D"mailto:bostancioglucevat@gmai=
l.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;<br>
&gt; +Date: Sat, 15 Jun 2019 19:41:16 +0000<br>
&gt; +Subject: [PATCH] kvmtool: Werror disabled &quot;DEBUG: Executing shel=
l function<br>
<br>
Something has gone wrong with the patch itself. The text &quot;DEBUG:<br>
Executing shell function<br>
will be in the patch shortlog, when it shouldn&#39;t be.<br>
<br>
&gt; + do_compile NOTE: make -j 8 V=3D1<br>
&gt; + EXTRA_CFLAGS=3D-I/home/cevat/Desktop/meta-virtualization-ci/yocto/bu=
ild_arm/tmp/work-shared/qemuarm/kernel-build-artifacts/include/generated<br=
>
<br>
While we want to capture some details .. it is hard to actually see<br>
the warnings that are becoming errors in this long log. Can it be cut<br>
down a bit ?<br>
<br>
Bruce<br>
<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + Makefile:310: Skipping optional libraries: bfd KVMTOOLS_VERSION =3D =
3.18.0<br>
&gt; + Makefile:310: Skipping optional libraries: bfd arm-poky-linux-gnueab=
i-gcc<br>
&gt; + -march=3Darmv5e -marm -fstack-protector-strong=C2=A0 -D_FORTIFY_SOUR=
CE=3D2 -Wformat<br>
&gt; + -Wformat-security -Werror=3Dformat-security<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-balloon.o.d=C2=A0 -O2 -pipe -g<br>
&gt; + -feliminate-unused-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-balloon.c -o builtin-ba=
lloon.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-debug.o.d=C2=A0 -O2 -pipe -g -feliminate-unuse=
d-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-debug.c -o builtin-debu=
g.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-help.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-help.c -o builtin-help.=
o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-list.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-list.c -o builtin-list.=
o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-stat.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stat.c -o builtin-stat.=
o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-pause.o.d=C2=A0 -O2 -pipe -g -feliminate-unuse=
d-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-pause.c -o builtin-paus=
e.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-resume.o.d=C2=A0 -O2 -pipe -g -feliminate-unus=
ed-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-resume.c -o builtin-res=
ume.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-run.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-=
debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-run.c -o builtin-run.o<=
br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-setup.o.d=C2=A0 -O2 -pipe -g -feliminate-unuse=
d-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-setup.c -o builtin-setu=
p.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-stop.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-stop.c -o builtin-stop.=
o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.devices.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debu=
g-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT devices.c -o devices.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,disk/.core.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debu=
g-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT disk/core.c -o disk/core.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.builtin-version.o.d=C2=A0 -O2 -pipe -g<br>
&gt; + -feliminate-unused-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT builtin-version.c -o builtin-ve=
rsion.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.framebuffer.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-=
debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT framebuffer.c -o framebuffer.o<=
br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.guest_compat.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT guest_compat.c -o guest_compat.=
o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,hw/.rtc.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-t=
ypes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/rtc.c -o hw/rtc.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,hw/.serial.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debu=
g-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT hw/serial.c -o hw/serial.o<br>
&gt; + builtin-run.c: In function &#39;kvm_run_write_sandbox_cmd.isra.1&#39=
;:<br>
&gt; + builtin-run.c:412:28: error: &#39;%s&#39; directive output may be tr=
uncated writing<br>
&gt; + up to 4095 bytes into a region of size 4091 [-Werror=3Dformat-trunca=
tion=3D]<br>
&gt; + snprintf(dst, len, &quot;/host%s&quot;, resolved_path);=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0^~<br>
&gt; +=C2=A0 ~~~~~~~~~~~~~ In file included from<br>
&gt; + /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/=
armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c=
0ea26eecc-r0/recipe-sysroot/usr/include/stdio.h:873,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 from i=
nclude/kvm/util.h:13,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 from<br>
&gt; + include/kvm/builtin-run.h:4,=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 from builtin-run.c:1:<br>
&gt; + /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/=
armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c=
0ea26eecc-r0/recipe-sysroot/usr/include/bits/stdio2.h:67:10:<br>
&gt; + note: &#39;__builtin___snprintf_chk&#39; output between 6 and 4101 b=
ytes into a<br>
&gt; + destination of size 4096=C2=A0 =C2=A0 return __builtin___snprintf_ch=
k (__s, __n,<br>
&gt; + __USE_FORTIFY_LEVEL - 1,<br>
&gt; + ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0__bos<br>
&gt; + (__s), __fmt, __va_arg_pack ());<br>
&gt; + ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ arm-poky-linux-gnueabi-gcc<br>
&gt; + -march=3Darmv5e -marm -fstack-protector-strong=C2=A0 -D_FORTIFY_SOUR=
CE=3D2 -Wformat<br>
&gt; + -Wformat-security -Werror=3Dformat-security<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.ioport.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug=
-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT ioport.c -o ioport.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.irq.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-ty=
pes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT irq.c -o irq.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.kvm-cpu.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debu=
g-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm-cpu.c -o kvm-cpu.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.kvm.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-ty=
pes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT kvm.c -o kvm.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.main.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-t=
ypes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT main.c -o main.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.mmio.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-t=
ypes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT mmio.c -o mmio.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.pci.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-ty=
pes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT pci.c -o pci.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,./.term.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-debug-t=
ypes<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT term.c -o term.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.blk.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-deb=
ug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/blk.c -o virtio/blk.o<br=
>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.scsi.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-de=
bug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/scsi.c -o virtio/scsi.o<=
br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.console.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/console.c -o virtio/cons=
ole.o<br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.core.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-de=
bug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/core.c -o virtio/core.o<=
br>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.net.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-deb=
ug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/net.c -o virtio/net.o<br=
>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.rng.o.d=C2=A0 -O2 -pipe -g -feliminate-unused-deb=
ug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/rng.c -o virtio/rng.o<br=
>
&gt; + arm-poky-linux-gnueabi-gcc=C2=A0 -march=3Darmv5e -marm -fstack-prote=
ctor-strong<br>
&gt; + -D_FORTIFY_SOURCE=3D2 -Wformat -Wformat-security -Werror=3Dformat-se=
curity<br>
&gt; + --sysroot=3D/home/cevat/Desktop/meta-virtualization-ci/yocto/build_a=
rm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d32=
8ef83a78849c0ea26eecc-r0/recipe-sysroot<br>
&gt; + -c -Wp,-MD,virtio/.balloon.o.d=C2=A0 -O2 -pipe -g -feliminate-unused=
-debug-types<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0=3D/usr/src/debug/kvmtool/4.14.0+git0e1882=
a49f81cb15d328ef83a78849c0ea26eecc-r0<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot=3D<br>
&gt; + -fdebug-prefix-map=3D/home/cevat/Desktop/meta-virtualization-ci/yoct=
o/build_arm/tmp/work/armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f=
81cb15d328ef83a78849c0ea26eecc-r0/recipe-sysroot-native=3D<br>
&gt; +<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/include/generated<br>
&gt; + -I/home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/wor=
k-shared/qemuarm/kernel-build-artifacts/arch/arm/include/generated<br>
&gt; + -march=3Darmv7-a -DCONFIG_GUEST_INIT=C2=A0 -DCONFIG_ARM -D_FILE_OFFS=
ET_BITS=3D64<br>
&gt; + -D_GNU_SOURCE -DKVMTOOLS_VERSION=3D&#39;&quot;3.18.0&quot;&#39; -DBU=
ILD_ARCH=3D&#39;&quot;arm&quot;&#39; -Iinclude<br>
&gt; + -Iarm/include -Iarm/aarch32/include -O2 -fno-strict-aliasing -g -Wal=
l<br>
&gt; + -Wformat=3D2 -Winit-self -Wmissing-declarations -Wmissing-prototypes=
<br>
&gt; + -Wnested-externs -Wno-system-headers -Wold-style-definition -Wredund=
ant-decls<br>
&gt; + -Wsign-compare -Wstrict-prototypes -Wundef -Wvolatile-register-var<b=
r>
&gt; + -Wwrite-strings -Wno-format-nonliteral -Werror -DCONFIG_HAS_ZLIB<br>
&gt; + -DCONFIG_HAS_AIO -DCONFIG_HAS_LIBFDT virtio/balloon.c -o virtio/ball=
oon.o<br>
&gt; + cc1: all warnings being treated as errors Makefile:431: recipe for t=
arget<br>
&gt; + &#39;builtin-run.o&#39; failed make: *** [builtin-run.o] Error 1 mak=
e: *** Waiting<br>
&gt; + for unfinished jobs.... virtio/net.c: In function &#39;virtio_net__t=
ap_init&#39;:<br>
&gt; + virtio/net.c:336:47: error: argument to &#39;sizeof&#39; in &#39;str=
ncpy&#39; call is the<br>
&gt; + same expression as the source; did you mean to use the size of the<b=
r>
&gt; + destination? [-Werror=3Dsizeof-pointer-memaccess]=C2=A0 =C2=A0 strnc=
py(ifr.ifr_name,<br>
&gt; + ndev-&gt;tap_name, sizeof(ndev-&gt;tap_name));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ virtio/net.c:348:47: error=
: argument to &#39;sizeof&#39; in &#39;strncpy&#39;<br>
&gt; + call is the same expression as the source; did you mean to use the s=
ize of<br>
&gt; + the destination? [-Werror=3Dsizeof-pointer-memaccess]=C2=A0 =C2=A0 s=
trncpy(ifr.ifr_name,<br>
&gt; + ndev-&gt;tap_name, sizeof(ndev-&gt;tap_name));<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^ cc1: all warnings being tr=
eated as errors Makefile:431: recipe<br>
&gt; + for target &#39;virtio/net.o&#39; failed make: *** [virtio/net.o] Er=
ror 1 ERROR:<br>
&gt; + oe_runmake failed WARNING: exit code 1 from a shell command. ERROR: =
Function<br>
&gt; + failed: do_compile (log file is located at<br>
&gt; + /home/cevat/Desktop/meta-virtualization-ci/yocto/build_arm/tmp/work/=
armv5e-poky-linux-gnueabi/kvmtool/4.14.0+git0e1882a49f81cb15d328ef83a78849c=
0ea26eecc-r0/temp/log.do_compile.7489)<br>
&gt; + &quot;<br>
&gt; +<br>
&gt; +Signed-off-by: Cevat Bostancioglu &lt;<a href=3D"mailto:bostanciogluc=
evat@gmail.com" target=3D"_blank">bostancioglucevat@gmail.com</a>&gt;<br>
&gt; +---<br>
&gt; + Makefile | 1 +<br>
&gt; + 1 file changed, 1 insertion(+)<br>
&gt; +<br>
&gt; +diff --git a/Makefile b/Makefile<br>
&gt; +index 030ff4e..fc5e177 100644<br>
&gt; +--- a/Makefile<br>
&gt; ++++ b/Makefile<br>
&gt; +@@ -2,6 +2,7 @@<br>
&gt; + # Define WERROR=3D0 to disable -Werror.<br>
&gt; + #<br>
&gt; +<br>
&gt; ++WERROR =3D 0<br>
&gt; + ifeq ($(strip $(V)),)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0E =3D @echo<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Q =3D @<br>
&gt; +--<br>
&gt; +2.7.4<br>
&gt; +<br>
&gt; --<br>
&gt; 2.7.4<br>
&gt;<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_bla=
nk">meta-virtualization@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
<br>
<br>
<br>
-- <br>
- Thou shalt not follow the NULL pointer, for chaos and madness await<br>
thee at its end<br>
- &quot;Use the force Harry&quot; - Gandalf, Star Trek II<br>
</blockquote></div>

--0000000000005deefa058bb11cf5--
