Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 583E8D65C6D
	for <webhook@archiver.kernel.org>; Thu, 14 Nov 2024 10:32:28 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.34014.1731580338658732862
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 14 Nov 2024 02:32:18 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=10488290c7=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AE7NUao026167
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Nov 2024 10:32:18 GMT
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 42uwtubn6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Nov 2024 10:32:17 +0000 (GMT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 14 Nov 2024 02:32:15 -0800
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.43 via Frontend Transport; Thu, 14 Nov 2024 02:32:14 -0800
From: ssambu <soumya.sambu@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][meta-cloud-services][master][scarthgap][PATCH 1/1]  python3-ansible: Upgrade 2.16.5 -> 2.17.6
Date: Thu, 14 Nov 2024 10:32:11 +0000
Message-ID: <20241114103211.3405459-1-soumya.sambu@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: LDPT0CLXp2kHuqYw26aQSU4BJweKkvyl
X-Authority-Analysis: v=2.4 cv=BPnhr0QG c=1 sm=1 tr=0 ts=6735d1b1 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=5h67h_9zRmsA:10 a=VlfZXiiP6vEA:10 a=t7CeM3EgAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=mDV3o1hIAAAA:8 a=s07OA_tJAAAA:8
 a=Ggs6E5UF_QNpaqgnpQAA:9 a=FdTzh2GWekK77mhwV6Dw:22 a=dbYmEjnPqrZp6Zvs_JvD:22
X-Proofpoint-ORIG-GUID: LDPT0CLXp2kHuqYw26aQSU4BJweKkvyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-11-14_03,2024-11-13_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 malwarescore=0 clxscore=1011 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2409260000 definitions=main-2411140082
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 14 Nov 2024 10:32:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8970

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes security fixes for - CVE-2024-9902, CVE-2024-8775, CVE-2023-5115.

Changelog:
==========
https://github.com/ansible/ansible/blob/v2.17.6/changelogs/CHANGELOG-v2.17.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
---
 recipes-devtools/python/python-ansible.inc    |   4 +-
 ...nsure-py-scripts-use-py3-for-shebang.patch | 174 +++++++++---------
 ...le_2.16.5.bb => python3-ansible_2.17.6.bb} |   0
 3 files changed, 90 insertions(+), 88 deletions(-)
 rename recipes-devtools/python/{python3-ansible_2.16.5.bb => python3-ansible_2.17.6.bb} (100%)

diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
index 7c9d0f51..a528f246 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -6,9 +6,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464"
 
 SRCNAME = "ansible"
 
-SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.16"
+SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.17"
 
-SRCREV = "ee04df4796af1a438bc80aff33cdd5ca4d5304aa"
+SRCREV = "05e01efa8534d19956133e19e9e84aad720abb0d"
 
 S = "${WORKDIR}/git"
 
diff --git a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
index 420324b7..a7565d5d 100644
--- a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
+++ b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
@@ -1,4 +1,4 @@
-From f14f3a89262e9348348f6aeced9c20067a613062 Mon Sep 17 00:00:00 2001
+From 9a90119da3fd670aa625cf947abc3ed66d7aaaf3 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Thu, 11 May 2023 17:05:54 +0800
 Subject: [PATCH] python3: ensure py scripts use py3 for shebang
@@ -10,11 +10,13 @@ Rebase to 2.14.5
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 Rebase to 2.16.5
 Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+Rebase to 2.17.6
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
 ---
  .azure-pipelines/scripts/combine-coverage.py                  | 2 +-
  .azure-pipelines/scripts/publish-codecov.py                   | 2 +-
  .azure-pipelines/scripts/time-command.py                      | 2 +-
- hacking/ansible-profile                                       | 2 +-
+ hacking/ansible-profile.py                                    | 2 +-
  hacking/azp/download.py                                       | 2 +-
  hacking/azp/get_recent_coverage_runs.py                       | 2 +-
  hacking/azp/incidental.py                                     | 2 +-
@@ -77,7 +79,7 @@ Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
  63 files changed, 65 insertions(+), 65 deletions(-)
 
 diff --git a/.azure-pipelines/scripts/combine-coverage.py b/.azure-pipelines/scripts/combine-coverage.py
