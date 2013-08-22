Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f177.google.com (mail-lb0-f177.google.com
	[209.85.217.177])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2665AE00747
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 18:34:40 -0700 (PDT)
Received: by mail-lb0-f177.google.com with SMTP id n6so1214747lbi.22
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 18:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=j8Q50KRaoxzKpdkDAplTBcT/76AZ/ZPkuhzJVt7REpA=;
	b=XfgcqV930zNDShpROvJmNwUv6/qct2cilOTZu26klW4Y2RUcLOkLRPxpr8x0RVMkqs
	GrNdiCST+xEm5Ej2hr7YjdZwBR//JkxURvUkSU7Pg62TEyXA6g/S9yJojqbWr4+ITwNS
	oCPcn7YYEantCgu5otvCssSSph/PTkZskyEwRvt6Ee57yFJN/z/7LyYqZ9dNtk7NIwCb
	rQ48iIkXXuFpKW9G2+AY/CabnXUPgxC41Zzix76ICQJkQCf5E84t+zs9a8s044cdW+gA
	2sOJYu1DWuK1fWvY5EKFb4scQ93PYoSqD7KeySJq/34khzx6ozDEmoKd1i2J2V6iKwgh
	uSpg==
MIME-Version: 1.0
X-Received: by 10.112.35.52 with SMTP id e20mr396125lbj.11.1377135278733; Wed,
	21 Aug 2013 18:34:38 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Wed, 21 Aug 2013 18:34:38 -0700 (PDT)
In-Reply-To: <CAM1oe50xWq3fPMU2dc0axfdZ-3pMR5PvJaZ7wcyAKLeHaCFDVQ@mail.gmail.com>
References: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
	<CADkTA4OQXOgvj4XhA2LhENVYpOdEsRodaPj+5kRA=EVf9zRKmw@mail.gmail.com>
	<CAM1oe50xWq3fPMU2dc0axfdZ-3pMR5PvJaZ7wcyAKLeHaCFDVQ@mail.gmail.com>
Date: Wed, 21 Aug 2013 21:34:38 -0400
Message-ID: <CADkTA4Nd2BxFF_SCaytXZQzSfQ4nwnnVWJJCus66QSYmWnaTLw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Zi Shen Lim <zishen.lim@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Victor Kamensky <victor.kamensky@linaro.org>
Subject: Re: error triggered by meta-virtualization
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
X-List-Received-Date: Thu, 22 Aug 2013 01:34:43 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 9:02 PM, Zi Shen Lim <zishen.lim@linaro.org> wrote:
> On Wed, Aug 21, 2013 at 5:52 PM, Bruce Ashfield
> <bruce.ashfield@gmail.com> wrote:
>> On Wed, Aug 21, 2013 at 7:22 PM, Zi Shen Lim <zishen.lim@linaro.org> wrote:
>>> Hi,
>>>
>>> After adding meta-virtualization layer into bblayers.conf, I'm not
>>> able to build packages.
>>> Looks like the search path is broken [1].
>>>
>>> As a quick workaround, I removed
>>> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
>>> That resolved the issue.
>>
>> I'm definitely still able to build packages and plenty of python packages with
>> that bbappend in place.
>>
>> That being said, we've talked about it before, and it should be we can remove
>> as it isn't necessary anymore.
>>
>> I take it you have your own python patches, which the clobbered THISDIR
>> is breaking.
>>
>> If you make the following change, does it build for you ?
>>
>> ------------------
>>
>> diff --git a/recipes-devtools/python/python_2.7.3.bbappend
>> b/recipes-devtools/python/python_2.7.3.bbappend
>> index e39deba..55301c7 100644
>> --- a/recipes-devtools/python/python_2.7.3.bbappend
>> +++ b/recipes-devtools/python/python_2.7.3.bbappend
>> @@ -1,5 +1,4 @@
>> -THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
>> -FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
>> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>>
>>  DEPENDS += " ncurses"
>>
>> ------------
>>
>> If you can confirm it works, I'll push the change ASAP.
>>
>
> Yes, it works :)
>

Thanks for the confirmation, I'll push the change now.

Bruce

> Thanks Bruce and Victor.
>
>> Bruce
>>
>>>
>>> Suggestions?
>>>
>>> Thanks,
>>> z
>>>
>>> [1] http://pastebin.com/BmK4QnnE
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

