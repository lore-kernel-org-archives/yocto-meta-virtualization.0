Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f47.google.com (mail-la0-f47.google.com
	[209.85.215.47])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A646EE00A2F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Apr 2014 02:46:02 -0700 (PDT)
Received: by mail-la0-f47.google.com with SMTP id pn19so6592255lab.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Apr 2014 02:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Ajx7KdcBYyDmXMQbGBjxF0QSKLd34c68xvYyuOvrs0w=;
	b=L1Pgnf55kNa1rJcaxIgEx6XH0xi4Rey4z8lbWfmjkW/7byi9Eeh8C02iMMkN6dq4q3
	kt1EUovk2CZf/dU+0dLIAq4DT06xCxZuKISPoV1VcXDcPHdNJ313sa9wXKp1V6AEXh1T
	Dqd7x3fNxamremyDUurb/72IYaIRTnQKnlPqXZr3ZP8uhgqNF+sUXAo04EK2mdKVqKMf
	a+8okDHJiZ1L0OmujMoB0SH8VVo1jm6RvMtX0lZf6GXK6LSBn8nAen2kXiBO9XYwKZVf
	0Ewh70WDbWygljkRaM3fSzrOJGWuLbWqH9a6PTiCKU/bzUbo8j/orkxMG0Wzsag9T9y4
	RXMw==
MIME-Version: 1.0
X-Received: by 10.112.27.133 with SMTP id t5mr522393lbg.21.1397555161137; Tue,
	15 Apr 2014 02:46:01 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Tue, 15 Apr 2014 02:46:01 -0700 (PDT)
In-Reply-To: <97fa36d9a9e5411f91c1d9d70caf6841@DM2PR03MB399.namprd03.prod.outlook.com>
References: <1397101240-26311-1-git-send-email-zhenhua.luo@freescale.com>
	<2dd2330ee67a4322911583f42eef9670@DM2PR03MB399.namprd03.prod.outlook.com>
	<534C026C.3090307@windriver.com>
	<97fa36d9a9e5411f91c1d9d70caf6841@DM2PR03MB399.namprd03.prod.outlook.com>
Date: Tue, 15 Apr 2014 05:46:01 -0400
Message-ID: <CADkTA4M9MN8RRrqHA6GVN_3subygH7=hsLVaECEk=vTwfKoyoA@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services][PATCH] Fix the path of header files check
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
X-List-Received-Date: Tue, 15 Apr 2014 09:46:06 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Apr 15, 2014 at 1:56 AM, zhenhua.luo@freescale.com
<zhenhua.luo@freescale.com> wrote:
> Hi Bruce,
>
> Thanks a lot.
>
> I can see three branches in meta-cloud-services layer, grizzly and havana are specific to different openstack versions, may I know which openstack version is specific to master branch?

At the moment, it is up to date havana stable. It'll move to icehouse
in the next
few weeks. I'll keep the havana branch tracking upstream when I update master.

Bruce

