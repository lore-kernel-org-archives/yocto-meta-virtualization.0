Return-Path: <mingli.yu@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CABEC77B7D
	for <webhook@archiver.kernel.org>; Mon, 15 May 2023 06:02:50 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.81901.1684130570053429026
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 14 May 2023 23:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=4499c1e877=mingli.yu@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34F5gFEV022569
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 14 May 2023 23:02:49 -0700
Received: from ala-exchng02.corp.ad.wrs.com (unknown-82-254.windriver.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3qja2j95vx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Sun, 14 May 2023 23:02:49 -0700
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 14 May 2023 23:02:48 -0700
Received: from pek-lpg-core2.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2507.23 via Frontend Transport; Sun, 14 May 2023 23:02:47 -0700
From: <mingli.yu@eng.windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-cloud-services][PATCH] python3-ansible: Upgrade to 2.14.5
Date: Mon, 15 May 2023 14:02:47 +0800
Message-ID: <20230515060247.1502362-1-mingli.yu@eng.windriver.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Proofpoint-GUID: cpmhz21ONRxFCq5X5I0y6zlAPTQiFyZL
X-Proofpoint-ORIG-GUID: cpmhz21ONRxFCq5X5I0y6zlAPTQiFyZL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-15_03,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305150053
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mx0a-0064b401.pphosted.com id 34F5gFEV022569
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 15 May 2023 06:02:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8050

From: Mingli Yu <mingli.yu@windriver.com>

Rebase the patch python3-ensure-py-scripts-use-py3-for-shebang.patch
to new version.

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 recipes-devtools/python/python-ansible.inc    |    8 +-
 ...nsure-py-scripts-use-py3-for-shebang.patch | 1483 ++++++-----------
 ...e_2.3.1.0.bb =3D> python3-ansible_2.14.5.bb} |    0
 3 files changed, 540 insertions(+), 951 deletions(-)
 rename recipes-devtools/python/{python3-ansible_2.3.1.0.bb =3D> python3-=
ansible_2.14.5.bb} (100%)

diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtool=
s/python/python-ansible.inc
index 0bb663ae..fa55ba3f 100644
--- a/recipes-devtools/python/python-ansible.inc
+++ b/recipes-devtools/python/python-ansible.inc
@@ -6,13 +6,11 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D8f0e2cd40e05=
189ec81232da84bd6e1a"
=20
 SRCNAME =3D "ansible"
=20
-SRC_URI =3D "http://releases.ansible.com/ansible/${SRCNAME}-${PV}.tar.gz=
"
+SRC_URI =3D "git://github.com/ansible/ansible.git;protocol=3Dhttps;branc=
h=3Dstable-2.14"
=20
-SRC_URI[md5sum] =3D "b1be8f05864a07c06b8a767dcd48ba1b"
-SRC_URI[sha256sum] =3D "cd4b8f53720fcd0c351156b840fdd15ecfbec22c951b5406=
ec503de49d40b9f5"
+SRCREV =3D "5c6dfff68759ccc9794b609db45872950077e98b"
=20
-
-S =3D "${WORKDIR}/${SRCNAME}-${PV}"
+S =3D "${WORKDIR}/git"
=20
 ANSIBLE_WHITELIST_MODULES ?=3D "commands files system network/ovs __pyca=
che__ service"
=20
diff --git a/recipes-devtools/python/python3-ansible/python3-ensure-py-sc=
ripts-use-py3-for-shebang.patch b/recipes-devtools/python/python3-ansible=
/python3-ensure-py-scripts-use-py3-for-shebang.patch
index e98eb46c..67a4f954 100644
--- a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-u=
se-py3-for-shebang.patch
+++ b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-u=
se-py3-for-shebang.patch
@@ -1,799 +1,651 @@
-From 66b824da2fadfd5760040be244f89fa8320df55b Mon Sep 17 00:00:00 2001
+From b5d7b08addeb7795720acf3debd88a13ddd30402 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
-Date: Thu, 13 Jul 2017 14:11:46 -0400
+Date: Thu, 11 May 2023 17:05:54 +0800
 Subject: [PATCH] python3: ensure py scripts use py3 for shebang
=20
+Upstream-Status: Pending
+
 Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
+Rebase to 2.24.5
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
 ---
- bin/ansible                                                           |=
 2 +-
- bin/ansible-connection                                                |=
 2 +-
- bin/ansible-console                                                   |=
 2 +-
- bin/ansible-doc                                                       |=
 2 +-
- bin/ansible-galaxy                                                    |=
 2 +-
- bin/ansible-playbook                                                  |=
 2 +-
- bin/ansible-pull                                                      |=
 2 +-
- bin/ansible-vault                                                     |=
 2 +-
- contrib/inventory/abiquo.py                                           |=
 2 +-
- contrib/inventory/apache-libcloud.py                                  |=
 2 +-
- contrib/inventory/apstra_aos.py                                       |=
 2 +-
- contrib/inventory/azure_rm.py                                         |=
 2 +-
- contrib/inventory/brook.py                                            |=
 2 +-
- contrib/inventory/cloudforms.py                                       |=
 2 +-
- contrib/inventory/cloudstack.py                                       |=
 2 +-
- contrib/inventory/cobbler.py                                          |=
 2 +-
- contrib/inventory/collins.py                                          |=
 2 +-
- contrib/inventory/consul_io.py                                        |=
 2 +-
- contrib/inventory/digital_ocean.py                                    |=
 2 +-
- contrib/inventory/docker.py                                           |=
 2 +-
- contrib/inventory/ec2.py                                              |=
 2 +-
- contrib/inventory/fleet.py                                            |=
 2 +-
- contrib/inventory/foreman.py                                          |=
 2 +-
- contrib/inventory/freeipa.py                                          |=
 2 +-
- contrib/inventory/gce.py                                              |=
 2 +-
- contrib/inventory/jail.py                                             |=
 2 +-
- contrib/inventory/landscape.py                                        |=
 2 +-
- contrib/inventory/libvirt_lxc.py                                      |=
 2 +-
- contrib/inventory/linode.py                                           |=
 2 +-
- contrib/inventory/lxc_inventory.py                                    |=
 2 +-
- contrib/inventory/mdt_dynamic_inventory.py                            |=
 2 +-
- contrib/inventory/nagios_livestatus.py                                |=
 2 +-
- contrib/inventory/nagios_ndo.py                                       |=
 2 +-
- contrib/inventory/nova.py                                             |=
 2 +-
- contrib/inventory/nsot.py                                             |=
 2 +-
- contrib/inventory/openshift.py                                        |=
 2 +-
- contrib/inventory/openstack.py                                        |=
 2 +-
- contrib/inventory/openvz.py                                           |=
 2 +-
- contrib/inventory/ovirt.py                                            |=
 2 +-
- contrib/inventory/ovirt4.py                                           |=
 2 +-
- contrib/inventory/packet_net.py                                       |=
 2 +-
- contrib/inventory/proxmox.py                                          |=
 2 +-
- contrib/inventory/rackhd.py                                           |=
 2 +-
- contrib/inventory/rax.py                                              |=
 2 +-
- contrib/inventory/rhv.py                                              |=
 2 +-
- contrib/inventory/rudder.py                                           |=
 2 +-
- contrib/inventory/serf.py                                             |=
 2 +-
- contrib/inventory/softlayer.py                                        |=
 2 +-
- contrib/inventory/spacewalk.py                                        |=
 2 +-
- contrib/inventory/ssh_config.py                                       |=
 2 +-
- contrib/inventory/stacki.py                                           |=
 2 +-
- contrib/inventory/vagrant.py                                          |=
 2 +-
- contrib/inventory/vbox.py                                             |=
 2 +-
- contrib/inventory/vmware.py                                           |=
 2 +-
- contrib/inventory/vmware_inventory.py                                 |=
 2 +-
- contrib/inventory/windows_azure.py                                    |=
 2 +-
- contrib/inventory/zabbix.py                                           |=
 2 +-
- contrib/inventory/zone.py                                             |=
 2 +-
- docs/docsite/rst/dev_guide/developing_api.rst                         |=
 2 +-
- hacking/dump_playbook_attributes.py                                   |=
 2 +-
- hacking/module_formatter.py                                           |=
 2 +-
- lib/ansible/modules/web_infrastructure/django_manage.py               |=
 2 +-
- lib/ansible/modules/windows/win_file_version.py                       |=
 2 +-
- lib/ansible/modules/windows/win_firewall_rule.py                      |=
 2 +-
- test/compile/compile.py                                               |=
 2 +-
- test/integration/cleanup_rax.py                                       |=
 2 +-
- .../targets/embedded_module/library/test_integration_module           |=
 2 +-
- test/integration/targets/module_utils/module_utils/foo.py             |=
 2 +-
- test/integration/targets/module_utils/module_utils/sub/bam.py         |=
 2 +-
- test/integration/targets/module_utils/module_utils/sub/bam/bam.py     |=
 2 +-
- test/integration/targets/module_utils/module_utils/sub/bar/bam.py     |=
 2 +-
- test/integration/targets/module_utils/module_utils/sub/bar/bar.py     |=
 2 +-
- test/integration/targets/service/files/ansible_test_service           |=
 2 +-
- test/runner/ansible-test                                              |=
 2 +-
- test/runner/injector/ansible                                          |=
 2 +-
- test/runner/injector/ansible-console                                  |=
 2 +-
- test/runner/injector/ansible-doc                                      |=
 2 +-
- test/runner/injector/ansible-galaxy                                   |=
 2 +-
- test/runner/injector/ansible-playbook                                 |=
 2 +-
- test/runner/injector/ansible-pull                                     |=
 2 +-
- test/runner/injector/ansible-vault                                    |=
 2 +-
