Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A39BE0053A
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Feb 2014 08:43:25 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[10.79.148.145]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1WCtvN-0001rh-EA; Mon, 10 Feb 2014 16:41:38 +0000
Message-ID: <52F901A6.2000308@twobit.us>
Date: Mon, 10 Feb 2014 11:43:18 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20131104 Icedove/17.0.10
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <1391996719-14419-1-git-send-email-flihp@twobit.us>
	<1391996719-14419-3-git-send-email-flihp@twobit.us>
	<CABZSBQdqreuLav6Wq=6BjgdWsOr+0ezi6EV3_gi3adPLDBi6uw@mail.gmail.com>
In-Reply-To: <CABZSBQdqreuLav6Wq=6BjgdWsOr+0ezi6EV3_gi3adPLDBi6uw@mail.gmail.com>
X-Enigmail-Version: 1.5.1
X-SA-Exim-Connect-IP: 76.24.20.220
X-SA-Exim-Mail-From: flihp@twobit.us
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on smtp.twobit.us
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
X-SA-Exim-Version: 4.2.1 (built Mon, 26 Dec 2011 16:24:06 +0000)
X-SA-Exim-Scanned: Yes (on smtp.twobit.us)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] xen: Add RDEPENDS block for xendomains script.
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
X-List-Received-Date: Mon, 10 Feb 2014 16:43:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Your guess is as good as mine. I've not had to dive into xl code. I'm
just going on observed behavior right now. I spent a bunch of time just
tracking down the 'dependency' as it seems to be quite unrelated.

The hang only seems to be triggered when invoking 'xl create' in a
subshell from the xendomains script. Just breaking this call out of the
subshell gets everything back on track. I'm satisfied to write this off
as a mystery for the time being. It moves the recipe forward with some
better granularity in the runtime dependencies which was my main goal.

Incremental progress is good right? :P

Philip

On 02/09/2014 09:57 PM, Chris Patterson wrote:
> Perhaps something to do with udev rules (which may invoke the block
> scripts)?
> 
> 
> On Sun, Feb 9, 2014 at 8:45 PM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     I can't explain the dependency on xen-scripts-block as the xendomains
>     script doesn't invoke any of these scripts directly. Still xendomains
>     hangs indefinitely without them.
> 
>     Signed-off-by: Philip Tricca <flihp@twobit.us <mailto:flihp@twobit.us>>
> 
>     diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>     index bd2fc74..4c27497 100644
>     --- a/recipes-extended/xen/xen.inc
>     +++ b/recipes-extended/xen/xen.inc
>     @@ -70,6 +70,13 @@ RDEPENDS_${PN}-xencommons = "\
>          ${PN}-scripts-common \
>          "
> 
>     +RDEPENDS_${PN}-xendomains = "\
>     +    ${PN}-console \
>     +    ${PN}-scripts-block \
>     +    ${PN}-scripts-common \
>     +    ${PN}-xenstored \
>     +    "
>     +
>      RDEPENDS_${PN}-xl = "libgcc"
> 
>      PACKAGES = "\
>     --
>     1.7.10.4
> 
> 


