Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 02403E0079A
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Dec 2013 09:06:33 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1Voyqb-0003jU-Mi; Fri, 06 Dec 2013 17:05:51 +0000
Message-ID: <52A20414.3080600@twobit.us>
Date: Fri, 06 Dec 2013 12:06:28 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: rob.dobson@citrix.com
References: <C40136690E471047B567224B6AD7213D1BED57@AMSPEX01CL02.citrite.net>
	<CADkTA4NcFnN2E08G8xMxTs+tkKQh3_xnjXBxwFeL9W332L3Pdg@mail.gmail.com>
	<CABZSBQd+CD3j-WBsUiMW5x53HUeYcXeDpKLxiLjyb7AVjaS+pQ@mail.gmail.com>
In-Reply-To: <CABZSBQd+CD3j-WBsUiMW5x53HUeYcXeDpKLxiLjyb7AVjaS+pQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 216.57.91.130
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
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
X-List-Received-Date: Fri, 06 Dec 2013 17:06:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hey Rob,

Chris is spot on here. You need 'xen' in your DISTRO_FEATURES. Figured
since you point out that you're new to OE you may want an example as
well. I've got some config / metadata up on github if you're interested.
Basically I've set up a meta layer specifically for distro stuff that
doesn't belong in meta-virt to deal with stuff like this. You can check
out the distro config here:

https://github.com/flihp/meta-integral/blob/master/conf/distro/integral-ndvm.conf

There's a bunch of stuff there that you may not want (selinux) but
there's useful stuff too for Xen guests. Specifically I've had to sort
out how to deal with the xen console and fstab for PV guests to get
xenfs mounted etc. Nothing too complicated but it may save you some time.

Hope this helps,
Philip

On 12/05/2013 05:13 PM, Chris Patterson wrote:
> You may need to add 'xen' to your DISTRO_FEATURES if you haven't
> already.  It will enable the xen configuration bits for the kernel.
> 
> 
> On Thu, Dec 5, 2013 at 6:57 PM, Bruce Ashfield <bruce.ashfield@gmail.com
> <mailto:bruce.ashfield@gmail.com>> wrote:
> 
>     On Thu, Dec 5, 2013 at 7:29 AM, Rob Dobson <rob.dobson@citrix.com
>     <mailto:rob.dobson@citrix.com>> wrote:
>     > Hi all,
>     >
>     > I'm new to OpenEmbedded and I've been trying to use the
>     meta-virtualization layer in order to build a small Xen guest VM.
>     >
>     > The target I am building for is 'xen-guest-image-minimal',
>      however I am hitting a failure complete 'do_rootfs':
>     >
>     >        Error: kernel-module-xen-acpi-processor not found in the
>     base feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
>     >
>     > Can anyone see what I'm doing wrong here?
> 
>     Still suffering with this problem ? Nothing jumps to mind as a
>     problem, since
>     it really looks like you haven't changed anything from the default
>     configuration.
> 
>     The error implies that the kernel module wasn't built for the board
>     in question.
> 
>     Can you check the kernel build directory and check the .config to
>     see if the
>     Xen options where enabled ?
> 
>     Bruce
> 
>     >
>     > Thanks very much.
>     >
>     > Rob
>     >
>     >>>>>>> BUILD CONFIG >>>>>>>
>     > Build Configuration:
>     > BB_VERSION        = "1.20.0"
>     > BUILD_SYS         = "x86_64-linux"
>     > NATIVELSBSTRING   = "Ubuntu-12.04"
>     > TARGET_SYS        = "i586-poky-linux"
>     > MACHINE           = "genericx86"
>     > DISTRO            = "poky"
>     > DISTRO_VERSION    = "1.5"
>     > TUNE_FEATURES     = "m32 core2"
>     > TARGET_FPU        = ""
>     > meta
>     > meta-yocto
>     > meta-yocto-bsp    = "master:64f0a0bc408d8e32d5e795aeb9fffee0539f5e22"
>     > meta-oe
>     > meta-networking   = "master:b2c0f57f01ee8286c55259c8e0215a7c901699fc"
>     > meta-virtualization =
>     "master:61f1cd9c44f2bf1cb6b3605d2587baf9f439db9a"
>     >
>     >>>>>>> MACHINE >>>>>>>
>     > MACHINE ?= "genericx86"
>     >
>     >>>>>>> FAILURE MESSAGE >>>>>>>
>     > DEBUG: Executing python function rootfs_process_ignore
>     > DEBUG: Python function rootfs_process_ignore finished
>     > DEBUG: Executing python function rootfs_runtime_mapping
>     > DEBUG: Python function rootfs_runtime_mapping finished
>     > DEBUG: Executing shell function do_rootfs
>     > Note: configuring RPM platform settings
>     > Note: configuring RPM system provides
>     > Note: configuring RPM DB settings
>     > Note: configuring Smart settings
>     >
>     > Note: adding Smart channel genericx86 (55)
>     >
>     > Note: adding Smart channel core2 (50)
>     >
>     > Note: adding Smart channel i586 (40)
>     >
>     > Note: adding Smart channel all (10)
>     >
>     > Note: configuring RPM cross-install scriptlet_wrapper
>     >
>     > Updating cache...              
>     ######################################## [100%]
>     >
>     > Saving cache...
>     >
>     > Error: kernel-module-xen-acpi-processor not found in the base
>     feeds (genericx86 core2 i686 i586 i486 i386 x86 noarch any all).
>     > WARNING: exit code 1 from a shell command.
>     > ERROR: Function failed: do_rootfs (log file is located at
>     /local/files/yocto/poky-dora-10.0.0/build/tmp/work/genericx86-poky-linux/xen-guest-image-minimal/1.0-r0/temp/log.do_rootfs.21957)
>     >
>     >>>>>>> BBLAYERS >>>>>>
>     > # LAYER_CONF_VERSION is increased each time build/conf/bblayers.conf
>     > # changes incompatibly
>     > LCONF_VERSION = "6"
>     >
>     > BBPATH = "${TOPDIR}"
>     > BBFILES ?= ""
>     >
>     > BBLAYERS ?= " \
>     >   /local/files/yocto/poky-dora-10.0.0/meta \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto-bsp \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-oe \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-oe/meta-networking \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-virtualization \
>     >   "
>     > BBLAYERS_NON_REMOVABLE ?= " \
>     >   /local/files/yocto/poky-dora-10.0.0/meta \
>     >   /local/files/yocto/poky-dora-10.0.0/meta-yocto \
>     >   "
>     >
>     >>>>>>> meta-oe/conf/layer.conf >>>>>>
>     > Updated priority:
>     >        BBFILE_PRIORITY_openembedded-layer = "4"
>     > _______________________________________________
>     > meta-virtualization mailing list
>     > meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
>     --
>     "Thou shalt not follow the NULL pointer, for chaos and madness await
>     thee at its end"
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> 
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
> 


