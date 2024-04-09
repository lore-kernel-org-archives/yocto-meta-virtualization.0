Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F13CCC67861
	for <webhook@archiver.kernel.org>; Tue,  9 Apr 2024 14:13:41 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web10.137389.1712672021178454013
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 09 Apr 2024 07:13:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=fe4CO4Ak;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-789f1b59a28so337014385a.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 07:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712672020; x=1713276820; darn=lists.yoctoproject.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZrL01fMEWESWtT1DZjw+Sdg2hn6/uDrxGXhhbH3j5cc=;
        b=fe4CO4AkhcjVzYI3VNgE4I/jm3Y/WQMJPftxXf3rvkYQdsdxid/qTZz+RPXGASRjQO
         7c8BoZ47OG3K1rOVg+NviGEfO7OkhpwXfPD+IYbVaiYjxicyFSo9AjisaQieZ4zNpKkM
         cOxOksXQ2lMta5/Dnrz29c2jQu8ZJ0Wi8YQfsbumn2IWfD1APw4ecaPr+aS9APtWR7uI
         MGY2a4kyhCXBaKv7rreLXO0oEsrXHWvX0ng7I3LLRRcls8XRFOJbXawmRYKt8+mCbQxE
         WwIZcWloQ99rWftlsUxxvUDzLxxPJyN6SmuRNrpZ8Q1ZccohPmsDwh7XMfbJSWhs3kA4
         0EkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712672020; x=1713276820;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZrL01fMEWESWtT1DZjw+Sdg2hn6/uDrxGXhhbH3j5cc=;
        b=h/i2djn8y2Ynvjen9QL7GVANN7oHhYtLrK5xQlQuOTn47vZz/bze8X8qzbIsAW7s/3
         IPMfZB6S9grFEbtjllf/owaF4Q8kd6mybK1ApeN4kyLeQHXX30lhcw5Nl/z8eG2g2j8w
         7G1aPYObg0ZB7m8VtFFCQbs7Ofn55H2m4DJStMySMQIVbeLQ7Ewklh/1b86MDD4yIMZA
         opShxHd8GvU85sMBM6lYe60/qihPEIsXOpylYdcOJnFky16kO1NVxa61KnbTRmHXlVg4
         DMiYQcwIp22av+aXXWcZ6v9IMiYMB/+9qsISfXj3+ygB73jmwob3ve3nJLgcIg5rULaV
         5wsg==
X-Gm-Message-State: AOJu0YxRoR7SOtQioicCzv2FBXorvezuNFIg4G1wJ/QXLYoha4ef6jZF
	5D1LbxYNUC2Y90v48IpdZhBa0EJXhu85rgOGEybaxYrbmKOYY99SPHDllxWR
X-Google-Smtp-Source: AGHT+IFZm1rqEXQ6f3zie6PASZpZlLc+tVcKYol1OQ4d2j2QJJ65xwfqSMbzlmNFY6CFJrviMpilLA==
X-Received: by 2002:a05:620a:857:b0:78d:70f7:be79 with SMTP id u23-20020a05620a085700b0078d70f7be79mr1450324qku.45.1712672019884;
        Tue, 09 Apr 2024 07:13:39 -0700 (PDT)
Received: from gmail.com ([174.112.62.108])
        by smtp.gmail.com with ESMTPSA id v8-20020a05620a122800b0078d675feab6sm1743454qkj.7.2024.04.09.07.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 07:13:39 -0700 (PDT)
Date: Tue, 9 Apr 2024 14:13:37 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: "Yu, Mingli" <mingli.yu@eng.windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [meta-cloud-services][PATCH]
 python3-ansible: Upgrade 2.14.5 -> 2.16.5
Message-ID: <ZhVNEXf3z+TA1p16@gmail.com>
References: <20240403085527.3432952-1-mingli.yu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240403085527.3432952-1-mingli.yu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 09 Apr 2024 14:13:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8669

merged.

Bruce

In message: [meta-virtualization] [meta-cloud-services][PATCH] python3-ansible: Upgrade 2.14.5 -> 2.16.5
on 03/04/2024 Yu, Mingli wrote:

