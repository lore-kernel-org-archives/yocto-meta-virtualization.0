Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DACE1E00796; Mon, 11 Aug 2014 09:27:04 -0700 (PDT)
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
	*      [209.85.217.175 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f175.google.com (mail-lb0-f175.google.com
	[209.85.217.175])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ECF42E004F2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Aug 2014 09:26:55 -0700 (PDT)
Received: by mail-lb0-f175.google.com with SMTP id 10so5995352lbg.20
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Aug 2014 09:26:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=3gvRx9+W/r8o7fgalDYzYQDa8lSqEG8tf0wqkfc+spc=;
	b=Dg7y1g43UQ9mIhcrp3RAw9yB/77j3JL3iE1iqr9NS93WBoFYPsIKW/uE3hjoxKCacq
	s4GQn96ys45ONk7bbNwX4HJhBqc2js5Vp3n9XeTJPDZNY8dL9/YOQ1YnLyoPKyU9Mpm8
	rVkso/tK+/rPr271TiSKxf2SYT580GLigQnCClsZ+jqetMOtAtFMKjPiEzHLHqUa9w1q
	mRW3iAt19/Sj4rsalhhqJw1Uzw/Pt1i6M5tKG9Jj4KbtMA183X0v+rS5DaK+MYe1o9tO
	AqWcQbTRwewzf2EoIOjPHzVTY+XqY2XFcB72er8OHo4BMgEGa1rtS2MRHYexldoNEskM
	BYrg==
MIME-Version: 1.0
X-Received: by 10.112.98.198 with SMTP id ek6mr37151467lbb.22.1407774414703;
	Mon, 11 Aug 2014 09:26:54 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Mon, 11 Aug 2014 09:26:54 -0700 (PDT)
In-Reply-To: <3167746.0YZo51VxAQ@peggleto-mobl5.ger.corp.intel.com>
References: <2423043.jtrRQzBGRa@peggleto-mobl5.ger.corp.intel.com>
	<CADkTA4OcnP+Q3wvVatb-_Ny4nHjycnQ=FhMuCQwRD2p_cWqrbg@mail.gmail.com>
	<3167746.0YZo51VxAQ@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 11 Aug 2014 12:26:54 -0400
Message-ID: <CADkTA4MdxWYh0vWbXM6f+-4=LwJ2E0UT8MdwWpzT3BcV9Q21Ng@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-openstack Python support recipes
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
X-List-Received-Date: Mon, 11 Aug 2014 16:27:04 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 12:17 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 11 August 2014 12:09:18 Bruce Ashfield wrote:
>> On Mon, Aug 11, 2014 at 8:43 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
>> > There are quite a few Python support recipes in meta-openstack. Now that
>> > the meta-python layer has been established, would it be reasonable to
>> > move those that are generic and not related to virtualisation over to
>> > meta-python and make meta-openstack depend upon that, so that those
>> > recipes can be (a little) more easily reused by others?
>>
>> At this point no. I intend to keep them all in meta-openstack, since the
>> version and cadence is tightly coupled to the core components, and
>> spreading them across multiple layers is a recipe for chaos.
>
> OK, understood - so I guess that being the case we may end up having some
> duplication between there and meta-python. Not that I intend to do any
> wholesale copying, but if we need a dependency or if it makes sense to add a
> recipe currently in meta-openstack to meta-python for the purposes of making
> it more widely usable, I don't see much of an option but to have it in both
> places.

Yep, and that's fine. Just drop an email if you do make a copy, and maybe some
can move. But generally speaking, openstack breaks in weird and wonderful
ways when dependencies change, so I can't be at the whim of another layer
updating and causing continual breakage.

At some point, there is such a thing as "over layerization", I've been down that
road before :)

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