-index 506ade6460..15bee40234 100755
+index 10d83580c5..9b5f7ee9b2 100755
 --- a/.azure-pipelines/scripts/combine-coverage.py
 +++ b/.azure-pipelines/scripts/combine-coverage.py
 @@ -1,4 +1,4 @@
@@ -87,7 +89,7 @@ index 506ade6460..15bee40234 100755
  Combine coverage data from multiple jobs, keeping the data only from the most recent attempt from each job.
  Coverage artifacts must be named using the format: "Coverage $(System.JobAttempt) {StableUniqueNameForEachJob}"
 diff --git a/.azure-pipelines/scripts/publish-codecov.py b/.azure-pipelines/scripts/publish-codecov.py
-index f2bc4b84b3..01ad32f494 100755
+index 41f30af76d..6df3106380 100755
 --- a/.azure-pipelines/scripts/publish-codecov.py
 +++ b/.azure-pipelines/scripts/publish-codecov.py
 @@ -1,4 +1,4 @@
@@ -97,7 +99,7 @@ index f2bc4b84b3..01ad32f494 100755
  Upload code coverage reports to codecov.io.
  Multiple coverage files from multiple languages are accepted and aggregated after upload.
 diff --git a/.azure-pipelines/scripts/time-command.py b/.azure-pipelines/scripts/time-command.py
-index 5e8eb8d4c8..5450c48900 100755
+index c6b505006e..f3f44bb2e8 100755
 --- a/.azure-pipelines/scripts/time-command.py
 +++ b/.azure-pipelines/scripts/time-command.py
 @@ -1,4 +1,4 @@
@@ -105,19 +107,19 @@ index 5e8eb8d4c8..5450c48900 100755
 +#!/usr/bin/env python3
  """Prepends a relative timestamp to each input line from stdin and writes it to stdout."""
  
- from __future__ import (absolute_import, division, print_function)
-diff --git a/hacking/ansible-profile b/hacking/ansible-profile
-index 9856e7ab5c..0988bb2037 100755
---- a/hacking/ansible-profile
-+++ b/hacking/ansible-profile
+ from __future__ import annotations
+diff --git a/hacking/ansible-profile.py b/hacking/ansible-profile.py
+index 7016ebe098..a33c053cf5 100755
+--- a/hacking/ansible-profile.py
++++ b/hacking/ansible-profile.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
  
+ import cProfile
 diff --git a/hacking/azp/download.py b/hacking/azp/download.py
-index e0de99a27a..6ccd51b2aa 100755
+index 47ebf39b11..355db8382c 100755
 --- a/hacking/azp/download.py
 +++ b/hacking/azp/download.py
 @@ -1,4 +1,4 @@
@@ -127,7 +129,7 @@ index e0de99a27a..6ccd51b2aa 100755
  
  # (c) 2016 Red Hat, Inc.
 diff --git a/hacking/azp/get_recent_coverage_runs.py b/hacking/azp/get_recent_coverage_runs.py
-index 1be867da1e..2fb1cc4582 100755
+index b479179e71..11205769e5 100755
 --- a/hacking/azp/get_recent_coverage_runs.py
 +++ b/hacking/azp/get_recent_coverage_runs.py
 @@ -1,4 +1,4 @@
@@ -137,7 +139,7 @@ index 1be867da1e..2fb1cc4582 100755
  # (c) 2020 Red Hat, Inc.
  #
 diff --git a/hacking/azp/incidental.py b/hacking/azp/incidental.py
-index 87d4d213c9..7660e2ed22 100755
+index 5fc83e3d1a..f9c3ff75ac 100755
 --- a/hacking/azp/incidental.py
 +++ b/hacking/azp/incidental.py
 @@ -1,4 +1,4 @@
@@ -147,7 +149,7 @@ index 87d4d213c9..7660e2ed22 100755
  
  # (c) 2020 Red Hat, Inc.
 diff --git a/hacking/azp/run.py b/hacking/azp/run.py
-index 00a177944f..591e6bcc4f 100755
+index c5e248beb3..eac459a969 100755
 --- a/hacking/azp/run.py
 +++ b/hacking/azp/run.py
 @@ -1,4 +1,4 @@
@@ -157,7 +159,7 @@ index 00a177944f..591e6bcc4f 100755
  
  # (c) 2016 Red Hat, Inc.
 diff --git a/hacking/backport/backport_of_line_adder.py b/hacking/backport/backport_of_line_adder.py
-index ef77ddcf40..bbec15de6a 100755
+index 9856b9f0e0..65474b4aca 100755
 --- a/hacking/backport/backport_of_line_adder.py
 +++ b/hacking/backport/backport_of_line_adder.py
 @@ -1,4 +1,4 @@
@@ -177,7 +179,7 @@ index d2651415df..2235daa5ec 100755
  """Create GitHub issues for deprecated features."""
  
 diff --git a/hacking/report.py b/hacking/report.py
-index 58b3a6b915..78eed516dc 100755
+index f968c41aa1..aaef565d6e 100755
 --- a/hacking/report.py
 +++ b/hacking/report.py
 @@ -1,4 +1,4 @@
@@ -187,7 +189,7 @@ index 58b3a6b915..78eed516dc 100755
  """A tool to aggregate data about Ansible source and testing into a sqlite DB for reporting."""
  
 diff --git a/hacking/return_skeleton_generator.py b/hacking/return_skeleton_generator.py
-index 7002b7899d..cff03c38e6 100755
+index 875b5f0650..4109b55aac 100755
 --- a/hacking/return_skeleton_generator.py
 +++ b/hacking/return_skeleton_generator.py
 @@ -1,4 +1,4 @@
@@ -197,7 +199,7 @@ index 7002b7899d..cff03c38e6 100755
  # (c) 2017, Will Thames <will@thames.id.au>
  #
 diff --git a/hacking/test-module.py b/hacking/test-module.py
-index 7a329b4b2d..a1118ba144 100755
+index 7b39798de5..08de9c678f 100755
 --- a/hacking/test-module.py
 +++ b/hacking/test-module.py
 @@ -1,4 +1,4 @@
@@ -207,7 +209,7 @@ index 7a329b4b2d..a1118ba144 100755
  # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
  #
 diff --git a/hacking/tests/gen_distribution_version_testcase.py b/hacking/tests/gen_distribution_version_testcase.py
-index e75c78ad91..1613b02ed5 100755
+index 57903180c1..7f644a7abb 100755
 --- a/hacking/tests/gen_distribution_version_testcase.py
 +++ b/hacking/tests/gen_distribution_version_testcase.py
 @@ -1,4 +1,4 @@
@@ -227,7 +229,7 @@ index 997d6dbf87..16a47f0f3c 100755
  """Generate frozen sanity test requirements from source requirements files."""
  
 diff --git a/lib/ansible/cli/adhoc.py b/lib/ansible/cli/adhoc.py
-index a54dacb70c..dc14986420 100755
+index efe99b9910..91c73c5a9d 100755
 --- a/lib/ansible/cli/adhoc.py
 +++ b/lib/ansible/cli/adhoc.py
 @@ -1,4 +1,4 @@
@@ -237,7 +239,7 @@ index a54dacb70c..dc14986420 100755
  # Copyright: (c) 2018, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/config.py b/lib/ansible/cli/config.py
-index f394ef7c1e..e37c9fd619 100755
+index e7f240c80d..6702b5a01b 100755
 --- a/lib/ansible/cli/config.py
 +++ b/lib/ansible/cli/config.py
 @@ -1,4 +1,4 @@
@@ -247,7 +249,7 @@ index f394ef7c1e..e37c9fd619 100755
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
  # PYTHON_ARGCOMPLETE_OK
 diff --git a/lib/ansible/cli/console.py b/lib/ansible/cli/console.py
-index 2325bf05d6..475f03eb00 100755
+index 5805b97fce..7a246ba8b4 100755
 --- a/lib/ansible/cli/console.py
 +++ b/lib/ansible/cli/console.py
 @@ -1,4 +1,4 @@
@@ -257,7 +259,7 @@ index 2325bf05d6..475f03eb00 100755
  # Copyright: (c) 2016, Redhat Inc
  # Copyright: (c) 2018, Ansible Project
 diff --git a/lib/ansible/cli/doc.py b/lib/ansible/cli/doc.py
