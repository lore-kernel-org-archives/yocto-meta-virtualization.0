Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 30FBBE00A94; Wed,  5 Sep 2018 13:21:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D99C7E00A64
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Sep 2018 13:21:22 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w85KLMsb007040
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Sep 2018 13:21:22 -0700 (PDT)
Received: from server.local (128.224.20.150) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 5 Sep 2018 13:21:21 -0700
To: Mark Asselstine <mark.asselstine@windriver.com>,
	<meta-virtualization@yoctoproject.org>
References: <1536091960-1686-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <30ee6d2c-1926-fdcd-03c3-b88a32513b75@windriver.com>
Date: Wed, 5 Sep 2018 16:21:20 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1536091960-1686-1-git-send-email-mark.asselstine@windriver.com>
Subject: Re: [PATCH 1/2] openvswitch: uprev to v2.10.0
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
X-List-Received-Date: Wed, 05 Sep 2018 20:21:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2018-09-04 4:12 PM, Mark Asselstine wrote:
> The current version (v2.9.3) started to fail to build due to changes
> in openssl. Upstream must have run into similar issues as this was
> identified and addressed in v2.10.0 by including a copy of
> 'dhparams.c' instead of relying on it being generated. (see commit
> "dhparams: Add pregenerated .c file to the repository.")
> 
> Additionally v2.10.0 is better aligned for our kernel and dpdk
> versions:
> 

Tests passed here, so this is now merged.

Bruce