> From: Mingli Yu <mingli.yu@windriver.com>
> 
> The 2.14.x will be EOL 20 May 2024 [1], so upgrade to 2.16.5 which
> also includes the security fix for CVE-2024-0690.
> 
> [1] https://docs.ansible.com/ansible/devel/reference_appendices/release_and_maintenance.html
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> ---
>  recipes-devtools/python/python-ansible.inc    |   6 +-
>  ...nsure-py-scripts-use-py3-for-shebang.patch | 337 ++++++------------
>  ...le_2.14.5.bb => python3-ansible_2.16.5.bb} |   0
>  3 files changed, 121 insertions(+), 222 deletions(-)
>  rename recipes-devtools/python/{python3-ansible_2.14.5.bb => python3-ansible_2.16.5.bb} (100%)
> 
> diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
> index fa55ba3f..7c9d0f51 100644
> --- a/recipes-devtools/python/python-ansible.inc
> +++ b/recipes-devtools/python/python-ansible.inc
> @@ -2,13 +2,13 @@ DESCRIPTION = "Ansible is a simple IT automation platform that makes your applic
>  HOMEPAGE = "https://github.com/ansible/ansible/"
>  SECTION = "devel/python"
>  LICENSE = "GPL-3.0-only"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
>  
>  SRCNAME = "ansible"
>  
> -SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.14"
> +SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.16"
>  
> -SRCREV = "5c6dfff68759ccc9794b609db45872950077e98b"
> +SRCREV = "ee04df4796af1a438bc80aff33cdd5ca4d5304aa"
>  
>  S = "${WORKDIR}/git"
>  
> diff --git a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> index 67a4f954..420324b7 100644
> --- a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> +++ b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> @@ -1,4 +1,4 @@
> -From b5d7b08addeb7795720acf3debd88a13ddd30402 Mon Sep 17 00:00:00 2001
> +From f14f3a89262e9348348f6aeced9c20067a613062 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
>  Date: Thu, 11 May 2023 17:05:54 +0800
>  Subject: [PATCH] python3: ensure py scripts use py3 for shebang
> @@ -6,27 +6,21 @@ Subject: [PATCH] python3: ensure py scripts use py3 for shebang
>  Upstream-Status: Pending
>  
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> -Rebase to 2.24.5
> +Rebase to 2.14.5
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Rebase to 2.16.5
>  Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>  ---
>   .azure-pipelines/scripts/combine-coverage.py                  | 2 +-
>   .azure-pipelines/scripts/publish-codecov.py                   | 2 +-
>   .azure-pipelines/scripts/time-command.py                      | 2 +-
> - docs/bin/find-plugin-refs.py                                  | 2 +-
> - docs/docsite/rst/dev_guide/testing/sanity/shebang.rst         | 2 +-
> - docs/docsite/rst/inventory_guide/connection_details.rst       | 4 ++--
> - docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po          | 4 ++--
> - examples/scripts/uptime.py                                    | 2 +-
>   hacking/ansible-profile                                       | 2 +-
>   hacking/azp/download.py                                       | 2 +-
>   hacking/azp/get_recent_coverage_runs.py                       | 2 +-
>   hacking/azp/incidental.py                                     | 2 +-
>   hacking/azp/run.py                                            | 2 +-
>   hacking/backport/backport_of_line_adder.py                    | 2 +-
> - hacking/build-ansible.py                                      | 2 +-
> - hacking/create_deprecation_bug_reports.py                     | 2 +-
> - hacking/fix_test_syntax.py                                    | 2 +-
> - hacking/get_library.py                                        | 2 +-
> + hacking/create-bulk-issues.py                                 | 2 +-
>   hacking/report.py                                             | 2 +-
>   hacking/return_skeleton_generator.py                          | 2 +-
>   hacking/test-module.py                                        | 2 +-
> @@ -42,9 +36,11 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   lib/ansible/cli/pull.py                                       | 2 +-
>   lib/ansible/cli/scripts/ansible_connection_cli_stub.py        | 2 +-
>   lib/ansible/cli/vault.py                                      | 2 +-
> + packaging/cli-doc/build.py                                    | 2 +-
>   packaging/release.py                                          | 2 +-
> - packaging/sdist/check-link-behavior.py                        | 2 +-
> + test/integration/targets/ansible-config/files/ini_dupes.py    | 2 +-
>   .../targets/ansible-galaxy-collection/files/build_bad_tar.py  | 2 +-
> + .../targets/ansible-galaxy-role/files/create-role-archive.py  | 2 +-
>   test/integration/targets/ansible-test-container/runme.py      | 2 +-
>   .../targets/ansible-test-integration-targets/test.py          | 2 +-
>   .../ansible_collections/ns/col/run-with-pty.py                | 2 +-
> @@ -63,27 +59,25 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
>   test/integration/targets/fork_safe_stdio/run-with-pty.py      | 2 +-
>   test/integration/targets/gathering/uuid.fact                  | 2 +-
>   test/integration/targets/gathering_facts/uuid.fact            | 2 +-
> - test/integration/targets/group/files/gidget.py                | 2 +-
> - test/integration/targets/module_utils/module_utils/foo.py     | 2 +-
>   test/integration/targets/module_utils/module_utils/sub/bam.py | 2 +-
>   .../targets/module_utils/module_utils/sub/bam/bam.py          | 2 +-
> - .../targets/module_utils/module_utils/sub/bar/bam.py          | 2 +-
> - .../targets/module_utils/module_utils/sub/bar/bar.py          | 2 +-
> + test/integration/targets/packaging_cli-doc/verify.py          | 2 +-
>   test/integration/targets/pause/test-pause.py                  | 2 +-
>   test/integration/targets/pip/files/setup.py                   | 2 +-
>   .../integration/targets/service/files/ansible_test_service.py | 2 +-
>   .../targets/service_facts/files/ansible_test_service.py       | 2 +-
>   .../targets/template/role_filter/filter_plugins/myplugin.py   | 2 +-
> + test/integration/targets/test_utils/scripts/timeout.py        | 2 +-
>   test/integration/targets/throttle/test_throttle.py            | 2 +-
>   .../targets/var_precedence/ansible-var-precedence-check.py    | 2 +-
>   test/lib/ansible_test/_internal/util_common.py                | 2 +-
>   .../_util/controller/sanity/code-smell/shebang.py             | 4 ++--
>   .../ansible_test/_util/target/cli/ansible_test_cli_stub.py    | 2 +-
>   test/units/executor/module_common/test_module_common.py       | 4 ++--
> - 71 files changed, 75 insertions(+), 75 deletions(-)
> + 63 files changed, 65 insertions(+), 65 deletions(-)
>  
>  diff --git a/.azure-pipelines/scripts/combine-coverage.py b/.azure-pipelines/scripts/combine-coverage.py
> -index 506ade6460c..15bee402341 100755
> +index 506ade6460..15bee40234 100755
>  --- a/.azure-pipelines/scripts/combine-coverage.py
>  +++ b/.azure-pipelines/scripts/combine-coverage.py
>  @@ -1,4 +1,4 @@
> @@ -93,7 +87,7 @@ index 506ade6460c..15bee402341 100755
>   Combine coverage data from multiple jobs, keeping the data only from the most recent attempt from each job.
>   Coverage artifacts must be named using the format: "Coverage $(System.JobAttempt) {StableUniqueNameForEachJob}"
>  diff --git a/.azure-pipelines/scripts/publish-codecov.py b/.azure-pipelines/scripts/publish-codecov.py
> -index f2bc4b84b38..01ad32f494c 100755
> +index f2bc4b84b3..01ad32f494 100755
>  --- a/.azure-pipelines/scripts/publish-codecov.py
>  +++ b/.azure-pipelines/scripts/publish-codecov.py
>  @@ -1,4 +1,4 @@
> @@ -103,7 +97,7 @@ index f2bc4b84b38..01ad32f494c 100755
>   Upload code coverage reports to codecov.io.
>   Multiple coverage files from multiple languages are accepted and aggregated after upload.
>  diff --git a/.azure-pipelines/scripts/time-command.py b/.azure-pipelines/scripts/time-command.py
> -index 5e8eb8d4c8f..5450c48900e 100755
> +index 5e8eb8d4c8..5450c48900 100755
>  --- a/.azure-pipelines/scripts/time-command.py
>  +++ b/.azure-pipelines/scripts/time-command.py
>  @@ -1,4 +1,4 @@
> @@ -112,76 +106,8 @@ index 5e8eb8d4c8f..5450c48900e 100755
>   """Prepends a relative timestamp to each input line from stdin and writes it to stdout."""
>   
>   from __future__ import (absolute_import, division, print_function)
> -diff --git a/docs/bin/find-plugin-refs.py b/docs/bin/find-plugin-refs.py
> -index d603409d688..c52d6d13e38 100755
> ---- a/docs/bin/find-plugin-refs.py
> -+++ b/docs/bin/find-plugin-refs.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - # To run this script, first make webdocs in the toplevel of the checkout.  This will generate all
> - # rst files from their sources.  Then run this script ./docs/bin/find-plugin-refs.py
> -diff --git a/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst b/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst
> -index cff2aa0914b..7c4bd651563 100644
> ---- a/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst
> -+++ b/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst
> -@@ -6,7 +6,7 @@ Most executable files should only use one of the following shebangs:
> - - ``#!/bin/sh``
> - - ``#!/bin/bash``
> - - ``#!/usr/bin/make``
> --- ``#!/usr/bin/env python``
> -+- ``#!/usr/bin/env python3``
> - - ``#!/usr/bin/env bash``
> - 
> - NOTE: For ``#!/bin/bash``, any of the options ``eux`` may also be used, such as ``#!/bin/bash -eux``.
> -diff --git a/docs/docsite/rst/inventory_guide/connection_details.rst b/docs/docsite/rst/inventory_guide/connection_details.rst
> -index 5e332160617..65bfd5903ad 100644
> ---- a/docs/docsite/rst/inventory_guide/connection_details.rst
> -+++ b/docs/docsite/rst/inventory_guide/connection_details.rst
> -@@ -84,13 +84,13 @@ You can run commands against the control node by using "localhost" or "127.0.0.1
> - 
> - .. code-block:: bash
> - 
> --    $ ansible localhost -m ping -e 'ansible_python_interpreter="/usr/bin/env python"'
> -+    $ ansible localhost -m ping -e 'ansible_python_interpreter="/usr/bin/env python3"'
> - 
> - You can specify localhost explicitly by adding this to your inventory file:
> - 
> - .. code-block:: bash
> - 
> --    localhost ansible_connection=local ansible_python_interpreter="/usr/bin/env python"
> -+    localhost ansible_connection=local ansible_python_interpreter="/usr/bin/env python3"
> - 
> - .. _host_key_checking_on:
> - 
> -diff --git a/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po b/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
> -index b6abc3e5874..53f5fdc8986 100644
> ---- a/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
> -+++ b/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
> -@@ -11820,8 +11820,8 @@ msgid "``#!/usr/bin/make``"
> - msgstr "``#!/usr/bin/make``"
> - 
> - #: ../../rst/dev_guide/testing/sanity/shebang.rst:9
> --msgid "``#!/usr/bin/env python``"
> --msgstr "``#!/usr/bin/env python``"
> -+msgid "``#!/usr/bin/env python3``"
> -+msgstr "``#!/usr/bin/env python3``"
> - 
> - #: ../../rst/dev_guide/testing/sanity/shebang.rst:10
> - msgid "``#!/usr/bin/env bash``"
> -diff --git a/examples/scripts/uptime.py b/examples/scripts/uptime.py
> -index d77a5fb5660..665594c254b 100755
> ---- a/examples/scripts/uptime.py
> -+++ b/examples/scripts/uptime.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - from __future__ import (absolute_import, division, print_function)
> - __metaclass__ = type
>  diff --git a/hacking/ansible-profile b/hacking/ansible-profile
> -index 6612402da62..d67526a1619 100755
> +index 9856e7ab5c..0988bb2037 100755
>  --- a/hacking/ansible-profile
>  +++ b/hacking/ansible-profile
>  @@ -1,4 +1,4 @@
> @@ -191,7 +117,7 @@ index 6612402da62..d67526a1619 100755
>   __metaclass__ = type
>   
>  diff --git a/hacking/azp/download.py b/hacking/azp/download.py
> -index 117e9da5b7a..89466cb17be 100755
> +index e0de99a27a..6ccd51b2aa 100755
>  --- a/hacking/azp/download.py
>  +++ b/hacking/azp/download.py
>  @@ -1,4 +1,4 @@
> @@ -201,7 +127,7 @@ index 117e9da5b7a..89466cb17be 100755
>   
>   # (c) 2016 Red Hat, Inc.
>  diff --git a/hacking/azp/get_recent_coverage_runs.py b/hacking/azp/get_recent_coverage_runs.py
> -index 25e2fa8120a..9b0d9b972ed 100755
> +index 1be867da1e..2fb1cc4582 100755
>  --- a/hacking/azp/get_recent_coverage_runs.py
>  +++ b/hacking/azp/get_recent_coverage_runs.py
>  @@ -1,4 +1,4 @@
> @@ -211,7 +137,7 @@ index 25e2fa8120a..9b0d9b972ed 100755
>   # (c) 2020 Red Hat, Inc.
>   #
>  diff --git a/hacking/azp/incidental.py b/hacking/azp/incidental.py
> -index 87d4d213c94..7660e2ed226 100755
> +index 87d4d213c9..7660e2ed22 100755
>  --- a/hacking/azp/incidental.py
>  +++ b/hacking/azp/incidental.py
>  @@ -1,4 +1,4 @@
> @@ -221,7 +147,7 @@ index 87d4d213c94..7660e2ed226 100755
>   
>   # (c) 2020 Red Hat, Inc.
>  diff --git a/hacking/azp/run.py b/hacking/azp/run.py
> -index 00a177944f8..591e6bcc4fe 100755
> +index 00a177944f..591e6bcc4f 100755
>  --- a/hacking/azp/run.py
>  +++ b/hacking/azp/run.py
>  @@ -1,4 +1,4 @@
> @@ -231,7 +157,7 @@ index 00a177944f8..591e6bcc4fe 100755
>   
>   # (c) 2016 Red Hat, Inc.
>  diff --git a/hacking/backport/backport_of_line_adder.py b/hacking/backport/backport_of_line_adder.py
> -index ef77ddcf400..bbec15de6a2 100755
> +index ef77ddcf40..bbec15de6a 100755
>  --- a/hacking/backport/backport_of_line_adder.py
>  +++ b/hacking/backport/backport_of_line_adder.py
>  @@ -1,4 +1,4 @@
> @@ -240,48 +166,18 @@ index ef77ddcf400..bbec15de6a2 100755
>   # (c) 2020, Red Hat, Inc. <relrod@redhat.com>
>   #
>   # This file is part of Ansible
> -diff --git a/hacking/build-ansible.py b/hacking/build-ansible.py
> -index c108c1861fa..8ebb88d33bd 100755
> ---- a/hacking/build-ansible.py
> -+++ b/hacking/build-ansible.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # coding: utf-8
> - # PYTHON_ARGCOMPLETE_OK
> - # Copyright: (c) 2019, Ansible Project
> -diff --git a/hacking/create_deprecation_bug_reports.py b/hacking/create_deprecation_bug_reports.py
> -index e14df4be389..e6b9b9025c3 100755
> ---- a/hacking/create_deprecation_bug_reports.py
> -+++ b/hacking/create_deprecation_bug_reports.py
> +diff --git a/hacking/create-bulk-issues.py b/hacking/create-bulk-issues.py
> +index d2651415df..2235daa5ec 100755
> +--- a/hacking/create-bulk-issues.py
> ++++ b/hacking/create-bulk-issues.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   # PYTHON_ARGCOMPLETE_OK
>   """Create GitHub issues for deprecated features."""
>   
> -diff --git a/hacking/fix_test_syntax.py b/hacking/fix_test_syntax.py
> -index 7178033406a..78d87ef71cb 100755
> ---- a/hacking/fix_test_syntax.py
> -+++ b/hacking/fix_test_syntax.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - # (c) 2017, Matt Martz <matt@sivel.net>
> - #
> -diff --git a/hacking/get_library.py b/hacking/get_library.py
> -index 23bf4a39bb5..9346784398f 100755
> ---- a/hacking/get_library.py
> -+++ b/hacking/get_library.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - # (c) 2014, Will Thames <will@thames.id.au>
> - #
>  diff --git a/hacking/report.py b/hacking/report.py
> -index 58b3a6b915a..78eed516dc0 100755
> +index 58b3a6b915..78eed516dc 100755
>  --- a/hacking/report.py
>  +++ b/hacking/report.py
>  @@ -1,4 +1,4 @@
> @@ -291,7 +187,7 @@ index 58b3a6b915a..78eed516dc0 100755
>   """A tool to aggregate data about Ansible source and testing into a sqlite DB for reporting."""
>   
>  diff --git a/hacking/return_skeleton_generator.py b/hacking/return_skeleton_generator.py
> -index 7002b7899d5..cff03c38e6b 100755
> +index 7002b7899d..cff03c38e6 100755
>  --- a/hacking/return_skeleton_generator.py
>  +++ b/hacking/return_skeleton_generator.py
>  @@ -1,4 +1,4 @@
> @@ -301,7 +197,7 @@ index 7002b7899d5..cff03c38e6b 100755
>   # (c) 2017, Will Thames <will@thames.id.au>
>   #
>  diff --git a/hacking/test-module.py b/hacking/test-module.py
> -index 54343e07e8b..38d4b8c60bb 100755
> +index 7a329b4b2d..a1118ba144 100755
>  --- a/hacking/test-module.py
>  +++ b/hacking/test-module.py
>  @@ -1,4 +1,4 @@
> @@ -311,7 +207,7 @@ index 54343e07e8b..38d4b8c60bb 100755
>   # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
>   #
>  diff --git a/hacking/tests/gen_distribution_version_testcase.py b/hacking/tests/gen_distribution_version_testcase.py
> -index 2fc5a2f9328..18e67d7d121 100755
> +index e75c78ad91..1613b02ed5 100755
>  --- a/hacking/tests/gen_distribution_version_testcase.py
>  +++ b/hacking/tests/gen_distribution_version_testcase.py
>  @@ -1,4 +1,4 @@
> @@ -321,7 +217,7 @@ index 2fc5a2f9328..18e67d7d121 100755
>   """
>   This script generated test_cases for test_distribution_version.py.
>  diff --git a/hacking/update-sanity-requirements.py b/hacking/update-sanity-requirements.py
> -index 747f058880a..2570ab2c7d3 100755
> +index 997d6dbf87..16a47f0f3c 100755
>  --- a/hacking/update-sanity-requirements.py
>  +++ b/hacking/update-sanity-requirements.py
>  @@ -1,4 +1,4 @@
> @@ -331,7 +227,7 @@ index 747f058880a..2570ab2c7d3 100755
>   """Generate frozen sanity test requirements from source requirements files."""
>   
>  diff --git a/lib/ansible/cli/adhoc.py b/lib/ansible/cli/adhoc.py
> -index e90b44ce101..120948c7495 100755
> +index a54dacb70c..dc14986420 100755
>  --- a/lib/ansible/cli/adhoc.py
>  +++ b/lib/ansible/cli/adhoc.py
>  @@ -1,4 +1,4 @@
> @@ -341,7 +237,7 @@ index e90b44ce101..120948c7495 100755
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/config.py b/lib/ansible/cli/config.py
> -index 3a5c24214b1..98d7a732517 100755
> +index f394ef7c1e..e37c9fd619 100755
>  --- a/lib/ansible/cli/config.py
>  +++ b/lib/ansible/cli/config.py
>  @@ -1,4 +1,4 @@
> @@ -351,7 +247,7 @@ index 3a5c24214b1..98d7a732517 100755
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   # PYTHON_ARGCOMPLETE_OK
>  diff --git a/lib/ansible/cli/console.py b/lib/ansible/cli/console.py
> -index 3125cc47a7f..4a2f38bb48e 100755
> +index 2325bf05d6..475f03eb00 100755
>  --- a/lib/ansible/cli/console.py
>  +++ b/lib/ansible/cli/console.py
>  @@ -1,4 +1,4 @@
> @@ -361,7 +257,7 @@ index 3125cc47a7f..4a2f38bb48e 100755
>   # Copyright: (c) 2016, Redhat Inc
>   # Copyright: (c) 2018, Ansible Project
>  diff --git a/lib/ansible/cli/doc.py b/lib/ansible/cli/doc.py
> -index 9f560bcbc6d..a0d34d92f6d 100755
> +index 4a5c892816..c99d25d9cb 100755
>  --- a/lib/ansible/cli/doc.py
>  +++ b/lib/ansible/cli/doc.py
>  @@ -1,4 +1,4 @@
> @@ -371,7 +267,7 @@ index 9f560bcbc6d..a0d34d92f6d 100755
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/galaxy.py b/lib/ansible/cli/galaxy.py
> -index c280380c18c..0357401c749 100755
> +index 334e4bf4f0..9918f338c1 100755
>  --- a/lib/ansible/cli/galaxy.py
>  +++ b/lib/ansible/cli/galaxy.py
>  @@ -1,4 +1,4 @@
> @@ -381,7 +277,7 @@ index c280380c18c..0357401c749 100755
>   # Copyright: (c) 2018-2021, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/inventory.py b/lib/ansible/cli/inventory.py
> -index e8ed75e4636..e4bb334932e 100755
> +index 3550079bf8..f1da0d0531 100755
>  --- a/lib/ansible/cli/inventory.py
>  +++ b/lib/ansible/cli/inventory.py
>  @@ -1,4 +1,4 @@
> @@ -391,7 +287,7 @@ index e8ed75e4636..e4bb334932e 100755
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/playbook.py b/lib/ansible/cli/playbook.py
> -index 9c091a675a9..27ff7d442e4 100755
> +index e63785b058..bc5fbc2f6f 100755
>  --- a/lib/ansible/cli/playbook.py
>  +++ b/lib/ansible/cli/playbook.py
>  @@ -1,4 +1,4 @@
> @@ -401,7 +297,7 @@ index 9c091a675a9..27ff7d442e4 100755
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/pull.py b/lib/ansible/cli/pull.py
> -index dc8f055b44d..0e5b030eecf 100755
> +index f369c390ec..f0ca673b36 100755
>  --- a/lib/ansible/cli/pull.py
>  +++ b/lib/ansible/cli/pull.py
>  @@ -1,4 +1,4 @@
> @@ -411,7 +307,7 @@ index dc8f055b44d..0e5b030eecf 100755
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>  diff --git a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
> -index 9109137e7f8..f01b1ec58dc 100755
> +index b1ed18c9c6..03c26d52cb 100755
>  --- a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
>  +++ b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
>  @@ -1,4 +1,4 @@
> @@ -421,7 +317,7 @@ index 9109137e7f8..f01b1ec58dc 100755
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   from __future__ import (absolute_import, division, print_function)
>  diff --git a/lib/ansible/cli/vault.py b/lib/ansible/cli/vault.py
> -index 3e60329de60..69499407479 100755
> +index cf2c9dd901..3545624a09 100755
>  --- a/lib/ansible/cli/vault.py
>  +++ b/lib/ansible/cli/vault.py
>  @@ -1,4 +1,4 @@
> @@ -430,8 +326,18 @@ index 3e60329de60..69499407479 100755
>   # (c) 2014, James Tanner <tanner.jc@gmail.com>
>   # Copyright: (c) 2018, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/packaging/cli-doc/build.py b/packaging/cli-doc/build.py
> +index 878ba8eabf..64a614f3f7 100755
> +--- a/packaging/cli-doc/build.py
> ++++ b/packaging/cli-doc/build.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """Build documentation for ansible-core CLI programs."""
> + 
>  diff --git a/packaging/release.py b/packaging/release.py
> -index 1d1ba37117a..a561dc6a905 100755
> +index 97c58a7424..fa5a27f794 100755
>  --- a/packaging/release.py
>  +++ b/packaging/release.py
>  @@ -1,4 +1,4 @@
> @@ -440,18 +346,18 @@ index 1d1ba37117a..a561dc6a905 100755
>   # PYTHON_ARGCOMPLETE_OK
>   """Manage upstream ansible-core releases."""
>   
> -diff --git a/packaging/sdist/check-link-behavior.py b/packaging/sdist/check-link-behavior.py
> -index 34e05023d48..42f6c4be98f 100755
> ---- a/packaging/sdist/check-link-behavior.py
> -+++ b/packaging/sdist/check-link-behavior.py
> +diff --git a/test/integration/targets/ansible-config/files/ini_dupes.py b/test/integration/targets/ansible-config/files/ini_dupes.py
> +index ed42e6acb8..e61252100e 100755
> +--- a/test/integration/targets/ansible-config/files/ini_dupes.py
> ++++ b/test/integration/targets/ansible-config/files/ini_dupes.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Checks for link behavior required for sdist to retain symlinks."""
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   
> - from __future__ import (absolute_import, division, print_function)
> + from __future__ import annotations
>  diff --git a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
> -index 6182e865db0..5829df52b5b 100644
> +index 6182e865db..5829df52b5 100644
>  --- a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
>  +++ b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
>  @@ -1,4 +1,4 @@
> @@ -460,8 +366,18 @@ index 6182e865db0..5829df52b5b 100644
>   
>   # Copyright: (c) 2020, Ansible Project
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
> +index 487666381f..86a3ea66d7 100755
> +--- a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
> ++++ b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + """Create a role archive which overwrites an arbitrary file."""
> + 
> + import argparse
>  diff --git a/test/integration/targets/ansible-test-container/runme.py b/test/integration/targets/ansible-test-container/runme.py
> -index 687128056f7..bd7f3671655 100755
> +index 3c86b6dd07..393a945ff9 100755
>  --- a/test/integration/targets/ansible-test-container/runme.py
>  +++ b/test/integration/targets/ansible-test-container/runme.py
>  @@ -1,4 +1,4 @@
> @@ -471,7 +387,7 @@ index 687128056f7..bd7f3671655 100755
>   
>   from __future__ import annotations
>  diff --git a/test/integration/targets/ansible-test-integration-targets/test.py b/test/integration/targets/ansible-test-integration-targets/test.py
> -index 8effb647fca..4e34c4bbc16 100755
> +index 8effb647fc..4e34c4bbc1 100755
>  --- a/test/integration/targets/ansible-test-integration-targets/test.py
>  +++ b/test/integration/targets/ansible-test-integration-targets/test.py
>  @@ -1,4 +1,4 @@
> @@ -481,7 +397,7 @@ index 8effb647fca..4e34c4bbc16 100755
>   import subprocess
>   import unittest
>  diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
> -index 463915284b2..fc2ed398d9f 100755
> +index 463915284b..fc2ed398d9 100755
>  --- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
>  +++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
>  @@ -1,4 +1,4 @@
> @@ -491,7 +407,7 @@ index 463915284b2..fc2ed398d9f 100755
>   
>   import sys
>  diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
> -index a2b094e2fca..355dba697a9 100755
> +index a2b094e2fc..355dba697a 100755
>  --- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
>  +++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
>  @@ -1,4 +1,4 @@
> @@ -501,21 +417,21 @@ index a2b094e2fca..355dba697a9 100755
>   
>   import sys
>  diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
> -index 4265cc3e6c1..e5a0d9b4834 100755
> +index 4265cc3e6c..e5a0d9b483 100755
>  --- a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
>  +++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
>  @@ -1 +1 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>  diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
> -index 4265cc3e6c1..e5a0d9b4834 100755
> +index 4265cc3e6c..e5a0d9b483 100755
>  --- a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
>  +++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
>  @@ -1 +1 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>  diff --git a/test/integration/targets/ansible-test/venv-pythons.py b/test/integration/targets/ansible-test/venv-pythons.py
> -index b380f147fca..e97f2fcb33d 100755
> +index 97998bcd7c..aace3d346d 100755
>  --- a/test/integration/targets/ansible-test/venv-pythons.py
>  +++ b/test/integration/targets/ansible-test/venv-pythons.py
>  @@ -1,4 +1,4 @@
> @@ -523,9 +439,9 @@ index b380f147fca..e97f2fcb33d 100755
>  +#!/usr/bin/env python3
>   """Return target Python options for use with ansible-test."""
>   
> - import os
> + import argparse
>  diff --git a/test/integration/targets/ansible-vault/faux-editor.py b/test/integration/targets/ansible-vault/faux-editor.py
> -index b67c7475631..a30c306a831 100755
> +index b67c747563..a30c306a83 100755
>  --- a/test/integration/targets/ansible-vault/faux-editor.py
>  +++ b/test/integration/targets/ansible-vault/faux-editor.py
>  @@ -1,4 +1,4 @@
> @@ -535,7 +451,7 @@ index b67c7475631..a30c306a831 100755
>   # Ansible is free software: you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
>  diff --git a/test/integration/targets/ansible-vault/password-script.py b/test/integration/targets/ansible-vault/password-script.py
> -index 1b7f02beb23..0dcada23c7e 100755
> +index 1b7f02beb2..0dcada23c7 100755
>  --- a/test/integration/targets/ansible-vault/password-script.py
>  +++ b/test/integration/targets/ansible-vault/password-script.py
>  @@ -1,4 +1,4 @@
> @@ -545,7 +461,7 @@ index 1b7f02beb23..0dcada23c7e 100755
>   # Ansible is free software: you can redistribute it and/or modify
>   # it under the terms of the GNU General Public License as published by
>  diff --git a/test/integration/targets/ansible-vault/test-vault-client.py b/test/integration/targets/ansible-vault/test-vault-client.py
> -index ee46188742d..48244fca09e 100755
> +index ee46188742..48244fca09 100755
>  --- a/test/integration/targets/ansible-vault/test-vault-client.py
>  +++ b/test/integration/targets/ansible-vault/test-vault-client.py
>  @@ -1,4 +1,4 @@
> @@ -555,7 +471,7 @@ index ee46188742d..48244fca09e 100755
>   
>   from __future__ import (absolute_import, division, print_function)
>  diff --git a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
> -index 93958fc2adb..33509c826a3 100644
> +index 93958fc2ad..33509c826a 100644
>  --- a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
>  +++ b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
>  @@ -1,4 +1,4 @@
> @@ -565,7 +481,7 @@ index 93958fc2adb..33509c826a3 100644
>   from __future__ import (absolute_import, division, print_function)
>   __metaclass__ = type
>  diff --git a/test/integration/targets/cli/test-cli.py b/test/integration/targets/cli/test-cli.py
> -index 9893d6652ed..7a07dcc108e 100644
> +index 9893d6652e..7a07dcc108 100644
>  --- a/test/integration/targets/cli/test-cli.py
>  +++ b/test/integration/targets/cli/test-cli.py
>  @@ -1,4 +1,4 @@
> @@ -575,7 +491,7 @@ index 9893d6652ed..7a07dcc108e 100644
>   # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   
>  diff --git a/test/integration/targets/cli/test_k_and_K.py b/test/integration/targets/cli/test_k_and_K.py
> -index f7077fba0ab..dcc96141295 100644
> +index f7077fba0a..dcc9614129 100644
>  --- a/test/integration/targets/cli/test_k_and_K.py
>  +++ b/test/integration/targets/cli/test_k_and_K.py
>  @@ -1,4 +1,4 @@
> @@ -585,7 +501,7 @@ index f7077fba0ab..dcc96141295 100644
>   
>   # Make coding more python3-ish
>  diff --git a/test/integration/targets/collection/update-ignore.py b/test/integration/targets/collection/update-ignore.py
> -index 92a702cf13e..9ea69089d58 100755
> +index 92a702cf13..9ea69089d5 100755
>  --- a/test/integration/targets/collection/update-ignore.py
>  +++ b/test/integration/targets/collection/update-ignore.py
>  @@ -1,4 +1,4 @@
> @@ -595,7 +511,7 @@ index 92a702cf13e..9ea69089d58 100755
>   
>   import os
>  diff --git a/test/integration/targets/debugger/test_run_once.py b/test/integration/targets/debugger/test_run_once.py
> -index 237f9c2d903..4fe74903d8d 100755
> +index 237f9c2d90..4fe74903d8 100755
>  --- a/test/integration/targets/debugger/test_run_once.py
>  +++ b/test/integration/targets/debugger/test_run_once.py
>  @@ -1,4 +1,4 @@
> @@ -605,7 +521,7 @@ index 237f9c2d903..4fe74903d8d 100755
>   import io
>   import os
>  diff --git a/test/integration/targets/fork_safe_stdio/run-with-pty.py b/test/integration/targets/fork_safe_stdio/run-with-pty.py
> -index 463915284b2..fc2ed398d9f 100755
> +index 463915284b..fc2ed398d9 100755
>  --- a/test/integration/targets/fork_safe_stdio/run-with-pty.py
>  +++ b/test/integration/targets/fork_safe_stdio/run-with-pty.py
>  @@ -1,4 +1,4 @@
> @@ -615,7 +531,7 @@ index 463915284b2..fc2ed398d9f 100755
>   
>   import sys
>  diff --git a/test/integration/targets/gathering/uuid.fact b/test/integration/targets/gathering/uuid.fact
> -index 79e3f62677e..2a294b33a82 100644
> +index 79e3f62677..2a294b33a8 100644
>  --- a/test/integration/targets/gathering/uuid.fact
>  +++ b/test/integration/targets/gathering/uuid.fact
>  @@ -1,4 +1,4 @@
> @@ -625,7 +541,7 @@ index 79e3f62677e..2a294b33a82 100644
>   
>   
>  diff --git a/test/integration/targets/gathering_facts/uuid.fact b/test/integration/targets/gathering_facts/uuid.fact
> -index 79e3f62677e..2a294b33a82 100644
> +index 79e3f62677..2a294b33a8 100644
>  --- a/test/integration/targets/gathering_facts/uuid.fact
>  +++ b/test/integration/targets/gathering_facts/uuid.fact
>  @@ -1,4 +1,4 @@
> @@ -634,27 +550,8 @@ index 79e3f62677e..2a294b33a82 100644
>   # -*- coding: utf-8 -*-
>   
>   
> -diff --git a/test/integration/targets/group/files/gidget.py b/test/integration/targets/group/files/gidget.py
> -index 4b771516fdd..085dfcdee11 100644
> ---- a/test/integration/targets/group/files/gidget.py
> -+++ b/test/integration/targets/group/files/gidget.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - from __future__ import (absolute_import, division, print_function)
> - __metaclass__ = type
> -diff --git a/test/integration/targets/module_utils/module_utils/foo.py b/test/integration/targets/module_utils/module_utils/foo.py
> -index 20698f1f463..0cd5c851429 100644
> ---- a/test/integration/targets/module_utils/module_utils/foo.py
> -+++ b/test/integration/targets/module_utils/module_utils/foo.py
> -@@ -1,3 +1,3 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - foo = "FOO FROM foo.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bam.py b/test/integration/targets/module_utils/module_utils/sub/bam.py
> -index 566f8b7c47f..0814485d5fe 100644
> +index 566f8b7c47..0814485d5f 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bam.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bam.py
>  @@ -1,3 +1,3 @@
> @@ -663,7 +560,7 @@ index 566f8b7c47f..0814485d5fe 100644
>   
>   bam = "BAM FROM sub/bam.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bam/bam.py b/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
> -index b7ed707211e..97f9eedcdb7 100644
> +index b7ed707211..97f9eedcdb 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
>  @@ -1,3 +1,3 @@
> @@ -671,26 +568,18 @@ index b7ed707211e..97f9eedcdb7 100644
>  +#!/usr/bin/env python3
>   
>   bam = "BAM FROM sub/bam/bam.py"
> -diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/bam.py b/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
> -index 02fafd40f3f..3a93360c69e 100644
> ---- a/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
> -+++ b/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
> -@@ -1,3 +1,3 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - bam = "BAM FROM sub/bar/bam.py"
> -diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/bar.py b/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
> -index 8566901f044..40f0c9446c9 100644
> ---- a/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
> -+++ b/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
> -@@ -1,3 +1,3 @@
> +diff --git a/test/integration/targets/packaging_cli-doc/verify.py b/test/integration/targets/packaging_cli-doc/verify.py
> +index 7793fa8c24..71f82186dd 100755
> +--- a/test/integration/targets/packaging_cli-doc/verify.py
> ++++ b/test/integration/targets/packaging_cli-doc/verify.py
> +@@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - bar = "BAR FROM sub/bar/bar.py"
> + import os
> + import pathlib
>  diff --git a/test/integration/targets/pause/test-pause.py b/test/integration/targets/pause/test-pause.py
> -index 3703470d065..dd14b2810d6 100755
> +index ab771fa09e..1dece083d3 100755
>  --- a/test/integration/targets/pause/test-pause.py
>  +++ b/test/integration/targets/pause/test-pause.py
>  @@ -1,4 +1,4 @@
> @@ -700,7 +589,7 @@ index 3703470d065..dd14b2810d6 100755
>   from __future__ import (absolute_import, division, print_function)
>   __metaclass__ = type
>  diff --git a/test/integration/targets/pip/files/setup.py b/test/integration/targets/pip/files/setup.py
> -index aaf21875ca2..2835719e4f2 100755
> +index aaf21875ca..2835719e4f 100755
>  --- a/test/integration/targets/pip/files/setup.py
>  +++ b/test/integration/targets/pip/files/setup.py
>  @@ -1,4 +1,4 @@
> @@ -710,7 +599,7 @@ index aaf21875ca2..2835719e4f2 100755
>   from __future__ import (absolute_import, division, print_function)
>   __metaclass__ = type
>  diff --git a/test/integration/targets/service/files/ansible_test_service.py b/test/integration/targets/service/files/ansible_test_service.py
> -index 522493fcc77..b3aaf7f6b43 100644
> +index 6292272e63..e5664fb2e3 100644
>  --- a/test/integration/targets/service/files/ansible_test_service.py
>  +++ b/test/integration/targets/service/files/ansible_test_service.py
>  @@ -1,4 +1,4 @@
> @@ -720,7 +609,7 @@ index 522493fcc77..b3aaf7f6b43 100644
>   # this is mostly based off of the code found here:
>   # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
>  diff --git a/test/integration/targets/service_facts/files/ansible_test_service.py b/test/integration/targets/service_facts/files/ansible_test_service.py
> -index 19f1e291388..609218325d6 100644
> +index 19f1e29138..609218325d 100644
>  --- a/test/integration/targets/service_facts/files/ansible_test_service.py
>  +++ b/test/integration/targets/service_facts/files/ansible_test_service.py
>  @@ -1,4 +1,4 @@
> @@ -730,7 +619,7 @@ index 19f1e291388..609218325d6 100644
>   # this is mostly based off of the code found here:
>   # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
>  diff --git a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
> -index b0a8889439a..90c83b582b4 100644
> +index b0a8889439..90c83b582b 100644
>  --- a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
>  +++ b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
>  @@ -1,4 +1,4 @@
> @@ -739,8 +628,18 @@ index b0a8889439a..90c83b582b4 100644
>   
>   from __future__ import (absolute_import, division, print_function)
>   __metaclass__ = type
> +diff --git a/test/integration/targets/test_utils/scripts/timeout.py b/test/integration/targets/test_utils/scripts/timeout.py
> +index f88f3e4e15..c312dc4f6c 100755
> +--- a/test/integration/targets/test_utils/scripts/timeout.py
> ++++ b/test/integration/targets/test_utils/scripts/timeout.py
> +@@ -1,4 +1,4 @@
> +-#!/usr/bin/env python
> ++#!/usr/bin/env python3
> + 
> + import argparse
> + import subprocess
>  diff --git a/test/integration/targets/throttle/test_throttle.py b/test/integration/targets/throttle/test_throttle.py
> -index 1a5bdd30789..344bcf0f868 100755
> +index 1a5bdd3078..344bcf0f86 100755
>  --- a/test/integration/targets/throttle/test_throttle.py
>  +++ b/test/integration/targets/throttle/test_throttle.py
>  @@ -1,4 +1,4 @@
> @@ -750,7 +649,7 @@ index 1a5bdd30789..344bcf0f868 100755
>   from __future__ import (absolute_import, division, print_function)
>   __metaclass__ = type
>  diff --git a/test/integration/targets/var_precedence/ansible-var-precedence-check.py b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
> -index fc31688be2e..f964bbe8d6d 100755
> +index b03c87b80f..2035463092 100755
>  --- a/test/integration/targets/var_precedence/ansible-var-precedence-check.py
>  +++ b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
>  @@ -1,4 +1,4 @@
> @@ -760,10 +659,10 @@ index fc31688be2e..f964bbe8d6d 100755
>   # A tool to check the order of precedence for ansible variables
>   # https://github.com/ansible/ansible/blob/devel/test/integration/test_var_precedence.yml
>  diff --git a/test/lib/ansible_test/_internal/util_common.py b/test/lib/ansible_test/_internal/util_common.py
> -index 79ff6c03ae3..730c87d3fc1 100644
> +index 77a6165c8e..865158e3b1 100644
>  --- a/test/lib/ansible_test/_internal/util_common.py
>  +++ b/test/lib/ansible_test/_internal/util_common.py
> -@@ -271,7 +271,7 @@ def get_injector_path() -> str:
> +@@ -303,7 +303,7 @@ def get_injector_path() -> str:
>       ])
>   
>       scripts = (
> @@ -773,7 +672,7 @@ index 79ff6c03ae3..730c87d3fc1 100644
>       )
>   
>  diff --git a/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py b/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
> -index b0b13197839..9535c3b4819 100644
> +index b0b1319783..9535c3b481 100644
>  --- a/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
>  +++ b/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
>  @@ -16,14 +16,14 @@ def main():
> @@ -794,7 +693,7 @@ index b0b13197839..9535c3b4819 100644
>   
>       module_shebangs = {
>  diff --git a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
> -index 930654fc1e7..bbf50369d7d 100755
> +index 930654fc1e..bbf50369d7 100755
>  --- a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
>  +++ b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
>  @@ -1,4 +1,4 @@
> @@ -804,10 +703,10 @@ index 930654fc1e7..bbf50369d7d 100755
>   """Command line entry point for ansible-test."""
>   
>  diff --git a/test/units/executor/module_common/test_module_common.py b/test/units/executor/module_common/test_module_common.py
> -index fa6add8cd61..fcfd096e546 100644
> +index 6e2a4956c4..6776de66e1 100644
>  --- a/test/units/executor/module_common/test_module_common.py
>  +++ b/test/units/executor/module_common/test_module_common.py
> -@@ -132,8 +132,8 @@ class TestGetShebang:
> +@@ -117,8 +117,8 @@ class TestGetShebang:
>               (u'#!/usr/bin/python3 -tt -OO', u'/usr/bin/python3')
>   
>       def test_python_via_env(self, templar):
> diff --git a/recipes-devtools/python/python3-ansible_2.14.5.bb b/recipes-devtools/python/python3-ansible_2.16.5.bb
> similarity index 100%
> rename from recipes-devtools/python/python3-ansible_2.14.5.bb
> rename to recipes-devtools/python/python3-ansible_2.16.5.bb
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8661): https://lists.yoctoproject.org/g/meta-virtualization/message/8661
> Mute This Topic: https://lists.yoctoproject.org/mt/105304968/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


