Received: from mx02.optimcloud.com (mx02.optimcloud.com [46.23.93.22])
 by mx.groups.io with SMTP id smtpd.web10.3784.1602727723602264986
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 14 Oct 2020 19:08:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="no key for verify" header.i=@optimcloud.com header.s=obsd header.b=ouzR1yp/;
 spf=none, err=SPF record not found (domain: optimcloud.com, ip: 46.23.93.22, mailfrom: yocto@optimcloud.com)
Received: from mx02.optimcloud.com (localhost [127.0.0.1])
	by mx02.optimcloud.com (OpenSMTPD) with ESMTP id 6860b193
	for <meta-virtualization@lists.yoctoproject.org>;
	Thu, 15 Oct 2020 04:08:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed; d=optimcloud.com; h=to
	:from:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; s=obsd; bh=kXY/XiG3ao6n1SDFZznrc6XNY
	DQFA7TakohRZaRbIWs=; b=ouzR1yp/zR1UY3PHEUq6ukek5mE8LqlvjpeF/KGEs
	zba6ti01m5efgrBIU5Z1tBWjsAG4os8wg5U74bpYxrWlo1MZHTFkNsZ/g8HAPQ2t
	MIO3RNqPPyKmFqgGzyspks5FCmTeusMGaiVjMRmpyQaETwFm9rZgZAn13QNmLEeZ
	wBLsRs3E/F2GiiLRxwd7b8mT/v0PnIoxqIb9Wq4hr9tyeKzrtb/psGmr71dMqiM0
	HQTXGmUUJNbC6hRHZw6WDjdKrCTTuac039nhN0T3CDpaZ4MtnlNTKYaebIbsfSOP
	u215zUSD5PwVn3sfyis7ojUxRn0XF/GbcxLsPQYXcvD6A==
DomainKey-Signature: a=rsa-sha1; c=nofws; d=optimcloud.com; h=to:from
	:subject:message-id:date:mime-version:content-type
	:content-transfer-encoding; q=dns; s=obsd; b=PV0Qqem4bmX5qt4eEBE
	EVedTkA5dhvXHn5UzavDsXnTWzTzviXI24YJaK2q6tb2NPteV9NpNjOpP5XSic6z
	vD+gJstWDj8NXhjfh5U3Yo5QhPdZSGlBcG++HtF3nbmiiNPSw/uDqz6+U+X7O/bU
	uTYEVXB2zGu/sNncxVnLmFwwOSBLZ+nZNKatYPPQ3sOptH9HSt6biqQV6MFDoch6
	UAdq63N+TxB7aZw44t2qUkJAmEujjmQ892aix/w2GgOYRK9T1vSTI04qTsqJ4m0m
	94KbY6+fOkZ878Z5FYxMer/+UD6BFfY6OuWwmXkD1NgD7oUOVUKR05+gbAzVnJN6
	juA==
Received: 
	by mx02.optimcloud.com (OpenSMTPD) with ESMTPSA id 2394d7d1 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO) auth=yes user=yocto@optimcloud.com
	for <meta-virtualization@lists.yoctoproject.org>;
	Thu, 15 Oct 2020 04:08:39 +0200 (CEST)
To: meta-virtualization@lists.yoctoproject.org
From: "Yocto" <yocto@optimcloud.com>
Subject: lastest commit break ERROR: containerd-opencontainers
Message-ID: <816fba5d-6d9a-3a90-65ca-91e86a135c4c@optimcloud.com>
Date: Thu, 15 Oct 2020 09:08:32 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Build Configuration:
BB_VERSION           = "1.47.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "fedora-32"
TARGET_SYS           = "x86_64-overc-linux"
MACHINE              = "intel-corei7-64"
DISTRO               = "overc"
DISTRO_VERSION       = "1.0"
TUNE_FEATURES        = "m64 corei7"
TARGET_FPU           = ""
meta
meta-poky
meta-yocto-bsp       = "master:ad30a6d470eca0f5be5c037ba37fad72e55a128c"
meta-oe
meta-python
meta-networking
meta-filesystems
meta-multimedia
meta-perl            = "master:2258c9a767391e4529665cd6508e4b32bd18d130"
meta-overc
meta-cube            = "master:264d1d0949fb5e9ec8e39b1f7604086d59ec2047"
meta-intel           = "master:4abd867159f2ea0cd560c34c574a6fe3dd252691"
meta-virtualization  = "master:1d861978463fdc247a7a57464b8349debba51912"
meta-cloud-services  = "master:910195eb791d754d394ba1013a258ab120c995e9"
meta-security        = "master:3ce8b759c97706d6f78928c38b6ebac4edfd95a5"
meta-selinux         = "master:6e1100d29aec118df2025c46c77f4c8aa8da4e76"
meta-gnome
meta-xfce            = "master:2258c9a767391e4529665cd6508e4b32bd18d130"
meta-awnix           = "master:c616414c6ed4f6f2ab75703ce5a3e84acacd3c47"
workspace            = "master:32f1010ad0d36b886ecde57290061558fc22929a"

