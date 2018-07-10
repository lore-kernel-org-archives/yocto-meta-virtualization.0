Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85364E00EC7; Tue, 10 Jul 2018 06:58:15 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8F601E00E9D
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:58:14 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id t7-v6so16810891ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:58:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1B5C3RFRdNkxkVrt/sNtAoCGzxkNeg8wSZTAf5uQY58=;
	b=sHdAaXgJ/4yF+xGuLyeJJeBg8jg3wtthpdYotTfT0QHXuCsb3jHGEgGbkTV2P2ucZn
	tiyoHXE6KcPjPL9eHEfGmgh0I0yZxZDH5EzV53v099UddORE6wddqrDz0rrE7AuQWw5q
	1aDIr3etvgpJ+0HMz0NFO4+EWNZXNFRi7hfKr+6g50OnZIOWG+cG66JyEv1emh6DDGu0
	K1mDRQnQlnPfceqVowJzwkHSXmFy8HTXxEBfqWvMldKoc+CIHdv+jH5RMj9Jv/+R23cI
	m1/2auP2JHDLkmFGyZvf9kgvKEBYMBdZJo5ZYgV6WUiZwkco9LVU0lWIXrbAu+T6oaSZ
	/NSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1B5C3RFRdNkxkVrt/sNtAoCGzxkNeg8wSZTAf5uQY58=;
	b=MU6Ymzr8VvnPKCDLQRDsT5SqGH69w/CPabPmJDt1/GbUoqyDHp/h7vzC0Qk/mZkcrJ
	CkPebFn9sKXcR9mF4WDkckD7pgpxjfqfqu3hhEBOboH3vuR19wFacl8o+x2NtfEq8Xa5
	zL3r2yqxd+4UH0+9ZxjC3nH00GmVzfSVLLflYnlmqQyy5SQvsI0v1vhS71Wpmwu+BqRu
	wJgY+al6BKoxMfo3h8Zr/EHiDKzE3+QV+ve0QvMYaRRznDcLMzlB3RBEGC35ZPdRfEj+
	7PtHKc1jws41KUh+c81Ouvvlgi2beb+0087mcweC+t2gKVpvpYMRsHUvUC2q1HWqAiY8
	Ys6Q==
X-Gm-Message-State: APt69E3VAsUQteZ8EqUfCHHcvHH3e9upHIyuqTPhFDOrqkGml/ncPatL
	BGNIX0fUeaXdHRMY1oHDzLNl4rp3PVBLsyFKGR4=
X-Google-Smtp-Source: AAOMgpdUrqcsk0S79DIJVOUBieeTYH0EPWMPFcWrO1iYZJA2fwXqTSaG+98Ap6CFQ4uxrvzeO+2Aykhj6nTC0A2WFz8=
X-Received: by 2002:a2e:97c8:: with SMTP id m8-v6mr2394827ljj.52.1531231093596;
	Tue, 10 Jul 2018 06:58:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:58:13
	-0700 (PDT)
In-Reply-To: <CADkTA4M2ZwHi19-v1WugZ1gYrE50dVKmcBZAjNCJEfDxWKFO5Q@mail.gmail.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
	<fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
	<CADkTA4P0PWZP4-iKfPs6M8JTUGq3=EL4M+qifhwnj-cFAtfJDA@mail.gmail.com>
	<bb7c7ba4-aeee-5465-cc2f-6a268f024e47@mvista.com>
	<CADkTA4M2ZwHi19-v1WugZ1gYrE50dVKmcBZAjNCJEfDxWKFO5Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:58:13 -0400
Message-ID: <CADkTA4P-aj9dYL0GeKBC-c2i_1obeAutnV_MYJX3zVr7i4ahXg@mail.gmail.com>
To: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 1/2] libbsd: Remove dangling append that no longer is needed
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
X-List-Received-Date: Tue, 10 Jul 2018 13:58:15 -0000
Content-Type: text/plain; charset="UTF-8"

I went ahead and did the rename of the bbappend. At some distant point
in the future
we can determine if it really was necessary :D

Bruce

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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

