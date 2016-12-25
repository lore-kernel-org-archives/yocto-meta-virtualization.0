Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 235E7E00823; Sun, 25 Dec 2016 10:19:40 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C83CFE006D8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:19:36 -0800 (PST)
Received: by mail-yw0-f196.google.com with SMTP id b66so19637142ywh.2
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=bnEjVc7WyR//0fiiI0K2FuBmp3DtBBrPOvz4mvZ3/ho=;
	b=b8iVi1ndQg11B7tTL5UquinbsmiUHa1k2tlRhwgYuZoG5aMhTald3M0vzIkJA5ECxj
	/OaGKeU98uMsEmY24qIkbv0cDJh6Qil9q+GUdJPuWDFpvDK6pv40f4efv2tnjPmJCIqk
	5sxc/J3dbn3+llznL51KFYh9KeQ5KECivDLd7SHJWpY7iimez1oBqUtoEoFDFnxCEOke
	yHTbQrOrDfWw1I/1GEFvAzCrPTqKurBQB05+qzPuGCsp/mEpj6iv6SfaoUjJOaHjGI2g
	t8fCYkdrzOXMcGhBpvKWLctDDvIEUPRq4VKS4mLx5Kep/n8KT5gaBqustusGMB2iSdEK
	LKcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=bnEjVc7WyR//0fiiI0K2FuBmp3DtBBrPOvz4mvZ3/ho=;
	b=QRAnacr60sYEm6WmvaBPqacp6nP6ep89z2o1uigCW7GHB1vvJmv7gmuv0j7f1TyhxU
	ACTZlNB0hw2OOZWM2cAgwMzTLNtIn32ACUUds4SSbY9ps+J7F5/X5wfQEQjg604wxXYU
	eMi2Eev1kRAg6f9ulAgjDkr1GaOG+qXP9OlhVAP49PqX8x3xtnv3fWts31j/UKQldvoe
	3yhHJTXYsBDIurPn62bT9HCsPZvm2fNH35klH610GgdifXbgswdOFYVMLLe6+QadozjB
	2FmFPjNqs3avFxDqocRBOSUlEemvbTCMT8gY73bNapa9nij/jxcM0Id2BfwfKCwqPg3v
	Astw==
X-Gm-Message-State: AIkVDXKc+7tEcsjeCHf3JUq06s+JRhfDrKOlff/Ps5o14yDziYsrZJ0nIhUSA+BZG5RpKAKbNKkAhCZmVp4cJA==
X-Received: by 10.129.174.20 with SMTP id m20mr11505259ywh.152.1482689975818; 
	Sun, 25 Dec 2016 10:19:35 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:19:35 -0800 (PST)
In-Reply-To: <CAPuovEJhj8V4L7VEBxQUhyTdrYD5y-UmUCHzaZOEoi+MqLUFag@mail.gmail.com>
References: <1404741470-4980-1-git-send-email-Alexandru.Vaduva@enea.com>
	<1404741470-4980-2-git-send-email-Alexandru.Vaduva@enea.com>
	<CAPuovEJhj8V4L7VEBxQUhyTdrYD5y-UmUCHzaZOEoi+MqLUFag@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:19:35 -0500
X-Google-Sender-Auth: VB8DPSrjTbtQmUFCexD70OxjIGM
Message-ID: <CAPuovEJV0H1MktNX4DjedS8qKKPZ4Wn+YawLu70d+SDRgr2q=w@mail.gmail.com>
To: "Alexandru.Vaduva" <Alexandru.Vaduva@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] multipath-tools: added support for autotools-brokensep.
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
X-List-Received-Date: Sun, 25 Dec 2016 18:19:40 -0000
Content-Type: text/plain; charset=UTF-8

Please ignore my previous email. Gmail decided today to display emails
from 2014 at the top of my meta-virtualization folder. Sorry for the
noise.

Mark

On Sun, Dec 25, 2016 at 1:07 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> On Mon, Jul 7, 2014 at 9:57 AM, Alexandru.Vaduva
> <Alexandru.Vaduva@enea.com> wrote:
>> Separed build dir caused problem, the autotools support needs fixing.
>
> It is best to take the time to describe the problem in the commit log,
> no need to keep it a mystery.
>
> Mark
>
>
>>
>> Signed-off-by: Alexandru.Vaduva <Alexandru.Vaduva@enea.com>
>> ---
>>  recipes-extended/multipath-tools/multipath-tools_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/multipath-tools/multipath-tools_git.bb b/recipes-extended/multipath-tools/multipath-tools_git.bb
>> index 633b9f2..e2076d3 100644
>> --- a/recipes-extended/multipath-tools/multipath-tools_git.bb
>> +++ b/recipes-extended/multipath-tools/multipath-tools_git.bb
>> @@ -15,7 +15,7 @@ SRC_URI = "git://git.opensvc.com/multipath-tools/.git;protocol=http"
>>  SRCREV = "d3683ab18b386e9b3b54b59a122c689e9ebdf5cf"
>>  PV = "0.4.9+gitr${SRCPV}"
>>
>> -inherit autotools
>> +inherit autotools-brokensep
>>
>>  EXTRA_OEMAKE="LIB=${libdir} exec_prefix=${exec_prefix} libdir=${libdir}"
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization

