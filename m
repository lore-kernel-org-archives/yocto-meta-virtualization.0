Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-pb0-f43.google.com (mail-pb0-f43.google.com
	[209.85.160.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A73F3E0077E
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Dec 2013 10:57:18 -0800 (PST)
Received: by mail-pb0-f43.google.com with SMTP id rq2so26418256pbb.16
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Dec 2013 10:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=gh90Vf9+2rN01LJcoDIp5Y13JtznSSvYEoJYXWGI/WY=;
	b=tKS/xQIHyiCqVbWDmN3kA9OuTQO5OwP96mF76cw6GBVC73Gyjj3gGMV7VdjwdGdvBK
	2fKaUeNhpvAtZ3UXxi6r94Vp3drSIe5fUk1Lgn7UaJlD8I5dtAN0V5yT6rfT50NEoCBB
	IL0AKQ/Dc3mSC+fHaIhdQbDcRWjhtDvBvNpbydM6wu3C9O8YZKF9flWFybOd1CU/8Knv
	kNZDXSzpD5K9bU5DjaLbyp31wZQdMIwRS1XDi5govOl2ZegMyNUB1+wmT/06JqI74hPp
	9l1J8wozZq3Nc9ovtdKfO5ORnlwqqGonq/EooFD1gx1dFaLRvUBR8TlVXpHI42sYgrjk
	TtAw==
MIME-Version: 1.0
X-Received: by 10.68.196.193 with SMTP id io1mr54393950pbc.46.1386269838023;
	Thu, 05 Dec 2013 10:57:18 -0800 (PST)
Received: by 10.68.12.133 with HTTP; Thu, 5 Dec 2013 10:57:17 -0800 (PST)
In-Reply-To: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
References: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
Date: Thu, 5 Dec 2013 13:57:17 -0500
Message-ID: <CADkTA4NcFnN2E08G8xMxTs+tkKQh3_xnjXBxwFeL9W332L3Pdg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Rob Dobson <rob.dobson@citrix.com>
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
X-List-Received-Date: Thu, 05 Dec 2013 18:57:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Dec 5, 2013 at 7:29 AM, Rob Dobson <rob.dobson@citrix.com> wrote:
> Hi all,
>
> I'm new to OpenEmbedded and I've been trying to use the meta-virtualization layer in order to build a small Xen guest VM.
>
> The target I am building for is 'xen-guest-image-minimal',  however I am hitting a failure complete 'do_rootfs':
>
>        Error: kernel-module-xen-acpi-processor not found in the base feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
>
> Can anyone see what I'm doing wrong here?

Still suffering with this problem ? Nothing jumps to mind as a problem, since
it really looks like you haven't changed anything from the default
configuration.

The error implies that the kernel module wasn't built for the board in question.

Can you check the kernel build directory and check the .config to see if the
Xen options where enabled ?

Bruce

>
> Thanks very much.
>
> Rob
>
>>>>>>> BUILD CONFIG >>>>>>>
> Build Configuration:
> BB_VERSION        = "1.20.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-12.04"
> TARGET_SYS        = "i586-poky-linux"
> MACHINE           = "genericx86"
> DISTRO            = "poky"
> DISTRO_VERSION    = "1.5"
> TUNE_FEATURES     = "m32 core2"
> TARGET_FPU        = ""
> meta
> meta-yocto
> meta-yocto-bsp    = "master:64f0a0bc408d8e32d5e795aeb9fffee0539f5e22"
> meta-oe
> meta-networking   = "master:b2c0f57f01ee8286c55259c8e0215a7c901699fc"
> meta-virtualization = "master:61f1cd9c44f2bf1cb6b3605d2587baf9f439db9a"
>
>>>>>>> MACHINE >>>>>>>
> MACHINE ?= "genericx86"
>
>>>>>>> FAILURE MESSAGE >>>>>>>
> DEBUG: Executing python function rootfs_process_ignore
> DEBUG: Python function rootfs_process_ignore finished
> DEBUG: Executing python function rootfs_runtime_mapping
> DEBUG: Python function rootfs_runtime_mapping finished
> DEBUG: Executing shell function do_rootfs
> Note: configuring RPM platform settings
> Note: configuring RPM system provides
> Note: configuring RPM DB settings
> Note: configuring Smart settings
>
> Note: adding Smart channel genericx86 (55)
>
> Note: adding Smart channel core2 (50)
>
> Note: adding Smart channel i586 (40)
>
> Note: adding Smart channel all (10)
>
> Note: configuring RPM cross-install scriptlet_wrapper
>
> Updating cache...               ######################################## [100%]
>
> Saving cache...
>
> Error: kernel-module-xen-acpi-processor not found in the base feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_rootfs (log file is located at /local/files/yocto/poky-dora-10.0.0/build/tmp/work/genericx86-poky-linux/xen-guest-image-minimal/1.0-r0/temp/log.do_rootfs.21957)
>
>>>>>>> BBLAYERS >>>>>>
> # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
> # changes incompatibly
> LCONF_VERSION = "6"
>
> BBPATH = "${TOPDIR}"
> BBFILES ?= ""
>
> BBLAYERS ?= " \
>   /local/files/yocto/poky-dora-10.0.0/meta \
>   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>   /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \
>   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \
>   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \
>   /local/files/yocto/poky-dora-10.0.0/meta-virtualization \
>   "
> BBLAYERS_NON_REMOVABLE ?= " \
>   /local/files/yocto/poky-dora-10.0.0/meta \
>   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>   "
>
>>>>>>> meta-oe/conf/layer.conf >>>>>>
> Updated priority:
>        BBFILE_PRIORITY_openembedded-layer = "4"
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