Initialising tasks: 100% 
|######################################################################################################################| 
Time: 0:00:11
Sstate summary: Wanted 4286 Found 0 Missed 4286 Current 0 (0% match, 0% 
complete)
NOTE: Executing Tasks
ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0 
do_compile: oe_runmake failed
ERROR: containerd-opencontainers-v1.4.1+gitAUTOINC+e44e8ebeaa-r0 
do_compile: Execution of 
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140' 
failed with exit code 1:
+ bin/ctr
+ bin/containerd
+ bin/containerd-stress
+ bin/containerd-shim
+ bin/containerd-shim-runc-v1
+ bin/containerd-shim-runc-v2
# 
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
cannot find package runtime/cgo (using -importcfg)
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link: 
cannot open file : open : no such file or directory
make: *** [Makefile:201: bin/containerd-shim] Error 2
make: *** Waiting for unfinished jobs....
WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 
exit 1 from 'exit 1'
WARNING: Backtrace (BB generated script):
     #1: bbfatal_log, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 237
     #2: die, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 212
     #3: oe_runmake, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 207
     #4: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 202
     #5: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 241

Backtrace (metadata-relative locations):
     #1: bbfatal_log, 
/var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72
     #2: die, /var/home/dingo/overc/poky/meta/classes/base.bbclass, line 56
     #3: oe_runmake, 
/var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65
     #4: do_compile, 
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd.inc, 
line 70
ERROR: Logfile of failure stored in: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/log.do_compile.3449140
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 GODEBUG=1 binaries
| + bin/ctr
| + bin/containerd
| + bin/containerd-stress
| + bin/containerd-shim
| + bin/containerd-shim-runc-v1
| + bin/containerd-shim-runc-v2
| # 
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
| cannot find package runtime/cgo (using -importcfg)
| 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link: 
cannot open file : open : no such file or directory
| make: *** [Makefile:201: bin/containerd-shim] Error 2
| make: *** Waiting for unfinished jobs....
| ERROR: oe_runmake failed
| WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
|     #1: bbfatal_log, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 237
|     #2: die, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 212
|     #3: oe_runmake, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 207
|     #4: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 202
|     #5: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 241
| ERROR: Execution of 
'/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140' 
failed with exit code 1:
| + bin/ctr
| + bin/containerd
| + bin/containerd-stress
| + bin/containerd-shim
| + bin/containerd-shim-runc-v1
| + bin/containerd-shim-runc-v2
| # 
_/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/git/src/import/cmd/containerd-shim
| cannot find package runtime/cgo (using -importcfg)
| 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/recipe-sysroot-native/usr/lib/x86_64-overc-linux/go/pkg/tool/linux_amd64/link: 
cannot open file : open : no such file or directory
| make: *** [Makefile:201: bin/containerd-shim] Error 2
| make: *** Waiting for unfinished jobs....
| WARNING: 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140:237 
exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
|     #1: bbfatal_log, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 237
|     #2: die, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 212
|     #3: oe_runmake, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 207
|     #4: do_compile, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 202
|     #5: main, 
/var/home/dingo/overc/build/tmp/work/corei7-64-overc-linux/containerd-opencontainers/v1.4.1+gitAUTOINC+e44e8ebeaa-r0/temp/run.do_compile.3449140, 
line 241
|
| Backtrace (metadata-relative locations):
|     #1: bbfatal_log, 
/var/home/dingo/overc/poky/meta/classes/logging.bbclass, line 72
|     #2: die, /var/home/dingo/overc/poky/meta/classes/base.bbclass, line 56
|     #3: oe_runmake, 
/var/home/dingo/overc/poky/meta/classes/base.bbclass, line 65
|     #4: do_compile, 
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd.inc, 
line 70
ERROR: Task 
(/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:do_compile) 
failed with exit code '1'
NOTE: Tasks Summary: Attempted 7546 tasks of which 8 didn't need to be 
rerun and 1 failed.

Summary: 1 task failed:
/var/home/dingo/overc/meta-virtualization/recipes-containers/containerd/containerd-opencontainers_git.bb:do_compile
Summary: There were 4 WARNING messages shown.
Summary: There were 2 ERROR messages shown, returning a non-zero exit code.