- test/runner/injector/cover                                            |=
 2 +-
- test/runner/injector/cover2                                           |=
 2 +-
- test/runner/injector/cover2.4                                         |=
 2 +-
- test/runner/injector/cover2.6                                         |=
 2 +-
- test/runner/injector/cover2.7                                         |=
 2 +-
- test/runner/injector/cover3                                           |=
 2 +-
- test/runner/injector/cover3.5                                         |=
 2 +-
- test/runner/injector/cover3.6                                         |=
 2 +-
- test/runner/injector/injector.py                                      |=
 2 +-
- test/runner/injector/pytest                                           |=
 2 +-
- test/runner/injector/runner                                           |=
 2 +-
- test/runner/injector/runner2                                          |=
 2 +-
- test/runner/injector/runner2.4                                        |=
 2 +-
- test/runner/injector/runner2.6                                        |=
 2 +-
- test/runner/injector/runner2.7                                        |=
 2 +-
- test/runner/injector/runner3                                          |=
 2 +-
- test/runner/injector/runner3.5                                        |=
 2 +-
- test/runner/injector/runner3.6                                        |=
 2 +-
- test/runner/retry.py                                                  |=
 2 +-
- test/runner/test.py                                                   |=
 2 +-
- test/sanity/code-smell/ansible-var-precedence-check.py                |=
 2 +-
- test/sanity/code-smell/integration-aliases.py                         |=
 2 +-
- test/sanity/code-smell/shebang.sh                                     |=
 4 ++--
- test/sanity/validate-modules/test_validate_modules_regex.py           |=
 2 +-
- test/sanity/validate-modules/validate-modules                         |=
 2 +-
- test/units/executor/module_common/test_module_common.py               |=
 4 ++--
- test/units/modules/network/nxos/test_nxos_config.py                   |=
 2 +-
- test/utils/shippable/ansible-core-ci                                  |=
 2 +-
- test/utils/shippable/download.py                                      |=
 2 +-
- 121 files changed, 123 insertions(+), 123 deletions(-)
+ .azure-pipelines/scripts/combine-coverage.py                  | 2 +-
+ .azure-pipelines/scripts/publish-codecov.py                   | 2 +-
+ .azure-pipelines/scripts/time-command.py                      | 2 +-
+ docs/bin/find-plugin-refs.py                                  | 2 +-
+ docs/docsite/rst/dev_guide/testing/sanity/shebang.rst         | 2 +-
+ docs/docsite/rst/inventory_guide/connection_details.rst       | 4 ++--
+ docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po          | 4 ++--
+ examples/scripts/uptime.py                                    | 2 +-
+ hacking/ansible-profile                                       | 2 +-
+ hacking/azp/download.py                                       | 2 +-
+ hacking/azp/get_recent_coverage_runs.py                       | 2 +-
+ hacking/azp/incidental.py                                     | 2 +-
+ hacking/azp/run.py                                            | 2 +-
+ hacking/backport/backport_of_line_adder.py                    | 2 +-
+ hacking/build-ansible.py                                      | 2 +-
+ hacking/create_deprecation_bug_reports.py                     | 2 +-
+ hacking/fix_test_syntax.py                                    | 2 +-
+ hacking/get_library.py                                        | 2 +-
+ hacking/report.py                                             | 2 +-
+ hacking/return_skeleton_generator.py                          | 2 +-
+ hacking/test-module.py                                        | 2 +-
+ hacking/tests/gen_distribution_version_testcase.py            | 2 +-
+ hacking/update-sanity-requirements.py                         | 2 +-
+ lib/ansible/cli/adhoc.py                                      | 2 +-
+ lib/ansible/cli/config.py                                     | 2 +-
+ lib/ansible/cli/console.py                                    | 2 +-
+ lib/ansible/cli/doc.py                                        | 2 +-
+ lib/ansible/cli/galaxy.py                                     | 2 +-
+ lib/ansible/cli/inventory.py                                  | 2 +-
+ lib/ansible/cli/playbook.py                                   | 2 +-
+ lib/ansible/cli/pull.py                                       | 2 +-
+ lib/ansible/cli/scripts/ansible_connection_cli_stub.py        | 2 +-
+ lib/ansible/cli/vault.py                                      | 2 +-
+ packaging/release.py                                          | 2 +-
+ packaging/sdist/check-link-behavior.py                        | 2 +-
+ .../targets/ansible-galaxy-collection/files/build_bad_tar.py  | 2 +-
+ test/integration/targets/ansible-test-container/runme.py      | 2 +-
+ .../targets/ansible-test-integration-targets/test.py          | 2 +-
+ .../ansible_collections/ns/col/run-with-pty.py                | 2 +-
+ .../ns/col/tests/integration/targets/no-tty/assert-no-tty.py  | 2 +-
+ .../ansible_collections/ns/col/scripts/env_python.py          | 2 +-
+ .../ns/col/tests/integration/targets/valid/env_python.py      | 2 +-
+ test/integration/targets/ansible-test/venv-pythons.py         | 2 +-
+ test/integration/targets/ansible-vault/faux-editor.py         | 2 +-
+ test/integration/targets/ansible-vault/password-script.py     | 2 +-
+ test/integration/targets/ansible-vault/test-vault-client.py   | 2 +-
+ .../targets/builtin_vars_prompt/test-vars_prompt.py           | 2 +-
+ test/integration/targets/cli/test-cli.py                      | 2 +-
+ test/integration/targets/cli/test_k_and_K.py                  | 2 +-
+ test/integration/targets/collection/update-ignore.py          | 2 +-
+ test/integration/targets/debugger/test_run_once.py            | 2 +-
+ test/integration/targets/fork_safe_stdio/run-with-pty.py      | 2 +-
+ test/integration/targets/gathering/uuid.fact                  | 2 +-
+ test/integration/targets/gathering_facts/uuid.fact            | 2 +-
+ test/integration/targets/group/files/gidget.py                | 2 +-
+ test/integration/targets/module_utils/module_utils/foo.py     | 2 +-
+ test/integration/targets/module_utils/module_utils/sub/bam.py | 2 +-
+ .../targets/module_utils/module_utils/sub/bam/bam.py          | 2 +-
+ .../targets/module_utils/module_utils/sub/bar/bam.py          | 2 +-
+ .../targets/module_utils/module_utils/sub/bar/bar.py          | 2 +-
+ test/integration/targets/pause/test-pause.py                  | 2 +-
+ test/integration/targets/pip/files/setup.py                   | 2 +-
+ .../integration/targets/service/files/ansible_test_service.py | 2 +-
+ .../targets/service_facts/files/ansible_test_service.py       | 2 +-
+ .../targets/template/role_filter/filter_plugins/myplugin.py   | 2 +-
+ test/integration/targets/throttle/test_throttle.py            | 2 +-
+ .../targets/var_precedence/ansible-var-precedence-check.py    | 2 +-
+ test/lib/ansible_test/_internal/util_common.py                | 2 +-
+ .../_util/controller/sanity/code-smell/shebang.py             | 4 ++--
+ .../ansible_test/_util/target/cli/ansible_test_cli_stub.py    | 2 +-
+ test/units/executor/module_common/test_module_common.py       | 4 ++--
+ 71 files changed, 75 insertions(+), 75 deletions(-)
=20
-diff --git a/bin/ansible b/bin/ansible
-index 24550b9..0587499 100755
---- a/bin/ansible
-+++ b/bin/ansible
+diff --git a/.azure-pipelines/scripts/combine-coverage.py b/.azure-pipel=
ines/scripts/combine-coverage.py
+index 506ade6460c..15bee402341 100755
+--- a/.azure-pipelines/scripts/combine-coverage.py
++++ b/.azure-pipelines/scripts/combine-coverage.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-connection b/bin/ansible-connection
-index 93d787e..f0b9aa3 100755
---- a/bin/ansible-connection
-+++ b/bin/ansible-connection
+ """
+ Combine coverage data from multiple jobs, keeping the data only from th=
e most recent attempt from each job.
+ Coverage artifacts must be named using the format: "Coverage $(System.J=
obAttempt) {StableUniqueNameForEachJob}"
+diff --git a/.azure-pipelines/scripts/publish-codecov.py b/.azure-pipeli=
nes/scripts/publish-codecov.py
+index f2bc4b84b38..01ad32f494c 100755
+--- a/.azure-pipelines/scripts/publish-codecov.py
++++ b/.azure-pipelines/scripts/publish-codecov.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2016, Ansible, Inc. <support@ansible.com>
- #
-diff --git a/bin/ansible-console b/bin/ansible-console
-index 24550b9..0587499 100755
---- a/bin/ansible-console
-+++ b/bin/ansible-console
+ """
+ Upload code coverage reports to codecov.io.
+ Multiple coverage files from multiple languages are accepted and aggreg=
ated after upload.
+diff --git a/.azure-pipelines/scripts/time-command.py b/.azure-pipelines=
/scripts/time-command.py
+index 5e8eb8d4c8f..5450c48900e 100755
+--- a/.azure-pipelines/scripts/time-command.py
++++ b/.azure-pipelines/scripts/time-command.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Prepends a relative timestamp to each input line from stdin and writ=
es it to stdout."""
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-doc b/bin/ansible-doc
-index 24550b9..0587499 100755
---- a/bin/ansible-doc
-+++ b/bin/ansible-doc
+ from __future__ import (absolute_import, division, print_function)
+diff --git a/docs/bin/find-plugin-refs.py b/docs/bin/find-plugin-refs.py
+index d603409d688..c52d6d13e38 100755
+--- a/docs/bin/find-plugin-refs.py
++++ b/docs/bin/find-plugin-refs.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-galaxy b/bin/ansible-galaxy
-index 24550b9..0587499 100755
---- a/bin/ansible-galaxy
-+++ b/bin/ansible-galaxy
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+ # To run this script, first make webdocs in the toplevel of the checkou=
t.  This will generate all
+ # rst files from their sources.  Then run this script ./docs/bin/find-p=
lugin-refs.py
+diff --git a/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst b/doc=
s/docsite/rst/dev_guide/testing/sanity/shebang.rst
+index cff2aa0914b..7c4bd651563 100644
+--- a/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst
++++ b/docs/docsite/rst/dev_guide/testing/sanity/shebang.rst
+@@ -6,7 +6,7 @@ Most executable files should only use one of the followi=
ng shebangs:
+ - ``#!/bin/sh``
+ - ``#!/bin/bash``
+ - ``#!/usr/bin/make``
+-- ``#!/usr/bin/env python``
++- ``#!/usr/bin/env python3``
+ - ``#!/usr/bin/env bash``
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-playbook b/bin/ansible-playbook
-index 24550b9..0587499 100755
---- a/bin/ansible-playbook
-+++ b/bin/ansible-playbook
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+ NOTE: For ``#!/bin/bash``, any of the options ``eux`` may also be used,=
 such as ``#!/bin/bash -eux``.
+diff --git a/docs/docsite/rst/inventory_guide/connection_details.rst b/d=
ocs/docsite/rst/inventory_guide/connection_details.rst
+index 5e332160617..65bfd5903ad 100644
+--- a/docs/docsite/rst/inventory_guide/connection_details.rst
++++ b/docs/docsite/rst/inventory_guide/connection_details.rst
+@@ -84,13 +84,13 @@ You can run commands against the control node by usi=
ng "localhost" or "127.0.0.1
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-pull b/bin/ansible-pull
-index 24550b9..0587499 100755
---- a/bin/ansible-pull
-+++ b/bin/ansible-pull
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+ .. code-block:: bash
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/bin/ansible-vault b/bin/ansible-vault
-index 24550b9..0587499 100755
---- a/bin/ansible-vault
-+++ b/bin/ansible-vault
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+-    $ ansible localhost -m ping -e 'ansible_python_interpreter=3D"/usr/=
bin/env python"'
++    $ ansible localhost -m ping -e 'ansible_python_interpreter=3D"/usr/=
bin/env python3"'
 =20
- # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
- #
-diff --git a/contrib/inventory/abiquo.py b/contrib/inventory/abiquo.py
-index 405bbbb..d318949 100755
---- a/contrib/inventory/abiquo.py
-+++ b/contrib/inventory/abiquo.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
+ You can specify localhost explicitly by adding this to your inventory f=
ile:
 =20
- '''
-diff --git a/contrib/inventory/apache-libcloud.py b/contrib/inventory/ap=
ache-libcloud.py
-index 0120d2b..ce92843 100755
---- a/contrib/inventory/apache-libcloud.py
-+++ b/contrib/inventory/apache-libcloud.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+ .. code-block:: bash
 =20
- # (c) 2013, Sebastien Goasguen <runseb@gmail.com>
- #
-diff --git a/contrib/inventory/apstra_aos.py b/contrib/inventory/apstra_=
aos.py
-index 65838c0..48d293e 100755
---- a/contrib/inventory/apstra_aos.py
-+++ b/contrib/inventory/apstra_aos.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # (c) 2017 Apstra Inc, <community@apstra.com>
- #
-diff --git a/contrib/inventory/azure_rm.py b/contrib/inventory/azure_rm.=
py
-index 73b8b95..87b31b0 100755
---- a/contrib/inventory/azure_rm.py
-+++ b/contrib/inventory/azure_rm.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # Copyright (c) 2016 Matt Davis, <mdavis@ansible.com>
- #                    Chris Houseknecht, <house@redhat.com>
-diff --git a/contrib/inventory/brook.py b/contrib/inventory/brook.py
-index a7d4741..e4de982 100755
---- a/contrib/inventory/brook.py
-+++ b/contrib/inventory/brook.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # Copyright 2016 Doalitic.
- #
- # This file is part of Ansible
-diff --git a/contrib/inventory/cloudforms.py b/contrib/inventory/cloudfo=
rms.py
-index 69c149b..202a6c9 100755
---- a/contrib/inventory/cloudforms.py
-+++ b/contrib/inventory/cloudforms.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # vim: set fileencoding=3Dutf-8 :
- #
- # Copyright (C) 2016 Guido G=C3=BCnther <agx@sigxcpu.org>
-diff --git a/contrib/inventory/cloudstack.py b/contrib/inventory/cloudst=
ack.py
-index a9b6b9f..d7f05ff 100755
---- a/contrib/inventory/cloudstack.py
-+++ b/contrib/inventory/cloudstack.py
+-    localhost ansible_connection=3Dlocal ansible_python_interpreter=3D"=
/usr/bin/env python"
++    localhost ansible_connection=3Dlocal ansible_python_interpreter=3D"=
/usr/bin/env python3"
+=20
+ .. _host_key_checking_on:
+=20
+diff --git a/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po b/docs=
/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
+index b6abc3e5874..53f5fdc8986 100644
+--- a/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
++++ b/docs/docsite/rst/locales/ja/LC_MESSAGES/dev_guide.po
+@@ -11820,8 +11820,8 @@ msgid "``#!/usr/bin/make``"
+ msgstr "``#!/usr/bin/make``"
+=20
+ #: ../../rst/dev_guide/testing/sanity/shebang.rst:9
+-msgid "``#!/usr/bin/env python``"
+-msgstr "``#!/usr/bin/env python``"
++msgid "``#!/usr/bin/env python3``"
++msgstr "``#!/usr/bin/env python3``"
+=20
+ #: ../../rst/dev_guide/testing/sanity/shebang.rst:10
+ msgid "``#!/usr/bin/env bash``"
+diff --git a/examples/scripts/uptime.py b/examples/scripts/uptime.py
+index d77a5fb5660..665594c254b 100755
+--- a/examples/scripts/uptime.py
++++ b/examples/scripts/uptime.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- #
- # (c) 2015, Ren=C3=A9 Moser <mail@renemoser.net>
-diff --git a/contrib/inventory/cobbler.py b/contrib/inventory/cobbler.py
-index 89f9bf7..f2a9ff7 100755
---- a/contrib/inventory/cobbler.py
-+++ b/contrib/inventory/cobbler.py
+=20
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/hacking/ansible-profile b/hacking/ansible-profile
+index 6612402da62..d67526a1619 100755
+--- a/hacking/ansible-profile
++++ b/hacking/ansible-profile
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
 =20
- """
- Cobbler external inventory script
-diff --git a/contrib/inventory/collins.py b/contrib/inventory/collins.py
-index b7193e2..f0bc2a1 100755
---- a/contrib/inventory/collins.py
-+++ b/contrib/inventory/collins.py
+diff --git a/hacking/azp/download.py b/hacking/azp/download.py
+index 117e9da5b7a..89466cb17be 100755
+--- a/hacking/azp/download.py
++++ b/hacking/azp/download.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
 =20
