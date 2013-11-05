Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C342E0178C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 06:30:51 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[172.16.1.10]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VdheT-0001rC-JT; Tue, 05 Nov 2013 14:30:42 +0000
Message-ID: <5279010F.8080101@twobit.us>
Date: Tue, 05 Nov 2013 09:30:39 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1382998249-3028-1-git-send-email-flihp@twobit.us>
	<CADkTA4Nsa=Qd3V=9JrV_Xr++4rE-ia9+=1DPSdHReaNwrJctQA@mail.gmail.com>
	<CABZSBQfuwRW6rKgT3eYeSi76F9di2E5aoGaULOeV6HszPoqjcQ@mail.gmail.com>
In-Reply-To: <CABZSBQfuwRW6rKgT3eYeSi76F9di2E5aoGaULOeV6HszPoqjcQ@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=ALL_TRUSTED autolearn=ham
	version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/2] Xen: start using PACKAGECONFIG
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
X-List-Received-Date: Tue, 05 Nov 2013 14:30:54 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Agree. PACKAGECONFIG is still new to me and I didn't realize this was
the net result. I'll send out a patch soon ... unless you beat me to it.

- Philip

On 11/04/2013 09:55 PM, Chris Patterson wrote:
> I would remove xsm from the default PACKAGECONFIG list.  As it stands
> with the defaults, the recipe now requires checkpolicy-native (in
> meta-selinux) to build.
> 
> Cheers,
> -Chris
> 
> On Tue, Oct 29, 2013 at 2:20 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
> 
>     On Mon, Oct 28, 2013 at 6:10 PM, Philip Tricca <flihp@twobit.us
>     <mailto:flihp@twobit.us>> wrote:
>     > This is a first pass at cleaning up the DEPENDS and do_configure in
>     > the xen_4.3.0 recipe. Adding XSM stuff made it clear that directly
>     > interacting with DISTRO_FEATURES was the wrong way to do it. That and
>     > when Chris and I ment up at LinuxCon he told me I should have used
>     > PACKAGECONFIG in the first place :P
> 
>     :)
> 
>     >
>     > This small patch series is the first step to handling features (like
>     > sdl) using PACKAGECONFIG.
> 
>     Agreed. Small steps are good. This looks fine to me. I grabbed the
>     series,
>     since no one has offered an objection!
> 
>     Bruce
> 
>     >
>     > Philip Tricca (2):
>     >   Convert direct call to ./configure with oe_runconf and EXTRA_OECONF.
>     >   Use PACKAGECONFIG to deal with XSM policy.
>     >
>     >  recipes-extended/xen/xen_4.3.0.bb <http://xen_4.3.0.bb> |   19
>     +++++++++++++++++--
>     >  1 file changed, 17 insertions(+), 2 deletions(-)
>     >
>     > --
>     > 1.7.10.4
>     >
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


