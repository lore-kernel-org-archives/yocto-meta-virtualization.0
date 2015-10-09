Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D12FE01241; Fri,  9 Oct 2015 12:19:41 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id F1E81E00AD5
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Oct 2015 12:19:35 -0700 (PDT)
Received: from iapetus.enea.se (172.16.140.39) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 21:19:33 +0200
Date: Fri, 9 Oct 2015 21:19:33 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20151009191933.GA14512@iapetus.enea.se>
References: <1444413018-15865-1-git-send-email-josep.puigdemont@enea.com>
	<1444413018-15865-2-git-send-email-josep.puigdemont@enea.com>
	<CADkTA4OzK1KiJ4Faz4xTSh_XNgjONdsJs-vfaj+RSxHWgbMwpg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4OzK1KiJ4Faz4xTSh_XNgjONdsJs-vfaj+RSxHWgbMwpg@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][fido/kilo][PATCH] Remove recipes already provided by other layers
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
X-List-Received-Date: Fri, 09 Oct 2015 19:19:41 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Oct 09, 2015 at 03:03:59PM -0400, Bruce Ashfield wrote:
> On Fri, Oct 9, 2015 at 1:50 PM, Josep Puigdemont
> <josep.puigdemont@enea.com> wrote:
> > The following recipes are already provided by other layers
> > meta-cloud-servides depends on:
> >     bundler            provided by meta-ruby
> >     memcached          provided by meta-networking
> >     python-boto        provided by meta-virtualization (2.8->2.34)
> >     python-decorator   provided by meta-python
> >     python-jinja2      provided by meta-python
> >     python-markupsafe  provided by meta-python (0.18 -> 0.23)
> >     python-mccabe      provided by meta-python
> >     python-mock        provided by meta-python
> >     python-msgpack     provided by meta-python
> >     python-prettytable provided by meta-python
> >     python-pyflakes    provided by meta-python
> >     python-pyparsing   provided by meta-python
> >     python-pyudev      provided by meta-python
> 
> I keep copies of these on purpose at the moment, since I can't count on the
> meta-python versions to stay consisted, or tested with the rest of the stack.
> 

Ok, I understand, good thinking.

> memcached might be ok, so if it is split out, it can likely be applied.
> 
> So thanks for the patch, but I won't apply it just yet.

notice that because of the precedence of meta-python and
meta-virtualization over meta-cloud-services, both
python-markupsafe and python-boto are not used.
If we really prefer the versions in this layer, then maybe
layer.conf needs updating, otherwise they could probably be removed...

I've also noticed that meta-openstack/conf/layer.conf selects version
0.4.1 of python-greenlet, but the layer has a recipe for 0.4.5, is that
on purpose or do we want 0.4.5?
The 0.4.5 recipe would need the fixes done in master to work, though.

Regards,
/Josep

