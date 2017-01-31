Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C090BE007EB; Tue, 31 Jan 2017 08:06:29 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f195.google.com (mail-yb0-f195.google.com
	[209.85.213.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 833F2E0030B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jan 2017 08:06:25 -0800 (PST)
Received: by mail-yb0-f195.google.com with SMTP id j82so24456750ybg.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 31 Jan 2017 08:06:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zpvdwlFjLVFL2wroAC0s3gtjxYagZXFA5/fsRRfMqH8=;
	b=tfgIjQFhMpDt8OVKIvS2LiFe90118nDzCV4ouJhgbBRC19zivLtcIzEyujWGzUqkIM
	Mtio4bYPgMY2tk7mE4ZM+t5Q72viPYwTrt1nXEcG2BzaaUjLAZ5IoSMtgNa0oMB9mXAZ
	V9D61Cl+y6Zu5XdqMq1kmdxtFypLbrF3A043HMlIzUw86uJLkD+q5uifOwPfxiR/UFc5
	so5Is3mdheyiUOLEcrdDx7CX2bTOUIBh+p45rzi62F6JQf1xaH/CF0IcKgu92AmwjzZs
	8D/ZQS35/Q7FM45p7E83VKKbR9LKQZnRspVuqzBEEjy/jIV3J/JrJ5ZGpxDP53vf8sce
	4Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=zpvdwlFjLVFL2wroAC0s3gtjxYagZXFA5/fsRRfMqH8=;
	b=EXmrbIkeoE/npDKIFmVmrAuicz+cBanmhtY2MoVgOYIc+nRGi46oTrODXHLS+azrFa
	//44rxpuFbetW9UFstLWS5BSGJDmtS78yAOSPqCzRXTWdtMtXQM+rrECL9x+6kn9sTJM
	zfaEnruSc+4nsr5BWf33YdfQtLiVRzBoZRyTHsJCv1bGDrmjiuWPjQrD3BodGv5Tt8R3
	ii+8P69Wk641M/oEqs78EX2VRkIe9fP/LtSoTaVqxpi1KItioTfrC6qzhzlXmRbmL8IA
	qgQEZhMOJcXzrHM8RjUhoiv1T/Nf60+Ped7jx5pdg0D8XJX/lU2IP7hNRxTV7IOtj/Oy
	puRA==
X-Gm-Message-State: AIkVDXL6pB+EQu6N1KTi62a8KOT/Os1IVrg1KrGQsNPl7+2u9BThW4YR+nsSGSCdgVYuSUdrlFvtdCK/lWDyGQ==
X-Received: by 10.37.47.146 with SMTP id v140mr16465910ybv.96.1485878784296;
	Tue, 31 Jan 2017 08:06:24 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.172.100 with HTTP; Tue, 31 Jan 2017 08:06:23 -0800 (PST)
In-Reply-To: <CAPuovEJ0d8suNiX938m7ZUJWk5qPyi9cz0n_H2nG0g0n4NPvNQ@mail.gmail.com>
References: <1485162147-6734-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAPuovEK7wufkACFx21rz18HhhALqG_ELw31wFSei-XpCXdyBTQ@mail.gmail.com>
	<CADkTA4MgUjaG6jRzTu=qSH5VTviQh4m37D=rZ15o9gbTp5Ar+g@mail.gmail.com>
	<CAPuovEJ0d8suNiX938m7ZUJWk5qPyi9cz0n_H2nG0g0n4NPvNQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 31 Jan 2017 11:06:23 -0500
X-Google-Sender-Auth: aO2bOR40t6uzOUMs4rDFuJuD3o0
Message-ID: <CAPuovE+LvQxENJ4K+bNm7cUuFkVxLg9ddo9VJumG63FxrgPkmA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] [PATCH] python-heatclient: 0.6.0 -> 1.7.0
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 31 Jan 2017 16:06:29 -0000
Content-Type: text/plain; charset=UTF-8

Huang, Bruce, or whoever

I have made my work in progress available at
https://github.com/masselstine/meta-cloud-services . Commits on this
repo which I have not sent to Bruce yet are subject to change.

You don't have to look far for things to fixup, simply build a
controller image (via the README.setup) fire it up in QEMU and start
trying to use openstack infrastructure like horizon or keystone... The
Horizon login page will come up but you can't login at the moment
since the keystone identity creation script is not working.

Huang, if you are wanting to help out feel free to send me commits
against this repo and I will collect them. Once we get things in a
good enough working state I will do cleanup and get the whole bunch to
Bruce for merging into the official repo. Thanks to git anything you
send me will continue to have you SOB and authorship so credit will
fall where it should.

I have to balance my work on m-c-s with other work so if you are
needing Openstack soon this repo can help us collaborate, or at
minimum you can keep an eye on it to follow my progress. I will try to
update it whenever I make changes to m-c-s.

Mark

On Mon, Jan 23, 2017 at 9:33 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Mon, Jan 23, 2017 at 1:24 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>>
>>
>> On Mon, Jan 23, 2017 at 9:01 AM, Mark Asselstine
>> <mark.asselstine@windriver.com> wrote:
>>>
>>> On Mon, Jan 23, 2017 at 4:02 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>>> wrote:
>>> > Upgrade python-heatclient from 0.6.0 to 1.7.0.
>>> >
>>> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>>> > ---
>>>
>>> Huang, we need to ensure we stick to releases witch match
>>> stable/newton and not go beyond. So for this package we should be
>>> using the latest commit on the stable/newton branch and the version
>>> will be 1.5.0+git${SRCPV}. The other uprev's look fine, although as we
>>> proceed through the newton update we might find incompatibilities
>>> which might result in some tweaking.
>>
>>
>> Agreed. I'm happy to take uprevs of the python support packages, but for
>> anything that is a core project, or interfaces directly with those core
>> projects,
>> I'd rather batch merge their updates .. once we've shown a fully working
>> system.
>
> +1. Now that we have made our way through most of the dependencies and
> python-oslo* uprev work I am starting to queue the updates to the core
> openstack recipes. Huang, you are most likely best to wait until I
> have these complete, there is no need to duplicate this work. Once I
> have a somewhat functional system I will get these out for review and
> merging.
>
> Mark
>
>>
>> Bruce
>>
>>>
>>>
>>> Just out of curiosity, what are your end goals for these
>>> contributions? do you have a usecase for this repo that I can keep in
>>> mind as I move things forward?
>>>
>>> Mark
>>>
>>>
>>> >  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4
>>> > ++--
>>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>>> >
>>> > diff --git
>>> > a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>>> > b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>>> > index 26d86be..711a36d 100644
>>> > --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>>> > +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>>> > @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>>> >
>>> >  SRC_URI =
>>> > "git://github.com/openstack/python-heatclient.git;branch=master"
>>> >
>>> > -PV = "0.6.0+git${SRCPV}"
>>> > -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
>>> > +PV = "1.7.0+git${SRCPV}"
>>> > +SRCREV = "17dd3068e4d6fc10236290cc082908c439bcfead"
>>> >  S = "${WORKDIR}/git"
>>> >
>>> >  inherit setuptools
>>> > --
>>> > 2.7.4
>>> >
>>> >
>>> >
>>> > --
>>> > _______________________________________________
>>> > meta-virtualization mailing list
>>> > meta-virtualization@yoctoproject.org
>>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
>> its end"
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>

