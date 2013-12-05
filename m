Return-Path: <cjp256@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F663E0078D
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 14:13:18 -0800 (PST)
Received: by mail-lb0-f177.google.com with SMTP id w7so10004188lbi.8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Dec 2013 14:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=f0QAOwTytJsu4vf++SN3sTgmH3cLjxcDdDthSPcinjU=;
	b=hAO9LdO3f7wJa5SWl/cQotI7j67SAaaY3OyHM37dlSEll0aIQQwKVLSTmpHvRcQisc
	RoOxPun2UchqKHe1vCSyOjxVzBXy2M2Z/UyZZBQp+GW9qqP+lx/lWQQX/inQui1xnkDD
	rdE7ehxEXt9FWcl0XHdsRxfvIhbrqbKhSyvzJhRUpAd0wUpe1d/97CgZAwka90BPwaDH
	plyaMBfdgQQ6R4jEZLFl7llQvIyPqg8+bxg+kerz7amISIknuEQVkTL0UayuEVPbDlbD
	RbAMhvEVwHVm/oXtipV9B47o3c4cMGiL7eKgQn39GBtKqb8p6VLwlm6DZk71zDUkMpcF
	Ho0w==
MIME-Version: 1.0
X-Received: by 10.152.219.166 with SMTP id pp6mr3920lac.46.1386281597259; Thu,
	05 Dec 2013 14:13:17 -0800 (PST)
Received: by 10.114.181.41 with HTTP; Thu, 5 Dec 2013 14:13:17 -0800 (PST)
In-Reply-To: <CADkTA4NcFnN2E08G8xMxTs+tkKQh3_xnjXBxwFeL9W332L3Pdg@mail.gmail.com>
References: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
	<CADkTA4NcFnN2E08G8xMxTs+tkKQh3_xnjXBxwFeL9W332L3Pdg@mail.gmail.com>
Date: Thu, 5 Dec 2013 22:13:17 +0000
Message-ID: <CABZSBQd+CD3j-WBsUiMW5x53HUeYcXeDpKLxiLjyb7AVjaS+pQ@mail.gmail.com>
From: Chris Patterson <cjp256@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Error: kernel-module-xen-acpi-processor not found in the base feeds
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
X-List-Received-Date: Thu, 05 Dec 2013 22:13:20 -0000
Content-Type: multipart/alternative; boundary=001a1134329629d44204ecd0d6be

--001a1134329629d44204ecd0d6be
Content-Type: text/plain; charset=ISO-8859-1

You may need to add 'xen' to your DISTRO_FEATURES if you haven't already.
It will enable the xen configuration bits for the kernel.


On Thu, Dec 5, 2013 at 6:57 PM, Bruce Ashfield <bruce.ashfield@gmail.com>wrote:

