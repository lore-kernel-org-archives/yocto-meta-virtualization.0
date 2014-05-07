Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5ED29E00724; Wed,  7 May 2014 14:24:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.217.172 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f172.google.com (mail-lb0-f172.google.com
	[209.85.217.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 22E08E006EF
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 May 2014 14:24:49 -0700 (PDT)
Received: by mail-lb0-f172.google.com with SMTP id l4so2289534lbv.31
	for <meta-virtualization@yoctoproject.org>;
	Wed, 07 May 2014 14:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=XL24qxT4PnkxIuFuHFQp1N25yEnuiG7PjGCLAhdVbOg=;
	b=x/iXq1rIuFydyh11F4Jq1Akj2M3BmE0pEPLA6QxBnBJXa+9w7K81NuGE9s6Se6ilSX
	uG1n5uiJQDtqHrkQVeyybcmR0ZCGHOUwXg9bOzY+xzTOe1AGmI8dF98Va6CCUO/2aJVn
	HNahhCWLIpudxi6v1R4lUeruBl8I1jjMaiH/RBnw1CjjLK2X9auwOHIjq1fXA874vTM3
	F0PqMbriAz5X+3DAmW0AgZSNu6ugTRoY8K40PULUxgxqQpK7I5cg5kV1afmTwKQfRQdx
	G35ofJQqKzOvYNKL/NzlaOEoyUV0h6Zjq8hlZA5kJK+lhOIGzqokbWayVth8soXYVgGI
	UV5A==
MIME-Version: 1.0
X-Received: by 10.112.14.5 with SMTP id l5mr15589601lbc.12.1399497888336; Wed,
	07 May 2014 14:24:48 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Wed, 7 May 2014 14:24:48 -0700 (PDT)
In-Reply-To: <007BD92917A2324FA403BCF9A464CF84565B7244@ALA-MBA.corp.ad.wrs.com>
References: <20140507124513.GA18437@iapetus.enea.se>
	<CADkTA4NXTB558rHETszFB9WuRwKEWRvr7gwRkDfhJB_fMhwxgA@mail.gmail.com>
	<20140507131642.GB18437@iapetus.enea.se>
	<CADkTA4P1UoOQP2FLQVv9_6JnLSKPmq4nYwHy2f1aPVR56sk_fg@mail.gmail.com>
	<007BD92917A2324FA403BCF9A464CF84565B7244@ALA-MBA.corp.ad.wrs.com>
Date: Wed, 7 May 2014 17:24:48 -0400
Message-ID: <CADkTA4NJ36Hm57h0C1qWjvJaGNp7N8vvCXsb2UD+wBDx+Z05_Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Slater, Joseph" <joe.slater@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: libvirt requires libssh2
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
X-List-Received-Date: Wed, 07 May 2014 21:24:55 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 7, 2014 at 2:53 PM, Slater, Joseph <joe.slater@windriver.com> wrote:
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Wednesday, May 07, 2014 6:21 AM
>> To: Josep Puigdemont
>> Cc: meta-virtualization@yoctoproject.org; Slater, Joseph
>> Subject: Re: [meta-virtualization] libvirt requires libssh2
>>
>> On Wed, May 7, 2014 at 9:16 AM, Josep Puigdemont
>> <josep.puigdemont@enea.com> wrote:
>> > On Wed, May 07, 2014 at 09:10:47AM -0400, Bruce Ashfield wrote:
>> >> On Wed, May 7, 2014 at 8:45 AM, Josep Puigdemont
>> >> <josep.puigdemont@enea.com> wrote:
>> >> > Hi,
>> >> >
>> >> > A default dependency on libssh2 for libvirt was added recently. Where is libssh2
>> >> > provided? I can not find it in either meta-oe or oe-core.
>> >>
>> >> Joe ? Did that leak in from something local to you ?
>> >>
>> >> Regardless, I'll revert the change for now.
>> >
>> > Maybe we can keep PACKAGECONFIG[libssh2]
>>
>> If that doesn't map to anything obvious in the yocto ecosystem, then I wouldn't
>> want it to be available at all. Otherwise we'll pollute the options
>> with internal/private
>> fields in a public recipe .. which isn't what we want.
>
> libvirt configure does check for and will silently use libssh2, so it might be good
> to tell it not to.

That doesn't answer the question. If it checks and silently uses it, but yet it
isn't in an obvious Yocto layer .. it'll never find it, so we don't
need a package
config.

If it is detecting it from the host, that's host contamination and a bug that we
don't fix via packageconfig.

Bruce

>
> Joe
>
>
>>
>> I obviously should have done a build test on this one, but instead
>> assumed it was safe
>> ... lesson learned.
>>
>> Bruce
>>
>> >
>> > /Josep
>> >>
>> >> Bruce
>> >>
>> >> >
>> >> > Thanks,
>> >> > Josep
>> >> > --
>> >> > _______________________________________________
>> >> > meta-virtualization mailing list
>> >> > meta-virtualization@yoctoproject.org
>> >> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>> >>
>> >>
>> >>
>> >> --
>> >> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> >> thee at its end"
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

