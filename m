Return-Path: <jpuhlman@mvista.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E76CFE00E0E; Fri,  6 Jul 2018 20:31:32 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7157BE00A04
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 20:31:30 -0700 (PDT)
Received: by mail-yb0-f195.google.com with SMTP id e84-v6so5327156ybb.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 20:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mvista-com.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=/IuKhmXhAW5UhKevOqiF6pSqqVGcQ24tJV4JTiAsfyM=;
	b=VKc+TPxgoZLcEQJfrcNhN1cyeZfwOcuwQyNaOUlTNWB2Uio+2128/T2nW4yryOsrP7
	E8aMnagGq8lC2KByeA3U2WbEpEaL7U65z6nftKtcVKglNedcbriVd+JX6TOg5kPy7l8f
	99C7D68HyCZOvtFN/u/plPY+VIgzD67ipAUN8xEAWJQsBJGSaBrOb0ZRjWC+8OTCn950
	LDIbZMHuZg1f2RdGzYAgMQjXhg0AW8bxXj8nz2GMkENc20m0myhCpNLghk848GYCLiaP
	enSxGOceFFPULpatVd6jYAbmR0mgkcYVubTgxSze5CG2wesqvOWortbIKAgWo2byMIgP
	QCyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=/IuKhmXhAW5UhKevOqiF6pSqqVGcQ24tJV4JTiAsfyM=;
	b=teVc14Jyho2rrjRWfYdkP1sKT/jbSfB4oNfwrFsVh0Nu1HWh4VWZ24FdiaSNVKTjwr
	+69EFKykLLPQImsdVJvCkePqjegySkN7AAxmXBtfpoS7OrgH3dFro7lERw9s9tygcZaH
	M7U/KtdmN7lRFn/yjFeAMcWZn5vTH38OUheBgllc2kF8jZDqn93cCFFKH8sYgZsAZ2FC
	ah/nI1LPhxOilnpALoCGLQnJNosHcsUNkHP1yhIP5ZLw0tRATj/gZCEwTOLY5d37i3pR
	ChL+vwXMA5zDFsvltFBlSMwvBhDfHpNHjbvk9RDPMTHEti7/ZQRpdQKXRASzGcTLxN4l
	W+fA==
X-Gm-Message-State: APt69E3hzECB8zArG4eovjyTFqROF7lV3AD6Qduj2Q49K2QHrQ3yOFEE
	2hIKJ4mVYy8aRmroukinW/rvCmcUXdk=
X-Google-Smtp-Source: AAOMgpfj+Zp7obfskejQ39wQn5WUqc2Yq+5GEEB+tn6qMJ9INScAsgiqmTM6fBLulc/Bm0O7NfIpYA==
X-Received: by 2002:a25:6282:: with SMTP id
	w124-v6mr6710607ybb.291.1530934289422; 
	Fri, 06 Jul 2018 20:31:29 -0700 (PDT)
Received: from ?IPv6:2600:1700:4c90:60a0:5566:b07f:3f47:4a0e?
	([2600:1700:4c90:60a0:5566:b07f:3f47:4a0e])
	by smtp.gmail.com with ESMTPSA id
	s125-v6sm7237620yws.49.2018.07.06.20.31.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Jul 2018 20:31:28 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
	<fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
	<CADkTA4P0PWZP4-iKfPs6M8JTUGq3=EL4M+qifhwnj-cFAtfJDA@mail.gmail.com>
From: "Jeremy A. Puhlman" <jpuhlman@mvista.com>
Message-ID: <bb7c7ba4-aeee-5465-cc2f-6a268f024e47@mvista.com>
Date: Fri, 6 Jul 2018 20:31:25 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4P0PWZP4-iKfPs6M8JTUGq3=EL4M+qifhwnj-cFAtfJDA@mail.gmail.com>
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
X-List-Received-Date: Sat, 07 Jul 2018 03:31:33 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 7/6/2018 8:20 PM, Bruce Ashfield wrote:
> On Fri, Jul 6, 2018 at 10:50 PM, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
>> Going back through the log I didn't see any indication of the problem it was
>> trying to solve. I assumed it was
>> a standard configure doesn't work with a split build. Currently it doesn't
>> apply to master at all and I haven't
>> seen any actual issues. What where the specific steps to reproduce?
> It would have been added when an incremental build was performed. i.e.
> a build, an update and the rebuild triggered the error. They only
> appear sporadically, so there's no set of steps to reproduce the issue
> consistently.
>
> Unless this is actually breaking something, I tend to just leave them
> in place rather than break some nightly build that someone may be
> doing ..

Fair enough. Then the append needs to be updated for the master version. 
You want me to send you a update to do that, or would
you like to handle it?


>
> Bruce
>
>>
>> On 7/6/2018 7:33 PM, Bruce Ashfield wrote:
>>> Can we log why it is no longer necessary ? i.e. which version of the
>>> package has fixed
>>> the old clean -> rebuild problem.
>>>
>>> Bruce
>>>
>>> On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com>
>>> wrote:
>>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>>> ---
>>>>    meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
>>>>    1 file changed, 1 deletion(-)
>>>>    delete mode 100644
>>>> meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>>
>>>> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>> b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>> deleted file mode 100644
>>>> index 7447c56..0000000
>>>> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>> +++ /dev/null
>>>> @@ -1 +0,0 @@
>>>> -inherit autotools-brokensep
>>>> --
>>>> 2.11.1
>>>>
>>>> --
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>> --
>> Jeremy A. Puhlman
>> jpuhlman@mvista.com
>>
>
>

-- 
Jeremy A. Puhlman
jpuhlman@mvista.com


