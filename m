Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91DA3E00D07; Tue, 22 Aug 2017 23:43:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 29CD5E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 23:43:21 -0700 (PDT)
Received: by mail-yw0-f194.google.com with SMTP id s143so492247ywg.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Aug 2017 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8nai/ZyRRaD7UiILwcWU+il3A7umQpaTVHxNa4MLit0=;
	b=IS2ku9UCQO1bMKHZmZsnxeLLl5q/L/lI1t2c5ndg2UgzI177ivF9nWlue3EYVzaLQc
	/T1S1hjKHbZ60W8YLq5na7Z53F0uj0RjnwhbVts6VaVSY7tkK8DPmtkHEWp7+67+q5En
	dWGiLLjD8l/4eO4N6LENSLioUG4j7pXAQxj/sR6rpw/WgsTmUu2INz3g/TZJgeLMN/+p
	mCZEkaih5dwN0IkrPqVHHZi2yMdzWhaJhTTU2IKjZGbjWe/How+QIVBIVCi1sEFosqeK
	CV91LDFIZ2AJdTYCgjL7PjhH8q5L4mpVMnnErH+Ar6x9NKHPnjRPex+aVj7LbIZrybt+
	51RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8nai/ZyRRaD7UiILwcWU+il3A7umQpaTVHxNa4MLit0=;
	b=G3sbyBLtp1/RKCHSQbqt+NcHNcvcoayCnii4qdb0kXtY+rj+++QiTgt2vXd6KcPNR1
	LF3VXa4pydHQk0/6yDQgaiI4z0LHSS7+jgLqdyVMrb3nEdC7DGVn+y6TOYD4UGQm39iq
	sj2cbAJBDo0fCd/XK2LsVgUfPSCb7gYdJI3ALm0ulB+EC4gtHabxcSB7cFlmgw+42JG1
	XN/JxOP+EPl9K8WcOj35t1Cv66uCcouyKPY4uEP32uWpLwOvXFSHbB8qRkDWJbZ3eed4
	oNOh9RLOJGMMecyFqONm0gLfaSG54Tj0Ic1v1afLFJRT8QthNn288l0xs3QdGud53xEZ
	Z80g==
X-Gm-Message-State: AHYfb5h1kslHjLOJLGW3PCprh8nqOn5oMjIT9mQ3RSsLKGQqAEt2N2dA
	c6hO7WwJWbOK2mTQepmSHwbcaAyMP+egytw=
X-Received: by 10.37.36.144 with SMTP id k138mr1232189ybk.211.1503470601133;
	Tue, 22 Aug 2017 23:43:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.175.4 with HTTP; Tue, 22 Aug 2017 23:43:20 -0700 (PDT)
In-Reply-To: <CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4MGpGfw_-mByH=VyUeg1a6pfMugww4YkSS2PfxJ02e-tQ@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Tue, 22 Aug 2017 23:43:20 -0700
Message-ID: <CACMJ4GZumvFVR4FkJ9UO1b9SzL+fxwj4kcrGHsgayksOQcMngA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 1/4] vgabios : extract biossums tool and build it separately, native
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
X-List-Received-Date: Wed, 23 Aug 2017 06:43:22 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 7:42 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:
>> From: Christopher Clark <christopher.clark6@baesystems.com>
>>
>> The biossums tool is used to generate the vgabios build product.
>>
>> This patch:
>> * adds a separate recipe "biossums" for the tool
>> * makes the vgabios recipe depend upon biossums-native
>> * makes the vgabios recipe use the native binary rather than a locally
>> built one
...

>> +PR = "r0"
>
> Minor issue, no need for a PR value in a new recipe. The PR server will
> handle it.

Oh yes - thanks, good catch.

>> +
>> +do_compile() {
>> +    oe_runmake clean
>
>
> What actually happens if the clean isn't run before each compile ?

It's a good question. Here's where I see different behaviour with and
without that clean:

bitbake -c cleansstate vgabios biossums-native
bitbake vgabios

With the clean present, building vgabios will trigger biossums-native
to be built to satisfy the dependency, and vgabios's compile will
succeed. Without the clean present, biossums-native does get its build
triggered, but the vgabios build fails with:

"make: execvp: biossums: Accessing a corrupted shared library"

I think if bitbake has calculated that running the compile step is
required, then it needs to actually do the compile and not have "make"
make its own local decision to skip it, and the clean forces that to
happen.

Christopher