-index 4a5c892816..c99d25d9cb 100755
+index 4f7e733154..f5fe9efda3 100755
 --- a/lib/ansible/cli/doc.py
 +++ b/lib/ansible/cli/doc.py
 @@ -1,4 +1,4 @@
@@ -267,7 +269,7 @@ index 4a5c892816..c99d25d9cb 100755
  # Copyright: (c) 2018, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/galaxy.py b/lib/ansible/cli/galaxy.py
-index 334e4bf4f0..9918f338c1 100755
+index 5c506b0c4e..47afea6e84 100755
 --- a/lib/ansible/cli/galaxy.py
 +++ b/lib/ansible/cli/galaxy.py
 @@ -1,4 +1,4 @@
@@ -277,7 +279,7 @@ index 334e4bf4f0..9918f338c1 100755
  # Copyright: (c) 2018-2021, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/inventory.py b/lib/ansible/cli/inventory.py
-index 3550079bf8..f1da0d0531 100755
+index 8c7c7e51d7..55b237ef1c 100755
 --- a/lib/ansible/cli/inventory.py
 +++ b/lib/ansible/cli/inventory.py
 @@ -1,4 +1,4 @@
@@ -287,7 +289,7 @@ index 3550079bf8..f1da0d0531 100755
  # Copyright: (c) 2018, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/playbook.py b/lib/ansible/cli/playbook.py
-index e63785b058..bc5fbc2f6f 100755
+index 1a3542de1c..64565ccb59 100755
 --- a/lib/ansible/cli/playbook.py
 +++ b/lib/ansible/cli/playbook.py
 @@ -1,4 +1,4 @@
@@ -297,7 +299,7 @@ index e63785b058..bc5fbc2f6f 100755
  # Copyright: (c) 2018, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/pull.py b/lib/ansible/cli/pull.py
-index f369c390ec..f0ca673b36 100755
+index fb3321efa9..e781a79806 100755
 --- a/lib/ansible/cli/pull.py
 +++ b/lib/ansible/cli/pull.py
 @@ -1,4 +1,4 @@
@@ -307,7 +309,7 @@ index f369c390ec..f0ca673b36 100755
  # Copyright: (c) 2018, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
-index b1ed18c9c6..03c26d52cb 100755
+index 9455b9851a..146602337a 100755
 --- a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
 +++ b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
 @@ -1,4 +1,4 @@
@@ -315,9 +317,9 @@ index b1ed18c9c6..03c26d52cb 100755
 +#!/usr/bin/env python3
  # Copyright: (c) 2017, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
- from __future__ import (absolute_import, division, print_function)
+ from __future__ import annotations
 diff --git a/lib/ansible/cli/vault.py b/lib/ansible/cli/vault.py
-index cf2c9dd901..3545624a09 100755
+index 86902a695f..7f6ee739c5 100755
 --- a/lib/ansible/cli/vault.py
 +++ b/lib/ansible/cli/vault.py
 @@ -1,4 +1,4 @@
@@ -337,7 +339,7 @@ index 878ba8eabf..64a614f3f7 100755
  """Build documentation for ansible-core CLI programs."""
  
 diff --git a/packaging/release.py b/packaging/release.py
-index 97c58a7424..fa5a27f794 100755
+index d8b5e19b26..2575f3f98d 100755
 --- a/packaging/release.py
 +++ b/packaging/release.py
 @@ -1,4 +1,4 @@
@@ -357,7 +359,7 @@ index ed42e6acb8..e61252100e 100755
  
  from __future__ import annotations
 diff --git a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
-index 6182e865db..5829df52b5 100644
+index 25fb5dd532..dc718cc3f4 100644
 --- a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
 +++ b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
 @@ -1,4 +1,4 @@
@@ -367,17 +369,17 @@ index 6182e865db..5829df52b5 100644
  # Copyright: (c) 2020, Ansible Project
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
 diff --git a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