> kernel
> ===
>   2.10.x       3.10 to 4.17
> 
> dpdk
> ===
>   2.10.x       17.11.3
> 
> The changes in this commit allow for the building of v2.10.0. A second
> commit will be necessary to deal with a few runtime changes which
> prevent ovsdb-server from starting correctly.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>   .../python-switch-remaining-scripts-to-use-python3.patch     | 12 ++++++------
>   ...add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch} | 12 ++++++------
>   .../openvswitch-git/systemd-update-tool-paths.patch          |  8 ++++----
>   recipes-networking/openvswitch/openvswitch_git.bb            |  8 ++++----
>   4 files changed, 20 insertions(+), 20 deletions(-)
>   rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch => openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch} (94%)
> 
> diff --git a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> index 540bda6..64e0e3f 100644
> --- a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> +++ b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> @@ -1,4 +1,4 @@
> -From 39d1af836d844c89e625cfc908545e93977af8be Mon Sep 17 00:00:00 2001
> +From 098d3927e928362f0ac60ea97e9c39b73871be21 Mon Sep 17 00:00:00 2001
>   From: Mark Asselstine <mark.asselstine@windriver.com>
>   Date: Wed, 3 May 2017 10:39:12 -0400
>   Subject: [PATCH] python: switch remaining scripts to use python3
> @@ -39,15 +39,15 @@ index d7854a1..f09defb 100755
>    #
>    # Licensed under the Apache License, Version 2.0 (the "License");
>   diff --git a/utilities/checkpatch.py b/utilities/checkpatch.py
> -index 26eb5c3..2e1932b 100755
> +index f929714..e17a1cf 100755
>   --- a/utilities/checkpatch.py
>   +++ b/utilities/checkpatch.py
>   @@ -1,4 +1,4 @@
>   -#!/usr/bin/env python
>   +#!/usr/bin/env python3
>    # Copyright (c) 2016, 2017 Red Hat, Inc.
> + # Copyright (c) 2018 Nicira, Inc.
>    #
> - # Licensed under the Apache License, Version 2.0 (the "License");
>   diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
>   index 9ce0f04..839e13e 100755
>   --- a/utilities/ovs-dev.py
> @@ -59,7 +59,7 @@ index 9ce0f04..839e13e 100755
>    #
>    # Licensed under the Apache License, Version 2.0 (the "License");
>   diff --git a/utilities/ovs-pipegen.py b/utilities/ovs-pipegen.py
> -index 4bf240f..2a8f13e 100755
> +index ee57972..e9b99f5 100755
>   --- a/utilities/ovs-pipegen.py
>   +++ b/utilities/ovs-pipegen.py
>   @@ -1,4 +1,4 @@
> @@ -79,7 +79,7 @@ index e7404e3..5edad76 100755
>    # xapi plugin script to update the cache of configuration items in the
>    # ovs-vswitchd configuration that are managed in the xapi database when
>   diff --git a/xenserver/opt_xensource_libexec_interface-reconfigure b/xenserver/opt_xensource_libexec_interface-reconfigure
> -index ea4a742..c6745ee 100755
> +index a82043f..9c20725 100755
>   --- a/xenserver/opt_xensource_libexec_interface-reconfigure
>   +++ b/xenserver/opt_xensource_libexec_interface-reconfigure
>   @@ -1,4 +1,4 @@
> @@ -89,7 +89,7 @@ index ea4a742..c6745ee 100755
>    # Copyright (c) 2008,2009 Citrix Systems, Inc.
>    #
>   diff --git a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
> -index a776c00..d5ff8af 100755
> +index ecd6f6d..b8f2a42 100755
>   --- a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
>   +++ b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
>   @@ -1,4 +1,4 @@
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
> similarity index 94%
> rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
> rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
> index 5b53f96..a8fc86c 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-5563e309b80bbea9bff538e71ecfd7e5e538bab9.patch
> @@ -1,4 +1,4 @@
> -From fb68120ef8aed625b04b2fbd2cb78fc59a7b7432 Mon Sep 17 00:00:00 2001
> +From 37df262d2b0f0b8c177aa850623f2c5880484ff0 Mon Sep 17 00:00:00 2001
>   From: He Zhe <zhe.he@windriver.com>
>   Date: Wed, 30 Mar 2016 06:23:45 -0400
>   Subject: [PATCH] openvswitch: Add test-install rule to support ptest execution
> @@ -15,22 +15,22 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
>   
>   ---
>    Makefile.am |  1 +
> - test.mk     | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> - 2 files changed, 73 insertions(+)
> + test.mk     | 74 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> + 2 files changed, 75 insertions(+)
>    create mode 100644 test.mk
>   
>   diff --git a/Makefile.am b/Makefile.am
> -index ea63acb..ff7d70a 100644
> +index 7889728..6435399 100644
>   --- a/Makefile.am
>   +++ b/Makefile.am
> -@@ -429,3 +429,4 @@ include windows/automake.mk
> +@@ -494,3 +494,4 @@ include windows/automake.mk
>    include ovn/automake.mk
>    include selinux/automake.mk
>    include build-aux/automake.mk
>   +include test.mk
>   diff --git a/test.mk b/test.mk
>   new file mode 100644
> -index 0000000..b10a581
> +index 0000000..0b4587c
>   --- /dev/null
>   +++ b/test.mk
>   @@ -0,0 +1,74 @@
> diff --git a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> index 9a792e6..ec1c111 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> @@ -1,4 +1,4 @@
> -From f45c0a9d712113417e7b56c199f8576b470695ae Mon Sep 17 00:00:00 2001
> +From 3dbfcb0fa944b57215fab46fe484b02e69ff6e03 Mon Sep 17 00:00:00 2001
>   From: Mark Asselstine <mark.asselstine@windriver.com>
>   Date: Tue, 29 May 2018 18:57:46 +0000
>   Subject: [PATCH] systemd: update tool paths
> @@ -28,15 +28,15 @@ index 11b34c6..94c48f8 100644
>    ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
>              --no-ovsdb-server --no-monitor --system-id=random \
>   diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service b/rhel/usr_lib_systemd_system_ovsdb-server.service
> -index 0fa57a9..75c9e02 100644
> +index 70da1ec..c2c862f 100644
>   --- a/rhel/usr_lib_systemd_system_ovsdb-server.service
>   +++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
>   @@ -10,7 +10,7 @@ Type=forking
>    Restart=on-failure
>    EnvironmentFile=/etc/openvswitch/default.conf
>    EnvironmentFile=-/etc/sysconfig/openvswitch
> --ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch
> -+ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch
> +-ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
> ++ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch /var/log/openvswitch
>    ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [ "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
>    EnvironmentFile=-/run/openvswitch/useropts
>    ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 9cdd484..edffdce 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -12,16 +12,16 @@ RDEPENDS_${PN}-ptest += "\
>   	"
>   
>   S = "${WORKDIR}/git"
> -PV = "2.9.2+${SRCREV}"
> +PV = "2.10.0+${SRCREV}"
>   
>   FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>   
> -SRCREV = "7e614671cba3c4e338d1c5003b74a10047d7a8eb"
> +SRCREV = "5563e309b80bbea9bff538e71ecfd7e5e538bab9"
>   SRC_URI = "file://openvswitch-switch \
>              file://openvswitch-switch-setup \
>              file://openvswitch-testcontroller \
>              file://openvswitch-testcontroller-setup \
> -           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.9 \
> +           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.10 \
>              file://openvswitch-add-ptest-${SRCREV}.patch \
>              file://run-ptest \
>              file://disable_m4_check.patch \
> @@ -32,7 +32,7 @@ SRC_URI = "file://openvswitch-switch \
>              file://systemd-update-tool-paths.patch \
>              "
>   
> -LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
>   
>   DPDK_INSTALL_DIR ?= "/opt/dpdk"
>   
> 


