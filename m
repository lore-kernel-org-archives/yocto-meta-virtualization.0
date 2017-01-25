Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C3AB0E0091A; Wed, 25 Jan 2017 14:08:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 61F5EE00833
	for <meta-virtualization@yoctoproject.org>;
	Wed, 25 Jan 2017 14:08:30 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v0PM7xOY027356
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jan 2017 14:07:59 -0800 (PST)
Received: from yow-masselst-lx1.localnet (128.224.21.121) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.294.0; Wed, 25 Jan 2017 14:07:58 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 25 Jan 2017 17:07:57 -0500
Message-ID: <2964403.UCI0HIUZlp@yow-masselst-lx1>
Organization: Wind River
User-Agent: KMail/5.2.3 (Linux/4.8.0-34-generic; KDE/5.26.0; x86_64; ; )
In-Reply-To: <CADkTA4P5=dc5C4whpS+zGUPGwEcZu+Wc2wHy-=vVoW1nA+xVJw@mail.gmail.com>
References: <1485227341-30506-1-git-send-email-mark.asselstine@windriver.com>
	<CADkTA4P5=dc5C4whpS+zGUPGwEcZu+Wc2wHy-=vVoW1nA+xVJw@mail.gmail.com>
MIME-Version: 1.0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [m-c-s][PATCH] python-osc-lib: initial version
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
X-List-Received-Date: Wed, 25 Jan 2017 22:08:32 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, January 25, 2017 2:31:46 PM EST Bruce Ashfield wrote:
> Everything should now be merged. I found that one of the patches wouldn't
> apply, since I had missed a change from one of your older series.
> 
> ... so if you can rebase your queue against master, you'll probably find
> something that I mucked up. Resend those and I'll get them merged.

Looks like you got everything. Outside of my core openstack uprevs that I am 
queuing up and haven't sent yet everything seems present and accounted for. I 
had applied lots of Huang's changes and they are rebased cleanly as well.

Keep moving forward we go...

Mark

> 
> Bruce
> 
> On Mon, Jan 23, 2017 at 10:09 PM, Mark Asselstine <
> 
> mark.asselstine@windriver.com> wrote:
> > This is required for the uprev of python-heatclient to
> > stable/newton. The version is selected based on all version
> > requirements.
> > 
> > Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> > ---
> > 
> >  .../python/python-osc-lib_1.1.0.bb                 | 32
> > 
> > ++++++++++++++++++++++
> > 
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 meta-openstack/recipes-devtools/python/python-osc-
> > 
> > lib_1.1.0.bb
> > 
> > diff --git a/meta-openstack/recipes-devtools/python/python-osc-
> > lib_1.1.0.bb b/meta-openstack/recipes-devtools/python/python-osc-
> > lib_1.1.0.bb
> > new file mode 100644
> > index 0000000..70582f7
> > --- /dev/null
> > +++ b/meta-openstack/recipes-devtools/python/python-osc-lib_1.1.0.bb
> > @@ -0,0 +1,32 @@
> > +DESCRIPTION = "OpenStackClient Library"
> > +HOMEPAGE = "http://opensource.perlig.de/rcssmin/"
> > +SECTION = "devel/python"
> > +LICENSE = "Apache-2.0"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=1dece7821bf3fd70fe1309eaa37d52a2"
> > +
> > +SRCNAME = "osc-lib"
> > +
> > +SRC_URI = "https://pypi.io/packages/source/o/${SRCNAME}/${SRCNAME}
> > -${PV}.tar.gz \
> > +"
> > +
> > +SRC_URI[md5sum] = "08bf2b46089da52240893d99a3892897"
> > +SRC_URI[sha256sum] = "e06ca111b2702d442f5cf70c754b63
> > 31cc7742231f0fe0b634cbd03c502610ba"
> > +
> > +S = "${WORKDIR}/${SRCNAME}-${PV}"
> > +
> > +inherit setuptools
> > +
> > +RDEPENDS_${PN} += " \
> > +        python-pbr \
> > +        python-six \
> > +        python-babel \
> > +        python-cliff \
> > +        python-keystoneauth1 \
> > +        python-os-client-config \
> > +        python-oslo.i18n \
> > +        python-oslo.utils \
> > +        python-simplejson \
> > +        python-stevedore \
> > +        "
> > +
> > +CLEANBROKEN = "1"
> > --
> > 2.7.4
> > 
> > --
> > _______________________________________________
> > meta-virtualization mailing list
> > meta-virtualization@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-virtualization



