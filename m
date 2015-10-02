Return-Path: <edwingate8@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D7464E00B43; Fri,  2 Oct 2015 10:00:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (edwingate8[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.53 listed in list.dnswl.org]
Received: from mail-la0-f53.google.com (mail-la0-f53.google.com
	[209.85.215.53])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 91DABE00349
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 10:00:45 -0700 (PDT)
Received: by laer8 with SMTP id r8so95873741lae.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 02 Oct 2015 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=1TKpl63dTOH7LrhBb6tR17oHPgGDdFnauuqrsW6liUM=;
	b=Iq6F35aa9Ds7b74f/82tAX9GsU43sKnu6lt3eX68mtcnrkWBO+n/v0FOSxd4og/HKg
	oKURvY1C7euhufRai36SY1adfuCj/qwhC5Z0QW1RdV7NYo+hTCe52Xe/q2iqztYzoitT
	EVOlR1c4MjfpuHk1yvRrWNhfgEWmedWRAC5ShuSLhxHZ8CaqBQ0VMVpks4WWpL6BJWvQ
	3J1+wBeCS7prcqpb4+vDH1H/XXskuG6JNxaydgxExL+lTlglnLsbKOQpHYT8X45pi+/Z
	iIqxOHAIiVMDdLd+e/4oVN2lSNWom2PR9rqMF99NXubhYWHLSlCsBYClbNHqaRTbL+H0
	gMRA==
MIME-Version: 1.0
X-Received: by 10.112.13.201 with SMTP id j9mr6156800lbc.45.1443805243967;
	Fri, 02 Oct 2015 10:00:43 -0700 (PDT)
Received: by 10.114.245.38 with HTTP; Fri, 2 Oct 2015 10:00:43 -0700 (PDT)
In-Reply-To: <CADkTA4NwPcwtrniF3oqgtAPoaaM_79m+4rPPKpV19VZY52qzFw@mail.gmail.com>
References: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
	<CAGMdoFnzx+hQyV1Gdd0CXAqbR7U7J_uhwcj3A3w6NZPACGX1eA@mail.gmail.com>
	<CADkTA4NwPcwtrniF3oqgtAPoaaM_79m+4rPPKpV19VZY52qzFw@mail.gmail.com>
Date: Fri, 2 Oct 2015 10:00:43 -0700
Message-ID: <CAGMdoF=wE5c3McYjygOvGq4Gg62ynFcTkLCK9e98xYG95tRwLA@mail.gmail.com>
From: Edward Wingate <edwingate8@gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: python setuptools recipe
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
X-List-Received-Date: Fri, 02 Oct 2015 17:00:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Oct 2, 2015 at 5:46 AM, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
> Have you solved this yet ? I've never run into this myself, but maybe my
> reply will jog the memory of someone that has.

I haven't solved this when I received your message, but your
suggestions below prompted me to try some things that may have fixed
it, but leaves me with more questions.

> Have you ruled out that the build is using a versiontools from your host
> machine ? And that the versiontools is older than the 1.7 requirement ?
>
> I don't see versiontools already in the layers, so if it is being picked up
> from the host, then you very well could end up with this error.

I don't have versiontools installed on my host.  I went ahead and did
a "pip install versiontools" which installed v1.9.1.  I did a cleanall
on the recipe in question and rebuilt the image.  This appears to have
fixed the error.  But I'm not expert with Yocto and can't be sure it's
not reusing some remaining artifact from the previous successful run
where I just removed the "setup_requires" line.  In fact, to test
this, I uninstalled versiontools and did another cleanall on the
recipe, but the subsequent build is still successful, so I think it is
probably reusing some already built artifact.  What do I need to do to
further wipe things clean for the recipe in question, without wiping
EVERYTHING and starting from scratch?

> I'd start by creating a versiontools 1.9.1 recipe, put it in the DEPENDS for
> your recipe and see if everything is happy after that.

I'm a bit confused what this would do.  Had I done this instead of the
"pip install versiontools" above, would it have installed versiontools
on the image for my target, or would it have installed it on the host
(the equivalent of the pip install), or something else entirely?
Where do I actually need versiontools to be?

But it also doesn't explain why the attempt to download the necessary
version of versiontools fails.  Yocto seems to try to do the right
thing, but it just couldn't download what it needs.  Whereas directly
accessing the URLs in the error message via wget (and a browser)
worked.

Also, removing the setup_requires line fixed it 2 days ago.  Does it
mean it doesn't really need versiontools?  Or that it is getting some
different version of versiontools < 1.7 from somewhere (where?)?

Or perhaps the download of versiontools happened to be successful
today.  Arg, on the one hand, that would be great, but on the other, I
won't really know what fixed it.

