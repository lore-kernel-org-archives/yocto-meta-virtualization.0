Return-Path: <zishen.lim@linaro.org>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DC158E00747
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 18:02:50 -0700 (PDT)
Received: by mail-qa0-f51.google.com with SMTP id f11so1151qae.10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Aug 2013 18:02:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=qihoGA2iFyQnaRW09JmZdJJfU/4PVXcgfjfJbbaWAk0=;
	b=aUTgKt65bFC4sVKDY1Hjbx9tWojChvI0KlaCKXHZrvT1Yr3Jqx4UdaaV2WwxlLWhYB
	PpsW6b8be/I2+5vi/nyo4BNGQeQGSlv/hPfo3Q8TA4Ib8B442MAZRd7XQnqktRQXwnjw
	0xImmD0hGfOSJHKFGuX92WrpX3pTyTdLSIFmk+30jEHOyhMed6xzxDxNCoowZNQ1qIGy
	3wqMdhohJycMLXWIr8xH8Mo1Ak7yBf36NmzU9xPtAsB7G1ksm/p5bNrgXvKu4HbhMSR7
	O7c+ojV/DkLgysmatat/HJtbU75GEF5n6gf32n0Bbr36AU0zTb8GQlSCn0fF+OBiIydA
	S/1g==
X-Gm-Message-State: ALoCoQlrOhd28Et5eX4LWbwkLUhQq4kY4Ct93KO7ogmLfjL4o20M4mLDNGKkrgqKtn8mwRDZl61b
MIME-Version: 1.0
X-Received: by 10.49.26.201 with SMTP id n9mr12538169qeg.34.1377133369622;
	Wed, 21 Aug 2013 18:02:49 -0700 (PDT)
Received: by 10.49.59.82 with HTTP; Wed, 21 Aug 2013 18:02:49 -0700 (PDT)
In-Reply-To: <CADkTA4OQXOgvj4XhA2LhENVYpOdEsRodaPj+5kRA=EVf9zRKmw@mail.gmail.com>
References: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
	<CADkTA4OQXOgvj4XhA2LhENVYpOdEsRodaPj+5kRA=EVf9zRKmw@mail.gmail.com>
Date: Wed, 21 Aug 2013 18:02:49 -0700
Message-ID: <CAM1oe50xWq3fPMU2dc0axfdZ-3pMR5PvJaZ7wcyAKLeHaCFDVQ@mail.gmail.com>
From: Zi Shen Lim <zishen.lim@linaro.org>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	Victor Kamensky <victor.kamensky@linaro.org>
Subject: Re: error triggered by meta-virtualization
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
X-List-Received-Date: Thu, 22 Aug 2013 01:02:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 5:52 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Aug 21, 2013 at 7:22 PM, Zi Shen Lim <zishen.lim@linaro.org> wrote:
>> Hi,
>>
>> After adding meta-virtualization layer into bblayers.conf, I'm not
>> able to build packages.
>> Looks like the search path is broken [1].
>>
>> As a quick workaround, I removed
>> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
>> That resolved the issue.
>
> I'm definitely still able to build packages and plenty of python packages with
> that bbappend in place.
>
> That being said, we've talked about it before, and it should be we can remove
> as it isn't necessary anymore.
>
> I take it you have your own python patches, which the clobbered THISDIR
> is breaking.
>
> If you make the following change, does it build for you ?
>
> ------------------
>
> diff --git a/recipes-devtools/python/python_2.7.3.bbappend
> b/recipes-devtools/python/python_2.7.3.bbappend
> index e39deba..55301c7 100644
> --- a/recipes-devtools/python/python_2.7.3.bbappend
> +++ b/recipes-devtools/python/python_2.7.3.bbappend
> @@ -1,5 +1,4 @@
> -THISDIR := "${@os.path.dirname(bb.data.getVar('FILE', d, True))}"
> -FILESPATH =. "${@base_set_filespath(["${THISDIR}/${PN}"], d)}:"
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
>  DEPENDS += " ncurses"
>
> ------------
>
> If you can confirm it works, I'll push the change ASAP.
>

Yes, it works :)

Thanks Bruce and Victor.

> Bruce
>
>>
>> Suggestions?
>>
>> Thanks,
>> z
>>
>> [1] http://pastebin.com/BmK4QnnE
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"

