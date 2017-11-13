Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 22507E00AF9; Sun, 12 Nov 2017 17:28:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f193.google.com (mail-yw0-f193.google.com
	[209.85.161.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 434B2E00AF9
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 17:28:35 -0800 (PST)
Received: by mail-yw0-f193.google.com with SMTP id t71so12259556ywc.3
	for <meta-virtualization@yoctoproject.org>;
	Sun, 12 Nov 2017 17:28:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=76GU/xv31AQsMilPKexbgztRLPivYaGB1XI9myFBAEM=;
	b=WGoB4Zd8v3/W0bFSNiiJ/Dbk/x4Yhai9AkfkKHVaGMgusrtJTLL9l+3X2ef6QTbl5T
	XBJIkBBcSM97d4tePDV3VJ8IfUTqbNfiESZqnifKL/ycHmirtHlYx2IrxmQbQMTz00/w
	esUlJ69lHwHv/JBhGWuawcRsQ91rQt22TVDgEUFxBcnyNZeddIz1dzr0r7zfZ6vLKMSA
	pQYU+aQAwgtNZQqvrnTrYQGiR5yJqz7ErSj6sWo8AvZ0xtTQyqiOZaUkNyIocdIOxnQO
	IPOCYOtjU1GaGhk0uDBv6AjRls1QOa7es1HbP70NLtfUx54T56wVG4e7hRNeH6ETvh36
	gMnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=76GU/xv31AQsMilPKexbgztRLPivYaGB1XI9myFBAEM=;
	b=BrGzoM/+orEkEGOLoy4P53me8hJIR9RZRxdX8quCIdCzoYtlu7vvMP/1szf+3FmhRm
	U0bGmG4WU0SXZ1s2GWUNiYDPNRqmmdz5D8NCU0EBV5/poZyi0QUZv6ALI4gp+eORAiDm
	vXmIJiecz1TBRO5/ug+GZxRDtZHU0rG2PTdF+vSYqhSh7kerl5D8a8KQU1cLpmxVO7RH
	7b831jAjBvZFl+Kh+qm7xdvKtAWb+5LqVAyTZpecbm2J4ydvDGBhRfj8Q8ki7qrzaJ13
	Nfk6/oMuGXirS/kCBBc4orx0lFRHpwKwbXXamAxk5zZyC/YGSSTAU2/OiwdsUf4Ktc2t
	6B+Q==
X-Gm-Message-State: AJaThX6lhjVcUml9rS7GCO1W9R46ibNj93YpNyR6/f0eKjkCtCLOn5z5
	puF4sL2+HpFNsOI8Ypd+UkRGIoxkt73WOG2z9j8=
X-Google-Smtp-Source: AGs4zMaU7ieEMYoig6gDmpfrufrRUvjZMhkhJsIrPKqMj6FxDS1MfFXW7eQ+1eLTblIDmpwE613kaOP37Ln0DBZI3/Y=
X-Received: by 10.37.224.149 with SMTP id x143mr4598892ybg.440.1510536514480; 
	Sun, 12 Nov 2017 17:28:34 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.131.144 with HTTP; Sun, 12 Nov 2017 17:28:34 -0800 (PST)
In-Reply-To: <CADkTA4MnT-KcNSZzhvpU_dQKV0rvKGApKJB6CgF7OnsZP0t=RQ@mail.gmail.com>
References: <20171030225413.938-1-paul.eggleton@linux.intel.com>
	<1576630.ONkWi2uVLd@peggleto-mobl.ger.corp.intel.com>
	<CADkTA4MnT-KcNSZzhvpU_dQKV0rvKGApKJB6CgF7OnsZP0t=RQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 12 Nov 2017 20:28:34 -0500
X-Google-Sender-Auth: 2EvWDGoemG4CYFk-POrwEAnJR4A
Message-ID: <CAPuovE+=FS96vc_V4BHhXr6iq4c0jy5hJkEWZQBs=35rK=zfdg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python-*: use https for pypi URLs
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
X-List-Received-Date: Mon, 13 Nov 2017 01:28:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Nov 12, 2017 at 8:21 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> First I've seen of this.  It was filed as spam by gmail.
>
> Was I actually copied on the original ? That's the best way to make
> sure it doesn't
> get lost.
>
> I'll have a look at it in the next day or so, now that it has been
> yanked out of the bin :)

I have been moving things to inherit pypi while moving things to
stable/pike. By doing so we can most often drop the SRC_URI line and
in this way we *should* stay current with the pypi best practices.
This commit will conflict with my webob update that off the top of my
head you merged this week Bruce. Instead of merging this I will move
any recipes that remain to inherit pypi if that is alright with the
two of you.

Mark

>
> Cheers,
>
> Bruce
>
> On Sun, Nov 12, 2017 at 3:01 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>> On Tuesday, 31 October 2017 11:54:13 AM NZDT Paul Eggleton wrote:
>>> Several of the recipes here were using http URLs for source hosted on
>>> pypi - pypi apparently no longer supports http so switch to https
>>> instead.
>>>
>>> Fixes [YOCTO #12286].
>>>
>>> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>> ---
>>>  recipes-devtools/python/python-gevent_1.0.1.bb    | 2 +-
>>>  recipes-devtools/python/python-m2crypto_0.22.3.bb | 2 +-
>>>  recipes-devtools/python/python-sphinx_1.4.1.bb    | 2 +-
>>>  recipes-devtools/python/python-webob_1.6.0.bb     | 2 +-
>>>  4 files changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/recipes-devtools/python/python-gevent_1.0.1.bb b/recipes-devtools/python/python-gevent_1.0.1.bb
>>> index 47f1267..8ac1295 100644
>>> --- a/recipes-devtools/python/python-gevent_1.0.1.bb
>>> +++ b/recipes-devtools/python/python-gevent_1.0.1.bb
>>> @@ -13,7 +13,7 @@ RDEPENDS_${PN} += "python-greenlet python-mime python-pprint python-re"
>>>
>>>  SRCNAME = "gevent"
>>>
>>> -SRC_URI = "http://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
>>> +SRC_URI = "https://pypi.python.org/packages/source/g/gevent/${SRCNAME}-${PV}.tar.gz"
>>>  SRC_URI[md5sum] = "7b952591d1a0174d6eb6ac47bd975ab6"
>>>  SRC_URI[sha256sum] = "4627e215d058f71d95e6b26d9e7be4c263788a4756bd2858a93775f6c072df43"
>>>
>>> diff --git a/recipes-devtools/python/python-m2crypto_0.22.3.bb b/recipes-devtools/python/python-m2crypto_0.22.3.bb
>>> index 95d6eec..9814d3d 100644
>>> --- a/recipes-devtools/python/python-m2crypto_0.22.3.bb
>>> +++ b/recipes-devtools/python/python-m2crypto_0.22.3.bb
>>> @@ -14,7 +14,7 @@ LICENSE = "BSD"
>>>  LIC_FILES_CHKSUM = "file://PKG-INFO;md5=0ccca7097c1d29fa42e75e9c15c6ff2e"
>>>
>>>  SRCNAME = "M2Crypto"
>>> -SRC_URI = "http://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
>>> +SRC_URI = "https://pypi.python.org/packages/source/M/M2Crypto/${SRCNAME}-${PV}.tar.gz \
>>>             file://m2crypto-Fix-build-with-SWIG-3.0.5.patch \
>>>  "
>>>
>>> diff --git a/recipes-devtools/python/python-sphinx_1.4.1.bb b/recipes-devtools/python/python-sphinx_1.4.1.bb
>>> index 835b369..b4ae86b 100644
>>> --- a/recipes-devtools/python/python-sphinx_1.4.1.bb
>>> +++ b/recipes-devtools/python/python-sphinx_1.4.1.bb
>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=72f034adc6f7b05b09bc00d1a05bb065"
>>>  PR = "r0"
>>>  SRCNAME = "Sphinx"
>>>
>>> -SRC_URI = "http://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>>> +SRC_URI = "https://pypi.python.org/packages/source/S/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>>>
>>>  SRC_URI[md5sum] = "4c4988e0306a04cef8dccc384281e585"
>>>  SRC_URI[sha256sum] = "c6871a784d24aba9270b6b28541537a57e2fcf4d7c799410eba18236bc76d6bc"
>>> diff --git a/recipes-devtools/python/python-webob_1.6.0.bb b/recipes-devtools/python/python-webob_1.6.0.bb
>>> index 71c74ff..93f2acf 100644
>>> --- a/recipes-devtools/python/python-webob_1.6.0.bb
>>> +++ b/recipes-devtools/python/python-webob_1.6.0.bb
>>> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://docs/license.txt;md5=8ed3584bcc78c16da363747ccabc5af5
>>>  PR = "r0"
>>>  SRCNAME = "WebOb"
>>>
>>> -SRC_URI = "http://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>>> +SRC_URI = "https://pypi.python.org/packages/source/W/${SRCNAME}/${SRCNAME}-${PV}.tar.gz"
>>>
>>>  SRC_URI[md5sum] = "089d7fc6745f175737800237c7287802"
>>>  SRC_URI[sha256sum] = "63d262d8f61b516321f786879c9277fa2209f7f57eb47b537eeecfea383d55b7"
>>>
>>
>> ping ?
>>
>> Cheers,
>> Paul
>>
>> --
>>
>> Paul Eggleton
>> Intel Open Source Technology Centre
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
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

