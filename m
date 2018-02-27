Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C037BE00E82; Tue, 27 Feb 2018 05:00:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.48 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 95CA4E00843
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Feb 2018 05:00:13 -0800 (PST)
Received: by mail-lf0-f48.google.com with SMTP id o145so24144202lff.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Feb 2018 05:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=q0snoMVzjqpoq6yt0SteItNoftXBSAKcgFg6qG3ptVU=;
	b=ZD1ZNNsrFpf7R2MiA1Fxz3/Lt4YIdQncRIGJ0jQaBjaF/KlL/LBH/V0hZaEC1Ir6Ib
	gmInC+UUXEGmMr8jTxPtgCuegCQvi/tr5ty7CIdQ2IOmlCAAghw47cFvQWtI9/4GLjKu
	+971GF3qf5QUqm4DlHjGC0vV111D7O4s4DjXDtZW9SoQQfjuDgqfvZMqwJL+POUxXN3f
	t3NkAzfSja3zVnX+zX6w8yDfObwGQ5gcUNZh3gxII8jKxEbx5Oe8cAzyTVsMv6j4xeeq
	dVoZd3b96HQncopbhiLBnyqOSkQqexDNE68UuA250EI/P7nLZJkxTCs90z17qEVmdn9H
	EcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=q0snoMVzjqpoq6yt0SteItNoftXBSAKcgFg6qG3ptVU=;
	b=RXYX13sHJFsVQRLEzJtJSYNrFzMGYQnMlTyn9EtiL5hYE20I3JesRSDpcNb+s1mtBu
	dxSanJrvEAHXCdZE4PdCuasASAVjtuw/7si9MQerVykk3MpW9X30hZ7Y4oUC1DKGQuZh
	SHDKHlWnfvxFgDRXra8z7twDc7E+srjRHsnGAiWDQ3Fq9g+DKnL80HDmrwvQ3X8O1X8x
	E5fUqraY+VirAZZKuimusTxDomaAGKNwcI9ZwBmM0mYrPZKLJqPmhuHNA0hVSuD9RMSj
	3jdyh/Zwkry/GvMJXJepBidvXFPHM8b58ss4vUQWB/xJVa2Wi2Tw1IjAMwEpjohiLcQ+
	vRfw==
X-Gm-Message-State: APf1xPAzi2VRl7Oo6jNDCx7X489Fk0wbDqVpmxqJqcXPQYcw6cI2zumm
	LlD+D7rrUYRha9cRptRwtyRqm7e509t/ToLASIk=
X-Google-Smtp-Source: AG47ELv5/CIYkT5ycd1qWUjK9qYKNhJISWnwHtQFFxHQmvAGHNtS+LnpIy5cdXzRiLa9bQMU9oztXD8kpeNs23Ra7Dc=
X-Received: by 10.46.25.86 with SMTP id p83mr10235763lje.142.1519736412108;
	Tue, 27 Feb 2018 05:00:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.48.4 with HTTP; Tue, 27 Feb 2018 05:00:11 -0800 (PST)
In-Reply-To: <30bb08d4-12e5-7474-7ef5-42fdf9afec70@windriver.com>
References: <20180227015512.27675-1-liezhi.yang@windriver.com>
	<CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
	<30bb08d4-12e5-7474-7ef5-42fdf9afec70@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Feb 2018 08:00:11 -0500
Message-ID: <CADkTA4Pc7q3FoeWxgLSsP3=kC03Ho09pj8=YzR9OpTDN_75UjQ@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pyparsing: fix SRC_URI's checksum
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
X-List-Received-Date: Tue, 27 Feb 2018 13:00:15 -0000
Content-Type: text/plain; charset="UTF-8"

No worries. I very well could have missed it .. things like that
happen from time
to time :D

But either way, thanks for the v2, it is now merged.

Bruce

On Tue, Feb 27, 2018 at 1:46 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> Hi Bruce,
>
> I remembered that I had sent this patch on Nov. 16th, but I couldn't find
> it,
> maybe I failed to send it. It was because the source was changed from .zip
> to
> .tar.gz:
>
> commit 3d512115129e2cea97067d23cb72fea62b70dd39
> Author: Mark Asselstine <mark.asselstine@windriver.com>
> Date:   Mon Nov 13 16:48:05 2017 -0500
>
>     python-*: switch remaining pypi recipes to use the pypi class
>
> It had been wrong for more than 3 months. I will add more comments and send
> a
> V2.
>
> // Robert
>
>
> On 02/27/2018 02:15 PM, Bruce Ashfield wrote:
>>
>> We need to document the reason why the checksum changed.
>>
>> What happened to trigger the bad checksum ?
>>
>> Bruce
>>
>> On Mon, Feb 26, 2018 at 8:55 PM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>>
>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>> ---
>>>   recipes-devtools/python/python-pyparsing_2.0.1.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>> b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>> index 2ef6df9..c19f137 100644
>>> --- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>> +++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>>>   LICENSE = "MIT"
>>>   LIC_FILES_CHKSUM =
>>> "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
>>>
>>> -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
>>> -SRC_URI[sha256sum] =
>>> "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
>>> +SRC_URI[md5sum] = "37adec94104b98591507218bc82e7c31"
>>> +SRC_URI[sha256sum] =
>>> "0007cd3f008eba4a203f1f6b4b133ddc352552c8808b694c88c23db56416e4e4"
>>>
>>>   inherit distutils pypi
>>> --
>>> 2.10.2
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