- """
- Collins external inventory script
-diff --git a/contrib/inventory/consul_io.py b/contrib/inventory/consul_i=
o.py
-index 8106097..2cdc523 100755
---- a/contrib/inventory/consul_io.py
-+++ b/contrib/inventory/consul_io.py
+ # (c) 2016 Red Hat, Inc.
+diff --git a/hacking/azp/get_recent_coverage_runs.py b/hacking/azp/get_r=
ecent_coverage_runs.py
+index 25e2fa8120a..9b0d9b972ed 100755
+--- a/hacking/azp/get_recent_coverage_runs.py
++++ b/hacking/azp/get_recent_coverage_runs.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
+ # (c) 2020 Red Hat, Inc.
  #
- # (c) 2015, Steve Gargan <steve.gargan@gmail.com>
-diff --git a/contrib/inventory/digital_ocean.py b/contrib/inventory/digi=
tal_ocean.py
-index 07c124b..0b0e587 100755
---- a/contrib/inventory/digital_ocean.py
-+++ b/contrib/inventory/digital_ocean.py
+diff --git a/hacking/azp/incidental.py b/hacking/azp/incidental.py
+index 87d4d213c94..7660e2ed226 100755
+--- a/hacking/azp/incidental.py
++++ b/hacking/azp/incidental.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
 =20
- '''
- DigitalOcean external inventory script
-diff --git a/contrib/inventory/docker.py b/contrib/inventory/docker.py
-index da051dd..9b88d0c 100755
---- a/contrib/inventory/docker.py
-+++ b/contrib/inventory/docker.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # (c) 2016 Paul Durivage <paul.durivage@gmail.com>
- #          Chris Houseknecht <house@redhat.com>
-diff --git a/contrib/inventory/ec2.py b/contrib/inventory/ec2.py
-index 03b9820..9c9b2e4 100755
---- a/contrib/inventory/ec2.py
-+++ b/contrib/inventory/ec2.py
+ # (c) 2020 Red Hat, Inc.
+diff --git a/hacking/azp/run.py b/hacking/azp/run.py
+index 00a177944f8..591e6bcc4fe 100755
+--- a/hacking/azp/run.py
++++ b/hacking/azp/run.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
 =20
- '''
- EC2 external inventory script
-diff --git a/contrib/inventory/fleet.py b/contrib/inventory/fleet.py
-index 4db4ea1..8790f2b 100755
---- a/contrib/inventory/fleet.py
-+++ b/contrib/inventory/fleet.py
+ # (c) 2016 Red Hat, Inc.
+diff --git a/hacking/backport/backport_of_line_adder.py b/hacking/backpo=
rt/backport_of_line_adder.py
+index ef77ddcf400..bbec15de6a2 100755
+--- a/hacking/backport/backport_of_line_adder.py
++++ b/hacking/backport/backport_of_line_adder.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """
- fleetctl base external inventory script. Automatically finds the IPs of=
 the booted coreos instances and
