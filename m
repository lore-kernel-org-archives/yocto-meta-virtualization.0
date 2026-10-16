Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55621CCA464
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:07:05 +0000 (UTC)
Received: from aer-iport-3.cisco.com (aer-iport-3.cisco.com [173.38.203.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18333.1792145219057724180
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 03:06:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=h0wlywZ4;
 spf=pass (domain: cisco.com, ip: 173.38.203.53, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11194; q=dns/txt;
  s=iport01; t=1792145219; x=1793354819;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Ms34afJlAL1DTQoGICVwEZCZYfPV1GKsMT1n9G3ifAM=;
  b=h0wlywZ4EjfNhZfcZ8PhD7Zxo1xosWroKWEAj40T8rvYQKyKHcpIXM67
   EygAAl9T35Os+vfheN65zXw1ZNK+dhZ6ZU4IT/OHLQ9be6olq/jpqPlhv
   6EapRX+un235wE41SYUPTdZAiSfjqJiQhaYhPk8Zx4cv7elxGHlZat3bS
   rYH2ioqVFqtD/rbVf/ykz95Ceb6NxKHcS9jkxH8frFImDRXLcDM+OYLDT
   2HGcTYBaZ/oLZjCycaysl+fMN/KAGk29S5tgON2PdRNNtLUYqzlejkoWs
   KlarHkz1tDto+sq4nBWGuWgfSPUnWNl+DxxcB2Tzp1XSvwqxCjZ0ba9Tn
   A==;
X-CSE-ConnectionGUID: LkJfoujFT4W/2IAD+wIm3w==
X-CSE-MsgGUID: EhmYw0gzQzaoIZOG+WVeYg==
X-IPAS-Result: =?us-ascii?q?A0AoAAAs9tFq/85K/pBaHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJjHKHN4IhA4tlhWWMUhSBEANXDwEBAQ9EDQQBAYISgi1GAo4VAiY0C?=
 =?us-ascii?q?Q4BAgQDAgMBAQEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAycLA?=
 =?us-ascii?q?VYcAwECLyALIwgRCAmCeQGCOgM3AxEGvTWBeTOBAYNpAkNQ2EsNgloBCxQBg?=
 =?us-ascii?q?TgBhT+Cf4UkXRgBhHwnGxuBcoR+gQWBGkIBAYEjJYZdBIIigQyBWh6VKUiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BK?=
 =?us-ascii?q?ylhEBeBCYIHAoJUggACAUlBDgdFUwklQxJHJiIIEgkBExowC4EbODwJKEEXD?=
 =?us-ascii?q?HMMHQVyCAINCQcpGA1IESw3FRkEPm4HkhQegmUWFwQoIgcMASoBBSofBkcoK?=
 =?us-ascii?q?RgHk0OSUIE4nmlxCiiDdowijz6FfBozhASBV6UUC5h9gWR1iF6CU4QJkWkgB?=
 =?us-ascii?q?jeEaYFoPDmBDgsHcBWDIglKGQ+OLQwLg2CBf2WCL4E9x3I8NQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiRHmABAQ?=
IronPort-Data: A9a23:Cuz/EKg26pEP3/lYDX/V0DpDX161NhEKZh0ujC45NGQN5FlHY01je
 htvXW2GPqmINjahKdFzbd/n8kpSsMDVy4VhGwRk/HwxFi9jpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vd8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqU8+cR5BnxM2
 8BEF3dXTzmvxP2XxemkH7wEasQLdKEHPasWt2slyXTSCuwrBMieBa7L/tRfmjw3g6iiH96HO
 5ZfM2czKkucJUcXZD/7C7pm9AusrnXyfidRtFKSjaE2+GPUigd21dABNfKIK4TaGp4LwS50o
 Err/2HIHUkVJuWNwD2kwFWDxdDxkBL0Ddd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS4QyXj66R6AGDCy1cE3hKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Nxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:UtvUQ6hMMC03gXDfRqurSJkoyXBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3ApOkkEGltiXBep6GrJY+xgPSVcjnXOVne7nnXPk2?=
 =?us-ascii?q?WNTpWD+e0YHPT54JhyNU7zg=3D=3D?=
X-Talos-MUID: 9a23:W6mWFQimDUdswUw8dCyKAsMpGcdt0rv2B1I0g5wBmvujGm9PBTqsg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="59087367"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 10:06:56 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id 2C5F918000382
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:06:56 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id CB6ACCC1295; Fri, 16 Oct 2026 15:36:54 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/5] containerd: Fix CVE-2026-53492
Date: Fri, 16 Oct 2026 15:36:38 +0530
Message-Id: <20261016100641.1628059-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016100641.1628059-1-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-05.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10115

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for CVE-2026-53492.
The upstream fix commit is referenced in [1], and the public CVE record
is referenced in [2].

[1] https://github.com/containerd/containerd/commit/be8460656b84c4a1a4b244a03801e9fff1e914d3
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-53492

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-53492.patch           | 274 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 275 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53492.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-53492.patch b/recipes-containers/containerd/containerd/CVE-2026-53492.patch
new file mode 100644
index 00000000..b291d94a
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53492.patch
@@ -0,0 +1,274 @@
+From 4e572a31ab40c4c04f72c133b47b87d0d79e38c2 Mon Sep 17 00:00:00 2001
+From: Samuel Karp <samuelkarp@google.com>
+Date: Mon, 8 Jun 2026 00:58:16 +0000
+Subject: [PATCH 2/4] cri: filter CDI annotations on checkpoint restore
+
+Filter out any annotations on the checkpointed container matching
+`cdi.k8s.io/` or exactly `cdi.k8s.io` during restore to prevent
+unauthorized device restoration. When an annotation is denied, a warning
+log is generated.
+
+Tested by:
+* Unit tests for exact matching, prefix boundaries, and metadata merging
+* Complete CRI integration and checkpoint restore suite
+
+Assisted-by: Antigravity
+
+CVE: CVE-2026-53492
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/be8460656b84c4a1a4b244a03801e9fff1e914d3]
+
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 861ffc1097685f9ecf13adaa381aca5fdf7ef0b4)
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit be8460656b84c4a1a4b244a03801e9fff1e914d3)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../checkpoint/checkpoint-restore-cri-test.sh |  22 +++-
+ .../cri/server/container_checkpoint_linux.go  |  56 ++++++---
+ .../server/container_checkpoint_linux_test.go | 107 ++++++++++++++++++
+ 3 files changed, 167 insertions(+), 18 deletions(-)
+ create mode 100644 internal/cri/server/container_checkpoint_linux_test.go
+
+diff --git a/contrib/checkpoint/checkpoint-restore-cri-test.sh b/contrib/checkpoint/checkpoint-restore-cri-test.sh
+index 44e42426b..e8c5c77c1 100755
+--- a/contrib/checkpoint/checkpoint-restore-cri-test.sh
++++ b/contrib/checkpoint/checkpoint-restore-cri-test.sh
+@@ -56,6 +56,15 @@ TESTDATA=testdata
+ # shellcheck disable=SC2034
+ export CONTAINERD_ADDRESS="$TESTDIR/c.sock"
+ export CONTAINER_RUNTIME_ENDPOINT="unix:///${CONTAINERD_ADDRESS}"
++
++# Generate crictl config file with 30s timeout
++export CRI_CONFIG_FILE="${TESTDIR}/crictl.yaml"
++cat <<EOF > "${CRI_CONFIG_FILE}"
++runtime-endpoint: unix://${CONTAINERD_ADDRESS}
++image-endpoint: unix://${CONTAINERD_ADDRESS}
++timeout: 30
++EOF
++
+ TEST_IMAGE=ghcr.io/containerd/alpine
+ 
+ function test_from_archive() {
+@@ -69,9 +78,12 @@ function test_from_archive() {
+ 	echo -n "--> Start pod: "
+ 	pod_id=$(crictl runp "$POD_JSON")
+ 	echo "$pod_id"
++	CTR_JSON=$(mktemp)
++	jq '.annotations = {"cdi.k8s.io/device":"gpu","safe.annotation":"true"}' "$TESTDATA"/container_sleep.json >"$CTR_JSON"
+ 	echo -n "--> Create container: "
+-	ctr_id=$(crictl create "$pod_id" "$TESTDATA"/container_sleep.json "$POD_JSON")
++	ctr_id=$(crictl create "$pod_id" "$CTR_JSON" "$POD_JSON")
+ 	echo "$ctr_id"
++	rm -f "$CTR_JSON"
+ 	echo -n "--> Start container: "
+ 	crictl start "$ctr_id"
+ 	lines_before=$(crictl logs "$ctr_id" | wc -l)
+@@ -108,6 +120,12 @@ function test_from_archive() {
+ 			"should be larger than before checkpointing ($lines_before)"
+ 		false
+ 	fi
++	echo "--> Verifying CDI annotation filtering on restore: "
++	actual_annots=$(crictl inspect "$ctr_id" | jq -c '.status.annotations')
++	if jq -e 'has("cdi.k8s.io/device") or (has("safe.annotation") | not)' <<<"$actual_annots" >/dev/null; then
++		echo "error: CDI annotation was not filtered or safe annotation missing: $actual_annots"
++		exit 1
++	fi
+ 	# Cleanup
+ 	echo "--> Cleanup images: "
+ 	(crictl rmi "${TEST_IMAGE}" || true) | sed 's/^/----> \t/'
+@@ -192,6 +210,8 @@ function test_from_oci() {
+ 
+ cat >"${TESTDIR}/config.toml" <<EOF
+ version = 3
++[plugins."io.containerd.cri.v1.runtime"]
++  enable_cdi = false
+ [plugins."io.containerd.cri.v1.runtime".containerd]
+   default_runtime_name = "test-runtime"
+ [plugins.'io.containerd.cri.v1.runtime'.containerd.runtimes.test-runtime]
+diff --git a/internal/cri/server/container_checkpoint_linux.go b/internal/cri/server/container_checkpoint_linux.go
+index b122c392d..13cd3e2e1 100644
+--- a/internal/cri/server/container_checkpoint_linux.go
++++ b/internal/cri/server/container_checkpoint_linux.go
+@@ -290,23 +290,11 @@ func (c *criService) CRImportCheckpoint(
+ 		}
+ 	}
+ 
+-	if createAnnotations != nil {
+-		// The hash also needs to be update or Kubernetes thinks the container needs to be restarted
+-		_, ok1 := createAnnotations["io.kubernetes.container.hash"]
+-		_, ok2 := originalAnnotations["io.kubernetes.container.hash"]
+-
+-		if ok1 && ok2 {
+-			originalAnnotations["io.kubernetes.container.hash"] = createAnnotations["io.kubernetes.container.hash"]
+-		}
+-
+-		// The restart count also needs to be correctly updated
+-		_, ok1 = createAnnotations["io.kubernetes.container.restartCount"]
+-		_, ok2 = originalAnnotations["io.kubernetes.container.restartCount"]
+-
+-		if ok1 && ok2 {
+-			originalAnnotations["io.kubernetes.container.restartCount"] = createAnnotations["io.kubernetes.container.restartCount"]
+-		}
+-	}
++	originalAnnotations = filterAndMergeAnnotations(
++		ctx,
++		originalAnnotations,
++		createAnnotations,
++	)
+ 
+ 	var containerdImage client.Image
+ 
+@@ -737,3 +725,37 @@ func writeSpecDumpFile(ctx context.Context, store content.Store, desc v1.Descrip
+ 
+ 	return nil
+ }
++
++func filterAndMergeAnnotations(
++	ctx context.Context,
++	checkpointAnnotations map[string]string,
++	createAnnotations map[string]string,
++) map[string]string {
++	result := make(map[string]string)
++
++	for k, v := range checkpointAnnotations {
++		if strings.HasPrefix(k, "cdi.k8s.io/") || k == "cdi.k8s.io" {
++			log.G(ctx).Warnf("Denying annotation %q in checkpoint restore", k)
++			continue
++		}
++		result[k] = v
++	}
++
++	// The hash also needs to be update or Kubernetes thinks the container needs to be restarted
++	_, ok1 := createAnnotations["io.kubernetes.container.hash"]
++	_, ok2 := result["io.kubernetes.container.hash"]
++
++	if ok1 && ok2 {
++		result["io.kubernetes.container.hash"] = createAnnotations["io.kubernetes.container.hash"]
++	}
++
++	// The restart count also needs to be correctly updated
++	_, ok1 = createAnnotations["io.kubernetes.container.restartCount"]
++	_, ok2 = result["io.kubernetes.container.restartCount"]
++
++	if ok1 && ok2 {
++		result["io.kubernetes.container.restartCount"] = createAnnotations["io.kubernetes.container.restartCount"]
++	}
++
++	return result
++}
+diff --git a/internal/cri/server/container_checkpoint_linux_test.go b/internal/cri/server/container_checkpoint_linux_test.go
+new file mode 100644
+index 000000000..3010e5233
+--- /dev/null
++++ b/internal/cri/server/container_checkpoint_linux_test.go
+@@ -0,0 +1,107 @@
++//go:build linux
++
++/*
++   Copyright The containerd Authors.
++
++   Licensed under the Apache License, Version 2.0 (the "License");
++   you may not use this file except in compliance with the License.
++   You may obtain a copy of the License at
++
++       http://www.apache.org/licenses/LICENSE-2.0
++
++   Unless required by applicable law or agreed to in writing, software
++   distributed under the License is distributed on an "AS IS" BASIS,
++   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
++   See the License for the specific language governing permissions and
++   limitations under the License.
++*/
++
++package server
++
++import (
++	"context"
++	"sync"
++	"testing"
++
++	"github.com/containerd/log"
++	"github.com/sirupsen/logrus"
++	"github.com/stretchr/testify/assert"
++)
++
++type testLogHook struct {
++	mu      sync.Mutex
++	entries []string
++}
++
++func (h *testLogHook) Levels() []logrus.Level {
++	return []logrus.Level{logrus.WarnLevel}
++}
++
++func (h *testLogHook) Fire(entry *logrus.Entry) error {
++	h.mu.Lock()
++	defer h.mu.Unlock()
++	h.entries = append(h.entries, entry.Message)
++	return nil
++}
++
++func TestFilterAndMergeAnnotations(t *testing.T) {
++	for desc, tc := range map[string]struct {
++		checkpointAnnotations map[string]string
++		createAnnotations     map[string]string
++		expectedAnnotations   map[string]string
++		expectedWarnings      []string
++	}{
++		"cdi denied prefix boundaries": {
++			checkpointAnnotations: map[string]string{
++				"cdi.k8s.io/device":   "gpu",
++				"cdi.k8s.io/":         "true",
++				"cdi.k8s.io":          "true",
++				"safe.org/cdi.k8s.io": "ignored",
++				"other":               "val",
++			},
++			expectedAnnotations: map[string]string{
++				"safe.org/cdi.k8s.io": "ignored",
++				"other":               "val",
++			},
++			expectedWarnings: []string{
++				`Denying annotation "cdi.k8s.io/device" in checkpoint restore`,
++				`Denying annotation "cdi.k8s.io/" in checkpoint restore`,
++				`Denying annotation "cdi.k8s.io" in checkpoint restore`,
++			},
++		},
++
++		"createAnnotations update kubernetes metadata if present in both": {
++			checkpointAnnotations: map[string]string{
++				"io.kubernetes.container.hash":         "old-hash",
++				"io.kubernetes.container.restartCount": "1",
++				"safe.annotation":                      "2",
++			},
++			createAnnotations: map[string]string{
++				"io.kubernetes.container.hash":         "new-hash",
++				"io.kubernetes.container.restartCount": "2",
++			},
++			expectedAnnotations: map[string]string{
++				"io.kubernetes.container.hash":         "new-hash",
++				"io.kubernetes.container.restartCount": "2",
++				"safe.annotation":                      "2",
++			},
++		},
++	} {
++		t.Run(desc, func(t *testing.T) {
++			logger := logrus.New()
++			logger.SetLevel(logrus.WarnLevel)
++			hook := &testLogHook{}
++			logger.AddHook(hook)
++			ctx := log.WithLogger(context.Background(), logrus.NewEntry(logger))
++
++			res := filterAndMergeAnnotations(
++				ctx,
++				tc.checkpointAnnotations,
++				tc.createAnnotations,
++			)
++
++			assert.Equal(t, tc.expectedAnnotations, res)
++			assert.ElementsMatch(t, tc.expectedWarnings, hook.entries)
++		})
++	}
++}
+-- 
+2.35.6
+
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 4e8d95ee..b2e9187a 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -14,6 +14,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-47262.patch \
            file://CVE-2026-53488.patch \
            file://CVE-2026-50195.patch \
+           file://CVE-2026-53492.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


