Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1747CE00D33; Mon, 10 Jun 2019 06:57:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.66 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5ED9BE0053F
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2019 06:57:42 -0700 (PDT)
Received: by mail-lf1-f66.google.com with SMTP id m15so6706215lfh.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2019 06:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/4+pmVRap+ZF11BMKYP3XcEg+Ia5SG652/arKGB37Bw=;
	b=s+9iRBKiTnTnx8lc3KYUTR0DnIqfNYAVqCRkyGExfcGdkFbpdFNbgZMjWMF+Y4N/5P
	uqYqIbQ1pOHR5RMlSu2jCDTidz2aaBy6dPSqR5h+obw4GlDZ+Y0DJ/eHZzJ3l2E+Z/Su
	AOSyrnIKNtmQN4Abi2R8MGapKTHFU+uUf8fyI6kXhR2dIvPGMtPeYgqMQkb97etMyh3O
	sgp7nozdIvHsMfnadhc+eNEF2EuC0bcxGbw3weoBzirzqg7t1FstYmX8jDyrnW4d0UzL
	y96nBMe8XO4LDjwEyO3gKDt9AhgVQs031GvboRLdkB91lD0524s2gQU26fRh7NWjr30o
	aDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/4+pmVRap+ZF11BMKYP3XcEg+Ia5SG652/arKGB37Bw=;
	b=WVXq2fYqbIy6+LPsCwgsgxX4u2arBdH9X7fLoZGCXeAl19Bhf82bhp+TvetEPZrowx
	GEqsCGBJ+YSIKCqNxkgJiyUhXtbp+/S2C7zzwyiRTzaoIlahdLPA6N45PLr0edrdWrTo
	xCbM6wUcFgfum8KaR5HO6FPaognPBsYnakQzZ0zC+Ezf/0H86jBuR/zSzI3Je5RafGBw
	DulGtzLoYx4Z9MfDAcbTdC6Fi9ukM6fpr4nBov0wzySGiB25rNqs623hcISk6vP3Uy2U
	l8t0g34P4L7thrtr2F28eKpox5jG/KvfbAe55KYiC1WOB9DoI5IRBl2vhogvBMkhr3zu
	V7gQ==
X-Gm-Message-State: APjAAAVXytYjHAIJ14OFi6Vcj7P34sD50oM5+GIXKbxFpV3kqBSeIHWJ
	qAo0QT3Cf6A6aP+th0DWQxnoFiLv9Sr9c4nKLh1gp7VM
X-Google-Smtp-Source: APXvYqw4jY7CRRBCJEi1vJOB57NSXlYydr4Fewr4Bapw0KbUFFFksg6+2URYgqJoceMZSE/+hC2Iqm211fA497MCbFk=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr35212667lfi.140.1560175061047;
	Mon, 10 Jun 2019 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190606030132.4145-1-zangrc.fnst@cn.fujitsu.com>
	<CANx9H-Adiq=TUuj5XFgUj0VpBL6jJjKXRfKfJq+H_pC8-jJ7OA@mail.gmail.com>
In-Reply-To: <CANx9H-Adiq=TUuj5XFgUj0VpBL6jJjKXRfKfJq+H_pC8-jJ7OA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jun 2019 09:57:30 -0400
Message-ID: <CADkTA4PpGspSAM3qWu0B68JJsps-M9NqjyLN4-jZj=1fmTC0bQ@mail.gmail.com>
To: Tim Orling <ticotimo@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-wsme: upgrade 0.9.2 -> 0.9.3
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
X-List-Received-Date: Mon, 10 Jun 2019 13:57:43 -0000
Content-Type: text/plain; charset="UTF-8"

Agreed.

I'm taking these version updates (since why not!), but we collectively
need to make time to create python3 versions of all the
meta-virt/meta-cloud-service recipes in the next couple of months.

Bruce

On Fri, Jun 7, 2019 at 2:57 AM Tim Orling <ticotimo@gmail.com> wrote:
>
> Please consider providing a python3 version as well.
>
> On Wed, Jun 5, 2019 at 8:00 PM Zang Ruochen <zangrc.fnst@cn.fujitsu.com> wrote:
>>
>> -Upgrade from python-wsme_0.9.2.bb to python-wsme_0.9.3.bb.
>>
>> Signed-off-by: Zang Ruochen <zangrc.fnst@cn.fujitsu.com>
>> ---
>>  .../python/{python-wsme_0.9.2.bb => python-wsme_0.9.3.bb}     | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>  rename meta-openstack/recipes-devtools/python/{python-wsme_0.9.2.bb => python-wsme_0.9.3.bb} (78%)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
>> similarity index 78%
>> rename from meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
>> rename to meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
>> index 15f46d4..4e83299 100644
>> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.9.2.bb
>> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.9.3.bb
>> @@ -6,8 +6,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5a9126e7f56a0cf3247050de7f10d0f4"
>>
>>  PYPI_PACKAGE = "WSME"
>>
>> -SRC_URI[md5sum] = "f7ab1fecd5fa64f579d6ef3aabf38f60"
>> -SRC_URI[sha256sum] = "e790ac755a7e36eaa796d3966d3878677896dbc7d1c2685cb85c06b744c21976"
>> +SRC_URI[md5sum] = "e6cb3864bae872acaa0cd0c2efacc94f"
>> +SRC_URI[sha256sum] = "e24fcff24392a0b176e560ffc6591b1f658342bbc992f84e0e8a3c53fd92580a"
>>
>>  inherit setuptools pypi
>>
>> --
>> 2.20.1
>>
>>
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

