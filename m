Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0602BE00AD8; Sun,  3 Jun 2018 20:27:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	URI_NOVOWEL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	*  0.5 URI_NOVOWEL URI: URI hostname has long non-vowel sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f46.google.com (mail-lf0-f46.google.com
	[209.85.215.46])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9A178E00AD8
	for <meta-virtualization@yoctoproject.org>;
	Sun,  3 Jun 2018 20:27:33 -0700 (PDT)
Received: by mail-lf0-f46.google.com with SMTP id d24-v6so22873839lfa.8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 03 Jun 2018 20:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PF7zDpAp6lB9OlILFB0yX+PzlWlF97+K/nPwbVLeHqA=;
	b=AcHAy0yK304npYcRMQCdMX9k2S0eTYQUABcpqtAx/0DYstFwCEZW908hn7obFBwBKh
	C1RjsfqPXgVBfpkDYNFBXqml11p6QMlRkfJ+ujAqJcCkuGFUyKI5AWdd0h7K/Y/Pr38y
	OKywJ1TFIdxqNMz0uV4SxZfO84iJp4ZnjmcQzezoD7i7YecewstmF+yDdkYJfYt+ZOD3
	j5wFAwCX97ZvfbQKX4WALAzxZLQNUeieTf//Rpq01CVQ+xiwdVcgYcOhZFns0oG3FEPl
	ZHxjVPVpeP6JUnbrz0UATi+r8EZV+yW/vgeZ4TCm+i235g/BkkxaYXco/jnmFz/4CaqT
	umig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PF7zDpAp6lB9OlILFB0yX+PzlWlF97+K/nPwbVLeHqA=;
	b=htHcpyhHXncuBtcCmDnZRRBJOUvAEjSA9JqZh22shEf937Xdd/Ze9pQz5kV1vvS2PQ
	RqWxRRjuUHVqJj/zVyJSG63MoURdActfO0vSEekPxmLHHSt+Efl+KfJ9vVdsroOlsmrC
	Um1Gv042BcqoWW5U8G596ytJvJIeXWUdtdsoqPSvjbqO+5EFFxfIXyCl+BCUbrM6yBsB
	XBDlaNARIc7YZStz3Npoas50jT1S+ian+ObhMvUwl5Js5UMOw4ogtcwxHORIPoH7nloV
	b8tu1conEoIlsn17z6ZwG2lhL7KrW4NenBjueV8NGXb2hCplrkOUn8cJWJ9BbGrZGU7n
	/2cA==
X-Gm-Message-State: ALKqPwfXcxajUYB4x8H7AgJMizjUbwP/x6wQTetmsqHS4XgkE7Ceu0XX
	sS6L6DC/gXPQMtg9EG6iKjseGpX+ODGiMXa/Di6kjQ==
X-Google-Smtp-Source: ADUXVKKQNTlkITDE7xkKzl3MPKZjAkm718pmfL8WyURYscfaO/TEhHFBnFE3Ec9iga+fv4VbgOaN8w5snu4is376p4s=
X-Received: by 2002:a2e:29cf:: with SMTP id
	p76-v6mr14533974ljp.12.1528082852076; 
	Sun, 03 Jun 2018 20:27:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:161a:0:0:0:0:0 with HTTP;
	Sun, 3 Jun 2018 20:27:31 -0700 (PDT)
In-Reply-To: <1527695230-1460-1-git-send-email-mark.asselstine@windriver.com>
References: <1527695230-1460-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Sun, 3 Jun 2018 23:27:31 -0400
Message-ID: <CADkTA4OOJnYQ7-uEPEGbe3XL4DE=9g-UctpSGww0=h2VWzO5dA@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: uprev to v2.9.2
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
X-List-Received-Date: Mon, 04 Jun 2018 03:27:44 -0000
Content-Type: multipart/alternative; boundary="00000000000095e2b1056dc88359"

--00000000000095e2b1056dc88359
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Wed, May 30, 2018 at 11:47 AM, Mark Asselstine <
mark.asselstine@windriver.com> wrote:

