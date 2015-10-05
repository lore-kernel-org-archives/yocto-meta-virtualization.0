Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 970F0E00C16; Mon,  5 Oct 2015 14:17:43 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id EDA8FE00473
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Oct 2015 14:17:41 -0700 (PDT)
Received: from iapetus.enea.se (172.16.140.39) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Mon, 5 Oct 2015 23:17:36 +0200
Date: Mon, 5 Oct 2015 23:17:37 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Edward Wingate <edwingate8@gmail.com>
Message-ID: <20151005211737.GA1393@iapetus.enea.se>
References: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAGMdoFkAEUmvwC9fjCku-+g4KAu2FVomXKt-0B_S-A+c9Uhz_w@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: meta-virtualization@yoctoproject.org
Subject: Re: python setuptools recipe
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
X-List-Received-Date: Mon, 05 Oct 2015 21:17:43 -0000
X-Groupsio-MsgNum: 1385
Content-Type: multipart/mixed; boundary="fUYQa+Pmc3FrFX/N"
Content-Disposition: inline

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Sep 30, 2015 at 11:10:39AM -0700, Edward Wingate wrote:
> I'm trying to write a recipe to install the python module
> gevent-socketio (http://pypi.python.org/pypi/gevent-socketio). I
> created the typical setuptools inherited recipe and named it
> python-gevent-socketio_0.3.6.bb:
> 
> DESCRIPTION = "Python gevent-socketio"
> LICENSE = "BSD"
> LIC_FILES_CHKSUM = "file://LICENSE;md5=13484d110cf0f7e0713493cb09a8601c"
> RDEPENDS_${PN} += "python-gevent"
> SRCNAME = "gevent-socketio"
> 
> SRC_URI = "http://pypi.python.org/packages/source/g/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> SRC_URI[md5sum] = "33f745d74885366a07da516c000854b6"
> SRC_URI[sha256sum] =
> "53394ab93fbd84d9dbbb2bef85349f6a503bfc53d86a9be8653250f1a0412aff"
> 
> S = "${WORKDIR}/${SRCNAME}-${PV}"
> 
> inherit setuptools
> 
> =====
> 
> But I get this error during do_compile:
> 
> Download error on http://pypi.python.org/simple/versiontools/: [SSL:
> CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
> Some packages may not be found!
> Download error on http://pypi.python.org/simple/versiontools/: [SSL:
> CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
> Some packages may not be found!
> Couldn't find index page for 'versiontools' (maybe misspelled?)
> Download error on http://pypi.python.org/simple/: [SSL:
> CERTIFICATE_VERIFY_FAILED] certificate verify failed (_ssl.c:581) --
> Some packages may not be found!
> No local packages or download links found for versiontools>=1.7
> 
> The entire log is here: http://pastebin.com/Dz7NU7um
> 
> I have another recipe following this recipe template and it works OK.
> I don't know what could be different about gevent-socketio.  Can
> anyone help with this error?  I am able to wget
> http://pypi.python.org/simple/versiontools and get valid response.
> Thanks for any help.

I just had the same error and it was due to a missing build dependecy,
maybe adding this dependency to the recipe might solve it:

DEPENDS += "python-versiontools"

I've attached a recipe for python-versiontools, in case you didn't have
it already. Hope it helps.

/Josep

--fUYQa+Pmc3FrFX/N
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: attachment; filename="python-versiontools_1.9.1.bb"

DESCRIPTION = "Smart replacement for plain tuple used in __version__"
SECTION = "devel/python"
LICENSE = "LGPL-3"
LIC_FILES_CHKSUM = "file://setup.py;beginline=9;endline=19;md5=a260311a04616c0acc19582ba84352c6"

SRC_URI[md5sum] = "602b7db8eea30dd29a1d451997adf251"
SRC_URI[sha256sum] = "a969332887a18a9c98b0df0ea4d4ca75972f24ca94f06fb87d591377e83414f6"

inherit pypi

--fUYQa+Pmc3FrFX/N--
