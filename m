Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E807E00852; Fri, 19 Sep 2014 10:10:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.41 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-la0-f41.google.com (mail-la0-f41.google.com
	[209.85.215.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3566DE00819
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Sep 2014 10:10:50 -0700 (PDT)
Received: by mail-la0-f41.google.com with SMTP id s18so3554418lam.14
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Sep 2014 10:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=YzFdKsuQ3OKcc8PQgv7nXJ6lyM2bg2tI53etz1HPcwg=;
	b=oJzjgS3xiMnrp+dfH+ok2/5tF9uiEp3vETxllqKXFg7FeasYICIjk1Jkrud3MCYP7z
	B/solplnTdV2d63XQnkPWkbjAFGL5m3NsRapdF+Z4KetY8GEPgiEEhaIe8clATmpk0Jg
	RTNCiNs4UShzwfxVwhcdbhe0UBsvYgceTl4YhcNL0ov1IuTJ7Y1A9Ml7lX+WpVpiN2CW
	uGYqoJyRxNxDu64lva0yzjKSm8jDjVJ817eT5mqpMKeuwS1nsZQIBNK3MBdsQ7a+m1wS
	uE7Qc8rBJO5I/iOyO/7g3at+2OU8sh5bWtf0WNbLS00f4RBEisY2KbBgRcjBSEp9HWgX
	3kXA==
MIME-Version: 1.0
X-Received: by 10.152.87.146 with SMTP id ay18mr8191143lab.92.1411146649272;
	Fri, 19 Sep 2014 10:10:49 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Fri, 19 Sep 2014 10:10:49 -0700 (PDT)
In-Reply-To: <1E529F5D1A8F3449B4163CEF4D798CF4C1005FF5@EU-MBX-04.mgc.mentorg.com>
References: <1411045229-3823-1-git-send-email-alexey_firago@mentor.com>
	<CADkTA4N2EQWUW+AQBiTjSqSbD3jfQJiG3w3SBB8tjrWeXJ4xSg@mail.gmail.com>
	<1E529F5D1A8F3449B4163CEF4D798CF4C1005FF5@EU-MBX-04.mgc.mentorg.com>
Date: Fri, 19 Sep 2014 13:10:49 -0400
Message-ID: <CADkTA4NeZ_7CJYJ0rzX+BEdnrZwDpBtTEBuq9MGFqgONQbxUWA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Firago, Alexey" <Alexey_Firago@mentor.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: add recipe for v1.2 release
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
X-List-Received-Date: Fri, 19 Sep 2014 17:10:56 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 19, 2014 at 11:57 AM, Firago, Alexey
<Alexey_Firago@mentor.com> wrote:
> Thanks!
>
> One side question: CRIU requires number of flags in kernel config enabled, is it reasonable to create CRIU-specific .scc file here - http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-kernel/linux/linux-yocto ?

We do need a specific configuration for CRIU, and I've been carrying
one in the yocto
kernel meta-data. See it here:

http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.14/tree/meta/cfg/kernel-cache/features/criu/criu-enable.scc?h=meta

Which means you can enable it by setting it in KERNEL_FEATURES.

If the settings are not complete, I'd definitely take a patch, or two! :)

Bruce

>
> Regards,
> Alexey
> ________________________________________
> From: Bruce Ashfield [bruce.ashfield@gmail.com]
> Sent: Friday, September 19, 2014 19:15
> To: Firago, Alexey
> Cc: meta-virtualization@yoctoproject.org
> Subject: Re: [meta-virtualization] [PATCH] criu: add recipe for v1.2 release
>
> Looks good to me.
>
> merged!
>
> Bruce
>
> On Thu, Sep 18, 2014 at 9:00 AM, Alexey Firago <alexey_firago@mentor.com> wrote:
>> Building and basic functionality verified on Wandboard-dual
>> with linux-wandboard_3.10.17.
>>
>> Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>> ---
>>  .../criu-1.2/0001-Makefile-Fix-hardcoding.patch    | 42 ++++++++++++++++++++++
>>  recipes-containers/criu/criu_1.2.bb                | 39 ++++++++++++++++++++
>>  2 files changed, 81 insertions(+)
>>  create mode 100644 recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
>>  create mode 100644 recipes-containers/criu/criu_1.2.bb
>>
>> diff --git a/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
>> new file mode 100644
>> index 0000000..fd9ab5b
>> --- /dev/null
>> +++ b/recipes-containers/criu/criu-1.2/0001-Makefile-Fix-hardcoding.patch
>> @@ -0,0 +1,42 @@
>> +From fa785bb1eb9cb0039d77836f4658c7bcccae5999 Mon Sep 17 00:00:00 2001
>> +From: Alexey Firago <alexey_firago@mentor.com>
>> +Date: Wed, 9 Jul 2014 02:01:11 +0400
>> +Subject: [PATCH] Makefile: Fix hardcoding
>> +
>> +Signed-off-by: Alexey Firago <alexey_firago@mentor.com>
>> +---
>> + Makefile | 18 +++++++++---------
>> + 1 file changed, 9 insertions(+), 9 deletions(-)
>> +
>> +diff --git a/Makefile b/Makefile
>> +index bda808d..4614ae2 100644
>> +--- a/Makefile
>> ++++ b/Makefile
>> +@@ -23,15 +23,15 @@ export VERSION_SO_MAJOR VERSION_SO_MINOR
>> + # Common definitions
>> + #
>> +
>> +-FIND          := find
>> +-CSCOPE                := cscope
>> +-RM            := rm -f
>> +-LD            := $(CROSS_COMPILE)ld
>> +-CC            := $(CROSS_COMPILE)gcc
>> +-NM            := $(CROSS_COMPILE)nm
>> +-SH            := bash
>> +-MAKE          := make
>> +-OBJCOPY               := $(CROSS_COMPILE)objcopy
>> ++FIND          ?= find
>> ++CSCOPE                ?= cscope
>> ++RM            ?= rm -f
>> ++LD            ?= $(CROSS_COMPILE)ld
>> ++CC            ?= $(CROSS_COMPILE)gcc
>> ++NM            ?= $(CROSS_COMPILE)nm
>> ++SH            ?= bash
>> ++MAKE          ?= make
>> ++OBJCOPY               ?= $(CROSS_COMPILE)objcopy
>> +
>> + CFLAGS                += $(USERCFLAGS)
>> +
>> +--
>> +1.9.1
>> +
>> diff --git a/recipes-containers/criu/criu_1.2.bb b/recipes-containers/criu/criu_1.2.bb
>> new file mode 100644
>> index 0000000..de07842
>> --- /dev/null
>> +++ b/recipes-containers/criu/criu_1.2.bb
>> @@ -0,0 +1,39 @@
>> +SUMMARY = "CRIU"
>> +DESCRIPTION = "Checkpoint/Restore In Userspace, or CRIU, is a software \
>> +tool for Linux operating system. Using this tool, you can freeze a running \
>> +application (or part of it) and checkpoint it to a hard drive \
>> +as a collection of files. You can then use the files to restore and run \
>> +the application from the point it was frozen at. The distinctive feature \
>> +of the CRIU project is that it is mainly implemented in user space"
>> +HOMEPAGE = "http://criu.org"
>> +SECTION = "console/tools"
>> +LICENSE = "GPLv2"
>> +
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=5cc804625b8b491b6b4312f0c9cb5efa"
>> +
>> +SRCREV = "v1.2"
>> +PR = "r0"
>> +PV = "1.2"
>> +
>> +SRC_URI = "git://git.criu.org/crtools.git;protocol=git \
>> +       file://0001-Makefile-Fix-hardcoding.patch"
>> +
>> +DEPENDS += "protobuf-c-native protobuf-c"
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +ARMV_armv7a = "ARMV=7"
>> +ARMV_armv6 = "ARMV=6"
>> +ARMV ?= ""
>> +EXTRA_OEMAKE += "ARCH=${TARGET_ARCH} WERROR=0 ${ARMV}"
>> +
>> +do_compile () {
>> +       unset CFLAGS
>> +       unset LDFLAGS
>> +       oe_runmake
>> +}
>> +
>> +do_install () {
>> +       mkdir -p ${D}/${bindir}
>> +       install -m 755 ${S}/criu ${D}/${bindir}/criu
>> +}
>> --
>> 1.9.1
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

