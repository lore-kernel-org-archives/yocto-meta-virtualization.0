Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85220E00BE0; Wed, 21 Jun 2017 11:26:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.176 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f176.google.com (mail-qt0-f176.google.com
	[209.85.216.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 50B38E00C5B
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:15 -0700 (PDT)
Received: by mail-qt0-f176.google.com with SMTP id v20so48012149qtg.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Jun 2017 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=RC3IXEuEwlr/XPkn7M4Mid9qI08pwWdyv7X8R6UlMFs=;
	b=qLverxMLAl2q2GahNT14w6ZTq72RvTZNT3LD3/zH0vsdNXSuUgZ2Hgvbx7gp64yWp+
	/6mzWGjh4Cp1D8/2uBVM8S34CnNSGrD1i4XSftqnqUchwJhibEew109v9bItumaqp62O
	pxkVOyZd51vEM1AYztu/u8xJNlFkbYzTE+YmJuzOh78/5KR1xzNc9owGQlUZy7jVeBlT
	FLmu9x6/eAChqNn8uXTjlnwkP+nLDm9kDtdRv9SLIRhH00IgcL03L6umwKrISp5i4Tup
	ac7RWcCqhzNVOS5KeU1oa7o6gtbIWv78KCYruROtmtGl2s4EPa/si3WA3FpfayH41TEr
	2uEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=RC3IXEuEwlr/XPkn7M4Mid9qI08pwWdyv7X8R6UlMFs=;
	b=tT8oUlp8rolrx56mXkX916c5/Seiv5UMUiBM269nlruHm4AsM9xDCYlifr2dUMu54R
	qqtG4a/LMtDmjNq6WUAHjBep8AmR1WExIvjYRhr4W6RC0+K+2Zw1syUTebCRq2EhA2jL
	u3aTMVSiFtoBE4pHOV8mElSD/N3YVOBiAoGRPl30WuD0W7q4lekRc0ZkYdM64S8mY4aJ
	BfktYCiuwravEGTPDV0pULIln2vovI0DNBejdzOY3C6dC6h0TaIgAlPhehvun+WpAcfK
	VfXzxZHTK2H8BFAxu++3yFZTR/3Jayk4RHrd7H1IDXDgiuJxjwqK45/ehgBJz7+IPwTp
	btEA==
X-Gm-Message-State: AKS2vOzXW8PKyGb8hCS0fso0DkHkaeW8S14Y2TotHZ3hILuCgNycDQcN
	7ocSb2FdjosrKtGSkuegitEPjTvbrw==
X-Received: by 10.237.49.41 with SMTP id 38mr41013922qtg.161.1498069575056;
	Wed, 21 Jun 2017 11:26:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.135.172 with HTTP; Wed, 21 Jun 2017 11:26:14 -0700 (PDT)
In-Reply-To: <1497990354-21086-1-git-send-email-mark.asselstine@windriver.com>
References: <1497990354-21086-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 21 Jun 2017 14:26:14 -0400
Message-ID: <CADkTA4MsNJYcst9hr9y_0jZYzJhPVLj0mrySC0xFLAgB9kZjSg@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] openvswitch: switch to depending on python3
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
X-List-Received-Date: Wed, 21 Jun 2017 18:26:18 -0000
Content-Type: multipart/alternative; boundary="94eb2c0c955cdec37405527c8092"

--94eb2c0c955cdec37405527c8092
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Tue, Jun 20, 2017 at 4:25 PM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> As far as I can tell openvswitch has been updated to work with python3
> as well as with python(2). Switch to depend on python3 and use python3
> for associated scripts. For the most part openvswitch will bind at
> runtime to either py2 or py3 regardless of these changes, with these
> changes we just do a better job of setting up the dependencies to
> facilitate py3 bindings. The openvswitch autotests results are mostly
> identical before and after this switch (failures move from python3 to
> python(2) test cases as expected, with some exceptions see below).
>
> When running the autotests/ptest with python(2) vs python3 we see a
> slightly higher failure rate (334 failures vs. 284 failures). I do not
> believe this higher fail rate reflects actual errors in the runtime,
> rather the tests are not adapted to python3. At any rate like the rest
> of openvswitch it is fairly straightforward to hack the logic for
> autotests to be run using py2 as long as it is available in the image,
> so these changes don't prevent falling back to py2 for autotests. This
> should facilitate any debugging we need to do based on us switching to
> favor py3.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...on-make-remaining-scripts-use-usr-bin-env.patch |  18 ++--
>  ...n-switch-remaining-scripts-to-use-python3.patch | 113
> +++++++++++++++++++++
>  recipes-networking/openvswitch/openvswitch.inc     |   8 +-
>  recipes-networking/openvswitch/openvswitch_git.bb  |  11 +-
>  4 files changed, 132 insertions(+), 18 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch
>
> diff --git a/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch b/recipes-networking/
> openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> index 68f46ff..4441c1e 100644
> --- a/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
> +++ b/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
> @@ -33,7 +33,7 @@ index f79f235..c7b8730 100755
>  +++ b/build-aux/check-structs
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   import os.path
>   import sys
> @@ -43,7 +43,7 @@ index 184447b..92ea18d 100755
>  +++ b/build-aux/extract-ofp-actions
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   import sys
>   import os.path
> @@ -53,7 +53,7 @@ index 9642593..11e6de7 100755
>  +++ b/build-aux/extract-ofp-errors
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   import sys
>   import os.path
> @@ -63,7 +63,7 @@ index 498b887..5d6bcec 100755
>  +++ b/build-aux/extract-ofp-fields
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   import getopt
>   import sys
> @@ -73,7 +73,7 @@ index 1813638..e9e3c25 100755
>  +++ b/build-aux/extract-ofp-msgs
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   import sys
>   import os.path
> @@ -83,7 +83,7 @@ index bd4e879..9d81503 100755
>  +++ b/build-aux/xml2nroff
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
>   #
> @@ -93,7 +93,7 @@ index 52de3db..c90f02b 100755
>  +++ b/ovn/utilities/ovn-docker-overlay-driver
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>   # Copyright (C) 2015 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> @@ -103,7 +103,7 @@ index 2c9c4b6..89b804c 100755
>  +++ b/ovn/utilities/ovn-docker-underlay-driver
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>   # Copyright (C) 2015 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> @@ -113,7 +113,7 @@ index 5cf26ee..f76f4bd 100755
>  +++ b/ovsdb/ovsdb-doc
>  @@ -1,4 +1,4 @@
>  -#! /usr/bin/python
> -+#! /usr/bin/env python
> ++#! /usr/bin/env python3
>
>   # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
>   #
> diff --git a/recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch b/recipes-networking/
> openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> new file mode 100644
> index 0000000..a02b2a4
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch
> @@ -0,0 +1,113 @@
> +From 176528ca3a8b76c9d0bb71b1e56eeebccc655c71 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Wed, 3 May 2017 10:39:12 -0400
> +Subject: [PATCH] python: switch remaining scripts to use python3
> +
> +Work to remove the main openvswitch package's dependency on python 2.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + ofproto/ipfix-gen-entities                            | 2 +-
> + tests/test-l7.py                                      | 2 +-
> + utilities/checkpatch.py                               | 2 +-
> + utilities/ovs-dev.py                                  | 2 +-
> + utilities/ovs-pipegen.py                              | 2 +-
> + vtep/ovs-vtep                                         | 2 +-
> + xenserver/etc_xapi.d_plugins_openvswitch-cfg-update   | 2 +-
> + xenserver/opt_xensource_libexec_interface-reconfigure | 2 +-
> + xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync | 2 +-
> + 9 files changed, 9 insertions(+), 9 deletions(-)
> +
> +diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities
> +index 0be7199..d2cce42 100755
> +--- a/ofproto/ipfix-gen-entities
> ++++ b/ofproto/ipfix-gen-entities
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + #
> + # Copyright (C) 2012 Nicira, Inc.
> + #
> +diff --git a/tests/test-l7.py b/tests/test-l7.py
> +index d7854a1..f09defb 100755
> +--- a/tests/test-l7.py
> ++++ b/tests/test-l7.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # Copyright (c) 2015, 2016 Nicira, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/utilities/checkpatch.py b/utilities/checkpatch.py
> +index 26eb5c3..2e1932b 100755
> +--- a/utilities/checkpatch.py
> ++++ b/utilities/checkpatch.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # Copyright (c) 2016 Red Hat, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
> +index 9ce0f04..839e13e 100755
> +--- a/utilities/ovs-dev.py
> ++++ b/utilities/ovs-dev.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # Copyright (c) 2013, 2014, 2015, 2016 Nicira, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/utilities/ovs-pipegen.py b/utilities/ovs-pipegen.py
> +index 4bf240f..2a8f13e 100755
> +--- a/utilities/ovs-pipegen.py
> ++++ b/utilities/ovs-pipegen.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + # Copyright (c) 2013, 2014, 2015 Nicira, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep
> +index fd652d4..19d63f9 100755
> +--- a/vtep/ovs-vtep
> ++++ b/vtep/ovs-vtep
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> +index e7404e3..5edad76 100755
> +--- a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> ++++ b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + #
> + # xapi plugin script to update the cache of configuration items in the
> + # ovs-vswitchd configuration that are managed in the xapi database when
> +diff --git a/xenserver/opt_xensource_libexec_interface-reconfigure
> b/xenserver/opt_xensource_libexec_interface-reconfigure
> +index ea4a742..c6745ee 100755
> +--- a/xenserver/opt_xensource_libexec_interface-reconfigure
> ++++ b/xenserver/opt_xensource_libexec_interface-reconfigure
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + #
> + # Copyright (c) 2008,2009 Citrix Systems, Inc.
> + #
> +diff --git a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
> b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
> +index a776c00..d5ff8af 100755
> +--- a/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
> ++++ b/xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + # Copyright (c) 2009, 2010, 2011, 2012, 2013 Nicira, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index 1f0b52b..0e2e67f 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -11,11 +11,11 @@ HOMEPAGE = "http://openvswitch.org/"
>  SECTION = "networking"
>  LICENSE = "Apache-2"
>
> -DEPENDS += "bridge-utils openssl python perl python-six-native
> coreutils-native"
> +DEPENDS += "bridge-utils openssl python3 perl python3-six-native
> coreutils-native"
>
>  RDEPENDS_${PN} += "util-linux-uuidgen util-linux-libuuid coreutils \
> -       python perl perl-module-strict ${PN}-switch \
> -        bash python-twisted python-six"
> +        python3 perl perl-module-strict ${PN}-switch \
> +        bash python3-twisted python3-six"
>  RDEPENDS_${PN}-testcontroller = "${PN} lsb ${PN}-pki"
>  RDEPENDS_${PN}-switch = "${PN} openssl procps util-linux-uuidgen"
>  RDEPENDS_${PN}-pki = "${PN}"
> @@ -70,7 +70,7 @@ FILES_${PN} += "${datadir}/ovsdbmonitor"
>  FILES_${PN} += "/run"
>
>  FILES_${PN} += "${libdir}/python${PYTHON_BASEVERSION}/"
> -inherit autotools update-rc.d systemd pythonnative
> +inherit autotools update-rc.d systemd python3native
>
>  SYSTEMD_PACKAGES = "${PN}-switch"
>  SYSTEMD_SERVICE_${PN}-switch = " \
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index a17c273..a2893e9 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -3,12 +3,12 @@ require openvswitch.inc
>  DEPENDS += "virtual/kernel"
>
>  RDEPENDS_${PN}-ptest += "\
> -       python-logging python-syslog python-argparse python-io \
> -       python-fcntl python-shell python-lang python-xml python-math \
> -       python-datetime python-netclient python sed \
> +       python3-logging python3-syslog python3-argparse python3-io \
> +       python3-fcntl python3-shell python3-lang python3-xml python3-math \
> +       python3-datetime python3-netclient python3 sed \
>         ldd perl-module-socket perl-module-carp perl-module-exporter \
> -       perl-module-xsloader python-netserver python-threading \
> -       python-resource python-subprocess findutils which \
> +       perl-module-xsloader python3-netserver python3-threading \
> +       python3-resource python3-subprocess findutils which \
>         "
>
>  S = "${WORKDIR}/git"
> @@ -30,6 +30,7 @@ SRC_URI = "file://openvswitch-switch \
>             file://0001-use-the-linux-if_packet.h-Interface-directly.patch
> \
>             file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
>             file://CVE-2017-9263.patch \
> +           file://python-switch-remaining-scripts-to-use-python3.patch \
>             "
>
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c0c955cdec37405527c8092
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged.<div><br></div><div>Bruce</div></div><div class=3D"=
gmail_extra"><br><div class=3D"gmail_quote">On Tue, Jun 20, 2017 at 4:25 PM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">As far as I can tell openvswitch=
 has been updated to work with python3<br>
as well as with python(2). Switch to depend on python3 and use python3<br>
for associated scripts. For the most part openvswitch will bind at<br>
runtime to either py2 or py3 regardless of these changes, with these<br>
changes we just do a better job of setting up the dependencies to<br>
facilitate py3 bindings. The openvswitch autotests results are mostly<br>
identical before and after this switch (failures move from python3 to<br>
python(2) test cases as expected, with some exceptions see below).<br>
<br>
When running the autotests/ptest with python(2) vs python3 we see a<br>
slightly higher failure rate (334 failures vs. 284 failures). I do not<br>
believe this higher fail rate reflects actual errors in the runtime,<br>
rather the tests are not adapted to python3. At any rate like the rest<br>
of openvswitch it is fairly straightforward to hack the logic for<br>
autotests to be run using py2 as long as it is available in the image,<br>
so these changes don&#39;t prevent falling back to py2 for autotests. This<=
br>
should facilitate any debugging we need to do based on us switching to<br>
favor py3.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...on-make-remaining-scripts-<wbr>use-usr-bin-env.patch |=C2=A0 18 ++=
--<br>
=C2=A0...n-switch-remaining-scripts-<wbr>to-use-python3.patch | 113 +++++++=
++++++++++++++<br>
=C2=A0recipes-networking/<wbr>openvswitch/openvswitch.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=
=A0 11 +-<br>
=C2=A04 files changed, 132 insertions(+), 18 deletions(-)<br>
=C2=A0create mode 100644 recipes-networking/<wbr>openvswitch/files/python-<=
wbr>switch-remaining-scripts-to-<wbr>use-python3.patch<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>rem=
aining-scripts-use-usr-bin-<wbr>env.patch b/recipes-networking/<wbr>openvsw=
itch/files/python-make-<wbr>remaining-scripts-use-usr-bin-<wbr>env.patch<br=
>
index 68f46ff..4441c1e 100644<br>
--- a/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>remaining-=
scripts-use-usr-bin-<wbr>env.patch<br>
+++ b/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>remaining-=
scripts-use-usr-bin-<wbr>env.patch<br>
@@ -33,7 +33,7 @@ index f79f235..c7b8730 100755<br>
=C2=A0+++ b/build-aux/check-structs<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 import os.path<br>
=C2=A0 import sys<br>
@@ -43,7 +43,7 @@ index 184447b..92ea18d 100755<br>
=C2=A0+++ b/build-aux/extract-ofp-<wbr>actions<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
@@ -53,7 +53,7 @@ index 9642593..11e6de7 100755<br>
=C2=A0+++ b/build-aux/extract-ofp-errors<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
@@ -63,7 +63,7 @@ index 498b887..5d6bcec 100755<br>
=C2=A0+++ b/build-aux/extract-ofp-fields<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 import getopt<br>
=C2=A0 import sys<br>
@@ -73,7 +73,7 @@ index 1813638..e9e3c25 100755<br>
=C2=A0+++ b/build-aux/extract-ofp-msgs<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
@@ -83,7 +83,7 @@ index bd4e879..9d81503 100755<br>
=C2=A0+++ b/build-aux/xml2nroff<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc=
.<br>
=C2=A0 #<br>
@@ -93,7 +93,7 @@ index 52de3db..c90f02b 100755<br>
=C2=A0+++ b/ovn/utilities/ovn-docker-<wbr>overlay-driver<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
=C2=A0 # Copyright (C) 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
@@ -103,7 +103,7 @@ index 2c9c4b6..89b804c 100755<br>
=C2=A0+++ b/ovn/utilities/ovn-docker-<wbr>underlay-driver<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
=C2=A0 # Copyright (C) 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
@@ -113,7 +113,7 @@ index 5cf26ee..f76f4bd 100755<br>
=C2=A0+++ b/ovsdb/ovsdb-doc<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! /usr/bin/python<br>
-+#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
<br>
=C2=A0 # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.<br>
=C2=A0 #<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/python-<wbr>switch-r=
emaining-scripts-to-<wbr>use-python3.patch b/recipes-networking/<wbr>openvs=
witch/files/python-<wbr>switch-remaining-scripts-to-<wbr>use-python3.patch<=
br>
new file mode 100644<br>
index 0000000..a02b2a4<br>
--- /dev/null<br>
+++ b/recipes-networking/<wbr>openvswitch/files/python-<wbr>switch-remainin=
g-scripts-to-<wbr>use-python3.patch<br>
@@ -0,0 +1,113 @@<br>
+From 176528ca3a8b76c9d0bb71b1e56eee<wbr>bccc655c71 Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Wed, 3 May 2017 10:39:12 -0400<br>
+Subject: [PATCH] python: switch remaining scripts to use python3<br>
+<br>
+Work to remove the main openvswitch package&#39;s dependency on python 2.<=
br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ ofproto/ipfix-gen-entities=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/test-l7.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 2 +-<br>
+ utilities/checkpatch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/ovs-dev.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<b=
r>
+ utilities/ovs-pipegen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ vtep/ovs-vtep=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
+ xenserver/etc_xapi.d_plugins_<wbr>openvswitch-cfg-update=C2=A0 =C2=A0| 2 =
+-<br>
+ xenserver/opt_xensource_<wbr>libexec_interface-reconfigure | 2 +-<br>
+ xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sync | 2 +-<br=
>
+ 9 files changed, 9 insertions(+), 9 deletions(-)<br>
+<br>
+diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities<br>
+index 0be7199..d2cce42 100755<br>
+--- a/ofproto/ipfix-gen-entities<br>
++++ b/ofproto/ipfix-gen-entities<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ #<br>
+ # Copyright (C) 2012 Nicira, Inc.<br>
+ #<br>
+diff --git a/tests/test-l7.py b/tests/test-l7.py<br>
+index d7854a1..f09defb 100755<br>
+--- a/tests/test-l7.py<br>
++++ b/tests/test-l7.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # Copyright (c) 2015, 2016 Nicira, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+diff --git a/utilities/checkpatch.py b/utilities/checkpatch.py<br>
+index 26eb5c3..2e1932b 100755<br>
+--- a/utilities/checkpatch.py<br>
++++ b/utilities/checkpatch.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # Copyright (c) 2016 Red Hat, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py<br>
+index 9ce0f04..839e13e 100755<br>
+--- a/utilities/ovs-dev.py<br>
++++ b/utilities/ovs-dev.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ # Copyright (c) 2013, 2014, 2015, 2016 Nicira, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+diff --git a/utilities/ovs-pipegen.py b/utilities/ovs-pipegen.py<br>
+index 4bf240f..2a8f13e 100755<br>
+--- a/utilities/ovs-pipegen.py<br>
++++ b/utilities/ovs-pipegen.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ # Copyright (c) 2013, 2014, 2015 Nicira, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep<br>
+index fd652d4..19d63f9 100755<br>
+--- a/vtep/ovs-vtep<br>
++++ b/vtep/ovs-vtep<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+diff --git a/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update b/xe=
nserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update<br>
+index e7404e3..5edad76 100755<br>
+--- a/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update<br>
++++ b/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ #<br>
+ # xapi plugin script to update the cache of configuration items in the<br=
>
+ # ovs-vswitchd configuration that are managed in the xapi database when<b=
r>
+diff --git a/xenserver/opt_xensource_<wbr>libexec_interface-reconfigure b/=
xenserver/opt_xensource_<wbr>libexec_interface-reconfigure<br>
+index ea4a742..c6745ee 100755<br>
+--- a/xenserver/opt_xensource_<wbr>libexec_interface-reconfigure<br>
++++ b/xenserver/opt_xensource_<wbr>libexec_interface-reconfigure<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ #<br>
+ # Copyright (c) 2008,2009 Citrix Systems, Inc.<br>
+ #<br>
+diff --git a/xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sy=
nc b/xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sync<br>
+index a776c00..d5ff8af 100755<br>
+--- a/xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sync<br>
++++ b/xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sync<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ # Copyright (c) 2009, 2010, 2011, 2012, 2013 Nicira, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+--<br>
+2.7.4<br>
+<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/recipes-=
networking/<wbr>openvswitch/openvswitch.inc<br>
index 1f0b52b..0e2e67f 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
@@ -11,11 +11,11 @@ HOMEPAGE =3D &quot;<a href=3D"http://openvswitch.org/" =
rel=3D"noreferrer" target=3D"_blank">http://openvswitch.org/</a>&quot;<br>
=C2=A0SECTION =3D &quot;networking&quot;<br>
=C2=A0LICENSE =3D &quot;Apache-2&quot;<br>
<br>
-DEPENDS +=3D &quot;bridge-utils openssl python perl python-six-native core=
utils-native&quot;<br>
+DEPENDS +=3D &quot;bridge-utils openssl python3 perl python3-six-native co=
reutils-native&quot;<br>
<br>
=C2=A0RDEPENDS_${PN} +=3D &quot;util-linux-uuidgen util-linux-libuuid coreu=
tils \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python perl perl-module-strict ${PN}-switch \<b=
r>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash python-twisted python-six&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 python3 perl perl-module-strict ${PN}-switch \=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 bash python3-twisted python3-six&quot;<br>
=C2=A0RDEPENDS_${PN}-testcontroller =3D &quot;${PN} lsb ${PN}-pki&quot;<br>
=C2=A0RDEPENDS_${PN}-switch =3D &quot;${PN} openssl procps util-linux-uuidg=
en&quot;<br>
=C2=A0RDEPENDS_${PN}-pki =3D &quot;${PN}&quot;<br>
@@ -70,7 +70,7 @@ FILES_${PN} +=3D &quot;${datadir}/ovsdbmonitor&quot;<br>
=C2=A0FILES_${PN} +=3D &quot;/run&quot;<br>
<br>
=C2=A0FILES_${PN} +=3D &quot;${libdir}/python${PYTHON_<wbr>BASEVERSION}/&qu=
ot;<br>
-inherit autotools update-rc.d systemd pythonnative<br>
+inherit autotools update-rc.d systemd python3native<br>
<br>
=C2=A0SYSTEMD_PACKAGES =3D &quot;${PN}-switch&quot;<br>
=C2=A0SYSTEMD_SERVICE_${PN}-switch =3D &quot; \<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index a17c273..a2893e9 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -3,12 +3,12 @@ require openvswitch.inc<br>
=C2=A0DEPENDS +=3D &quot;virtual/kernel&quot;<br>
<br>
=C2=A0RDEPENDS_${PN}-ptest +=3D &quot;\<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-logging python-syslog python-argparse py=
thon-io \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-fcntl python-shell python-lang python-xm=
l python-math \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-datetime python-netclient python sed \<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-logging python3-syslog python3-argparse=
 python3-io \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-fcntl python3-shell python3-lang python=
3-xml python3-math \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-datetime python3-netclient python3 sed =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ldd perl-module-socket perl-module-carp perl-mo=
dule-exporter \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0perl-module-xsloader python-netserver python-th=
reading \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0python-resource python-subprocess findutils whi=
ch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0perl-module-xsloader python3-netserver python3-=
threading \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0python3-resource python3-subprocess findutils w=
hich \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
@@ -30,6 +30,7 @@ SRC_URI =3D &quot;file://openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0001-use-the-linux-if_<wbr=
>packet.h-Interface-directly.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Define-WAIT_ANY-<wbr>=
if-not-provided-by-system.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://CVE-2017-9263.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://python-switch-<wbr>remaini=
ng-scripts-to-use-<wbr>python3.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org">meta-virtualization=
@<wbr>yoctoproject.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.<wbr>org/listi=
nfo/meta-<wbr>virtualization</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div>

--94eb2c0c955cdec37405527c8092--