- returns it under the host group 'coreos'
-diff --git a/contrib/inventory/foreman.py b/contrib/inventory/foreman.py
-index 9a87397..2483cce 100755
---- a/contrib/inventory/foreman.py
-+++ b/contrib/inventory/foreman.py
+ # (c) 2020, Red Hat, Inc. <relrod@redhat.com>
+ #
+ # This file is part of Ansible
+diff --git a/hacking/build-ansible.py b/hacking/build-ansible.py
+index c108c1861fa..8ebb88d33bd 100755
+--- a/hacking/build-ansible.py
++++ b/hacking/build-ansible.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # vim: set fileencoding=3Dutf-8 :
- #
- # Copyright (C) 2016 Guido G=C3=BCnther <agx@sigxcpu.org>,
-diff --git a/contrib/inventory/freeipa.py b/contrib/inventory/freeipa.py
-index a72b774..1f092b2 100755
---- a/contrib/inventory/freeipa.py
-+++ b/contrib/inventory/freeipa.py
+ # coding: utf-8
+ # PYTHON_ARGCOMPLETE_OK
+ # Copyright: (c) 2019, Ansible Project
+diff --git a/hacking/create_deprecation_bug_reports.py b/hacking/create_=
deprecation_bug_reports.py
+index e14df4be389..e6b9b9025c3 100755
+--- a/hacking/create_deprecation_bug_reports.py
++++ b/hacking/create_deprecation_bug_reports.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
+ """Create GitHub issues for deprecated features."""
 =20
- import argparse
- from ipalib import api
-diff --git a/contrib/inventory/gce.py b/contrib/inventory/gce.py
-index 5c58146..7616843 100755
---- a/contrib/inventory/gce.py
-+++ b/contrib/inventory/gce.py
+diff --git a/hacking/fix_test_syntax.py b/hacking/fix_test_syntax.py
+index 7178033406a..78d87ef71cb 100755
+--- a/hacking/fix_test_syntax.py
++++ b/hacking/fix_test_syntax.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # Copyright 2013 Google Inc.
+ # -*- coding: utf-8 -*-
+ # (c) 2017, Matt Martz <matt@sivel.net>
  #
- # This file is part of Ansible
-diff --git a/contrib/inventory/jail.py b/contrib/inventory/jail.py
-index 98b6acf..b12289c 100755
---- a/contrib/inventory/jail.py
-+++ b/contrib/inventory/jail.py
+diff --git a/hacking/get_library.py b/hacking/get_library.py
+index 23bf4a39bb5..9346784398f 100755
+--- a/hacking/get_library.py
++++ b/hacking/get_library.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # (c) 2013, Michael Scherer <misc@zarb.org>
+ # (c) 2014, Will Thames <will@thames.id.au>
  #
-diff --git a/contrib/inventory/landscape.py b/contrib/inventory/landscap=
e.py
-index 4b53171..7f52639 100755
---- a/contrib/inventory/landscape.py
-+++ b/contrib/inventory/landscape.py
+diff --git a/hacking/report.py b/hacking/report.py
+index 58b3a6b915a..78eed516dc0 100755
+--- a/hacking/report.py
++++ b/hacking/report.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
+ """A tool to aggregate data about Ansible source and testing into a sql=
ite DB for reporting."""
 =20
- # (c) 2015, Marc Abramowitz <marca@surveymonkey.com>
- #
-diff --git a/contrib/inventory/libvirt_lxc.py b/contrib/inventory/libvir=
t_lxc.py
-index 35ccf40..ba3496d 100755
---- a/contrib/inventory/libvirt_lxc.py
-+++ b/contrib/inventory/libvirt_lxc.py
+diff --git a/hacking/return_skeleton_generator.py b/hacking/return_skele=
ton_generator.py
+index 7002b7899d5..cff03c38e6b 100755
+--- a/hacking/return_skeleton_generator.py
++++ b/hacking/return_skeleton_generator.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # (c) 2013, Michael Scherer <misc@zarb.org>
+ # (c) 2017, Will Thames <will@thames.id.au>
  #
