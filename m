Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 78F71E00C4F; Tue, 17 Apr 2018 11:00:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.215.66 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C18AE00B65
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 11:00:22 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id r125-v6so11929298lfe.2
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Apr 2018 11:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=k+xKkiE73zRy+sDbBcuqboe4d/YETsMDD5spEuz/5kU=;
	b=bs8yrOOsJnvnzaWI7+9uNLONqe0kE8r/8STqgcRmdy6GRKWgrxdF06r0B1SRIUydG+
	PKHjCKdDd1Yu1Ilz/Tmc+aFSOySQxeB/elSjv8Gfy0+mnf0iVokkIGHlU5mgA3VQou2W
	gDcbjsO2z7rvcohPHv/reDdXld1Rb/wwc42zPPHIoCWQC8DOUWjEgpJHjBF3ZIiOe5SO
	63HTnPLHFV2AB6azRBTmYbglmIVe24KipR6NE5AIqEqtWsLrH6dcBJ5LZQIsdPeUFxSt
	2QV6hklwEREGE+Bh/7fPeBZTJVPkcmY6yUYwbvaeJvlwWjzCVRPolz/Q2rtSbPAQV3us
	8usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=k+xKkiE73zRy+sDbBcuqboe4d/YETsMDD5spEuz/5kU=;
	b=kIZBL2cdobeP/Dh16kIANrlUPxJuLdVjnhRvWFLT5iJFqX/9xc8Vq1KLIu3JwBml2R
	1NL1Tf+5NLmDZTnWjWRSTr+soeak/4mhEg8kHwks90j8bQkkdb3Xuy/MRBd/sV6O46tn
	1K42KQfTOmkULNKqQf6DwnJkTyHe9TtOgf1A0U6mvct/zVH4AK2uAEgw0DKesX6F8Pii
	NIkMwVZxiymKH/YT4V042Blj+UFjNZ15R4g2vU6Ec8BzrHNt3DnUORMph7Ff7bIr7Baj
	7Z2g+7M4TWNEvfW1LH2xYVWH/6FBQz9NrzdOrbQf9VA+F6BCdvKrJ1HYvDZgNhzzwE/T
	UuXw==
X-Gm-Message-State: ALQs6tCtC25yBFBwOMS3SViQTbHhRlGcUCyx/nBpWyYKNUtEGi46PeW7
	ZA97wFft+RchxoQU4zW4T2PjkhP3MdMMmq2t8DI=
X-Google-Smtp-Source: AIpwx48Z9rhh+FTJuwpkTKE0alKYO2fUQu7gNgJ3bKbC9wvuQMfk/HJZ9HVLfnFiatxO/Pb+3PX0AqlCNg7RHYMStEc=
X-Received: by 2002:a19:1895:: with SMTP id 21-v6mr2195540lfy.39.1523988021454;
	Tue, 17 Apr 2018 11:00:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.2.22 with HTTP; Tue, 17 Apr 2018 11:00:21 -0700 (PDT)
In-Reply-To: <CACMJ4GbGRod1n6fy-hsRcMLk3_XzOUNjbA4=yprhXPiHjYaxGw@mail.gmail.com>
References: <cover.1522956183.git.kurt.bodiker@braintrust-us.com>
	<CACMJ4GZUZhaVj3u2tP_HE_n21_MnGjot1reSpTrsuTQ2ZMwSvw@mail.gmail.com>
	<CACMJ4GbGRod1n6fy-hsRcMLk3_XzOUNjbA4=yprhXPiHjYaxGw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Apr 2018 14:00:21 -0400
Message-ID: <CADkTA4NLkWub-mwO0=mUj1zYYScOUBBSX273W9iwjWFJ6rcS-Q@mail.gmail.com>
To: Christopher Clark <christopher.w.clark@gmail.com>
Cc: meta-virtualization@yoctoproject.org,
	Kurt Bodiker <kurt.bodiker@braintrust-us.com>
Subject: Re: [PATCH v2 0/8] xen: Xen vTPM stubdomains
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
X-List-Received-Date: Tue, 17 Apr 2018 18:00:26 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 16, 2018 at 4:17 PM, Christopher Clark
<christopher.w.clark@gmail.com> wrote:
> On Mon, Apr 9, 2018 at 4:56 PM, Christopher Clark
> <christopher.w.clark@gmail.com> wrote:
>>
>> Kurt,
>>
>> I've reviewed the patches today and all the improvements look good.
>>
>> Unfortunately, in performing a build with the patches applied to rocko, I
>> encountered a link error when attempting:
>>   bitbake xen-vtpm
>
>
>
> This build breakage turned out to be a simple case of /bin/sh pointing to
> dash: in that configuration, "echo -e" is broken by dash's builtin
> implementation. Adding sed to inject the newlines makes it all work, as per
> this patch below, and then it successfully builds to completion.

So can someone send me a new version of the series, either with this patch
squashed, or on top of the queue ?

Bruce

>
> Christopher
>
>
> diff --git a/recipes-extended/xen/xen-vtpm.inc
> b/recipes-extended/xen/xen-vtpm.inc
> index c201f25..4e78d16 100644
> --- a/recipes-extended/xen/xen-vtpm.inc
> +++ b/recipes-extended/xen/xen-vtpm.inc
> @@ -52,7 +52,7 @@ do_configure() {
>      # 'sort -V' to natural sort version numbers
>      # 'head -n1' to capture the first line of output from sort command
>
> -    if [ "${PV}" = `echo -e "${PV}\n4.9.999" | sort -V | head -n1` ]; then
> +    if [ "${PV}" = "$(echo "${PV};4.9.999" | sed 's/;/\n/' | sort -V | head
> -n1)" ] ; then
>          sed -i "s/^inline/static inline/g" ${B}/vtpmmgr/*.h
>      fi
>
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

