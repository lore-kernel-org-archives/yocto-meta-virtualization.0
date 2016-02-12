Return-Path: <cjp256@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4CA1CE00C0B; Fri, 12 Feb 2016 07:25:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (cjp256[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.213.179 listed in list.dnswl.org]
Received: from mail-ig0-f179.google.com (mail-ig0-f179.google.com
	[209.85.213.179])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2401AE00C05
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 07:25:25 -0800 (PST)
Received: by mail-ig0-f179.google.com with SMTP id ik10so12256795igb.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Feb 2016 07:25:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=v62XkZoyYwMrNDWhNnY+lyHWBn4RO6DXL1lGGxaRnRg=;
	b=KpwCP4WkNGx582L70eazgFws9bK+/RWrWa4+s4cHXubuWxXDM6vvsaQ9CzC0qscvLt
	vxQkgz7xD+K2qgz9ppf4FTXTVBU5hFbdWQh1nCdIPuQGEVJG1tbZYIi8DycCZ2EUt1ym
	Dt2qwCeApjNiaTO2jj1zrAfPLrzq9IuWa+ifwuw+ElLzr0LhZ9C5sVGapSlqwjTx8abA
	YUVo0WlW5+OGPvPBjdj3ENilA87nir8mReKG8KVW+AGcYzOJlsZX6Lp8f9uiS6LFUN24
	2eAnB0zhq3F+5reCU0/6UOamL3UnsLKGqg7fAXJn2NwgQQwt8Cr+PtLFFdOOgj8iSfJ5
	FJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=v62XkZoyYwMrNDWhNnY+lyHWBn4RO6DXL1lGGxaRnRg=;
	b=HRH1LJDnAOjsmAgtXw2lulkjXUf+H7kJtN94KO/5URp33bZ16c1xuyF2d5FuTR7Yq8
	y4Ay/Q5PRDTRvZt0bE3Ag9libIeoJJb6nzeAMFjc3NOJdQopPlk7Hyvs+zbySFhu1Rlg
	NFA1Wd79MkaD3UNKB4gHl4xGHkP1aWz5LDxuC1TGLWcrTCVNe188LBZsiUnu8BcwGMKR
	3fNRxbSEuksmRMVEoIOAGOIDUJ+ABD9m1NjxwRdBx6agAp8JfAllS4TbeQ2/a8x5RjNZ
	w9pBt9NPLyu35dTvAk986Ky0gIxpIYlCUfDiTbEbAFBcJwDQKR3xqCuwXrs9897KiKYX
	eWqg==
X-Gm-Message-State: AG10YOS3cfAPtr6oz8xvo5JEh4p84cyrGlmUTi8JkMCX9MtRNw9hzNTYi5wJHsVqt082WNi+cwh1t4Nf9x/0xQ==
X-Received: by 10.50.143.1 with SMTP id sa1mr3617990igb.15.1455290725231; Fri,
	12 Feb 2016 07:25:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.79.125.142 with HTTP; Fri, 12 Feb 2016 07:25:05 -0800 (PST)
In-Reply-To: <56BB43D2.10004@tycho.nsa.gov>
References: <56B10C90.8070709@tycho.nsa.gov> <56B126BC.3070304@tycho.nsa.gov>
	<CABZSBQd+vLUkLi-1MPYN9-frgOeUygDuZsDezQWmktiGhkACMQ@mail.gmail.com>
	<56B3BA85.7020008@tycho.nsa.gov> <56BB43D2.10004@tycho.nsa.gov>
From: Chris Patterson <cjp256@gmail.com>
Date: Fri, 12 Feb 2016 10:25:05 -0500
Message-ID: <CABZSBQeVDmq6HcgYv4Rme0emy1aCdYvnr8Nx+L-MSn55+QYm7A@mail.gmail.com>
To: "M. Gregory" <mbgrego@tycho.nsa.gov>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: stubs-32.h not found
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
X-List-Received-Date: Fri, 12 Feb 2016 15:25:31 -0000
Content-Type: text/plain; charset=UTF-8

Sure thing. :)

On Wed, Feb 10, 2016 at 9:06 AM, M. Gregory <mbgrego@tycho.nsa.gov> wrote:
>
>
> On 02/04/2016 03:54 PM, M. Gregory wrote:
>> On 02/04/2016 03:52 PM, Chris Patterson wrote:
>>> I repro'd this with a fresh tree.  Instead of the depends approach, I
>>> simply moved the step between do_configure and do_compile, which
>>> should be OK?
>>>
>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>>> index 5555ed3..d35bc3f 100644
>>> --- a/recipes-extended/xen/xen.inc
>>> +++ b/recipes-extended/xen/xen.inc
>>> @@ -782,7 +782,7 @@ do_stubs() {
>>>      fi
>>>  }
>>>
>>> -addtask stubs after do_patch before do_configure
>>> +addtask stubs after do_configure before do_compile
>>>
>>>  do_configure() {
>> yes.
> Can you submit this as a patch?
> -Machon
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