-diff --git a/contrib/inventory/linode.py b/contrib/inventory/linode.py
-index 6fd922f..cab7a70 100755
---- a/contrib/inventory/linode.py
-+++ b/contrib/inventory/linode.py
+diff --git a/hacking/test-module.py b/hacking/test-module.py
+index 54343e07e8b..38d4b8c60bb 100755
+--- a/hacking/test-module.py
++++ b/hacking/test-module.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- '''
- Linode external inventory script
-diff --git a/contrib/inventory/lxc_inventory.py b/contrib/inventory/lxc_=
inventory.py
-index d82bb61..f7ac67c 100755
---- a/contrib/inventory/lxc_inventory.py
-+++ b/contrib/inventory/lxc_inventory.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
+ # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
  #
- # (c) 2015-16 Florian Haas, hastexo Professional Services GmbH
- # <florian@hastexo.com>
-diff --git a/contrib/inventory/mdt_dynamic_inventory.py b/contrib/invent=
ory/mdt_dynamic_inventory.py
-index 89ecc3e..5540a41 100755
---- a/contrib/inventory/mdt_dynamic_inventory.py
-+++ b/contrib/inventory/mdt_dynamic_inventory.py
+diff --git a/hacking/tests/gen_distribution_version_testcase.py b/hackin=
g/tests/gen_distribution_version_testcase.py
+index 2fc5a2f9328..18e67d7d121 100755
+--- a/hacking/tests/gen_distribution_version_testcase.py
++++ b/hacking/tests/gen_distribution_version_testcase.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # (c) 2016, Julian Barnett <jbarnett@tableau.com>
- #
-diff --git a/contrib/inventory/nagios_livestatus.py b/contrib/inventory/=
nagios_livestatus.py
-index e1c145e..3e250cb 100755
---- a/contrib/inventory/nagios_livestatus.py
-+++ b/contrib/inventory/nagios_livestatus.py
+ """
+ This script generated test_cases for test_distribution_version.py.
+diff --git a/hacking/update-sanity-requirements.py b/hacking/update-sani=
ty-requirements.py
+index 747f058880a..2570ab2c7d3 100755
+--- a/hacking/update-sanity-requirements.py
++++ b/hacking/update-sanity-requirements.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
+ """Generate frozen sanity test requirements from source requirements fi=
les."""
 =20
- # (c) 2015, Yannig Perre <yannig.perre@gmail.com>
- #
-diff --git a/contrib/inventory/nagios_ndo.py b/contrib/inventory/nagios_=
ndo.py
-index 49ec563..cc10a51 100755
---- a/contrib/inventory/nagios_ndo.py
-+++ b/contrib/inventory/nagios_ndo.py
+diff --git a/lib/ansible/cli/adhoc.py b/lib/ansible/cli/adhoc.py
+index e90b44ce101..120948c7495 100755
+--- a/lib/ansible/cli/adhoc.py
++++ b/lib/ansible/cli/adhoc.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2014, Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
- #
-diff --git a/contrib/inventory/nova.py b/contrib/inventory/nova.py
-index f8c1617..d0ad7f0 100755
---- a/contrib/inventory/nova.py
-+++ b/contrib/inventory/nova.py
+ # Copyright: (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/config.py b/lib/ansible/cli/config.py
+index 3a5c24214b1..98d7a732517 100755
+--- a/lib/ansible/cli/config.py
++++ b/lib/ansible/cli/config.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2012, Marco Vito Moscaritolo <marco@agavee.com>
- #
-diff --git a/contrib/inventory/nsot.py b/contrib/inventory/nsot.py
-index 62be85a..0a8dc9b 100755
---- a/contrib/inventory/nsot.py
-+++ b/contrib/inventory/nsot.py
+ # Copyright: (c) 2017, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+ # PYTHON_ARGCOMPLETE_OK
+diff --git a/lib/ansible/cli/console.py b/lib/ansible/cli/console.py
+index 3125cc47a7f..4a2f38bb48e 100755
+--- a/lib/ansible/cli/console.py
++++ b/lib/ansible/cli/console.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- '''
- nsot
-diff --git a/contrib/inventory/openshift.py b/contrib/inventory/openshif=
t.py
-index 479b808..dc398b5 100755
---- a/contrib/inventory/openshift.py
-+++ b/contrib/inventory/openshift.py
+ # Copyright: (c) 2014, Nandor Sivok <dominis@haxor.hu>
+ # Copyright: (c) 2016, Redhat Inc
+ # Copyright: (c) 2018, Ansible Project
+diff --git a/lib/ansible/cli/doc.py b/lib/ansible/cli/doc.py
+index 9f560bcbc6d..a0d34d92f6d 100755
+--- a/lib/ansible/cli/doc.py
++++ b/lib/ansible/cli/doc.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2013, Michael Scherer <misc@zarb.org>
- #
-diff --git a/contrib/inventory/openstack.py b/contrib/inventory/openstac=
k.py
-index 6679a2c..eb38742 100755
---- a/contrib/inventory/openstack.py
-+++ b/contrib/inventory/openstack.py
+ # Copyright: (c) 2014, James Tanner <tanner.jc@gmail.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/galaxy.py b/lib/ansible/cli/galaxy.py
+index c280380c18c..0357401c749 100755
+--- a/lib/ansible/cli/galaxy.py
++++ b/lib/ansible/cli/galaxy.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # Copyright (c) 2012, Marco Vito Moscaritolo <marco@agavee.com>
- # Copyright (c) 2013, Jesse Keating <jesse.keating@rackspace.com>
-diff --git a/contrib/inventory/openvz.py b/contrib/inventory/openvz.py
-index 1ef8ab1..d4dfcde 100755
---- a/contrib/inventory/openvz.py
-+++ b/contrib/inventory/openvz.py
+ # Copyright: (c) 2013, James Cammarata <jcammarata@ansible.com>
+ # Copyright: (c) 2018-2021, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/inventory.py b/lib/ansible/cli/inventory.py
+index e8ed75e4636..e4bb334932e 100755
+--- a/lib/ansible/cli/inventory.py
++++ b/lib/ansible/cli/inventory.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- #
- # openvz.py
-diff --git a/contrib/inventory/ovirt.py b/contrib/inventory/ovirt.py
-index 7f505d9..ada01fa 100755
---- a/contrib/inventory/ovirt.py
-+++ b/contrib/inventory/ovirt.py
+ # Copyright: (c) 2017, Brian Coca <bcoca@ansible.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/playbook.py b/lib/ansible/cli/playbook.py
+index 9c091a675a9..27ff7d442e4 100755
+--- a/lib/ansible/cli/playbook.py
++++ b/lib/ansible/cli/playbook.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # Copyright 2015 IIX Inc.
- #
- # This file is part of Ansible
-diff --git a/contrib/inventory/ovirt4.py b/contrib/inventory/ovirt4.py
-index 5ee5986..9d9e940 100755
---- a/contrib/inventory/ovirt4.py
-+++ b/contrib/inventory/ovirt4.py
+ # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/pull.py b/lib/ansible/cli/pull.py
+index dc8f055b44d..0e5b030eecf 100755
+--- a/lib/ansible/cli/pull.py
++++ b/lib/ansible/cli/pull.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- #
- # Copyright (c) 2016 Red Hat, Inc.
-diff --git a/contrib/inventory/packet_net.py b/contrib/inventory/packet_=
net.py
-index c40c821..d23eba1 100755
---- a/contrib/inventory/packet_net.py
-+++ b/contrib/inventory/packet_net.py
+ # Copyright: (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py b/li=
b/ansible/cli/scripts/ansible_connection_cli_stub.py
+index 9109137e7f8..f01b1ec58dc 100755
+--- a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
++++ b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- '''
- Packet.net external inventory script
-diff --git a/contrib/inventory/proxmox.py b/contrib/inventory/proxmox.py
-index c0ffb0b..ef7a394 100755
---- a/contrib/inventory/proxmox.py
-+++ b/contrib/inventory/proxmox.py
+ # Copyright: (c) 2017, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+ from __future__ import (absolute_import, division, print_function)
+diff --git a/lib/ansible/cli/vault.py b/lib/ansible/cli/vault.py
+index 3e60329de60..69499407479 100755
+--- a/lib/ansible/cli/vault.py
++++ b/lib/ansible/cli/vault.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # Copyright (C) 2014  Mathieu GAUTHIER-LAFAYE <gauthierl@lapth.cnrs.fr>
- #
-diff --git a/contrib/inventory/rackhd.py b/contrib/inventory/rackhd.py
-index a89cb04..05b3ada 100755
---- a/contrib/inventory/rackhd.py
-+++ b/contrib/inventory/rackhd.py
+ # (c) 2014, James Tanner <tanner.jc@gmail.com>
+ # Copyright: (c) 2018, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/packaging/release.py b/packaging/release.py
+index 1d1ba37117a..a561dc6a905 100755
+--- a/packaging/release.py
++++ b/packaging/release.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
+ """Manage upstream ansible-core releases."""
 =20
- import json
- import requests
-diff --git a/contrib/inventory/rax.py b/contrib/inventory/rax.py
-index d20a8ab..6c34753 100755
---- a/contrib/inventory/rax.py
-+++ b/contrib/inventory/rax.py
+diff --git a/packaging/sdist/check-link-behavior.py b/packaging/sdist/ch=
eck-link-behavior.py
+index 34e05023d48..42f6c4be98f 100755
+--- a/packaging/sdist/check-link-behavior.py
++++ b/packaging/sdist/check-link-behavior.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Checks for link behavior required for sdist to retain symlinks."""
 =20
- # (c) 2013, Jesse Keating <jesse.keating@rackspace.com,
- #           Paul Durivage <paul.durivage@rackspace.com>,
-diff --git a/contrib/inventory/rhv.py b/contrib/inventory/rhv.py
-index 5ee5986..9d9e940 100755
---- a/contrib/inventory/rhv.py
-+++ b/contrib/inventory/rhv.py
+ from __future__ import (absolute_import, division, print_function)
+diff --git a/test/integration/targets/ansible-galaxy-collection/files/bu=
ild_bad_tar.py b/test/integration/targets/ansible-galaxy-collection/files=
/build_bad_tar.py
+index 6182e865db0..5829df52b5b 100644
+--- a/test/integration/targets/ansible-galaxy-collection/files/build_bad=
_tar.py
++++ b/test/integration/targets/ansible-galaxy-collection/files/build_bad=
_tar.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- #
- # Copyright (c) 2016 Red Hat, Inc.
-diff --git a/contrib/inventory/rudder.py b/contrib/inventory/rudder.py
-index 5cf16c9..a669c37 100755
---- a/contrib/inventory/rudder.py
-+++ b/contrib/inventory/rudder.py
+=20
+ # Copyright: (c) 2020, Ansible Project
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
+diff --git a/test/integration/targets/ansible-test-container/runme.py b/=
test/integration/targets/ansible-test-container/runme.py
+index 687128056f7..bd7f3671655 100755
+--- a/test/integration/targets/ansible-test-container/runme.py
++++ b/test/integration/targets/ansible-test-container/runme.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Test suite used to verify ansible-test is able to run its containers=
 on various container hosts."""
 =20
- # Copyright (c) 2015, Normation SAS
- #
-diff --git a/contrib/inventory/serf.py b/contrib/inventory/serf.py
-index e1340da..6242eda 100755
---- a/contrib/inventory/serf.py
-+++ b/contrib/inventory/serf.py
+ from __future__ import annotations
+diff --git a/test/integration/targets/ansible-test-integration-targets/t=
est.py b/test/integration/targets/ansible-test-integration-targets/test.p=
y
+index 8effb647fca..4e34c4bbc16 100755
+--- a/test/integration/targets/ansible-test-integration-targets/test.py
++++ b/test/integration/targets/ansible-test-integration-targets/test.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # (c) 2015, Marc Abramowitz <marca@surveymonkey.com>
- #
-diff --git a/contrib/inventory/softlayer.py b/contrib/inventory/softlaye=
r.py
-index 3933eb4..519092f 100755
---- a/contrib/inventory/softlayer.py
-+++ b/contrib/inventory/softlayer.py
+ import subprocess
+ import unittest
+diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collec=
tions/ns/col/run-with-pty.py b/test/integration/targets/ansible-test-no-t=
ty/ansible_collections/ns/col/run-with-pty.py
+index 463915284b2..fc2ed398d9f 100755
+--- a/test/integration/targets/ansible-test-no-tty/ansible_collections/n=
s/col/run-with-pty.py
++++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/n=
s/col/run-with-pty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """
- SoftLayer external inventory script.
+ """Run a command using a PTY."""
 =20
-diff --git a/contrib/inventory/spacewalk.py b/contrib/inventory/spacewal=
k.py
-index 2735a81..2da2720 100755
---- a/contrib/inventory/spacewalk.py
-+++ b/contrib/inventory/spacewalk.py
+ import sys
+diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collec=
tions/ns/col/tests/integration/targets/no-tty/assert-no-tty.py b/test/int=
egration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/int=
egration/targets/no-tty/assert-no-tty.py
+index a2b094e2fca..355dba697a9 100755
+--- a/test/integration/targets/ansible-test-no-tty/ansible_collections/n=
s/col/tests/integration/targets/no-tty/assert-no-tty.py
++++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/n=
s/col/tests/integration/targets/no-tty/assert-no-tty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Assert no TTY is available."""
 =20
- """
- Spacewalk external inventory script
-diff --git a/contrib/inventory/ssh_config.py b/contrib/inventory/ssh_con=
fig.py
-index ae41e58..05373ec 100755
---- a/contrib/inventory/ssh_config.py
-+++ b/contrib/inventory/ssh_config.py
-@@ -1,4 +1,4 @@
+ import sys
+diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansibl=
e_collections/ns/col/scripts/env_python.py b/test/integration/targets/ans=
ible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
+index 4265cc3e6c1..e5a0d9b4834 100755
+--- a/test/integration/targets/ansible-test-sanity-shebang/ansible_colle=
ctions/ns/col/scripts/env_python.py
++++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_colle=
ctions/ns/col/scripts/env_python.py
+@@ -1 +1 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # (c) 2014, Tomas Karasek <tomas.karasek@digile.fi>
- #
-diff --git a/contrib/inventory/stacki.py b/contrib/inventory/stacki.py
-index fd4cda5..d6acda3 100755
---- a/contrib/inventory/stacki.py
-+++ b/contrib/inventory/stacki.py
+diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansibl=
e_collections/ns/col/tests/integration/targets/valid/env_python.py b/test=
/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/c=
ol/tests/integration/targets/valid/env_python.py
+index 4265cc3e6c1..e5a0d9b4834 100755
+--- a/test/integration/targets/ansible-test-sanity-shebang/ansible_colle=
ctions/ns/col/tests/integration/targets/valid/env_python.py
++++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_colle=
ctions/ns/col/tests/integration/targets/valid/env_python.py
+@@ -1 +1 @@
+-#!/usr/bin/env python
++#!/usr/bin/env python3
+diff --git a/test/integration/targets/ansible-test/venv-pythons.py b/tes=
t/integration/targets/ansible-test/venv-pythons.py
+index b380f147fca..e97f2fcb33d 100755
+--- a/test/integration/targets/ansible-test/venv-pythons.py
++++ b/test/integration/targets/ansible-test/venv-pythons.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Return target Python options for use with ansible-test."""
 =20
- # Copyright (c) 2016, Hugh Ma <hugh.ma@flextronics.com>
- #
-diff --git a/contrib/inventory/vagrant.py b/contrib/inventory/vagrant.py
-index 37a6741..86fc67d 100755
---- a/contrib/inventory/vagrant.py
-+++ b/contrib/inventory/vagrant.py
+ import os
+diff --git a/test/integration/targets/ansible-vault/faux-editor.py b/tes=
t/integration/targets/ansible-vault/faux-editor.py
+index b67c7475631..a30c306a831 100755
+--- a/test/integration/targets/ansible-vault/faux-editor.py
++++ b/test/integration/targets/ansible-vault/faux-editor.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """
- Vagrant external inventory script. Automatically finds the IP of the bo=
oted vagrant vm(s), and
- returns it under the host group 'vagrant'
-diff --git a/contrib/inventory/vbox.py b/contrib/inventory/vbox.py
-index 8905fab..141b01a 100755
---- a/contrib/inventory/vbox.py
-+++ b/contrib/inventory/vbox.py
+ #
+ # Ansible is free software: you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
+diff --git a/test/integration/targets/ansible-vault/password-script.py b=
/test/integration/targets/ansible-vault/password-script.py
+index 1b7f02beb23..0dcada23c7e 100755
+--- a/test/integration/targets/ansible-vault/password-script.py
++++ b/test/integration/targets/ansible-vault/password-script.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
-=20
- # This file is part of Ansible,
  #
-diff --git a/contrib/inventory/vmware.py b/contrib/inventory/vmware.py
-index 377c7cb..cee232a 100755
---- a/contrib/inventory/vmware.py
-+++ b/contrib/inventory/vmware.py
+ # Ansible is free software: you can redistribute it and/or modify
+ # it under the terms of the GNU General Public License as published by
+diff --git a/test/integration/targets/ansible-vault/test-vault-client.py=
 b/test/integration/targets/ansible-vault/test-vault-client.py
+index ee46188742d..48244fca09e 100755
+--- a/test/integration/targets/ansible-vault/test-vault-client.py
++++ b/test/integration/targets/ansible-vault/test-vault-client.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  # -*- coding: utf-8 -*-
- '''
- VMware Inventory Script
-diff --git a/contrib/inventory/vmware_inventory.py b/contrib/inventory/v=
mware_inventory.py
-index 58ee473..4300fe5 100755
---- a/contrib/inventory/vmware_inventory.py
-+++ b/contrib/inventory/vmware_inventory.py
+=20
+ from __future__ import (absolute_import, division, print_function)
+diff --git a/test/integration/targets/builtin_vars_prompt/test-vars_prom=
pt.py b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
+index 93958fc2adb..33509c826a3 100644
+--- a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
++++ b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- # Requirements
- #   - pyvmomi >=3D 6.0.0.2016.4
-diff --git a/contrib/inventory/windows_azure.py b/contrib/inventory/wind=
ows_azure.py
-index cceed36..f8777be 100755
---- a/contrib/inventory/windows_azure.py
-+++ b/contrib/inventory/windows_azure.py
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/test/integration/targets/cli/test-cli.py b/test/integration=
/targets/cli/test-cli.py
+index 9893d6652ed..7a07dcc108e 100644
+--- a/test/integration/targets/cli/test-cli.py
++++ b/test/integration/targets/cli/test-cli.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # Copyright (c) 2019 Matt Martz <matt@sivel.net>
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
 =20
