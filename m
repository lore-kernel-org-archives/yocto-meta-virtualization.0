Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E850AC4332F
	for <webhook@archiver.kernel.org>; Tue,  7 Nov 2023 01:47:19 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web11.1082.1699321631307826764
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 06 Nov 2023 17:47:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vqeu3OdD;
 spf=pass (domain: gmail.com, ip: 209.85.222.182, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-779fb118fe4so337150285a.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 06 Nov 2023 17:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699321630; x=1699926430; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YPv02J6+sQ5va7jzR0mrjZW2IoKoU4yiI0VfHGwYKXk=;
        b=Vqeu3OdDWJvDGkEbFPIXfJn6DfKK8kSeM+cETj2RTLH0kES7b7hOZc7Cq3PsXpJXtd
         QoIv1tWujVXBp7EBzoqaJ/rHP5ITBjGguGBRQV4XihhFNWKYmlH0B0daJOEXFebXspEW
         6WCqwdfbz3a5zUzGIYb8Y3ot5HSP5ZisFGkhcB8t8uMHpAtXqqRO953vhS2kkUE+JXqT
         jA2NcyHZJKQltg14sydjTF5I1kzu4W5ZQYW4gr1MD+iv2vtO0avYqRkMAiLcoJXdL7eX
         AtQo9zgyDhuR4Xh+UDc97dk2lEELLQv90xq0t3E4ckTiARBzVcUuxJ+XZ22f/A29t6Qt
         mSfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699321630; x=1699926430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YPv02J6+sQ5va7jzR0mrjZW2IoKoU4yiI0VfHGwYKXk=;
        b=tedHOIetI/LWbyV2IBxUw1GU9HEpjm2lSA96nKPx4bbAr/+n7M/2DZQWiok7pC2zmv
         wWCvH9lFIJSqMfLXrBQPQygBW4de2LsoDfAYRGlSWGGv4sflyKSBC7igjzYsdYOZYf6Z
         4mDq8Uq0yvInS6/CyPbjmERsxvdpwwO3KY9TcDEA2TjuxMs91+VlOYirgt54B1phMO/X
         O5Jk3sM8EtnAyQcxrKc/A8wWWzMI0ib6JhjYaxM/WMRv4VGGkwoKd3YQhxjGrFmaYfKJ
         odSzui8x2qEtYNbxF0gmGTPyCiH6qAWvFnAxQXMfCB0Yb3z9RQ6k6LxV+pRgOK5HVmVb
         PWJQ==
X-Gm-Message-State: AOJu0YxEBLtIYOZFytWOByspB4HUHIIiF6nEeeIHaRZzNXCOmsfwtNZ1
	h9BfkVvmfViy2VP/EKgxiKyNEV9ZMqxOccwD
X-Google-Smtp-Source: AGHT+IGdpHVEWbvbsYOYNKnixT1si/I1WJEh7rkv3v925cwRPG6ZcozmOb/ug75+U/fnP0HwzxzLgw==
X-Received: by 2002:ad4:5c4a:0:b0:66d:627e:24c0 with SMTP id a10-20020ad45c4a000000b0066d627e24c0mr44090882qva.38.1699321629719;
        Mon, 06 Nov 2023 17:47:09 -0800 (PST)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id e5-20020ad44425000000b0064f5d70d072sm3971591qvt.37.2023.11.06.17.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 17:47:09 -0800 (PST)
Date: Tue, 7 Nov 2023 01:47:07 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: narpat.mali@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][kirkstone][PATCH 1/2] python3-ansible:
 Upgrade to 2.14.11
Message-ID: <ZUmXG4YZ38b/mxfE@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106145106.2671320-2-narpat.mali@windriver.com>
 <20231106145106.2671320-1-narpat.mali@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 07 Nov 2023 01:47:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8429

merged.

Bruce

In message: [meta-virtualization][kirkstone][PATCH 1/2] python3-ansible: Upgrade to 2.14.11
on 06/11/2023 Narpat Mali via lists.yoctoproject.org wrote:

