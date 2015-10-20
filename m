Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EAB5EE008AE; Tue, 20 Oct 2015 07:49:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 41157E00843
	for <meta-virtualization@yoctoproject.org>;
	Tue, 20 Oct 2015 07:49:31 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.149) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 20 Oct 2015 16:49:25 +0200
Date: Tue, 20 Oct 2015 16:49:25 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20151020144925.GA23845@iapetus.enea.se>
References: <1445255604-65032-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4PwKQdVZk4=ps25scwwk2xbyxY1bo=VJT9GBPFCA+2-Jw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4PwKQdVZk4=ps25scwwk2xbyxY1bo=VJT9GBPFCA+2-Jw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo]][PATCH] python-openstackclient: fix checksums
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
X-List-Received-Date: Tue, 20 Oct 2015 14:49:38 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 20, 2015 at 10:42:41AM -0400, Bruce Ashfield wrote:
> On Mon, Oct 19, 2015 at 7:53 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > ---
> >  .../recipes-devtools/python/python-openstackclient_1.0.4.bb           | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> > index a585b68..221c817 100644
> > --- a/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-openstackclient_1.0.4.bb
> > @@ -8,8 +8,8 @@ SRCNAME = "python-openstackclient"
> >
> >  SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> >
> > -SRC_URI[md5sum] = "595c9be3ae2f967f7dd5f33753137377"
> > -SRC_URI[sha256sum] = "d39a2e6cf98d409f8545b9d3a207eb8cbf3b2fc5ea17b0f8d9bed52326ca9f49"
> > +SRC_URI[md5sum] = "3ba35cbfa48b876d198d83e37a794721"
> > +SRC_URI[sha256sum] = "4ae6d7b35fd1da2a07959fea9639e506871abfb769c62f3692d2f2585605ac85"
> 
> Where they just wrong for the version before ? Or did something change
> upstream ? If
> they re-packed the tgz, we'd like to document that and check what
> actually changed.

a blunder from my side, sorry. When I updated the recipe in the previous
commit, I updated the version too (from 1.0.3 to 1.0.4), but I forgot to
update the hashes. I don't know how it happened, because I do test the
patches before sending them, but obviously that time I didn't...

/Josep
> 
> Bruce
> 
> >
> >  S = "${WORKDIR}/${SRCNAME}-${PV}"
> >
> > --
> > 1.9.1
> >
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

