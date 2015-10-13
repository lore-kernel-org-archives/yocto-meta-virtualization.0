Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A0E48E00DBF; Tue, 13 Oct 2015 08:31:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CEA8E006F6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 08:31:12 -0700 (PDT)
Received: by ykoo7 with SMTP id o7so20140996yko.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 13 Oct 2015 08:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=xV8vEbpXKePqO0YCdu6tnnbYa+M3Y/sr4drKf5QXVIw=;
	b=wQEZTadF4JNhz7ffw/2swM71HFz/nnfvT8phUoEyO0ZtU6xsy/DGCn5Qs4q9B7bVC8
	wWWKaVRtxrINNb0VCU/5u1yv/9RMUhOW541sYu+HshXHsZ69mFZlsBNjLtkujmLEFB61
	mNGnHWVrBrYMffoeQR/v6lNbhmnxm0fpTG9wk/gicHfJJSQx3V49dnf3uHx3TQaVSAfv
	B2dgqOwo0B4ARrbL+9Hd8yKvnYydnqsloIHoxzt8c9TdM3vSLiEkMsthGsDlaHzefE/R
	eGFdy5zH8bE5sQEHHlRzSX1hvoax8i2iObjyyszd5iLUIDV8v3mMInhuzKOIHWBiAN0w
	MwKA==
MIME-Version: 1.0
X-Received: by 10.129.0.2 with SMTP id 2mr4641484ywa.127.1444750272246; Tue,
	13 Oct 2015 08:31:12 -0700 (PDT)
Received: by 10.13.217.201 with HTTP; Tue, 13 Oct 2015 08:31:12 -0700 (PDT)
In-Reply-To: <1444156449-19847-8-git-send-email-amy.fong@windriver.com>
References: <1444156449-19847-1-git-send-email-amy.fong@windriver.com>
	<1444156449-19847-8-git-send-email-amy.fong@windriver.com>
Date: Tue, 13 Oct 2015 11:31:12 -0400
Message-ID: <CADkTA4NJ=Y+AXWHZf5-ejaPK4KDND8F6Az7vrfeooCVAdi9CfA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Amy Fong <amy.fong@windriver.com>
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
X-List-Received-Date: Tue, 13 Oct 2015 15:31:17 -0000
Content-Type: text/plain; charset=UTF-8

meta-python already has 0.4.7. Is there any reason why that version shouldn't
work here ? .. versus carrying a meta-virt specific version.

Bruce

On Tue, Oct 6, 2015 at 2:34 PM, Amy Fong <amy.fong@windriver.com> wrote:
> python-greenlet bugfixes from 0.3.4 - unstable issues. This resulted in
> the docker-registry (in some build scenarios) crashing repeatedly.
>
>     Traceback (most recent call last):
>       File "/usr/lib64/python2.7/site-packages/gunicorn/arbiter.py", line 507, in spawn_worker
>         worker.init_process()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 193, in init_process
>         super(GeventWorker, self).init_process()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/base.py", line 120, in init_process
>         self.run()
>       File "/usr/lib64/python2.7/site-packages/gunicorn/workers/ggevent.py", line 117, in run
>         gevent.sleep(1.0)
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 75, in sleep
>         hub.wait(loop.timer(seconds, ref=ref))
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 341, in wait
>         result = waiter.get()
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 568, in get
>         return self.hub.switch()
>       File "/usr/lib64/python2.7/site-packages/gevent/hub.py", line 331, in switch
>         return greenlet.switch(self)
>     SystemError: NULL result without error in PyObject_Call
>
>     <repeat>
>
> Signed-off-by: Amy Fong <amy.fong@windriver.com>
> ---
>  recipes-devtools/python/python-greenlet_0.4.9.bb | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 recipes-devtools/python/python-greenlet_0.4.9.bb
>
> diff --git a/recipes-devtools/python/python-greenlet_0.4.9.bb b/recipes-devtools/python/python-greenlet_0.4.9.bb
> new file mode 100644
> index 0000000..fa35fa8
> --- /dev/null
> +++ b/recipes-devtools/python/python-greenlet_0.4.9.bb
> @@ -0,0 +1,14 @@
> +SUMMARY = "Python lightweight in-process concurrent programming"
> +HOMEPAGE = "http://pypi.python.org/pypi/greenlet"
> +SECTION = "devel/python"
> +LICENSE = "MIT & PSF"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=03143d7a1a9f5d8a0fee825f24ca9c36 \
> +                    file://LICENSE.PSF;md5=c106931d9429eda0492617f037b8f69a"
> +SRC_URI = "http://pypi.python.org/packages/source/g/greenlet/greenlet-${PV}.tar.gz"
> +SRC_URI[md5sum] = "00bb1822d8511cc85f052e89d1fd919b"
> +SRC_URI[sha256sum] = "79f9b8bbbb1c599c66aed5e643e8b53bae697cae46e0acfc4ee461df48a90012"
> +
> +S = "${WORKDIR}/greenlet-${PV}"
> +
> +inherit distutils
> +
> --
> 2.5.3
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

