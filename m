Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9122AE00AEA; Wed,  9 Dec 2015 05:42:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 39E97E008C8
	for <meta-virtualization@yoctoproject.org>;
	Wed,  9 Dec 2015 05:42:54 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tB9DgkNN002395
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 9 Dec 2015 05:42:46 -0800 (PST)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.248.2; Wed, 9 Dec 2015 05:42:45 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Date: Wed, 9 Dec 2015 08:42:44 -0500
Message-ID: <4884224.zQ0smeAS9m@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/5.0.2 (Linux/4.2.0-16-generic; KDE/5.15.0; x86_64; ; )
In-Reply-To: <20151209074414.GA15477@iapetus.enea.se>
References: <CAPuovEKNdfoeP6ewE2gXHJB46OiBXAdsQ2wiLYWrDVmpM0Ay7A@mail.gmail.com>
	<20151209074414.GA15477@iapetus.enea.se>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.91]
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
X-List-Received-Date: Wed, 09 Dec 2015 13:42:56 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On December 9, 2015 08:44:14 AM Josep Puigdemont wrote:
> On Tue, Dec 08, 2015 at 08:31:53PM -0500, Mark Asselstine wrote:
> > On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont
> > 
> > <josep.puigdemont@enea.com> wrote:
> > > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > > ---
> > 
> > The reason we included xterm is to have the 'resize' command
> > available. Admittedly this is a big hammer to solve a small problem
> > but an annoying problem. Was xterm causing issues?
> 
> I had no x11 on one of my images, so the build bailed out due to that.

Alright. No objections then from me. Thanks for the follow up.

Mark

> 
> /Josep
> 
> > Mark
> > 
> > >  .../recipes-extended/packagegroups/packagegroup-cloud-extras.bb        
> > >  | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git
> > > a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extr
> > > as.bb
> > > b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extr
> > > as.bb index 35b9b6e..721e2c9 100644
> > > ---
> > > a/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extr
> > > as.bb +++
> > > b/meta-openstack/recipes-extended/packagegroups/packagegroup-cloud-extr
> > > as.bb @@ -8,7 +8,7 @@ inherit packagegroup
> > > 
> > >  RDEPENDS_${PN} = " \
> > >  
> > >      vim \
> > > 
> > > -    xterm \
> > > +    ${@base_contains('DISTRO_FEATURES', 'x11', 'xterm', '', d)} \
> > > 
> > >      "
> > >  
> > >  IMAGE_FEATURES += "package-management"
> > > 
> > > --
> > > 2.5.0
> > > 
> > > --
> > > _______________________________________________
> > > meta-virtualization mailing list
> > > meta-virtualization@yoctoproject.org
> > > https://lists.yoctoproject.org/listinfo/meta-virtualization


