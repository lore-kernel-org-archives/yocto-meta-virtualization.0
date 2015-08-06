Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6E193E009B8; Thu,  6 Aug 2015 05:38:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C352E00867
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 05:38:10 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t76Cc4W9009986
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 6 Aug 2015 05:38:04 -0700 (PDT)
Received: from yow-masselst-d1.localnet (128.224.56.91) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.235.1; Thu, 6 Aug 2015 05:38:03 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 6 Aug 2015 08:39:20 -0400
Message-ID: <1623077.yRKgO9kaQh@yow-masselst-d1>
Organization: Wind River Internation Inc.
User-Agent: KMail/4.13.3 (Linux/3.13.0-52-generic; KDE/4.13.3; x86_64; ; )
In-Reply-To: <CADkTA4N6maGASaise+LZakvfhj8zK-UonCko02gQWP8w=vk4wQ@mail.gmail.com>
References: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
	<1438806592-32745-10-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4N6maGASaise+LZakvfhj8zK-UonCko02gQWP8w=vk4wQ@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [128.224.56.91]
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH 09/11] python-oslo.serialization: add pbr to DEPEND
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
X-List-Received-Date: Thu, 06 Aug 2015 12:38:13 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On August 5, 2015 21:14:36 Bruce Ashfield wrote:
> On Wed, Aug 5, 2015 at 4:29 PM, Mark Asselstine
> 
> <mark.asselstine@windriver.com> wrote:
> > Per the package's setup.py we need to depend on python-pbr. Failing to
> > 
> > do so results in a build failure:
> >     Could not find suitable distribution for Requirement.parse('pbr')
> 
> My same comment applies. You'll find 15 or 20 packages that depend on
> pbr, but that didn't specify it.
> 
> We used to get errors if it was specified, since pbr was also coming from
> the base python package.

Were we not pushing our luck a little bit by not addressing the QA errors? By 
luck I mean that without anti-DEPENDS we simply relied on the fact that 
nothing else was causing pbr to be present in the sysroot before these 
packages were built (far from a guarantee).

> 
> Sounds like this is no longer the case.

I believe this is the case but will look to backup this statement with further 
testing today. My current view is:

- Previously => some pkgs _could_ build without pbr DEPENDS
             => building with pbr will/could cause QA issues

- Currently => some pkgs _will_ fail to build without pbr DEPENDS
            => building with pbr does cause QA issues

Since the previous approach was somewhat 'lucky' as described previously I 
would say that this shift in being able to build with pbr and not have QA 
issues is a shift in our favor.

I will follow up with some further test findings.

Mark
      

> 
> Bruce
> 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb |
> >  1 + 1 file changed, 1 insertion(+)
> > 
> > diff --git
> > a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> > b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> > index 451c6b9..7f0fb9c 100644
> > ---
> > a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> > +++
> > b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> > @@ -19,6 +19,7 @@ inherit setuptools
> > 
> >  DEPENDS += " \
> >  
> >          python-pip \
> > 
> > +        python-pbr \
> > 
> >          "
> >  
> >  # RDEPENDS_default:
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


