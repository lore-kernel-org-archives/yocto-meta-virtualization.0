Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 59FC2E00B9C; Mon,  9 Apr 2018 07:25:17 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F4BCE00AE6
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Apr 2018 07:25:15 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id q9-v6so6843264lfk.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Apr 2018 07:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ASK3h6Ayt6wT3cOl9FxYK0f07I0MF8a0orQQu3cfQxY=;
	b=M8JOGvXgiKx0fT362At0hhMPvKyWuG/gKHHZt1k2k/w8vPWdDQj4mAZIOu55+T3vs0
	nWv4jaPINtkISOlVV5GWVA6Ym7I5hL1l/PGBTl93dteMGd2Jx7Ym7Sqwxlawcbo3V8vM
	1Wu94eK/s03H/sWGKeNeM+OLCWrJfah3pBdzOH6E9pOy/Yn3flmPgyyTG3A+UnnXuchX
	JvSFivLX/VhHP52WSHOUk4Dt08LogjkX4ha0Ph+fxT8YQMf1RNyLFPLAeP5YdVw4j6NI
	EL1AuqyENBSwiLvxa6xFRNODYD4qRP54zZR5uq067upSHVWy54FHLRA5nC7gnWCgqv9A
	GMiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ASK3h6Ayt6wT3cOl9FxYK0f07I0MF8a0orQQu3cfQxY=;
	b=sh608DhmUqJoxWY/wjmDO6duEk2Q5J/kj48rZLqlOFKJf2nUYVX9Slse1cTnrJ61tj
	GXhyuQXFDVxyBS4VzZkggd3cUbu1RW+7flpA5hpARyxAxqGy6iW6hdn7v2HbErhYwxKh
	ewdR8obMVv9PgLLp9CErnL9k8SqzsvkI/W34YdMee0Aaw/vP2Z4Pr0ssWa0tDoGuk2ld
	rnkh/MRE7Sz7+3o7fIcnvV3dAjuy1I6kOb11vBdSsLraE4CSqgOb256YjN1EJlCg/sTN
	yqUkYyBw8lJaCM/4yUK78s2GyM4dU3Bl/dyZ+Hg84AiIIFQJLHqRRG0foskExgqvRm+W
	AWTg==
X-Gm-Message-State: ALQs6tC33xZDsKV9QwGrh3hXC0Kso2HoM61Mem2n86SBkh7Dtipdn067
	O0fSvxjLY8GFbKZSN0FnI7uxDrn6wbKPixKwiEM=
X-Google-Smtp-Source: AIpwx48BxEmxqLNwBjdW7Z3SDFz7N/UbxGCcmrgP29Qbk7g5kStOOGJx2hsGQbXKhz0cDs/+FrAT4DOUY/9umj7hOLg=
X-Received: by 10.46.128.84 with SMTP id p20mr13069346ljg.12.1523283914929;
	Mon, 09 Apr 2018 07:25:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Mon, 9 Apr 2018 07:25:14 -0700 (PDT)
In-Reply-To: <355BE46A91031048906B695426A8D8E6173922CB@DEFTHW99EH4MSX.ww902.siemens.net>
References: <20180406134156.21533-1-pascal.bach@siemens.com>
	<CADkTA4OnjNg7NXbZ1GPWUv4Ajvim0TQBEr5dHc-pPo+2u0nYGw@mail.gmail.com>
	<355BE46A91031048906B695426A8D8E6173922CB@DEFTHW99EH4MSX.ww902.siemens.net>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Apr 2018 10:25:14 -0400
Message-ID: <CADkTA4NQGoRRsOxL9FisjV2Qz64AvmPRKiC5MxPK22hxF6bBSg@mail.gmail.com>
To: "Bach, Pascal" <pascal.bach@siemens.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 1/2] docker-proxy: add recipe for docker-proxy
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
X-List-Received-Date: Mon, 09 Apr 2018 14:25:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 6, 2018 at 10:23 AM, Bach, Pascal <pascal.bach@siemens.com> wrote:
> Hi Bruce
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@gmail.com]
>> Sent: Freitag, 6. April 2018 15:48
>> To: Bach, Pascal (BT CPS R&D ZG FW CCP) <pascal.bach@siemens.com>
>> Cc: meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-virtualization] [PATCH 1/2] docker-proxy: add recipe for
>> docker-proxy
>>
>> On Fri, Apr 6, 2018 at 9:41 AM, Pascal Bach <pascal.bach@siemens.com>
>> wrote:
>> > Before docker-proxy was built as part of the docker-recipe but there
>> > in some situations when built for x86_64 under x86_64 it incorrectly
>> > linked against host libraries.
>> > This puts it into a separate recipe that makes use the go.bbclass to
>> > build the binary properly.
>> >
>>
>> As I hinted, I'm going to figure out how to integrate / fix this in the main
>> docker recipe.
>>
>> Having the various SRCREVs managed in multiple recipes is a maintenance
>> pain and recipe for runtime errors.
>>
>> I'll dig into what the go class is doing that is so different from what I've been
>> trying.
>>
>> Can you provide the output of your properly linked docker-proxy, so I can
>> use it as a reference ?
>
> I'm not sure what you mean by output?

I sorted things out using the libnetwork Make infrastructure and some
spelunking into go internals.
I now have it using the sysroot infrastructure, and I can follow along
with SRCREVs and any build internal changes to libnetwork:

file bin/d*
bin/dnet--amd64:         ELF 64-bit LSB executable, x86-64, version 1
(SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
for GNU/Linux 3.2.0,
BuildID[sha1]=bc6059d72a9d6224049542214427bf3c62a41866, not stripped
bin/docker-proxy--amd64: ELF 64-bit LSB executable, x86-64, version 1
(SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2,
for GNU/Linux 3.2.0,
BuildID[sha1]=c52ed7c3b28284a683ade6b4c46ca4f6bad8d1fb, not stripped

Cheers,

Bruce


>
> Pascal
>
> BTW you can also ping me on IRC #yocto as bachp might be quicker to clarify
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

