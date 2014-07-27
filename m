Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EABC4E007A1; Sat, 26 Jul 2014 19:43:26 -0700 (PDT)
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
	*      [209.85.217.180 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 13A5AE00746
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Jul 2014 19:43:24 -0700 (PDT)
Received: by mail-lb0-f180.google.com with SMTP id v6so4553801lbi.25
	for <meta-virtualization@yoctoproject.org>;
	Sat, 26 Jul 2014 19:43:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yy77VmP2JviSbaOXGRvuS5yAL9nFJ/lLW8nWZSRsVp8=;
	b=ggHyHj8nZ+f/LQLMkpdjKNl3XzQoXTo9u06P8MPQYR9ZWQoa91tpsdJY8WXq5z6xqr
	OR+8aDGy2ICjHYDCTUqlrBPKnpy9A7dv+rS2lTInjNOj9tKYs5OQZI9WqCF/BJG33VYu
	WZCKZ1fWVogPeIY5He1+44CcJWySVf0GVFcJ4sCLwg/sZcFB4bZPMyr0u+3HBdzJfRAj
	CsO+vkFPWE9hZMJ+Mxr4Uq3Qe8CVWhLQkXnLCcGgHE4XsKoRXdG+IcT2tPIWSKi4mpM/
	1/5Fi5H/kC89nm+QuBs4XU4z9jCDT/OdiXw921J56pIgp26gScO7aDFyDdu/4MhJt+FK
	fg3w==
MIME-Version: 1.0
X-Received: by 10.112.239.41 with SMTP id vp9mr24344027lbc.8.1406429003127;
	Sat, 26 Jul 2014 19:43:23 -0700 (PDT)
Received: by 10.112.124.137 with HTTP; Sat, 26 Jul 2014 19:43:23 -0700 (PDT)
In-Reply-To: <53D2B338.906@gmail.com>
References: <1404164895-19815-1-git-send-email-akuster@mvista.com>
	<CADkTA4OXMbtPKpfcDHQxRoDAGsGLzBrDJpZEMqV+q8NqOKoczg@mail.gmail.com>
	<53D2B338.906@gmail.com>
Date: Sat, 26 Jul 2014 22:43:23 -0400
Message-ID: <CADkTA4PrOi-ZPFXBaMOJN1y5a4=MNWJ_XPA=7p0V375iQHjC0A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/7] Remove use of PRINC
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
X-List-Received-Date: Sun, 27 Jul 2014 02:43:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jul 25, 2014 at 3:42 PM, akuster808 <akuster808@gmail.com> wrote:
> Bruce,
>
> Where there any objections?

No objections. I'm simply busy getting OpenStack Icehouse and Juno working
to my satisfaction, and then I'm pushing a whole series of updates.

Bruce

>
> - Armi
>
>
> On 06/30/2014 09:39 PM, Bruce Ashfield wrote:
>>
>> On Mon, Jun 30, 2014 at 5:48 PM, Armin Kuster <akuster@mvista.com> wrote:
>>>
>>> PR .= instead of PRINC
>>>
>>
>> I have a similar series staged locally, but since I'm out of the
>> office, I haven't
>> pushed them yet.
>>
>> I staged these on top of that pending work, and if no one objects, I'll
>> push
>> everything at the same time.
>>
>> Bruce
>>
>>>
>>> Armin Kuster (7):
>>>    [meta-openstack] apache2: Remove PRINC reference
>>>    [meta-openstack] iptables: remove PRINC reference
>>>    [meta-openstack] lighttpd: remove PRINC reference
>>>    [meta-openstack] postgressql: remove PRINC reference
>>>    [meta-openstack] linux-yocto_3.10: remove PRINC reference
>>>    [meta-openstack] linux-yocto_3.14: remove PRINC reference
>>>    [meta-openstack] linux-yocto_3.4: remove PRINC reference
>>>
>>>   meta-openstack/recipes-extended/apache2/apache2_2.4.9.bbappend      | 2
>>> +-
>>>   meta-openstack/recipes-extended/iptables/iptables_1.4.21.bbappend   | 2
>>> +-
>>>   meta-openstack/recipes-extended/lighttpd/lighttpd_1.4.35.bbappend   | 2
>>> +-
>>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.10.bbappend       | 3
>>> ++-
>>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.14.bbappend       | 2
>>> +-
>>>   meta-openstack/recipes-kernel/linux/linux-yocto_3.4.bbappend        | 2
>>> +-
>>>   meta-openstack/recipes-support/postgresql/postgresql_9.2.4.bbappend | 2
>>> +-
>>>   7 files changed, 8 insertions(+), 7 deletions(-)
>>>
>>> --
>>> 1.9.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>>
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