- '''
- Windows Azure external inventory script
-diff --git a/contrib/inventory/zabbix.py b/contrib/inventory/zabbix.py
-index f6b37b9..241823b 100755
---- a/contrib/inventory/zabbix.py
-+++ b/contrib/inventory/zabbix.py
+diff --git a/test/integration/targets/cli/test_k_and_K.py b/test/integra=
tion/targets/cli/test_k_and_K.py
+index f7077fba0ab..dcc96141295 100644
+--- a/test/integration/targets/cli/test_k_and_K.py
++++ b/test/integration/targets/cli/test_k_and_K.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/=
licenses/gpl-3.0.txt)
 =20
- # (c) 2013, Greg Buehler
- #
-diff --git a/contrib/inventory/zone.py b/contrib/inventory/zone.py
-index 893953e..b049fd7 100755
---- a/contrib/inventory/zone.py
-+++ b/contrib/inventory/zone.py
+ # Make coding more python3-ish
+diff --git a/test/integration/targets/collection/update-ignore.py b/test=
/integration/targets/collection/update-ignore.py
+index 92a702cf13e..9ea69089d58 100755
+--- a/test/integration/targets/collection/update-ignore.py
++++ b/test/integration/targets/collection/update-ignore.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ """Rewrite a sanity ignore file to expand Python versions for import ig=
nores and write the file out with the correct Ansible version in the name=
."""
 =20
- # (c) 2015, Dagobert Michelsen <dam@baltic-online.de>
- #
-diff --git a/docs/docsite/rst/dev_guide/developing_api.rst b/docs/docsit=
e/rst/dev_guide/developing_api.rst
-index bb2cbc4..55d4212 100644
---- a/docs/docsite/rst/dev_guide/developing_api.rst
-+++ b/docs/docsite/rst/dev_guide/developing_api.rst
-@@ -37,7 +37,7 @@ Python API 2.0
- In 2.0 things get a bit more complicated to start, but you end up with =
much more discrete and readable classes::
-=20
-=20
--    #!/usr/bin/env python
-+    #!/usr/bin/env python3
-=20
-     import json
-     from collections import namedtuple
-diff --git a/hacking/dump_playbook_attributes.py b/hacking/dump_playbook=
_attributes.py
-index 204fe3f..9d86b66 100755
---- a/hacking/dump_playbook_attributes.py
-+++ b/hacking/dump_playbook_attributes.py
+ import os
+diff --git a/test/integration/targets/debugger/test_run_once.py b/test/i=
ntegration/targets/debugger/test_run_once.py
+index 237f9c2d903..4fe74903d8d 100755
+--- a/test/integration/targets/debugger/test_run_once.py
++++ b/test/integration/targets/debugger/test_run_once.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- import optparse
- from jinja2 import Environment, FileSystemLoader
-diff --git a/hacking/module_formatter.py b/hacking/module_formatter.py
-index 4f132aa..1bee33a 100755
---- a/hacking/module_formatter.py
-+++ b/hacking/module_formatter.py
+ import io
+ import os
+diff --git a/test/integration/targets/fork_safe_stdio/run-with-pty.py b/=
test/integration/targets/fork_safe_stdio/run-with-pty.py
+index 463915284b2..fc2ed398d9f 100755
+--- a/test/integration/targets/fork_safe_stdio/run-with-pty.py
++++ b/test/integration/targets/fork_safe_stdio/run-with-pty.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # (c) 2012, Jan-Piet Mens <jpmens () gmail.com>
- # (c) 2012-2014, Michael DeHaan <michael@ansible.com> and others
- #
-diff --git a/lib/ansible/modules/web_infrastructure/django_manage.py b/l=
ib/ansible/modules/web_infrastructure/django_manage.py
-index ac24829..90aee1b 100644
---- a/lib/ansible/modules/web_infrastructure/django_manage.py
-+++ b/lib/ansible/modules/web_infrastructure/django_manage.py
-@@ -97,7 +97,7 @@ notes:
-    - This module assumes English error messages for the 'createcachetab=
le' command to detect table existence, unfortunately.
-    - To be able to use the migrate command with django versions < 1.7, =
you must have south installed and added as an app in your settings.
-    - To be able to use the collectstatic command, you must have enabled=
 staticfiles in your settings.
--   - As of ansible 2.x, your I(manage.py) application must be executabl=
e (rwxr-xr-x), and must have a valid I(shebang), i.e. "#!/usr/bin/env pyt=
hon", for invoking the appropriate Python interpreter.
-+   - As of ansible 2.x, your I(manage.py) application must be executabl=
e (rwxr-xr-x), and must have a valid I(shebang), i.e. "#!/usr/bin/env pyt=
hon3", for invoking the appropriate Python interpreter.
- requirements: [ "virtualenv", "django" ]
- author: "Scott Anderson (@tastychutney)"
- '''
-diff --git a/lib/ansible/modules/windows/win_file_version.py b/lib/ansib=
le/modules/windows/win_file_version.py
-index 399c978..1225a06 100644
---- a/lib/ansible/modules/windows/win_file_version.py
-+++ b/lib/ansible/modules/windows/win_file_version.py
+ """Run a command using a PTY."""
+=20
+ import sys
+diff --git a/test/integration/targets/gathering/uuid.fact b/test/integra=
tion/targets/gathering/uuid.fact
+index 79e3f62677e..2a294b33a82 100644
+--- a/test/integration/targets/gathering/uuid.fact
++++ b/test/integration/targets/gathering/uuid.fact
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
  # -*- coding: utf-8 -*-
 =20
- # Get DLL or EXE build version
-diff --git a/lib/ansible/modules/windows/win_firewall_rule.py b/lib/ansi=
ble/modules/windows/win_firewall_rule.py
-index e4ab1e4..456523d 100644
---- a/lib/ansible/modules/windows/win_firewall_rule.py
-+++ b/lib/ansible/modules/windows/win_firewall_rule.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
 =20
