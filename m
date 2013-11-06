Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (unknown [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 73EFBE0174E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Nov 2013 18:18:47 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1VdshZ-0002DP-54; Wed, 06 Nov 2013 02:18:37 +0000
Message-ID: <5279A6FA.1050502@twobit.us>
Date: Tue, 05 Nov 2013 21:18:34 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130922 Icedove/17.0.9
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1383495029-26728-1-git-send-email-flihp@twobit.us>
	<CABZSBQfVAtZkacVcUVfxbu8CN7R605eSzn_dJ1TOkSHQ3eETUg@mail.gmail.com>
	<52792C7A.4040801@twobit.us>
	<CABZSBQeVjnMN3YP00UKLt1VkHb_R+SL0O2y+qiqt=LL=jt2zKA@mail.gmail.com>
In-Reply-To: <CABZSBQeVjnMN3YP00UKLt1VkHb_R+SL0O2y+qiqt=LL=jt2zKA@mail.gmail.com>
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
X-List-Received-Date: Wed, 06 Nov 2013 02:18:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 11/05/2013 08:08 PM, Chris Patterson wrote:
> 
> 
> 
> On Tue, Nov 5, 2013 at 12:35 PM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     Hi Chris,
> 
>     On 11/04/2013 10:17 PM, Chris Patterson wrote:
>     > I would think that libsdl should be included as a runtime
>     dependency if
>     > enabled...?  Though looking through recipes, it would appear that many
>     > PACKAGECONFIG users ignore the runtime dependencies (presumably
>     assuming
>     > that the image will include them if the functionality is desired - or
>     > perhaps specifying only when the dependency is strictly required as a
>     > result?).
> 
>     I left out the runtime dependency stuff because the xen-qemu package
>     will end up with a dependency on libsdl if it's enabled. I was under the
>     impression that this is sufficient though I'm not exactly sure how the
>     dependency is created. Honestly I was happy to write it off as
>     bitbake/OE magic. I've tested dom0 images with sdl enabled and disabled
>     and the xen-qemu package will pull the SDL library into the image if
>     it's enabled.
> 
>     Are you seeing different behavior?
> 
> 
> My mistake - my grep foo was weak - the libSDL shared objects are
> special enough to deserve capitalization. :)

I did the same thing. No worries.

Just sent out a v2 to get the glib-2.0 dependency I missed. Should be ok
from here but another set of eyes to test would be much appreciated. Any
progress on the update to Xen 4.3.1? ;)

- Philip