-index 487666381f..86a3ea66d7 100755
+index 3e8424b006..2bfd907937 100755
 --- a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
 +++ b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Create a role archive which overwrites an arbitrary file."""
+ from __future__ import annotations
  
- import argparse
 diff --git a/test/integration/targets/ansible-test-container/runme.py b/test/integration/targets/ansible-test-container/runme.py
-index 3c86b6dd07..393a945ff9 100755
+index be518528f1..ccf49f4c6a 100755
 --- a/test/integration/targets/ansible-test-container/runme.py
 +++ b/test/integration/targets/ansible-test-container/runme.py
 @@ -1,4 +1,4 @@
@@ -387,35 +389,35 @@ index 3c86b6dd07..393a945ff9 100755
  
  from __future__ import annotations
 diff --git a/test/integration/targets/ansible-test-integration-targets/test.py b/test/integration/targets/ansible-test-integration-targets/test.py
-index 8effb647fc..4e34c4bbc1 100755
+index 10fa2d44f5..a9060c221f 100755
 --- a/test/integration/targets/ansible-test-integration-targets/test.py
 +++ b/test/integration/targets/ansible-test-integration-targets/test.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ from __future__ import annotations
  
  import subprocess
- import unittest
 diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
-index 463915284b..fc2ed398d9 100755
+index b4ccb7b651..abffbe8c93 100755
 --- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
 +++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Run a command using a PTY."""
+ from __future__ import annotations
  
- import sys
 diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
-index a2b094e2fc..355dba697a 100755
+index d7f3eb76e0..553bbaa9a4 100755
 --- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
 +++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Assert no TTY is available."""
+ from __future__ import annotations
  
- import sys
 diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
 index 4265cc3e6c..e5a0d9b483 100755
 --- a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
@@ -431,17 +433,17 @@ index 4265cc3e6c..e5a0d9b483 100755
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 diff --git a/test/integration/targets/ansible-test/venv-pythons.py b/test/integration/targets/ansible-test/venv-pythons.py
-index 97998bcd7c..aace3d346d 100755
+index a22ff2803b..5c179af76c 100755
 --- a/test/integration/targets/ansible-test/venv-pythons.py
 +++ b/test/integration/targets/ansible-test/venv-pythons.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Return target Python options for use with ansible-test."""
+ from __future__ import annotations
  
- import argparse
 diff --git a/test/integration/targets/ansible-vault/faux-editor.py b/test/integration/targets/ansible-vault/faux-editor.py
-index b67c747563..a30c306a83 100755
+index fdf01ebc02..2ea7c90320 100755
 --- a/test/integration/targets/ansible-vault/faux-editor.py
 +++ b/test/integration/targets/ansible-vault/faux-editor.py
 @@ -1,4 +1,4 @@
@@ -451,7 +453,7 @@ index b67c747563..a30c306a83 100755
  # Ansible is free software: you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
 diff --git a/test/integration/targets/ansible-vault/password-script.py b/test/integration/targets/ansible-vault/password-script.py
-index 1b7f02beb2..0dcada23c7 100755
+index a65b01dc03..22b68ed08c 100755
 --- a/test/integration/targets/ansible-vault/password-script.py
 +++ b/test/integration/targets/ansible-vault/password-script.py
 @@ -1,4 +1,4 @@
@@ -461,27 +463,27 @@ index 1b7f02beb2..0dcada23c7 100755
  # Ansible is free software: you can redistribute it and/or modify
  # it under the terms of the GNU General Public License as published by
 diff --git a/test/integration/targets/ansible-vault/test-vault-client.py b/test/integration/targets/ansible-vault/test-vault-client.py
-index ee46188742..48244fca09 100755
+index c16e309a6e..17cae8cbca 100755
 --- a/test/integration/targets/ansible-vault/test-vault-client.py
 +++ b/test/integration/targets/ansible-vault/test-vault-client.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
-+#!/usr/bin/env python3
++i#!/usr/bin/env python3
  # -*- coding: utf-8 -*-
  
- from __future__ import (absolute_import, division, print_function)
+ from __future__ import annotations
 diff --git a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
-index 93958fc2ad..33509c826a 100644
+index 435a7eb979..381b44272d 100644
 --- a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
 +++ b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
+
 diff --git a/test/integration/targets/cli/test-cli.py b/test/integration/targets/cli/test-cli.py
-index 9893d6652e..7a07dcc108 100644
+index 8d961ff36b..fce6c1d19a 100644
 --- a/test/integration/targets/cli/test-cli.py
 +++ b/test/integration/targets/cli/test-cli.py
 @@ -1,4 +1,4 @@
