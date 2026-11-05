Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28351.1793858647975544724
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:04:08 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=kz6GOXLa;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11361; q=dns/txt;
  s=iport01; t=1793858648; x=1795068248;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=dX8YmdMGobP5ZbSMBBfmOBe7FcW65gKnUBwBwQWwdhI=;
  b=kz6GOXLa+FDT3gHjqs6hlmKPasWI7PJcQ6oQ7fC742C8wSzfEAmzXiT6
   MwUfkNdqjkthjo/OeGOJsHHY1YqGg47ucx1MpaKh0wX5pkTjPCUPBYuud
   i96lYZB7GVhjZqtZjFIAw6u3gZmB/g7xu+xMvQ+uTySod1gBQ9CdWIq0i
   p4LoTpt7j1oZHGvWidJpxzF28Jf/2PWOkKNjedr3U+uQxTS/tHMtx3E97
   c+lLG26Q7PCERKSGYTlztnDAxSvodwsvoNOlrzEebTv3c2KRIPwwEbQX+
   bd3MVJgGi4Q3Enz0z077TvAJ7lRoUSQnakw5l/Rs9mE3SJQJLtm1HFhJn
   g==;
X-CSE-ConnectionGUID: PXr7b4tGRGC0ZSbvTJ+4Pw==
X-CSE-MsgGUID: 0SWrzWTBQaqVQQNzm+sXcQ==
X-IPAS-Result: =?us-ascii?q?A0BFAgBsG+xq/5EQJK1aHgEBCxIMggULgld1YUJJA5Qng?=
 =?us-ascii?q?iGBFp0OgSQDVw8BAQEPRA0EAQGEP45lAiY0CQ4BAgQDAgMBAQEBAQEBAQEBA?=
 =?us-ascii?q?QEKAQEFAQEBAgEHBYEOE4ZPDZASATgBcgMBAlojGQiDAgGCdAMRvDSCLIEBg?=
 =?us-ascii?q?maBAwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKBFYJzdoEFgVwCA4FFhl4Eg?=
 =?us-ascii?q?g0VgQyBWoEDgiKJcwKBUoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F?=
 =?us-ascii?q?4EHGwYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIE?=
 =?us-ascii?q?gkBExosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3F?=
 =?us-ascii?q?RkEPm4Hki+DDwEBWQEHEwcTASsFS0tSFgghDw8EozOCHp9WgT4KKIN4jCSVO?=
 =?us-ascii?q?hozhVulFguYfYs3glOVaWiEaYFoPDmBIHAVO4JnCUoZD445g2uCZIEjgQzJL?=
 =?us-ascii?q?jw1CwMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:r2IpBql4tUZCCG54xGtq2T7o5gzRJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIeWmjUaf2DYmKnetB+b43k9kID7JLXyIdnHgZrqy41EltH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtNs/7b8nuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FbUo4Ll9XX1hz
 9MzcAI2ZA6/paHq+K3uH4GAhux7RCXqFIobvnclyXTSCuwrBMiTBa7L/tRfmjw3g6iiH96HO
 JFfMmQpNUqGOkESUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIqFJ4zTGJQPzy50o
 EqexFvjEC4mHuWW0AS8y1S+g6zUrSjCDdd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS4QWJzO/Qpg2eHGVBFm4HY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:O9kOra4UdvQfUzunKwPXwPjXdLJyesId70hD6qkXc202TiX2ra
 6TdZgguCMc6wxhO03I5+rgBEDoexq1nvRICOIqUotKMjOLhILRFuFfxLqn5SH8ECvj8eMY/6
 Jhf69iTODUNzFB/KPHCM3SKadG/DFBm5rY4dvj8w==
X-Talos-CUID: 9a23:ViHq221g+LSAbUp3evAIYLxfIvA/LXeB0FjqDGTgO11jVoG3CgOo5/Yx
X-Talos-MUID: 9a23:qZ1uVQnDCd8AD85+bdy6dno6D/hy8ZuSInkEiKs/gu+WMG9rCzyk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="885815929"
Received: from alln-l-core-08.cisco.com ([173.36.16.145])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:04:07 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-08.cisco.com (Postfix) with ESMTPS id 965BF18000443
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:04:06 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 99663CC1295; Thu,  5 Nov 2026 11:34:04 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 1/2] containerd: Fix CVE-2026-95837
Date: Thu,  5 Nov 2026 11:33:53 +0530
Message-Id: <20261105060354.1290580-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-08.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10150
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 fix for
CVE-2026-95837. It disables checkpoint restore through
CreateContainer by default, while keeping an explicit opt-in for
users who need this experimental behavior. The upstream fix is
referenced in [1], and the Debian tracker entry that records the fix
commit is referenced in [2].

