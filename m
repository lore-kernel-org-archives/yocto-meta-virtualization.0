Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 02333E01149; Fri,  6 Jul 2018 20:20:07 -0700 (PDT)
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
	*      [209.85.215.68 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f68.google.com (mail-lf0-f68.google.com
	[209.85.215.68])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 373F1E01141
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Jul 2018 20:20:07 -0700 (PDT)
Received: by mail-lf0-f68.google.com with SMTP id u202-v6so11233694lff.9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 06 Jul 2018 20:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OJRDui4uDBIi32oH9Z+Yt4ldVDcidUA+A3NFRyi0bxk=;
	b=WMYehoRpLHZUnmDDqzNZWVDFTFGPPeHO82pIyL4N+/sZXggyMgQjmWYv458CSNn/0I
	IggyZgnAiC8mbWdfm4hlZ/lKDZpnxOVJFK55xuYBSpNUFRtNecbcHzSgErGMiEGL0Wfi
	oNOzR+0TKsl273Wd+0pdmC2ENqP79i8rqoeTF418ZwmwgGiX9y9jU2HEYZHvsXSRCWOQ
	bJei4tyCXfdSDHnOET5r6bzBMx17Q/PS7Zsq+fR+2nio0ewg/a4nQVR9g5kDjsfGiyFQ
	WJ8om1lzg0Y1wWGjDJxI2w5A1v3H06OSmVrNosSx+MbXqIk09P9aGUFl3GYSNpbr5JkD
	HrYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OJRDui4uDBIi32oH9Z+Yt4ldVDcidUA+A3NFRyi0bxk=;
	b=cAxoUXkTFZijsNr7WKRXM3/Y9cnnc+xHH6qNhZ5VTtWAkCyKLVnMk8KTHPex4VRTjo
	TvYa15TBCxE6V6aWTbN2d4pUF/HwfiMVGmHIPJTbM24oVEXUA/u+JpzOS6EKIAG/6Gyz
	qcnOMWKlbye1kEQTNkBAgXpNljz6+9/iVDimhjWgZrE4o7sgYOzgw40VhAYVouFKcIXR
	P2lIaKlspIm37suCgp2wPiWZNw3T8hlqWF7EF5zkMWQCXpwTBwdMXJR1QVh29bBy31jQ
	IQ6t/0nniF7pmsviV5ODk7ZtP8K7DNG1v4nhdjktY5VSKwdMjvmYnY87GE15bs+4ZVQp
	C61w==
X-Gm-Message-State: APt69E0sm3h/TWbrQNsLA4uX9taqHbz368AzjC/Yi+O3P/HNFez44JIy
	pONPfnar1IOyiWBskq2io2Vdd+04FD71CUvOSsuZ0A==
X-Google-Smtp-Source: AAOMgpf1ikPR+oqae8mZJrX4zHUeNpCOrY5LUOAcCZC0+pEnIzpTDyA5C6yqqtXyxZXUoCQF+AxH6+pjDsiuxrpaFPk=
X-Received: by 2002:a19:b598:: with SMTP id
	g24-v6mr9163569lfk.129.1530933606131; 
	Fri, 06 Jul 2018 20:20:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP;
	Fri, 6 Jul 2018 20:20:05 -0700 (PDT)
In-Reply-To: <fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<CADkTA4Mp-8+d64xKwzungUpN9cHZAKS1=m-uo-5DqR=SzPkmJg@mail.gmail.com>
	<fed63744-1059-e547-c8c7-7ed459508521@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 6 Jul 2018 23:20:05 -0400
Message-ID: <CADkTA4P0PWZP4-iKfPs6M8JTUGq3=EL4M+qifhwnj-cFAtfJDA@mail.gmail.com>
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
X-List-Received-Date: Sat, 07 Jul 2018 03:20:08 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 6, 2018 at 10:50 PM, Jeremy A. Puhlman <jpuhlman@mvista.com> wrote:
> Going back through the log I didn't see any indication of the problem it was
> trying to solve. I assumed it was
> a standard configure doesn't work with a split build. Currently it doesn't
> apply to master at all and I haven't
> seen any actual issues. What where the specific steps to reproduce?

It would have been added when an incremental build was performed. i.e.
a build, an update and the rebuild triggered the error. They only
appear sporadically, so there's no set of steps to reproduce the issue
consistently.

Unless this is actually breaking something, I tend to just leave them
in place rather than break some nightly build that someone may be
doing ..

Bruce

>
>
> On 7/6/2018 7:33 PM, Bruce Ashfield wrote:
>>
>> Can we log why it is no longer necessary ? i.e. which version of the
>> package has fixed
>> the old clean -> rebuild problem.
>>
>> Bruce
>>
>> On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com>
>> wrote:
>>>
>>> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
>>> ---
>>>   meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend | 1 -
>>>   1 file changed, 1 deletion(-)
>>>   delete mode 100644
>>> meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>>
>>> diff --git a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>> b/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>> deleted file mode 100644
>>> index 7447c56..0000000
>>> --- a/meta-openstack/recipes-support/libbsd/libbsd_0.8.%.bbappend
>>> +++ /dev/null
>>> @@ -1 +0,0 @@
>>> -inherit autotools-brokensep
>>> --
>>> 2.11.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>
> --
> Jeremy A. Puhlman
> jpuhlman@mvista.com
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

