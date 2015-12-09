Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2632BE00B2E; Tue,  8 Dec 2015 23:49:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 87A83E00406
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 23:49:42 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Wed, 9 Dec 2015 08:49:42 +0100
Date: Wed, 9 Dec 2015 08:49:42 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Message-ID: <20151209074942.GB15477@iapetus.enea.se>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
	<1449596034-8308-43-git-send-email-josep.puigdemont@enea.com>
	<CAPuovE+u9VWg2V4VS76O-bbHt_cy4TyYkL-Bi8o2jb=kWdEwxg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPuovE+u9VWg2V4VS76O-bbHt_cy4TyYkL-Bi8o2jb=kWdEwxg@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido-kilo][PATCH 42/42] Remove argparse from requirements.txt of some modules
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
X-List-Received-Date: Wed, 09 Dec 2015 07:49:49 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 08, 2015 at 08:24:41PM -0500, Mark Asselstine wrote:
> On Tue, Dec 8, 2015 at 12:33 PM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > argparse is required by some of the CLI applications of openstack. The
> > module is provided by python 2.7, however python-distribute (used in fido),
> > is not able to find it:
> >
> > Python 2.7.9 (default, Oct 27 2015, 18:12:55)
> > [GCC 4.9.2] on linux2
> > Type "help", "copyright", "credits" or "license" for more information.
> >>>> import pkg_resources
> >>>> pkg_resources.get_distribution('argparse')
> > Traceback (most recent call last):
> >   File "<stdin>", line 1, in <module>
> >   File
> > "/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
> > line 338, in get_distribution
> >     if isinstance(dist,Requirement): dist = get_provider(dist)
> >   File
> > "/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
> > line 217, in get_provider
> >     return working_set.find(moduleOrReq) or require(str(moduleOrReq))[0]
> >   File
> > "/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
> > line 698, in require
> >     needed = self.resolve(parse_requirements(requirements))
> >   File
> > "/usr/lib/python2.7/site-packages/distribute-0.6.49-py2.7.egg/pkg_resources.py",
> > line 596, in resolve
> >     raise DistributionNotFound(req)
> > pkg_resources.DistributionNotFound: argparse
> >>>> import argparse
> >>>>
> >
> > This patch removes argparse from requirements.txt on the python modules
> > used by python-openstackclient, so openstack won't bail out on some
> > circumstances like when doing "openstack -h".
> 
> 
> I have a different solution for this issue in the stuff I am staging
> for master. The same end result but instead of managing patches I
> simply add
> 
> +do_install_append() {
> +    # argparse is stdlib since 2.6 so we can drop this to avoid
> consistency check errors
> +    sed -i '/argparse/d'
> ${D}${libdir}/python2.7/site-packages/${SRCNAME}-${PV}-py2.7.egg-info/requires.txt
> +}
> 
> Or a variation of the above to the recipes which have argparse in the
> requires.txt.
> 
> Your solution is fine but we should probably stick to one. Bruce can
> make the call.

At one point I had this step done as a postprocess command when creating
the image, but your solution is more elegant. Perhaps this could be
implemented in a bbclass, and then just inherit it.

I will let Bruce decide, and then I can resend this patch.

/Josep

