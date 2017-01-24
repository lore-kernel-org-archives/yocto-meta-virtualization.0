Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53CF6E003DB; Mon, 23 Jan 2017 18:33:12 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.213.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yb0-f193.google.com (mail-yb0-f193.google.com
	[209.85.213.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 06F2AE0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 18:33:08 -0800 (PST)
Received: by mail-yb0-f193.google.com with SMTP id j82so6779863ybg.2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 Jan 2017 18:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=BNNnwW7VBV9VBLGv0Ij6CmcVwQEtNmAUdT9pd0fuez0=;
	b=po/5qEQmthIjvv1t4wBXCByewFyZL5PRuvTmix1nqiwXcfkKt0d8vRTFfwg6mi4f+f
	2zQIPGzocYlmCuFj8YV0ZRwnFak3//YG1GmjocrmLf12OFKNK10hSr8av8QQDhJgikz8
	buO70BDBDYO07PbWXCC2qR2/a2YxjvP5zE3dH4AGfq9YI2g/hfCUOPdzop3t+8cZBV6Z
	FZEr+i9PUI72mzFtmOUBbu01Yy/EDF9+/nuwkKXabbXZu4tSMxpx3Gjm1atZRdZfurOZ
	gKV3oUZBstTff2yCylCddqAWaQlk61a0Es8L6jv4DsDejYmWGhFWNfN7w7z7LGTQ04pD
	k8UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=BNNnwW7VBV9VBLGv0Ij6CmcVwQEtNmAUdT9pd0fuez0=;
	b=Mji7Ojyh0LVs/pOBiD0CT4EpZy7gEr3cVccYdXbeam7+hT1hi1wg1w8AeTiRDv9twk
	6cXArmJTfDO/B+eVoCT/dwunHiSAFasb6U6OFnSDonkdcBbm5LARK9VT9m2tcQeGjwuB
	RQd80LQvcCygHC52PuWLPP17LeKb/qpOhMBwswP6P/XrVq6AQqJB6Qv5UmJG7T4ot/8E
	ASQzsbaw18WeZ133w+q4YB5o2d68AeLr50Ozvr6YoZ0Xm829f1p6uYAGwtjwDO/dfiHy
	hmDqwAKl1fYciz64Y1tX0HyaSeENAQQeQnxRl3YBV38n5PzoQgaUCcDyOPLKtN7EZ54r
	PR8w==
X-Gm-Message-State: AIkVDXIU5ZpISys0lKuEo+ZSiRXjWghW1E/YExCD2tNMWF6ohbJMCPZC5YfNZrzshFqlrTYXboqFF/EBwkeXmA==
X-Received: by 10.37.203.151 with SMTP id b145mr24229415ybg.110.1485225188016; 
	Mon, 23 Jan 2017 18:33:08 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.174.99 with HTTP; Mon, 23 Jan 2017 18:33:07 -0800 (PST)
In-Reply-To: <CADkTA4MgUjaG6jRzTu=qSH5VTviQh4m37D=rZ15o9gbTp5Ar+g@mail.gmail.com>
References: <1485162147-6734-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<CAPuovEK7wufkACFx21rz18HhhALqG_ELw31wFSei-XpCXdyBTQ@mail.gmail.com>
	<CADkTA4MgUjaG6jRzTu=qSH5VTviQh4m37D=rZ15o9gbTp5Ar+g@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Mon, 23 Jan 2017 21:33:07 -0500
X-Google-Sender-Auth: JybbVMlBidfaegMiG8e4ElYS4ew
Message-ID: <CAPuovEJ0d8suNiX938m7ZUJWk5qPyi9cz0n_H2nG0g0n4NPvNQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 24 Jan 2017 02:33:12 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jan 23, 2017 at 1:24 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
>
> On Mon, Jan 23, 2017 at 9:01 AM, Mark Asselstine
> <mark.asselstine@windriver.com> wrote:
>>
>> On Mon, Jan 23, 2017 at 4:02 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> wrote:
>> > Upgrade python-heatclient from 0.6.0 to 1.7.0.
>> >
>> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
>> > ---
>>
>> Huang, we need to ensure we stick to releases witch match
>> stable/newton and not go beyond. So for this package we should be
>> using the latest commit on the stable/newton branch and the version
>> will be 1.5.0+git${SRCPV}. The other uprev's look fine, although as we
>> proceed through the newton update we might find incompatibilities
>> which might result in some tweaking.
>
>
> Agreed. I'm happy to take uprevs of the python support packages, but for
> anything that is a core project, or interfaces directly with those core
> projects,
> I'd rather batch merge their updates .. once we've shown a fully working
> system.

+1. Now that we have made our way through most of the dependencies and
python-oslo* uprev work I am starting to queue the updates to the core
openstack recipes. Huang, you are most likely best to wait until I
have these complete, there is no need to duplicate this work. Once I
have a somewhat functional system I will get these out for review and
merging.

Mark

>
> Bruce
>
>>
>>
>> Just out of curiosity, what are your end goals for these
>> contributions? do you have a usecase for this repo that I can keep in
>> mind as I move things forward?
>>
>> Mark
>>
>>
>> >  meta-openstack/recipes-devtools/python/python-heatclient_git.bb | 4
>> > ++--
>> >  1 file changed, 2 insertions(+), 2 deletions(-)
>> >
>> > diff --git
>> > a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> > b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> > index 26d86be..711a36d 100644
>> > --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> > +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
>> > @@ -28,8 +28,8 @@ SRCNAME = "heatclient"
>> >
>> >  SRC_URI =
>> > "git://github.com/openstack/python-heatclient.git;branch=master"
>> >
>> > -PV = "0.6.0+git${SRCPV}"
>> > -SRCREV = "7cca8394b8ab2f4dccb982ae789b1b2985627115"
>> > +PV = "1.7.0+git${SRCPV}"
>> > +SRCREV = "17dd3068e4d6fc10236290cc082908c439bcfead"
>> >  S = "${WORKDIR}/git"
>> >
>> >  inherit setuptools
>> > --
>> > 2.7.4
>> >
>> >
>> >
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

