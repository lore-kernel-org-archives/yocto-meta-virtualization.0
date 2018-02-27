Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0D89EE00E0B; Tue, 27 Feb 2018 06:07:49 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2AC62E00D91
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Feb 2018 06:07:46 -0800 (PST)
Received: by mail-yb0-f195.google.com with SMTP id v8-v6so6540000ybk.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 27 Feb 2018 06:07:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hMvZ1bBDBlTl08Q8XhxypssFAjopH3QSKF9+cyCX7tA=;
	b=R3Pe9ubVW3sJVeB/vALbZ2RZ2JToQVJE5uVKSjP0Kcj+7IlUiWoBIN3aPdLB0y00j4
	SBGEz/Be+g2BZXCVHsEuSIfPH0LHDe/LQKipnjKCf+kn4RwAf6SaVNmKITagakPzsdE7
	aanKJBtjBfLyhEaRH7BKNZWNsfI6fe07m4Bmf49tjBjdJ+L/pMm+sTlwwC16VxRne2Bq
	CHReBsRekVZUoxPMuYGctSqmEmDkCUOwrB3NaE4Dt8RPgkCLfKQUjzci6HuMeVqY31r+
	5dRAo1ySAiADKrE2HW4RfsNUWpWEoJF4ECO4536AcUS3lWFCZNYFI5xu2Lwc+/lflGE+
	SVjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=hMvZ1bBDBlTl08Q8XhxypssFAjopH3QSKF9+cyCX7tA=;
	b=P9QVBytGexYkHQS/emZ90RNALOp3vq246Mny+LtV2NHym/Nl3GmIPooVJrnwpsacFe
	x7LJ1KtyIgqJMt05bc5KilxCexdi1cxIYnFoEX+BzSXGYs+C+FYYI9vpZHPJ0vJdo96F
	kpwgCfokH1rCM4E19ssl3bs6u/1HHwWJ4JXXLu+RkTawCx8orAk9Q3diLCjAwyaQac9P
	Ulx4s65+FQKXYAOn7ONZZ99Hv8Ogmu5OVY1LuVIycooJ0vyq22ZlpfrvLk4drWkUG3Qx
	22U24KyoJASJH0bBXniVReMz/3m/BloYmEnvLBIw3hnVCzt9FuZGpp9MKpao+GlXseLD
	S3Ug==
X-Gm-Message-State: APf1xPCeG7gpqMzoUlQlFCuo14AxH1lBB7qD8PO+d1Niy2h7FZJD/jmc
	Ln2YLUFTuk9/4OLfhjDj8I+wZ6FpZbnlF/bl7eQ=
X-Google-Smtp-Source: AG47ELv3CJ0TjJQ4c3aw62YuLrKPUOEkvyAzh46iQwA/WFWE0j2sUEduhp3OqUVOhoHwkmtLmSZLVvfJwRnzPUEtWpA=
X-Received: by 2002:a25:1907:: with SMTP id 7-v6mr9337805ybz.129.1519740465787;
	Tue, 27 Feb 2018 06:07:45 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:c6c1:0:0:0:0:0 with HTTP; Tue, 27 Feb 2018 06:07:45
	-0800 (PST)
In-Reply-To: <CADkTA4Pc7q3FoeWxgLSsP3=kC03Ho09pj8=YzR9OpTDN_75UjQ@mail.gmail.com>
References: <20180227015512.27675-1-liezhi.yang@windriver.com>
	<CADkTA4OXm3Ji7qM7=Ra7J1qH14zArfUU5kyAUDe5FzfwaMSRJA@mail.gmail.com>
	<30bb08d4-12e5-7474-7ef5-42fdf9afec70@windriver.com>
	<CADkTA4Pc7q3FoeWxgLSsP3=kC03Ho09pj8=YzR9OpTDN_75UjQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Tue, 27 Feb 2018 09:07:45 -0500
X-Google-Sender-Auth: 35507hhL34AR01H-TSLHcDolnvI
Message-ID: <CAPuovEJQkoaGR=o6BStFSjwKtXvZQXw4HJQpDMfogm9L8kFXBw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-pyparsing: fix SRC_URI's checksum
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
X-List-Received-Date: Tue, 27 Feb 2018 14:07:49 -0000
Content-Type: text/plain; charset="UTF-8"

Sorry about that. It appears all my builds were using the recipe in
meta-python so this was missed.

Mark

On Tue, Feb 27, 2018 at 8:00 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> No worries. I very well could have missed it .. things like that
> happen from time
> to time :D
>
> But either way, thanks for the v2, it is now merged.
>
> Bruce
>
> On Tue, Feb 27, 2018 at 1:46 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
>> Hi Bruce,
>>
>> I remembered that I had sent this patch on Nov. 16th, but I couldn't find
>> it,
>> maybe I failed to send it. It was because the source was changed from .zip
>> to
>> .tar.gz:
>>
>> commit 3d512115129e2cea97067d23cb72fea62b70dd39
>> Author: Mark Asselstine <mark.asselstine@windriver.com>
>> Date:   Mon Nov 13 16:48:05 2017 -0500
>>
>>     python-*: switch remaining pypi recipes to use the pypi class
>>
>> It had been wrong for more than 3 months. I will add more comments and send
>> a
>> V2.
>>
>> // Robert
>>
>>
>> On 02/27/2018 02:15 PM, Bruce Ashfield wrote:
>>>
>>> We need to document the reason why the checksum changed.
>>>
>>> What happened to trigger the bad checksum ?
>>>
>>> Bruce
>>>
>>> On Mon, Feb 26, 2018 at 8:55 PM, Robert Yang <liezhi.yang@windriver.com>
>>> wrote:
>>>>
>>>> Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
>>>> ---
>>>>   recipes-devtools/python/python-pyparsing_2.0.1.bb | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>>> b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>>> index 2ef6df9..c19f137 100644
>>>> --- a/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>>> +++ b/recipes-devtools/python/python-pyparsing_2.0.1.bb
>>>> @@ -4,7 +4,7 @@ SECTION = "devel/python"
>>>>   LICENSE = "MIT"
>>>>   LIC_FILES_CHKSUM =
>>>> "file://LICENSE;md5=fb46329938e6bc829b256e37d5c1e31a"
>>>>
>>>> -SRC_URI[md5sum] = "dc7036a6f1ab01c3baed3d97af8d77c0"
>>>> -SRC_URI[sha256sum] =
>>>> "7e1766ee747cca79fe172b670fd53ef58fc55d2b1804fd6c66d857abb62d143a"
>>>> +SRC_URI[md5sum] = "37adec94104b98591507218bc82e7c31"
>>>> +SRC_URI[sha256sum] =
>>>> "0007cd3f008eba4a203f1f6b4b133ddc352552c8808b694c88c23db56416e4e4"
>>>>
>>>>   inherit distutils pypi
>>>> --
>>>> 2.10.2
>>>>
>>>> --
>>>> _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>>
>>>
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