@@ -491,7 +493,7 @@ index 9893d6652e..7a07dcc108 100644
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
  
 diff --git a/test/integration/targets/cli/test_k_and_K.py b/test/integration/targets/cli/test_k_and_K.py
-index f7077fba0a..dcc9614129 100644
+index fe9575c0b2..22215db1a3 100644
 --- a/test/integration/targets/cli/test_k_and_K.py
 +++ b/test/integration/targets/cli/test_k_and_K.py
 @@ -1,4 +1,4 @@
@@ -499,37 +501,37 @@ index f7077fba0a..dcc9614129 100644
 +#!/usr/bin/env python3
  # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
  
- # Make coding more python3-ish
+ from __future__ import annotations
 diff --git a/test/integration/targets/collection/update-ignore.py b/test/integration/targets/collection/update-ignore.py
-index 92a702cf13..9ea69089d5 100755
+index fb363f1274..6c6e181ae4 100755
 --- a/test/integration/targets/collection/update-ignore.py
 +++ b/test/integration/targets/collection/update-ignore.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Rewrite a sanity ignore file to expand Python versions for import ignores and write the file out with the correct Ansible version in the name."""
+ from __future__ import annotations
  
- import os
 diff --git a/test/integration/targets/debugger/test_run_once.py b/test/integration/targets/debugger/test_run_once.py
-index 237f9c2d90..4fe74903d8 100755
+index 0b65c42492..6989790dd5 100755
 --- a/test/integration/targets/debugger/test_run_once.py
 +++ b/test/integration/targets/debugger/test_run_once.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ from __future__ import annotations
  
  import io
- import os
 diff --git a/test/integration/targets/fork_safe_stdio/run-with-pty.py b/test/integration/targets/fork_safe_stdio/run-with-pty.py
-index 463915284b..fc2ed398d9 100755
+index b4ccb7b651..abffbe8c93 100755
 --- a/test/integration/targets/fork_safe_stdio/run-with-pty.py
 +++ b/test/integration/targets/fork_safe_stdio/run-with-pty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  """Run a command using a PTY."""
+ from __future__ import annotations
  
- import sys
 diff --git a/test/integration/targets/gathering/uuid.fact b/test/integration/targets/gathering/uuid.fact
 index 79e3f62677..2a294b33a8 100644
 --- a/test/integration/targets/gathering/uuid.fact
@@ -569,37 +571,37 @@ index b7ed707211..97f9eedcdb 100644
  
  bam = "BAM FROM sub/bam/bam.py"
 diff --git a/test/integration/targets/packaging_cli-doc/verify.py b/test/integration/targets/packaging_cli-doc/verify.py
-index 7793fa8c24..71f82186dd 100755
+index 7fe9d1d371..fabd53ca57 100755
 --- a/test/integration/targets/packaging_cli-doc/verify.py
 +++ b/test/integration/targets/packaging_cli-doc/verify.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ from __future__ import annotations
  
  import os
- import pathlib
 diff --git a/test/integration/targets/pause/test-pause.py b/test/integration/targets/pause/test-pause.py
-index ab771fa09e..1dece083d3 100755
+index 1aebfbbb42..fa13209d34 100755
 --- a/test/integration/targets/pause/test-pause.py
 +++ b/test/integration/targets/pause/test-pause.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
+
 diff --git a/test/integration/targets/pip/files/setup.py b/test/integration/targets/pip/files/setup.py
-index aaf21875ca..2835719e4f 100755
+index 7d7240fe4e..e49aa26558 100755
 --- a/test/integration/targets/pip/files/setup.py
 +++ b/test/integration/targets/pip/files/setup.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
+
 diff --git a/test/integration/targets/service/files/ansible_test_service.py b/test/integration/targets/service/files/ansible_test_service.py
-index 6292272e63..e5664fb2e3 100644
+index 6bf404cad4..691e6f4cb2 100644
 --- a/test/integration/targets/service/files/ansible_test_service.py
 +++ b/test/integration/targets/service/files/ansible_test_service.py
 @@ -1,4 +1,4 @@
@@ -609,7 +611,7 @@ index 6292272e63..e5664fb2e3 100644
  # this is mostly based off of the code found here:
  # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
 diff --git a/test/integration/targets/service_facts/files/ansible_test_service.py b/test/integration/targets/service_facts/files/ansible_test_service.py
-index 19f1e29138..609218325d 100644
+index 6bf404cad4..691e6f4cb2 100644
 --- a/test/integration/targets/service_facts/files/ansible_test_service.py
 +++ b/test/integration/targets/service_facts/files/ansible_test_service.py
 @@ -1,4 +1,4 @@
@@ -619,37 +621,37 @@ index 19f1e29138..609218325d 100644
  # this is mostly based off of the code found here:
  # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
 diff --git a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
-index b0a8889439..90c83b582b 100644
+index 6043fdfe0f..54f06923d0 100644
 --- a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
 +++ b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
+
 diff --git a/test/integration/targets/test_utils/scripts/timeout.py b/test/integration/targets/test_utils/scripts/timeout.py
-index f88f3e4e15..c312dc4f6c 100755
+index 996071203e..7c8aaa496b 100755
 --- a/test/integration/targets/test_utils/scripts/timeout.py
 +++ b/test/integration/targets/test_utils/scripts/timeout.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ from __future__ import annotations
  
  import argparse
- import subprocess
 diff --git a/test/integration/targets/throttle/test_throttle.py b/test/integration/targets/throttle/test_throttle.py
-index 1a5bdd3078..344bcf0f86 100755
+index 95bb217f70..c162721e15 100755
 --- a/test/integration/targets/throttle/test_throttle.py
 +++ b/test/integration/targets/throttle/test_throttle.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  
- from __future__ import (absolute_import, division, print_function)
- __metaclass__ = type
+ from __future__ import annotations
+
 diff --git a/test/integration/targets/var_precedence/ansible-var-precedence-check.py b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
-index b03c87b80f..2035463092 100755
+index 6511169014..fd285de84b 100755
 --- a/test/integration/targets/var_precedence/ansible-var-precedence-check.py
 +++ b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
 @@ -1,4 +1,4 @@
@@ -659,7 +661,7 @@ index b03c87b80f..2035463092 100755
  # A tool to check the order of precedence for ansible variables
  # https://github.com/ansible/ansible/blob/devel/test/integration/test_var_precedence.yml
 diff --git a/test/lib/ansible_test/_internal/util_common.py b/test/lib/ansible_test/_internal/util_common.py
-index 77a6165c8e..865158e3b1 100644
+index a6904971b8..179b8324eb 100644
 --- a/test/lib/ansible_test/_internal/util_common.py
 +++ b/test/lib/ansible_test/_internal/util_common.py
 @@ -303,7 +303,7 @@ def get_injector_path() -> str:
@@ -693,7 +695,7 @@ index b0b1319783..9535c3b481 100644
  
      module_shebangs = {
 diff --git a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
-index 930654fc1e..bbf50369d7 100755
+index 9cb5d04ae0..f450a09466 100755
 --- a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
 +++ b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
 @@ -1,4 +1,4 @@
@@ -703,10 +705,10 @@ index 930654fc1e..bbf50369d7 100755
  """Command line entry point for ansible-test."""
  
 diff --git a/test/units/executor/module_common/test_module_common.py b/test/units/executor/module_common/test_module_common.py
-index 6e2a4956c4..6776de66e1 100644
+index c7edce6b2d..44dd0757a2 100644
 --- a/test/units/executor/module_common/test_module_common.py
 +++ b/test/units/executor/module_common/test_module_common.py
-@@ -117,8 +117,8 @@ class TestGetShebang:
+@@ -115,8 +115,8 @@ class TestGetShebang:
              (u'#!/usr/bin/python3 -tt -OO', u'/usr/bin/python3')
  
      def test_python_via_env(self, templar):
@@ -718,5 +720,5 @@ index 6e2a4956c4..6776de66e1 100644
  
  class TestDetectionRegexes:
 -- 
-2.25.1
+2.40.0
 
diff --git a/recipes-devtools/python/python3-ansible_2.16.5.bb b/recipes-devtools/python/python3-ansible_2.17.6.bb
similarity index 100%
rename from recipes-devtools/python/python3-ansible_2.16.5.bb
rename to recipes-devtools/python/python3-ansible_2.17.6.bb
-- 
2.40.0