>
>
> Best Regards,
>
> Zhenhua
>
>
>> -----Original Message-----
>> From: Bruce Ashfield [mailto:bruce.ashfield@windriver.com]
>> Sent: Monday, April 14, 2014 11:45 PM
>> To: Luo Zhenhua-B19537; meta-virtualization@yoctoproject.org
>> Subject: Re: [meta-cloud-services][PATCH] Fix the path of header files
>> check
>>
>> On 14-04-14 02:06 AM, zhenhua.luo@freescale.com wrote:
>> > Hi Bruce,
>> >
>> > Can you please review the patch?
>>
>> The patch is fine. I have it staged in my local tree while I finish
>> updates to the latest havana/stable branches.
>>
>> I'll have it in tree shortly, before I bring in icehouse changes.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> >
>> > Best Regards,
>> >
>> > Zhenhua
>> >
>> >> -----Original Message-----
>> >> From: Zhenhua Luo [mailto:zhenhua.luo@freescale.com]
>> >> Sent: Thursday, April 10, 2014 11:41 AM
>> >> To: meta-virtualization@yoctoproject.org
>> >> Cc: Luo Zhenhua-B19537
>> >> Subject: [meta-cloud-services][PATCH] Fix the path of header files
>> >> check
>> >>
>> >> Current Makefile will check headers on host instead of Yocto sysroot,
>> >> following error appears. Change the path of header check.
>> >> | bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
>> >> | #include <libaio.h>
>> >> |                     ^
>> >> | compilation terminated.
>> >>
>> >> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> >> ---
>> >>   ...-path-of-header-files-check-in-Yocto-buil.patch | 48
>> >> ++++++++++++++++++++++
>> >>   meta-openstack/recipes-support/tgt/tgt_git.bb      |  6 ++-
>> >>   2 files changed, 52 insertions(+), 2 deletions(-)  create mode
>> >> 100644
>> >> meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-hea
>> >> der-
>> >> files-check-in-Yocto-buil.patch
>> >>
>> >> diff --git
>> >> a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-
>> >> path-of-header-files-check-in-Yocto-buil.patch
>> >> b/meta-openstack/recipes-
>> >> support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yoct
>> >> o-
>> >> buil.patch
>> >> new file mode 100644
>> >> index 0000000..6106b90
>> >> --- /dev/null
>> >> +++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-
>> >> +++ of- header-files-check-in-Yocto-buil.patch
>> >> @@ -0,0 +1,48 @@
>> >> +From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00
>> >> +2001
>> >> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
>> >> +Date: Thu, 10 Apr 2014 11:26:39 +0800
>> >> +Subject: [PATCH] Correct the path of header files check in Yocto
>> >> +build env
>> >> +
>> >> +Upstream-Status: Inappropriate [the fix is specific to Yocto build
>> >> +env]
>> >> +
>> >> +Current Makefile will check headers on host instead of Yocto
>> >> +sysroot, following error appears. Change the path of header check.
>> >> +| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
>> >> +| #include <libaio.h>
>> >> +|                     ^
>> >> +| compilation terminated.
>> >> +
>> >> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> >> +---
>> >> + usr/Makefile | 6 +++---
>> >> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> >> +
>> >> +diff --git a/usr/Makefile b/usr/Makefile index 453eb1a..191503d
>> >> +100644
>> >> +--- a/usr/Makefile
>> >> ++++ b/usr/Makefile
>> >> +@@ -1,10 +1,10 @@
>> >> + sbindir ?= $(PREFIX)/sbin
>> >> +
>> >> +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
>> >> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h &&
>> >> ++echo
>> >> ++1),)
>> >> + CFLAGS += -DUSE_SIGNALFD
>> >> + endif
>> >> +
>> >> +-ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
>> >> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo
>> >> ++1),)
>> >> + CFLAGS += -DUSE_TIMERFD
>> >> + endif
>> >> +
>> >> +@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o  LIBS += -lrados -lrbd
>> >> +endif
>> >> +
>> >> +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
>> >> +/usr/include/libaio.h && echo 1),)
>> >> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test
>> >> ++-e $(SYSROOT)/usr/include/libaio.h && echo 1),)
>> >> + CFLAGS += -DUSE_EVENTFD
>> >> + TGTD_OBJS += bs_aio.o
>> >> + LIBS += -laio
>> >> +--
>> >> +1.9.1
>> >> +
>> >> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-
>> >> openstack/recipes-support/tgt/tgt_git.bb
>> >> index db4f56b..8be9fe4 100644
>> >> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> >> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> >> @@ -8,7 +8,9 @@ SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
>> >>   PV = "1.0.36+git${SRCPV}"
>> >>   PR = "r0"
>> >>
>> >> -SRC_URI = "git://github.com/fujita/tgt.git"
>> >> +SRC_URI = "git://github.com/fujita/tgt.git \
>> >> +  file://0001-Correct-the-path-of-header-files-check-in-Yocto-
>> >> buil.patch
>> >> +\ "
>> >>   SRC_URI += "file://tgtd.init"
>> >>
>> >>   S = "${WORKDIR}/git"
>> >> @@ -16,7 +18,7 @@ S = "${WORKDIR}/git"
>> >>   inherit update-rc.d
>> >>
>> >>   do_compile() {
>> >> -    oe_runmake -e programs conf scripts
>> >> +    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf
>> >> + scripts
>> >>   }
>> >>
>> >>   do_install() {
>> >> --
>> >> 1.9.1
>> >>
>> >
>>
>>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

