Return-Path: <brian.mcgillion@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C6F6FE00973; Thu, 21 Jan 2016 07:05:44 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HTML_MESSAGE,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.178 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ig0-f178.google.com (mail-ig0-f178.google.com
	[209.85.213.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 77660E00833
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 07:05:41 -0800 (PST)
Received: by mail-ig0-f178.google.com with SMTP id h5so34502018igh.0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 21 Jan 2016 07:05:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=WaKWslwaPqlMsovmWlr8Z5LyHmW+EST2oFHzhn5yRz0=;
	b=zKDK4o3bnOPwjIchMU1YwfJ7u72X1+w5IGJcdRlcbsPcJ5dALX70glGDboIM/ZCoiQ
	kYKJ+DjBUG89rRsKPKdXKRiqO8tM07rfubxxBEL12kl/3Yy03tnKGvRXWl8HfnnfSE99
	dvZHqP5TwbyWsstcqd/E/IkiOPIJ91QhlLIAa/wPMYWFheK0toj+wTT5R6i7UWBbSLE3
	AiCruqX1Dq9YDed13AaoUshPWl/seFGtlmwp70vjr6y305I7KUAgsj+TZxii4J/kUmZ/
	hrlt/TFrax67RGkcHH4Yg+b+1zIWOxWM5gpGDaujNMbbbPOIIJ69hws782t8sGTNY/UD
	ZCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=WaKWslwaPqlMsovmWlr8Z5LyHmW+EST2oFHzhn5yRz0=;
	b=D1yT0dYWVjqbJwssxubzaKiD0V1FZzJ5kXvEmgd98UzwLdlTHPzPG3Q6VgEkHJdVi/
	YVU21e8wxy+baxF8W0eiIcZfH9vH8X0NhTB/1fS2ahGBvY8lXo8CSTYTs5uZt06LFtM7
	hG0jENsvYPkMVrtC9+khXKWFMrinQGChKWI00Gf/FraSkIWShReuIXsBUTdnbwTx2FzT
	44GrYl7AFm9HWZBRt6D/jII09Im0E/JEDM0+gjw5th/4krpoMpS41xR0dZK7uB75hsCc
	EmyT+sXJHlrksb+ujoAn0xGW38etxgL5buLGznkkKamwFsrnah8kYB/Uv6RhifUVMnuU
	ECuQ==
X-Gm-Message-State: AG10YOS3o8YTz8TyL80lmkAj3386TvxExXEYYSFbHzt5OQ4WE3PdPv1HmCCRD2s8EBMhyATOfwt1PkBXD/SkyY+F
MIME-Version: 1.0
X-Received: by 10.50.183.7 with SMTP id ei7mr9928762igc.17.1453388740417; Thu,
	21 Jan 2016 07:05:40 -0800 (PST)
Received: by 10.36.117.72 with HTTP; Thu, 21 Jan 2016 07:05:40 -0800 (PST)
In-Reply-To: <CABZSBQe3AnzvwfW-x4Fum_AoHYn2OO1VD=YEmmRkNhJmZGOcSA@mail.gmail.com>
References: <CADqm_SRdKySYQwvUMepd3uVvYzLW+Qd6tc77k616h3BiTe5-NQ@mail.gmail.com>
	<CABZSBQe3AnzvwfW-x4Fum_AoHYn2OO1VD=YEmmRkNhJmZGOcSA@mail.gmail.com>
Date: Thu, 21 Jan 2016 17:05:40 +0200
Message-ID: <CADqm_SSvTkVDrHku6a_MZww-KaeQ+SamzgNvXSZ2tUd_RbJ0LQ@mail.gmail.com>
From: "McGillion, Brian" <brian.mcgillion@intel.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Failure to build xen-image-minimal
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
X-List-Received-Date: Thu, 21 Jan 2016 15:05:44 -0000
Content-Type: multipart/alternative; boundary=001a11c3ac269803250529d96fb3

--001a11c3ac269803250529d96fb3
Content-Type: text/plain; charset=UTF-8

Hi Chris,

Thank you, that was it!

In general should that config not be part of the xen-minimal-image recipe?

Thanks,
Brian

On Thu, Jan 21, 2016 at 4:12 PM, Chris Patterson <cjp256@gmail.com> wrote:

> Hello Brian,
>
> Have you added 'xen' to your DISTRO_FEATURES?  You can try
> DISTRO_FEATURES_append = " xen" in your local.conf.
>
> Good luck! :)
> -Chris
>
> On Wed, Jan 20, 2016 at 11:11 AM, McGillion, Brian
> <brian.mcgillion@intel.com> wrote:
> > Hi,
> >
> > I am trying to build a default xen-image-minimal target.
> >
> > Followed these steps
> > git clone http://git.yoctoproject.org/git/poky
> > cd poky/
> > git clone git://git.yoctoproject.org/meta-yocto-kernel-extras
> > git clone git://git.yoctoproject.org/meta-intel.git
> > git clone git://git.yoctoproject.org/meta-virtualization
> > git clone git://github.com/openembedded/meta-openembedded.git
> > git clone git://github.com/errordeveloper/oe-meta-go.git
> >
> > source oe-init-build-env
> >
> > bitbake-layers add-layer meta-intel
> > bitbake-layers add-layer meta-virtualization
> > bitbake-layers add-layer meta-openembedded/meta-oe
> > bitbake-layers add-layer meta-openembedded/meta-networking
> > bitbake-layers add-layer meta-openembedded/meta-python
> > bitbake-layers add-layer meta-openembedded/meta-filesystems
> > bitbake-layers add-layer oe-meta-go
> >
> >
> > edit conf/local.conf adding the following
> >
> > MACHINE ?= "intel-corei7-64" or MACHINE ?= "genericx86_64"
> > PACKAGE_CLASSES = "package_deb "
> >
> >
> > bitbake xen-image-minimal
> >
> >
> >
> > with the following result:
> >
> > ERROR: Unable to install packages. Command
> >
> '/home/brian/embedded/yocto/poky/build/tmp/sysroots/x86_64-linux/usr/bin/apt-get
> > install --force-yes --allow-unauthenticated kernel-module-xen-netback
> > kernel-module-xen-gntalloc run-postinsts kernel-module-xen-acpi-processor
> > packagegroup-core-ssh-openssh kernel-module-xen-pciback
> > kernel-module-xen-blkback kernel-module-xen-gntdev qemu xen-base
> > packagegroup-core-boot kernel-module-xen-wdt' returned 100:
> > Reading package lists...
> > Building dependency tree...
> > Reading state information...
> > E: Unable to locate package kernel-module-xen-netback
> > E: Unable to locate package kernel-module-xen-gntalloc
> > E: Unable to locate package kernel-module-xen-acpi-processor
> > E: Unable to locate package kernel-module-xen-pciback
> > E: Unable to locate package kernel-module-xen-blkback
> > E: Unable to locate package kernel-module-xen-gntdev
> > E: Unable to locate package kernel-module-xen-wdt
> >
> > ERROR: Function failed: do_rootfs
> > ERROR: Logfile of failure stored in:
> >
> /home/brian/embedded/yocto/poky/build/tmp/work/genericx86_64-poky-linux/xen-image-minimal/1.0-r0/temp/log.do_rootfs.25163
> > ERROR: Task 9
> >
> (/home/brian/embedded/yocto/poky/meta-virtualization/recipes-extended/images/
> xen-image-minimal.bb,
> > do_rootfs) failed with exit code '1'
> >
> >
> > if the following directory should contain the final kernel .config that
> is
> > being built then I do not see the xen config options that are defined in
> > /meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg being
> applied.
> >
> >
> yocto/poky/build/tmp/work/genericx86_64-poky-linux/linux-yocto/4.1.15+gitAUTOINC+46bb64d605_788dfc9859-r0/linux-genericx86_64-standard-build
> >
> > Any help is greatly appreciated.
> >
> > Thanks,
> > Brian
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> >
>

--001a11c3ac269803250529d96fb3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Chris,<div><br></div><div>Thank you, that was it!</div>=
<div><br></div><div>In general should that config not be part of the xen-mi=
nimal-image recipe?</div><div><br></div><div>Thanks,</div><div>Brian</div><=
/div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Jan =
21, 2016 at 4:12 PM, Chris Patterson <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:cjp256@gmail.com" target=3D"_blank">cjp256@gmail.com</a>&gt;</span> wrote=
:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">Hello Brian,<br>
<br>
Have you added &#39;xen&#39; to your DISTRO_FEATURES?=C2=A0 You can try<br>
DISTRO_FEATURES_append =3D &quot; xen&quot; in your local.conf.<br>
<br>
Good luck! :)<br>
-Chris<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
On Wed, Jan 20, 2016 at 11:11 AM, McGillion, Brian<br>
&lt;<a href=3D"mailto:brian.mcgillion@intel.com">brian.mcgillion@intel.com<=
/a>&gt; wrote:<br>
&gt; Hi,<br>
&gt;<br>
&gt; I am trying to build a default xen-image-minimal target.<br>
&gt;<br>
&gt; Followed these steps<br>
&gt; git clone <a href=3D"http://git.yoctoproject.org/git/poky" rel=3D"nore=
ferrer" target=3D"_blank">http://git.yoctoproject.org/git/poky</a><br>
&gt; cd poky/<br>
&gt; git clone git://<a href=3D"http://git.yoctoproject.org/meta-yocto-kern=
el-extras" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-y=
octo-kernel-extras</a><br>
&gt; git clone git://<a href=3D"http://git.yoctoproject.org/meta-intel.git"=
 rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-intel.git</=
