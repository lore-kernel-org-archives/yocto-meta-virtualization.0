Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AB3F0E00B8E; Fri, 13 Apr 2018 12:54:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93354E00843
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Apr 2018 12:54:24 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w3DJsMM6010465
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Apr 2018 12:54:23 -0700 (PDT)
Received: from server.local (128.224.22.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 13 Apr 2018 12:54:16 -0700
To: Yi Zhao <yi.zhao@windriver.com>, <meta-virtualization@yoctoproject.org>,
	<mark.asselstine@windriver.com>
References: <1523587809-7323-1-git-send-email-yi.zhao@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <babdae5d-cc4f-95a2-1f43-7938f93c3190@windriver.com>
Date: Fri, 13 Apr 2018 15:54:16 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1523587809-7323-1-git-send-email-yi.zhao@windriver.com>
Subject: Re: [PATCH 1/2] criu: fix build failure with newer glibc and kernel
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
X-List-Received-Date: Fri, 13 Apr 2018 19:54:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged

Bruce

On 2018-04-12 10:50 PM, Yi Zhao wrote:
> With newer glibc(>= 2.26) and kernel(>=4.14), criu would fail to build:
> 
> In file included from
> /buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/recipe-sysroot/usr/include/linux/aio_abi.h:31:0,
>          from criu/cr-check.c:24:
> /buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/recipe-sysroot/usr/include/sys/mount.h:35:3:
> error: expected identifier before numeric constant
>     MS_RDONLY = 1,  /* Mount read-only.  */
>     ^
>    CC       criu/parasite-syscall.o
>    CC       criu/pipes.o
>    CC       criu/pie-util.o
>    CC       criu/pie-util-vdso.o
>    CC       criu/plugin.o
> /buildarea/build/tmp/work/core2-64-poky-linux/criu/3.4+gitAUTOINC+a31c1854e1-r0/git/scripts/nmk/scripts/build.mk:110:
> recipe for target 'criu/cr-check.o' failed
> make[2]: *** [criu/cr-check.o] Error 1
> 
> Backport a patch to fix it.
> 
> Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> ---
>   recipes-containers/criu/criu_git.bb                |  1 +
>   .../fix-building-on-newest-glibc-and-kernel.patch  | 47 ++++++++++++++++++++++
>   2 files changed, 48 insertions(+)
>   create mode 100644 recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> 
> diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
> index 083609f..7d62f35 100644
> --- a/recipes-containers/criu/criu_git.bb
> +++ b/recipes-containers/criu/criu_git.bb
> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git \
>              file://0002-criu-Skip-documentation-install.patch \
>              file://0001-criu-Change-libraries-install-directory.patch \
>              file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
> +           file://fix-building-on-newest-glibc-and-kernel.patch \
>             "
>   
>   COMPATIBLE_HOST = "(x86_64|arm|aarch64).*-linux"
> diff --git a/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> new file mode 100644
> index 0000000..d6341da
> --- /dev/null
> +++ b/recipes-containers/criu/files/fix-building-on-newest-glibc-and-kernel.patch
> @@ -0,0 +1,47 @@
> +From f41e386d4d40e3e26b0cfdc85a812b7edb337f1d Mon Sep 17 00:00:00 2001
> +From: Adrian Reber <areber@redhat.com>
> +Date: Thu, 28 Sep 2017 09:13:33 +0000
> +Subject: [PATCH] fix building on newest glibc and kernel
> +
> +On Fedora rawhide with kernel-headers-4.14.0-0.rc2.git0.1.fc28.x86_64
> +glibc-devel-2.26.90-15.fc28.x86_64 criu does not build any more:
> +
> +In file included from /usr/include/linux/aio_abi.h:31:0,
> +                 from criu/cr-check.c:24:
> +/usr/include/sys/mount.h:35:3: error: expected identifier before numeric constant
> +   MS_RDONLY = 1,  /* Mount read-only.  */
> +   ^
> +make[2]: *** [/builddir/build/BUILD/criu-3.5/scripts/nmk/scripts/build.mk:111: criu/cr-check.o] Error 1
> +make[1]: *** [criu/Makefile:73: criu/built-in.o] Error 2
> +make: *** [Makefile:233: criu] Error 2
> +
> +This simple re-ordering of includes fixes it for me.
> +
> +Signed-off-by: Adrian Reber <areber@redhat.com>
> +Signed-off-by: Andrei Vagin <avagin@virtuozzo.com>
> +
> +Upstream-Status: Backport
> +[https://github.com/checkpoint-restore/criu/commit/f41e386d4d40e3e26b0cfdc85a812b7edb337f1d#diff-cc847b1cc975358c6582595be92d48db]
> +
> +Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
> +---
> + criu/cr-check.c | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/criu/cr-check.c b/criu/cr-check.c
> +index 5dd448b..8986ec4 100644
> +--- a/criu/cr-check.c
> ++++ b/criu/cr-check.c
> +@@ -21,8 +21,8 @@
> + #include <netinet/in.h>
> + #include <sys/prctl.h>
> + #include <sched.h>
> +-#include <linux/aio_abi.h>
> + #include <sys/mount.h>
> ++#include <linux/aio_abi.h>
> +
> + #include "../soccr/soccr.h"
> +
> +--
> +2.7.4
> +
> 


