Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 25566E00D2C; Sat,  2 Feb 2019 19:50:22 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,URI_NOVOWEL
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 108FAE008CA
	for <meta-virtualization@yoctoproject.org>;
	Sat,  2 Feb 2019 19:50:20 -0800 (PST)
Received: by mail-lj1-f195.google.com with SMTP id l15-v6so8968711lja.9
	for <meta-virtualization@yoctoproject.org>;
	Sat, 02 Feb 2019 19:50:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hXNMduAIbY5RzNTUCxmIvHoNFyjO3ws3S/pkLBIvPno=;
	b=FrNFUaOHJTk4hcd2ob/lBsQJOifK8U87yMrmkX8Hl+YjYfMWKxmpt8DOMUrRKC/zQ8
	xZg6b9mzDMUJkMM+eEkX9OsSosHUpfZ/84Bw63aVkqBJqT6AXVrVKH0H61CFnXoGSDyN
	hrkvlakEfqjubOxRABXoW/ncHrUXnDoFXpyTLUKBowlXDngDhc+UF8mN4/7C+R0SNl2c
	uB6QtDhu+qbhi3bTakAYf/uZBrzxkv5H1xdY48XtT9I0Uk99V72UNrngLNDND/wKXbAY
	LhCS3tWfBnwhkeaE0gkfnk2TI0daQUVS4pc6SR2LspljYGdy51iNtStbkEpP70WlFncK
	65Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hXNMduAIbY5RzNTUCxmIvHoNFyjO3ws3S/pkLBIvPno=;
	b=Iy3JomPOTkfHFknwGtkhvSwJ5KbvfbpXk2ov2smaxibJRgcmJSnlQgN5Y02ZwOlEiX
	FqF/PRwYFlRB+7udSsq794z0bcPa8C/pjbXy1Sb9QBiZFwZccFB0JtQVAHjP7R2m1uuw
	BSZsRrEgYL9SghqOnCagE/7bsOvcfhOT1ZfVzb4rY7u7pgLN+6304U3norCrq3CZF8lU
	qu39J8wnBOfPY6XlezWoJo6sJ0WPJdsdEB57cdQ7aduvz4AdJHmwR4zSkM6CBj7OkcsZ
	Ws35yvBdZgqS438WNifP8q3rHDpxKWvlpMQmUAAH18zo53lN3h/UGbYdCQoIpltmsPMG
	BVbg==
X-Gm-Message-State: AHQUAuY00GI5Jief2FyyX83bfnOyWhBAIhd3hyPhkUNwi3QYI7WNmlCQ
	ic4OExBqYNjZtRLlxLdMaYn7iLdSiwxwpRzZQTgDYnOz
X-Google-Smtp-Source: AHgI3IYPUk7EzGgLEI4G2y6GXZ7xL+1rDqovYngOzg0MKGJwdLlUC7l79F0L3Y+3/kuBj/vSan1Y/APVUcTzP/I6Y30=
X-Received: by 2002:a2e:9603:: with SMTP id v3-v6mr2028043ljh.15.1549165819676;
	Sat, 02 Feb 2019 19:50:19 -0800 (PST)
MIME-Version: 1.0
References: <1548834412-14426-1-git-send-email-hongzhi.song@windriver.com>
	<1548834412-14426-2-git-send-email-hongzhi.song@windriver.com>