> 
> Bruce
> 
> >
> > Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
> > ---
> >  .../recipes-devtools/python/python-boto_git.bb     | 20 ----------
> >  .../python/python-decorator_3.4.0.bb               | 17 ---------
> >  .../recipes-devtools/python/python-jinja2_2.7.3.bb | 31 ---------------
> >  .../python/python-markupsafe_0.18.bb               | 20 ----------
> >  .../recipes-devtools/python/python-mccabe_0.2.1.bb | 21 -----------
> >  .../recipes-devtools/python/python-mock_1.0.1.bb   | 24 ------------
> >  .../python/python-msgpack_0.4.5.bb                 | 17 ---------
> >  .../python/python-prettytable_0.7.2.bb             | 24 ------------
> >  .../python/python-pyflakes_0.7.3.bb                | 21 -----------
> >  .../python/python-pyparsing_2.0.1.bb               | 17 ---------
> >  .../python/python-pyudev_0.16.1.bb                 | 17 ---------
> >  .../recipes-devtools/ruby/bundler_git.bb           | 33 ----------------
> >  .../memcached/memcached/configure.patch            | 13 -------
> >  .../recipes-support/memcached/memcached_1.4.17.bb  | 44 ----------------------
> >  14 files changed, 319 deletions(-)
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-boto_git.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> >  delete mode 100644 meta-openstack/recipes-devtools/ruby/bundler_git.bb
> >  delete mode 100644 meta-openstack/recipes-support/memcached/memcached/configure.patch
> >  delete mode 100644 meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
> >
> > diff --git a/meta-openstack/recipes-devtools/python/python-boto_git.bb b/meta-openstack/recipes-devtools/python/python-boto_git.bb
> > deleted file mode 100644
> > index 560b086..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-boto_git.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -DESCRIPTION = "Amazon Web Services API"
> > -HOMEPAGE = "https://github.com/boto/boto"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=348302dddd421665d3c9b636a2e55832"
> > -
> > -SRCREV = "b5852b0aa5ac91f462b28ac9decee33d872dec4d"
> > -PV = "2.8.0+git${SRCPV}"
> > -PR = "r0"
> > -SRCNAME = "boto"
> > -
> > -SRC_URI = "git://github.com/boto/boto.git;protocol=git"
> > -
> > -SRC_URI[md5sum] = "5528f3010c42dd0ed7b188a6917295f1"
> > -SRC_URI[sha256sum] = "4d6d38aa8e9e536a27a9737eb4222f896417841fed9a12eedcb619ba8fb68a39"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -inherit setuptools
> > -
> > diff --git a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb b/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> > deleted file mode 100644
> > index 8b88543..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION = "Better living through Python with decorators"
> > -HOMEPAGE = "http://pypi.python.org/pypi/decorator"
> > -SECTION = "devel/python"
> > -LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://setup.py;beginline=8;endline=8;md5=08a46ecda64aec8026447390e764b86e"
> > -
> > -PR = "r0"
> > -SRCNAME = "decorator"
> > -
> > -SRC_URI = "http://pypi.python.org/packages/source/d/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "1e8756f719d746e2fc0dd28b41251356"
> > -SRC_URI[sha256sum] = "c20b404cbb7ee5cebd506688e0114e3cd76f5ce233805a51f36e1a7988d9d783"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > diff --git a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb b/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> > deleted file mode 100644
> > index 246d718..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -DESCRIPTION = "Python Jinja2: A small but fast and easy to use stand-alone template engine written in pure python."
> > -HOMEPAGE = "https://pypi.python.org/pypi/Jinja2"
> > -SECTION = "devel/python"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=20c831f91dd3bd486020f672ba2be386"
> > -
> > -PR = "r0"
> > -SRCNAME = "Jinja2"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/J/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "b9dffd2f3b43d673802fe857c8445b1a"
> > -SRC_URI[sha256sum] = "2e24ac5d004db5714976a04ac0e80c6df6e47e98c354cb2c0d82f8879d4f8fdb"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -RDEPENDS_${PN} += "python-io \
> > -                   python-pickle \
> > -                   python-crypt \
> > -                   python-math \
> > -                   python-netclient \
> > -                   python-re \
> > -                   python-textutils \
> > -                   python-lang \
> > -                   python-pprint \
> > -                   python-shell \
> > -                   python-markupsafe"
> > -
> > -CLEANBROKEN = "1"
> > diff --git a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb b/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> > deleted file mode 100644
> > index fc14a51..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
> > +++ /dev/null
> > @@ -1,20 +0,0 @@
> > -DESCRIPTION = "Implements a XML/HTML/XHTML Markup safe string for Python"
> > -HOMEPAGE = "http://github.com/mitsuhiko/markupsafe"
> > -SECTION = "devel/python"
> > -LICENSE = "BSD-3-Clause"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=c6d1adcf45d69359f256c1cea3254127"
> > -
> > -PR = "r0"
> > -SRCNAME = "MarkupSafe"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/M/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "f8d252fd05371e51dec2fe9a36890687"
> > -SRC_URI[sha256sum] = "b7d5d688bdd345bfa897777d297756688cf02e1b3742c56885e2e5c2b996ff82"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -RDEPENDS_${PN} += "python-re"
> > -
> > diff --git a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb b/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> > deleted file mode 100644
> > index 30c47e8..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -DESCRIPTION = "McCabe checker, plugin for flake8"
> > -HOMEPAGE = "https://github.com/dreamhost/cliff"
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://README.rst;md5=aa0383f6aee4f5c20084a97cd13164c4"
> > -
> > -PR = "r0"
> > -SRCNAME = "mccabe"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "5a3f3fa6a4bad126c88aaaa7dab682f5"
> > -SRC_URI[sha256sum] = "5a2a170e47de5593a6abfae1e9542bd2c3924ac62bbe4e6ed96c953c0352243a"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -RDEPENDS_${PN} += "python-prettytable \
> > -            python-cmd2 \
> > -            python-pyparsing"
> > \ No newline at end of file
> > diff --git a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb b/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> > deleted file mode 100644
> > index b17b3f0..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -DESCRIPTION = "A Python Mocking and Patching Library for Testing"
> > -HOMEPAGE = "https://pypi.python.org/pypi/mock"
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=80e5ba73891255687dff3bee2b4cbb16"
> > -
> > -PR = "r0"
> > -SRCNAME = "mock"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "c3971991738caa55ec7c356bbc154ee2"
> > -SRC_URI[sha256sum] = "b839dd2d9c117c701430c149956918a423a9863b48b09c90e30a6013e7d2f44f"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -RDEPENDS_${PN} += "python-prettytable \
> > -            python-cmd2 \
> > -            python-pyparsing \
> > -            python-mccabe \
> > -            python-pep8 \
> > -            python-pyflakes"
> > diff --git a/meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb b/meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb
> > deleted file mode 100644
> > index 206b03d..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION = "MessagePack (de)serializer"
> > -HOMEPAGE = "https://pypi.python.org/pypi/msgpack-python/"
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=cd9523181d9d4fbf7ffca52eaa2a5751"
> > -
> > -PR = "r0"
> > -SRCNAME = "msgpack-python"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/m/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "3b82bc542d5599896695512e7c32f42d"
> > -SRC_URI[sha256sum] = "a07cd6615a6bf38cfa2f010b121c7e77b74a3e7b971ef3e475c3d33308014cbb"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > diff --git a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb b/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> > deleted file mode 100644
> > index 5242bfc..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
> > +++ /dev/null
> > @@ -1,24 +0,0 @@
> > -DESCRIPTION = "Python library for displaying tabular data in a ASCII table format"
> > -HOMEPAGE = "http://code.google.com/p/prettytable"
> > -SECTION = "devel/python"
> > -LICENSE = "BSD"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=3e73500ffa52de5071cff65990055282"
> > -
> > -PR = "r0"
> > -SRCNAME = "prettytable"
> > -
> > -SRC_URI = "http://pypi.python.org/packages/source/P/PrettyTable/prettytable-0.7.2.zip"
> > -
> > -SRC_URI[md5sum] = "0c1361104caff8b09f220748f9d69899"
> > -SRC_URI[sha256sum] = "a53da3b43d7a5c229b5e3ca2892ef982c46b7923b51e98f0db49956531211c4f"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -do_install_append() {
> > -       perm_files=`find "${D}${PYTHON_SITEPACKAGES_DIR}/" -name "top_level.txt"`
> > -       for f in $perm_files; do
> > -               chmod 644 "${f}"
> > -       done
> > -}
> > \ No newline at end of file
> > diff --git a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb b/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> > deleted file mode 100644
> > index af7a7f3..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
> > +++ /dev/null
> > @@ -1,21 +0,0 @@
> > -DESCRIPTION = "passive checker of Python programs"
> > -HOMEPAGE = "https://github.com/dreamhost/cliff"
> > -SECTION = "devel/python"
> > -LICENSE = "Apache-2.0"
> > -LIC_FILES_CHKSUM = "file://README.rst;md5=1815018ebbbfc8659a9df33681a0936e"
> > -
> > -PR = "r0"
> > -SRCNAME = "pyflakes"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "ec94ac11cb110e6e72cca23c104b66b1"
> > -SRC_URI[sha256sum] = "dbd2c940a1030a4f811afc1a04017a44011c0cb54f8f384b66aa624097d9b5e3"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > -
> > -RDEPENDS_${PN} += "python-prettytable \
> > -            python-cmd2 \
> > -            python-pyparsing"
> > \ No newline at end of file
> > diff --git a/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb b/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
> > deleted file mode 100644
> > index 32d9ebb..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION = "Python parsing module"
> > -HOMEPAGE = "http://pyparsing.wikispaces.com/"
> > -SECTION = "devel/python"
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
> > -
> > -PR = "r0"
> > -SRCNAME = "pyparsing"
> > -
> > -SRC_URI = "http://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.zip"
> > -
> > -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
> > -SRC_URI[sha256sum] = "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit distutils
> > diff --git a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb b/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> > deleted file mode 100644
> > index 384b1d8..0000000
> > --- a/meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
> > +++ /dev/null
> > @@ -1,17 +0,0 @@
> > -DESCRIPTION = "A libudev binding"
> > -HOMEPAGE = "http://pyudev.readthedocs.org/"
> > -SECTION = "devel/python"
> > -LICENSE = "LGPL-2.1"
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=a6f89e2100d9b6cdffcea4f398e37343"
> > -
> > -PR = "r0"
> > -SRCNAME = "pyudev"
> > -
> > -SRC_URI = "https://pypi.python.org/packages/source/p/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
> > -
> > -SRC_URI[md5sum] = "4034de584b6d9efcbfc590a047c63285"
> > -SRC_URI[sha256sum] = "765d1c14bd9bd031f64e2612225621984cb2bbb8cbc0c03538bcc4c735ff1c95"
> > -
> > -S = "${WORKDIR}/${SRCNAME}-${PV}"
> > -
> > -inherit setuptools
> > diff --git a/meta-openstack/recipes-devtools/ruby/bundler_git.bb b/meta-openstack/recipes-devtools/ruby/bundler_git.bb
> > deleted file mode 100644
> > index f7617a0..0000000
> > --- a/meta-openstack/recipes-devtools/ruby/bundler_git.bb
> > +++ /dev/null
> > @@ -1,33 +0,0 @@
> > -#
> > -# Copyright (C) 2014 Wind River Systems, Inc.
> > -#
> > -SUMMARY = "Makes sure Ruby applications run the same code on every machine."
> > -DESCRIPTION = "Bundler makes sure Ruby applications run the same code \
> > -on every machine. It does this by managing the gems that the \
> > -application depends on. Given a list of gems, it can automatically \
> > -download and install those gems, as well as any other gems needed by \
> > -the gems that are listed. Before installing gems, it checks the \
> > -versions of every gem to make sure that they are compatible, and can \
> > -all be loaded at the same time. After the gems have been installed, \
> > -Bundler can help you update some or all of them when new versions \
> > -become available. Finally, it records the exact versions that have \
> > -been installed, so that others can install the exact same gems."
> > -
> > -LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://LICENSE.md;md5=196bb963e601609817d7e9ac9a64a867"
> > -
> > -PR = "r0"
> > -
> > -BPV = "1.6.2"
> > -PV = "${BPV}"
> > -SRCREV = "06e3647c117da210ffd15a174624497830addd7b"
> > -
> > -S = "${WORKDIR}/git"
> > -
> > -SRC_URI = " \
> > -    git://github.com/bundler/bundler.git;branch=1-7-stable \
> > -    "
> > -
> > -inherit ruby
> > -
> > -BBCLASSEXTEND = "native"
> > diff --git a/meta-openstack/recipes-support/memcached/memcached/configure.patch b/meta-openstack/recipes-support/memcached/memcached/configure.patch
> > deleted file mode 100644
> > index 7001a0e..0000000
> > --- a/meta-openstack/recipes-support/memcached/memcached/configure.patch
> > +++ /dev/null
> > @@ -1,13 +0,0 @@
> > -Index: memcached-1.4.17/configure.ac
> > -===================================================================
> > ---- memcached-1.4.17.orig/configure.ac 2013-12-20 21:44:49.000000000 +0000
> > -+++ memcached-1.4.17/configure.ac      2014-07-18 07:17:00.593499483 +0000
> > -@@ -4,7 +4,7 @@
> > - AC_INIT(memcached, VERSION_NUMBER, memcached@googlegroups.com)
> > - AC_CANONICAL_SYSTEM
> > - AC_CONFIG_SRCDIR(memcached.c)
> > --AM_INIT_AUTOMAKE(AC_PACKAGE_NAME, AC_PACKAGE_VERSION)
> > -+AM_INIT_AUTOMAKE([foreign])
> > - AM_CONFIG_HEADER(config.h)
> > -
> > - AC_PROG_CC
> > diff --git a/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb b/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
> > deleted file mode 100644
> > index 6097693..0000000
> > --- a/meta-openstack/recipes-support/memcached/memcached_1.4.17.bb
> > +++ /dev/null
> > @@ -1,44 +0,0 @@
> > -SUMMARY = "A high-performance memory object caching system"
> > -DESCRIPTION = "\
> > - memcached optimizes specific high-load serving applications that are designed \
> > - to take advantage of its versatile no-locking memory access system. Clients \
> > - are available in several different programming languages, to suit the needs \
> > - of the specific application. Traditionally this has been used in mod_perl \
> > - apps to avoid storing large chunks of data in Apache memory, and to share \
> > - this burden across several machines."
> > -
> > -HOMEPAGE = "http://memcached.org/"
> > -LICENSE = "BSD-3-Clause"
> > -
> > -LIC_FILES_CHKSUM = "file://COPYING;md5=7e5ded7363d335e1bb18013ca08046ff"
> > -
> > -inherit autotools
> > -
> > -DEPENDS += "libevent"
> > -RDEPENDS_${PN} += "bash perl perl-module-posix perl-module-autoloader perl-module-tie-hash"
> > -
> > -SRC_URI = "http://www.memcached.org/files/${BP}.tar.gz \
> > -           file://configure.patch"
> > -
> > -SRC_URI[md5sum] = "46402dfbd7faadf6182283dbbd18b1a6"
> > -SRC_URI[sha256sum] = "d9173ef6d99ba798c982ea4566cb4f0e64eb23859fdbf9926a89999d8cdc0458"
> > -
> > -python __anonymous () {
> > -    endianness = d.getVar('SITEINFO_ENDIANNESS', True)
> > -    if endianness == 'le':
> > -        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=little")
> > -    else:
> > -        d.setVar('EXTRA_OECONF', "ac_cv_c_endian=big")
> > -}
> > -
> > -inherit update-rc.d
> > -
> > -INITSCRIPT_NAME = "memcached"
> > -INITSCRIPT_PARAMS = "defaults"
> > -
> > -do_install_append() {
> > -    install -D -m 755 ${S}/scripts/memcached-init ${D}${sysconfdir}/init.d/memcached
> > -    mkdir -p ${D}/usr/share/memcached/scripts
> > -    install -m 755 ${S}/scripts/memcached-tool ${D}/usr/share/memcached/scripts
> > -    install -m 755 ${S}/scripts/start-memcached ${D}/usr/share/memcached/scripts
> > -}
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

