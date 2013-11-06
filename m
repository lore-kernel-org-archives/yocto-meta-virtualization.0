Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 551C0E017C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  6 Nov 2013 05:14:02 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1Ve2ve-0002UO-P1; Wed, 06 Nov 2013 13:13:52 +0000
Message-ID: <527A4093.2010806@twobit.us>
Date: Wed, 06 Nov 2013 08:13:55 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383704237-3496-1-git-send-email-flihp@twobit.us>
	<CABZSBQcqShF0d4AOy3pxi3uc_d=NchGw7LiEYZS5HmgUoSL4Rw@mail.gmail.com>
In-Reply-To: <CABZSBQcqShF0d4AOy3pxi3uc_d=NchGw7LiEYZS5HmgUoSL4Rw@mail.gmail.com>
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
Subject: Re: [PATCH v2] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Wed, 06 Nov 2013 13:14:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/05/2013 09:36 PM, Chris Patterson wrote:
> FYI - removing libgl as a dependency exposes another hardcoded
> dependency/check/path (in this case adding /usr/include/GL to the
> include path for qemu-xen-traditional).  Probably won't hit it unless
> you have the opengl or libsdl dev bits on your host (as I do).
> 
> WARNING: QA Issue: xen: The compile log indicates that host include
> and/or library paths were used.
> ...
>   CC    audio/sdlaudio.o
> cc1: warning: include location "/usr/include/GL" is unsafe for
> cross-compilation [-Wpoison-system-directories]
> ....

Yuck. I'm seeing this in the qemu-xen-traditional configure script. It's
a separate issue from this patch though no?

- Philip

> On Tue, Nov 5, 2013 at 9:17 PM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     This patch moves the optional SDL dependency to a PACKAGECONFIG
>     entry. It also cleans up dependencies on both the virtual libsdl
>     and libsdl. The dependency on libgl is also removed. libGL support
>     should be enabled with the 'opengl' distro feature instead. The
>     dependency on glib-2.0 is now explicit as well.
> 
>     Signed-off-by: Philip Tricca <flihp@twobit.us <mailto:flihp@twobit.us>>
>     ---
>      recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb> |    6 ++++--
>      1 file changed, 4 insertions(+), 2 deletions(-)
> 
>     diff --git a/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     b/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     index 09c25aa..283da28 100644
>     --- a/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     +++ b/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     @@ -21,17 +21,19 @@ COMPATIBLE_HOST = '(x86_64.*).*-linux'
>      inherit autotools gettext setuptools update-rc.d
> 
>      PACKAGECONFIG ??= " \
>     +    sdl \
>          xsm \
>      "
>     +PACKAGECONFIG[sdl] = "--enable-sdl,--disable-sdl,virtual/libsdl,"
>      PACKAGECONFIG[xsm] =
>     "--enable-xsmpolicy,--disable-xsmpolicy,checkpolicy-native,"
> 
>     -DEPENDS = "util-linux util-linux-native file-native zlib ncurses
>     openssl bison-native flex-native gettext dev86-native iasl-native
>     pciutils virtual/libgl virtual/libsdl bridge-utils iproute2 procps
>     yajl pixman python python-setuptools-native xz xz-native libsdl"
>     +DEPENDS = "util-linux util-linux-native file-native zlib ncurses
>     openssl bison-native flex-native gettext dev86-native iasl-native
>     pciutils bridge-utils iproute2 procps yajl pixman python
>     python-setuptools-native xz xz-native glib-2.0"
> 
>      # inherit setuptools adds python to RDEPENDS, override it
>      RDEPENDS_${PN} = ""
> 
>      RDEPENDS_${PN}-base = "\
>     -    libgcc libsdl udev bash perl xz \
>     +    libgcc udev bash perl xz \
>          ${PN}-blktap \
>          ${PN}-console \
>          ${PN}-libblktapctl \
>     --
>     1.7.10.4
> 
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 