> This brings us up to date with the latest upstream release. I suspect
> there will be an upcoming release to add compatibility with DPDK
> v18.05 (the DPDK release is due out any day now) but getting this
> fairly large release bump out of the way first will facilitate any
> upcoming uprev.
>
> We are able to drop they python3 patches as they have been merged
> upstream. Some scripts which needed to be updated to use python3
> disappeared, new ones appeared so the 'use python3' patches are
> updated accordingly. Beyond this the biggest change is related to the
> systemd unit files, the ovsdb-server has been updated upstream to be
> generated on the fly via the spec file, we mimic this in the
> install_prepend. We also add the various configuration files which the
> unit files source before launching the services.
>
> As usual this was tested against out typical usecases including usage
> in meta-overc. As well the ptests have been run and the results are no
> better or worse.
>
>    Previous version:
>     ERROR: 2332 tests were run,
>     21 failed unexpectedly.
>     3 tests were skipped.
>
>    New version:
>     ERROR: 2527 tests were run,
>     29 failed unexpectedly.
>     3 tests were skipped.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...on-make-remaining-scripts-use-usr-bin-env.patch | 298
> ++++++++++++++++++---
>  ...n-switch-remaining-scripts-to-use-python3.patch |  15 +-
>  .../openvswitch-git/disable_m4_check.patch         |   8 +-
>  ...-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch | 110 ++++++++
>  .../systemd-update-tool-paths.patch                |  45 ++++
>  recipes-networking/openvswitch/openvswitch.inc     |  18 ++
>  recipes-networking/openvswitch/openvswitch_git.bb  |  22 +-
>  7 files changed, 443 insertions(+), 73 deletions(-)
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
>  create mode 100644 recipes-networking/openvswitch/openvswitch-git/
> systemd-update-tool-paths.patch
>
> diff --git a/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch b/recipes-networking/
> openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> index deff10b..0dc6b11 100644
> --- a/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
> +++ b/recipes-networking/openvswitch/files/python-make-
> remaining-scripts-use-usr-bin-env.patch
> @@ -1,4 +1,4 @@
> -From f21a0490555d5fe8f5a9ce982defa666a64151c0 Mon Sep 17 00:00:00 2001
> +From a0a2d829642e916bd5d1c498a3e6f3641ed717a0 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Fri, 13 Jan 2017 16:12:55 -0500
>  Subject: [PATCH] python: make remaining scripts use /usr/bin/env
> @@ -12,24 +12,43 @@ PYTHON. To make this function smoothly all installed
> scripts should
>  make use of /usr/bin/env to increase the chances of finding python.
>
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -
>  ---
> - build-aux/check-structs                  | 2 +-
> - build-aux/extract-ofp-actions            | 2 +-
> - build-aux/extract-ofp-errors             | 2 +-
> - build-aux/extract-ofp-fields             | 2 +-
> - build-aux/extract-ofp-msgs               | 2 +-
> - build-aux/xml2nroff                      | 2 +-
> - ovn/utilities/ovn-docker-overlay-driver  | 2 +-
> - ovn/utilities/ovn-docker-underlay-driver | 2 +-
> - ovsdb/ovsdb-doc                          | 2 +-
> - ovsdb/ovsdb-dot.in                       | 2 +-
> - ovsdb/ovsdb-idlc.in                      | 2 +-
> - utilities/bugtool/ovs-bugtool.in         | 2 +-
> - 12 files changed, 12 insertions(+), 12 deletions(-)
> + build-aux/check-structs                     | 2 +-
> + build-aux/dpdkstrip.py                      | 2 +-
> + build-aux/extract-ofp-actions               | 2 +-
> + build-aux/extract-ofp-errors                | 2 +-
> + build-aux/extract-ofp-fields                | 2 +-
> + build-aux/extract-ofp-msgs                  | 2 +-
> + build-aux/sodepends.py                      | 2 +-
> + build-aux/soexpand.py                       | 2 +-
> + build-aux/text2c                            | 2 +-
> + build-aux/xml2nroff                         | 2 +-
> + ovn/utilities/ovn-detrace.in                | 2 +-
> + ovn/utilities/ovn-docker-overlay-driver.in  | 2 +-
> + ovn/utilities/ovn-docker-underlay-driver.in | 2 +-
> + ovsdb/dot2pic                               | 2 +-
> + ovsdb/ovsdb-doc                             | 2 +-
> + ovsdb/ovsdb-dot.in                          | 2 +-
> + ovsdb/ovsdb-idlc.in                         | 2 +-
> + python/build/soutil.py                      | 2 +-
> + tests/flowgen.py                            | 2 +-
> + tests/ovsdb-monitor-sort.py                 | 2 +-
> + tests/uuidfilt.py                           | 2 +-
> + utilities/bugtool/ovs-bugtool.in            | 2 +-
> + utilities/ovs-check-dead-ifs.in             | 2 +-
> + utilities/ovs-dpctl-top.in                  | 2 +-
> + utilities/ovs-l3ping.in                     | 2 +-
> + utilities/ovs-parse-backtrace.in            | 2 +-
> + utilities/ovs-pcap.in                       | 2 +-
> + utilities/ovs-tcpdump.in                    | 2 +-
> + utilities/ovs-tcpundump.in                  | 2 +-
> + utilities/ovs-test.in                       | 2 +-
> + utilities/ovs-vlan-test.in                  | 2 +-
> + vtep/ovs-vtep.in                            | 2 +-
> + 32 files changed, 32 insertions(+), 32 deletions(-)
>
>  diff --git a/build-aux/check-structs b/build-aux/check-structs
> -index f79f235..5129b72 100755
> +index 37ffa06..eb44c91 100755
>  --- a/build-aux/check-structs
>  +++ b/build-aux/check-structs
>  @@ -1,4 +1,4 @@
> @@ -38,8 +57,18 @@ index f79f235..5129b72 100755
>
>   import os.path
>   import sys
> +diff --git a/build-aux/dpdkstrip.py b/build-aux/dpdkstrip.py
> +index 48c7f06..b8b8ba9 100755
> +--- a/build-aux/dpdkstrip.py
> ++++ b/build-aux/dpdkstrip.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> + # Copyright (c) 2017 Red Hat, Inc.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
>  diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-
> actions
> -index 0062ab8..ee8c4ff 100755
> +index bd7131f..4d05ef9 100755
>  --- a/build-aux/extract-ofp-actions
>  +++ b/build-aux/extract-ofp-actions
>  @@ -1,4 +1,4 @@
> @@ -49,7 +78,7 @@ index 0062ab8..ee8c4ff 100755
>   import sys
>   import os.path
>  diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
> -index 2312b76..e36444e 100755
> +index 71ae0bd..58ba006 100755
>  --- a/build-aux/extract-ofp-errors
>  +++ b/build-aux/extract-ofp-errors
>  @@ -1,4 +1,4 @@
> @@ -59,7 +88,7 @@ index 2312b76..e36444e 100755
>   import sys
>   import os.path
>  diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
> -index 498b887..c248e76 100755
> +index 184b75e..cf339f8 100755
>  --- a/build-aux/extract-ofp-fields
>  +++ b/build-aux/extract-ofp-fields
>  @@ -1,4 +1,4 @@
> @@ -69,7 +98,7 @@ index 498b887..c248e76 100755
>   import getopt
>   import sys
>  diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
> -index 1813638..c2a91f9 100755
> +index a67e870..92c4bda 100755
>  --- a/build-aux/extract-ofp-msgs
>  +++ b/build-aux/extract-ofp-msgs
>  @@ -1,4 +1,4 @@
> @@ -78,6 +107,36 @@ index 1813638..c2a91f9 100755
>
>   import sys
>   import os.path
> +diff --git a/build-aux/sodepends.py b/build-aux/sodepends.py
> +index 90cfaa0..45812bc 100755
> +--- a/build-aux/sodepends.py
> ++++ b/build-aux/sodepends.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Copyright (c) 2008, 2011, 2017 Nicira, Inc.
> + #
> +diff --git a/build-aux/soexpand.py b/build-aux/soexpand.py
> +index 53ca640..00adcf4 100755
> +--- a/build-aux/soexpand.py
> ++++ b/build-aux/soexpand.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Copyright (c) 2008, 2017 Nicira, Inc.
> + #
> +diff --git a/build-aux/text2c b/build-aux/text2c
> +index cb1f256..ab7910e 100755
> +--- a/build-aux/text2c
> ++++ b/build-aux/text2c
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/python
> ++#! /usr/bin/env python3
> +
> + import re
> + import sys
>  diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff
>  index bd4e879..db45c56 100755
>  --- a/build-aux/xml2nroff
> @@ -88,28 +147,48 @@ index bd4e879..db45c56 100755
>
>   # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
>   #
> -diff --git a/ovn/utilities/ovn-docker-overlay-driver
> b/ovn/utilities/ovn-docker-overlay-driver
> -index 52de3db..3b1fa45 100755
> ---- a/ovn/utilities/ovn-docker-overlay-driver
> -+++ b/ovn/utilities/ovn-docker-overlay-driver
> +diff --git a/ovn/utilities/ovn-detrace.in b/ovn/utilities/ovn-detrace.in
> +index e2e5b4c..5549219 100755
> +--- a/ovn/utilities/ovn-detrace.in
> ++++ b/ovn/utilities/ovn-detrace.in
>  @@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2017 eBay Inc.
> + #
> +diff --git a/ovn/utilities/ovn-docker-overlay-driver.in b/ovn/utilities/
> ovn-docker-overlay-driver.in
> +index 65edfcd..895426b 100755
> +--- a/ovn/utilities/ovn-docker-overlay-driver.in
> ++++ b/ovn/utilities/ovn-docker-overlay-driver.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
>   # Copyright (C) 2015 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/ovn/utilities/ovn-docker-underlay-driver
> b/ovn/utilities/ovn-docker-underlay-driver
> -index 2c9c4b6..551e7a1 100755
> ---- a/ovn/utilities/ovn-docker-underlay-driver
> -+++ b/ovn/utilities/ovn-docker-underlay-driver
> +diff --git a/ovn/utilities/ovn-docker-underlay-driver.in b/ovn/utilities/
> ovn-docker-underlay-driver.in
> +index d91ce9f..e0c8db6 100755
> +--- a/ovn/utilities/ovn-docker-underlay-driver.in
> ++++ b/ovn/utilities/ovn-docker-underlay-driver.in
>  @@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
>   # Copyright (C) 2015 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> +diff --git a/ovsdb/dot2pic b/ovsdb/dot2pic
> +index de67261..174e723 100755
> +--- a/ovsdb/dot2pic
> ++++ b/ovsdb/dot2pic
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Copyright (c) 2009, 2010, 2011, 2013, 2017 Nicira, Inc.
> + #
>  diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
> -index 5cf26ee..bdf2dcc 100755
> +index 406c293..d55c6e6 100755
>  --- a/ovsdb/ovsdb-doc
>  +++ b/ovsdb/ovsdb-doc
>  @@ -1,4 +1,4 @@
> @@ -119,7 +198,7 @@ index 5cf26ee..bdf2dcc 100755
>   # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
>   #
>  diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
> -index 134ce22..893c408 100755
> +index 8eea617..38ba33a 100755
>  --- a/ovsdb/ovsdb-dot.in
>  +++ b/ovsdb/ovsdb-dot.in
>  @@ -1,4 +1,4 @@
> @@ -129,17 +208,57 @@ index 134ce22..893c408 100755
>   from datetime import date
>   import ovs.db.error
>  diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> -index 721ab50..bfbcf23 100755
> +index 1ea2115..4ecb2e2 100755
>  --- a/ovsdb/ovsdb-idlc.in
>  +++ b/ovsdb/ovsdb-idlc.in
>  @@ -1,4 +1,4 @@
>  -#! @PYTHON@
> -+#! /usr/bin/env @PYTHON@
> ++#!/usr/bin/env @PYTHON@
>
> + from __future__ import print_function
>   import getopt
> - import os
> +diff --git a/python/build/soutil.py b/python/build/soutil.py
> +index b8027af..8f52803 100755
> +--- a/python/build/soutil.py
> ++++ b/python/build/soutil.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Copyright (c) 2008, 2017 Nicira, Inc.
> + #
> +diff --git a/tests/flowgen.py b/tests/flowgen.py
> +index 221a8f2..5d96d76 100755
> +--- a/tests/flowgen.py
> ++++ b/tests/flowgen.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Copyright (c) 2009, 2010, 2011, 2012, 2015, 2017 Nicira, Inc.
> + #
> +diff --git a/tests/ovsdb-monitor-sort.py b/tests/ovsdb-monitor-sort.py
> +index 7d368a7..ab4c38c 100755
> +--- a/tests/ovsdb-monitor-sort.py
> ++++ b/tests/ovsdb-monitor-sort.py
> +@@ -1,4 +1,4 @@
> +-#! /usr/bin/env python
> ++#! /usr/bin/env python3
> +
> + # Breaks lines read from stdin into groups using blank lines as
> + # group separators, then sorts lines within the groups for
> +diff --git a/tests/uuidfilt.py b/tests/uuidfilt.py
> +index ea72812..f1a9aff 100755
> +--- a/tests/uuidfilt.py
> ++++ b/tests/uuidfilt.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> +
> + import re
> + import sys
>  diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-
> bugtool.in
> -index 963c50c..c84d7c2 100755
> +index 8d220fd..76cedf4 100755
>  --- a/utilities/bugtool/ovs-bugtool.in
>  +++ b/utilities/bugtool/ovs-bugtool.in
>  @@ -1,4 +1,4 @@
> @@ -148,3 +267,106 @@ index 963c50c..c84d7c2 100755
>
>   # This library is free software; you can redistribute it and/or
>   # modify it under the terms of version 2.1 of the GNU Lesser General
> Public
> +diff --git a/utilities/ovs-check-dead-ifs.in b/utilities/ovs-check-dead-
> ifs.in
> +index ac54f6c..13d86b3 100755
> +--- a/utilities/ovs-check-dead-ifs.in
> ++++ b/utilities/ovs-check-dead-ifs.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> +
> + import os
> + import re
> +diff --git a/utilities/ovs-dpctl-top.in b/utilities/ovs-dpctl-top.in
> +index 7f0f1f8..ece707a 100755
> +--- a/utilities/ovs-dpctl-top.in
> ++++ b/utilities/ovs-dpctl-top.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2013 Nicira, Inc.
> + #
> +diff --git a/utilities/ovs-l3ping.in b/utilities/ovs-l3ping.in
> +index 1b07972..9852699 100644
> +--- a/utilities/ovs-l3ping.in
> ++++ b/utilities/ovs-l3ping.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> + # you may not use this file except in compliance with the License.
> +diff --git a/utilities/ovs-parse-backtrace.in b/utilities/ovs-parse-
> backtrace.in
> +index 350cbd9..1960fb4 100755
> +--- a/utilities/ovs-parse-backtrace.in
> ++++ b/utilities/ovs-parse-backtrace.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2012 Nicira, Inc.
> + #
> +diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
> +index fc15321..bd55a41 100755
> +--- a/utilities/ovs-pcap.in
> ++++ b/utilities/ovs-pcap.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2010 Nicira, Inc.
> + #
> +diff --git a/utilities/ovs-tcpdump.in b/utilities/ovs-tcpdump.in
> +index 91fa14e..bad67b7 100755
> +--- a/utilities/ovs-tcpdump.in
> ++++ b/utilities/ovs-tcpdump.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2016 Red Hat, Inc.
> + #
> +diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
> +index c99015b..9a617ce 100755
> +--- a/utilities/ovs-tcpundump.in
> ++++ b/utilities/ovs-tcpundump.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2010 Nicira, Inc.
> + #
> +diff --git a/utilities/ovs-test.in b/utilities/ovs-test.in
> +index fb1f9ad..4dba169 100644
> +--- a/utilities/ovs-test.in
> ++++ b/utilities/ovs-test.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> + # you may not use this file except in compliance with the License.
> +diff --git a/utilities/ovs-vlan-test.in b/utilities/ovs-vlan-test.in
> +index e229498..5b70118 100755
> +--- a/utilities/ovs-vlan-test.in
> ++++ b/utilities/ovs-vlan-test.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + #
> + # Copyright (c) 2010 Nicira, Inc.
> + #
> +diff --git a/vtep/ovs-vtep.in b/vtep/ovs-vtep.in
> +index 98748e4..3f12ae2 100755
> +--- a/vtep/ovs-vtep.in
> ++++ b/vtep/ovs-vtep.in
> +@@ -1,4 +1,4 @@
> +-#! @PYTHON@
> ++#!/usr/bin/env @PYTHON@
> + # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
> + #
> + # Licensed under the Apache License, Version 2.0 (the "License");
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch b/recipes-networking/
> openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> index 6a1b832..540bda6 100644
> --- a/recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch
> +++ b/recipes-networking/openvswitch/files/python-
> switch-remaining-scripts-to-use-python3.patch
> @@ -13,11 +13,10 @@ Signed-off-by: Mark Asselstine <
> mark.asselstine@windriver.com>
>   utilities/checkpatch.py                               | 2 +-
>   utilities/ovs-dev.py                                  | 2 +-
>   utilities/ovs-pipegen.py                              | 2 +-
> - vtep/ovs-vtep                                         | 2 +-
>   xenserver/etc_xapi.d_plugins_openvswitch-cfg-update   | 2 +-
>   xenserver/opt_xensource_libexec_interface-reconfigure | 2 +-
>   xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync | 2 +-
> - 9 files changed, 9 insertions(+), 9 deletions(-)
> + 8 files changed, 8 insertions(+), 8 deletions(-)
>
>  diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities
>  index 0be7199..d2cce42 100755
> @@ -46,7 +45,7 @@ index 26eb5c3..2e1932b 100755
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # Copyright (c) 2016 Red Hat, Inc.
> + # Copyright (c) 2016, 2017 Red Hat, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
>  diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
> @@ -69,16 +68,6 @@ index 4bf240f..2a8f13e 100755
>   # Copyright (c) 2013, 2014, 2015 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep
> -index fd652d4..19d63f9 100755
> ---- a/vtep/ovs-vtep
> -+++ b/vtep/ovs-vtep
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
>  diff --git a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> b/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
>  index e7404e3..5edad76 100755
>  --- a/xenserver/etc_xapi.d_plugins_openvswitch-cfg-update
> diff --git a/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
> b/recipes-networking/openvswitch/openvswitch-git/disable_m4_check.patch
> index 5c86aac..711a148 100644
> --- a/recipes-networking/openvswitch/openvswitch-git/
> disable_m4_check.patch
> +++ b/recipes-networking/openvswitch/openvswitch-git/
> disable_m4_check.patch
> @@ -13,10 +13,10 @@ diff --git a/Makefile.am b/Makefile.am
>  index ff7d70a..2fc1f13 100644
>  --- a/Makefile.am
>  +++ b/Makefile.am
> -@@ -189,7 +189,7 @@ CLEAN_LOCAL += clean-pycov
> - # Makefile in datapath/linux, needed to get the list of files to
> - # distribute, requires GNU make extensions.
> - if GNU_MAKE
> +@@ -187,7 +187,7 @@ CLEAN_LOCAL += clean-pycov
> +
> + # If we're checked out from a Git repository, make sure that every
> + # file that is in Git is distributed.
>  -ALL_LOCAL += dist-hook-git
>  +# ALL_LOCAL += dist-hook-git
>   dist-hook-git: distfiles
> diff --git a/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
> b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-
> 7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
> new file mode 100644
> index 0000000..5b53f96
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/
> openvswitch-add-ptest-7e614671cba3c4e338d1c5003b74a10047d7a8eb.patch
> @@ -0,0 +1,110 @@
> +From fb68120ef8aed625b04b2fbd2cb78fc59a7b7432 Mon Sep 17 00:00:00 2001
> +From: He Zhe <zhe.he@windriver.com>
> +Date: Wed, 30 Mar 2016 06:23:45 -0400
> +Subject: [PATCH] openvswitch: Add test-install rule to support ptest
> execution
> +
> +Signed-off-by: Radu Patriu <radu.patriu@enea.com>
> +
> +Fix ptest for v2.5
> + - Copy certain files from srcdir since it has been different from
> +   build directory.
> + - Copy more necessary files for new added test cases.
> + - Modify config files for running on target.
> +
> +Signed-off-by: He Zhe <zhe.he@windriver.com>
> +
> +---
> + Makefile.am |  1 +
> + test.mk     | 72 ++++++++++++++++++++++++++++++
> +++++++++++++++++++++++++++++++
> + 2 files changed, 73 insertions(+)
> + create mode 100644 test.mk
> +
> +diff --git a/Makefile.am b/Makefile.am
> +index ea63acb..ff7d70a 100644
> +--- a/Makefile.am
> ++++ b/Makefile.am
> +@@ -429,3 +429,4 @@ include windows/automake.mk
> + include ovn/automake.mk
> + include selinux/automake.mk
> + include build-aux/automake.mk
> ++include test.mk
> +diff --git a/test.mk b/test.mk
> +new file mode 100644
> +index 0000000..b10a581
> +--- /dev/null
> ++++ b/test.mk
> +@@ -0,0 +1,74 @@
> ++TEST_DEST ?= ${prefix}/lib/openvswitch
> ++TEST_ROOT ?= ${prefix}/lib/openvswitch
> ++TEST_DEPEND =
> ++
> ++if HAVE_OPENSSL
> ++TEST_DEPEND += $(TESTPKI_FILES)
> ++endif
> ++
> ++test-install: $(TEST_DEPEND)
> ++      @list='$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist_check_SCRIPTS)
> $(TEST_DEPEND) tests/atlocal tests/atconfig' ;\
> ++      install -d $(TEST_DEST)/tests ;\
> ++      install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;\
> ++      install -d $(TEST_DEST)/python ;\
> ++      install -d $(TEST_DEST)/python/ovs ;\
> ++      install -d $(TEST_DEST)/python/ovs/db ;\
> ++      install -d $(TEST_DEST)/python/ovs/compat ;\
> ++      install -d $(TEST_DEST)/python/ovs/compat/sortedcontainers ;\
> ++      install -d $(TEST_DEST)/python/ovs/unixctl ;\
> ++      install -d $(TEST_DEST)/vswitchd ;\
> ++      install $(srcdir)/vswitchd/vswitch.ovsschema
> $(TEST_DEST)/vswitchd ;\
> ++      install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd ;\
> ++      install -d $(TEST_DEST)/debian ;\
> ++      install $(srcdir)/debian/ovs-monitor-ipsec $(TEST_DEST)/debian ;\
> ++      install -d $(TEST_DEST)/build-aux ;\
> ++      install $(srcdir)/build-aux/check-structs $(TEST_DEST)/build-aux
> ;\
> ++      install -d $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/usr_share_
> openvswitch_scripts_ovs-xapi-sync $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_interface-reconfigure
> $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigure.py
> $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureBridge.py
> $(TEST_DEST)/xenserver ;\
> ++      install $(srcdir)/xenserver/opt_xensource_libexec_InterfaceReconfigureVswitch.py
> $(TEST_DEST)/xenserver ;\
> ++      install -d $(TEST_DEST)/vtep ;\
> ++      install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/vtep ;\
> ++      install -d $(TEST_DEST)/ovn ;\
> ++      install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/ovn ;\
> ++      install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/ovn ;\
> ++      install -d $(TEST_DEST)/utilities ;\
> ++      install $(srcdir)/utilities/ovs-pcap.in $(TEST_DEST)/utilities ;\
> ++      install $(srcdir)/utilities/ovs-pki.in $(TEST_DEST)/utilities ;\
> ++      for p in $$list ; do \
> ++        echo $$p ;\
> ++        p=$${p#../git/} ;\
> ++        pre=$${p#tests\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/tests/$$pre ;\
> ++          if test -f $$p ; then \
> ++            install $$p $(TEST_DEST)/tests/$$pre ;\
> ++          else \
> ++            install $(srcdir)/$$p $(TEST_DEST)/tests/$$pre ;\
> ++          fi ;\
> ++          continue ;\
> ++        fi ;\
> ++        pre=$${p#python\/ovs\/} ;\
> ++        if test $$pre != $$p ; then \
> ++          echo installing $$p to $(TEST_DEST)/python/ovs/$$pre ;\
> ++          if test -f $$p ; then \
> ++            install $$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++          else \
> ++            install $(srcdir)/$$p $(TEST_DEST)/python/ovs/$$pre ;\
> ++          fi ;\
> ++          continue ;\
> ++        fi; \
> ++      done ;\
> ++      sed -i 's|abs_builddir=.*|abs_builddir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_srcdir=.*|abs_srcdir='"'"'$(TEST_ROOT)/tests'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_srcdir=.*|abs_top_srcdir='"'"'$(TEST_ROOT)'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|abs_top_builddir=.*|abs_top_builddir='"'"'$(TEST_ROOT)'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_srcdir=.*|at_srcdir='"'"'.'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_top_srcdir=.*|at_top_srcdir='"'"'..'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|at_top_build_prefix=.*|at_top_build_prefix='"'"'../'"'"'|g'
> $(TEST_DEST)/tests/atconfig
> ++      sed -i 's|^\(.*config\.log.*\)|#\1|g' $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|$$srcdir|$$abs_srcdir|g' $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> ++      sed -i 's|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-bashcomp\.bash|g'
> $(TEST_DEST)/tests/testsuite
> diff --git a/recipes-networking/openvswitch/openvswitch-git/
> systemd-update-tool-paths.patch b/recipes-networking/
> openvswitch/openvswitch-git/systemd-update-tool-paths.patch
> new file mode 100644
> index 0000000..9a792e6
> --- /dev/null
> +++ b/recipes-networking/openvswitch/openvswitch-git/
> systemd-update-tool-paths.patch
> @@ -0,0 +1,45 @@
> +From f45c0a9d712113417e7b56c199f8576b470695ae Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Tue, 29 May 2018 18:57:46 +0000
> +Subject: [PATCH] systemd: update tool paths
> +
> +We are using the rhel files but we install our tools in a slightly
> +different path, update accordingly.
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + rhel/usr_lib_systemd_system_ovs-vswitchd.service.in | 4 ++--
> + rhel/usr_lib_systemd_system_ovsdb-server.service    | 2 +-
> + 2 files changed, 3 insertions(+), 3 deletions(-)
> +
> +diff --git a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in b/rhel/
> usr_lib_systemd_system_ovs-vswitchd.service.in
> +index 11b34c6..94c48f8 100644
> +--- a/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> ++++ b/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in
> +@@ -15,8 +15,8 @@ EnvironmentFile=/etc/openvswitch/default.conf
> + EnvironmentFile=-/etc/sysconfig/openvswitch
> + EnvironmentFile=-/run/openvswitch/useropts
> + @begin_dpdk@
> +-ExecStartPre=-/bin/sh -c '/usr/bin/chown :$${OVS_USER_ID##*:}
> /dev/hugepages'
> +-ExecStartPre=-/usr/bin/chmod 0775 /dev/hugepages
> ++ExecStartPre=-/bin/sh -c '/bin/chown :$${OVS_USER_ID##*:} /dev/hugepages'
> ++ExecStartPre=-/bin/chmod 0775 /dev/hugepages
> + @end_dpdk@
> + ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
> +           --no-ovsdb-server --no-monitor --system-id=random \
> +diff --git a/rhel/usr_lib_systemd_system_ovsdb-server.service
> b/rhel/usr_lib_systemd_system_ovsdb-server.service
> +index 0fa57a9..75c9e02 100644
> +--- a/rhel/usr_lib_systemd_system_ovsdb-server.service
> ++++ b/rhel/usr_lib_systemd_system_ovsdb-server.service
> +@@ -10,7 +10,7 @@ Type=forking
> + Restart=on-failure
> + EnvironmentFile=/etc/openvswitch/default.conf
> + EnvironmentFile=-/etc/sysconfig/openvswitch
> +-ExecStartPre=/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch
> ++ExecStartPre=/bin/chown ${OVS_USER_ID} /var/run/openvswitch
> + ExecStartPre=/bin/sh -c 'rm -f /run/openvswitch/useropts; if [
> "$${OVS_USER_ID/:*/}" != "root" ]; then /usr/bin/echo
> "OVSUSER=--ovs-user=${OVS_USER_ID}" > /run/openvswitch/useropts; fi'
> + EnvironmentFile=-/run/openvswitch/useropts
> + ExecStart=/usr/share/openvswitch/scripts/ovs-ctl \
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/openvswitch/openvswitch.inc
> b/recipes-networking/openvswitch/openvswitch.inc
> index 58e0fcb..70ac5bc 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -63,6 +63,8 @@ FILES_${PN}-switch = "\
>         ${systemd_unitdir}/system/ovs-vswitchd.service \
>         ${systemd_unitdir}/system/openvswitch.service \
>         ${systemd_unitdir}/system/ovsdb-server.service \
> +       ${sysconfdir}/sysconfig/openvswitch \
> +       ${sysconfdir}/openvswitch/default.conf \
>         "
>
>  # silence a warning
> @@ -92,6 +94,14 @@ do_configure_prepend() {
>         CC=`echo '${CC}' | sed 's/-Wa,/-Xassembler /g'`
>  }
>
> +do_install_prepend() {
> +       SERVICE_FILE="${S}/rhel/usr_lib_systemd_system_ovs-
> vswitchd.service"
> +       ${S}/build-aux/dpdkstrip.py \
> +           ${@bb.utils.contains('PACKAGECONFIG','dpdk','--dpdk','--nodpdk',d)}
> \
> +           < ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service.in \
> +           > ${SERVICE_FILE}
> +}
> +
>  do_install_append() {
>         install -d ${D}/${sysconfdir}/default/
>         install -m 660 ${WORKDIR}/openvswitch-switch-setup
> ${D}/${sysconfdir}/default/openvswitch-switch
> @@ -103,6 +113,14 @@ do_install_append() {
>         install -m 755 ${WORKDIR}/openvswitch-switch
> ${D}/${sysconfdir}/init.d/openvswitch-switch
>         true || rm -fr ${D}/${datadir}/${PN}/pki
>
> +       install -d ${D}/${sysconfdir}/sysconfig
> +       install -m 644 ${S}/rhel/usr_share_openvswitch_scripts_systemd_sysconfig.template
> \
> +               ${D}/${sysconfdir}/sysconfig/openvswitch
> +
> +       install -d ${D}/${sysconfdir}/openvswitch
> +       install -m 644 ${S}/rhel/etc_openvswitch_default.conf \
> +               ${D}/${sysconfdir}/openvswitch/default.conf
> +
>         install -d ${D}/${systemd_unitdir}/system/
>         install -m 644 ${S}/rhel/usr_lib_systemd_system_ovs-vswitchd.service
> \
>                 ${D}/${systemd_unitdir}/system/ovs-vswitchd.service
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb
> b/recipes-networking/openvswitch/openvswitch_git.bb
> index c3a8301..9cdd484 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -12,39 +12,26 @@ RDEPENDS_${PN}-ptest += "\
>         "
>
>  S = "${WORKDIR}/git"
> -PV = "2.7.3+${SRCREV}"
> +PV = "2.9.2+${SRCREV}"
>
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>
> -SRCREV = "b8dcfbebee9e7dbc74ec5eecc9b45d335d6150c1"
> +SRCREV = "7e614671cba3c4e338d1c5003b74a10047d7a8eb"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
>             file://openvswitch-testcontroller-setup \
> -           git://github.com/openvswitch/ovs.git;protocol=git;branch=
> branch-2.7 \
> +           git://github.com/openvswitch/ovs.git;protocol=git;branch=
> branch-2.9 \
>             file://openvswitch-add-ptest-${SRCREV}.patch \
>             file://run-ptest \
>             file://disable_m4_check.patch \
>             file://kernel_module.patch \
>             file://python-make-remaining-scripts-use-usr-bin-env.patch \
> -           file://0001-use-the-linux-if_packet.h-Interface-directly.patch
> \
>             file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
> +           file://systemd-update-tool-paths.patch \
>             "
>
> -# Temporarily backport patches to better support py3. These have been
> -# merged upstream but are not part of v2.7.1.
> -SRC_URI += " \
> -           file://0001-Python3-compatibility-Convert-print-statements.patch
> \
> -           file://0002-Python3-compatibility-exception-cleanup.patch \
> -           file://0003-Python3-compatibility-execfile-to-exec.patch \
> -           file://0004-Python3-compatibility-iteritems-to-items.patch \
> -           file://0005-Python3-compatibility-fix-integer-problems.patch \
> -           file://0006-Python3-compatibility-math-error-compatibility.patch
> \
> -           file://0007-Python3-compatibility-unicode-to-str.patch \
> -           file://0008-AUTHORS-Add-Jason-Wessel.patch \
> -"
> -
>  LIC_FILES_CHKSUM = "file://COPYING;md5=17b2c9d4c70853a09c0e143137754b35"
>
>  DPDK_INSTALL_DIR ?= "/opt/dpdk"
> @@ -71,5 +58,4 @@ do_install_ptest() {
>
>  do_install_append() {
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
> -       rm -r ${D}/${localstatedir}/run
>  }
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

--00000000000095e2b1056dc88359
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">merged<div><br></div><div>Bruce</div></div><div class=3D"g=
mail_extra"><br><div class=3D"gmail_quote">On Wed, May 30, 2018 at 11:47 AM=
, Mark Asselstine <span dir=3D"ltr">&lt;<a href=3D"mailto:mark.asselstine@w=
indriver.com" target=3D"_blank">mark.asselstine@windriver.com</a>&gt;</span=
> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">This brings us up to date with t=
he latest upstream release. I suspect<br>
there will be an upcoming release to add compatibility with DPDK<br>
v18.05 (the DPDK release is due out any day now) but getting this<br>
fairly large release bump out of the way first will facilitate any<br>
upcoming uprev.<br>
<br>
We are able to drop they python3 patches as they have been merged<br>
upstream. Some scripts which needed to be updated to use python3<br>
disappeared, new ones appeared so the &#39;use python3&#39; patches are<br>
updated accordingly. Beyond this the biggest change is related to the<br>
systemd unit files, the ovsdb-server has been updated upstream to be<br>
generated on the fly via the spec file, we mimic this in the<br>
install_prepend. We also add the various configuration files which the<br>
unit files source before launching the services.<br>
<br>
As usual this was tested against out typical usecases including usage<br>
in meta-overc. As well the ptests have been run and the results are no<br>
better or worse.<br>
<br>
=C2=A0 =C2=A0Previous version:<br>
=C2=A0 =C2=A0 ERROR: 2332 tests were run,<br>
=C2=A0 =C2=A0 21 failed unexpectedly.<br>
=C2=A0 =C2=A0 3 tests were skipped.<br>
<br>
=C2=A0 =C2=A0New version:<br>
=C2=A0 =C2=A0 ERROR: 2527 tests were run,<br>
=C2=A0 =C2=A0 29 failed unexpectedly.<br>
=C2=A0 =C2=A0 3 tests were skipped.<br>
<br>
Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windri=
ver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
---<br>
=C2=A0...on-make-remaining-scripts-<wbr>use-usr-bin-env.patch | 298 +++++++=
+++++++++++---<br>
=C2=A0...n-switch-remaining-scripts-<wbr>to-use-python3.patch |=C2=A0 15 +-=
<br>
=C2=A0.../openvswitch-git/disable_<wbr>m4_check.patch=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
=C2=A0...-<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7a8eb.patch | 110 ++=
++++++<br>
=C2=A0.../systemd-update-tool-paths.<wbr>patch=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 45 ++++<br>
=C2=A0recipes-networking/<wbr>openvswitch/openvswitch.inc=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 18 ++<br>
=C2=A0recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a>=C2=A0 |=C2=
=A0 22 +-<br>
=C2=A07 files changed, 443 insertions(+), 73 deletions(-)<br>
=C2=A0create mode 100644 recipes-networking/<wbr>openvswitch/openvswitch-gi=
t/<wbr>openvswitch-add-ptest-<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7=
a8eb.patch<br>
=C2=A0create mode 100644 recipes-networking/<wbr>openvswitch/openvswitch-gi=
t/<wbr>systemd-update-tool-paths.<wbr>patch<br>
<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>rem=
aining-scripts-use-usr-bin-<wbr>env.patch b/recipes-networking/<wbr>openvsw=
itch/files/python-make-<wbr>remaining-scripts-use-usr-bin-<wbr>env.patch<br=
>
index deff10b..0dc6b11 100644<br>
--- a/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>remaining-=
scripts-use-usr-bin-<wbr>env.patch<br>
+++ b/recipes-networking/<wbr>openvswitch/files/python-make-<wbr>remaining-=
scripts-use-usr-bin-<wbr>env.patch<br>
@@ -1,4 +1,4 @@<br>
-From f21a0490555d5fe8f5a9ce982defa6<wbr>66a64151c0 Mon Sep 17 00:00:00 200=
1<br>
+From a0a2d829642e916bd5d1c498a3e6f3<wbr>641ed717a0 Mon Sep 17 00:00:00 200=
1<br>
=C2=A0From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver=
.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0Date: Fri, 13 Jan 2017 16:12:55 -0500<br>
=C2=A0Subject: [PATCH] python: make remaining scripts use /usr/bin/env<br>
@@ -12,24 +12,43 @@ PYTHON. To make this function smoothly all installed sc=
ripts should<br>
=C2=A0make use of /usr/bin/env to increase the chances of finding python.<b=
r>
<br>
=C2=A0Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@=
windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
-<br>
=C2=A0---<br>
- build-aux/check-structs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
- build-aux/extract-ofp-actions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =
2 +-<br>
- build-aux/extract-ofp-errors=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
- build-aux/extract-ofp-fields=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 2 +-<br>
- build-aux/extract-ofp-msgs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0| 2 +-<br>
- build-aux/xml2nroff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- ovn/utilities/ovn-docker-<wbr>overlay-driver=C2=A0 | 2 +-<br>
- ovn/utilities/ovn-docker-<wbr>underlay-driver | 2 +-<br>
- ovsdb/ovsdb-doc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=3D"_blank=
">ovsdb-dot.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
- ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" target=3D"_blan=
k">ovsdb-idlc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferrer" ta=
rget=3D"_blank">ovs-bugtool.<wbr>in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
2 +-<br>
- 12 files changed, 12 insertions(+), 12 deletions(-)<br>
+ build-aux/check-structs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ build-aux/dpdkstrip.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ build-aux/extract-ofp-actions=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
+ build-aux/extract-ofp-errors=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
+ build-aux/extract-ofp-fields=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
+ build-aux/extract-ofp-msgs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ build-aux/sodepends.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ build-aux/soexpand.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ build-aux/text2c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ build-aux/xml2nroff=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ ovn/utilities/<a href=3D"http://ovn-detrace.in" rel=3D"noreferrer" target=
=3D"_blank">ovn-detrace.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | 2 +-<br>
+ ovn/utilities/<a href=3D"http://ovn-docker-overlay-driver.in" rel=3D"nore=
ferrer" target=3D"_blank">ovn-docker-<wbr>overlay-driver.in</a>=C2=A0 | 2 +=
-<br>
+ ovn/utilities/<a href=3D"http://ovn-docker-underlay-driver.in" rel=3D"nor=
eferrer" target=3D"_blank">ovn-docker-<wbr>underlay-driver.in</a> | 2 +-<br=
>
+ ovsdb/dot2pic=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ ovsdb/ovsdb-doc=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=3D"_blank=
">ovsdb-dot.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" target=3D"_blan=
k">ovsdb-idlc.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ python/build/soutil.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/flowgen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ tests/ovsdb-monitor-sort.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>
+ tests/uuidfilt.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferrer" ta=
rget=3D"_blank">ovs-bugtool.<wbr>in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 2 +-<br>
+ utilities/<a href=3D"http://ovs-check-dead-ifs.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-check-dead-ifs.<wbr>in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/<a href=3D"http://ovs-dpctl-top.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-dpctl-top.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ utilities/<a href=3D"http://ovs-l3ping.in" rel=3D"noreferrer" target=3D"_=
blank">ovs-l3ping.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/<a href=3D"http://ovs-parse-backtrace.in" rel=3D"noreferrer" ta=
rget=3D"_blank">ovs-parse-backtrace.<wbr>in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 | 2 +-<br>
+ utilities/<a href=3D"http://ovs-pcap.in" rel=3D"noreferrer" target=3D"_bl=
ank">ovs-pcap.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/<a href=3D"http://ovs-tcpdump.in" rel=3D"noreferrer" target=3D"=
_blank">ovs-tcpdump.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ utilities/<a href=3D"http://ovs-tcpundump.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-tcpundump.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ utilities/<a href=3D"http://ovs-test.in" rel=3D"noreferrer" target=3D"_bl=
ank">ovs-test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br>
+ utilities/<a href=3D"http://ovs-vlan-test.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-vlan-test.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ vtep/<a href=3D"http://ovs-vtep.in" rel=3D"noreferrer" target=3D"_blank">=
ovs-vtep.in</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
+ 32 files changed, 32 insertions(+), 32 deletions(-)<br>
<br>
=C2=A0diff --git a/build-aux/check-structs b/build-aux/check-structs<br>
-index f79f235..5129b72 100755<br>
+index 37ffa06..eb44c91 100755<br>
=C2=A0--- a/build-aux/check-structs<br>
=C2=A0+++ b/build-aux/check-structs<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -38,8 +57,18 @@ index f79f235..5129b72 100755<br>
<br>
=C2=A0 import os.path<br>
=C2=A0 import sys<br>
+diff --git a/build-aux/dpdkstrip.py b/build-aux/dpdkstrip.py<br>
+index 48c7f06..b8b8ba9 100755<br>
+--- a/build-aux/dpdkstrip.py<br>
++++ b/build-aux/dpdkstrip.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ # Copyright (c) 2017 Red Hat, Inc.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
=C2=A0diff --git a/build-aux/extract-ofp-<wbr>actions b/build-aux/extract-o=
fp-<wbr>actions<br>
-index 0062ab8..ee8c4ff 100755<br>
+index bd7131f..4d05ef9 100755<br>
=C2=A0--- a/build-aux/extract-ofp-<wbr>actions<br>
=C2=A0+++ b/build-aux/extract-ofp-<wbr>actions<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -49,7 +78,7 @@ index 0062ab8..ee8c4ff 100755<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
=C2=A0diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-err=
ors<br>
-index 2312b76..e36444e 100755<br>
+index 71ae0bd..58ba006 100755<br>
=C2=A0--- a/build-aux/extract-ofp-errors<br>
=C2=A0+++ b/build-aux/extract-ofp-errors<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -59,7 +88,7 @@ index 2312b76..e36444e 100755<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
=C2=A0diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fie=
lds<br>
-index 498b887..c248e76 100755<br>
+index 184b75e..cf339f8 100755<br>
=C2=A0--- a/build-aux/extract-ofp-fields<br>
=C2=A0+++ b/build-aux/extract-ofp-fields<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -69,7 +98,7 @@ index 498b887..c248e76 100755<br>
=C2=A0 import getopt<br>
=C2=A0 import sys<br>
=C2=A0diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs<=
br>
-index 1813638..c2a91f9 100755<br>
+index a67e870..92c4bda 100755<br>
=C2=A0--- a/build-aux/extract-ofp-msgs<br>
=C2=A0+++ b/build-aux/extract-ofp-msgs<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -78,6 +107,36 @@ index 1813638..c2a91f9 100755<br>
<br>
=C2=A0 import sys<br>
=C2=A0 import os.path<br>
+diff --git a/build-aux/sodepends.py b/build-aux/sodepends.py<br>
+index 90cfaa0..45812bc 100755<br>
+--- a/build-aux/sodepends.py<br>
++++ b/build-aux/sodepends.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Copyright (c) 2008, 2011, 2017 Nicira, Inc.<br>
+ #<br>
+diff --git a/build-aux/soexpand.py b/build-aux/soexpand.py<br>
+index 53ca640..00adcf4 100755<br>
+--- a/build-aux/soexpand.py<br>
++++ b/build-aux/soexpand.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Copyright (c) 2008, 2017 Nicira, Inc.<br>
+ #<br>
+diff --git a/build-aux/text2c b/build-aux/text2c<br>
+index cb1f256..ab7910e 100755<br>
+--- a/build-aux/text2c<br>
++++ b/build-aux/text2c<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ import re<br>
+ import sys<br>
=C2=A0diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff<br>
=C2=A0index bd4e879..db45c56 100755<br>
=C2=A0--- a/build-aux/xml2nroff<br>
@@ -88,28 +147,48 @@ index bd4e879..db45c56 100755<br>
<br>
=C2=A0 # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc=
.<br>
=C2=A0 #<br>
-diff --git a/ovn/utilities/ovn-docker-<wbr>overlay-driver b/ovn/utilities/=
ovn-docker-<wbr>overlay-driver<br>
-index 52de3db..3b1fa45 100755<br>
---- a/ovn/utilities/ovn-docker-<wbr>overlay-driver<br>
-+++ b/ovn/utilities/ovn-docker-<wbr>overlay-driver<br>
+diff --git a/ovn/utilities/<a href=3D"http://ovn-detrace.in" rel=3D"norefe=
rrer" target=3D"_blank">ovn-detrace.in</a> b/ovn/utilities/<a href=3D"http:=
//ovn-detrace.in" rel=3D"noreferrer" target=3D"_blank">ovn-detrace.in</a><b=
r>
+index e2e5b4c..5549219 100755<br>
+--- a/ovn/utilities/<a href=3D"http://ovn-detrace.in" rel=3D"noreferrer" t=
arget=3D"_blank">ovn-detrace.in</a><br>
++++ b/ovn/utilities/<a href=3D"http://ovn-detrace.in" rel=3D"noreferrer" t=
arget=3D"_blank">ovn-detrace.in</a><br>
=C2=A0@@ -1,4 +1,4 @@<br>
--#! /usr/bin/python<br>
-+#! /usr/bin/env python3<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2017 eBay Inc.<br>
+ #<br>
+diff --git a/ovn/utilities/<a href=3D"http://ovn-docker-overlay-driver.in"=
 rel=3D"noreferrer" target=3D"_blank">ovn-docker-<wbr>overlay-driver.in</a>=
 b/ovn/utilities/<a href=3D"http://ovn-docker-overlay-driver.in" rel=3D"nor=
eferrer" target=3D"_blank">ovn-docker-<wbr>overlay-driver.in</a><br>
+index 65edfcd..895426b 100755<br>
+--- a/ovn/utilities/<a href=3D"http://ovn-docker-overlay-driver.in" rel=3D=
"noreferrer" target=3D"_blank">ovn-docker-<wbr>overlay-driver.in</a><br>
++++ b/ovn/utilities/<a href=3D"http://ovn-docker-overlay-driver.in" rel=3D=
"noreferrer" target=3D"_blank">ovn-docker-<wbr>overlay-driver.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
=C2=A0 # Copyright (C) 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
-diff --git a/ovn/utilities/ovn-docker-<wbr>underlay-driver b/ovn/utilities=
/ovn-docker-<wbr>underlay-driver<br>
-index 2c9c4b6..551e7a1 100755<br>
---- a/ovn/utilities/ovn-docker-<wbr>underlay-driver<br>
-+++ b/ovn/utilities/ovn-docker-<wbr>underlay-driver<br>
+diff --git a/ovn/utilities/<a href=3D"http://ovn-docker-underlay-driver.in=
" rel=3D"noreferrer" target=3D"_blank">ovn-docker-<wbr>underlay-driver.in</=
a> b/ovn/utilities/<a href=3D"http://ovn-docker-underlay-driver.in" rel=3D"=
noreferrer" target=3D"_blank">ovn-docker-<wbr>underlay-driver.in</a><br>
+index d91ce9f..e0c8db6 100755<br>
+--- a/ovn/utilities/<a href=3D"http://ovn-docker-underlay-driver.in" rel=
=3D"noreferrer" target=3D"_blank">ovn-docker-<wbr>underlay-driver.in</a><br=
>
++++ b/ovn/utilities/<a href=3D"http://ovn-docker-underlay-driver.in" rel=
=3D"noreferrer" target=3D"_blank">ovn-docker-<wbr>underlay-driver.in</a><br=
>
=C2=A0@@ -1,4 +1,4 @@<br>
--#! /usr/bin/python<br>
-+#! /usr/bin/env python3<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
=C2=A0 # Copyright (C) 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
+diff --git a/ovsdb/dot2pic b/ovsdb/dot2pic<br>
+index de67261..174e723 100755<br>
+--- a/ovsdb/dot2pic<br>
++++ b/ovsdb/dot2pic<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Copyright (c) 2009, 2010, 2011, 2013, 2017 Nicira, Inc.<br>
+ #<br>
=C2=A0diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc<br>
-index 5cf26ee..bdf2dcc 100755<br>
+index 406c293..d55c6e6 100755<br>
=C2=A0--- a/ovsdb/ovsdb-doc<br>
=C2=A0+++ b/ovsdb/ovsdb-doc<br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -119,7 +198,7 @@ index 5cf26ee..bdf2dcc 100755<br>
=C2=A0 # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0diff --git a/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer"=
 target=3D"_blank">ovsdb-dot.in</a> b/ovsdb/<a href=3D"http://ovsdb-dot.in"=
 rel=3D"noreferrer" target=3D"_blank">ovsdb-dot.in</a><br>
-index 134ce22..893c408 100755<br>
+index 8eea617..38ba33a 100755<br>
=C2=A0--- a/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=
=3D"_blank">ovsdb-dot.in</a><br>
=C2=A0+++ b/ovsdb/<a href=3D"http://ovsdb-dot.in" rel=3D"noreferrer" target=
=3D"_blank">ovsdb-dot.in</a><br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -129,17 +208,57 @@ index 134ce22..893c408 100755<br>
=C2=A0 from datetime import date<br>
=C2=A0 import ovs.db.error<br>
=C2=A0diff --git a/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer=
" target=3D"_blank">ovsdb-idlc.in</a> b/ovsdb/<a href=3D"http://ovsdb-idlc.=
in" rel=3D"noreferrer" target=3D"_blank">ovsdb-idlc.in</a><br>
-index 721ab50..bfbcf23 100755<br>
+index 1ea2115..4ecb2e2 100755<br>
=C2=A0--- a/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" targe=
t=3D"_blank">ovsdb-idlc.in</a><br>
=C2=A0+++ b/ovsdb/<a href=3D"http://ovsdb-idlc.in" rel=3D"noreferrer" targe=
t=3D"_blank">ovsdb-idlc.in</a><br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#! @PYTHON@<br>
-+#! /usr/bin/env @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
<br>
+ from __future__ import print_function<br>
=C2=A0 import getopt<br>
- import os<br>
+diff --git a/python/build/soutil.py b/python/build/soutil.py<br>
+index b8027af..8f52803 100755<br>
+--- a/python/build/soutil.py<br>
++++ b/python/build/soutil.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Copyright (c) 2008, 2017 Nicira, Inc.<br>
+ #<br>
+diff --git a/tests/flowgen.py b/tests/flowgen.py<br>
+index 221a8f2..5d96d76 100755<br>
+--- a/tests/flowgen.py<br>
++++ b/tests/flowgen.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Copyright (c) 2009, 2010, 2011, 2012, 2015, 2017 Nicira, Inc.<br>
+ #<br>
+diff --git a/tests/ovsdb-monitor-sort.py b/tests/ovsdb-monitor-sort.py<br>
+index 7d368a7..ab4c38c 100755<br>
+--- a/tests/ovsdb-monitor-sort.py<br>
++++ b/tests/ovsdb-monitor-sort.py<br>
+@@ -1,4 +1,4 @@<br>
+-#! /usr/bin/env python<br>
++#! /usr/bin/env python3<br>
+ <br>
+ # Breaks lines read from stdin into groups using blank lines as<br>
+ # group separators, then sorts lines within the groups for<br>
+diff --git a/tests/uuidfilt.py b/tests/uuidfilt.py<br>
+index ea72812..f1a9aff 100755<br>
+--- a/tests/uuidfilt.py<br>
++++ b/tests/uuidfilt.py<br>
+@@ -1,4 +1,4 @@<br>
+-#!/usr/bin/env python<br>
++#!/usr/bin/env python3<br>
+ <br>
+ import re<br>
+ import sys<br>
=C2=A0diff --git a/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=
=3D"noreferrer" target=3D"_blank">ovs-<wbr>bugtool.in</a> b/utilities/bugto=
ol/<a href=3D"http://ovs-bugtool.in" rel=3D"noreferrer" target=3D"_blank">o=
vs-<wbr>bugtool.in</a><br>
-index 963c50c..c84d7c2 100755<br>
+index 8d220fd..76cedf4 100755<br>
=C2=A0--- a/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"nore=
ferrer" target=3D"_blank">ovs-<wbr>bugtool.in</a><br>
=C2=A0+++ b/utilities/bugtool/<a href=3D"http://ovs-bugtool.in" rel=3D"nore=
ferrer" target=3D"_blank">ovs-<wbr>bugtool.in</a><br>
=C2=A0@@ -1,4 +1,4 @@<br>
@@ -148,3 +267,106 @@ index 963c50c..c84d7c2 100755<br>
<br>
=C2=A0 # This library is free software; you can redistribute it and/or<br>
=C2=A0 # modify it under the terms of version 2.1 of the GNU Lesser General=
 Public<br>
+diff --git a/utilities/<a href=3D"http://ovs-check-dead-ifs.in" rel=3D"nor=
eferrer" target=3D"_blank">ovs-check-dead-<wbr>ifs.in</a> b/utilities/<a hr=
ef=3D"http://ovs-check-dead-ifs.in" rel=3D"noreferrer" target=3D"_blank">ov=
s-check-dead-<wbr>ifs.in</a><br>
+index ac54f6c..13d86b3 100755<br>
+--- a/utilities/<a href=3D"http://ovs-check-dead-ifs.in" rel=3D"noreferrer=
" target=3D"_blank">ovs-check-dead-<wbr>ifs.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-check-dead-ifs.in" rel=3D"noreferrer=
" target=3D"_blank">ovs-check-dead-<wbr>ifs.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ <br>
+ import os<br>
+ import re<br>
+diff --git a/utilities/<a href=3D"http://ovs-dpctl-top.in" rel=3D"noreferr=
er" target=3D"_blank">ovs-dpctl-top.in</a> b/utilities/<a href=3D"http://ov=
s-dpctl-top.in" rel=3D"noreferrer" target=3D"_blank">ovs-dpctl-top.in</a><b=
r>
+index 7f0f1f8..ece707a 100755<br>
+--- a/utilities/<a href=3D"http://ovs-dpctl-top.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-dpctl-top.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-dpctl-top.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-dpctl-top.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2013 Nicira, Inc.<br>
+ #<br>
+diff --git a/utilities/<a href=3D"http://ovs-l3ping.in" rel=3D"noreferrer"=
 target=3D"_blank">ovs-l3ping.in</a> b/utilities/<a href=3D"http://ovs-l3pi=
ng.in" rel=3D"noreferrer" target=3D"_blank">ovs-l3ping.in</a><br>
+index 1b07972..9852699 100644<br>
+--- a/utilities/<a href=3D"http://ovs-l3ping.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-l3ping.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-l3ping.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-l3ping.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+ # you may not use this file except in compliance with the License.<br>
+diff --git a/utilities/<a href=3D"http://ovs-parse-backtrace.in" rel=3D"no=
referrer" target=3D"_blank">ovs-parse-<wbr>backtrace.in</a> b/utilities/<a =
href=3D"http://ovs-parse-backtrace.in" rel=3D"noreferrer" target=3D"_blank"=
>ovs-parse-<wbr>backtrace.in</a><br>
+index 350cbd9..1960fb4 100755<br>
+--- a/utilities/<a href=3D"http://ovs-parse-backtrace.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-parse-<wbr>backtrace.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-parse-backtrace.in" rel=3D"noreferre=
r" target=3D"_blank">ovs-parse-<wbr>backtrace.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2012 Nicira, Inc.<br>
+ #<br>
+diff --git a/utilities/<a href=3D"http://ovs-pcap.in" rel=3D"noreferrer" t=
arget=3D"_blank">ovs-pcap.in</a> b/utilities/<a href=3D"http://ovs-pcap.in"=
 rel=3D"noreferrer" target=3D"_blank">ovs-pcap.in</a><br>
+index fc15321..bd55a41 100755<br>
+--- a/utilities/<a href=3D"http://ovs-pcap.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-pcap.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-pcap.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-pcap.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2010 Nicira, Inc.<br>
+ #<br>
+diff --git a/utilities/<a href=3D"http://ovs-tcpdump.in" rel=3D"noreferrer=
" target=3D"_blank">ovs-tcpdump.in</a> b/utilities/<a href=3D"http://ovs-tc=
pdump.in" rel=3D"noreferrer" target=3D"_blank">ovs-tcpdump.in</a><br>
+index 91fa14e..bad67b7 100755<br>
+--- a/utilities/<a href=3D"http://ovs-tcpdump.in" rel=3D"noreferrer" targe=
t=3D"_blank">ovs-tcpdump.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-tcpdump.in" rel=3D"noreferrer" targe=
t=3D"_blank">ovs-tcpdump.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2016 Red Hat, Inc.<br>
+ #<br>
+diff --git a/utilities/<a href=3D"http://ovs-tcpundump.in" rel=3D"noreferr=
er" target=3D"_blank">ovs-tcpundump.in</a> b/utilities/<a href=3D"http://ov=
s-tcpundump.in" rel=3D"noreferrer" target=3D"_blank">ovs-tcpundump.in</a><b=
r>
+index c99015b..9a617ce 100755<br>
+--- a/utilities/<a href=3D"http://ovs-tcpundump.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-tcpundump.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-tcpundump.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-tcpundump.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2010 Nicira, Inc.<br>
+ #<br>
+diff --git a/utilities/<a href=3D"http://ovs-test.in" rel=3D"noreferrer" t=
arget=3D"_blank">ovs-test.in</a> b/utilities/<a href=3D"http://ovs-test.in"=
 rel=3D"noreferrer" target=3D"_blank">ovs-test.in</a><br>
+index fb1f9ad..4dba169 100644<br>
+--- a/utilities/<a href=3D"http://ovs-test.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-test.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-test.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-test.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+ # you may not use this file except in compliance with the License.<br>
+diff --git a/utilities/<a href=3D"http://ovs-vlan-test.in" rel=3D"noreferr=
er" target=3D"_blank">ovs-vlan-test.in</a> b/utilities/<a href=3D"http://ov=
s-vlan-test.in" rel=3D"noreferrer" target=3D"_blank">ovs-vlan-test.in</a><b=
r>
+index e229498..5b70118 100755<br>
+--- a/utilities/<a href=3D"http://ovs-vlan-test.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-vlan-test.in</a><br>
++++ b/utilities/<a href=3D"http://ovs-vlan-test.in" rel=3D"noreferrer" tar=
get=3D"_blank">ovs-vlan-test.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ #<br>
+ # Copyright (c) 2010 Nicira, Inc.<br>
+ #<br>
+diff --git a/vtep/<a href=3D"http://ovs-vtep.in" rel=3D"noreferrer" target=
=3D"_blank">ovs-vtep.in</a> b/vtep/<a href=3D"http://ovs-vtep.in" rel=3D"no=
referrer" target=3D"_blank">ovs-vtep.in</a><br>
+index 98748e4..3f12ae2 100755<br>
+--- a/vtep/<a href=3D"http://ovs-vtep.in" rel=3D"noreferrer" target=3D"_bl=
ank">ovs-vtep.in</a><br>
++++ b/vtep/<a href=3D"http://ovs-vtep.in" rel=3D"noreferrer" target=3D"_bl=
ank">ovs-vtep.in</a><br>
+@@ -1,4 +1,4 @@<br>
+-#! @PYTHON@<br>
++#!/usr/bin/env @PYTHON@<br>
+ # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.<br>
+ #<br>
+ # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/recipes-networking/<wbr>openvswitch/files/python-<wbr>switch-r=
emaining-scripts-to-<wbr>use-python3.patch b/recipes-networking/<wbr>openvs=
witch/files/python-<wbr>switch-remaining-scripts-to-<wbr>use-python3.patch<=
br>
index 6a1b832..540bda6 100644<br>
--- a/recipes-networking/<wbr>openvswitch/files/python-<wbr>switch-remainin=
g-scripts-to-<wbr>use-python3.patch<br>
+++ b/recipes-networking/<wbr>openvswitch/files/python-<wbr>switch-remainin=
g-scripts-to-<wbr>use-python3.patch<br>
@@ -13,11 +13,10 @@ Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:ma=
rk.asselstine@windriver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
=C2=A0 utilities/checkpatch.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 2 +-<br=
>
=C2=A0 utilities/ovs-dev.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 =
+-<br>
=C2=A0 utilities/ovs-pipegen.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>
- vtep/ovs-vtep=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 2 +-<br>
=C2=A0 xenserver/etc_xapi.d_plugins_<wbr>openvswitch-cfg-update=C2=A0 =C2=
=A0| 2 +-<br>
=C2=A0 xenserver/opt_xensource_<wbr>libexec_interface-reconfigure | 2 +-<br=
>
=C2=A0 xenserver/usr_share_<wbr>openvswitch_scripts_ovs-xapi-<wbr>sync | 2 =
+-<br>
- 9 files changed, 9 insertions(+), 9 deletions(-)<br>
+ 8 files changed, 8 insertions(+), 8 deletions(-)<br>
<br>
=C2=A0diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities<=
br>
=C2=A0index 0be7199..d2cce42 100755<br>
@@ -46,7 +45,7 @@ index 26eb5c3..2e1932b 100755<br>
=C2=A0@@ -1,4 +1,4 @@<br>
=C2=A0-#!/usr/bin/env python<br>
=C2=A0+#!/usr/bin/env python3<br>
- # Copyright (c) 2016 Red Hat, Inc.<br>
+ # Copyright (c) 2016, 2017 Red Hat, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
=C2=A0diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py<br>
@@ -69,16 +68,6 @@ index 4bf240f..2a8f13e 100755<br>
=C2=A0 # Copyright (c) 2013, 2014, 2015 Nicira, Inc.<br>
=C2=A0 #<br>
=C2=A0 # Licensed under the Apache License, Version 2.0 (the &quot;License&=
quot;);<br>
-diff --git a/vtep/ovs-vtep b/vtep/ovs-vtep<br>
-index fd652d4..19d63f9 100755<br>
---- a/vtep/ovs-vtep<br>
-+++ b/vtep/ovs-vtep<br>
-@@ -1,4 +1,4 @@<br>
--#! /usr/bin/env python<br>
-+#! /usr/bin/env python3<br>
- # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.<br>
- #<br>
- # Licensed under the Apache License, Version 2.0 (the &quot;License&quot;=
);<br>
=C2=A0diff --git a/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update=
 b/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update<br>
=C2=A0index e7404e3..5edad76 100755<br>
=C2=A0--- a/xenserver/etc_xapi.d_<wbr>plugins_openvswitch-cfg-update<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>disab=
le_m4_check.patch b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wb=
r>disable_m4_check.patch<br>
index 5c86aac..711a148 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>disable_m4_c=
heck.patch<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>disable_m4_c=
heck.patch<br>
@@ -13,10 +13,10 @@ diff --git a/Makefile.am b/Makefile.am<br>
=C2=A0index ff7d70a..2fc1f13 100644<br>
=C2=A0--- a/Makefile.am<br>
=C2=A0+++ b/Makefile.am<br>
-@@ -189,7 +189,7 @@ CLEAN_LOCAL +=3D clean-pycov<br>
- # Makefile in datapath/linux, needed to get the list of files to<br>
- # distribute, requires GNU make extensions.<br>
- if GNU_MAKE<br>
+@@ -187,7 +187,7 @@ CLEAN_LOCAL +=3D clean-pycov<br>
+ <br>
+ # If we&#39;re checked out from a Git repository, make sure that every<br=
>
+ # file that is in Git is distributed.<br>
=C2=A0-ALL_LOCAL +=3D dist-hook-git<br>
=C2=A0+# ALL_LOCAL +=3D dist-hook-git<br>
=C2=A0 dist-hook-git: distfiles<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openv=
switch-add-ptest-<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7a8eb.patch b=
/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswitch-add-p=
test-<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7a8eb.patch<br>
new file mode 100644<br>
index 0000000..5b53f96<br>
--- /dev/null<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>openvswitch-=
add-ptest-<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7a8eb.patch<br>
@@ -0,0 +1,110 @@<br>
+From fb68120ef8aed625b04b2fbd2cb78f<wbr>c59a7b7432 Mon Sep 17 00:00:00 200=
1<br>
+From: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@windriver.=
com</a>&gt;<br>
+Date: Wed, 30 Mar 2016 06:23:45 -0400<br>
+Subject: [PATCH] openvswitch: Add test-install rule to support ptest execu=
tion<br>
+<br>
+Signed-off-by: Radu Patriu &lt;<a href=3D"mailto:radu.patriu@enea.com">rad=
u.patriu@enea.com</a>&gt;<br>
+<br>
+Fix ptest for v2.5<br>
+ - Copy certain files from srcdir since it has been different from<br>
+=C2=A0 =C2=A0build directory.<br>
+ - Copy more necessary files for new added test cases.<br>
+ - Modify config files for running on target.<br>
+<br>
+Signed-off-by: He Zhe &lt;<a href=3D"mailto:zhe.he@windriver.com">zhe.he@w=
indriver.com</a>&gt;<br>
+<br>
+---<br>
+ Makefile.am |=C2=A0 1 +<br>
+ <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank">test.mk</=
a>=C2=A0 =C2=A0 =C2=A0| 72 ++++++++++++++++++++++++++++++<wbr>+++++++++++++=
+++++++++++++++++<wbr>+<br>
+ 2 files changed, 73 insertions(+)<br>
+ create mode 100644 <a href=3D"http://test.mk" rel=3D"noreferrer" target=
=3D"_blank">test.mk</a><br>
+<br>
+diff --git a/Makefile.am b/Makefile.am<br>
+index ea63acb..ff7d70a 100644<br>
+--- a/Makefile.am<br>
++++ b/Makefile.am<br>
+@@ -429,3 +429,4 @@ include windows/<a href=3D"http://automake.mk" rel=3D"=
noreferrer" target=3D"_blank">automake.mk</a><br>
+ include ovn/<a href=3D"http://automake.mk" rel=3D"noreferrer" target=3D"_=
blank">automake.mk</a><br>
+ include selinux/<a href=3D"http://automake.mk" rel=3D"noreferrer" target=
=3D"_blank">automake.mk</a><br>
+ include build-aux/<a href=3D"http://automake.mk" rel=3D"noreferrer" targe=
t=3D"_blank">automake.mk</a><br>
++include <a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank">t=
est.mk</a><br>
+diff --git a/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blan=
k">test.mk</a> b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_b=
lank">test.mk</a><br>
+new file mode 100644<br>
+index 0000000..b10a581<br>
+--- /dev/null<br>
++++ b/<a href=3D"http://test.mk" rel=3D"noreferrer" target=3D"_blank">test=
.mk</a><br>
+@@ -0,0 +1,74 @@<br>
++TEST_DEST ?=3D ${prefix}/lib/openvswitch<br>
++TEST_ROOT ?=3D ${prefix}/lib/openvswitch<br>
++TEST_DEPEND =3D<br>
++<br>
++if HAVE_OPENSSL<br>
++TEST_DEPEND +=3D $(TESTPKI_FILES)<br>
++endif<br>
++<br>
++test-install: $(TEST_DEPEND)<br>
++=C2=A0 =C2=A0 =C2=A0 @list=3D&#39;$(noinst_PROGRAMS) $(EXTRA_DIST) $(dist=
_check_SCRIPTS) $(TEST_DEPEND) tests/atlocal tests/atconfig&#39; ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/tests ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/ovs-vtep $(TEST_DEST)/tests ;=
\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/db ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/compat ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/<wbr>compat/sorte=
dcontainers ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/python/ovs/<wbr>unixctl ;\<b=
r>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vswitchd ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vswitchd/vswitch.<wbr>ovsschema $(=
TEST_DEST)/vswitchd ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install vswitchd/ovs-vswitchd $(TEST_DEST)/vswitchd =
;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/debian ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/debian/ovs-monitor-<wbr>ipsec $(TE=
ST_DEST)/debian ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/build-aux ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/build-aux/check-<wbr>structs $(TES=
T_DEST)/build-aux ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/usr_share_<wbr>openvswit=
ch_scripts_ovs-xapi-<wbr>sync $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_libex=
ec_interface-<wbr>reconfigure $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_libex=
ec_<wbr>InterfaceReconfigure.py $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_libex=
ec_<wbr>InterfaceReconfigureBridge.py $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/xenserver/opt_<wbr>xensource_libex=
ec_<wbr>InterfaceReconfigureVswitch.py $(TEST_DEST)/xenserver ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/vtep ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/vtep/vtep.ovsschema $(TEST_DEST)/v=
tep ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/ovn ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-nb.ovsschema $(TEST_DEST)/=
ovn ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/ovn/ovn-sb.ovsschema $(TEST_DEST)/=
ovn ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install -d $(TEST_DEST)/utilities ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://ovs-pc=
ap.in" rel=3D"noreferrer" target=3D"_blank">ovs-pcap.<wbr>in</a> $(TEST_DES=
T)/utilities ;\<br>
++=C2=A0 =C2=A0 =C2=A0 install $(srcdir)/utilities/<a href=3D"http://ovs-pk=
i.in" rel=3D"noreferrer" target=3D"_blank">ovs-pki.in</a> $(TEST_DEST)/util=
ities ;\<br>
++=C2=A0 =C2=A0 =C2=A0 for p in $$list ; do \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 echo $$p ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 p=3D$${p#../git/} ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#tests\/} ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DEST)/te=
sts/$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/tests/=
$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TEST_DE=
ST)/tests/$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 pre=3D$${p#python\/ovs\/} ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 if test $$pre !=3D $$p ; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 echo installing $$p to $(TEST_DEST)/py=
thon/ovs/$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if test -f $$p ; then \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $$p $(TEST_DEST)/python=
/ovs/$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else \<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install $(srcdir)/$$p $(TEST_DE=
ST)/python/ovs/$$pre ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 fi ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 continue ;\<br>
++=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi; \<br>
++=C2=A0 =C2=A0 =C2=A0 done ;\<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_builddir=3D.*|abs_<wbr>builddir=3D=
&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)/<wbr>tests&#39;&quot;&#39;&quot;&#3=
9;|g&#39; $(TEST_DEST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_srcdir=3D.*|abs_srcdir=3D&#39;&quo=
t;<wbr>&#39;&quot;&#39;$(TEST_ROOT)/tests&#39;&quot;&#39;&quot;&#39;|g&#39;=
 $(TEST_DEST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_srcdir=3D.*|abs_top_<wbr>srcdi=
r=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)&#39;&quot;&#39;&quot;&#39;|<wbr=
>g&#39; $(TEST_DEST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|abs_top_builddir=3D.*|abs_<wbr>top_bui=
lddir=3D&#39;&quot;&#39;&quot;&#39;$(TEST_ROOT)<wbr>&#39;&quot;&#39;&quot;&=
#39;|g&#39; $(TEST_DEST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_srcdir=3D.*|at_srcdir=3D&#39;&quot;=
&#39;&quot;<wbr>&#39;.&#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_DEST)/tests=
/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_srcdir=3D.*|at_top_<wbr>srcdir=
=3D&#39;&quot;&#39;&quot;&#39;..&#39;&quot;&#39;&quot;&#39;|g&#39; $(TEST_D=
EST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|at_top_build_prefix=3D.*|at_<wbr>top_b=
uild_prefix=3D&#39;&quot;&#39;&quot;&#39;../&#39;&quot;&#39;&quot;&#39;<wbr=
>|g&#39; $(TEST_DEST)/tests/atconfig<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|^\(.*config\.log.*\)|#\1|g&#39; $(TEST=
_DEST)/tests/testsuite<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|$$srcdir|$$abs_srcdir|g&#39; $(TEST_DE=
ST)/tests/testsuite<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-appctl-bashcomp\.bash|/<wbr>etc/ba=
sh_completion.d/ovs-<wbr>appctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests/te=
stsuite<br>
++=C2=A0 =C2=A0 =C2=A0 sed -i &#39;s|ovs-vsctl-bashcomp\.bash|/<wbr>etc/bas=
h_completion.d/ovs-<wbr>vsctl-bashcomp\.bash|g&#39; $(TEST_DEST)/tests/test=
suite<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>syste=
md-update-tool-paths.<wbr>patch b/recipes-networking/<wbr>openvswitch/openv=
switch-git/<wbr>systemd-update-tool-paths.<wbr>patch<br>
new file mode 100644<br>
index 0000000..9a792e6<br>
--- /dev/null<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch-git/<wbr>systemd-upda=
te-tool-paths.<wbr>patch<br>
@@ -0,0 +1,45 @@<br>
+From f45c0a9d712113417e7b56c199f857<wbr>6b470695ae Mon Sep 17 00:00:00 200=
1<br>
+From: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windriver.com"=
>mark.asselstine@windriver.com</a><wbr>&gt;<br>
+Date: Tue, 29 May 2018 18:57:46 +0000<br>
+Subject: [PATCH] systemd: update tool paths<br>
+<br>
+We are using the rhel files but we install our tools in a slightly<br>
+different path, update accordingly.<br>
+<br>
+Signed-off-by: Mark Asselstine &lt;<a href=3D"mailto:mark.asselstine@windr=
iver.com">mark.asselstine@windriver.com</a><wbr>&gt;<br>
+---<br>
+ rhel/<a href=3D"http://usr_lib_systemd_system_ovs-vswitchd.service.in" re=
l=3D"noreferrer" target=3D"_blank">usr_lib_systemd_system_<wbr>ovs-vswitchd=
.service.in</a> | 4 ++--<br>
+ rhel/usr_lib_systemd_system_<wbr>ovsdb-server.service=C2=A0 =C2=A0 | 2 +-=
<br>
+ 2 files changed, 3 insertions(+), 3 deletions(-)<br>
+<br>
+diff --git a/rhel/<a href=3D"http://usr_lib_systemd_system_ovs-vswitchd.se=
rvice.in" rel=3D"noreferrer" target=3D"_blank">usr_lib_systemd_system_<wbr>=
ovs-vswitchd.service.in</a> b/rhel/<a href=3D"http://usr_lib_systemd_system=
_ovs-vswitchd.service.in" rel=3D"noreferrer" target=3D"_blank">usr_lib_syst=
emd_system_<wbr>ovs-vswitchd.service.in</a><br>
+index 11b34c6..94c48f8 100644<br>
+--- a/rhel/<a href=3D"http://usr_lib_systemd_system_ovs-vswitchd.service.i=
n" rel=3D"noreferrer" target=3D"_blank">usr_lib_systemd_system_<wbr>ovs-vsw=
itchd.service.in</a><br>
++++ b/rhel/<a href=3D"http://usr_lib_systemd_system_ovs-vswitchd.service.i=
n" rel=3D"noreferrer" target=3D"_blank">usr_lib_systemd_system_<wbr>ovs-vsw=
itchd.service.in</a><br>
+@@ -15,8 +15,8 @@ EnvironmentFile=3D/etc/<wbr>openvswitch/default.conf<br>
+ EnvironmentFile=3D-/etc/<wbr>sysconfig/openvswitch<br>
+ EnvironmentFile=3D-/run/<wbr>openvswitch/useropts<br>
+ @begin_dpdk@<br>
+-ExecStartPre=3D-/bin/sh -c &#39;/usr/bin/chown :$${OVS_USER_ID##*:} /dev/=
hugepages&#39;<br>
+-ExecStartPre=3D-/usr/bin/chmod 0775 /dev/hugepages<br>
++ExecStartPre=3D-/bin/sh -c &#39;/bin/chown :$${OVS_USER_ID##*:} /dev/huge=
pages&#39;<br>
++ExecStartPre=3D-/bin/chmod 0775 /dev/hugepages<br>
+ @end_dpdk@<br>
+ ExecStart=3D/usr/share/<wbr>openvswitch/scripts/ovs-ctl \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0--no-ovsdb-server --no-monitor --=
system-id=3Drandom \<br>
+diff --git a/rhel/usr_lib_systemd_system_<wbr>ovsdb-server.service b/rhel/=
usr_lib_systemd_system_<wbr>ovsdb-server.service<br>
+index 0fa57a9..75c9e02 100644<br>
+--- a/rhel/usr_lib_systemd_system_<wbr>ovsdb-server.service<br>
++++ b/rhel/usr_lib_systemd_system_<wbr>ovsdb-server.service<br>
+@@ -10,7 +10,7 @@ Type=3Dforking<br>
+ Restart=3Don-failure<br>
+ EnvironmentFile=3D/etc/<wbr>openvswitch/default.conf<br>
+ EnvironmentFile=3D-/etc/<wbr>sysconfig/openvswitch<br>
+-ExecStartPre=3D/usr/bin/chown ${OVS_USER_ID} /var/run/openvswitch<br>
++ExecStartPre=3D/bin/chown ${OVS_USER_ID} /var/run/openvswitch<br>
+ ExecStartPre=3D/bin/sh -c &#39;rm -f /run/openvswitch/useropts; if [ &quo=
t;$${OVS_USER_ID/:*/}&quot; !=3D &quot;root&quot; ]; then /usr/bin/echo &qu=
ot;OVSUSER=3D--ovs-user=3D${OVS_<wbr>USER_ID}&quot; &gt; /run/openvswitch/u=
seropts; fi&#39;<br>
+ EnvironmentFile=3D-/run/<wbr>openvswitch/useropts<br>
+ ExecStart=3D/usr/share/<wbr>openvswitch/scripts/ovs-ctl \<br>
+-- <br>
+2.7.4<br>
+<br>
diff --git a/recipes-networking/<wbr>openvswitch/openvswitch.inc b/recipes-=
networking/<wbr>openvswitch/openvswitch.inc<br>
index 58e0fcb..70ac5bc 100644<br>
--- a/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
+++ b/recipes-networking/<wbr>openvswitch/openvswitch.inc<br>
@@ -63,6 +63,8 @@ FILES_${PN}-switch =3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/ovs-<wbr>vswitchd.ser=
vice \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>openvswitch.serv=
ice \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ${systemd_unitdir}/system/<wbr>ovsdb-server.ser=
vice \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/sysconfig/<wbr>openvswitch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${sysconfdir}/openvswitch/<wbr>default.conf \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0# silence a warning<br>
@@ -92,6 +94,14 @@ do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 CC=3D`echo &#39;${CC}&#39; | sed &#39;s/-Wa,/-X=
assembler /g&#39;`<br>
=C2=A0}<br>
<br>
+do_install_prepend() {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0SERVICE_FILE=3D&quot;${S}/rhel/usr_<wbr>lib_sys=
temd_system_ovs-<wbr>vswitchd.service&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/build-aux/dpdkstrip.py \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${@bb.utils.contains(&#39;<wbr>PA=
CKAGECONFIG&#39;,&#39;dpdk&#39;,&#39;--dpdk&#39;<wbr>,&#39;--nodpdk&#39;,d)=
} \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt; ${S}/rhel/<a href=3D"http://=
usr_lib_systemd_system_ovs-vswitchd.service.in" rel=3D"noreferrer" target=
=3D"_blank">usr_lib_systemd_<wbr>system_ovs-vswitchd.service.in</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&gt; ${SERVICE_FILE}<br>
+}<br>
+<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${sysconfdir}/default/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 660 ${WORKDIR}/openvswitch-switch-<w=
br>setup ${D}/${sysconfdir}/default/<wbr>openvswitch-switch<br>
@@ -103,6 +113,14 @@ do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 755 ${WORKDIR}/openvswitch-switch ${=
D}/${sysconfdir}/init.d/<wbr>openvswitch-switch<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 true || rm -fr ${D}/${datadir}/${PN}/pki<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/sysconfig<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/usr_share_<wbr>openvsw=
itch_scripts_systemd_<wbr>sysconfig.template \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${sysconfdir}/=
sysconfig/<wbr>openvswitch<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -d ${D}/${sysconfdir}/openvswitch<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0install -m 644 ${S}/rhel/etc_openvswitch_<wbr>d=
efault.conf \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0${D}/${sysconfdir}/=
<wbr>openvswitch/default.conf<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -d ${D}/${systemd_unitdir}/<wbr>system/=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/rhel/usr_lib_systemd_<wbr>s=
ystem_ovs-vswitchd.service \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ${D}/${systemd_unit=
dir}/<wbr>system/ovs-vswitchd.service<br>
diff --git a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswi=
tch_git.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a> b/r=
ecipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git.bb" re=
l=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
index c3a8301..9cdd484 100644<br>
--- a/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
+++ b/recipes-networking/<wbr>openvswitch/<a href=3D"http://openvswitch_git=
.bb" rel=3D"noreferrer" target=3D"_blank">openvswitch_git.bb</a><br>
@@ -12,39 +12,26 @@ RDEPENDS_${PN}-ptest +=3D &quot;\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
=C2=A0S =3D &quot;${WORKDIR}/git&quot;<br>
-PV =3D &quot;2.7.3+${SRCREV}&quot;<br>
+PV =3D &quot;2.9.2+${SRCREV}&quot;<br>
<br>
=C2=A0FILESEXTRAPATHS_append :=3D &quot;${THISDIR}/${PN}-git:&quot;<br>
<br>
-SRCREV =3D &quot;<wbr>b8dcfbebee9e7dbc74ec5eecc9b45d<wbr>335d6150c1&quot;<=
br>
+SRCREV =3D &quot;<wbr>7e614671cba3c4e338d1c5003b74a1<wbr>0047d7a8eb&quot;<=
br>
=C2=A0SRC_URI =3D &quot;file://openvswitch-switch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-switch-<wbr>se=
tup \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-<wbr>testcontr=
oller \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-<wbr>testcontr=
oller-setup \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/openvswitch/ovs.git;protocol=3Dgit;branch=3Dbranch-2.7" rel=3D"noreferrer=
" target=3D"_blank">github.com/openvswitch/<wbr>ovs.git;protocol=3Dgit;bran=
ch=3D<wbr>branch-2.7</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://github.co=
m/openvswitch/ovs.git;protocol=3Dgit;branch=3Dbranch-2.9" rel=3D"noreferrer=
" target=3D"_blank">github.com/openvswitch/<wbr>ovs.git;protocol=3Dgit;bran=
ch=3D<wbr>branch-2.9</a> \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://openvswitch-add-ptest-$<wb=
r>{SRCREV}.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://disable_m4_check.patch \<b=
r>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://kernel_module.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-make-remaining-<wbr=
>scripts-use-usr-bin-env.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-use-the-linux-if_<wbr=
>packet.h-Interface-directly.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://0002-Define-WAIT_ANY-<wbr>=
if-not-provided-by-system.<wbr>patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://python-switch-<wbr>remaini=
ng-scripts-to-use-<wbr>python3.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://systemd-update-tool-<wbr>p=
aths.patch \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;<br>
<br>
-# Temporarily backport patches to better support py3. These have been<br>
-# merged upstream but are not part of v2.7.1.<br>
-SRC_URI +=3D &quot; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Python3-<wbr>compatib=
ility-Convert-print-<wbr>statements.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0002-Python3-<wbr>compatib=
ility-exception-<wbr>cleanup.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0003-Python3-<wbr>compatib=
ility-execfile-to-<wbr>exec.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0004-Python3-<wbr>compatib=
ility-iteritems-to-<wbr>items.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0005-Python3-<wbr>compatib=
ility-fix-integer-<wbr>problems.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0006-Python3-<wbr>compatib=
ility-math-error-<wbr>compatibility.patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0007-Python3-<wbr>compatib=
ility-unicode-to-str.<wbr>patch \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0008-AUTHORS-Add-Jason-<wb=
r>Wessel.patch \<br>
-&quot;<br>
-<br>
=C2=A0LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<wbr>17b2c9d4c70853a0=
9c0e143137754b<wbr>35&quot;<br>
<br>
=C2=A0DPDK_INSTALL_DIR ?=3D &quot;/opt/dpdk&quot;<br>
@@ -71,5 +58,4 @@ do_install_ptest() {<br>
<br>
=C2=A0do_install_append() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 oe_runmake modules_install INSTALL_MOD_PATH=3D$=
{D}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0rm -r ${D}/${localstatedir}/run<br>
=C2=A0}<br>
<span class=3D"HOEnZb"><font color=3D"#888888">-- <br>
2.7.4<br>
<br>
-- <br>
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

--00000000000095e2b1056dc88359--