> 
> Mark
> 
> 
> >
> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > ---
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-cinderclient_git.bb              |  3 ++-
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../recipes-devtools/python/python-cliff_1.10.0.bb |  1 +
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-glanceclient_git.bb              |  1 +
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-keystoneclient_git.bb            |  1 +
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-neutronclient_git.bb             |  3 +--
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-novaclient_git.bb                |  1 +
> >  .../Remove-argparse-from-requirements.txt.patch    | 25 ++++++++++++++++++++++
> >  .../python/python-oslo.config_1.9.3.bb             |  4 ++--
> >  .../Remove-argparse-from-requirements.txt.patch    | 23 ++++++++++++++++++++
> >  .../python/python-stevedore_1.3.0.bb               |  2 ++
> >  16 files changed, 209 insertions(+), 5 deletions(-)
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..0e597a4
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 7b3f09895c81cf9db0f40dd01e5e1ed5dc5af154 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 17:30:28 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 5a66b60..869d6c4 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -2,7 +2,6 @@
> > + # of appearance. Changing the order has an impact on the overall integration
> > + # process, which may cause wedges in the gate later.
> > + pbr!=0.7,<1.0,>=0.6
> > +-argparse
> > + PrettyTable<0.8,>=0.7
> > + python-keystoneclient<1.4.0,>=1.2.0
> > + requests!=2.4.0,>=2.2.0
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
> > index 951198d..4d8f00f 100644
> > --- a/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-cinderclient_git.bb
> > @@ -11,10 +11,11 @@ SRC_URI = "\
> >         git://github.com/openstack/python-cinderclient.git;branch=stable/kilo \
> >         file://fix_cinderclient_memory_leak.patch \
> >         file://cinder-api-check.sh \
> > +       file://Remove-argparse-from-requirements.txt.patch \
> >         "
> >
> >  PV="1.1.2+git${SRCPV}"
> > -SRCREV="b44d32d02b014748044b5b18d27a9d1f8312145c"
> > +SRCREV="36ad09c4fd6af691f0a7c3c47c9876187bcf71c8"
> >  S = "${WORKDIR}/git"
> >
> >  inherit setuptools monitor
> > diff --git a/meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..ccf46c8
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 4246bd70dab5b4da8b3f905ca714ee2ea522c06e Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 20:55:48 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 754a591..8342cc0 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -2,7 +2,6 @@
> > + # of appearance. Changing the order has an impact on the overall integration
> > + # process, which may cause wedges in the gate later.
> > + pbr>=0.6,!=0.7,<1.0
> > +-argparse
> > + cmd2>=0.6.7
> > + PrettyTable>=0.7,<0.8
> > + pyparsing>=2.0.1
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> > index e7e1f7e..3843214 100644
> > --- a/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-cliff_1.10.0.bb
> > @@ -8,6 +8,7 @@ SRCNAME = "cliff"
> >
> >  SRC_URI = "https://pypi.python.org/packages/source/c/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
> >      file://0001-Fix-object-has-no-attribute-debug-error.patch \
> > +    file://Remove-argparse-from-requirements.txt.patch \
> >      "
> >
> >  SRC_URI[md5sum] = "8f3f67d57bf5a2541efeedcea1aa64ab"
> > diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..387eea5
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From aed6b40f160f6094c5625482e6ce4ddfd96270c0 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 19:22:02 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 406fa8d..4021fe3 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -3,7 +3,6 @@
> > + # process, which may cause wedges in the gate later.
> > + pbr!=0.7,<1.0,>=0.6
> > + Babel>=1.3
> > +-argparse
> > + PrettyTable<0.8,>=0.7
> > + python-keystoneclient<1.4.0,>=1.2.0
> > + pyOpenSSL>=0.11
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > index 430e32d..aa231a3 100644
> > --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> > @@ -11,6 +11,7 @@ SRC_URI = "\
> >         git://github.com/openstack/${BPN}.git;protocol=https;branch=stable/kilo \
> >         file://fix_glanceclient_memory_leak.patch \
> >         file://glance-api-check.sh \
> > +       file://Remove-argparse-from-requirements.txt.patch \
> >         "
> >
> >  S = "${WORKDIR}/git"
> > diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..6549f05
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 67d41300eaba99aaad4a058ddf7afd10a8a56368 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 17:32:48 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 8e6ac51..1515da1 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -4,7 +4,6 @@
> > +
> > + pbr!=0.7,<1.0,>=0.6
> > +
> > +-argparse
> > + Babel>=1.3
> > + iso8601>=0.1.9
> > + netaddr>=0.7.12
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> > index 5c5d98c..de162b7 100644
> > --- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> > @@ -10,6 +10,7 @@ SRC_URI = "\
> >         git://github.com/openstack/python-keystoneclient.git;branch=stable/kilo \
> >         file://fix_keystoneclient_memory_leak.patch \
> >         file://keystone-api-check.sh \
> > +       file://Remove-argparse-from-requirements.txt.patch \
> >         "
> >
> >  PV = "1.3.3+git${SRCPV}"
> > diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..10bbef3
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 89ae693563a61acfbed5273a5c9b43b6d98346d5 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 17:21:27 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 12f89a0..3966547 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -2,7 +2,6 @@
> > + # of appearance. Changing the order has an impact on the overall integration
> > + # process, which may cause wedges in the gate later.
> > + pbr>=0.6,!=0.7,<1.0
> > +-argparse
> > + cliff>=1.10.0,<1.11.0  # Apache-2.0
> > + iso8601>=0.1.9
> > + netaddr>=0.7.12
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
> > index e35be5d..4f9ea33 100644
> > --- a/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-neutronclient_git.bb
> > @@ -18,11 +18,10 @@ RDEPENDS_${PN} +="python-cliff \
> >         python-pbr \
> >         "
> >
> > -PR = "r0"
> > -
> >  SRC_URI = "git://github.com/openstack/python-neutronclient.git;branch=master \
> >             file://neutronclient-use-csv-flag-instead-of-json.patch \
> >             file://neutron-api-check.sh \
> > +           file://Remove-argparse-from-requirements.txt.patch \
> >            "
> >
> >  PV = "2.4.0+git${SRCPV}"
> > diff --git a/meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..8ae80dd
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 0a3e2f3197babcc2488c02b829e744290fac4309 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 17:25:51 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 9f20356..6f65859 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -2,7 +2,6 @@
> > + # of appearance. Changing the order has an impact on the overall integration
> > + # process, which may cause wedges in the gate later.
> > + pbr!=0.7,<1.0,>=0.6
> > +-argparse
> > + iso8601>=0.1.9
> > + oslo.i18n<1.6.0,>=1.5.0 # Apache-2.0
> > + oslo.serialization<1.5.0,>=1.4.0 # Apache-2.0
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> > index 1e60fb4..0045c75 100644
> > --- a/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-novaclient_git.bb
> > @@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=7cdb54622cacc9bc9b2883091e6dd669"
> >  SRC_URI = "\
> >         git://github.com/openstack/python-novaclient.git;branch=stable/kilo \
> >         file://nova-api-check.sh \
> > +       file://Remove-argparse-from-requirements.txt.patch \
> >         "
> >
> >  PV = "2.23.2+git${SRCPV}"
> > diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..b12b048
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,25 @@
> > +From 501e153e3d2c4e618a928889626aa49ba636c22f Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 20:51:40 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index 56a2508..da0454e 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -3,7 +3,6 @@
> > + # process, which may cause wedges in the gate later.
> > +
> > + pbr>=0.6,!=0.7,<1.0
> > +-argparse
> > + netaddr>=0.7.12
> > + six>=1.9.0
> > + stevedore>=1.1.0  # Apache-2.0
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
> > index 3094b1e..52343cc 100644
> > --- a/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-oslo.config_1.9.3.bb
> > @@ -1,13 +1,13 @@
> >  DESCRIPTION = "API supporting parsing command line arguments and .ini style configuration files."
> > -HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/1.1.0"
> > +HOMEPAGE = "https://pypi.python.org/pypi/oslo.config/"
> >  SECTION = "devel/python"
> >  LICENSE = "Apache-2.0"
> >  LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
> >
> > -PR = "r0"
> >  SRCNAME = "oslo.config"
> >
> >  SRC_URI = "https://pypi.python.org/packages/source/o/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > +SRC_URI += "file://Remove-argparse-from-requirements.txt.patch"
> >
> >  SRC_URI[md5sum] = "109da1307ea8c65440accccbc59cf9a5"
> >  SRC_URI[sha256sum] = "ab54e67776d9bbee86ba8cce9393ba3186e6e63de926e9797598dc35fe790140"
> > diff --git a/meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch b/meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch
> > new file mode 100644
> > index 0000000..85b8f14
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch
> > @@ -0,0 +1,23 @@
> > +From b1d624241b6d7d2dcd63f5ebe93f79fccd5ad663 Mon Sep 17 00:00:00 2001
> > +From: Josep Puigdemont <josep.puigdemont@enea.com>
> > +Date: Tue, 24 Nov 2015 20:48:13 +0100
> > +Subject: [PATCH] Remove argparse from requirements.txt
> > +
> > +Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > +---
> > + requirements.txt | 1 -
> > + 1 file changed, 1 deletion(-)
> > +
> > +diff --git a/requirements.txt b/requirements.txt
> > +index f7f4cc9..3a2c63a 100644
> > +--- a/requirements.txt
> > ++++ b/requirements.txt
> > +@@ -3,5 +3,4 @@
> > + # process, which may cause wedges in the gate later.
> > +
> > + pbr>=0.6,!=0.7,<1.0
> > +-argparse
> > + six>=1.9.0
> > +--
> > +2.1.0
> > +
> > diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
> > index 6100f68..d4bf4c0 100644
> > --- a/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
> > +++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.3.0.bb
> > @@ -7,6 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
> >  SRC_URI[md5sum] = "e9ed2a1cf91ee76fd9045f902fa58089"
> >  SRC_URI[sha256sum] = "beab2b7f91966d259796392c39ed6f260b32851861561dd9f3b9be2fd0c426a5"
> >
> > +SRC_URI += "file://Remove-argparse-from-requirements.txt.patch"
> > +
> >  inherit pypi
> >
> >  DEPENDS += " \
> > --
> > 2.5.0
> >
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization

