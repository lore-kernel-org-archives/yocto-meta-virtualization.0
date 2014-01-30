Return-Path: <flihp@twobit.us>
Received: from smtp.twobit.us (smtp.twobit.us [38.83.192.235])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 476BBE006AD
	for <meta-virtualization@yoctoproject.org>;
	Thu, 30 Jan 2014 05:40:02 -0800 (PST)
Received: from c-76-24-20-220.hsd1.ma.comcast.net ([76.24.20.220]
	helo=[172.16.1.12]) by smtp.twobit.us with esmtpsa
	(TLS1.0:DHE_RSA_CAMELLIA_256_CBC_SHA1:256) (Exim 4.80)
	(envelope-from <flihp@twobit.us>)
	id 1W8rp4-00036Y-1g; Thu, 30 Jan 2014 13:38:26 +0000
Message-ID: <52EA562A.4090806@twobit.us>
Date: Thu, 30 Jan 2014 08:39:54 -0500
From: Philip Tricca <flihp@twobit.us>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20131104 Icedove/17.0.10
MIME-Version: 1.0
To: Chris Patterson <cjp256@gmail.com>
References: <52E04F4F.7070003@twobit.us>
	<CABZSBQf84tJNhwdkjGE3MpXhVrtOX_fvmUkk+YBZ52W6FRrA5A@mail.gmail.com>
In-Reply-To: <CABZSBQf84tJNhwdkjGE3MpXhVrtOX_fvmUkk+YBZ52W6FRrA5A@mail.gmail.com>
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
Subject: Re: xendomains init script from xen recipe hangs
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
X-List-Received-Date: Thu, 30 Jan 2014 13:40:03 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 01/24/2014 04:11 PM, Chris Patterson wrote:
> It works for me (on a slightly modified xen-image-minimal) with some
> complaints about head (-c flag not implemented in busybox) if you don't
> have coreutils installed (add coreutils to your image and that should go
> away).
> 
> Can you try it on the command line?
> 
> bash -x /etc/init.d/xendomains stop
> 
> bash -x /etc/init.d/xendomains start
> 
> Depending on what you are seeing, you may need to adjust your values in
> /etc/default/xendomains.

Oddly enough the script is blocking on the call to 'xl create --quiet
--defconfig ...'. While the script is blocked on this call, I can
background it (Ctrl+z) and connect a console to the VM that it started.
I can log into it and everything so I'm pretty convinced it started fine.

Killing off the console I can then bring the call to the xendomains
script to the foreground again. When I do this it's still blocked on the
call to 'xl create'. Creating the VM manually using xl works as
expected.  Pretty sure this isn't just a timeout issue as
'XENDOMAINS_CREATE_USLEEP' is 5 seconds by default. This seems to be
hanging indefinitely. Starting VMs is the simple case so I'm at a bit of
a loss.

Thanks,
Philip

> On Wed, Jan 22, 2014 at 6:07 PM, Philip Tricca <flihp@twobit.us
> <mailto:flihp@twobit.us>> wrote:
> 
>     Hey Chris,
> 
>     I'm guessing you're the only one who may have tried to use this script
>     before. I've got a simple test VM I want to start on boot. The
>     xendomains script (from the xen recipe) starts my VM but then hangs for
>     what seems to be forever. Have you had luck or even tried to use this
>     script before?
> 
>     This may not even be the right tool for what I'm trying to do but it's
>     there for free so I thought I'd give it a try.
> 
>     Thanks,
>     Philip
> 
> 


