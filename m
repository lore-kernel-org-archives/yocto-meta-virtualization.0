Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 505B8E00EFB; Tue, 22 Sep 2015 11:42:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.160.181 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com
	[209.85.160.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83341E00A73
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Sep 2015 11:42:32 -0700 (PDT)
Received: by ykft14 with SMTP id t14so18843202ykf.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Sep 2015 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=R0x54dG4UyXbyo829wcZgu2COx/rVoRp3S5ARhrxVIc=;
	b=pL6jtMMmqeGMEf1bPx1PZyEr7KYeF9lLhz71yTbS1LVdYCoQgzJxTdJc59U2rOP4oj
	vuTmD9kToUngAwyqvaPplWJrJPjMLHrF5vUkP6co4zyk2TZTbBL3PmuXf3ZPpu56JZDl
	EioEaKT1OD8nNq7FUTBumFy0pjeREQM39dI+6npjUU/uABFYValU8kxzHybxnXNDT5RF
	FrCq/zWGTEmwyBTZXY1P8RYB+uOzECLS7qxGcqLEjzPxODq8Hl8bxuUzCKKZAjUNsgPc
	Y7q5t4Kugy8KbjBAWLqkjjW6mgyANUG7l9z7+zbVAeHQ5VsABaApcyAa5ILNeIZEn8l1
	leVA==
MIME-Version: 1.0
X-Received: by 10.170.96.196 with SMTP id n187mr22849134yka.54.1442947351848; 
	Tue, 22 Sep 2015 11:42:31 -0700 (PDT)
Received: by 10.13.203.151 with HTTP; Tue, 22 Sep 2015 11:42:31 -0700 (PDT)
In-Reply-To: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
References: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
Date: Tue, 22 Sep 2015 14:42:31 -0400
Message-ID: <CADkTA4N3P9V4va_=Pw2DbykpfC1qoG7PoOBbHoV5OROnNAxpNQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
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
X-List-Received-Date: Tue, 22 Sep 2015 18:42:33 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Sep 21, 2015 at 10:57 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> I've been hitting build issues every now and then due to python
> packages that depend on python-pbr but have not properly declared
> this dependency in their respective recipes. I have fixed some of
> them as soon as they popped up, but that wouldn't catch all
> packages missing this dependency.
> In order to fix this, I looked att the packages that declare a
> dependency on "pbr" in their setup.py file, and made it a
> dependency also in their respective recipe.
>
> I hope this is the proper way to solve this.

In the latest incarnations of the layers and oe-core, it is.  A while about
~ a year to a year and a half ago, adding pbr as a dependency was causing
build issues with colliding packages and some built in routines.

That no longer seems to be the case, so I've merged this, and the one to
master.

Bruce

>
> Josep Puigdemont (1):
>   python packages: add build dependency on python-pbr
>
>  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 4 ++++
>  .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb         | 8 ++++++++
>  meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb       | 4 ++++
>  .../recipes-devtools/python/python-openstackclient_1.0.3.bb       | 8 ++++++++
>  .../recipes-devtools/python/python-oslo.concurrency_1.5.0.bb      | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb    | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb  | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 1 +
>  .../recipes-devtools/python/python-oslo.messaging_git.bb          | 2 ++
>  .../recipes-devtools/python/python-oslo.middleware_0.4.0.bb       | 2 ++
>  .../recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb         | 2 ++
>  .../recipes-devtools/python/python-oslo.serialization_git.bb      | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 2 ++
>  meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb   | 5 +++++
>  meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb | 2 ++
>  meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb     | 2 ++
>  meta-openstack/recipes-devtools/python/python-tooz_0.4.bb         | 2 ++
>  18 files changed, 54 insertions(+)
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

