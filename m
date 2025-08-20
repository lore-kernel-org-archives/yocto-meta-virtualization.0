Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D3FCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 08:21:29 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.15006.1755678081120064434
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 20 Aug 2025 01:21:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PLqHIIgN;
 spf=pass (domain: mvista.com, ip: 209.85.214.176, mailfrom: hprajapati@mvista.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-244581caca6so48045805ad.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Aug 2025 01:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1755678080; x=1756282880; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5c9DxDgo3lFwD5VzS62Bm0vneJ049mbqcZjKZMSDZEk=;
        b=PLqHIIgNSVZ3EihxqWBZvo7/RtI1SraHv8ePi5i+pYLuCPHaTz1DwvIsXKLr596TnD
         ZZfuA+3wW0U4F+3X8XrYMa9RWuqT1Ja/sPA8El235RfreGr/pgeexMhBiiipN18OB4kZ
         Q8l6SmsfG+jX4OnhzJflr2HW4JNAbWJ1bHIHY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755678080; x=1756282880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5c9DxDgo3lFwD5VzS62Bm0vneJ049mbqcZjKZMSDZEk=;
        b=ugqRJX5/Kl97RRquidQtH4O7sYcTgVRLeuQugbKfMBpI9DgQ2ogTfMpcXF1htp0lwD
         tmiCayrDlAzdegbDYerNwetFA6kJvM1K2MvVbUjzUCWIyJbzc6bUV6ZIJ+EsuVDB0Pg7
         DkgrTjR5vEx2wBYa7kvUmLQtnbgJVJA8JnAAhdMFtyBk/kY2U+xXYqAVlPoo3p++ma9m
         R6YHQmnchrWOoFBLd8xl8pqOhH/DOcISaWfB8BxhML0m/LbHAFDtNEaX5fFavXvJvBsX
         6nzyrGNrQjTMJd5uP+XVevrm0QAxU/WQ33eRHfCBEiFWuLV1Hr8xu/1n2FsCq8YFynFA
         2qDg==
X-Gm-Message-State: AOJu0YzwtU0RIzlM5oKvO3/EpudJf4Umg5L6MQskaglvIZ1opD7YYRFB
	4aEcn0xDWFIUXdAoLLtzHREoh2gl+OYnnAKn8NnAz0tR0EjRcGu8wQTHkC8+nR5fvXbODhbNeBG
	SPn+0
X-Gm-Gg: ASbGncse5kvmnjaKDFjYfoWUc6+HQ7DdF7PwqHhfZbpnUvELi6oYA2V2xXB+cc4m3Pm
	l968OceLbEa/CrkoXaAoapNeHXwyz7Hm4L27IrsovmP0HcH21vZHqb8VpHmjwjLQ8Lg2rpP6MSZ
	SCADqoINrw1VsJxRYvWeXNzwenRpJO/Va56WarhDZZSHBUVQwy3e2sKpQm6apnxEUhdzF91WJXm
	Lgtj6PlvObrAxnjFrlDXiRsnXtydh9XGYex2PzCbXqucmSJx1pfo9UJr4GOqL/kk/8PpZjcPbfI
	I6twD03L3I79qsng9JALVAIveViYzP1ibKM+dLMTFSoSX6phBujZRecWFSl66Imr+3Ly3J2pfI2
	wcsDSvQL5ZCK3KykJWaqtcg==
X-Google-Smtp-Source: AGHT+IF7Zd5E4ITAH9BkTDIH2ujmE72PJuyauF/roKxu5e217pghdYboF7bFr0E80jVn4Ib7ns3tVA==
X-Received: by 2002:a17:902:ced2:b0:240:3909:5359 with SMTP id d9443c01a7336-245ef24a151mr25711065ad.40.1755678080076;
        Wed, 20 Aug 2025 01:21:20 -0700 (PDT)
Received: from MVIN00016 ([103.250.136.130])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-245ed35ac08sm19383495ad.42.2025.08.20.01.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Aug 2025 01:21:19 -0700 (PDT)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [meta-virtualization][kirkstone][PATCH] cloud-init: fix for CVE-2024-6174
Date: Wed, 20 Aug 2025 13:51:09 +0530
Message-ID: <20250820082109.100727-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 20 Aug 2025 08:21:29 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9352

Upstream-Status: Backport from https://github.com/canonical/cloud-init/commit/f43937f0b462734eb9c76700491c18fe4133c8e1

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../cloud-init/cloud-init/CVE-2024-6174.patch | 103 ++++++++++++++++++
 .../cloud-init/cloud-init_21.4.bb             |   1 +
 2 files changed, 104 insertions(+)
 create mode 100644 recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch

diff --git a/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch b/recipes-extended/cloud-init/cloud-init/CVE-2024-6174.patch
new file mode 100644
index 00000000..797155ce
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
+index f2d2b4949..aaa6999e1 100644
+--- a/tests/unittests/test_ds_identify.py
++++ b/tests/unittests/test_ds_identify.py
+@@ -57,9 +57,9 @@ BLKID_UEFI_UBUNTU = [
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
+@@ -533,7 +533,7 @@ class TestDsIdentify(DsIdentifyBase):
+         self._test_ds_found("OpenStack-AssetTag-Compute")
+ 
+     def test_openstack_on_non_intel_is_maybe(self):
+-        """On non-Intel, openstack without dmi info is maybe.
++        """On non-Intel, openstack without dmi info is none.
+ 
+         nova does not identify itself on platforms other than intel.
+            https://bugs.launchpad.net/cloud-init/+bugs?field.tag=dsid-nova"""
+@@ -553,10 +553,9 @@ class TestDsIdentify(DsIdentifyBase):
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
+index 30d4b0f65..4dd0b5fcf 100755
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
+@@ -94,8 +94,8 @@ DI_MAIN=${DI_MAIN:-main}
+ 
+ DI_BLKID_EXPORT_OUT=""
+ DI_GEOM_LABEL_STATUS_OUT=""
+-DI_DEFAULT_POLICY="search,found=all,maybe=all,notfound=${DI_DISABLED}"
+-DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=all,notfound=${DI_ENABLED}"
++DI_DEFAULT_POLICY="search,found=all,maybe=none,notfound=${DI_DISABLED}"
++DI_DEFAULT_POLICY_NO_DMI="search,found=all,maybe=none,notfound=${DI_ENABLED}"
+ DI_DMI_CHASSIS_ASSET_TAG=""
+ DI_DMI_PRODUCT_NAME=""
+ DI_DMI_SYS_VENDOR=""
+-- 
+2.50.1
+
diff --git a/recipes-extended/cloud-init/cloud-init_21.4.bb b/recipes-extended/cloud-init/cloud-init_21.4.bb
index 5cb62272..02a89a58 100644
--- a/recipes-extended/cloud-init/cloud-init_21.4.bb
+++ b/recipes-extended/cloud-init/cloud-init_21.4.bb
@@ -9,6 +9,7 @@ SRC_URI = "git://github.com/canonical/cloud-init;branch=main;protocol=https \
     file://cloud-init-source-local-lsb-functions.patch \
     file://0001-setup.py-check-for-install-anywhere-in-args.patch \
     file://0001-setup.py-respect-udevdir-variable.patch \
+    file://CVE-2024-6174.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.50.1