a><br>
&gt; git clone git://<a href=3D"http://git.yoctoproject.org/meta-virtualiza=
tion" rel=3D"noreferrer" target=3D"_blank">git.yoctoproject.org/meta-virtua=
lization</a><br>
&gt; git clone git://<a href=3D"http://github.com/openembedded/meta-openemb=
edded.git" rel=3D"noreferrer" target=3D"_blank">github.com/openembedded/met=
a-openembedded.git</a><br>
&gt; git clone git://<a href=3D"http://github.com/errordeveloper/oe-meta-go=
.git" rel=3D"noreferrer" target=3D"_blank">github.com/errordeveloper/oe-met=
a-go.git</a><br>
&gt;<br>
&gt; source oe-init-build-env<br>
&gt;<br>
&gt; bitbake-layers add-layer meta-intel<br>
&gt; bitbake-layers add-layer meta-virtualization<br>
&gt; bitbake-layers add-layer meta-openembedded/meta-oe<br>
&gt; bitbake-layers add-layer meta-openembedded/meta-networking<br>
&gt; bitbake-layers add-layer meta-openembedded/meta-python<br>
&gt; bitbake-layers add-layer meta-openembedded/meta-filesystems<br>
&gt; bitbake-layers add-layer oe-meta-go<br>
&gt;<br>
&gt;<br>
&gt; edit conf/local.conf adding the following<br>
&gt;<br>
&gt; MACHINE ?=3D &quot;intel-corei7-64&quot; or MACHINE ?=3D &quot;generic=
x86_64&quot;<br>
&gt; PACKAGE_CLASSES =3D &quot;package_deb &quot;<br>
&gt;<br>
&gt;<br>
&gt; bitbake xen-image-minimal<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; with the following result:<br>
&gt;<br>
&gt; ERROR: Unable to install packages. Command<br>
&gt; &#39;/home/brian/embedded/yocto/poky/build/tmp/sysroots/x86_64-linux/u=
sr/bin/apt-get<br>
&gt; install --force-yes --allow-unauthenticated kernel-module-xen-netback<=
br>
&gt; kernel-module-xen-gntalloc run-postinsts kernel-module-xen-acpi-proces=
sor<br>
&gt; packagegroup-core-ssh-openssh kernel-module-xen-pciback<br>
&gt; kernel-module-xen-blkback kernel-module-xen-gntdev qemu xen-base<br>
&gt; packagegroup-core-boot kernel-module-xen-wdt&#39; returned 100:<br>
&gt; Reading package lists...<br>
&gt; Building dependency tree...<br>
&gt; Reading state information...<br>
&gt; E: Unable to locate package kernel-module-xen-netback<br>
&gt; E: Unable to locate package kernel-module-xen-gntalloc<br>
&gt; E: Unable to locate package kernel-module-xen-acpi-processor<br>
&gt; E: Unable to locate package kernel-module-xen-pciback<br>
&gt; E: Unable to locate package kernel-module-xen-blkback<br>
&gt; E: Unable to locate package kernel-module-xen-gntdev<br>
&gt; E: Unable to locate package kernel-module-xen-wdt<br>
&gt;<br>
&gt; ERROR: Function failed: do_rootfs<br>
&gt; ERROR: Logfile of failure stored in:<br>
&gt; /home/brian/embedded/yocto/poky/build/tmp/work/genericx86_64-poky-linu=
x/xen-image-minimal/1.0-r0/temp/log.do_rootfs.25163<br>
&gt; ERROR: Task 9<br>
&gt; (/home/brian/embedded/yocto/poky/meta-virtualization/recipes-extended/=
images/<a href=3D"http://xen-image-minimal.bb" rel=3D"noreferrer" target=3D=
"_blank">xen-image-minimal.bb</a>,<br>
&gt; do_rootfs) failed with exit code &#39;1&#39;<br>
&gt;<br>
&gt;<br>
&gt; if the following directory should contain the final kernel .config tha=
t is<br>
&gt; being built then I do not see the xen config options that are defined =
in<br>
&gt; /meta-virtualization/recipes-kernel/linux/linux-yocto/xen.cfg being ap=
plied.<br>
&gt;<br>
&gt; yocto/poky/build/tmp/work/genericx86_64-poky-linux/linux-yocto/4.1.15+=
gitAUTOINC+46bb64d605_788dfc9859-r0/linux-genericx86_64-standard-build<br>
&gt;<br>
&gt; Any help is greatly appreciated.<br>
&gt;<br>
&gt; Thanks,<br>
&gt; Brian<br>
&gt;<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">&gt; --<br>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" rel=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org/listi=
nfo/meta-virtualization</a><br>
&gt;<br>
</font></span></blockquote></div><br></div>

--001a11c3ac269803250529d96fb3--
