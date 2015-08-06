Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BEFA4E009B8; Thu,  6 Aug 2015 06:00:09 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7E860E00867
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 06:00:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t76D01tJ010132
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Aug 2015 06:00:02 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 6 Aug 2015 06:00:01 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2015 09:01:17 -0400
Message-ID: <4916663.vW0W1FbXsT@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.13.3 (Linux/3.13.0-52-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-7-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4PzxM+HhWn-_55Gdcecn=+54fiySVFCe7=pyZjEbE_fKg@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.91]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 06/11] python-testtools: fix build error
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
X-List-Received-Date: Thu, 06 Aug 2015 13:00:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 5, 2015 21:11:35 Bruce Ashfield wrote:
> On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > Ran in to a build error:
> > distutils.errors.DistutilsError: Could not find suitable distribution for
> > Requirement.parse('pbr') ERROR: python setup.py build execution failed.
> > 
> > Fix by DEPENDing on python-pbr.
> 
> This used to be on purpose. If you added python-pbr to DEPENDS the images
> would fail to assemble due to QA errors and overlapping files.
> 
> If you say that you've successfully assembled and booted the images and pbr
> isn't acting up, I'll merge this .. but otherwise, I'm eyeing the
> change for more
> testing.

Some quick build testing this morning and I can confirm that both this package 
and the python-oslo.serialization packages *will not* build without pbr. For 
this package we can see that upstream has converted to building with pbr so 
the build failure in the absence of pbr is easily explained:

---
commit 915b2b604c0e9b97e813711c035dfd13682fb6df
Author: Robert Collins <robertc@robertcollins.net>
Date:   Tue May 5 10:45:22 2015 +1200

    Switch to pbr as a build system
    ...
---

Similarly for python-oslo.serialization we can see commits in the upstream 
repo which point to the required pbr dependency:

---
commit a7bade117a8f8297955c0cb8adb6757d30f02e1b
Author: Doug Hellmann <doug@doughellmann.com>
Date:   Fri Oct 24 09:29:18 2014 -0400

    Add pbr to installation requirements
    
    Add pbr to the list of installation requirements so that it is installed
    via pip before this library is installed, instead of with easy_install.
    This avoids issues like Bug #1384919, and ensures that projects that use
    this library as a dependency are properly installed.
    
    Change-Id: I6c155370dbd01fe4748d5137bdf288e8d3e1a67e
---
I can't easily identify the change that made pbr mandatory but the build 
failure is 100% reproducible so there is definitely a change which prevents us 
from treating this as optional. 

I can also confirm that with these changes there exists no QA errors that 
prevent the images from being constructed. I did builds from scratch and 
others out of sstate without issue. I would be more than happy if Li would 
like to confirm this by doing a build with this series applied.

Mark

> 
> Bruce
> 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git
> > a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> > b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb index
> > 80a7489..a58c91a 100644
> > --- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> > @@ -17,4 +17,8 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
> > 
> >  inherit setuptools
> > 
> > +DEPENDS += " \
> > +    python-pbr \
> > +"
> > +
> > 
> >  RDEPENDS_${PN} += "python-extras"
> > 
> > --
> > 2.1.4
> > 
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization
> 
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"


