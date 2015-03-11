Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 198FAE00754; Wed, 11 Mar 2015 11:39:58 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.223.169 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2860BE0034E
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 11:39:56 -0700 (PDT)
Received: by ieclw3 with SMTP id lw3so1509361iec.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Mar 2015 11:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=ZExMcGqBkOdm5fub1/xi0ilmW8fMsPHfOYZdqIjIBMM=;
	b=dpJlu6vu2+vB1xX8ac5EWQ1Bjirj0cwp6N5jluHEBsv20iltRvN+gfSuHEd8LruQGT
	nueVfnki4aqss6JEnjUyKQpaj/Rki0POInCAseCYLUOOnLnNh69ao646iUtB4ACh+qtv
	fSZbH2DwRJLjxydzpDYMbUIs9k3H3ZpyohQbMaVzmMGwoSTN4euzWE5t3GLOgHEIylbf
	LUv1dfd79t6FsbzaqaFQ84U7CcH/FfFpUmXiY3Rm8SvCmCeMKYgmhUfpaqlV83Ty6EyS
	58eg6mOWbgLquy/oElyohUk8z66t5JKuyj0/CGp3f2bQ1lc7YFq/u20RliyP0RnMFEe2
	4J+A==
MIME-Version: 1.0
X-Received: by 10.50.18.49 with SMTP id t17mr32777673igd.3.1426099196142; Wed,
	11 Mar 2015 11:39:56 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.42.92.201 with HTTP; Wed, 11 Mar 2015 11:39:56 -0700 (PDT)
In-Reply-To: <20150309183329.GA29759@windriver.com>
References: <20150227214013.GA2160@windriver.com>
	<CADkTA4N4nrxOz7R7MgQ11m9hXLO4=0O98jk2o2mDi=m-RzY3Lg@mail.gmail.com>
	<20150309183329.GA29759@windriver.com>
Date: Wed, 11 Mar 2015 14:39:56 -0400
X-Google-Sender-Auth: KLcVVajoJBQZQsJtBR1a6ifBjQg
Message-ID: <CAPuovEKv3JSSZS2wVu1LmpEVFQREoKYy6djXn5iw3yzkkZ_8ag@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
To: Amy Fong <amy.fong@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/5] Package docker + docker-registry
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
X-List-Received-Date: Wed, 11 Mar 2015 18:39:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Mar 9, 2015 at 2:33 PM, Amy Fong <amy.fong@windriver.com> wrote:
> On Mon, Mar 02, 2015 at 03:40:11PM -0500, Bruce Ashfield wrote:
>> On Fri, Feb 27, 2015 at 4:40 PM, Amy Fong <amy.fong@windriver.com> wrote:
>> > This set of patches adds the packages docker, docker-registry
>> > and required dependencies/rdependencies.
>> >
>> > The following were added to my BBLAYERS on top
>> > of a basic yocto/poky build to compile these packages:
>> >
>> >   meta-virtualization \
>> >   meta-cloud-services/meta-openstack \
>>
>> This is creating a circular dependency. Which recipes in particular do we
>> need from meta-openstack ?
>>
>> We need to pull those recipes from meta-openstack to meta-virt, and then
>> I can take the submission.
>>
>> Cheers.
>>
>> Bruce
>
> Sorry, mail got buried.
>
> 3 packages:
>
> python-flask
> python-webob
> python-werkzeug

The list turns out to be a bit larger than this as some of these had
their own dependencies. At any rate I have a patch I will send to Amy
which she can use as the base to her series to add these missing
dependencies (Bruce I will send you the matching commit for the
removals in meta-cloud-services)

Amy I have one small change you will want to squash in to your series
as well, again I will send this to you directly.

With this new series will be meta-cloud-services free.

I thought I noticed some python Eggs being downloaded during my build
so I am just doing another build test now with networking disabled so
we can catch these and add them as needed.

Mark

>
> Amy
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

