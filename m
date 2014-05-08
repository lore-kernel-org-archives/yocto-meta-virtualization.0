Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B883E009A6; Thu,  8 May 2014 05:27:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.3 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.3 RDNS_NONE Delivered to internal network by a host
	with no rDNS
Received: from mx-3.enea.com (unknown [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 2113CE006EF
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 May 2014 05:27:15 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.137) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1; Thu, 8 May 2014
	14:27:13 +0200
Date: Thu, 8 May 2014 14:27:13 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20140508122713.GB29985@iapetus.enea.se>
References: <20140507151308.GC18437@iapetus.enea.se>
	<CADkTA4MvZSR1ydH1FdUByfEGQ0fdP4znUFCm2+ujQHMdzEHrAA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4MvZSR1ydH1FdUByfEGQ0fdP4znUFCm2+ujQHMdzEHrAA@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
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
X-List-Received-Date: Thu, 08 May 2014 12:27:18 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, May 07, 2014 at 12:29:51PM -0400, Bruce Ashfield wrote:
> On Wed, May 7, 2014 at 11:13 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > Hi,
> >
> > with yocto 1.6 released, I wonder if a daisy branch for meta-virtualization
> > is planned, as there was one for dora.
> 
> There is one planned. I was just waiting for the dust to settle before
> pushing the one I tagged at the time of the release.
> 
> I was looking into one issue with libvirt against the release, but once that
> is confirmed or denied, I'll push a branch .. unless someone beats me to
> it :)

Looks like someone did beat you and created the daisy branch already, unless
it was you, of course ;-)

/Josep

> 
> I typically build meta-virt master against mutiple versions of the core, so
> it does work and with the wildcard bbappends .. that'll only get easier.
> 
> Cheers,
> 
> Bruce
> 
> >
> > Thanks,
> > Josep
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> 
> 
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

