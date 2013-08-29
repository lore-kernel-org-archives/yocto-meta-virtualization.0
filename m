Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f52.google.com (mail-la0-f52.google.com
	[209.85.215.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 84389E005B4
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 06:33:44 -0700 (PDT)
Received: by mail-la0-f52.google.com with SMTP id ev20so354158lab.39
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2013 06:33:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=suiU/h10fkw5W55KmUyZ3IcHEmZ7sbCawnMrjSkQv/A=;
	b=iQ2d3ZfvJ6NiHmIOFPON+tXcDs7GLIBZbfB3FbsLbyRxBdwCNQNHcF+gMZ2yzmR3dB
	3jSD58U35eh4av436/PjN3fhvELkXp3hoBgHOQBqdvZRqw8SKyr82quKmHwjBoesOgHI
	yDMeKrxwZ+ql3fm9S9cMMUzFDXqCngpGlggeJeQPkHKVykBCa3zpzCsNg/SfDa5pDZJ3
	e1Iz55/1IFrSX8MZDLXos1McxxXXewkFNls2KfdLHLEcoIO2S2knq6/e/PiuwV1/67PY
	Y6lcbnXAUarP1Kw7yjp4ockjcBV1DltZL855Ot7Q/NFqUwJ5PKdJCLAs8WEW9qFFbhFU
	ho9A==
MIME-Version: 1.0
X-Received: by 10.152.88.74 with SMTP id be10mr3126667lab.4.1377783223449;
	Thu, 29 Aug 2013 06:33:43 -0700 (PDT)
Received: by 10.112.12.103 with HTTP; Thu, 29 Aug 2013 06:33:43 -0700 (PDT)
In-Reply-To: <CAA3XUr2CKHbT9rgF4+1-TQm1jCMoULFuETozOPgY8-RY=SV5-Q@mail.gmail.com>
References: <CAM1oe53TxnJzi0mtx+4NLZruC3kEX=OLjWVVfpoxUtcYpzrcgQ@mail.gmail.com>
	<CAA3XUr2CKHbT9rgF4+1-TQm1jCMoULFuETozOPgY8-RY=SV5-Q@mail.gmail.com>
Date: Thu, 29 Aug 2013 09:33:43 -0400
Message-ID: <CADkTA4PX-jM=rakHexDHDEHbMKuwk=FhaR6F8dHEoC9kC+U6Fg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Victor Kamensky <victor.kamensky@linaro.org>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
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
X-List-Received-Date: Thu, 29 Aug 2013 13:33:45 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Aug 21, 2013 at 8:46 PM, Victor Kamensky
<victor.kamensky@linaro.org> wrote:
> Just to clarify a bit:
>
> some preexisting layers in Zi's setup also had
> python_2.7.3.bbappend with syntax like this
>
> [kamensky@kamensky-w530 081913_1]$ cat
> meta-linaro/meta-bigendian/recipes-devtools/python/python_2.7.3.bbappend
> FILESEXTRAPATHS := "${THISDIR}/${PN}"
>
> SRC_URI += "file://python_ffi_armeb_be8.patch"
>
> We are wondering why
> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend
> redefines FILESPATH in such unusual way, which results that another layer
> modification got wiped out. Also it seems that
> meta-virtualization/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> patch
> already exist in OE defined layer
> (poky/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch).
> With your python_2.7.3.bbappend you make it pick up yours. It is highly
> unusual for OE system. Patches are different just a bit:
>
> [kamensky@kamensky-w530 081913_1]$ diff
> meta-virtualization/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> poky/meta/recipes-devtools/python/python/01-use-proper-tools-for-cross-build.patch
> 122,124c122,124
> < +        lib_dirs = [ os.getenv( "STAGING_LIBDIR" ) ]
> < +        inc_dirs = [ os.getenv( "STAGING_INCDIR" ) ]
> < +        lib_dirs += os.getenv('LIBRARY_PATH', '').split(os.pathsep)
> ---
>> +        lib_dirs = [ os.getenv("STAGING_LIBDIR"),  os.getenv("STAGING_BASELIBDIR") ]
>> +        inc_dirs = [ os.getenv("STAGING_INCDIR") ]
>> +
>
> If you are unhappy with OE provided
> 01-use-proper-tools-for-cross-build.patch patch patch you
> could come up with new patch on top of it, but not instead.

The patch is simply a cleanup which hasn't been done it, it isn't used and
hasn't been for a while.

>
> Does this python_2.7.3.bbappend even really needed or it is artifact
> of some things in the past?

As I mentioned in my first reply:

"That being said, we've talked about it before, and it should be we can remove
as it isn't necessary anymore."

Fixing the old style include path was the quickest thing to do at the time,
I've already purged the bbappend locally here, and will make the change
in the layer shortly.

Cheers,

Bruce


>
> Thanks,
> Victor
>
> On 21 August 2013 16:22, Zi Shen Lim <zishen.lim@linaro.org> wrote:
>> Hi,
>>
>> After adding meta-virtualization layer into bblayers.conf, I'm not
>> able to build packages.
>> Looks like the search path is broken [1].
>>
>> As a quick workaround, I removed
>> meta-virtualization/recipes-devtools/python/python_2.7.3.bbappend.
>> That resolved the issue.
>>
>> Suggestions?
>>
>> Thanks,
>> z
>>
>> [1] http://pastebin.com/BmK4QnnE
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

