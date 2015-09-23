Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5AFC9E00C34; Wed, 23 Sep 2015 09:48:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6FD90E007AE
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Sep 2015 09:48:25 -0700 (PDT)
Received: from iapetus.enea.se (172.16.141.177) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 23 Sep 2015 18:48:24 +0200
Date: Wed, 23 Sep 2015 18:48:24 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20150923164824.GA19243@iapetus.enea.se>
References: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4N3P9V4va_=Pw2DbykpfC1qoG7PoOBbHoV5OROnNAxpNQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4N3P9V4va_=Pw2DbykpfC1qoG7PoOBbHoV5OROnNAxpNQ@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH] Dependency on pbr
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
X-List-Received-Date: Wed, 23 Sep 2015 16:48:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Sep 22, 2015 at 02:42:31PM -0400, Bruce Ashfield wrote:
> On Mon, Sep 21, 2015 at 10:57 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > I've been hitting build issues every now and then due to python
> > packages that depend on python-pbr but have not properly declared
> > this dependency in their respective recipes. I have fixed some of
> > them as soon as they popped up, but that wouldn't catch all
> > packages missing this dependency.
> > In order to fix this, I looked att the packages that declare a
> > dependency on "pbr" in their setup.py file, and made it a
> > dependency also in their respective recipe.
> >
> > I hope this is the proper way to solve this.
> 
> In the latest incarnations of the layers and oe-core, it is.  A while about
> ~ a year to a year and a half ago, adding pbr as a dependency was causing
> build issues with colliding packages and some built in routines.

Aha, I understand, I wasn't aware of that, it's good to know.

> 
> That no longer seems to be the case, so I've merged this, and the one to
> master.

Thanks!

/Josep

> 
> Bruce
> 
> >
> > Josep Puigdemont (1):
> >   python packages: add build dependency on python-pbr
> >
> >  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 4 ++++
> >  .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb         | 8 ++++++++
> >  meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb       | 4 ++++
> >  .../recipes-devtools/python/python-openstackclient_1.0.3.bb       | 8 ++++++++
> >  .../recipes-devtools/python/python-oslo.concurrency_1.5.0.bb      | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb    | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb  | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 1 +
> >  .../recipes-devtools/python/python-oslo.messaging_git.bb          | 2 ++
> >  .../recipes-devtools/python/python-oslo.middleware_0.4.0.bb       | 2 ++
> >  .../recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb         | 2 ++
> >  .../recipes-devtools/python/python-oslo.serialization_git.bb      | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 2 ++
> >  meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb   | 5 +++++
> >  meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb | 2 ++
> >  meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb     | 2 ++
> >  meta-openstack/recipes-devtools/python/python-tooz_0.4.bb         | 2 ++
> >  18 files changed, 54 insertions(+)
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