- # (c) 2014, Timothy Vandenbrande <timothy.vandenbrande@gmail.com>
- #
-diff --git a/test/compile/compile.py b/test/compile/compile.py
-index 01144c6..6e332a9 100755
---- a/test/compile/compile.py
-+++ b/test/compile/compile.py
+diff --git a/test/integration/targets/gathering_facts/uuid.fact b/test/i=
ntegration/targets/gathering_facts/uuid.fact
+index 79e3f62677e..2a294b33a82 100644
+--- a/test/integration/targets/gathering_facts/uuid.fact
++++ b/test/integration/targets/gathering_facts/uuid.fact
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """Python syntax checker with lint friendly output."""
+ # -*- coding: utf-8 -*-
 =20
- import os
-diff --git a/test/integration/cleanup_rax.py b/test/integration/cleanup_=
rax.py
-index 5c757f5..bc3448b 100755
---- a/test/integration/cleanup_rax.py
-+++ b/test/integration/cleanup_rax.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
 =20
- import os
- import re
-diff --git a/test/integration/targets/embedded_module/library/test_integ=
ration_module b/test/integration/targets/embedded_module/library/test_int=
egration_module
-index f564619..0d46d15 100644
---- a/test/integration/targets/embedded_module/library/test_integration_=
module
-+++ b/test/integration/targets/embedded_module/library/test_integration_=
module
-@@ -1,3 +1,3 @@
+diff --git a/test/integration/targets/group/files/gidget.py b/test/integ=
ration/targets/group/files/gidget.py
+index 4b771516fdd..085dfcdee11 100644
+--- a/test/integration/targets/group/files/gidget.py
++++ b/test/integration/targets/group/files/gidget.py
+@@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
- print('{"changed":false, "msg":"this is the embedded module"}')
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
 diff --git a/test/integration/targets/module_utils/module_utils/foo.py b=
/test/integration/targets/module_utils/module_utils/foo.py
-index 20698f1..0cd5c85 100644
+index 20698f1f463..0cd5c851429 100644
 --- a/test/integration/targets/module_utils/module_utils/foo.py
 +++ b/test/integration/targets/module_utils/module_utils/foo.py
 @@ -1,3 +1,3 @@
@@ -802,7 +654,7 @@ index 20698f1..0cd5c85 100644
 =20
  foo =3D "FOO FROM foo.py"
 diff --git a/test/integration/targets/module_utils/module_utils/sub/bam.=
py b/test/integration/targets/module_utils/module_utils/sub/bam.py
-index 566f8b7..0814485 100644
+index 566f8b7c47f..0814485d5fe 100644
 --- a/test/integration/targets/module_utils/module_utils/sub/bam.py
 +++ b/test/integration/targets/module_utils/module_utils/sub/bam.py
 @@ -1,3 +1,3 @@
@@ -811,7 +663,7 @@ index 566f8b7..0814485 100644
 =20
  bam =3D "BAM FROM sub/bam.py"
 diff --git a/test/integration/targets/module_utils/module_utils/sub/bam/=
bam.py b/test/integration/targets/module_utils/module_utils/sub/bam/bam.p=
y
-index b7ed707..97f9eed 100644
+index b7ed707211e..97f9eedcdb7 100644
 --- a/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
 +++ b/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
 @@ -1,3 +1,3 @@
@@ -820,7 +672,7 @@ index b7ed707..97f9eed 100644
 =20
  bam =3D "BAM FROM sub/bam/bam.py"
 diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/=
bam.py b/test/integration/targets/module_utils/module_utils/sub/bar/bam.p=
y
-index 02fafd4..3a93360 100644
+index 02fafd40f3f..3a93360c69e 100644
 --- a/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
 +++ b/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
 @@ -1,3 +1,3 @@
@@ -829,7 +681,7 @@ index 02fafd4..3a93360 100644
 =20
  bam =3D "BAM FROM sub/bar/bam.py"
 diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/=
bar.py b/test/integration/targets/module_utils/module_utils/sub/bar/bar.p=
y
-index 8566901..40f0c94 100644
+index 8566901f044..40f0c9446c9 100644
 --- a/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
 +++ b/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
 @@ -1,3 +1,3 @@
@@ -837,396 +689,135 @@ index 8566901..40f0c94 100644
 +#!/usr/bin/env python3
 =20
  bar =3D "BAR FROM sub/bar/bar.py"
-diff --git a/test/integration/targets/service/files/ansible_test_service=
 b/test/integration/targets/service/files/ansible_test_service
-index 682edeb..e858909 100755
---- a/test/integration/targets/service/files/ansible_test_service
-+++ b/test/integration/targets/service/files/ansible_test_service
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-=20
- # this is mostly based off of the code found here:
- # http://code.activestate.com/recipes/278731-creating-a-daemon-the-pyth=
on-way/
-diff --git a/test/runner/ansible-test b/test/runner/ansible-test
-index 801f07f..804aa8f 100755
---- a/test/runner/ansible-test
-+++ b/test/runner/ansible-test
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # PYTHON_ARGCOMPLETE_OK
- """Test runner for all Ansible tests."""
-=20
-diff --git a/test/runner/injector/ansible b/test/runner/injector/ansible
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible
-+++ b/test/runner/injector/ansible
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-console b/test/runner/injector=
/ansible-console
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-console
-+++ b/test/runner/injector/ansible-console
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-doc b/test/runner/injector/ans=
ible-doc
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-doc
-+++ b/test/runner/injector/ansible-doc
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-galaxy b/test/runner/injector/=
ansible-galaxy
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-galaxy
-+++ b/test/runner/injector/ansible-galaxy
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-playbook b/test/runner/injecto=
r/ansible-playbook
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-playbook
-+++ b/test/runner/injector/ansible-playbook
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-pull b/test/runner/injector/an=
sible-pull
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-pull
-+++ b/test/runner/injector/ansible-pull
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/ansible-vault b/test/runner/injector/a=
nsible-vault
-index 57241c9..c463946 100755
---- a/test/runner/injector/ansible-vault
-+++ b/test/runner/injector/ansible-vault
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover b/test/runner/injector/cover
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover
-+++ b/test/runner/injector/cover
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover2 b/test/runner/injector/cover2
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover2
-+++ b/test/runner/injector/cover2
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover2.4 b/test/runner/injector/cover2=
.4
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover2.4
-+++ b/test/runner/injector/cover2.4
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover2.6 b/test/runner/injector/cover2=
.6
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover2.6
-+++ b/test/runner/injector/cover2.6
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover2.7 b/test/runner/injector/cover2=
.7
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover2.7
-+++ b/test/runner/injector/cover2.7
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover3 b/test/runner/injector/cover3
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover3
-+++ b/test/runner/injector/cover3
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover3.5 b/test/runner/injector/cover3=
.5
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover3.5
-+++ b/test/runner/injector/cover3.5
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/cover3.6 b/test/runner/injector/cover3=
.6
-index 57241c9..c463946 100755
---- a/test/runner/injector/cover3.6
-+++ b/test/runner/injector/cover3.6
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/injector.py b/test/runner/injector/inj=
ector.py
-index 57241c9..c463946 100755
---- a/test/runner/injector/injector.py
-+++ b/test/runner/injector/injector.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/pytest b/test/runner/injector/pytest
-index 57241c9..c463946 100755
---- a/test/runner/injector/pytest
-+++ b/test/runner/injector/pytest
+diff --git a/test/integration/targets/pause/test-pause.py b/test/integra=
tion/targets/pause/test-pause.py
+index 3703470d065..dd14b2810d6 100755
+--- a/test/integration/targets/pause/test-pause.py
++++ b/test/integration/targets/pause/test-pause.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """Code coverage wrapper."""
 =20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner b/test/runner/injector/runner
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner
-+++ b/test/runner/injector/runner
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/test/integration/targets/pip/files/setup.py b/test/integrat=
ion/targets/pip/files/setup.py
+index aaf21875ca2..2835719e4f2 100755
+--- a/test/integration/targets/pip/files/setup.py
++++ b/test/integration/targets/pip/files/setup.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """Code coverage wrapper."""
 =20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner2 b/test/runner/injector/runner2
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner2
-+++ b/test/runner/injector/runner2
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/test/integration/targets/service/files/ansible_test_service=
.py b/test/integration/targets/service/files/ansible_test_service.py
+index 522493fcc77..b3aaf7f6b43 100644
+--- a/test/integration/targets/service/files/ansible_test_service.py
++++ b/test/integration/targets/service/files/ansible_test_service.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """Code coverage wrapper."""
 =20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner2.4 b/test/runner/injector/runne=
r2.4
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner2.4
-+++ b/test/runner/injector/runner2.4
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner2.6 b/test/runner/injector/runne=
r2.6
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner2.6
-+++ b/test/runner/injector/runner2.6
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner2.7 b/test/runner/injector/runne=
r2.7
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner2.7
-+++ b/test/runner/injector/runner2.7
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner3 b/test/runner/injector/runner3
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner3
-+++ b/test/runner/injector/runner3
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner3.5 b/test/runner/injector/runne=
r3.5
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner3.5
-+++ b/test/runner/injector/runner3.5
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- """Code coverage wrapper."""
-=20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/injector/runner3.6 b/test/runner/injector/runne=
r3.6
-index 57241c9..c463946 100755
---- a/test/runner/injector/runner3.6
-+++ b/test/runner/injector/runner3.6
+ # this is mostly based off of the code found here:
+ # http://code.activestate.com/recipes/278731-creating-a-daemon-the-pyth=
on-way/
+diff --git a/test/integration/targets/service_facts/files/ansible_test_s=
ervice.py b/test/integration/targets/service_facts/files/ansible_test_ser=
vice.py
+index 19f1e291388..609218325d6 100644
+--- a/test/integration/targets/service_facts/files/ansible_test_service.=
py
++++ b/test/integration/targets/service_facts/files/ansible_test_service.=
py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- """Code coverage wrapper."""
 =20
