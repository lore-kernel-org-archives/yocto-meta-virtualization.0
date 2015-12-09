Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A2CBFE00B20; Tue,  8 Dec 2015 23:44:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 51ECBE00406
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 23:44:17 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Dec 2015 08:44:14 +0100
Date: Wed, 9 Dec 2015 08:44:14 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20151209074414.GA15477@iapetus.enea.se>
References: <CAPuovEKNdfoeP6ewE2gXHJB46OiBXAdsQ2wiLYWrDVmpM0Ay7A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPuovEKNdfoeP6ewE2gXHJB46OiBXAdsQ2wiLYWrDVmpM0Ay7A@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 41/42] packagegroup-cloud-extras: include xterm only if x11 in DISTRO_FEATURES
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
X-List-Received-Date: Wed, 09 Dec 2015 07:44:23 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 08, 2015 at 08:31:53PM -0500, Mark Asselstine wrote:
> On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > ---
> 
> The reason we included xterm is to have the 'resize' command
> available. Admittedly this is a big hammer to solve a small problem
> but an annoying problem. Was xterm causing issues?

I had no x11 on one of my images, so the build bailed out due to that.

/Josep

> 
> Mark
> 
> >  .../recipes-extended/packagegroups/packagegroup-cloud-extras.bb         | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> > index 35b9b6e..721e2c9 100644
> > --- a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> > +++ b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extras.bb
> > @@ -8,7 +8,7 @@ inherit packagegroup
> >
> >  RDEPENDS_${PN} = " \
> >      vim \
> > -    xterm \
> > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'xterm', '', d)} \
> >      "
> >
> >  IMAGE_FEATURES += "package-management"
> > --
> > 2.5.0
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization

