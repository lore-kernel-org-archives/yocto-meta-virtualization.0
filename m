Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61B0BE00D9E; Sat,  7 Jul 2018 19:35:42 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 89749E006F1
	for <meta-virtualization@yoctoproject.org>;
	Sat,  7 Jul 2018 19:35:39 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id h127-v6so5977825ybg.12
	for <meta-virtualization@yoctoproject.org>;
	Sat, 07 Jul 2018 19:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=3JzaLV9Wggd/VrRl/yTF/Ahrqk2P6qSbPGi/IY2fwIw=;
	b=V4Cu8AX/eYNv6MUg2fDUpez/6lyZsrf1O+uY9HArYacLPxoqqJ07B5yND7+bvn+3Yn
	bxfbu5L82Pwo3zX1HihNTUwOz7Ul21laU8wOjJdmUdlLCXz2bsYPlOgnqPT1rR/RDKFr
	qDK0cOLRJwW831pfmWoTCtyWJZOIy8W3D3m0kAV2RbcpmQQXWN3FYu6nYz4NwjD0p++R
	EsTuv078jfrOH29ygCg7hB3az33I/H2xQ5iRcrycNnSgyN9xg1GGqN0I9H4wX+q9+WWy
	X1TxM07cA3AmkpIJCYB9JqV1ocPiSzMQMT/tJIf9SdbV3ZUqUZKDMM8JMz0RBevGNziH
	LDIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=3JzaLV9Wggd/VrRl/yTF/Ahrqk2P6qSbPGi/IY2fwIw=;
	b=pS4SBo/yFL38JXJ53Tx+2x1M1gz8xhXkb/K3t1OliiwpDEzqIGGt33pp2/X9Q2LGva
	ygETeJwZE6KwSOMhNGb51/lpZfP+HS5qLgjQ4uRGk8EzYCfuJSU2xc1YmasSD14RuzK7
	yXlY1f2THm5htMILaViyWkuHned805Rjwp7xZQ7kc/g8wkZXn4MypiMcqvRADLir/wX1
	kdg1v6daJvrkZMR1J5/5Z/LzDtWAFdbQrsFx5jasygCAdXAJzGRLgcV+hSrkSv3u+mal
	y1aKuhOnFWg9o6KA0eDYFylJ5qcFGrt0yddOsfZeSdfoYnem0FKayMtIX1dc+HMqTtuH
	10Gw==
X-Gm-Message-State: APt69E0mCwo8nTiMOIFenm8wAbk4uVzz8kN+mNWvH4VrgRqbgtZYvnm8
	nZaXRLZc9SkfuPzP79Wsxdgw3gI9CihQ7Pt+u8E=
X-Google-Smtp-Source: AAOMgpe64WP1ad2bIT+mZCqhbdBGigTwAsxo9XC4zIuyZV6iLwi/MMmzPIahwJAXrERMH7W9OAHBzzm+cFENOwwcTmg=
X-Received: by 2002:a25:5344:: with SMTP id
	h65-v6mr7934632ybb.232.1531017338547; 
	Sat, 07 Jul 2018 19:35:38 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a5b:612:0:0:0:0:0 with HTTP;
	Sat, 7 Jul 2018 19:35:38 -0700 (PDT)
In-Reply-To: <CADkTA4M2ZwHi19-v1WugZ1gYrE50dVKmcBZAjNCJEfDxWKFO5Q@mail.gmail.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
	<fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
	<CADkTA4P0PWZP4-iKfPs6M8JTUGq3=EL4M+qifhwnj-cFAtfJDA@mail.gmail.com>
	<bb7c7ba4-aeee-5465-cc2f-6a268f024e47@mvista.com>
	<CADkTA4M2ZwHi19-v1WugZ1gYrE50dVKmcBZAjNCJEfDxWKFO5Q@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sat, 7 Jul 2018 22:35:38 -0400
X-Google-Sender-Auth: Aqg636RqX50JByxwOllx0mPPdZs
Message-ID: <CAPuovEKqEdUv1=0cQGE-K01sSpZdDxCs09PFeB4UpmeCPkZzRg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "Jeremy A. Puhlman" <jpuhlman@mvista.com>,
	meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] libbsd: Remove dangling append that no longer is needed
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
X-List-Received-Date: Sun, 08 Jul 2018 02:35:42 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 7, 2018 at 12:31 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Fri, Jul 6, 2018 at 11:31 PM, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>>
>>
>> On 7/6/2018 8:20 PM, Bruce Ashfield wrote:
>>>
>>> On Fri, Jul 6, 2018 at 10:50 PM, Jeremy A. Puhlman <jpuhlman@mvista.com>
>>> wrote:
>>>>
>>>> Going back through the log I didn't see any indication of the problem it
>>>> was
>>>> trying to solve. I assumed it was
>>>> a standard configure doesn't work with a split build. Currently it
>>>> doesn't
>>>> apply to master at all and I haven't
>>>> seen any actual issues. What where the specific steps to reproduce?
>>>
>>> It would have been added when an incremental build was performed. i.e.
>>> a build, an update and the rebuild triggered the error. They only
>>> appear sporadically, so there's no set of steps to reproduce the issue
>>> consistently.
>>>
>>> Unless this is actually breaking something, I tend to just leave them
>>> in place rather than break some nightly build that someone may be
>>> doing ..
>>
>>
>> Fair enough. Then the append needs to be updated for the master version. You
>> want me to send you a update to do that, or would
>> you like to handle it?
>
> Either works. Probably easier if I just do it, so I'll add your
> reported-by tag to the update of the bbappend.
>
> Bruce

This dates back to the src/build split
http://git.yoctoproject.org/cgit/cgit.cgi/meta-cloud-services/commit/?id=b288eb5c2e5961caf57645b246143d3e2e596c55

No clues in the project's commits to indicate an explicit fix being
applied. I am 1/2 tempted to revert back to 0.6.0 and see what the
error was to be able to properly drop this.

Mark

>
>>
>>
>>
>>>
>>> Bruce
>>>
>>>>
>>>> On 7/6/2018 7:33 PM, Bruce Ashfield wrote:
>>>>>
>>>>> Can we log why it is no longer necessary ? i.e. which version of the
>>>>> package has fixed
>>>>> the old clean -> rebuild problem.
>>>>>
>>>>> Bruce
>>>>>
>>>>> On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com>
>>>>> wrote:
>>>>>>
>>>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>>>> ---
>>>>>>    meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
>>>>>>    1 file changed, 1 deletion(-)
>>>>>>    delete mode 100644
>>>>>> meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>>>>
>>>>>> diff --git
>>>>>> a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>>>> b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>>>> deleted file mode 100644
>>>>>> index 7447c56..0000000
>>>>>> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>>>> +++ /dev/null
>>>>>> @@ -1 +0,0 @@
>>>>>> -inherit autotools-brokensep
>>>>>> --
>>>>>> 2.11.1
>>>>>>
>>>>>> --
>>>>>> _______________________________________________
>>>>>> meta-virtualization mailing list
>>>>>> meta-virtualization@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>
>>>>>
>>>>>
>>>> --
>>>> Jeremy A. Puhlman
>>>> jpuhlman@mvista.com
>>>>
>>>
>>>
>>
>> --
>> Jeremy A. Puhlman
>> jpuhlman@mvista.com
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

