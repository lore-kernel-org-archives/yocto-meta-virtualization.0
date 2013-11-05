Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 18989E01716
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 09:35:58 -0800 (PST)
Received: from [216.57.91.130] (helo=[10.204.207.200])
	by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VdkXb-00022L-B8; Tue, 05 Nov 2013 17:35:48 +0000
Message-ID: <52792C7A.4040801@twobit.us>
Date: Tue, 05 Nov 2013 12:35:54 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383495029-26728-1-git-send-email-flihp@twobit.us>
	<CABZSBQfVAtZkacVcUVfxbu8CN7R605eSzn_dJ1TOkSHQ3eETUg@mail.gmail.com>
In-Reply-To: <CABZSBQfVAtZkacVcUVfxbu8CN7R605eSzn_dJ1TOkSHQ3eETUg@mail.gmail.com>
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
Subject: Re: [PATCH] xen: use PACKAGECONFIG for SDL and a bit of dependency cleanup
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
X-List-Received-Date: Tue, 05 Nov 2013 17:36:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi Chris,

On 11/04/2013 10:17 PM, Chris Patterson wrote:
> I would think that libsdl should be included as a runtime dependency if
> enabled...?  Though looking through recipes, it would appear that many
> PACKAGECONFIG users ignore the runtime dependencies (presumably assuming
> that the image will include them if the functionality is desired - or
> perhaps specifying only when the dependency is strictly required as a
> result?).

I left out the runtime dependency stuff because the xen-qemu package
will end up with a dependency on libsdl if it's enabled. I was under the
impression that this is sufficient though I'm not exactly sure how the
dependency is created. Honestly I was happy to write it off as
bitbake/OE magic. I've tested dom0 images with sdl enabled and disabled
and the xen-qemu package will pull the SDL library into the image if
it's enabled.

Are you seeing different behavior?

Regards,
- Philip

P.S. There's a dependency issue with this patch anyways so I'll send out
a v2 with a minor fix tonight.

> On Sun, Nov 3, 2013 at 11:10 AM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     This patch moves the optional SDL dependency to a PACKAGECONFIG
>     entry. It also cleans up dependencies on both the virtual libsdl
>     and libsdl. The dependency on libgl is also removed. libGL support
>     should be enabled with the 'opengl' distro feature instead.
> 
>     Signed-off-by: Philip Tricca <flihp@twobit.us <mailto:flihp@twobit.us>>
>     ---
>      recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb> |    6 ++++--
>      1 file changed, 4 insertions(+), 2 deletions(-)
> 
>     diff --git a/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     b/recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb>
>     index 09c25aa..1fad48d 100644
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
>     python-setuptools-native xz xz-native"
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


