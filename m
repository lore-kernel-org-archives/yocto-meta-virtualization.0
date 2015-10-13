Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0A78BE00D93; Tue, 13 Oct 2015 10:08:55 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4651CE00AD1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 10:08:52 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9DH8oI0009317
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 13 Oct 2015 10:08:51 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.86)
	(envelope-from <amy.fong@windriver.com>)
	id 1Zm33k-0008WV-3b; Tue, 13 Oct 2015 13:08:20 -0400
Date: Tue, 13 Oct 2015 13:08:20 -0400
From: Amy Fong <amy.fong@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Message-ID: <20151013170820.GA32691@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
	<1444156449-19847-8-git-send-email-amy.fong@windriver.com>
	<CADkTA4NJ=Y+AXWHZf5-ejaPK4KDND8F6Az7vrfeooCVAdi9CfA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADkTA4NJ=Y+AXWHZf5-ejaPK4KDND8F6Az7vrfeooCVAdi9CfA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 7/7] python-greenlet: uprev to 0.4.9
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
X-List-Received-Date: Tue, 13 Oct 2015 17:08:55 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

I'll have to test to verify this one (no changelog in the src)....

Amy

On Tue, Oct 13, 2015 at 11:31:12AM -0400, Bruce Ashfield wrote:
> meta-python already has 0.4.7. Is there any reason why that version shouldn't
> work here ? .. versus carrying a meta-virt specific version.
> 
> Bruce
> 
> On Tue, Oct 6, 2015 at 2:34 PM, Amy Fong <amy.fong@windriver.com> wrote:
> > python-greenlet bugfixes from 0.3.4 - unstable issues. This resulted in
> > the docker-registry (in some build scenarios) crashing repeatedly.
> >
> >     Traceback (most recent call last):
> >       File "/usr/lib64/python2.7/site-packages/gunicorn/arbiter.py", line 507, in spawn_worker
> >         worker.init_process()
> >       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 193, in init_process
> >         super(GeventWorker, self).init_process()
> >       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/base.py", line 120, in init_process
> >         self.run()
> >       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 117, in run
> >         gevent.sleep(1.0)
> >       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 75, in sleep
> >         hub.wait(loop.timer(seconds, ref=ref))
> >       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 341, in wait
> >         result = waiter.get()
> >       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 568, in get
> >         return self.hub.switch()
> >       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 331, in switch
> >         return greenlet.switch(self)
> >     SystemError: NULL result without error in PyObject_Call
> >
> >     <repeat>
> >
> > Signed-off-by: Amy Fong <amy.fong@windriver.com>
> > ---
> >  recipes-devtools/python/python-greenlet_0.4.9.bb | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >  create mode 100644 recipes-devtools/python/python-greenlet_0.4.9.bb
> >
> > diff --git a/recipes-devtools/python/python-greenlet_0.4.9.bb b/recipes-devtools/python/python-greenlet_0.4.9.bb
> > new file mode 100644
> > index 0000000..fa35fa8
> > --- /dev/null
> > +++ b/recipes-devtools/python/python-greenlet_0.4.9.bb
> > @@ -0,0 +1,14 @@
> > +SUMMARY = "Python lightweight in-process concurrent programming"
> > +HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
> > +SECTION = "devel/python"
> > +LICENSE = "MIT & PSF"
> > +LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> > +                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> > +SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.tar.gz"
> > +SRC_URI[md5sum] = "00bb1822d8511cc85f052e89d1fd919b"
> > +SRC_URI[sha256sum] = "79f9b8bbbb1c599c66aed5e643e8b53bae697cae46e0acfc4ee461df48a90012"
> > +
> > +S = "${WORKDIR}/greenlet-${PV}"
> > +
> > +inherit distutils
> > +
> > --
> > 2.5.3
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