- from __future__ import absolute_import, print_function
-diff --git a/test/runner/retry.py b/test/runner/retry.py
-index 4972131..a9ffb07 100755
---- a/test/runner/retry.py
-+++ b/test/runner/retry.py
+ # this is mostly based off of the code found here:
+ # http://code.activestate.com/recipes/278731-creating-a-daemon-the-pyth=
on-way/
+diff --git a/test/integration/targets/template/role_filter/filter_plugin=
s/myplugin.py b/test/integration/targets/template/role_filter/filter_plug=
ins/myplugin.py
+index b0a8889439a..90c83b582b4 100644
+--- a/test/integration/targets/template/role_filter/filter_plugins/myplu=
gin.py
++++ b/test/integration/targets/template/role_filter/filter_plugins/myplu=
gin.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # PYTHON_ARGCOMPLETE_OK
- """Automatically retry failed commands."""
 =20
-diff --git a/test/runner/test.py b/test/runner/test.py
-index 801f07f..804aa8f 100755
---- a/test/runner/test.py
-+++ b/test/runner/test.py
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/test/integration/targets/throttle/test_throttle.py b/test/i=
ntegration/targets/throttle/test_throttle.py
+index 1a5bdd30789..344bcf0f868 100755
+--- a/test/integration/targets/throttle/test_throttle.py
++++ b/test/integration/targets/throttle/test_throttle.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
- # PYTHON_ARGCOMPLETE_OK
- """Test runner for all Ansible tests."""
 =20
-diff --git a/test/sanity/code-smell/ansible-var-precedence-check.py b/te=
st/sanity/code-smell/ansible-var-precedence-check.py
-index e10c097..13c7a73 100755
---- a/test/sanity/code-smell/ansible-var-precedence-check.py
-+++ b/test/sanity/code-smell/ansible-var-precedence-check.py
+ from __future__ import (absolute_import, division, print_function)
+ __metaclass__ =3D type
+diff --git a/test/integration/targets/var_precedence/ansible-var-precede=
nce-check.py b/test/integration/targets/var_precedence/ansible-var-preced=
ence-check.py
+index fc31688be2e..f964bbe8d6d 100755
+--- a/test/integration/targets/var_precedence/ansible-var-precedence-che=
ck.py
++++ b/test/integration/targets/var_precedence/ansible-var-precedence-che=
ck.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
 =20
  # A tool to check the order of precedence for ansible variables
  # https://github.com/ansible/ansible/blob/devel/test/integration/test_v=
ar_precedence.yml
-diff --git a/test/sanity/code-smell/integration-aliases.py b/test/sanity=
/code-smell/integration-aliases.py
-index 50301e3..ac53ca9 100755
---- a/test/sanity/code-smell/integration-aliases.py
-+++ b/test/sanity/code-smell/integration-aliases.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
-=20
- import os
- import textwrap
-diff --git a/test/sanity/code-smell/shebang.sh b/test/sanity/code-smell/=
shebang.sh
-index 76d72c1..565a198 100755
---- a/test/sanity/code-smell/shebang.sh
-+++ b/test/sanity/code-smell/shebang.sh
-@@ -8,11 +8,11 @@ grep '^#!' -rIn . \
-     -e '^\./test/integration/targets/[^/]*/library/[^/]*:#!powershell$'=
 \
-     -e '^\./test/integration/targets/[^/]*/library/[^/]*:#!/usr/bin/pyt=
hon$' \
-     -e '^\./test/integration/targets/module_precedence/.*lib.*:#!/usr/b=
in/python$' \
--    -e '^\./hacking/cherrypick.py:#!/usr/bin/env python3$' \
-+    -e '^\./hacking/cherrypick.py:#!/usr/bin/env python33$' \
-     -e ':#!/bin/sh$' \
-     -e ':#!/bin/bash( -[eux]|$)' \
-     -e ':#!/usr/bin/make -f$' \
--    -e ':#!/usr/bin/env python$' \
-+    -e ':#!/usr/bin/env python3$' \
-     -e ':#!/usr/bin/env bash$' \
-     -e ':#!/usr/bin/env fish$' \
-=20
-diff --git a/test/sanity/validate-modules/test_validate_modules_regex.py=
 b/test/sanity/validate-modules/test_validate_modules_regex.py
-index 0e41ee7..8a86b07 100644
---- a/test/sanity/validate-modules/test_validate_modules_regex.py
-+++ b/test/sanity/validate-modules/test_validate_modules_regex.py
+diff --git a/test/lib/ansible_test/_internal/util_common.py b/test/lib/a=
nsible_test/_internal/util_common.py
+index 79ff6c03ae3..730c87d3fc1 100644
+--- a/test/lib/ansible_test/_internal/util_common.py
++++ b/test/lib/ansible_test/_internal/util_common.py
+@@ -271,7 +271,7 @@ def get_injector_path() -> str:
+     ])
+=20
+     scripts =3D (
+-        ('python.py', '/usr/bin/env python', MODE_FILE_EXECUTE),
++        ('python.py', '/usr/bin/env python3', MODE_FILE_EXECUTE),
+         ('virtualenv.sh', '/usr/bin/env bash', MODE_FILE),
+     )
+=20
+diff --git a/test/lib/ansible_test/_util/controller/sanity/code-smell/sh=
ebang.py b/test/lib/ansible_test/_util/controller/sanity/code-smell/sheba=
ng.py
+index b0b13197839..9535c3b4819 100644
+--- a/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.p=
y
++++ b/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.p=
y
+@@ -16,14 +16,14 @@ def main():
+         b'#!/usr/bin/env bash',
+         b'#!/usr/bin/env fish',
+         b'#!/usr/bin/env pwsh',
+-        b'#!/usr/bin/env python',
++        b'#!/usr/bin/env python3',
+         b'#!/usr/bin/make -f',
+     ])
+=20
+     integration_shebangs =3D set([
+         b'#!/bin/sh',
+         b'#!/usr/bin/env bash',
+-        b'#!/usr/bin/env python',
++        b'#!/usr/bin/env python3',
+     ])
+=20
+     module_shebangs =3D {
+diff --git a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stu=
b.py b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
+index 930654fc1e7..bbf50369d7d 100755
+--- a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
++++ b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
 @@ -1,4 +1,4 @@
 -#!/usr/bin/env python
 +#!/usr/bin/env python3
+ # PYTHON_ARGCOMPLETE_OK
+ """Command line entry point for ansible-test."""
 =20
- # This is a standalone test for the regex inside validate-modules
- # It is not suitable to add to the make tests target because the
-diff --git a/test/sanity/validate-modules/validate-modules b/test/sanity=
/validate-modules/validate-modules
-index d03bff1..201cd41 100755
---- a/test/sanity/validate-modules/validate-modules
-+++ b/test/sanity/validate-modules/validate-modules
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # -*- coding: utf-8 -*-
- #
- # Copyright (C) 2015 Matt Martz <matt@sivel.net>
 diff --git a/test/units/executor/module_common/test_module_common.py b/t=
est/units/executor/module_common/test_module_common.py
-index edbf836..1f3bb5a 100644
+index fa6add8cd61..fcfd096e546 100644
 --- a/test/units/executor/module_common/test_module_common.py
 +++ b/test/units/executor/module_common/test_module_common.py
-@@ -114,5 +114,5 @@ class TestGetShebang(object):
+@@ -132,8 +132,8 @@ class TestGetShebang:
              (u'#!/usr/bin/python3 -tt -OO', u'/usr/bin/python3')
 =20
-     def test_python_via_env(self):
--        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_i=
nterpreter': u'/usr/bin/env python'}) =3D=3D \
+     def test_python_via_env(self, templar):
+-        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_i=
nterpreter': u'/usr/bin/env python'}, templar) =3D=3D \
 -            (u'#!/usr/bin/env python', u'/usr/bin/env python')
-+        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_i=
nterpreter': u'/usr/bin/env python3'}) =3D=3D \
-+            (u'#!/usr/bin/env python3', u'/usr/bin/env python')
-diff --git a/test/units/modules/network/nxos/test_nxos_config.py b/test/=
units/modules/network/nxos/test_nxos_config.py
-index 8e3a59c..46764a8 100644
---- a/test/units/modules/network/nxos/test_nxos_config.py
-+++ b/test/units/modules/network/nxos/test_nxos_config.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- #
- # (c) 2016 Red Hat Inc.
- #
-diff --git a/test/utils/shippable/ansible-core-ci b/test/utils/shippable=
/ansible-core-ci
-index e91b426..44f8fb9 100755
---- a/test/utils/shippable/ansible-core-ci
-+++ b/test/utils/shippable/ansible-core-ci
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
++        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_i=
nterpreter': u'/usr/bin/env python3'}, templar) =3D=3D \
++            (u'#!/usr/bin/env python3', u'/usr/bin/env python3')
 =20
- # (c) 2016 Matt Clay <matt@mystile.com>
- #
-diff --git a/test/utils/shippable/download.py b/test/utils/shippable/dow=
nload.py
-index cbda144..e86c8e6 100755
---- a/test/utils/shippable/download.py
-+++ b/test/utils/shippable/download.py
-@@ -1,4 +1,4 @@
--#!/usr/bin/env python
-+#!/usr/bin/env python3
- # PYTHON_ARGCOMPLETE_OK
 =20
- # (c) 2016 Red Hat, Inc.
+ class TestDetectionRegexes:
 --=20
-2.7.4
+2.25.1
=20
diff --git a/recipes-devtools/python/python3-ansible_2.3.1.0.bb b/recipes=
-devtools/python/python3-ansible_2.14.5.bb
similarity index 100%
rename from recipes-devtools/python/python3-ansible_2.3.1.0.bb
rename to recipes-devtools/python/python3-ansible_2.14.5.bb
--=20
2.25.1