In-Reply-To: <1548834412-14426-2-git-send-email-hongzhi.song@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sat, 2 Feb 2019 22:50:08 -0500
Message-ID: <CADkTA4ON21spZKF_=B3_4kHMFxVmVMV-8vaUHCBb22_tGsy-PA@mail.gmail.com>
To: "Hongzhi.Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: uprev from v2.10.1 to v2.11
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
X-List-Received-Date: Sun, 03 Feb 2019 03:50:22 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, Jan 30, 2019 at 2:47 AM Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>
> The v2.11 version fixed a bug as follow.
>
> Error info:
> ovs|00002|db_ctl_base|ERR|external-ids:hostname=: argument does not
> end in "=" followed by a value.
>
> The result of ptest between v2.11 and v2.10.1 is similar.
>     v2.11:
>     ERROR: 2765 tests were run,
>     317 failed (1 expected failure).
>     85 tests were skipped.
>
>     v2.10.1:
>     ERROR: 2662 tests were run,
>     311 failed (1 expected failure).
>     85 tests were skipped.
>
> I checked the detailed result. The failed tests were mostly related
> to python2 as the image only use python3.
>
> Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ---
>  ...on-make-remaining-scripts-use-usr-bin-env.patch | 33 +++++++++++-----------
>  .../openvswitch-git/kernel_module.patch            | 25 ++++++++--------
>  recipes-networking/openvswitch/openvswitch_git.bb  |  8 +++---
>  3 files changed, 35 insertions(+), 31 deletions(-)
>
> diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> index 0dc6b11..53e3103 100644
> --- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> +++ b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> @@ -1,6 +1,6 @@
> -From a0a2d829642e916bd5d1c498a3e6f3641ed717a0 Mon Sep 17 00:00:00 2001
> -From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Fri, 13 Jan 2017 16:12:55 -0500
> +From a348e0162343f7d46443eb1fd2bcf0698460a780 Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Wed, 23 Jan 2019 04:28:28 -0500
>  Subject: [PATCH] python: make remaining scripts use /usr/bin/env
>
>  Unfortunately there is no concept of a host python vs. target python
> @@ -12,6 +12,7 @@ PYTHON. To make this function smoothly all installed scripts should
>  make use of /usr/bin/env to increase the chances of finding python.
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   build-aux/check-structs                     | 2 +-
>   build-aux/dpdkstrip.py                      | 2 +-
> @@ -68,17 +69,17 @@ index 48c7f06..b8b8ba9 100755
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
>  diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
> -index bd7131f..4d05ef9 100755
> +index 64de0f3..f6bca0b 100755
>  --- a/build-aux/extract-ofp-actions
>  +++ b/build-aux/extract-ofp-actions
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
>  +#! /usr/bin/env python3
>
> + import getopt
>   import sys
> - import os.path
>  diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
> -index 71ae0bd..58ba006 100755
> +index 6f64efd..c410fd4 100755
>  --- a/build-aux/extract-ofp-errors
>  +++ b/build-aux/extract-ofp-errors
>  @@ -1,4 +1,4 @@
> @@ -88,7 +89,7 @@ index 71ae0bd..58ba006 100755
>   import sys
>   import os.path
>  diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
> -index 184b75e..cf339f8 100755
> +index 3592594..2fc8317 100755
>  --- a/build-aux/extract-ofp-fields
>  +++ b/build-aux/extract-ofp-fields
>  @@ -1,4 +1,4 @@
> @@ -148,7 +149,7 @@ index bd4e879..db45c56 100755
>   # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
>   #
>  diff --git a/ovn/utilities/ovn-detrace.in b/ovn/utilities/ovn-detrace.in
> -index e2e5b4c..5549219 100755
> +index c842adc..9e95183 100755
>  --- a/ovn/utilities/ovn-detrace.in
>  +++ b/ovn/utilities/ovn-detrace.in
>  @@ -1,4 +1,4 @@
> @@ -208,7 +209,7 @@ index 8eea617..38ba33a 100755
>   from datetime import date
>   import ovs.db.error
>  diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> -index 1ea2115..4ecb2e2 100755
> +index 40fef39..84c63a6 100755
>  --- a/ovsdb/ovsdb-idlc.in
>  +++ b/ovsdb/ovsdb-idlc.in
>  @@ -1,4 +1,4 @@
> @@ -228,7 +229,7 @@ index b8027af..8f52803 100755
>   # Copyright (c) 2008, 2017 Nicira, Inc.
>   #
>  diff --git a/tests/flowgen.py b/tests/flowgen.py
> -index 221a8f2..5d96d76 100755
> +index 976fe7a..7ef32d1 100755
>  --- a/tests/flowgen.py
>  +++ b/tests/flowgen.py
>  @@ -1,4 +1,4 @@
> @@ -258,7 +259,7 @@ index ea72812..f1a9aff 100755
>   import re
>   import sys
>  diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
> -index 8d220fd..76cedf4 100755
> +index 288c34f..b5a6906 100755
>  --- a/utilities/bugtool/ovs-bugtool.in
>  +++ b/utilities/bugtool/ovs-bugtool.in
>  @@ -1,4 +1,4 @@
> @@ -308,7 +309,7 @@ index 350cbd9..1960fb4 100755
>   # Copyright (c) 2012 Nicira, Inc.
>   #
>  diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
> -index fc15321..bd55a41 100755
> +index 7bebc07..b4e5ca8 100755
>  --- a/utilities/ovs-pcap.in
>  +++ b/utilities/ovs-pcap.in
>  @@ -1,4 +1,4 @@
> @@ -318,7 +319,7 @@ index fc15321..bd55a41 100755
>   # Copyright (c) 2010 Nicira, Inc.
>   #
>  diff --git a/utilities/ovs-tcpdump.in b/utilities/ovs-tcpdump.in
> -index 91fa14e..bad67b7 100755
> +index 22f249f..ff2a51e 100755
>  --- a/utilities/ovs-tcpdump.in
>  +++ b/utilities/ovs-tcpdump.in
>  @@ -1,4 +1,4 @@
> @@ -328,7 +329,7 @@ index 91fa14e..bad67b7 100755
>   # Copyright (c) 2016 Red Hat, Inc.
>   #
>  diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
> -index c99015b..9a617ce 100755
> +index c298700..0d8b8da 100755
>  --- a/utilities/ovs-tcpundump.in
>  +++ b/utilities/ovs-tcpundump.in
>  @@ -1,4 +1,4 @@
> @@ -358,7 +359,7 @@ index e229498..5b70118 100755
>   # Copyright (c) 2010 Nicira, Inc.
>   #
>  diff --git a/vtep/ovs-vtep.in b/vtep/ovs-vtep.in
> -index 98748e4..3f12ae2 100755
> +index 3383870..42f98db 100755
>  --- a/vtep/ovs-vtep.in
>  +++ b/vtep/ovs-vtep.in
>  @@ -1,4 +1,4 @@
> @@ -368,5 +369,5 @@ index 98748e4..3f12ae2 100755
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
>  --
> -2.7.4
> +2.8.1
>
> diff --git a/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
> index c177202..5e5a38d 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/kernel_module.patch
> @@ -1,26 +1,29 @@
> -From adfd2380d71dff1a31efaf63cf7ac97470466ec9 Mon Sep 17 00:00:00 2001
> -From: Amy Fong <amy.fong@windriver.com>
> -Date: Thu, 29 Jan 2015 09:56:03 -0500
> -Subject: [PATCH] Specify install path for kernel module
> +From 9b7fb1346702d59af67435487254ef35940bc16a Mon Sep 17 00:00:00 2001
> +From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> +Date: Wed, 23 Jan 2019 03:41:30 -0500
> +Subject: [PATCH] datapatch/linux: Specify install path for kernel module
>
>  Signed-off-by: Amy Fong <amy.fong@windriver.com>
> -
> +Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
>  ---
>   datapath/linux/Makefile.main.in | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
>  diff --git a/datapath/linux/Makefile.main.in b/datapath/linux/Makefile.main.in
> -index 7d18253..63c520f 100644
> +index 328bbfb..6dcc8d0 100644
>  --- a/datapath/linux/Makefile.main.in
>  +++ b/datapath/linux/Makefile.main.in
>  @@ -71,8 +71,8 @@ default:
> -       $(MAKE) -C $(KSRC) M=$(builddir) modules
> +       $(MAKE) -C $(KSRC) $(if @KARCH@,ARCH=@KARCH@) M=$(builddir) modules
>
>   modules_install:
> --      $(MAKE) -C $(KSRC) M=$(builddir) modules_install
> --      depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
> -+      $(MAKE) -C $(KSRC) M=$(builddir) modules_install INSTALL_MOD_PATH=${INSTALL_MOD_PATH}
> -+      # depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
> +-      $(MAKE) -C $(KSRC) $(if @KARCH@,ARCH=@KARCH@) M=$(builddir) modules_install
> +-      /sbin/depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
> ++      $(MAKE) -C $(KSRC) $(if @KARCH@,ARCH=@KARCH@) M=$(builddir) modules_install INSTALL_MOD_PATH=${INSTALL_MOD_PATH}
> ++      #/sbin/depmod `sed -n 's/#define UTS_RELEASE "\([^"]*\)"/\1/p' $(KSRC)/include/generated/utsrelease.h`
>   endif
>
>   # Much of the kernel build system in this file is derived from Intel's
> +--
> +2.8.1
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 81a66a9..072d7f1 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -14,17 +14,17 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.10.1+${SRCPV}"
> +PV = "2.11+${SRCPV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e"
> +SRCREV = "f22ca8011fdb7e81ffce5017cd26539bccf50e94"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
>             file://openvswitch-testcontroller-setup \
> -           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.10 \
> -           file://openvswitch-add-ptest-${SRCREV}.patch \
> +           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.11 \
> +           file://openvswitch-add-ptest-78e203138cb7253e9ca5ad8a2c4ed6bb6752f23e.patch \
>             file://run-ptest \
>             file://disable_m4_check.patch \
>             file://kernel_module.patch \
> --
> 2.8.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

