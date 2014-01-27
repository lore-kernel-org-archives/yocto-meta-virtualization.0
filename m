Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f173.google.com (mail-lb0-f173.google.com
	[209.85.217.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 44511E006BE
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jan 2014 10:52:55 -0800 (PST)
Received: by mail-lb0-f173.google.com with SMTP id y6so4755314lbh.18
	for <meta-virtualization@yoctoproject.org>;
	Mon, 27 Jan 2014 10:52:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uVl97QcDI9d9TFeMeFSJXykj4FmG7nW/PmkRe9DvF5w=;
	b=QpWYcCS2RHvWjRRTQDl1voubgiLkfkQc6KISGWCY462jv2k4EN20BKvLxvJmTGVPBM
	+YdpjGoXTz9Ztb9MfCrX1XKC3UGpeTWy8ZvInE/AZOkF3p8TAsUBSMpPhEEIq36BlctX
	0gfFB4RjWfC6fJlcjsIRB+gu20QrnebuwIYDPBFUvLfKixIcMfUSF2kGJBLEnVqzSani
	coa/LRPclPxcFgJZJQEUwx0B4+UA2LiKb0TmZwtZK7JTmXEC2/VLWhyn1zxv4YV1BWNj
	kT4jN9ygdu8D96R3z2uh3ymPON0/Vmd3FzeRSypWKyJR+iOP3wrM9aKdSWcR8vYWpiHV
	0cRQ==
MIME-Version: 1.0
X-Received: by 10.152.242.165 with SMTP id wr5mr140101lac.47.1390848773870;
	Mon, 27 Jan 2014 10:52:53 -0800 (PST)
Received: by 10.112.77.170 with HTTP; Mon, 27 Jan 2014 10:52:53 -0800 (PST)
In-Reply-To: <CABZSBQexn0MUDxvn0HgK762y5hsyHMRwc+pV7sWmGso5x=33xQ@mail.gmail.com>
References: <1390447173-9925-1-git-send-email-flihp@twobit.us>
	<CABZSBQexn0MUDxvn0HgK762y5hsyHMRwc+pV7sWmGso5x=33xQ@mail.gmail.com>
Date: Mon, 27 Jan 2014 13:52:53 -0500
Message-ID: <CADkTA4Ob79gPsCjDwc9OGw0QV7NdV2CRUSaetorgrJW5cr2QSg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Chris Patterson <cjp256@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] xen: Add libgcc as runtime dependency of xen-xl package.
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
X-List-Received-Date: Mon, 27 Jan 2014 18:53:00 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jan 24, 2014 at 4:23 PM, Chris Patterson <cjp256@gmail.com> wrote:
> +1
>

And merged. Sorry for the delay.

Bruce

>
> On Wed, Jan 22, 2014 at 10:19 PM, Philip Tricca <flihp@twobit.us> wrote:
>>
>> Much of xl operates fine without libgcc but some operations complain
>> that pthread_cancel won't work properly without libgcc_s.so.1
>> installed. The exact text is:
>>
>> libgcc_s.so.1 must be installed for pthread_cancel to work
>>
>> Signed-off-by: Philip Tricca <flihp@twobit.us>
>> ---
>>  recipes-extended/xen/xen.inc |    2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 30d99f4..3acdc01 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -70,6 +70,8 @@ RDEPENDS_${PN}-xencommons = "\
>>      ${PN}-scripts-common \
>>      "
>>
>> +RDEPENDS_${PN}-xl = "libgcc"
>> +
>>  PACKAGES = "\
>>      ${PN}-base \
>>      ${PN}-blktap \
>> --
>> 1.7.10.4
>>
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

