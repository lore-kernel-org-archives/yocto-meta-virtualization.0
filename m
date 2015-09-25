Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 520C0E00E4E; Fri, 25 Sep 2015 10:11:49 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CE273E006F6
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Sep 2015 10:11:45 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.177) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 25 Sep 2015 19:11:40 +0200
Date: Fri, 25 Sep 2015 19:11:40 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20150925171140.GA19169@iapetus.enea.se>
References: <1443026751-57424-1-git-send-email-josep.puigdemont@enea.com>
	<20150923165411.GB19243@iapetus.enea.se>
	<CAPuovE+D4J2pbmzQywiW4sd2LcV8mOF9kXiKjdbupQJjfBsG5A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPuovE+D4J2pbmzQywiW4sd2LcV8mOF9kXiKjdbupQJjfBsG5A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] python-glancestore: requires python module enum
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
X-List-Received-Date: Fri, 25 Sep 2015 17:11:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 24, 2015 at 04:40:01PM -0400, Mark Asselstine wrote:
> On Wed, Sep 23, 2015 at 12:54 PM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > I for got to mention that the patch should be applicable to
> > master too, but I have not run any tests there.
> 
> If you are working mostly in Kilo I am happy to try to stay on top of
> commits you send against that branch and test them out on master, if
> you want to do the same for things I send to master and test them with
> Kilo, that would be great :).

Sounds like a plan ;-)
I intended to move to master rather soon too, but for as long as I use
kilo I can do that, and even after that I can try to put some time on
it. I agree that it is good to have both branches working.

> 
> I would love to get our basic usecase (boot controller and compute,
> log in to horizon, import and image, instantiate an instance...)
> working again on both branches.

I test the AIO image for now, and run it under qemu (it almost works),
but I'll try building the different images too.

I have a few commits pending to upstream, mostly to meet the required
dependencies to get the basic services running.

/Josep

> 
> Mark
> 
> >
> > /Josep
> >
> > On Wed, Sep 23, 2015 at 06:45:51PM +0200, Josep Puigdemont wrote:
> >> In capabilities, glance store imports enum, which is available
> >> since python 3.4. For earlier versions of python we can use
> >> the backported package python-enum34 from meta-python.
> >>
> >> Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> >> ---
> >>  meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> >> index b3aa2f3..43707ee 100644
> >> --- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> >> +++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
> >> @@ -22,6 +22,7 @@ DEPENDS += " \
> >>          "
> >>
> >>  RDEPENDS_${PN} = " \
> >> +   python-enum34 \
> >>     python-eventlet \
> >>     python-iso8601 \
> >>     python-six \
> >> --
> >> 1.9.1
> >>
> >> --
> >> _______________________________________________
> >> meta-virtualization mailing list
> >> meta-virtualization@yoctoproject.org
> >> https://lists.yoctoproject.org/listinfo/meta-virtualization
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization

