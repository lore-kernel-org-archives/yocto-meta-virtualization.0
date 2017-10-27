Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA3ABE00BB7; Fri, 27 Oct 2017 07:32:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 636ABE00B83
	for <meta-virtualization@yoctoproject.org>;
	Fri, 27 Oct 2017 07:32:31 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v9REWSdh004784
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 27 Oct 2017 07:32:28 -0700
Received: from server.local (128.224.20.122) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 27 Oct 2017 07:32:27 -0700
To: Andre McCurdy <armccurdy@gmail.com>, <meta-virtualization@yoctoproject.org>
References: <1508991840-24869-1-git-send-email-armccurdy@gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <8d497e7b-358b-22a7-9e69-42083600ce29@windriver.com>
Date: Fri, 27 Oct 2017 10:32:27 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1508991840-24869-1-git-send-email-armccurdy@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>
Subject: Re: [morty][PATCH] openvswitch: Fix build with musl libc
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
X-List-Received-Date: Fri, 27 Oct 2017 14:32:36 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

merged to morty.

Bruce

On 2017-10-26 12:24 AM, Andre McCurdy wrote:
> From: Khem Raj <raj.khem@gmail.com>
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
> (cherry picked from commit 1b83c21436b2aec10e7b604ee5e3905441d1bb8a)
> Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
> ---
>   ...-the-linux-if_packet.h-Interface-directly.patch | 35 ++++++++++++++++++++++
>   ...Define-WAIT_ANY-if-not-provided-by-system.patch | 31 +++++++++++++++++++
>   recipes-networking/openvswitch/openvswitch_git.bb  |  2 ++
>   3 files changed, 68 insertions(+)
>   create mode 100644 recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
>   create mode 100644 recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
> 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
> new file mode 100644
> index 0000000..3571245
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/0001-use-the-linux-if_packet.h-Interface-directly.patch
> @@ -0,0 +1,35 @@
> +From 1cec65e45f011c3f52eed5e27d3d816502e36610 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 20 Mar 2017 12:12:51 -0700
> +Subject: [PATCH 1/2] use the linux if_packet.h Interface directly
> +
> +Helps compiling with musl
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + lib/netdev-linux.c | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/lib/netdev-linux.c b/lib/netdev-linux.c
> +index a5a9ec1ab..9dd40acdd 100644
> +--- a/lib/netdev-linux.c
> ++++ b/lib/netdev-linux.c
> +@@ -33,14 +33,13 @@
> + #include <linux/pkt_sched.h>
> + #include <linux/rtnetlink.h>
> + #include <linux/sockios.h>
> ++#include <linux/if_packet.h>
> + #include <sys/types.h>
> + #include <sys/ioctl.h>
> + #include <sys/socket.h>
> + #include <sys/utsname.h>
> +-#include <netpacket/packet.h>
> + #include <net/if.h>
> + #include <net/if_arp.h>
> +-#include <net/if_packet.h>
> + #include <net/route.h>
> + #include <netinet/in.h>
> + #include <poll.h>
> +--
> +2.12.0
> +
> diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
> new file mode 100644
> index 0000000..e44ffda
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
> @@ -0,0 +1,31 @@
> +From 803bde12d32d16eefeae03422a0ac682e0601c43 Mon Sep 17 00:00:00 2001
> +From: Khem Raj <raj.khem@gmail.com>
> +Date: Mon, 20 Mar 2017 12:13:30 -0700
> +Subject: [PATCH 2/2] Define WAIT_ANY if not provided by system
> +
> +POSIX does not define it and uses -1 directly
> +some libc do not have this definitions
> +
> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> +---
> + tests/test-ovn.c | 4 ++++
> + 1 file changed, 4 insertions(+)
> +
> +diff --git a/tests/test-ovn.c b/tests/test-ovn.c
> +index 2e82a6f0d..76e7db9fb 100644
> +--- a/tests/test-ovn.c
> ++++ b/tests/test-ovn.c
> +@@ -37,6 +37,10 @@
> + #include "simap.h"
> + #include "util.h"
> +
> ++#ifndef WAIT_ANY
> ++# define WAIT_ANY (-1) /* Any process.  */
> ++#endif
> ++
> + /* --relops: Bitmap of the relational operators to test, in exhaustive test. */
> + static unsigned int test_relops;
> +
> +--
> +2.12.0
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 1c6252a..5ecb29a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -25,6 +25,8 @@ SRC_URI += "\
>   	file://disable_m4_check.patch \
>   	file://kernel_module.patch \
>   	file://openvswitch-ptest-Fix-python-path.patch \
> +	file://0001-use-the-linux-if_packet.h-Interface-directly.patch \
> +	file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
>   	"
>   
>   LIC_FILES_CHKSUM = "file://COPYING;md5=247d8817aece26b21a8cd6791b3ea994"
> 


