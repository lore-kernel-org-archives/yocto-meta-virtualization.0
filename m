Received: from mail-qv1-f67.google.com (mail-qv1-f67.google.com [209.85.219.67])
 by mx.groups.io with SMTP id smtpd.web09.85.1582220656656692811
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 20 Feb 2020 09:44:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=umXQ6X45;
 spf=pass (domain: gmail.com, ip: 209.85.219.67, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f67.google.com with SMTP id p2so2265090qvo.10
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Feb 2020 09:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=I2edpAxPE5/YAIEHmgCubb4gFGF1ZRsjj0kgv8a5w0M=;
        b=umXQ6X45xamZTIGaWg7PDGLasQrEANGHd2boVDZ8kADrBfmblK+BtBBImCkMW+khfB
         87MuL56PvwR/lR8H90UaIRTwLp5CFAhW6jV9EeaMRAPF/gbqV+zDVNj81ciFdCelBTve
         5FvpdG1mPPDss5glu+kUOVS6aUU1fJNVJ2L3KfX8SQy+Pe40YbhlfuOjL9ArPrS4i1B1
         E7lnjWXekmNw7ywS0wk3cMuDacdLLrmsGT2UEHaVNlig3ttGf+vJviGLG98EfJ0x0XRe
         aLK06Dxsc6NDR595Pc3KVZmImrtk/bhTcZG+FolSmQHtRkp3W4td7OeRVswS7f/ExO27
         +Tgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=I2edpAxPE5/YAIEHmgCubb4gFGF1ZRsjj0kgv8a5w0M=;
        b=HQm1PfCBKCFemek3MqazqbeuQ0L61nCrH8yzf98+D8IUoiPZ2EiKy5UnvP1VFGgj8z
         Vuu0JJwkvdI15sTlLjR6KfeuC/NVIp3lYZ9G62iYexbYOBN/dMJc+j/a4fPJYrFiA1jG
         ZECkgrDbCxvK7ixO8pqZ4+Zbq2SlnuN30y3Ufw6bohfQzqH48kOwXuzWw21QRexPb2uM
         WFqf+OHmQPN3TWsWLP74w6aLBRXHhWv56UP/Cy3eYKJGr1qW5BLSltv5HBhAzPsrNlv6
         L498VJzkckLsxdRx4IXxTY3IDzW2tQV8B0ZhL9OfZeIz2s2Gehii8l+ZSSnua17sXmxk
         ck3w==
X-Gm-Message-State: APjAAAUUHGgCgtBphJZiZiLn4eMHznm9k+zMS4zba11virHWlJzCyawj
	pAbnq2kllUdAxTBRXy40soY=
X-Google-Smtp-Source: APXvYqztKBMlelOpqnzcbVc0SunMEI+9BLQnTG3PKIESIjQ9pZUgu2Ns/T4EYRPykKQyb22uJ59B0A==
X-Received: by 2002:a0c:9d4f:: with SMTP id n15mr27211801qvf.194.1582220655559;
        Thu, 20 Feb 2020 09:44:15 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from gmail.com (CPEe8de27b71faa-CM64777d5e8820.cpe.net.cable.rogers.com. [174.113.11.95])
        by smtp.gmail.com with ESMTPSA id m20sm162316qke.17.2020.02.20.09.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Feb 2020 09:44:15 -0800 (PST)
Date: Thu, 20 Feb 2020 12:44:13 -0500
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: uprev from v2.12 to v2.13
Message-ID: <20200220174412.GC65133@gmail.com>
References: <1582160864-1989-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1582160864-1989-1-git-send-email-mark.asselstine@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

merged.

Bruce


In message: [meta-virtualization][PATCH] openvswitch: uprev from v2.12 to v2.13
on 19/02/2020 Mark Asselstine wrote:

> Another straightforward uprev with one fairly large change in the
> changelog. The Open Virtual Network component has now been moved to
> its own repo (https://github.com/ovn-org/ovn.git). If you were using
> this functionality a new recipe will need to be created.
> 
> The ptest results are similar to after the v2.12 uprev
> 
>     ERROR: 2206 tests were run,
>     28 failed unexpectedly.
>     62 tests were skipped.
> 
> The failed tests were in the following areas:
>     checkpatch.at (5)
>     ovs-ofctl.at (1)
>     tunnel.at(1)
>     tunnel-push-pop.at(3)
>     tunnel-push-pop-ipv6.at(3)
>     dpif-netdev.at (1)
>     pmd.at(1)
>     ofproto-dpif.at (7)
>     bridge.at (2)
>     ovsdb-idl.at(1)
>     mcast-snooping.at(1)
>     packet-type-aware.at(2)
> 
> None of these affect core functionality or usecases and are similar to
> the results we see with v1.12. If specific usecases are affected by
> these failures we should address them on a need to fix basis.
> 
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  ...on-make-remaining-scripts-use-usr-bin-env.patch | 373 ---------------------
>  ...n-switch-remaining-scripts-to-use-python3.patch |  13 +-
>  ...Define-WAIT_ANY-if-not-provided-by-system.patch |  29 --
>  ...71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch} |   0
>  ...-idlc.in-fix-dict-change-during-iteration.patch |  45 ---
>  recipes-networking/openvswitch/openvswitch_git.bb  |  13 +-
>  6 files changed, 6 insertions(+), 467 deletions(-)
>  delete mode 100644 recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
>  delete mode 100644 recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
>  rename recipes-networking/openvswitch/openvswitch-git/{openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch => openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch} (100%)
>  delete mode 100644 recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> 
> diff --git a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch b/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> deleted file mode 100644
> index 53e3103..0000000
> --- a/recipes-networking/openvswitch/files/python-make-remaining-scripts-use-usr-bin-env.patch
> +++ /dev/null
> @@ -1,373 +0,0 @@
> -From a348e0162343f7d46443eb1fd2bcf0698460a780 Mon Sep 17 00:00:00 2001
> -From: "Hongzhi.Song" <hongzhi.song@windriver.com>
> -Date: Wed, 23 Jan 2019 04:28:28 -0500
> -Subject: [PATCH] python: make remaining scripts use /usr/bin/env
> -
> -Unfortunately there is no concept of a host python vs. target python
> -to facilitate cross compilation. There is only one PYTHON variable and
> -this is used during building and in the header of python scripts after
> -installation. The best approach for cross compilation is to thus to
> -ensure python is in the path and avoid passing a path as part of
> -PYTHON. To make this function smoothly all installed scripts should
> -make use of /usr/bin/env to increase the chances of finding python.
> -
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
> ----
> - build-aux/check-structs                     | 2 +-
> - build-aux/dpdkstrip.py                      | 2 +-
> - build-aux/extract-ofp-actions               | 2 +-
> - build-aux/extract-ofp-errors                | 2 +-
> - build-aux/extract-ofp-fields                | 2 +-
> - build-aux/extract-ofp-msgs                  | 2 +-
> - build-aux/sodepends.py                      | 2 +-
> - build-aux/soexpand.py                       | 2 +-
> - build-aux/text2c                            | 2 +-
> - build-aux/xml2nroff                         | 2 +-
> - ovn/utilities/ovn-detrace.in                | 2 +-
> - ovn/utilities/ovn-docker-overlay-driver.in  | 2 +-
> - ovn/utilities/ovn-docker-underlay-driver.in | 2 +-
> - ovsdb/dot2pic                               | 2 +-
> - ovsdb/ovsdb-doc                             | 2 +-
> - ovsdb/ovsdb-dot.in                          | 2 +-
> - ovsdb/ovsdb-idlc.in                         | 2 +-
> - python/build/soutil.py                      | 2 +-
> - tests/flowgen.py                            | 2 +-
> - tests/ovsdb-monitor-sort.py                 | 2 +-
> - tests/uuidfilt.py                           | 2 +-
> - utilities/bugtool/ovs-bugtool.in            | 2 +-
> - utilities/ovs-check-dead-ifs.in             | 2 +-
> - utilities/ovs-dpctl-top.in                  | 2 +-
> - utilities/ovs-l3ping.in                     | 2 +-
> - utilities/ovs-parse-backtrace.in            | 2 +-
> - utilities/ovs-pcap.in                       | 2 +-
> - utilities/ovs-tcpdump.in                    | 2 +-
> - utilities/ovs-tcpundump.in                  | 2 +-
> - utilities/ovs-test.in                       | 2 +-
> - utilities/ovs-vlan-test.in                  | 2 +-
> - vtep/ovs-vtep.in                            | 2 +-
> - 32 files changed, 32 insertions(+), 32 deletions(-)
> -
> -diff --git a/build-aux/check-structs b/build-aux/check-structs
> -index 37ffa06..eb44c91 100755
> ---- a/build-aux/check-structs
> -+++ b/build-aux/check-structs
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import os.path
> - import sys
> -diff --git a/build-aux/dpdkstrip.py b/build-aux/dpdkstrip.py
> -index 48c7f06..b8b8ba9 100755
> ---- a/build-aux/dpdkstrip.py
> -+++ b/build-aux/dpdkstrip.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - # Copyright (c) 2017 Red Hat, Inc.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/build-aux/extract-ofp-actions b/build-aux/extract-ofp-actions
> -index 64de0f3..f6bca0b 100755
> ---- a/build-aux/extract-ofp-actions
> -+++ b/build-aux/extract-ofp-actions
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import getopt
> - import sys
> -diff --git a/build-aux/extract-ofp-errors b/build-aux/extract-ofp-errors
> -index 6f64efd..c410fd4 100755
> ---- a/build-aux/extract-ofp-errors
> -+++ b/build-aux/extract-ofp-errors
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import sys
> - import os.path
> -diff --git a/build-aux/extract-ofp-fields b/build-aux/extract-ofp-fields
> -index 3592594..2fc8317 100755
> ---- a/build-aux/extract-ofp-fields
> -+++ b/build-aux/extract-ofp-fields
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import getopt
> - import sys
> -diff --git a/build-aux/extract-ofp-msgs b/build-aux/extract-ofp-msgs
> -index a67e870..92c4bda 100755
> ---- a/build-aux/extract-ofp-msgs
> -+++ b/build-aux/extract-ofp-msgs
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import sys
> - import os.path
> -diff --git a/build-aux/sodepends.py b/build-aux/sodepends.py
> -index 90cfaa0..45812bc 100755
> ---- a/build-aux/sodepends.py
> -+++ b/build-aux/sodepends.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2008, 2011, 2017 Nicira, Inc.
> - #
> -diff --git a/build-aux/soexpand.py b/build-aux/soexpand.py
> -index 53ca640..00adcf4 100755
> ---- a/build-aux/soexpand.py
> -+++ b/build-aux/soexpand.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2008, 2017 Nicira, Inc.
> - #
> -diff --git a/build-aux/text2c b/build-aux/text2c
> -index cb1f256..ab7910e 100755
> ---- a/build-aux/text2c
> -+++ b/build-aux/text2c
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - import re
> - import sys
> -diff --git a/build-aux/xml2nroff b/build-aux/xml2nroff
> -index bd4e879..db45c56 100755
> ---- a/build-aux/xml2nroff
> -+++ b/build-aux/xml2nroff
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015, 2016 Nicira, Inc.
> - #
> -diff --git a/ovn/utilities/ovn-detrace.in b/ovn/utilities/ovn-detrace.in
> -index c842adc..9e95183 100755
> ---- a/ovn/utilities/ovn-detrace.in
> -+++ b/ovn/utilities/ovn-detrace.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2017 eBay Inc.
> - #
> -diff --git a/ovn/utilities/ovn-docker-overlay-driver.in b/ovn/utilities/ovn-docker-overlay-driver.in
> -index 65edfcd..895426b 100755
> ---- a/ovn/utilities/ovn-docker-overlay-driver.in
> -+++ b/ovn/utilities/ovn-docker-overlay-driver.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - # Copyright (C) 2015 Nicira, Inc.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/ovn/utilities/ovn-docker-underlay-driver.in b/ovn/utilities/ovn-docker-underlay-driver.in
> -index d91ce9f..e0c8db6 100755
> ---- a/ovn/utilities/ovn-docker-underlay-driver.in
> -+++ b/ovn/utilities/ovn-docker-underlay-driver.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - # Copyright (C) 2015 Nicira, Inc.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/ovsdb/dot2pic b/ovsdb/dot2pic
> -index de67261..174e723 100755
> ---- a/ovsdb/dot2pic
> -+++ b/ovsdb/dot2pic
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2009, 2010, 2011, 2013, 2017 Nicira, Inc.
> - #
> -diff --git a/ovsdb/ovsdb-doc b/ovsdb/ovsdb-doc
> -index 406c293..d55c6e6 100755
> ---- a/ovsdb/ovsdb-doc
> -+++ b/ovsdb/ovsdb-doc
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2010, 2011, 2012, 2013, 2014, 2015 Nicira, Inc.
> - #
> -diff --git a/ovsdb/ovsdb-dot.in b/ovsdb/ovsdb-dot.in
> -index 8eea617..38ba33a 100755
> ---- a/ovsdb/ovsdb-dot.in
> -+++ b/ovsdb/ovsdb-dot.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! /usr/bin/env @PYTHON@
> - 
> - from datetime import date
> - import ovs.db.error
> -diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> -index 40fef39..84c63a6 100755
> ---- a/ovsdb/ovsdb-idlc.in
> -+++ b/ovsdb/ovsdb-idlc.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - 
> - from __future__ import print_function
> - import getopt
> -diff --git a/python/build/soutil.py b/python/build/soutil.py
> -index b8027af..8f52803 100755
> ---- a/python/build/soutil.py
> -+++ b/python/build/soutil.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2008, 2017 Nicira, Inc.
> - #
> -diff --git a/tests/flowgen.py b/tests/flowgen.py
> -index 976fe7a..7ef32d1 100755
> ---- a/tests/flowgen.py
> -+++ b/tests/flowgen.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Copyright (c) 2009, 2010, 2011, 2012, 2015, 2017 Nicira, Inc.
> - #
> -diff --git a/tests/ovsdb-monitor-sort.py b/tests/ovsdb-monitor-sort.py
> -index 7d368a7..ab4c38c 100755
> ---- a/tests/ovsdb-monitor-sort.py
> -+++ b/tests/ovsdb-monitor-sort.py
> -@@ -1,4 +1,4 @@
> --#! /usr/bin/env python
> -+#! /usr/bin/env python3
> - 
> - # Breaks lines read from stdin into groups using blank lines as
> - # group separators, then sorts lines within the groups for
> -diff --git a/tests/uuidfilt.py b/tests/uuidfilt.py
> -index ea72812..f1a9aff 100755
> ---- a/tests/uuidfilt.py
> -+++ b/tests/uuidfilt.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - import re
> - import sys
> -diff --git a/utilities/bugtool/ovs-bugtool.in b/utilities/bugtool/ovs-bugtool.in
> -index 288c34f..b5a6906 100755
> ---- a/utilities/bugtool/ovs-bugtool.in
> -+++ b/utilities/bugtool/ovs-bugtool.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#! /usr/bin/env @PYTHON@
> - 
> - # This library is free software; you can redistribute it and/or
> - # modify it under the terms of version 2.1 of the GNU Lesser General Public
> -diff --git a/utilities/ovs-check-dead-ifs.in b/utilities/ovs-check-dead-ifs.in
> -index ac54f6c..13d86b3 100755
> ---- a/utilities/ovs-check-dead-ifs.in
> -+++ b/utilities/ovs-check-dead-ifs.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - 
> - import os
> - import re
> -diff --git a/utilities/ovs-dpctl-top.in b/utilities/ovs-dpctl-top.in
> -index 7f0f1f8..ece707a 100755
> ---- a/utilities/ovs-dpctl-top.in
> -+++ b/utilities/ovs-dpctl-top.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2013 Nicira, Inc.
> - #
> -diff --git a/utilities/ovs-l3ping.in b/utilities/ovs-l3ping.in
> -index 1b07972..9852699 100644
> ---- a/utilities/ovs-l3ping.in
> -+++ b/utilities/ovs-l3ping.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -diff --git a/utilities/ovs-parse-backtrace.in b/utilities/ovs-parse-backtrace.in
> -index 350cbd9..1960fb4 100755
> ---- a/utilities/ovs-parse-backtrace.in
> -+++ b/utilities/ovs-parse-backtrace.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2012 Nicira, Inc.
> - #
> -diff --git a/utilities/ovs-pcap.in b/utilities/ovs-pcap.in
> -index 7bebc07..b4e5ca8 100755
> ---- a/utilities/ovs-pcap.in
> -+++ b/utilities/ovs-pcap.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> -diff --git a/utilities/ovs-tcpdump.in b/utilities/ovs-tcpdump.in
> -index 22f249f..ff2a51e 100755
> ---- a/utilities/ovs-tcpdump.in
> -+++ b/utilities/ovs-tcpdump.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2016 Red Hat, Inc.
> - #
> -diff --git a/utilities/ovs-tcpundump.in b/utilities/ovs-tcpundump.in
> -index c298700..0d8b8da 100755
> ---- a/utilities/ovs-tcpundump.in
> -+++ b/utilities/ovs-tcpundump.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> -diff --git a/utilities/ovs-test.in b/utilities/ovs-test.in
> -index fb1f9ad..4dba169 100644
> ---- a/utilities/ovs-test.in
> -+++ b/utilities/ovs-test.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> - # you may not use this file except in compliance with the License.
> -diff --git a/utilities/ovs-vlan-test.in b/utilities/ovs-vlan-test.in
> -index e229498..5b70118 100755
> ---- a/utilities/ovs-vlan-test.in
> -+++ b/utilities/ovs-vlan-test.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - #
> - # Copyright (c) 2010 Nicira, Inc.
> - #
> -diff --git a/vtep/ovs-vtep.in b/vtep/ovs-vtep.in
> -index 3383870..42f98db 100755
> ---- a/vtep/ovs-vtep.in
> -+++ b/vtep/ovs-vtep.in
> -@@ -1,4 +1,4 @@
> --#! @PYTHON@
> -+#!/usr/bin/env @PYTHON@
> - # Copyright (C) 2013 Nicira, Inc. All Rights Reserved.
> - #
> - # Licensed under the Apache License, Version 2.0 (the "License");
> --- 
> -2.8.1
> -
> diff --git a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> index 64e0e3f..113bc91 100644
> --- a/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> +++ b/recipes-networking/openvswitch/files/python-switch-remaining-scripts-to-use-python3.patch
> @@ -10,13 +10,12 @@ Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
>  ---
>   ofproto/ipfix-gen-entities                            | 2 +-
>   tests/test-l7.py                                      | 2 +-
> - utilities/checkpatch.py                               | 2 +-
>   utilities/ovs-dev.py                                  | 2 +-
>   utilities/ovs-pipegen.py                              | 2 +-
>   xenserver/etc_xapi.d_plugins_openvswitch-cfg-update   | 2 +-
>   xenserver/opt_xensource_libexec_interface-reconfigure | 2 +-
>   xenserver/usr_share_openvswitch_scripts_ovs-xapi-sync | 2 +-
> - 8 files changed, 8 insertions(+), 8 deletions(-)
> + 7 files changed, 7 insertions(+), 7 deletions(-)
>  
>  diff --git a/ofproto/ipfix-gen-entities b/ofproto/ipfix-gen-entities
>  index 0be7199..d2cce42 100755
> @@ -38,16 +37,6 @@ index d7854a1..f09defb 100755
>   # Copyright (c) 2015, 2016 Nicira, Inc.
>   #
>   # Licensed under the Apache License, Version 2.0 (the "License");
> -diff --git a/utilities/checkpatch.py b/utilities/checkpatch.py
> -index f929714..e17a1cf 100755
> ---- a/utilities/checkpatch.py
> -+++ b/utilities/checkpatch.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # Copyright (c) 2016, 2017 Red Hat, Inc.
> - # Copyright (c) 2018 Nicira, Inc.
> - #
>  diff --git a/utilities/ovs-dev.py b/utilities/ovs-dev.py
>  index 9ce0f04..839e13e 100755
>  --- a/utilities/ovs-dev.py
> diff --git a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch b/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
> deleted file mode 100644
> index f997bbf..0000000
> --- a/recipes-networking/openvswitch/openvswitch-git/0002-Define-WAIT_ANY-if-not-provided-by-system.patch
> +++ /dev/null
> @@ -1,29 +0,0 @@
> -From 801023e72b31e7c49cbccedd76ade33a17fcbe45 Mon Sep 17 00:00:00 2001
> -From: Khem Raj <raj.khem@gmail.com>
> -Date: Mon, 20 Mar 2017 12:13:30 -0700
> -Subject: [PATCH] Define WAIT_ANY if not provided by system
> -
> -POSIX does not define it and uses -1 directly
> -some libc do not have this definitions
> -
> -Signed-off-by: Khem Raj <raj.khem@gmail.com>
> -
> ----
> - tests/test-ovn.c | 4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/tests/test-ovn.c b/tests/test-ovn.c
> -index 84adf81..2bc6bdf 100644
> ---- a/tests/test-ovn.c
> -+++ b/tests/test-ovn.c
> -@@ -38,6 +38,10 @@
> - #include "simap.h"
> - #include "util.h"
> - 
> -+#ifndef WAIT_ANY
> -+# define WAIT_ANY (-1) /* Any process.  */
> -+#endif
> -+
> - /* --relops: Bitmap of the relational operators to test, in exhaustive test. */
> - static unsigned int test_relops;
> - 
> diff --git a/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch b/recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> similarity index 100%
> rename from recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch
> rename to recipes-networking/openvswitch/openvswitch-git/openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch
> diff --git a/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch b/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> deleted file mode 100644
> index bf49ff6..0000000
> --- a/recipes-networking/openvswitch/openvswitch-git/ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
> -From: Flavio Leitner <fbl@sysclose.org>
> -Date: Sat, 14 Sep 2019 20:17:28 -0300
> -Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
> -
> -Commit d84109f0b600 from git://github.com/openvswitch/ovs.git
> -
> -Python3 complains if a dict key is changed during the
> -iteration.
> -
> -Use list() to create a copy of it.
> -
> -Traceback (most recent call last):
> -  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
> -    func(*args[1:])
> -  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
> -    replace_cplusplus_keyword(schema)
> -  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
> -    for columnName in table.columns:
> -RuntimeError: dictionary keys changed during iteration
> -
> -Signed-off-by: Flavio Leitner <fbl@sysclose.org>
> -Signed-off-by: Ben Pfaff <blp@ovn.org>
> -[MA: Upstream-Status: Submitted]
> -Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ----
> - ovsdb/ovsdb-idlc.in | 2 +-
> - 1 file changed, 1 insertion(+), 1 deletion(-)
> -
> -diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> -index 40fef39..22d0a4e 100755
> ---- a/ovsdb/ovsdb-idlc.in
> -+++ b/ovsdb/ovsdb-idlc.in
> -@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
> -                 'wchar_t', 'while', 'xor', 'xor_eq'}
> - 
> -     for tableName, table in schema.tables.items():
> --        for columnName in table.columns:
> -+        for columnName in list(table.columns):
> -             if columnName in keywords:
> -                 table.columns[columnName + '_'] = table.columns.pop(columnName)
> - 
> --- 
> -2.7.4
> -
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-networking/openvswitch/openvswitch_git.bb
> index 141a609..07258be 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -5,7 +5,7 @@ DEPENDS += "virtual/kernel"
>  PACKAGE_ARCH = "${MACHINE_ARCH}"
>  
>  RDEPENDS_${PN}-ptest += "\
> -	python3-logging python3-syslog python3-io \
> +	python3-logging python3-syslog python3-io python3-core \
>  	python3-fcntl python3-shell python3-xml python3-math \
>  	python3-datetime python3-netclient python3 sed \
>  	ldd perl-module-socket perl-module-carp perl-module-exporter \
> @@ -14,26 +14,23 @@ RDEPENDS_${PN}-ptest += "\
>  	"
>  
>  S = "${WORKDIR}/git"
> -PV = "2.12+${SRCPV}"
> +PV = "2.13+${SRCPV}"
>  
>  FILESEXTRAPATHS_append := "${THISDIR}/${PN}-git:"
>  
> -SRCREV = "6beb94976e2b3e0c51430b63214de14186d8db39"
> +SRCREV = "71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3"
>  SRC_URI = "file://openvswitch-switch \
>             file://openvswitch-switch-setup \
>             file://openvswitch-testcontroller \
>             file://openvswitch-testcontroller-setup \
> -           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.12 \
> -           file://openvswitch-add-ptest-6beb94976e2b3e0c51430b63214de14186d8db39.patch \
> +           git://github.com/openvswitch/ovs.git;protocol=git;branch=branch-2.13 \
> +           file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae34de2f3.patch \
>             file://run-ptest \
>             file://disable_m4_check.patch \
>             file://kernel_module.patch \
> -           file://python-make-remaining-scripts-use-usr-bin-env.patch \
> -           file://0002-Define-WAIT_ANY-if-not-provided-by-system.patch \
>             file://python-switch-remaining-scripts-to-use-python3.patch \
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> -           file://ovsdb-idlc.in-fix-dict-change-during-iteration.patch \
>             "
>  
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=1ce5d23a6429dff345518758f13aaeab"
> -- 
> 2.7.4
> 
