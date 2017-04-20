Return-Path: <Yunguo.Wei@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F015CE00AE6; Thu, 20 Apr 2017 00:53:17 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF4A2E00AE0
	for <meta-virtualization@yoctoproject.org>;
	Thu, 20 Apr 2017 00:53:14 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v3K7r72o017946
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 20 Apr 2017 00:53:07 -0700 (PDT)
Received: from [128.224.179.203] (128.224.179.203) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 20 Apr 2017 00:53:06 -0700
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>,
	<cardoe@gentoo.org>
From: Yunguo Wei <yunguo.wei@windriver.com>
Message-ID: <75c6a75c-b2b6-c086-1a48-e7b6370a63a2@windriver.com>
Date: Thu, 20 Apr 2017 15:53:05 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
Subject: xen build error
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
X-List-Received-Date: Thu, 20 Apr 2017 07:53:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi Guys,

I'm building xen with latest poky and meta-virtualization, but running 
into the following error on ubu1404/1604:

x86_64-poky-linux-gcc -m64 -march=core2 -mtune=core2 -msse3 
--sysroot=/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot 
-m32 -march=i686 -DBUILD_ID -fno-strict-aliasing -std=gnu99 -Wall 
-Wstrict-prototypes -Wdeclaration-after-statement 
-Wno-unused-but-set-variable -Wno-unused-local-typedefs   -O2 
-fomit-frame-pointer 
-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ -MMD -MF 
.hvmloader.o.d -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE 
-mno-tls-direct-seg-refs  -DNDEBUG -Werror -fno-stack-protector 
-fno-exceptions -fno-builtin -msoft-float 
-I/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader/../../../tools/include 
-D__XEN_INTERFACE_VERSION__=__XEN_LATEST_INTERFACE_VERSION__ 
-I../../libacpi  -c -o hvmloader.o hvmloader.c
In file included from 
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot/usr/include/sys/cdefs.h:442:0,
                  from 
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot/usr/include/features.h:410,
                  from 
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot/usr/include/bits/libc-header-start.h:33,
                  from 
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot/usr/include/stdint.h:26,
                  from 
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot-native/usr/lib/x86_64-poky-linux/gcc/x86_64-poky-linux/6.3.0/include/stdint.h:9,
                  from util.h:5,
                  from hvmloader.c:22:
/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/recipe-sysroot/usr/include/bits/long-double.h:53:33: 
fatal error: bits/long-double-32.h: No such file or directory
  #include <bits/long-double-32.h>
                                  ^
compilation terminated.
make[7]: *** [hvmloader.o] Error 1
make[7]: Leaving directory 
`/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader'
make[6]: *** [all] Error 2
make[6]: Leaving directory 
`/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware/hvmloader'
make[5]: *** [subdir-all-hvmloader] Error 2
make[5]: Leaving directory 
`/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware'
make[4]: *** [subdirs-all] Error 2
make[4]: Leaving directory 
`/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware'
make[3]: *** [all] Error 2
make[3]: Leaving directory 
`/buildarea/raid0/ywei/git-repos/poky/build/tmp/work/core2-64-poky-linux/xen/4.8.0-r0/xen-4.8.0/tools/firmware'

Is there anyone see similar issue?


Regards,

Yunguo


