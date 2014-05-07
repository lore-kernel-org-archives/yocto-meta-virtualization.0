Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 88004E0070F; Wed,  7 May 2014 09:29:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.179 listed in list.dnswl.org]
Received: from mail-lb0-f179.google.com (mail-lb0-f179.google.com
	[209.85.217.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B0A36E00480
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 09:29:52 -0700 (PDT)
Received: by mail-lb0-f179.google.com with SMTP id c11so1718227lbj.24
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 May 2014 09:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pZZrxyOL+wALUSPz+C19I4Nw9Hj5PSMK7YoUyK1C88U=;
	b=Doip65F+7SXJnXUuAXGZgm9EnLsDwnKmoUnwRqewRSniKFGR5gTg0E0HpGfpn40KWm
	dSrMD8Umu3Xpud5rmieDDjgyZXOc5JoOaAbP5hfMsp01n0LDsh9Wgk4g0RRJC4StrzDM
	fZCfoe9Mm6WYEW8AfDj2Bn+kwk3keJ2io6LdLPYtcZ2Z/sT1524q9ili9StPC0BGtGqM
	mIwfpQ//BQe/c4Ap8YhZ28WGPStS2Tm5OYLxGXBokMVM8nnFWZHgJUYqfFFyvWR+tA2B
	UO8mZ9BEV+Qht/R9UozE+fOD1FJgo28kNJYI8L3anHxLsD976SVx2Ro/yCWAREtl6iDG
	1p2A==
MIME-Version: 1.0
X-Received: by 10.112.57.164 with SMTP id j4mr2114701lbq.77.1399480191575;
	Wed, 07 May 2014 09:29:51 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Wed, 7 May 2014 09:29:51 -0700 (PDT)
In-Reply-To: <20140507151308.GC18437@iapetus.enea.se>
References: <20140507151308.GC18437@iapetus.enea.se>
Date: Wed, 7 May 2014 12:29:51 -0400
Message-ID: <CADkTA4MvZSR1ydH1FdUByfEGQ0fdP4znUFCm2+ujQHMdzEHrAA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: daisy
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
X-List-Received-Date: Wed, 07 May 2014 16:29:58 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 11:13 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> Hi,
>
> with yocto 1.6 released, I wonder if a daisy branch for meta-virtualization
> is planned, as there was one for dora.

There is one planned. I was just waiting for the dust to settle before
pushing the one I tagged at the time of the release.

I was looking into one issue with libvirt against the release, but once that
is confirmed or denied, I'll push a branch .. unless someone beats me to
it :)

I typically build meta-virt master against mutiple versions of the core, so
it does work and with the wildcard bbappends .. that'll only get easier.

Cheers,

Bruce

>
> Thanks,
> Josep
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