> From: Narpat Mali <narpat.mali@windriver.com>
> 
> This upgrade incorporates the CVE-2023-5115 fix and other bug fixes.
> Release Notes:
> https://github.com/ansible/ansible/blob/v2.14.11/changelogs/CHANGELOG-v2.14.rst#v2-14-11
> 
> Rebase the patch python3-ensure-py-scripts-use-py3-for-shebang.patch to new version.
> Reference upstream master commit:
> https://git.yoctoproject.org/meta-cloud-services/commit/?id=7ecb54163f6252cfbecfd9f7f363536c88dbb58a
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  recipes-devtools/python/python-ansible.inc    |    8 +-
>  ...nsure-py-scripts-use-py3-for-shebang.patch | 1427 ++++++-----------
>  ..._2.3.1.0.bb => python3-ansible_2.14.11.bb} |    0
>  3 files changed, 482 insertions(+), 953 deletions(-)
>  rename recipes-devtools/python/{python3-ansible_2.3.1.0.bb => python3-ansible_2.14.11.bb} (100%)
> 
> diff --git a/recipes-devtools/python/python-ansible.inc b/recipes-devtools/python/python-ansible.inc
> index 0bb663ae..c31d10ed 100644
> --- a/recipes-devtools/python/python-ansible.inc
> +++ b/recipes-devtools/python/python-ansible.inc
> @@ -6,13 +6,11 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=8f0e2cd40e05189ec81232da84bd6e1a"
>  
>  SRCNAME = "ansible"
>  
> -SRC_URI = "http://releases.ansible.com/ansible/${SRCNAME}-${PV}.tar.gz"
> +SRC_URI = "git://github.com/ansible/ansible.git;protocol=https;branch=stable-2.14"
>  
> -SRC_URI[md5sum] = "b1be8f05864a07c06b8a767dcd48ba1b"
> -SRC_URI[sha256sum] = "cd4b8f53720fcd0c351156b840fdd15ecfbec22c951b5406ec503de49d40b9f5"
> +SRCREV = "dcdb718f7a4c03f174030db425eee2a551ab2698"
>  
> -
> -S = "${WORKDIR}/${SRCNAME}-${PV}"
> +S = "${WORKDIR}/git"
>  
>  ANSIBLE_WHITELIST_MODULES ?= "commands files system network/ovs __pycache__ service"
>  
> diff --git a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> index e98eb46c..67142fc0 100644
> --- a/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> +++ b/recipes-devtools/python/python3-ansible/python3-ensure-py-scripts-use-py3-for-shebang.patch
> @@ -1,799 +1,581 @@
> -From 66b824da2fadfd5760040be244f89fa8320df55b Mon Sep 17 00:00:00 2001
> +From 5f7c3d72eec080b2e1c34565babfd53528fc4770 Mon Sep 17 00:00:00 2001
>  From: Mark Asselstine <mark.asselstine@windriver.com>
> -Date: Thu, 13 Jul 2017 14:11:46 -0400
> +Date: Thu, 11 May 2023 17:05:54 +0800
>  Subject: [PATCH] python3: ensure py scripts use py3 for shebang
>  
> +Upstream-Status: Pending
> +
>  Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +
> +Rebase to 2.14.11
> +Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
>  ---
> - bin/ansible                                                           | 2 +-
> - bin/ansible-connection                                                | 2 +-
> - bin/ansible-console                                                   | 2 +-
> - bin/ansible-doc                                                       | 2 +-
> - bin/ansible-galaxy                                                    | 2 +-
> - bin/ansible-playbook                                                  | 2 +-
> - bin/ansible-pull                                                      | 2 +-
> - bin/ansible-vault                                                     | 2 +-
> - contrib/inventory/abiquo.py                                           | 2 +-
> - contrib/inventory/apache-libcloud.py                                  | 2 +-
> - contrib/inventory/apstra_aos.py                                       | 2 +-
> - contrib/inventory/azure_rm.py                                         | 2 +-
> - contrib/inventory/brook.py                                            | 2 +-
> - contrib/inventory/cloudforms.py                                       | 2 +-
> - contrib/inventory/cloudstack.py                                       | 2 +-
> - contrib/inventory/cobbler.py                                          | 2 +-
> - contrib/inventory/collins.py                                          | 2 +-
> - contrib/inventory/consul_io.py                                        | 2 +-
> - contrib/inventory/digital_ocean.py                                    | 2 +-
> - contrib/inventory/docker.py                                           | 2 +-
> - contrib/inventory/ec2.py                                              | 2 +-
> - contrib/inventory/fleet.py                                            | 2 +-
> - contrib/inventory/foreman.py                                          | 2 +-
> - contrib/inventory/freeipa.py                                          | 2 +-
> - contrib/inventory/gce.py                                              | 2 +-
> - contrib/inventory/jail.py                                             | 2 +-
> - contrib/inventory/landscape.py                                        | 2 +-
> - contrib/inventory/libvirt_lxc.py                                      | 2 +-
> - contrib/inventory/linode.py                                           | 2 +-
> - contrib/inventory/lxc_inventory.py                                    | 2 +-
> - contrib/inventory/mdt_dynamic_inventory.py                            | 2 +-
> - contrib/inventory/nagios_livestatus.py                                | 2 +-
> - contrib/inventory/nagios_ndo.py                                       | 2 +-
> - contrib/inventory/nova.py                                             | 2 +-
> - contrib/inventory/nsot.py                                             | 2 +-
> - contrib/inventory/openshift.py                                        | 2 +-
> - contrib/inventory/openstack.py                                        | 2 +-
> - contrib/inventory/openvz.py                                           | 2 +-
> - contrib/inventory/ovirt.py                                            | 2 +-
> - contrib/inventory/ovirt4.py                                           | 2 +-
> - contrib/inventory/packet_net.py                                       | 2 +-
> - contrib/inventory/proxmox.py                                          | 2 +-
> - contrib/inventory/rackhd.py                                           | 2 +-
> - contrib/inventory/rax.py                                              | 2 +-
> - contrib/inventory/rhv.py                                              | 2 +-
> - contrib/inventory/rudder.py                                           | 2 +-
> - contrib/inventory/serf.py                                             | 2 +-
> - contrib/inventory/softlayer.py                                        | 2 +-
> - contrib/inventory/spacewalk.py                                        | 2 +-
> - contrib/inventory/ssh_config.py                                       | 2 +-
> - contrib/inventory/stacki.py                                           | 2 +-
> - contrib/inventory/vagrant.py                                          | 2 +-
> - contrib/inventory/vbox.py                                             | 2 +-
> - contrib/inventory/vmware.py                                           | 2 +-
> - contrib/inventory/vmware_inventory.py                                 | 2 +-
> - contrib/inventory/windows_azure.py                                    | 2 +-
> - contrib/inventory/zabbix.py                                           | 2 +-
> - contrib/inventory/zone.py                                             | 2 +-
> - docs/docsite/rst/dev_guide/developing_api.rst                         | 2 +-
> - hacking/dump_playbook_attributes.py                                   | 2 +-
> - hacking/module_formatter.py                                           | 2 +-
> - lib/ansible/modules/web_infrastructure/django_manage.py               | 2 +-
> - lib/ansible/modules/windows/win_file_version.py                       | 2 +-
> - lib/ansible/modules/windows/win_firewall_rule.py                      | 2 +-
> - test/compile/compile.py                                               | 2 +-
> - test/integration/cleanup_rax.py                                       | 2 +-
> - .../targets/embedded_module/library/test_integration_module           | 2 +-
> - test/integration/targets/module_utils/module_utils/foo.py             | 2 +-
> - test/integration/targets/module_utils/module_utils/sub/bam.py         | 2 +-
> - test/integration/targets/module_utils/module_utils/sub/bam/bam.py     | 2 +-
> - test/integration/targets/module_utils/module_utils/sub/bar/bam.py     | 2 +-
> - test/integration/targets/module_utils/module_utils/sub/bar/bar.py     | 2 +-
> - test/integration/targets/service/files/ansible_test_service           | 2 +-
> - test/runner/ansible-test                                              | 2 +-
> - test/runner/injector/ansible                                          | 2 +-
> - test/runner/injector/ansible-console                                  | 2 +-
> - test/runner/injector/ansible-doc                                      | 2 +-
> - test/runner/injector/ansible-galaxy                                   | 2 +-
> - test/runner/injector/ansible-playbook                                 | 2 +-
> - test/runner/injector/ansible-pull                                     | 2 +-
> - test/runner/injector/ansible-vault                                    | 2 +-
> - test/runner/injector/cover                                            | 2 +-
> - test/runner/injector/cover2                                           | 2 +-
> - test/runner/injector/cover2.4                                         | 2 +-
> - test/runner/injector/cover2.6                                         | 2 +-
> - test/runner/injector/cover2.7                                         | 2 +-
> - test/runner/injector/cover3                                           | 2 +-
> - test/runner/injector/cover3.5                                         | 2 +-
> - test/runner/injector/cover3.6                                         | 2 +-
> - test/runner/injector/injector.py                                      | 2 +-
> - test/runner/injector/pytest                                           | 2 +-
> - test/runner/injector/runner                                           | 2 +-
> - test/runner/injector/runner2                                          | 2 +-
> - test/runner/injector/runner2.4                                        | 2 +-
> - test/runner/injector/runner2.6                                        | 2 +-
> - test/runner/injector/runner2.7                                        | 2 +-
> - test/runner/injector/runner3                                          | 2 +-
> - test/runner/injector/runner3.5                                        | 2 +-
> - test/runner/injector/runner3.6                                        | 2 +-
> - test/runner/retry.py                                                  | 2 +-
> - test/runner/test.py                                                   | 2 +-
> - test/sanity/code-smell/ansible-var-precedence-check.py                | 2 +-
> - test/sanity/code-smell/integration-aliases.py                         | 2 +-
> - test/sanity/code-smell/shebang.sh                                     | 4 ++--
> - test/sanity/validate-modules/test_validate_modules_regex.py           | 2 +-
> - test/sanity/validate-modules/validate-modules                         | 2 +-
> - test/units/executor/module_common/test_module_common.py               | 4 ++--
> - test/units/modules/network/nxos/test_nxos_config.py                   | 2 +-
> - test/utils/shippable/ansible-core-ci                                  | 2 +-
> - test/utils/shippable/download.py                                      | 2 +-
> - 121 files changed, 123 insertions(+), 123 deletions(-)
> + .azure-pipelines/scripts/combine-coverage.py                  | 2 +-
> + .azure-pipelines/scripts/publish-codecov.py                   | 2 +-
> + .azure-pipelines/scripts/time-command.py                      | 2 +-
> + hacking/ansible-profile                                       | 2 +-
> + hacking/azp/download.py                                       | 2 +-
> + hacking/azp/get_recent_coverage_runs.py                       | 2 +-
> + hacking/azp/incidental.py                                     | 2 +-
> + hacking/azp/run.py                                            | 2 +-
> + hacking/backport/backport_of_line_adder.py                    | 2 +-
> + hacking/create_deprecation_bug_reports.py                     | 2 +-
> + hacking/fix_test_syntax.py                                    | 2 +-
> + hacking/get_library.py                                        | 2 +-
> + hacking/report.py                                             | 2 +-
> + hacking/return_skeleton_generator.py                          | 2 +-
> + hacking/test-module.py                                        | 2 +-
> + hacking/tests/gen_distribution_version_testcase.py            | 2 +-
> + hacking/update-sanity-requirements.py                         | 2 +-
> + lib/ansible/cli/adhoc.py                                      | 2 +-
> + lib/ansible/cli/config.py                                     | 2 +-
> + lib/ansible/cli/console.py                                    | 2 +-
> + lib/ansible/cli/doc.py                                        | 2 +-
> + lib/ansible/cli/galaxy.py                                     | 2 +-
> + lib/ansible/cli/inventory.py                                  | 2 +-
> + lib/ansible/cli/playbook.py                                   | 2 +-
> + lib/ansible/cli/pull.py                                       | 2 +-
> + lib/ansible/cli/scripts/ansible_connection_cli_stub.py        | 2 +-
> + lib/ansible/cli/vault.py                                      | 2 +-
> + packaging/cli-doc/build.py                                    | 2 +-
> + packaging/release.py                                          | 2 +-
> + .../targets/ansible-galaxy-collection/files/build_bad_tar.py  | 2 +-
> + .../targets/ansible-galaxy-role/files/create-role-archive.py  | 2 +-
> + test/integration/targets/ansible-test-container/runme.py      | 2 +-
> + .../targets/ansible-test-integration-targets/test.py          | 2 +-
> + .../ansible_collections/ns/col/run-with-pty.py                | 2 +-
> + .../ns/col/tests/integration/targets/no-tty/assert-no-tty.py  | 2 +-
> + .../ansible_collections/ns/col/scripts/env_python.py          | 2 +-
> + .../ns/col/tests/integration/targets/valid/env_python.py      | 2 +-
> + test/integration/targets/ansible-test/venv-pythons.py         | 2 +-
> + test/integration/targets/ansible-vault/faux-editor.py         | 2 +-
> + test/integration/targets/ansible-vault/password-script.py     | 2 +-
> + test/integration/targets/ansible-vault/test-vault-client.py   | 2 +-
> + .../targets/builtin_vars_prompt/test-vars_prompt.py           | 2 +-
> + test/integration/targets/cli/test-cli.py                      | 2 +-
> + test/integration/targets/cli/test_k_and_K.py                  | 2 +-
> + test/integration/targets/collection/update-ignore.py          | 2 +-
> + test/integration/targets/debugger/test_run_once.py            | 2 +-
> + test/integration/targets/fork_safe_stdio/run-with-pty.py      | 2 +-
> + test/integration/targets/gathering/uuid.fact                  | 2 +-
> + test/integration/targets/gathering_facts/uuid.fact            | 2 +-
> + test/integration/targets/group/files/gidget.py                | 2 +-
> + test/integration/targets/module_utils/module_utils/foo.py     | 2 +-
> + test/integration/targets/module_utils/module_utils/sub/bam.py | 2 +-
> + .../targets/module_utils/module_utils/sub/bam/bam.py          | 2 +-
> + .../targets/module_utils/module_utils/sub/bar/bam.py          | 2 +-
> + .../targets/module_utils/module_utils/sub/bar/bar.py          | 2 +-
> + test/integration/targets/packaging_cli-doc/verify.py          | 2 +-
> + test/integration/targets/pause/test-pause.py                  | 2 +-
> + test/integration/targets/pip/files/setup.py                   | 2 +-
> + .../integration/targets/service/files/ansible_test_service.py | 2 +-
> + .../targets/service_facts/files/ansible_test_service.py       | 2 +-
> + .../targets/template/role_filter/filter_plugins/myplugin.py   | 2 +-
> + test/integration/targets/throttle/test_throttle.py            | 2 +-
> + .../targets/var_precedence/ansible-var-precedence-check.py    | 2 +-
> + test/lib/ansible_test/_internal/util_common.py                | 2 +-
> + .../_util/controller/sanity/code-smell/shebang.py             | 4 ++--
> + .../ansible_test/_util/target/cli/ansible_test_cli_stub.py    | 2 +-
> + test/units/executor/module_common/test_module_common.py       | 4 ++--
> + 67 files changed, 69 insertions(+), 69 deletions(-)
>  
> -diff --git a/bin/ansible b/bin/ansible
> -index 24550b9..0587499 100755
> ---- a/bin/ansible
> -+++ b/bin/ansible
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-connection b/bin/ansible-connection
> -index 93d787e..f0b9aa3 100755
> ---- a/bin/ansible-connection
> -+++ b/bin/ansible-connection
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - # (c) 2016, Ansible, Inc. <support@ansible.com>
> - #
> -diff --git a/bin/ansible-console b/bin/ansible-console
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-console
> -+++ b/bin/ansible-console
> +diff --git a/.azure-pipelines/scripts/combine-coverage.py b/.azure-pipelines/scripts/combine-coverage.py
> +index 506ade6460..15bee40234 100755
> +--- a/.azure-pipelines/scripts/combine-coverage.py
> ++++ b/.azure-pipelines/scripts/combine-coverage.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-doc b/bin/ansible-doc
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-doc
> -+++ b/bin/ansible-doc
> + """
> + Combine coverage data from multiple jobs, keeping the data only from the most recent attempt from each job.
> + Coverage artifacts must be named using the format: "Coverage $(System.JobAttempt) {StableUniqueNameForEachJob}"
> +diff --git a/.azure-pipelines/scripts/publish-codecov.py b/.azure-pipelines/scripts/publish-codecov.py
> +index f2bc4b84b3..01ad32f494 100755
> +--- a/.azure-pipelines/scripts/publish-codecov.py
> ++++ b/.azure-pipelines/scripts/publish-codecov.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-galaxy b/bin/ansible-galaxy
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-galaxy
> -+++ b/bin/ansible-galaxy
> + """
> + Upload code coverage reports to codecov.io.
> + Multiple coverage files from multiple languages are accepted and aggregated after upload.
> +diff --git a/.azure-pipelines/scripts/time-command.py b/.azure-pipelines/scripts/time-command.py
> +index 5e8eb8d4c8..5450c48900 100755
> +--- a/.azure-pipelines/scripts/time-command.py
> ++++ b/.azure-pipelines/scripts/time-command.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Prepends a relative timestamp to each input line from stdin and writes it to stdout."""
>   
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-playbook b/bin/ansible-playbook
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-playbook
> -+++ b/bin/ansible-playbook
> + from __future__ import (absolute_import, division, print_function)
> +diff --git a/hacking/ansible-profile b/hacking/ansible-profile
> +index 6612402da6..d67526a161 100755
> +--- a/hacking/ansible-profile
> ++++ b/hacking/ansible-profile
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
>   
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-pull b/bin/ansible-pull
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-pull
> -+++ b/bin/ansible-pull
> +diff --git a/hacking/azp/download.py b/hacking/azp/download.py
> +index 117e9da5b7..89466cb17b 100755
> +--- a/hacking/azp/download.py
> ++++ b/hacking/azp/download.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
>   
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> - #
> -diff --git a/bin/ansible-vault b/bin/ansible-vault
> -index 24550b9..0587499 100755
> ---- a/bin/ansible-vault
> -+++ b/bin/ansible-vault
> + # (c) 2016 Red Hat, Inc.
> +diff --git a/hacking/azp/get_recent_coverage_runs.py b/hacking/azp/get_recent_coverage_runs.py
> +index 25e2fa8120..9b0d9b972e 100755
> +--- a/hacking/azp/get_recent_coverage_runs.py
> ++++ b/hacking/azp/get_recent_coverage_runs.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> + # (c) 2020 Red Hat, Inc.
>   #
> -diff --git a/contrib/inventory/abiquo.py b/contrib/inventory/abiquo.py
> -index 405bbbb..d318949 100755
> ---- a/contrib/inventory/abiquo.py
> -+++ b/contrib/inventory/abiquo.py
> +diff --git a/hacking/azp/incidental.py b/hacking/azp/incidental.py
> +index 87d4d213c9..7660e2ed22 100755
> +--- a/hacking/azp/incidental.py
> ++++ b/hacking/azp/incidental.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> + # PYTHON_ARGCOMPLETE_OK
>   
> - '''
> -diff --git a/contrib/inventory/apache-libcloud.py b/contrib/inventory/apache-libcloud.py
> -index 0120d2b..ce92843 100755
> ---- a/contrib/inventory/apache-libcloud.py
> -+++ b/contrib/inventory/apache-libcloud.py
> + # (c) 2020 Red Hat, Inc.
> +diff --git a/hacking/azp/run.py b/hacking/azp/run.py
> +index 00a177944f..591e6bcc4f 100755
> +--- a/hacking/azp/run.py
> ++++ b/hacking/azp/run.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
>   
> - # (c) 2013, Sebastien Goasguen <runseb@gmail.com>
> - #
> -diff --git a/contrib/inventory/apstra_aos.py b/contrib/inventory/apstra_aos.py
> -index 65838c0..48d293e 100755
> ---- a/contrib/inventory/apstra_aos.py
> -+++ b/contrib/inventory/apstra_aos.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - #
> - # (c) 2017 Apstra Inc, <community@apstra.com>
> - #
> -diff --git a/contrib/inventory/azure_rm.py b/contrib/inventory/azure_rm.py
> -index 73b8b95..87b31b0 100755
> ---- a/contrib/inventory/azure_rm.py
> -+++ b/contrib/inventory/azure_rm.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - #
> - # Copyright (c) 2016 Matt Davis, <mdavis@ansible.com>
> - #                    Chris Houseknecht, <house@redhat.com>
> -diff --git a/contrib/inventory/brook.py b/contrib/inventory/brook.py
> -index a7d4741..e4de982 100755
> ---- a/contrib/inventory/brook.py
> -+++ b/contrib/inventory/brook.py
> + # (c) 2016 Red Hat, Inc.
> +diff --git a/hacking/backport/backport_of_line_adder.py b/hacking/backport/backport_of_line_adder.py
> +index ef77ddcf40..bbec15de6a 100755
> +--- a/hacking/backport/backport_of_line_adder.py
> ++++ b/hacking/backport/backport_of_line_adder.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # Copyright 2016 Doalitic.
> + # (c) 2020, Red Hat, Inc. <relrod@redhat.com>
>   #
>   # This file is part of Ansible
> -diff --git a/contrib/inventory/cloudforms.py b/contrib/inventory/cloudforms.py
> -index 69c149b..202a6c9 100755
> ---- a/contrib/inventory/cloudforms.py
> -+++ b/contrib/inventory/cloudforms.py
> +diff --git a/hacking/create_deprecation_bug_reports.py b/hacking/create_deprecation_bug_reports.py
> +index e14df4be38..e6b9b9025c 100755
> +--- a/hacking/create_deprecation_bug_reports.py
> ++++ b/hacking/create_deprecation_bug_reports.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # vim: set fileencoding=utf-8 :
> - #
> - # Copyright (C) 2016 Guido G�nther <agx@sigxcpu.org>
> -diff --git a/contrib/inventory/cloudstack.py b/contrib/inventory/cloudstack.py
> -index a9b6b9f..d7f05ff 100755
> ---- a/contrib/inventory/cloudstack.py
> -+++ b/contrib/inventory/cloudstack.py
> + # PYTHON_ARGCOMPLETE_OK
> + """Create GitHub issues for deprecated features."""
> +
> +diff --git a/hacking/fix_test_syntax.py b/hacking/fix_test_syntax.py
> +index 7178033406..78d87ef71c 100755
> +--- a/hacking/fix_test_syntax.py
> ++++ b/hacking/fix_test_syntax.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   # -*- coding: utf-8 -*-
> + # (c) 2017, Matt Martz <matt@sivel.net>
>   #
> - # (c) 2015, Ren� Moser <mail@renemoser.net>
> -diff --git a/contrib/inventory/cobbler.py b/contrib/inventory/cobbler.py
> -index 89f9bf7..f2a9ff7 100755
> ---- a/contrib/inventory/cobbler.py
> -+++ b/contrib/inventory/cobbler.py
> +diff --git a/hacking/get_library.py b/hacking/get_library.py
> +index 23bf4a39bb..9346784398 100755
> +--- a/hacking/get_library.py
> ++++ b/hacking/get_library.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - """
> - Cobbler external inventory script
> -diff --git a/contrib/inventory/collins.py b/contrib/inventory/collins.py
> -index b7193e2..f0bc2a1 100755
> ---- a/contrib/inventory/collins.py
> -+++ b/contrib/inventory/collins.py
> + # (c) 2014, Will Thames <will@thames.id.au>
> + #
> +diff --git a/hacking/report.py b/hacking/report.py
> +index 58b3a6b915..78eed516dc 100755
> +--- a/hacking/report.py
> ++++ b/hacking/report.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """A tool to aggregate data about Ansible source and testing into a sqlite DB for reporting."""
>   
> - """
> - Collins external inventory script
> -diff --git a/contrib/inventory/consul_io.py b/contrib/inventory/consul_io.py
> -index 8106097..2cdc523 100755
> ---- a/contrib/inventory/consul_io.py
> -+++ b/contrib/inventory/consul_io.py
> +diff --git a/hacking/return_skeleton_generator.py b/hacking/return_skeleton_generator.py
> +index 7002b7899d..cff03c38e6 100755
> +--- a/hacking/return_skeleton_generator.py
> ++++ b/hacking/return_skeleton_generator.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> + # (c) 2017, Will Thames <will@thames.id.au>
>   #
> - # (c) 2015, Steve Gargan <steve.gargan@gmail.com>
> -diff --git a/contrib/inventory/digital_ocean.py b/contrib/inventory/digital_ocean.py
> -index 07c124b..0b0e587 100755
> ---- a/contrib/inventory/digital_ocean.py
> -+++ b/contrib/inventory/digital_ocean.py
> +diff --git a/hacking/test-module.py b/hacking/test-module.py
> +index 54343e07e8..38d4b8c60b 100755
> +--- a/hacking/test-module.py
> ++++ b/hacking/test-module.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - '''
> - DigitalOcean external inventory script
> -diff --git a/contrib/inventory/docker.py b/contrib/inventory/docker.py
> -index da051dd..9b88d0c 100755
> ---- a/contrib/inventory/docker.py
> -+++ b/contrib/inventory/docker.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> + # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
>   #
> - # (c) 2016 Paul Durivage <paul.durivage@gmail.com>
> - #          Chris Houseknecht <house@redhat.com>
> -diff --git a/contrib/inventory/ec2.py b/contrib/inventory/ec2.py
> -index 03b9820..9c9b2e4 100755
> ---- a/contrib/inventory/ec2.py
> -+++ b/contrib/inventory/ec2.py
> +diff --git a/hacking/tests/gen_distribution_version_testcase.py b/hacking/tests/gen_distribution_version_testcase.py
> +index 2fc5a2f932..18e67d7d12 100755
> +--- a/hacking/tests/gen_distribution_version_testcase.py
> ++++ b/hacking/tests/gen_distribution_version_testcase.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - '''
> - EC2 external inventory script
> -diff --git a/contrib/inventory/fleet.py b/contrib/inventory/fleet.py
> -index 4db4ea1..8790f2b 100755
> ---- a/contrib/inventory/fleet.py
> -+++ b/contrib/inventory/fleet.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
>   """
> - fleetctl base external inventory script. Automatically finds the IPs of the booted coreos instances and
> - returns it under the host group 'coreos'
> -diff --git a/contrib/inventory/foreman.py b/contrib/inventory/foreman.py
> -index 9a87397..2483cce 100755
> ---- a/contrib/inventory/foreman.py
> -+++ b/contrib/inventory/foreman.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # vim: set fileencoding=utf-8 :
> - #
> - # Copyright (C) 2016 Guido G�nther <agx@sigxcpu.org>,
> -diff --git a/contrib/inventory/freeipa.py b/contrib/inventory/freeipa.py
> -index a72b774..1f092b2 100755
> ---- a/contrib/inventory/freeipa.py
> -+++ b/contrib/inventory/freeipa.py
> + This script generated test_cases for test_distribution_version.py.
> +diff --git a/hacking/update-sanity-requirements.py b/hacking/update-sanity-requirements.py
> +index 997d6dbf87..16a47f0f3c 100755
> +--- a/hacking/update-sanity-requirements.py
> ++++ b/hacking/update-sanity-requirements.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """Generate frozen sanity test requirements from source requirements files."""
>   
> - import argparse
> - from ipalib import api
> -diff --git a/contrib/inventory/gce.py b/contrib/inventory/gce.py
> -index 5c58146..7616843 100755
> ---- a/contrib/inventory/gce.py
> -+++ b/contrib/inventory/gce.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # Copyright 2013 Google Inc.
> - #
> - # This file is part of Ansible
> -diff --git a/contrib/inventory/jail.py b/contrib/inventory/jail.py
> -index 98b6acf..b12289c 100755
> ---- a/contrib/inventory/jail.py
> -+++ b/contrib/inventory/jail.py
> +diff --git a/lib/ansible/cli/adhoc.py b/lib/ansible/cli/adhoc.py
> +index e90b44ce10..120948c749 100755
> +--- a/lib/ansible/cli/adhoc.py
> ++++ b/lib/ansible/cli/adhoc.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2013, Michael Scherer <misc@zarb.org>
> - #
> -diff --git a/contrib/inventory/landscape.py b/contrib/inventory/landscape.py
> -index 4b53171..7f52639 100755
> ---- a/contrib/inventory/landscape.py
> -+++ b/contrib/inventory/landscape.py
> + # Copyright: (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/config.py b/lib/ansible/cli/config.py
> +index c8d99ea09c..987700e11d 100755
> +--- a/lib/ansible/cli/config.py
> ++++ b/lib/ansible/cli/config.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2015, Marc Abramowitz <marca@surveymonkey.com>
> - #
> -diff --git a/contrib/inventory/libvirt_lxc.py b/contrib/inventory/libvirt_lxc.py
> -index 35ccf40..ba3496d 100755
> ---- a/contrib/inventory/libvirt_lxc.py
> -+++ b/contrib/inventory/libvirt_lxc.py
> + # Copyright: (c) 2017, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> + # PYTHON_ARGCOMPLETE_OK
> +diff --git a/lib/ansible/cli/console.py b/lib/ansible/cli/console.py
> +index 3125cc47a7..4a2f38bb48 100755
> +--- a/lib/ansible/cli/console.py
> ++++ b/lib/ansible/cli/console.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2013, Michael Scherer <misc@zarb.org>
> - #
> -diff --git a/contrib/inventory/linode.py b/contrib/inventory/linode.py
> -index 6fd922f..cab7a70 100755
> ---- a/contrib/inventory/linode.py
> -+++ b/contrib/inventory/linode.py
> + # Copyright: (c) 2014, Nandor Sivok <dominis@haxor.hu>
> + # Copyright: (c) 2016, Redhat Inc
> + # Copyright: (c) 2018, Ansible Project
> +diff --git a/lib/ansible/cli/doc.py b/lib/ansible/cli/doc.py
> +index 9f560bcbc6..a0d34d92f6 100755
> +--- a/lib/ansible/cli/doc.py
> ++++ b/lib/ansible/cli/doc.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - '''
> - Linode external inventory script
> -diff --git a/contrib/inventory/lxc_inventory.py b/contrib/inventory/lxc_inventory.py
> -index d82bb61..f7ac67c 100755
> ---- a/contrib/inventory/lxc_inventory.py
> -+++ b/contrib/inventory/lxc_inventory.py
> + # Copyright: (c) 2014, James Tanner <tanner.jc@gmail.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/galaxy.py b/lib/ansible/cli/galaxy.py
> +index 536964e28f..8053119bb6 100755
> +--- a/lib/ansible/cli/galaxy.py
> ++++ b/lib/ansible/cli/galaxy.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - #
> - # (c) 2015-16 Florian Haas, hastexo Professional Services GmbH
> - # <florian@hastexo.com>
> -diff --git a/contrib/inventory/mdt_dynamic_inventory.py b/contrib/inventory/mdt_dynamic_inventory.py
> -index 89ecc3e..5540a41 100755
> ---- a/contrib/inventory/mdt_dynamic_inventory.py
> -+++ b/contrib/inventory/mdt_dynamic_inventory.py
> + # Copyright: (c) 2013, James Cammarata <jcammarata@ansible.com>
> + # Copyright: (c) 2018-2021, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/inventory.py b/lib/ansible/cli/inventory.py
> +index 56c370ccf8..085ccda0fd 100755
> +--- a/lib/ansible/cli/inventory.py
> ++++ b/lib/ansible/cli/inventory.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2016, Julian Barnett <jbarnett@tableau.com>
> - #
> -diff --git a/contrib/inventory/nagios_livestatus.py b/contrib/inventory/nagios_livestatus.py
> -index e1c145e..3e250cb 100755
> ---- a/contrib/inventory/nagios_livestatus.py
> -+++ b/contrib/inventory/nagios_livestatus.py
> + # Copyright: (c) 2017, Brian Coca <bcoca@ansible.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/playbook.py b/lib/ansible/cli/playbook.py
> +index 9c091a675a..27ff7d442e 100755
> +--- a/lib/ansible/cli/playbook.py
> ++++ b/lib/ansible/cli/playbook.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2015, Yannig Perre <yannig.perre@gmail.com>
> - #
> -diff --git a/contrib/inventory/nagios_ndo.py b/contrib/inventory/nagios_ndo.py
> -index 49ec563..cc10a51 100755
> ---- a/contrib/inventory/nagios_ndo.py
> -+++ b/contrib/inventory/nagios_ndo.py
> + # (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/pull.py b/lib/ansible/cli/pull.py
> +index dc8f055b44..0e5b030eec 100755
> +--- a/lib/ansible/cli/pull.py
> ++++ b/lib/ansible/cli/pull.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2014, Jonathan Lestrelin <jonathan.lestrelin@gmail.com>
> - #
> -diff --git a/contrib/inventory/nova.py b/contrib/inventory/nova.py
> -index f8c1617..d0ad7f0 100755
> ---- a/contrib/inventory/nova.py
> -+++ b/contrib/inventory/nova.py
> + # Copyright: (c) 2012, Michael DeHaan <michael.dehaan@gmail.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
> +index 9109137e7f..f01b1ec58d 100755
> +--- a/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
> ++++ b/lib/ansible/cli/scripts/ansible_connection_cli_stub.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # (c) 2012, Marco Vito Moscaritolo <marco@agavee.com>
> - #
> -diff --git a/contrib/inventory/nsot.py b/contrib/inventory/nsot.py
> -index 62be85a..0a8dc9b 100755
> ---- a/contrib/inventory/nsot.py
> -+++ b/contrib/inventory/nsot.py
> + # Copyright: (c) 2017, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> + from __future__ import (absolute_import, division, print_function)
> +diff --git a/lib/ansible/cli/vault.py b/lib/ansible/cli/vault.py
> +index 3e60329de6..6949940747 100755
> +--- a/lib/ansible/cli/vault.py
> ++++ b/lib/ansible/cli/vault.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - '''
> - nsot
> -diff --git a/contrib/inventory/openshift.py b/contrib/inventory/openshift.py
> -index 479b808..dc398b5 100755
> ---- a/contrib/inventory/openshift.py
> -+++ b/contrib/inventory/openshift.py
> + # (c) 2014, James Tanner <tanner.jc@gmail.com>
> + # Copyright: (c) 2018, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/packaging/cli-doc/build.py b/packaging/cli-doc/build.py
> +index 878ba8eabf..64a614f3f7 100755
> +--- a/packaging/cli-doc/build.py
> ++++ b/packaging/cli-doc/build.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """Build documentation for ansible-core CLI programs."""
>   
> - # (c) 2013, Michael Scherer <misc@zarb.org>
> - #
> -diff --git a/contrib/inventory/openstack.py b/contrib/inventory/openstack.py
> -index 6679a2c..eb38742 100755
> ---- a/contrib/inventory/openstack.py
> -+++ b/contrib/inventory/openstack.py
> +diff --git a/packaging/release.py b/packaging/release.py
> +index 97c58a7424..fa5a27f794 100755
> +--- a/packaging/release.py
> ++++ b/packaging/release.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """Manage upstream ansible-core releases."""
>   
> - # Copyright (c) 2012, Marco Vito Moscaritolo <marco@agavee.com>
> - # Copyright (c) 2013, Jesse Keating <jesse.keating@rackspace.com>
> -diff --git a/contrib/inventory/openvz.py b/contrib/inventory/openvz.py
> -index 1ef8ab1..d4dfcde 100755
> ---- a/contrib/inventory/openvz.py
> -+++ b/contrib/inventory/openvz.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - #
> - # openvz.py
> -diff --git a/contrib/inventory/ovirt.py b/contrib/inventory/ovirt.py
> -index 7f505d9..ada01fa 100755
> ---- a/contrib/inventory/ovirt.py
> -+++ b/contrib/inventory/ovirt.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # Copyright 2015 IIX Inc.
> - #
> - # This file is part of Ansible
> -diff --git a/contrib/inventory/ovirt4.py b/contrib/inventory/ovirt4.py
> -index 5ee5986..9d9e940 100755
> ---- a/contrib/inventory/ovirt4.py
> -+++ b/contrib/inventory/ovirt4.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - #
> - # Copyright (c) 2016 Red Hat, Inc.
> -diff --git a/contrib/inventory/packet_net.py b/contrib/inventory/packet_net.py
> -index c40c821..d23eba1 100755
> ---- a/contrib/inventory/packet_net.py
> -+++ b/contrib/inventory/packet_net.py
> +diff --git a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
> +index 6182e865db..5829df52b5 100644
> +--- a/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
> ++++ b/test/integration/targets/ansible-galaxy-collection/files/build_bad_tar.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - '''
> - Packet.net external inventory script
> -diff --git a/contrib/inventory/proxmox.py b/contrib/inventory/proxmox.py
> -index c0ffb0b..ef7a394 100755
> ---- a/contrib/inventory/proxmox.py
> -+++ b/contrib/inventory/proxmox.py
> + # Copyright: (c) 2020, Ansible Project
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
> +diff --git a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
> +index cfd908c17b..3319084473 100755
> +--- a/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
> ++++ b/test/integration/targets/ansible-galaxy-role/files/create-role-archive.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Create a role archive which overwrites an arbitrary file."""
>   
> - # Copyright (C) 2014  Mathieu GAUTHIER-LAFAYE <gauthierl@lapth.cnrs.fr>
> - #
> -diff --git a/contrib/inventory/rackhd.py b/contrib/inventory/rackhd.py
> -index a89cb04..05b3ada 100755
> ---- a/contrib/inventory/rackhd.py
> -+++ b/contrib/inventory/rackhd.py
> + import argparse
> +diff --git a/test/integration/targets/ansible-test-container/runme.py b/test/integration/targets/ansible-test-container/runme.py
> +index 687128056f..bd7f367165 100755
> +--- a/test/integration/targets/ansible-test-container/runme.py
> ++++ b/test/integration/targets/ansible-test-container/runme.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Test suite used to verify ansible-test is able to run its containers on various container hosts."""
>   
> - import json
> - import requests
> -diff --git a/contrib/inventory/rax.py b/contrib/inventory/rax.py
> -index d20a8ab..6c34753 100755
> ---- a/contrib/inventory/rax.py
> -+++ b/contrib/inventory/rax.py
> + from __future__ import annotations
> +diff --git a/test/integration/targets/ansible-test-integration-targets/test.py b/test/integration/targets/ansible-test-integration-targets/test.py
> +index 8effb647fc..4e34c4bbc1 100755
> +--- a/test/integration/targets/ansible-test-integration-targets/test.py
> ++++ b/test/integration/targets/ansible-test-integration-targets/test.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - # (c) 2013, Jesse Keating <jesse.keating@rackspace.com,
> - #           Paul Durivage <paul.durivage@rackspace.com>,
> -diff --git a/contrib/inventory/rhv.py b/contrib/inventory/rhv.py
> -index 5ee5986..9d9e940 100755
> ---- a/contrib/inventory/rhv.py
> -+++ b/contrib/inventory/rhv.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - #
> - # Copyright (c) 2016 Red Hat, Inc.
> -diff --git a/contrib/inventory/rudder.py b/contrib/inventory/rudder.py
> -index 5cf16c9..a669c37 100755
> ---- a/contrib/inventory/rudder.py
> -+++ b/contrib/inventory/rudder.py
> + import subprocess
> + import unittest
> +diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
> +index 463915284b..fc2ed398d9 100755
> +--- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
> ++++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/run-with-pty.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Run a command using a PTY."""
>   
> - # Copyright (c) 2015, Normation SAS
> - #
> -diff --git a/contrib/inventory/serf.py b/contrib/inventory/serf.py
> -index e1340da..6242eda 100755
> ---- a/contrib/inventory/serf.py
> -+++ b/contrib/inventory/serf.py
> + import sys
> +diff --git a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
> +index a2b094e2fc..355dba697a 100755
> +--- a/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
> ++++ b/test/integration/targets/ansible-test-no-tty/ansible_collections/ns/col/tests/integration/targets/no-tty/assert-no-tty.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Assert no TTY is available."""
>   
> - # (c) 2015, Marc Abramowitz <marca@surveymonkey.com>
> - #
> -diff --git a/contrib/inventory/softlayer.py b/contrib/inventory/softlayer.py
> -index 3933eb4..519092f 100755
> ---- a/contrib/inventory/softlayer.py
> -+++ b/contrib/inventory/softlayer.py
> -@@ -1,4 +1,4 @@
> + import sys
> +diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
> +index 4265cc3e6c..e5a0d9b483 100755
> +--- a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
> ++++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/scripts/env_python.py
> +@@ -1 +1 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """
> - SoftLayer external inventory script.
> - 
> -diff --git a/contrib/inventory/spacewalk.py b/contrib/inventory/spacewalk.py
> -index 2735a81..2da2720 100755
> ---- a/contrib/inventory/spacewalk.py
> -+++ b/contrib/inventory/spacewalk.py
> -@@ -1,4 +1,4 @@
> +diff --git a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
> +index 4265cc3e6c..e5a0d9b483 100755
> +--- a/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
> ++++ b/test/integration/targets/ansible-test-sanity-shebang/ansible_collections/ns/col/tests/integration/targets/valid/env_python.py
> +@@ -1 +1 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - """
> - Spacewalk external inventory script
> -diff --git a/contrib/inventory/ssh_config.py b/contrib/inventory/ssh_config.py
> -index ae41e58..05373ec 100755
> ---- a/contrib/inventory/ssh_config.py
> -+++ b/contrib/inventory/ssh_config.py
> +diff --git a/test/integration/targets/ansible-test/venv-pythons.py b/test/integration/targets/ansible-test/venv-pythons.py
> +index b380f147fc..e97f2fcb33 100755
> +--- a/test/integration/targets/ansible-test/venv-pythons.py
> ++++ b/test/integration/targets/ansible-test/venv-pythons.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Return target Python options for use with ansible-test."""
>   
> - # (c) 2014, Tomas Karasek <tomas.karasek@digile.fi>
> - #
> -diff --git a/contrib/inventory/stacki.py b/contrib/inventory/stacki.py
> -index fd4cda5..d6acda3 100755
> ---- a/contrib/inventory/stacki.py
> -+++ b/contrib/inventory/stacki.py
> + import os
> +diff --git a/test/integration/targets/ansible-vault/faux-editor.py b/test/integration/targets/ansible-vault/faux-editor.py
> +index b67c747563..a30c306a83 100755
> +--- a/test/integration/targets/ansible-vault/faux-editor.py
> ++++ b/test/integration/targets/ansible-vault/faux-editor.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # Copyright (c) 2016, Hugh Ma <hugh.ma@flextronics.com>
>   #
> -diff --git a/contrib/inventory/vagrant.py b/contrib/inventory/vagrant.py
> -index 37a6741..86fc67d 100755
> ---- a/contrib/inventory/vagrant.py
> -+++ b/contrib/inventory/vagrant.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """
> - Vagrant external inventory script. Automatically finds the IP of the booted vagrant vm(s), and
> - returns it under the host group 'vagrant'
> -diff --git a/contrib/inventory/vbox.py b/contrib/inventory/vbox.py
> -index 8905fab..141b01a 100755
> ---- a/contrib/inventory/vbox.py
> -+++ b/contrib/inventory/vbox.py
> + # Ansible is free software: you can redistribute it and/or modify
> + # it under the terms of the GNU General Public License as published by
> +diff --git a/test/integration/targets/ansible-vault/password-script.py b/test/integration/targets/ansible-vault/password-script.py
> +index 1b7f02beb2..0dcada23c7 100755
> +--- a/test/integration/targets/ansible-vault/password-script.py
> ++++ b/test/integration/targets/ansible-vault/password-script.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - 
> - # This file is part of Ansible,
>   #
> -diff --git a/contrib/inventory/vmware.py b/contrib/inventory/vmware.py
> -index 377c7cb..cee232a 100755
> ---- a/contrib/inventory/vmware.py
> -+++ b/contrib/inventory/vmware.py
> + # Ansible is free software: you can redistribute it and/or modify
> + # it under the terms of the GNU General Public License as published by
> +diff --git a/test/integration/targets/ansible-vault/test-vault-client.py b/test/integration/targets/ansible-vault/test-vault-client.py
> +index ee46188742..48244fca09 100755
> +--- a/test/integration/targets/ansible-vault/test-vault-client.py
> ++++ b/test/integration/targets/ansible-vault/test-vault-client.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   # -*- coding: utf-8 -*-
> - '''
> - VMware Inventory Script
> -diff --git a/contrib/inventory/vmware_inventory.py b/contrib/inventory/vmware_inventory.py
> -index 58ee473..4300fe5 100755
> ---- a/contrib/inventory/vmware_inventory.py
> -+++ b/contrib/inventory/vmware_inventory.py
> +
> + from __future__ import (absolute_import, division, print_function)
> +diff --git a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
> +index 93958fc2ad..33509c826a 100644
> +--- a/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
> ++++ b/test/integration/targets/builtin_vars_prompt/test-vars_prompt.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - # Requirements
> - #   - pyvmomi >= 6.0.0.2016.4
> -diff --git a/contrib/inventory/windows_azure.py b/contrib/inventory/windows_azure.py
> -index cceed36..f8777be 100755
> ---- a/contrib/inventory/windows_azure.py
> -+++ b/contrib/inventory/windows_azure.py
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
> +diff --git a/test/integration/targets/cli/test-cli.py b/test/integration/targets/cli/test-cli.py
> +index 9893d6652e..7a07dcc108 100644
> +--- a/test/integration/targets/cli/test-cli.py
> ++++ b/test/integration/targets/cli/test-cli.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # Copyright (c) 2019 Matt Martz <matt@sivel.net>
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   
> - '''
> - Windows Azure external inventory script
> -diff --git a/contrib/inventory/zabbix.py b/contrib/inventory/zabbix.py
> -index f6b37b9..241823b 100755
> ---- a/contrib/inventory/zabbix.py
> -+++ b/contrib/inventory/zabbix.py
> +diff --git a/test/integration/targets/cli/test_k_and_K.py b/test/integration/targets/cli/test_k_and_K.py
> +index f7077fba0a..dcc9614129 100644
> +--- a/test/integration/targets/cli/test_k_and_K.py
> ++++ b/test/integration/targets/cli/test_k_and_K.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # GNU General Public License v3.0+ (see COPYING or https://www.gnu.org/licenses/gpl-3.0.txt)
>   
> - # (c) 2013, Greg Buehler
> - #
> -diff --git a/contrib/inventory/zone.py b/contrib/inventory/zone.py
> -index 893953e..b049fd7 100755
> ---- a/contrib/inventory/zone.py
> -+++ b/contrib/inventory/zone.py
> + # Make coding more python3-ish
> +diff --git a/test/integration/targets/collection/update-ignore.py b/test/integration/targets/collection/update-ignore.py
> +index 92a702cf13..9ea69089d5 100755
> +--- a/test/integration/targets/collection/update-ignore.py
> ++++ b/test/integration/targets/collection/update-ignore.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + """Rewrite a sanity ignore file to expand Python versions for import ignores and write the file out with the correct Ansible version in the name."""
>   
> - # (c) 2015, Dagobert Michelsen <dam@baltic-online.de>
> - #
> -diff --git a/docs/docsite/rst/dev_guide/developing_api.rst b/docs/docsite/rst/dev_guide/developing_api.rst
> -index bb2cbc4..55d4212 100644
> ---- a/docs/docsite/rst/dev_guide/developing_api.rst
> -+++ b/docs/docsite/rst/dev_guide/developing_api.rst
> -@@ -37,7 +37,7 @@ Python API 2.0
> - In 2.0 things get a bit more complicated to start, but you end up with much more discrete and readable classes::
> - 
> - 
> --    #!/usr/bin/env python
> -+    #!/usr/bin/env python3
> - 
> -     import json
> -     from collections import namedtuple
> -diff --git a/hacking/dump_playbook_attributes.py b/hacking/dump_playbook_attributes.py
> -index 204fe3f..9d86b66 100755
> ---- a/hacking/dump_playbook_attributes.py
> -+++ b/hacking/dump_playbook_attributes.py
> + import os
> +diff --git a/test/integration/targets/debugger/test_run_once.py b/test/integration/targets/debugger/test_run_once.py
> +index 237f9c2d90..4fe74903d8 100755
> +--- a/test/integration/targets/debugger/test_run_once.py
> ++++ b/test/integration/targets/debugger/test_run_once.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - import optparse
> - from jinja2 import Environment, FileSystemLoader
> -diff --git a/hacking/module_formatter.py b/hacking/module_formatter.py
> -index 4f132aa..1bee33a 100755
> ---- a/hacking/module_formatter.py
> -+++ b/hacking/module_formatter.py
> + import io
> + import os
> +diff --git a/test/integration/targets/fork_safe_stdio/run-with-pty.py b/test/integration/targets/fork_safe_stdio/run-with-pty.py
> +index 463915284b..fc2ed398d9 100755
> +--- a/test/integration/targets/fork_safe_stdio/run-with-pty.py
> ++++ b/test/integration/targets/fork_safe_stdio/run-with-pty.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # (c) 2012, Jan-Piet Mens <jpmens () gmail.com>
> - # (c) 2012-2014, Michael DeHaan <michael@ansible.com> and others
> - #
> -diff --git a/lib/ansible/modules/web_infrastructure/django_manage.py b/lib/ansible/modules/web_infrastructure/django_manage.py
> -index ac24829..90aee1b 100644
> ---- a/lib/ansible/modules/web_infrastructure/django_manage.py
> -+++ b/lib/ansible/modules/web_infrastructure/django_manage.py
> -@@ -97,7 +97,7 @@ notes:
> -    - This module assumes English error messages for the 'createcachetable' command to detect table existence, unfortunately.
> -    - To be able to use the migrate command with django versions < 1.7, you must have south installed and added as an app in your settings.
> -    - To be able to use the collectstatic command, you must have enabled staticfiles in your settings.
> --   - As of ansible 2.x, your I(manage.py) application must be executable (rwxr-xr-x), and must have a valid I(shebang), i.e. "#!/usr/bin/env python", for invoking the appropriate Python interpreter.
> -+   - As of ansible 2.x, your I(manage.py) application must be executable (rwxr-xr-x), and must have a valid I(shebang), i.e. "#!/usr/bin/env python3", for invoking the appropriate Python interpreter.
> - requirements: [ "virtualenv", "django" ]
> - author: "Scott Anderson (@tastychutney)"
> - '''
> -diff --git a/lib/ansible/modules/windows/win_file_version.py b/lib/ansible/modules/windows/win_file_version.py
> -index 399c978..1225a06 100644
> ---- a/lib/ansible/modules/windows/win_file_version.py
> -+++ b/lib/ansible/modules/windows/win_file_version.py
> + """Run a command using a PTY."""
> +
> + import sys
> +diff --git a/test/integration/targets/gathering/uuid.fact b/test/integration/targets/gathering/uuid.fact
> +index 79e3f62677..2a294b33a8 100644
> +--- a/test/integration/targets/gathering/uuid.fact
> ++++ b/test/integration/targets/gathering/uuid.fact
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   # -*- coding: utf-8 -*-
>   
> - # Get DLL or EXE build version
> -diff --git a/lib/ansible/modules/windows/win_firewall_rule.py b/lib/ansible/modules/windows/win_firewall_rule.py
> -index e4ab1e4..456523d 100644
> ---- a/lib/ansible/modules/windows/win_firewall_rule.py
> -+++ b/lib/ansible/modules/windows/win_firewall_rule.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
>   
> - # (c) 2014, Timothy Vandenbrande <timothy.vandenbrande@gmail.com>
> - #
> -diff --git a/test/compile/compile.py b/test/compile/compile.py
> -index 01144c6..6e332a9 100755
> ---- a/test/compile/compile.py
> -+++ b/test/compile/compile.py
> +diff --git a/test/integration/targets/gathering_facts/uuid.fact b/test/integration/targets/gathering_facts/uuid.fact
> +index 79e3f62677..2a294b33a8 100644
> +--- a/test/integration/targets/gathering_facts/uuid.fact
> ++++ b/test/integration/targets/gathering_facts/uuid.fact
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Python syntax checker with lint friendly output."""
> + # -*- coding: utf-8 -*-
>   
> - import os
> -diff --git a/test/integration/cleanup_rax.py b/test/integration/cleanup_rax.py
> -index 5c757f5..bc3448b 100755
> ---- a/test/integration/cleanup_rax.py
> -+++ b/test/integration/cleanup_rax.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
>   
> - import os
> - import re
> -diff --git a/test/integration/targets/embedded_module/library/test_integration_module b/test/integration/targets/embedded_module/library/test_integration_module
> -index f564619..0d46d15 100644
> ---- a/test/integration/targets/embedded_module/library/test_integration_module
> -+++ b/test/integration/targets/embedded_module/library/test_integration_module
> -@@ -1,3 +1,3 @@
> +diff --git a/test/integration/targets/group/files/gidget.py b/test/integration/targets/group/files/gidget.py
> +index 4b771516fd..085dfcdee1 100644
> +--- a/test/integration/targets/group/files/gidget.py
> ++++ b/test/integration/targets/group/files/gidget.py
> +@@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
> - print('{"changed":false, "msg":"this is the embedded module"}')
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
>  diff --git a/test/integration/targets/module_utils/module_utils/foo.py b/test/integration/targets/module_utils/module_utils/foo.py
> -index 20698f1..0cd5c85 100644
> +index 20698f1f46..0cd5c85142 100644
>  --- a/test/integration/targets/module_utils/module_utils/foo.py
>  +++ b/test/integration/targets/module_utils/module_utils/foo.py
>  @@ -1,3 +1,3 @@
> @@ -802,7 +584,7 @@ index 20698f1..0cd5c85 100644
>   
>   foo = "FOO FROM foo.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bam.py b/test/integration/targets/module_utils/module_utils/sub/bam.py
> -index 566f8b7..0814485 100644
> +index 566f8b7c47..0814485d5f 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bam.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bam.py
>  @@ -1,3 +1,3 @@
> @@ -811,7 +593,7 @@ index 566f8b7..0814485 100644
>   
>   bam = "BAM FROM sub/bam.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bam/bam.py b/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
> -index b7ed707..97f9eed 100644
> +index b7ed707211..97f9eedcdb 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bam/bam.py
>  @@ -1,3 +1,3 @@
> @@ -820,7 +602,7 @@ index b7ed707..97f9eed 100644
>   
>   bam = "BAM FROM sub/bam/bam.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/bam.py b/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
> -index 02fafd4..3a93360 100644
> +index 02fafd40f3..3a93360c69 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bar/bam.py
>  @@ -1,3 +1,3 @@
> @@ -829,7 +611,7 @@ index 02fafd4..3a93360 100644
>   
>   bam = "BAM FROM sub/bar/bam.py"
>  diff --git a/test/integration/targets/module_utils/module_utils/sub/bar/bar.py b/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
> -index 8566901..40f0c94 100644
> +index 8566901f04..40f0c9446c 100644
>  --- a/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
>  +++ b/test/integration/targets/module_utils/module_utils/sub/bar/bar.py
>  @@ -1,3 +1,3 @@
> @@ -837,396 +619,145 @@ index 8566901..40f0c94 100644
>  +#!/usr/bin/env python3
>   
>   bar = "BAR FROM sub/bar/bar.py"
> -diff --git a/test/integration/targets/service/files/ansible_test_service b/test/integration/targets/service/files/ansible_test_service
> -index 682edeb..e858909 100755
> ---- a/test/integration/targets/service/files/ansible_test_service
> -+++ b/test/integration/targets/service/files/ansible_test_service
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - # this is mostly based off of the code found here:
> - # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
> -diff --git a/test/runner/ansible-test b/test/runner/ansible-test
> -index 801f07f..804aa8f 100755
> ---- a/test/runner/ansible-test
> -+++ b/test/runner/ansible-test
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # PYTHON_ARGCOMPLETE_OK
> - """Test runner for all Ansible tests."""
> - 
> -diff --git a/test/runner/injector/ansible b/test/runner/injector/ansible
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible
> -+++ b/test/runner/injector/ansible
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-console b/test/runner/injector/ansible-console
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-console
> -+++ b/test/runner/injector/ansible-console
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-doc b/test/runner/injector/ansible-doc
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-doc
> -+++ b/test/runner/injector/ansible-doc
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-galaxy b/test/runner/injector/ansible-galaxy
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-galaxy
> -+++ b/test/runner/injector/ansible-galaxy
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-playbook b/test/runner/injector/ansible-playbook
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-playbook
> -+++ b/test/runner/injector/ansible-playbook
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-pull b/test/runner/injector/ansible-pull
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-pull
> -+++ b/test/runner/injector/ansible-pull
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/ansible-vault b/test/runner/injector/ansible-vault
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/ansible-vault
> -+++ b/test/runner/injector/ansible-vault
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover b/test/runner/injector/cover
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover
> -+++ b/test/runner/injector/cover
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover2 b/test/runner/injector/cover2
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover2
> -+++ b/test/runner/injector/cover2
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover2.4 b/test/runner/injector/cover2.4
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover2.4
> -+++ b/test/runner/injector/cover2.4
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover2.6 b/test/runner/injector/cover2.6
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover2.6
> -+++ b/test/runner/injector/cover2.6
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover2.7 b/test/runner/injector/cover2.7
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover2.7
> -+++ b/test/runner/injector/cover2.7
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover3 b/test/runner/injector/cover3
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover3
> -+++ b/test/runner/injector/cover3
> +diff --git a/test/integration/targets/packaging_cli-doc/verify.py b/test/integration/targets/packaging_cli-doc/verify.py
> +index 7793fa8c24..71f82186dd 100755
> +--- a/test/integration/targets/packaging_cli-doc/verify.py
> ++++ b/test/integration/targets/packaging_cli-doc/verify.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Code coverage wrapper."""
>   
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover3.5 b/test/runner/injector/cover3.5
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover3.5
> -+++ b/test/runner/injector/cover3.5
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/cover3.6 b/test/runner/injector/cover3.6
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/cover3.6
> -+++ b/test/runner/injector/cover3.6
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/injector.py b/test/runner/injector/injector.py
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/injector.py
> -+++ b/test/runner/injector/injector.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/pytest b/test/runner/injector/pytest
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/pytest
> -+++ b/test/runner/injector/pytest
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner b/test/runner/injector/runner
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner
> -+++ b/test/runner/injector/runner
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner2 b/test/runner/injector/runner2
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner2
> -+++ b/test/runner/injector/runner2
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner2.4 b/test/runner/injector/runner2.4
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner2.4
> -+++ b/test/runner/injector/runner2.4
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner2.6 b/test/runner/injector/runner2.6
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner2.6
> -+++ b/test/runner/injector/runner2.6
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - """Code coverage wrapper."""
> - 
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner2.7 b/test/runner/injector/runner2.7
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner2.7
> -+++ b/test/runner/injector/runner2.7
> + import os
> + import pathlib
> +diff --git a/test/integration/targets/pause/test-pause.py b/test/integration/targets/pause/test-pause.py
> +index 3703470d06..dd14b2810d 100755
> +--- a/test/integration/targets/pause/test-pause.py
> ++++ b/test/integration/targets/pause/test-pause.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Code coverage wrapper."""
>   
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner3 b/test/runner/injector/runner3
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner3
> -+++ b/test/runner/injector/runner3
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
> +diff --git a/test/integration/targets/pip/files/setup.py b/test/integration/targets/pip/files/setup.py
> +index aaf21875ca..2835719e4f 100755
> +--- a/test/integration/targets/pip/files/setup.py
> ++++ b/test/integration/targets/pip/files/setup.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Code coverage wrapper."""
>   
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner3.5 b/test/runner/injector/runner3.5
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner3.5
> -+++ b/test/runner/injector/runner3.5
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
> +diff --git a/test/integration/targets/service/files/ansible_test_service.py b/test/integration/targets/service/files/ansible_test_service.py
> +index 522493fcc7..b3aaf7f6b4 100644
> +--- a/test/integration/targets/service/files/ansible_test_service.py
> ++++ b/test/integration/targets/service/files/ansible_test_service.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Code coverage wrapper."""
>   
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/injector/runner3.6 b/test/runner/injector/runner3.6
> -index 57241c9..c463946 100755
> ---- a/test/runner/injector/runner3.6
> -+++ b/test/runner/injector/runner3.6
> + # this is mostly based off of the code found here:
> + # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
> +diff --git a/test/integration/targets/service_facts/files/ansible_test_service.py b/test/integration/targets/service_facts/files/ansible_test_service.py
> +index 19f1e29138..609218325d 100644
> +--- a/test/integration/targets/service_facts/files/ansible_test_service.py
> ++++ b/test/integration/targets/service_facts/files/ansible_test_service.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - """Code coverage wrapper."""
>   
> - from __future__ import absolute_import, print_function
> -diff --git a/test/runner/retry.py b/test/runner/retry.py
> -index 4972131..a9ffb07 100755
> ---- a/test/runner/retry.py
> -+++ b/test/runner/retry.py
> + # this is mostly based off of the code found here:
> + # http://code.activestate.com/recipes/278731-creating-a-daemon-the-python-way/
> +diff --git a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
> +index b0a8889439..90c83b582b 100644
> +--- a/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
> ++++ b/test/integration/targets/template/role_filter/filter_plugins/myplugin.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # PYTHON_ARGCOMPLETE_OK
> - """Automatically retry failed commands."""
>   
> -diff --git a/test/runner/test.py b/test/runner/test.py
> -index 801f07f..804aa8f 100755
> ---- a/test/runner/test.py
> -+++ b/test/runner/test.py
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
> +diff --git a/test/integration/targets/throttle/test_throttle.py b/test/integration/targets/throttle/test_throttle.py
> +index 1a5bdd3078..344bcf0f86 100755
> +--- a/test/integration/targets/throttle/test_throttle.py
> ++++ b/test/integration/targets/throttle/test_throttle.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> - # PYTHON_ARGCOMPLETE_OK
> - """Test runner for all Ansible tests."""
>   
> -diff --git a/test/sanity/code-smell/ansible-var-precedence-check.py b/test/sanity/code-smell/ansible-var-precedence-check.py
> -index e10c097..13c7a73 100755
> ---- a/test/sanity/code-smell/ansible-var-precedence-check.py
> -+++ b/test/sanity/code-smell/ansible-var-precedence-check.py
> + from __future__ import (absolute_import, division, print_function)
> + __metaclass__ = type
> +diff --git a/test/integration/targets/var_precedence/ansible-var-precedence-check.py b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
> +index fc31688be2..f964bbe8d6 100755
> +--- a/test/integration/targets/var_precedence/ansible-var-precedence-check.py
> ++++ b/test/integration/targets/var_precedence/ansible-var-precedence-check.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
>   
>   # A tool to check the order of precedence for ansible variables
>   # https://github.com/ansible/ansible/blob/devel/test/integration/test_var_precedence.yml
> -diff --git a/test/sanity/code-smell/integration-aliases.py b/test/sanity/code-smell/integration-aliases.py
> -index 50301e3..ac53ca9 100755
> ---- a/test/sanity/code-smell/integration-aliases.py
> -+++ b/test/sanity/code-smell/integration-aliases.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - 
> - import os
> - import textwrap
> -diff --git a/test/sanity/code-smell/shebang.sh b/test/sanity/code-smell/shebang.sh
> -index 76d72c1..565a198 100755
> ---- a/test/sanity/code-smell/shebang.sh
> -+++ b/test/sanity/code-smell/shebang.sh
> -@@ -8,11 +8,11 @@ grep '^#!' -rIn . \
> -     -e '^\./test/integration/targets/[^/]*/library/[^/]*:#!powershell$' \
> -     -e '^\./test/integration/targets/[^/]*/library/[^/]*:#!/usr/bin/python$' \
> -     -e '^\./test/integration/targets/module_precedence/.*lib.*:#!/usr/bin/python$' \
> --    -e '^\./hacking/cherrypick.py:#!/usr/bin/env python3$' \
> -+    -e '^\./hacking/cherrypick.py:#!/usr/bin/env python33$' \
> -     -e ':#!/bin/sh$' \
> -     -e ':#!/bin/bash( -[eux]|$)' \
> -     -e ':#!/usr/bin/make -f$' \
> --    -e ':#!/usr/bin/env python$' \
> -+    -e ':#!/usr/bin/env python3$' \
> -     -e ':#!/usr/bin/env bash$' \
> -     -e ':#!/usr/bin/env fish$' \
> - 
> -diff --git a/test/sanity/validate-modules/test_validate_modules_regex.py b/test/sanity/validate-modules/test_validate_modules_regex.py
> -index 0e41ee7..8a86b07 100644
> ---- a/test/sanity/validate-modules/test_validate_modules_regex.py
> -+++ b/test/sanity/validate-modules/test_validate_modules_regex.py
> +diff --git a/test/lib/ansible_test/_internal/util_common.py b/test/lib/ansible_test/_internal/util_common.py
> +index 222366e473..2b11060113 100644
> +--- a/test/lib/ansible_test/_internal/util_common.py
> ++++ b/test/lib/ansible_test/_internal/util_common.py
> +@@ -303,7 +303,7 @@ def get_injector_path() -> str:
> +     ])
> +
> +     scripts = (
> +-        ('python.py', '/usr/bin/env python', MODE_FILE_EXECUTE),
> ++        ('python.py', '/usr/bin/env python3', MODE_FILE_EXECUTE),
> +         ('virtualenv.sh', '/usr/bin/env bash', MODE_FILE),
> +     )
> +
> +diff --git a/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py b/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
> +index b0b1319783..9535c3b481 100644
> +--- a/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
> ++++ b/test/lib/ansible_test/_util/controller/sanity/code-smell/shebang.py
> +@@ -16,14 +16,14 @@ def main():
> +         b'#!/usr/bin/env bash',
> +         b'#!/usr/bin/env fish',
> +         b'#!/usr/bin/env pwsh',
> +-        b'#!/usr/bin/env python',
> ++        b'#!/usr/bin/env python3',
> +         b'#!/usr/bin/make -f',
> +     ])
> +
> +     integration_shebangs = set([
> +         b'#!/bin/sh',
> +         b'#!/usr/bin/env bash',
> +-        b'#!/usr/bin/env python',
> ++        b'#!/usr/bin/env python3',
> +     ])
> +
> +     module_shebangs = {
> +diff --git a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
> +index 930654fc1e..bbf50369d7 100755
> +--- a/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
> ++++ b/test/lib/ansible_test/_util/target/cli/ansible_test_cli_stub.py
>  @@ -1,4 +1,4 @@
>  -#!/usr/bin/env python
>  +#!/usr/bin/env python3
> + # PYTHON_ARGCOMPLETE_OK
> + """Command line entry point for ansible-test."""
>   
> - # This is a standalone test for the regex inside validate-modules
> - # It is not suitable to add to the make tests target because the
> -diff --git a/test/sanity/validate-modules/validate-modules b/test/sanity/validate-modules/validate-modules
> -index d03bff1..201cd41 100755
> ---- a/test/sanity/validate-modules/validate-modules
> -+++ b/test/sanity/validate-modules/validate-modules
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # -*- coding: utf-8 -*-
> - #
> - # Copyright (C) 2015 Matt Martz <matt@sivel.net>
>  diff --git a/test/units/executor/module_common/test_module_common.py b/test/units/executor/module_common/test_module_common.py
> -index edbf836..1f3bb5a 100644
> +index fa6add8cd6..fcfd096e54 100644
>  --- a/test/units/executor/module_common/test_module_common.py
>  +++ b/test/units/executor/module_common/test_module_common.py
> -@@ -114,5 +114,5 @@ class TestGetShebang(object):
> +@@ -132,8 +132,8 @@ class TestGetShebang:
>               (u'#!/usr/bin/python3 -tt -OO', u'/usr/bin/python3')
>   
> -     def test_python_via_env(self):
> --        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_interpreter': u'/usr/bin/env python'}) == \
> +     def test_python_via_env(self, templar):
> +-        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_interpreter': u'/usr/bin/env python'}, templar) == \
>  -            (u'#!/usr/bin/env python', u'/usr/bin/env python')
> -+        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_interpreter': u'/usr/bin/env python3'}) == \
> -+            (u'#!/usr/bin/env python3', u'/usr/bin/env python')
> -diff --git a/test/units/modules/network/nxos/test_nxos_config.py b/test/units/modules/network/nxos/test_nxos_config.py
> -index 8e3a59c..46764a8 100644
> ---- a/test/units/modules/network/nxos/test_nxos_config.py
> -+++ b/test/units/modules/network/nxos/test_nxos_config.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - #
> - # (c) 2016 Red Hat Inc.
> - #
> -diff --git a/test/utils/shippable/ansible-core-ci b/test/utils/shippable/ansible-core-ci
> -index e91b426..44f8fb9 100755
> ---- a/test/utils/shippable/ansible-core-ci
> -+++ b/test/utils/shippable/ansible-core-ci
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> ++        assert amc._get_shebang(u'/usr/bin/python', {u'ansible_python_interpreter': u'/usr/bin/env python3'}, templar) == \
> ++            (u'#!/usr/bin/env python3', u'/usr/bin/env python3')
>   
> - # (c) 2016 Matt Clay <matt@mystile.com>
> - #
> -diff --git a/test/utils/shippable/download.py b/test/utils/shippable/download.py
> -index cbda144..e86c8e6 100755
> ---- a/test/utils/shippable/download.py
> -+++ b/test/utils/shippable/download.py
> -@@ -1,4 +1,4 @@
> --#!/usr/bin/env python
> -+#!/usr/bin/env python3
> - # PYTHON_ARGCOMPLETE_OK
>   
> - # (c) 2016 Red Hat, Inc.
> + class TestDetectionRegexes:
>  -- 
> -2.7.4
> +2.40.0
>  
> diff --git a/recipes-devtools/python/python3-ansible_2.3.1.0.bb b/recipes-devtools/python/python3-ansible_2.14.11.bb
> similarity index 100%
> rename from recipes-devtools/python/python3-ansible_2.3.1.0.bb
> rename to recipes-devtools/python/python3-ansible_2.14.11.bb
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8426): https://lists.yoctoproject.org/g/meta-virtualization/message/8426
> Mute This Topic: https://lists.yoctoproject.org/mt/102421319/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][kirkstone][PATCH 2/2] python3-ansible: Add locale-base-en-us to RDEPENDS
on 06/11/2023 Narpat Mali via lists.yoctoproject.org wrote:

> From: Narpat Mali <narpat.mali@windriver.com>
> 
> Fixes:
>    # export LANG='en_US.UTF-8'
>    # ansible --version
>    ERROR: Ansible requires the locale encoding to be UTF-8; Detected None.
> 
>   #  python3
>   Python 3.10.9 (main, Dec  6 2022, 18:44:57) [GCC 11.3.0] on linux
>   Type "help", "copyright", "credits" or "license" for more information.
>   >>> import locale
>   >>> locale.setlocale(locale.LC_CTYPE, ("en_US", "UTF-8"))
>   Traceback (most recent call last):
>     File "<stdin>", line 1, in <module>
>     File "/usr/lib64/python3.10/locale.py", line 620, in setlocale
>       return _setlocale(category, locale)
>   locale.Error: unsupported locale setting
>   >>>
> 
> Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> 
> Upstream master commit:
> https://git.yoctoproject.org/meta-cloud-services/commit/?id=cd048e11c4600636714051c787264a52be19c3f8
> 
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  recipes-devtools/python/python3-ansible_2.14.11.bb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/recipes-devtools/python/python3-ansible_2.14.11.bb b/recipes-devtools/python/python3-ansible_2.14.11.bb
> index ea0fdbe5..f3ab2377 100644
> --- a/recipes-devtools/python/python3-ansible_2.14.11.bb
> +++ b/recipes-devtools/python/python3-ansible_2.14.11.bb
> @@ -1,7 +1,11 @@
>  inherit setuptools3
>  require python-ansible.inc
>  
> -RDEPENDS:${PN} += "python3-pyyaml python3-jinja2 python3-modules"
> +RDEPENDS:${PN} += "python3-pyyaml \
> +    python3-jinja2 \
> +    python3-modules \
> +    locale-base-en-us \
> +"
>  
>  SRC_URI += " \
>      file://python3-ensure-py-scripts-use-py3-for-shebang.patch \
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8427): https://lists.yoctoproject.org/g/meta-virtualization/message/8427
> Mute This Topic: https://lists.yoctoproject.org/mt/102421321/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



