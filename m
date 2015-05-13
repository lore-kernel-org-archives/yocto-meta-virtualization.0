Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9EF9DE0097D; Wed, 13 May 2015 13:47:08 -0700 (PDT)
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
	*      [209.85.213.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88065E008DC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:47:03 -0700 (PDT)
Received: by yhrr66 with SMTP id r66so17298434yhr.3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 13:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pf0HbcCI/R2a9kQGglnrghbPiuR2E82R2Xrkdqhy6Kw=;
	b=C1YaFVYTSe91G0IuQnHpuMq9aAaZQmES5AjcDcSepYq8eFC/5WcnWc7Ywl6xSpOi/e
	sHReQbKfnNE5m6xzJuVMpaNsy6V9CQqoiUNtnFj+4pHEPPXcY9XJcJHspotDUxCtrhNL
	lqrdRfj75/fqnQUE99VaLCpQyfrDFtf5+0xj1RpPHfu4ARkDzynhxqCE9zrst5MvnE3l
	q8zVMdEwZlP0XLOOzURDrWe8Mq7WpXIh+Dc/emK3egR6gpG2TLrt/52AcNxeabpS4HaC
	ZsH0zdkkzBMB+5YkBr/4IPGyK7c5gNMEmRCyz9Vjedl6LWrFZrhTGZP26nmVLxUCWRhm
	xbug==
MIME-Version: 1.0
X-Received: by 10.236.70.106 with SMTP id o70mr788132yhd.136.1431550022390;
	Wed, 13 May 2015 13:47:02 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 13 May 2015 13:47:02 -0700 (PDT)
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AAF11A1285@ALA-MBA.corp.ad.wrs.com>
References: <cover.1430817811.git.jackie.huang@windriver.com>
	<CADkTA4Ov-AJ7AAD9=MZLvQ_p2oG+toeZE=MKSiyeXx8rZ+bY4A@mail.gmail.com>
	<1B858668EC6A94408DCA5225FDFA85AAF11A1285@ALA-MBA.corp.ad.wrs.com>
Date: Wed, 13 May 2015 16:47:02 -0400
Message-ID: <CADkTA4NgG6pabuNmex7N1m+KC_F_CTP_fb0aiLSJ6+FqCO14ag@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 00/10] core: update to the kilo release
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
X-List-Received-Date: Wed, 13 May 2015 20:47:08 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 11, 2015 at 10:22 PM, Huang, Jie (Jackie)
<Jackie.Huang@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Friday, May 08, 2015 2:15 AM
>> To: Huang, Jie (Jackie)
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH 00/10] core: update to the kilo release
>>
>> Thanks Jackie, I've merged these to the master and kilo branches.
>
> Thanks Bruce, but seems like you missed this one:
>
> python-keystonemiddleware: upgrade to 1.6.1
>
> Could you take a look? Thanks!

Yep. Looks like I missed it. Merged now.

Bruce

>
> Thanks,
> Jackie
>
>>
>> Bruce
>>
>> On Tue, May 5, 2015 at 9:44 PM,  <jackie.huang@windriver.com> wrote:
>> > From: Jackie Huang <jackie.huang@windriver.com>
>> >
>> > update to the kilo release and change to stable/kilo branch.
>> >
>> > --
>> > The following changes since commit 2ed930f23e4d5678ef943cef413d09cd10c78eb7:
>> >
>> >   python-setuptools-git: upgrade to 1.1 (2015-04-29 12:29:42 -0400)
>> >
>> > are available in the git repository at:
>> >
>> >   git://git.pokylinux.org/poky-contrib jhuang0/r_up_openstack-kilo_150505-0
>> >
>> > http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_up_ope
>> > nstack-kilo_150505-0
>> >
>> > Jackie Huang (10):
>> >   python-keystonemiddleware: upgrade to 1.6.1
>> >   python-ceilometer: upgrade to 2015.1.0
>> >   python-cinder: upgrade to 2015.1.0
>> >   python-glance: upgrade to 2015.1.0
>> >   python-heat: upgrade to 2015.1.0
>> >   python-horizon: upgrade to 2015.1.0
>> >   python-keystone: upgrade to 2015.1.0
>> >   python-neutron: upgrade to 2015.1.0
>> >   python-nova: upgrade to 2015.1.0
>> >   python-barbican: upgrade to 2015.1.0
>> >
>> >  meta-openstack/recipes-devtools/python/python-barbican_git.bb      | 6 +++---
>> >  meta-openstack/recipes-devtools/python/python-ceilometer_git.bb    | 6 +++---
>> >  meta-openstack/recipes-devtools/python/python-cinder_git.bb        | 6 +++---
>> >  meta-openstack/recipes-devtools/python/python-glance_git.bb        | 6 +++---
>> >  meta-openstack/recipes-devtools/python/python-heat_git.bb          | 6 +++---
>> >  meta-openstack/recipes-devtools/python/python-horizon_git.bb       | 7 +++----
>> >  meta-openstack/recipes-devtools/python/python-keystone_git.bb      | 7 +++----
>> >  .../recipes-devtools/python/python-keystonemiddleware_git.bb       | 4 ++--
>> >  meta-openstack/recipes-devtools/python/python-neutron_git.bb       | 7 +++----
>> >  meta-openstack/recipes-devtools/python/python-nova_git.bb          | 7 +++----
>> >  10 files changed, 29 insertions(+), 33 deletions(-)
>> >
>> > --
>> > 1.9.1
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

