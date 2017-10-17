Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 036E8E00B67; Mon, 16 Oct 2017 18:01:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_LOW,
	RCVD_IN_SORBS_SPAM autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.216.182 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.182 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f182.google.com (mail-qt0-f182.google.com
	[209.85.216.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 488D8E00A62
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 18:01:55 -0700 (PDT)
Received: by mail-qt0-f182.google.com with SMTP id n61so214534qte.10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Oct 2017 18:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aQ8Z1OfOJrXdMctdsA7kVTBsKvyTiE+doolfirq8J6A=;
	b=LNiSWt+WY+FpoX0Wu4+RxBga4WHaPifPgnT2IlvITpv3E5fiIDeUo6X2jgkTjyBpoq
	eoJjRcNo2YkplKRAwirqgJHazaIuIn2ISFQOI4VD7ZEpsMBTkdE6G6dPG1vkdS1lmSCY
	tiHBr4PK2jqQCauTQtGoOy3cWRPoINiVTOZ8c0VSAozRi2QBN/5Jur/ooC+8J4KZsJg2
	drR02sObII4abFm49fMYKY7g7O2SM9X9wk9APT23gIeHOzHMnh5z5b4oifdOAMDF0TmW
	uz+8ddx8iON/04SPWUxsKrg/XSGPyj3EwvVFbHLqAsW3oIjVoQI5fsq8TAUORA/ZFPke
	IBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aQ8Z1OfOJrXdMctdsA7kVTBsKvyTiE+doolfirq8J6A=;
	b=HKjpQI5h8KksJACO3OvjJYAMvc6F4ht2gzvFwngX9xobssYozgYriRlfoS02I4oa6W
	f/CAF3TjEW0/coqnyFE0g4leByGhRhtDHuCpH3GM93aL5PBaP1dS/bLBq6WlTt+OoS1W
	w06t3L160c9Pa6fAChr6YfKpdasV8cfTBtAnH0TVOeW2R1Wf7Rm+8bO49rJV7plE0nWz
	vWybUd6mTf5xho+rQ9u41edY0mdxlTA4FV5p+qjqs4a/pvs3jxyum9TGodqYGFu6f2eF
	Vb2K2ZBQhqMxyXOUL1vfc4ZnV89eaPm3TTkiFhYr/1GypsGK/9vti0JSruvfM6ABP0SZ
	Podg==
X-Gm-Message-State: AMCzsaUAWr+7VJ0OW9n7Ul4mLnHAQvztER6cE34Iss/Kp+JkWnXMK3f4
	PCMbKWlIuyj1XszpD9ZZJXNByok2bYb8kujvmPOxdg==
X-Google-Smtp-Source: AOwi7QBEQkoQH8Jl0Hk5Xo2FR9y1ca9w13osyoigeupdDFb0orHKw9dpJz0CQpGuhzRiGRYWP4t0wBp3DvkdrudQHYw=
X-Received: by 10.200.48.103 with SMTP id g36mr16970350qte.289.1508202114415; 
	Mon, 16 Oct 2017 18:01:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 16 Oct 2017 18:01:53 -0700 (PDT)
In-Reply-To: <CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
References: <1508188679-11528-1-git-send-email-ricardo@opensourcefoundries.com>
	<CADkTA4NDa9GFu1vv420trVz+wL=Fr7tUHgM7NZk1jNoUGNztkg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 16 Oct 2017 21:01:53 -0400
Message-ID: <CADkTA4MGDn9OuagD+8t2UVdqDza6N-hykwQ_GtNDLab40gTbvg@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] runc-docker_git: use SRCREV instead of SRCREV_runc-docker
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
X-List-Received-Date: Tue, 17 Oct 2017 01:01:56 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 16, 2017 at 8:50 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Mon, Oct 16, 2017 at 5:17 PM, Ricardo Salveti
> <ricardo@opensourcefoundries.com> wrote:
>> runc.inc sets PV based on "${RUNC_VERSION}+git${SRCREV}", which is
>> set correctly by runc-opencontainers but not by runc-docker (PV was set
>> to 1.0.0-rc3+gitINVALID-r0 instead of using the SRCREV hash).
>
> Then I'll revert the .inc
>
> As I mentioned before, I'm keeping the named SRCREVs. I didn't notice that on
> the way in.

I see the issue. I won't take this patch, but will fix things up a
different way.

Bruce

>
> Cheers,
>
> Bruce
>
>>
>> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
>> ---
>>  recipes-containers/runc/runc-docker_git.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
>> index 9db48ee..6ef4d2c 100644
>> --- a/recipes-containers/runc/runc-docker_git.bb
>> +++ b/recipes-containers/runc/runc-docker_git.bb
>> @@ -2,7 +2,7 @@ include runc.inc
>>
>>  # Note: this rev is before the required protocol field, update when all components
>>  #       have been updated to match.
>> -SRCREV_runc-docker = "9d6821d1b53908e249487741eccd567249ca1d99"
>> +SRCREV = "9d6821d1b53908e249487741eccd567249ca1d99"
>>  SRC_URI = "git://github.com/docker/runc.git;nobranch=1;name=runc-docker \
>>             file://0001-Update-to-runtime-spec-198f23f827eea397d4331d7eb048d.patch \
>>             file://0002-Remove-Platform-as-no-longer-in-OCI-spec.patch \
>> --
>> 2.7.4
>>
>> --
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



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

