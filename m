Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2F0CA0EED
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 06:14:18 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web11.13691.1755670454374787092
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 19 Aug 2025 23:14:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ZDfeXSlz;
 spf=pass (domain: mvista.com, ip: 209.85.214.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24458242b33so58084375ad.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 19 Aug 2025 23:14:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755670453; x=1756275253; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uu8Z8kYopPDuJnBNSGGVl4J9fxIaqdASeHr9yZx2EbI=;
        b=ZDfeXSlzUBF++PyGP2nNb0fKTK8s6Ew/x50+XLTSrjrnigo3NuzaG9oAXRDxsbb5eK
         zcGjbWYVxzQiPx74ti4zQR+24OrCaFeoCJZPnH2n9rINHHgtPBCv+PiLAXRDS7A5n4iQ
         nHrToxvVKFoAr9mmaGYOVmBT6Vechl9xW8KRQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755670453; x=1756275253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uu8Z8kYopPDuJnBNSGGVl4J9fxIaqdASeHr9yZx2EbI=;
        b=G5HRTa9OiFW57lXVIgHxVLKPL2lUJEqx55AU1d4R/HKRGZB9aYzh21bFS1LfbPU40C
         n2mty6DRsI0vGRg4nkLXA0ndRMDcgEGSZKALPCZegOD2AzsA8AloIyOYXOU3GY2Hklhj
         rIap9lalzWTGvudq8zbP+eCDE8G4uCm/H6ltMaxrdfpZetbsHh36z4Nmvcpmu12j/jG+
         9bqceBp7Mvu2oRY5LUKDxQ9FcfavdQGLM/sUCf3BFAoLdKWgC6n8V68BrqrUjkqT1m5o
         sDH5Xktt8mKZM6JhDaMifsTFZLvt+aa011SQ4bPLIqMUZEmLH7h/1vO1ZXG/U/J/wKIb
         FLkg==
X-Gm-Message-State: AOJu0YxXlozuFCeRwb1ltkEfNHEfZRgsF8NZx+wn1hh9EGut2FQOAME3
	GplYFnf7eUQEY/QSvbhDEDQjuV/F7hSeh3u0TK1o0taDfrEW8DE4d11bIuzFX4hz8BANbdiEFyV
	gavg5
X-Gm-Gg: ASbGncuk5WcLk+4r4tfuphCtroZpyoqYqiF5OQQ25uTL9rw9h8Wx2G7KkuH9m/tSsAm
	c0c9BFpaioCsY7rr0AzJa+Pe+8YEfExKLeDEd9E/2Da2NI1VAGJ+zapJnS239BlQxJj2xJhnMEC
	aKt35o+dxQ6g7pUxdwHt5g//MtelQnOGCbFhYjoUVAmLAhDSFJqUHVIX+wfWmYN5mJDUC4meVy7
	V3JEL2gFyZLaILKv5fYkwibYDDew0Vsn1bG+yAggppVkmKwn0ZkETzLtP1itZFxWdtD7mzUVcuY
	1y5zGvDhY94N0Fy4xNhlyEfiIRlOtvNaKwm8crCmmf4p02KKIy9BphWd3rMLVZRPIDWAHS1VwHV
	Hj9VTHK+Y3INkvtCytSV2kcoGwZtjszHejtllD/tSyob7nkA=
X-Google-Smtp-Source: AGHT+IEJXYjHygZQf7kGK3OciARf2e6oA5o5hANuH5AoP96mYg5D7bMCTjPYLdoZxN4rtCY1Sq1+/Q==
X-Received: by 2002:a17:903:2bcb:b0:240:4d19:8797 with SMTP id d9443c01a7336-245ef15fe7emr20729985ad.22.1755670453513;
        Tue, 19 Aug 2025 23:14:13 -0700 (PDT)
Received: from MVIN00016.mvista.com ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-324e269344asm1135256a91.30.2025.08.19.23.14.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 23:14:13 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][scarthgap][PATCH] cloud-init: fix for CVE-2024-6174
Date: Wed, 20 Aug 2025 11:43:48 +0530
Message-ID: <20250820061348.40908-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Aug 2025 06:14:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9351

Upstream-Status: Backport from https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cloud-init/cloud-init/CVE-2024-6174.patch | 103 ++++++++++++++++++
 recipes-extended/cloud-init/cloud-init_git.bb |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch

diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
new file mode 100644
index 00000000..66347fee
--- /dev/null
+++ b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
@@ -0,0 +1,103 @@
+From f43937f0b462734eb9c76700491c18fe4133c8e1 Mon Sep 17 00:00:00 2001
+From: Brett Holman <brett.holman@canonical.com>
+Date: Thu, 22 Aug 2024 16:54:53 -0600
+Subject: [PATCH] fix: Don't attempt to identify non-x86 OpenStack instances
+
+This causes cloud-init to attempt to reach out to the OpenStack Nova
+datasource in non-Nova deployments on non-x86 architectures.
+
+Change default policy of ds-identify to disallow discovery of datasources
+without strict identifiable artifacts in either kernel cmdline, DMI
+platform information or system configuration files. This prevents
+cloud-init from attempting to reach out to well-known hard-codded link-local
+IP addresses for configuration information unless the platform strictly
+identifies as a specific datasource.
+
+CVE-2024-6174
+LP: #2069607
+BREAKING_CHANGE: This may break non-x86 OpenStack Nova users. Affected users
+    may wish to use ConfigDrive as a workaround.
+
+CVE: CVE-2024-6174
+Upstream-Status: Backport [https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ tests/unittests/test_ds_identify.py | 13 ++++++-------
+ tools/ds-identify                   |  8 ++++----
+ 2 files changed, 10 insertions(+), 11 deletions(-)
+
+diff --git a/tests/unittests/test_ds_identify.py b/tests/unittests/test_ds_identify.py
+index 1be00e464..23d06138b 100644
+--- a/tests/unittests/test_ds_identify.py
++++ b/tests/unittests/test_ds_identify.py
+@@ -63,9 +63,9 @@ BLKID_UEFI_UBUNTU = [
+ 
+ 
+ POLICY_FOUND_ONLY = "search,found=all,maybe=none,notfound=disabled"
+-POLICY_FOUND_OR_MAYBE = "search,found=all,maybe=all,notfound=disabled"
+-DI_DEFAULT_POLICY = "search,found=all,maybe=all,notfound=disabled"
+-DI_DEFAULT_POLICY_NO_DMI = "search,found=all,maybe=all,notfound=enabled"
++POLICY_FOUND_OR_MAYBE = "search,found=all,maybe=none,notfound=disabled"
++DI_DEFAULT_POLICY = "search,found=all,maybe=none,notfound=disabled"
++DI_DEFAULT_POLICY_NO_DMI = "search,found=all,maybe=none,notfound=enabled"
+ DI_EC2_STRICT_ID_DEFAULT = "true"
+ OVF_MATCH_STRING = "http://schemas.dmtf.org/ovf/environment/1"
+ 
+@@ -674,7 +674,7 @@ class TestDsIdentify(DsIdentifyBase):
+         self._test_ds_found("OpenStack-AssetTag-Compute")
+ 
+     def test_openstack_on_non_intel_is_maybe(self):
+-        """On non-Intel, openstack without dmi info is maybe.
++        """On non-Intel, openstack without dmi info is none.
+ 
+         nova does not identify itself on platforms other than intel.
+            https://bugs.launchpad.net/cloud-init/+bugs?field.tag=dsid-nova"""
+@@ -694,10 +694,9 @@ class TestDsIdentify(DsIdentifyBase):
+ 
+         # updating the uname to ppc64 though should get a maybe.
+         data.update({"mocks": [MOCK_VIRT_IS_KVM, MOCK_UNAME_IS_PPC64]})
+-        (_, _, err, _, _) = self._check_via_dict(
+-            data, RC_FOUND, dslist=["OpenStack", "None"]
+-        )
++        (_, _, err, _, _) = self._check_via_dict(data, RC_NOT_FOUND)
+         self.assertIn("check for 'OpenStack' returned maybe", err)
++        self.assertIn("No ds found", err)
+ 
+     def test_default_ovf_is_found(self):
+         """OVF is identified found when ovf/ovf-env.xml seed file exists."""
+diff --git a/tools/ds-identify b/tools/ds-identify
+index 741742c7f..e3459d601 100755
+--- a/tools/ds-identify
++++ b/tools/ds-identify
+@@ -14,7 +14,7 @@
+ #   The format is:
+ #        <mode>,found=value,maybe=value,notfound=value
+ #   default setting is:
+-#     search,found=all,maybe=all,notfound=disabled
++#     search,found=all,maybe=none,notfound=disabled
+ #
+ #   kernel command line option: ci.di.policy=<policy>
+ #   example line in /etc/cloud/ds-identify.cfg:
+@@ -40,7 +40,7 @@
+ #         first: use the first found do no further checking
+ #         all: enable all DS_FOUND
+ #
+-#      maybe: (default=all)
++#      maybe: (default=none)
+ #       if nothing returned 'found', then how to handle maybe.
+ #       no network sources are allowed to return 'maybe'.
+ #         all: enable all DS_MAYBE
+@@ -99,8 +99,8 @@ DI_MAIN=${DI_MAIN:-main}
+ 
+ DI_BLKID_EXPORT_OUT=""
+ DI_GEOM_LABEL_STATUS_OUT=""
+-DI_DEFAULT_POLICY="search,found=all,maybe=all,notfound=${DI_DISABLED}"
+-DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=all,notfound=${DI_ENABLED}"
++DI_DEFAULT_POLICY="search,found=all,maybe=none,notfound=${DI_DISABLED}"
++DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=none,notfound=${DI_ENABLED}"
+ DI_DMI_BOARD_NAME=""
+ DI_DMI_CHASSIS_ASSET_TAG=""
+ DI_DMI_PRODUCT_NAME=""
+-- 
+2.50.1
+
diff --git a/recipes-extended/cloud-init/cloud-init_git.bb b/recipes-extended/cloud-init/cloud-init_git.bb
index 6cb3d3b5..4cf74efd 100644
--- a/recipes-extended/cloud-init/cloud-init_git.bb
+++ b/recipes-extended/cloud-init/cloud-init_git.bb
@@ -11,6 +11,7 @@ SRCREV = "e982c20875db3750c8dfc1915e7a4cee37376924"
 SRC_URI = "git://github.com/canonical/cloud-init;branch=24.1.x;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
+    file://CVE-2024-6174.patch \
 "
 
 PV = "v23.4.1+git"
-- 
2.50.1