[1] https://github.com/containerd/containerd/commit/5c3a47036ec08f8a7517a01a0baf113d6146eca0
[2] https://security-tracker.debian.org/tracker/CVE-2026-95837

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-95837.patch           | 231 +++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-95837.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-95837.patch b/recipes-containers/containerd/containerd/CVE-2026-95837.patch
new file mode 100644
index 00000000..e3e03d21
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-95837.patch
@@ -0,0 +1,231 @@
+From 746209812edc4b43ca19f8b0ee7b6627d2f7eca5 Mon Sep 17 00:00:00 2001
+From: Samuel Karp <me@samuelkarp.com>
+Date: Sun, 25 Oct 2026 23:23:55 -0700
+Subject: [PATCH] cri: disable restore in CreateContainer by default
+
+Checkpoint restore via CreateContainer was intended to be experimental,
+but was enabled by default. While the enable_criu knob can disable CRIU
+entirely, explicit forensic checkpoints still benefit from CRIU while
+restore via CreateContainer should be disabled by default.
+
+Add the enable_experimental_restore_via_create configuration knob to
+control restore via CreateContainer independently from enable_criu,
+defaulting to disabled.
+
+CVE: CVE-2026-95837
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/5c3a47036ec08f8a7517a01a0baf113d6146eca0]
+
+Backport Changes:
+- The release/2.2 fix assumes two CRIU controls already present in
+  that branch: the enable_criu configuration option [1] and checkCriu
+  availability and version validation [2]. Containerd 2.2.2 has
+  neither. Carrying both controls would add broader CRIU functionality,
+  so this backport instead disables CreateContainer restore by default
+  and adds a separate opt-in configuration.
+- The docs/cri/config.md comment uses concise target wording: it describes the
+  option as allowing checkpoint restore via CreateContainer and says it is
+  disabled by default, omitting upstream's expanded experimental wording.
+- Keep the v2/v3 config documentation and equivalent regression tests for
+  default denial and TOML/JSON parsing. Omit README.md (unrelated link
+  change), RELEASES.md (release notes), contrib checkpoint shell tests
+  (standalone integration scripts not run by this recipe), and
+  enable_criu_linux_test.go (tests for the unavailable CRIU controls).
+
+References:
+[1] https://github.com/containerd/containerd/commit/7d41b25c9884c0f94acdb0f7e78fbab2752fccb6
+[2] https://github.com/containerd/containerd/commit/48116fa596fd0e926749dcdfd3ef92da00fc6dc8
+
+Assisted-by: Antigravity
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 928c03c6898cad95f795300281fdff0dbc55a32f)
+(cherry picked from commit 5c3a47036ec08f8a7517a01a0baf113d6146eca0)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ docs/cri/config.md                            |  5 ++
+ internal/cri/config/config.go                 |  5 ++
+ internal/cri/config/config_test.go            | 46 +++++++++++++++++++
+ internal/cri/config/config_unix.go            | 25 +++++-----
+ internal/cri/config/config_windows.go         |  3 +-
+ .../cri/server/container_checkpoint_linux.go  |  4 ++
+ .../server/container_checkpoint_linux_test.go |  6 +++
+ 7 files changed, 81 insertions(+), 13 deletions(-)
+
+diff --git a/docs/cri/config.md b/docs/cri/config.md
+index 49c81a272..ba11e0982 100644
+--- a/docs/cri/config.md
++++ b/docs/cri/config.md
+@@ -272,6 +272,7 @@ version = 3
+     cdi_spec_dirs = ['/etc/cdi', '/var/run/cdi']
+     drain_exec_sync_io_timeout = '0s'
+     ignore_deprecation_warnings = []
++    enable_experimental_restore_via_create = false
+ 
+     [plugins.'io.containerd.cri.v1.runtime'.containerd]
+       default_runtime_name = 'runc'
+@@ -470,6 +471,10 @@ version = 2
+   # For example, the value can be '5h', '2h30m', '10s'.
+   drain_exec_sync_io_timeout = "0s"
+ 
++  # enable_experimental_restore_via_create allows restoring checkpoints via
++  # CreateContainer. This is disabled by default.
++  enable_experimental_restore_via_create = false
++
+   # 'plugins."io.containerd.grpc.v1.cri".x509_key_pair_streaming' contains a x509 valid key pair to stream with tls.
+   [plugins."io.containerd.grpc.v1.cri".x509_key_pair_streaming]
+     # tls_cert_file is the filepath to the certificate paired with the "tls_key_file"
+diff --git a/internal/cri/config/config.go b/internal/cri/config/config.go
+index 98d62a705..0c86b6648 100644
+--- a/internal/cri/config/config.go
++++ b/internal/cri/config/config.go
+@@ -427,6 +427,11 @@ type RuntimeConfig struct {
+ 	// IgnoreDeprecationWarnings is the list of the deprecation IDs (such as "io.containerd.deprecation/pull-schema-1-image")
+ 	// that should be ignored for checking "ContainerdHasNoDeprecationWarnings" condition.
+ 	IgnoreDeprecationWarnings []string `toml:"ignore_deprecation_warnings" json:"ignoreDeprecationWarnings"`
++
++	// EnableExperimentalRestoreViaCreate enables experimental restore of container checkpoints via CreateContainer.
++	// When set to false, checkpoint restore via CreateContainer will be disabled.
++	// Default: false
++	EnableExperimentalRestoreViaCreate bool `toml:"enable_experimental_restore_via_create" json:"enableExperimentalRestoreViaCreate"`
+ }
+ 
+ // X509KeyPairStreaming contains the x509 configuration for streaming
+diff --git a/internal/cri/config/config_test.go b/internal/cri/config/config_test.go
+index a9134ed9d..10a8432ff 100644
+--- a/internal/cri/config/config_test.go
++++ b/internal/cri/config/config_test.go
+@@ -18,9 +18,11 @@ package config
+ 
+ import (
+ 	"context"
++	"encoding/json"
+ 	"runtime"
+ 	"testing"
+ 
++	"github.com/pelletier/go-toml/v2"
+ 	"github.com/stretchr/testify/assert"
+ 	criruntime "k8s.io/cri-api/pkg/apis/runtime/v1"
+ 
+@@ -508,3 +510,47 @@ func TestCheckLocalImagePullConfigs(t *testing.T) {
+ 		})
+ 	}
+ }
++
++func TestParseEnableExperimentalRestoreViaCreate(t *testing.T) {
++	testCases := []struct {
++		name            string
++		tomlStr         string
++		expectedRestore bool
++	}{
++		{
++			name:            "enabled",
++			tomlStr:         "enable_experimental_restore_via_create = true",
++			expectedRestore: true,
++		},
++		{
++			name:            "disabled",
++			tomlStr:         "enable_experimental_restore_via_create = false",
++			expectedRestore: false,
++		},
++		{
++			name:            "absent defaults to disabled",
++			tomlStr:         "# no restore setting",
++			expectedRestore: false,
++		},
++	}
++
++	for _, tc := range testCases {
++		t.Run(tc.name, func(t *testing.T) {
++			cfg := DefaultRuntimeConfig()
++			err := toml.Unmarshal([]byte(tc.tomlStr), &cfg)
++			assert.NoError(t, err)
++			assert.Equal(t, tc.expectedRestore, cfg.EnableExperimentalRestoreViaCreate)
++		})
++	}
++}
++
++func TestJSONEnableExperimentalRestoreViaCreate(t *testing.T) {
++	cfg := DefaultRuntimeConfig()
++	err := json.Unmarshal([]byte(`{"enableExperimentalRestoreViaCreate":true}`), &cfg)
++	assert.NoError(t, err)
++	assert.True(t, cfg.EnableExperimentalRestoreViaCreate)
++
++	b, err := json.Marshal(cfg)
++	assert.NoError(t, err)
++	assert.Contains(t, string(b), `"enableExperimentalRestoreViaCreate":true`)
++}
+diff --git a/internal/cri/config/config_unix.go b/internal/cri/config/config_unix.go
+index 7c4514b68..5694e6ac5 100644
+--- a/internal/cri/config/config_unix.go
++++ b/internal/cri/config/config_unix.go
+@@ -97,17 +97,18 @@ func DefaultRuntimeConfig() RuntimeConfig {
+ 				},
+ 			},
+ 		},
+-		EnableSelinux:                    false,
+-		SelinuxCategoryRange:             1024,
+-		MaxContainerLogLineSize:          16 * 1024,
+-		DisableProcMount:                 false,
+-		TolerateMissingHugetlbController: true,
+-		DisableHugetlbController:         true,
+-		IgnoreImageDefinedVolumes:        false,
+-		EnableCDI:                        true,
+-		CDISpecDirs:                      []string{"/etc/cdi", "/var/run/cdi"},
+-		DrainExecSyncIOTimeout:           "0s",
+-		EnableUnprivilegedPorts:          true,
+-		EnableUnprivilegedICMP:           true,
++		EnableSelinux:                      false,
++		SelinuxCategoryRange:               1024,
++		MaxContainerLogLineSize:            16 * 1024,
++		DisableProcMount:                   false,
++		TolerateMissingHugetlbController:   true,
++		DisableHugetlbController:           true,
++		IgnoreImageDefinedVolumes:          false,
++		EnableCDI:                          true,
++		CDISpecDirs:                        []string{"/etc/cdi", "/var/run/cdi"},
++		DrainExecSyncIOTimeout:             "0s",
++		EnableUnprivilegedPorts:            true,
++		EnableUnprivilegedICMP:             true,
++		EnableExperimentalRestoreViaCreate: false,
+ 	}
+ }
+diff --git a/internal/cri/config/config_windows.go b/internal/cri/config/config_windows.go
+index 789d499c6..716d00863 100644
+--- a/internal/cri/config/config_windows.go
++++ b/internal/cri/config/config_windows.go
+@@ -86,6 +86,7 @@ func DefaultRuntimeConfig() RuntimeConfig {
+ 		IgnoreImageDefinedVolumes: false,
+ 		// TODO(windows): Add platform specific config, so that most common defaults can be shared.
+ 
+-		DrainExecSyncIOTimeout: "0s",
++		DrainExecSyncIOTimeout:             "0s",
++		EnableExperimentalRestoreViaCreate: false,
+ 	}
+ }
+diff --git a/internal/cri/server/container_checkpoint_linux.go b/internal/cri/server/container_checkpoint_linux.go
+index 26f0d9b25..dc6c13d0c 100644
+--- a/internal/cri/server/container_checkpoint_linux.go
++++ b/internal/cri/server/container_checkpoint_linux.go
+@@ -189,6 +189,10 @@ func (c *criService) CRImportCheckpoint(
+ 	sandbox *sandbox.Sandbox,
+ 	sandboxConfig *runtime.PodSandboxConfig,
+ ) (ctrID string, retErr error) {
++	if !c.config.EnableExperimentalRestoreViaCreate {
++		return "", errors.New("checkpoint restore via CreateContainer is disabled by configuration")
++	}
++
+ 	var mountPoint string
+ 	start := time.Now()
+ 	// Ensure that the image to restore the checkpoint from has been provided.
+diff --git a/internal/cri/server/container_checkpoint_linux_test.go b/internal/cri/server/container_checkpoint_linux_test.go
+index 740a52100..5ba9d73ad 100644
+--- a/internal/cri/server/container_checkpoint_linux_test.go
++++ b/internal/cri/server/container_checkpoint_linux_test.go
+@@ -235,3 +235,9 @@ func TestCheckpointArchiveEntryAllowed(t *testing.T) {
+ 		})
+ 	}
+ }
++
++func TestCRImportCheckpointRestoreViaCreateDisabledByDefault(t *testing.T) {
++	c := newTestCRIService()
++	_, err := c.CRImportCheckpoint(context.Background(), nil, nil, nil)
++	require.ErrorContains(t, err, "checkpoint restore via CreateContainer is disabled by configuration")
++}
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 48d41dbc..176bdc7e 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-53495.patch \
            file://CVE-2026-53493_p1.patch \
            file://CVE-2026-53493_p2.patch \
+           file://CVE-2026-95837.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6

