Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E122EE00BB7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Apr 2014 08:44:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3EFijrC011927
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 14 Apr 2014 08:44:45 -0700 (PDT)
Received: from [147.11.116.172] (147.11.116.172) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 14 Apr 2014 08:44:45 -0700
Message-ID: <534C026C.3090307@windriver.com>
Date: Mon, 14 Apr 2014 11:44:44 -0400
From: Bruce Ashfield <bruce.ashfield@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.2.0
MIME-Version: 1.0
To: "zhenhua.luo@freescale.com" <zhenhua.luo@freescale.com>,
	"meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <1397101240-26311-1-git-send-email-zhenhua.luo@freescale.com>
	<2dd2330ee67a4322911583f42eef9670@DM2PR03MB399.namprd03.prod.outlook.com>
In-Reply-To: <2dd2330ee67a4322911583f42eef9670@DM2PR03MB399.namprd03.prod.outlook.com>
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
X-List-Received-Date: Mon, 14 Apr 2014 15:44:54 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 14-04-14 02:06 AM, zhenhua.luo@freescale.com wrote:
> Hi Bruce,
>
> Can you please review the patch?

The patch is fine. I have it staged in my local tree while I finish updates
to the latest havana/stable branches.

I'll have it in tree shortly, before I bring in icehouse changes.

Cheers,

Bruce

>
>
> Best Regards,
>
> Zhenhua
>
>> -----Original Message-----
>> From: Zhenhua Luo [mailto:zhenhua.luo@freescale.com]
>> Sent: Thursday, April 10, 2014 11:41 AM
>> To: meta-virtualization@yoctoproject.org
>> Cc: Luo Zhenhua-B19537
>> Subject: [meta-cloud-services][PATCH] Fix the path of header files check
>>
>> Current Makefile will check headers on host instead of Yocto sysroot,
>> following error appears. Change the path of header check.
>> | bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
>> | #include <libaio.h>
>> |                     ^
>> | compilation terminated.
>>
>> Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> ---
>>   ...-path-of-header-files-check-in-Yocto-buil.patch | 48
>> ++++++++++++++++++++++
>>   meta-openstack/recipes-support/tgt/tgt_git.bb      |  6 ++-
>>   2 files changed, 52 insertions(+), 2 deletions(-)  create mode 100644
>> meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-header-
>> files-check-in-Yocto-buil.patch
>>
>> diff --git a/meta-openstack/recipes-support/tgt/files/0001-Correct-the-
>> path-of-header-files-check-in-Yocto-buil.patch b/meta-openstack/recipes-
>> support/tgt/files/0001-Correct-the-path-of-header-files-check-in-Yocto-
>> buil.patch
>> new file mode 100644
>> index 0000000..6106b90
>> --- /dev/null
>> +++ b/meta-openstack/recipes-support/tgt/files/0001-Correct-the-path-of-
>> +++ header-files-check-in-Yocto-buil.patch
>> @@ -0,0 +1,48 @@
>> +From 5f6a261e44fec387e66d8b89d69f9602de5d5c53 Mon Sep 17 00:00:00 2001
>> +From: Zhenhua Luo <zhenhua.luo@freescale.com>
>> +Date: Thu, 10 Apr 2014 11:26:39 +0800
>> +Subject: [PATCH] Correct the path of header files check in Yocto build
>> +env
>> +
>> +Upstream-Status: Inappropriate [the fix is specific to Yocto build env]
>> +
>> +Current Makefile will check headers on host instead of Yocto sysroot,
>> +following error appears. Change the path of header check.
>> +| bs_aio.c:34:20: fatal error: libaio.h: No such file or directory
>> +| #include <libaio.h>
>> +|                     ^
>> +| compilation terminated.
>> +
>> +Signed-off-by: Zhenhua Luo <zhenhua.luo@freescale.com>
>> +---
>> + usr/Makefile | 6 +++---
>> + 1 file changed, 3 insertions(+), 3 deletions(-)
>> +
>> +diff --git a/usr/Makefile b/usr/Makefile index 453eb1a..191503d 100644
>> +--- a/usr/Makefile
>> ++++ b/usr/Makefile
>> +@@ -1,10 +1,10 @@
>> + sbindir ?= $(PREFIX)/sbin
>> +
>> +-ifneq ($(shell test -e /usr/include/linux/signalfd.h && echo 1),)
>> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/linux/signalfd.h && echo
>> ++1),)
>> + CFLAGS += -DUSE_SIGNALFD
>> + endif
>> +
>> +-ifneq ($(shell test -e /usr/include/sys/timerfd.h && echo 1),)
>> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/timerfd.h && echo
>> ++1),)
>> + CFLAGS += -DUSE_TIMERFD
>> + endif
>> +
>> +@@ -18,7 +18,7 @@ TGTD_OBJS += bs_rbd.o  LIBS += -lrados -lrbd  endif
>> +
>> +-ifneq ($(shell test -e /usr/include/sys/eventfd.h && test -e
>> +/usr/include/libaio.h && echo 1),)
>> ++ifneq ($(shell test -e $(SYSROOT)/usr/include/sys/eventfd.h && test -e
>> ++$(SYSROOT)/usr/include/libaio.h && echo 1),)
>> + CFLAGS += -DUSE_EVENTFD
>> + TGTD_OBJS += bs_aio.o
>> + LIBS += -laio
>> +--
>> +1.9.1
>> +
>> diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-
>> openstack/recipes-support/tgt/tgt_git.bb
>> index db4f56b..8be9fe4 100644
>> --- a/meta-openstack/recipes-support/tgt/tgt_git.bb
>> +++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
>> @@ -8,7 +8,9 @@ SRCREV = "0ee382bab57a8ecd9ece18d511bd098298478409"
>>   PV = "1.0.36+git${SRCPV}"
>>   PR = "r0"
>>
>> -SRC_URI = "git://github.com/fujita/tgt.git"
>> +SRC_URI = "git://github.com/fujita/tgt.git \
>> +	file://0001-Correct-the-path-of-header-files-check-in-Yocto-
>> buil.patch
>> +\ "
>>   SRC_URI += "file://tgtd.init"
>>
>>   S = "${WORKDIR}/git"
>> @@ -16,7 +18,7 @@ S = "${WORKDIR}/git"
>>   inherit update-rc.d
>>
>>   do_compile() {
>> -    oe_runmake -e programs conf scripts
>> +    oe_runmake SYSROOT="${STAGING_DIR_TARGET}" -e programs conf scripts
>>   }
>>
>>   do_install() {
>> --
>> 1.9.1
>>
>