> On Thu, Dec 5, 2013 at 7:29 AM, Rob Dobson <rob.dobson@citrix.com> wrote:
> > Hi all,
> >
> > I'm new to OpenEmbedded and I've been trying to use the
> meta-virtualization layer in order to build a small Xen guest VM.
> >
> > The target I am building for is 'xen-guest-image-minimal',  however I am
> hitting a failure complete 'do_rootfs':
> >
> >        Error: kernel-module-xen-acpi-processor not found in the base
> feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
> >
> > Can anyone see what I'm doing wrong here?
>
> Still suffering with this problem ? Nothing jumps to mind as a problem,
> since
> it really looks like you haven't changed anything from the default
> configuration.
>
> The error implies that the kernel module wasn't built for the board in
> question.
>
> Can you check the kernel build directory and check the .config to see if
> the
> Xen options where enabled ?
>
> Bruce
>
> >
> > Thanks very much.
> >
> > Rob
> >
> >>>>>>> BUILD CONFIG >>>>>>>
> > Build Configuration:
> > BB_VERSION        = "1.20.0"
> > BUILD_SYS         = "x86_64-linux"
> > NATIVELSBSTRING   = "Ubuntu-12.04"
> > TARGET_SYS        = "i586-poky-linux"
> > MACHINE           = "genericx86"
> > DISTRO            = "poky"
> > DISTRO_VERSION    = "1.5"
> > TUNE_FEATURES     = "m32 core2"
> > TARGET_FPU        = ""
> > meta
> > meta-yocto
> > meta-yocto-bsp    = "master:64f0a0bc408d8e32d5e795aeb9fffee0539f5e22"
> > meta-oe
> > meta-networking   = "master:b2c0f57f01ee8286c55259c8e0215a7c901699fc"
> > meta-virtualization = "master:61f1cd9c44f2bf1cb6b3605d2587baf9f439db9a"
> >
> >>>>>>> MACHINE >>>>>>>
> > MACHINE ?= "genericx86"
> >
> >>>>>>> FAILURE MESSAGE >>>>>>>
> > DEBUG: Executing python function rootfs_process_ignore
> > DEBUG: Python function rootfs_process_ignore finished
> > DEBUG: Executing python function rootfs_runtime_mapping
> > DEBUG: Python function rootfs_runtime_mapping finished
> > DEBUG: Executing shell function do_rootfs
> > Note: configuring RPM platform settings
> > Note: configuring RPM system provides
> > Note: configuring RPM DB settings
> > Note: configuring Smart settings
> >
> > Note: adding Smart channel genericx86 (55)
> >
> > Note: adding Smart channel core2 (50)
> >
> > Note: adding Smart channel i586 (40)
> >
> > Note: adding Smart channel all (10)
> >
> > Note: configuring RPM cross-install scriptlet_wrapper
> >
> > Updating cache...               ########################################
> [100%]
> >
> > Saving cache...
> >
> > Error: kernel-module-xen-acpi-processor not found in the base feeds
> (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
> > WARNING: exit code 1 from a shell command.
> > ERROR: Function failed: do_rootfs (log file is located at
> /local/files/yocto/poky-dora-10.0.0/build/tmp/work/genericx86-poky-linux/xen-guest-image-minimal/1.0-r0/temp/log.do_rootfs.21957)
> >
> >>>>>>> BBLAYERS >>>>>>
> > # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> > # changes incompatibly
> > LCONF_VERSION = "6"
> >
> > BBPATH = "${TOPDIR}"
> > BBFILES ?= ""
> >
> > BBLAYERS ?= " \
> >   /local/files/yocto/poky-dora-10.0.0/meta \
> >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
> >   /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \
> >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \
> >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \
> >   /local/files/yocto/poky-dora-10.0.0/meta-virtualization \
> >   "
> > BBLAYERS_NON_REMOVABLE ?= " \
> >   /local/files/yocto/poky-dora-10.0.0/meta \
> >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
> >   "
> >
> >>>>>>> meta-oe/conf/layer.conf >>>>>>
> > Updated priority:
> >        BBFILE_PRIORITY_openembedded-layer = "4"
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a1134329629d44204ecd0d6be
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">You may need to add &#39;xen&#39; to your DISTRO_FEATURES =
if you haven&#39;t already.=A0 It will enable the xen configuration bits fo=
r the kernel.</div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_q=
uote">
On Thu, Dec 5, 2013 at 6:57 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmai=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<div class=3D"im">On Thu, Dec 5, 2013 at 7:29 AM, Rob Dobson &lt;<a href=3D=
"mailto:rob.dobson@citrix.com">rob.dobson@citrix.com</a>&gt; wrote:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I&#39;m new to OpenEmbedded and I&#39;ve been trying to use the meta-v=
irtualization layer in order to build a small Xen guest VM.<br>
&gt;<br>
&gt; The target I am building for is &#39;xen-guest-image-minimal&#39;, =A0=
however I am hitting a failure complete &#39;do_rootfs&#39;:<br>
&gt;<br>
&gt; =A0 =A0 =A0 =A0Error: kernel-module-xen-acpi-processor not found in th=
e base feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).<br>
&gt;<br>
&gt; Can anyone see what I&#39;m doing wrong here?<br>
<br>
</div>Still suffering with this problem ? Nothing jumps to mind as a proble=
m, since<br>
it really looks like you haven&#39;t changed anything from the default<br>
configuration.<br>
<br>
The error implies that the kernel module wasn&#39;t built for the board in =
question.<br>
<br>
Can you check the kernel build directory and check the .config to see if th=
e<br>
Xen options where enabled ?<br>
<br>
Bruce<br>
<div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt;<br>
&gt; Thanks very much.<br>
&gt;<br>
&gt; Rob<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; BUILD CONFIG &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; Build Configuration:<br>
&gt; BB_VERSION =A0 =A0 =A0 =A0=3D &quot;1.20.0&quot;<br>
&gt; BUILD_SYS =A0 =A0 =A0 =A0 =3D &quot;x86_64-linux&quot;<br>
&gt; NATIVELSBSTRING =A0 =3D &quot;Ubuntu-12.04&quot;<br>
&gt; TARGET_SYS =A0 =A0 =A0 =A0=3D &quot;i586-poky-linux&quot;<br>
&gt; MACHINE =A0 =A0 =A0 =A0 =A0 =3D &quot;genericx86&quot;<br>
&gt; DISTRO =A0 =A0 =A0 =A0 =A0 =A0=3D &quot;poky&quot;<br>
&gt; DISTRO_VERSION =A0 =A0=3D &quot;1.5&quot;<br>
&gt; TUNE_FEATURES =A0 =A0 =3D &quot;m32 core2&quot;<br>
&gt; TARGET_FPU =A0 =A0 =A0 =A0=3D &quot;&quot;<br>
&gt; meta<br>
&gt; meta-yocto<br>
&gt; meta-yocto-bsp =A0 =A0=3D &quot;master:64f0a0bc408d8e32d5e795aeb9fffee=
0539f5e22&quot;<br>
&gt; meta-oe<br>
&gt; meta-networking =A0 =3D &quot;master:b2c0f57f01ee8286c55259c8e0215a7c9=
01699fc&quot;<br>
&gt; meta-virtualization =3D &quot;master:61f1cd9c44f2bf1cb6b3605d2587baf9f=
439db9a&quot;<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; MACHINE &gt;&gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; MACHINE ?=3D &quot;genericx86&quot;<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; FAILURE MESSAGE &gt;&gt;&gt;&gt;&gt;&gt;&gt;<b=
r>
&gt; DEBUG: Executing python function rootfs_process_ignore<br>
&gt; DEBUG: Python function rootfs_process_ignore finished<br>
&gt; DEBUG: Executing python function rootfs_runtime_mapping<br>
&gt; DEBUG: Python function rootfs_runtime_mapping finished<br>
&gt; DEBUG: Executing shell function do_rootfs<br>
&gt; Note: configuring RPM platform settings<br>
&gt; Note: configuring RPM system provides<br>
&gt; Note: configuring RPM DB settings<br>
&gt; Note: configuring Smart settings<br>
&gt;<br>
&gt; Note: adding Smart channel genericx86 (55)<br>
&gt;<br>
&gt; Note: adding Smart channel core2 (50)<br>
&gt;<br>
&gt; Note: adding Smart channel i586 (40)<br>
&gt;<br>
&gt; Note: adding Smart channel all (10)<br>
&gt;<br>
&gt; Note: configuring RPM cross-install scriptlet_wrapper<br>
&gt;<br>
&gt; Updating cache... =A0 =A0 =A0 =A0 =A0 =A0 =A0 ########################=
################ [100%]<br>
&gt;<br>
&gt; Saving cache...<br>
&gt;<br>
&gt; Error: kernel-module-xen-acpi-processor not found in the base feeds (g=
enericx86 core2 i686 i586 i486 i386 x86 noarch any all).<br>
&gt; WARNING: exit code 1 from a shell command.<br>
&gt; ERROR: Function failed: do_rootfs (log file is located at /local/files=
/yocto/poky-dora-10.0.0/build/tmp/work/genericx86-poky-linux/xen-guest-imag=
e-minimal/1.0-r0/temp/log.do_rootfs.21957)<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; BBLAYERS &gt;&gt;&gt;&gt;&gt;&gt;<br>
&gt; # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf<b=
r>
&gt; # changes incompatibly<br>
&gt; LCONF_VERSION =3D &quot;6&quot;<br>
&gt;<br>
&gt; BBPATH =3D &quot;${TOPDIR}&quot;<br>
&gt; BBFILES ?=3D &quot;&quot;<br>
&gt;<br>
&gt; BBLAYERS ?=3D &quot; \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-yocto \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-virtualization \<br>
&gt; =A0 &quot;<br>
&gt; BBLAYERS_NON_REMOVABLE ?=3D &quot; \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta \<br>
&gt; =A0 /local/files/yocto/poky-dora-10.0.0/meta-yocto \<br>
&gt; =A0 &quot;<br>
&gt;<br>
&gt;&gt;&gt;&gt;&gt;&gt;&gt; meta-oe/conf/layer.conf &gt;&gt;&gt;&gt;&gt;&g=
t;<br>
&gt; Updated priority:<br>
&gt; =A0 =A0 =A0 =A0BBFILE_PRIORITY_openembedded-layer =3D &quot;4&quot;<br=
>
&gt; _______________________________________________<br>
&gt; meta-virtualization mailing list<br>
&gt; <a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualiz=
ation@yoctoproject.org</a><br>
&gt; <a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization=
" target=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualiza=
tion</a><br>
<br>
<br>
<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888">--<br>
&quot;Thou shalt not follow the NULL pointer, for chaos and madness await<b=
r>
thee at its end&quot;<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5">_____________________=
__________________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" tar=
get=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization<=
/a><br>
</div></div></blockquote></div><br></div>

--001a1134329629d44204ecd0d6be--
