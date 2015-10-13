Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 54416E00DF0; Tue, 13 Oct 2015 09:33:05 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C37C9E00DEB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 09:33:01 -0700 (PDT)
Received: from iapetus.enea.se (172.16.140.39) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 13 Oct 2015 18:32:58 +0200
Date: Tue, 13 Oct 2015 18:32:58 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20151013163258.GA21000@iapetus.enea.se>
References: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4OMKAuepbBE-cR8XvTKk_tfEK7m3Oi7qiW+3NS7Co+vaw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OMKAuepbBE-cR8XvTKk_tfEK7m3Oi7qiW+3NS7Co+vaw@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido/kilo][PATCH 0/3] openstack client
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
X-List-Received-Date: Tue, 13 Oct 2015 16:33:05 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Oct 13, 2015 at 11:29:28AM -0400, Bruce Ashfield wrote:
> On Wed, Oct 7, 2015 at 11:38 AM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > The openstack client depends on cliff-tablib:
> >   # openstack token issue
> >   ERROR: openstackclient.shell Exception raised: cliff-tablib>=1.0
> >
> > I've added the necessary recipes to satisfy this dependency, and
> > updated openstackclient to a newer minor version.
> 
> Sorry for the delay, I was traveling and didn't get to this until now.

No problem!

> 
> Any particular reason why you bumped to 1.0.4 ? versus something completely
> up to date (incompatibilities with the kilo release ?).

this was the latest available release in the stable/kilo branch, I don't know
if there might be any incompatibilities between master (or liberty) and kilo,
I have not tried it yet.

> 
> I was going to merge this to master at the same time, but ran into the version
> skew, and was considering the best way to get the same updated dependencies
> into master.
> 
> Bruce
> 
> >
> > Josep Puigdemont (3):
> >   python-tablib: added recipe
> >   python-cliff-tablib: add recipe
> >   openstackcclient: New version and updated dependencies
> >
> >  .../python/python-cliff-tablib_git.bb              | 23 ++++++++++++++++++++++
> >  ...nt_1.0.3.bb => python-openstackclient_1.0.4.bb} | 15 ++++++++++++++
> >  .../python/python-tablib_0.10.0.bb                 | 18 +++++++++++++++++
> >  3 files changed, 56 insertions(+)
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb
> >  rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.3.bb => python-openstackclient_1.0.4.bb} (63%)
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb
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

