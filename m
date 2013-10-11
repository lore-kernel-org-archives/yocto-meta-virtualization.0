Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lb0-f181.google.com (mail-lb0-f181.google.com
	[209.85.217.181])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B43CCE01653
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Oct 2013 20:21:39 -0700 (PDT)
Received: by mail-lb0-f181.google.com with SMTP id u14so2824497lbd.26
	for <meta-virtualization@yoctoproject.org>;
	Thu, 10 Oct 2013 20:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=yAybip1rpxGPqNzU4DoqR+WIYDJjPGjzhMwn6KiGb4Y=;
	b=J30FIPFP29TfVE7ku0qByGOsFX1PunIRKpDMgl/8GU3o+l07XxepQEjIxBSZ+ZDAdu
	wVwf5oNX8Hk0ElKes/AllYnwABcKPrDL8JWYhLkf3zhz2+GlQCkMeQtwZZqRXeiS52jm
	XN59N6qqtwJ10hRa1HmPIKFya5MuNZiIdJVfX+/2HtZJaRQGXjLAAhnGeuzIOx+zvHNY
	FJEU9WMaG1JMAh98ifKaG1jvqVyUMEJosIOLskHJkgnuyW/7p0Xlz1GKoj8+CeI76v7O
	/FX5QcWXXyl9e1/LvLdrsToM8jeG39ebWCfREmsMa5tvtQMxwf6CfcunIRkyw247HzAF
	tKmw==
MIME-Version: 1.0
X-Received: by 10.112.0.173 with SMTP id 13mr14674026lbf.8.1381461697611; Thu,
	10 Oct 2013 20:21:37 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 10 Oct 2013 20:21:37 -0700 (PDT)
In-Reply-To: <52551E5A.4000204@gmail.com>
References: <20131004163952.GA5669@longhaul.twobit.us>
	<524EF9AE.7090201@twobit.us> <52551E5A.4000204@gmail.com>
Date: Thu, 10 Oct 2013 23:21:37 -0400
Message-ID: <CADkTA4PvJVHCvLi7bG7Vckqv-8MqbWju3HwSvkc7eo8HE89Nzw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: =?ISO-8859-1?Q?David_Nystr=F6m?= <david.c.nystrom@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Explicitly set CHECKPOLICY path to native sysroot.
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
X-List-Received-Date: Fri, 11 Oct 2013 03:21:40 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 9, 2013 at 5:14 AM, David Nystr=F6m <david.c.nystrom@gmail.com>=
 wrote:
> On 10/04/2013 07:23 PM, Philip Tricca wrote:
>>
>> Probably should add that I'm not very fond of having the path hard coded
>> like this. Makes for a dependency on the install location from the
>> checkpolicy recipe. For the short term this fixes the immediate issue
>> though. Feedback on the "right way" to reference / find this binary
>> would be appreciated.
>>
>> Regards,
>> - Philip
>
>
> I suppose the correct way would be to patch the configure scripts and
> upstream that patch to Xen. But I have no problems with this, as long as
> chkconfig referenced from native sysroot is in DEPENDS, to avoid build ra=
ce
> conditions.

Which isn't the case at the moment.So this patch needs a bit more work.

Philip: Are you talking about the selinux checkpolicy here ? I assume you a=
re,
but want to be sure. If you are, not only do we need the package in the
DEPENDS, we need meta-selinux in the README's layer dependency list for
meta-virt.

Bruce

>
> Br,
> David
>
>
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

