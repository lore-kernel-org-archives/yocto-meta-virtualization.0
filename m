Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72675C531CA
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:41:51 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23775.1784814108341118653
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 06:41:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aFnKytqi;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8751; q=dns/txt;
  s=iport01; t=1784814108; x=1786023708;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=5mj6e/DU7jtxu5K1u8Wl/SXQYO+jzAS6W4qjdrVTnuc=;
  b=aFnKytqipkem2dV6ObQn+17Lr9lCNSIukGusAPd+U7hpBFRVRRKlf5Tt
   Crwj0thM28iRgfGP7U58JRDw6TihO9IOc63gjdF2JOmy4NoBafokt7S6x
   XW75NaLWN604kIjZuxhLOKaoSaMCoSE9lUjKL+Nm8sqOWiC5EZubEbMj+
   wnuW0X/+bi/SYc4jJHog6E19lW9TjdMzpHrm6EhQx/Iqdq7cKoX+ZdxZ7
   IztyDuEGZoShSDaCaXFmCGP1fLwKeklMO1hqlUbtT20oJU2AhSIzG7xqy
   EFZgFXgW9LO/VwfyD9IzV32AhyEVDuXKtvpbQbNM25HMmwKfFlC+Fflny
   A==;
X-CSE-ConnectionGUID: QXX3AyP6R6yVMeuNG4DTUA==
X-CSE-MsgGUID: DFxVofmjSe2KzPHF2TRJTA==
X-IPAS-Result: =?us-ascii?q?A0BEAgA1GWJq/5P/Ja1aH4I6gld0X0JJA5QmgiGBFp0Ig?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD+OIgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaATgBcgMBAlojGQiDAgGCdAMRwkyCLIEBgmaBAgEBQ1DbL?=
 =?us-ascii?q?gELFAGBOIU/iCBcGAGEfCcbG4FygRWCc3aBBYFcAoFKhlsEgiKBDIFaHpAkS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BLHmEWyMfAzl/g?=
 =?us-ascii?q?TB1SnctahIXgSaDSQKBHQMLGA1IESw3FBkEPm4HjWQjgkAxShMBKwUSGCErI?=
 =?us-ascii?q?DI2KSKTDEKPZYIegTifWgoog3WMIZU6GjOEBIFXpRELmH2CWYheglOVc12Ea?=
 =?us-ascii?q?YFoPIFZcBWDIglKGQ9WjWKDa4RdNsVCPDULAy8BAQcCBw4DC4FokAGBfQEB?=
IronPort-Data: A9a23:iRF2GK5M4jW3lIZFGn/fhgxRtGvGchMFZxGqfqrLsTDasY5as4F+v
 mIfCmjSPveCMWX0KN53b4+x8h4EuZDdzt4xGlA4ry5mZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1OsPrawP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eBL0ooc9mOT90q
 +0mDT0QSD/fq96L6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGMiFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEQUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMJoHUH5oIzi50o
 Erq0XTHBR8fNueSkxmXylKC3NP1vx/SDdd6+LqQs6QCbEeo7mkeFBRTS1qhveSwjk+sUs5eL
 Eo8/is1sbN05UugUt7lRRq6rXWY+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2YHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Jh4+xqGq33PY4C9KpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: 9a23:Y0TQRGGKOa1KqE5BqmJexH5PM9EdLEeD3Un1LlKeJjpFdIC8HAo=
X-Talos-MUID: 9a23:i4DHeQrvFxvT8sXLfYcezx1MJPlv7aGsM01Xsoc+m+feCRZSBx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="514562758"
Received: from rcdn-l-core-10.cisco.com ([173.37.255.147])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:41:47 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-10.cisco.com (Postfix) with ESMTPS id 0B74D18000885
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2026 13:41:47 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2D2CBCC037D; Thu, 23 Jul 2026 19:11:45 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH] podman: fix CVE-2026-57231
Date: Thu, 23 Jul 2026 19:11:24 +0530
Message-Id: <20260723134124.2502950-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2026 13:41:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9977

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream v5.8 branch backport for
CVE-2026-57231. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2]. The backported
commit link is recorded in the embedded patch header.

[1] https://github.com/podman-container-tools/podman/commit/85832029d537c2c0df89e47d4a03d55ba099a848
[2] https://security-tracker.debian.org/tracker/CVE-2026-57231

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../podman/podman/CVE-2026-57231.patch        | 219 ++++++++++++++++++
 recipes-containers/podman/podman_git.bb       |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 recipes-containers/podman/podman/CVE-2026-57231.patch

diff --git a/recipes-containers/podman/podman/CVE-2026-57231.patch b/recipes-containers/podman/podman/CVE-2026-57231.patch
new file mode 100644
index 00000000..d24ee215
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2026-57231.patch
@@ -0,0 +1,219 @@
+From a1c1b4c0354814cd55aac95ce98059dc8b88360d Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Wed, 17 Jun 2026 18:41:23 +0200
+Subject: [PATCH] fix image host env leak
+
+When parsing image envs we need to be strict about the format, only the
+"key=value" format must be accepted. Just keys must be rejected as they
+are not valid according to the image spec.
+
+CVE: CVE-2026-57231
+Upstream-Status: Backport [https://github.com/podman-container-tools/podman/commit/85832029d537c2c0df89e47d4a03d55ba099a848]
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 6c431b73dbf8e4b20b778644d7a80caebdb75050)
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+(cherry picked from commit 85832029d537c2c0df89e47d4a03d55ba099a848)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/specgen/generate/container.go      | 17 +++++--
+ pkg/specgen/generate/container_test.go | 66 ++++++++++++++++++++++++++
+ pkg/specgen/generate/kube/kube.go      |  7 ++-
+ test/system/030-run.bats               | 52 ++++++++++++++++++++
+ 4 files changed, 135 insertions(+), 7 deletions(-)
+ create mode 100644 pkg/specgen/generate/container_test.go
+
+diff --git a/pkg/specgen/generate/container.go b/pkg/specgen/generate/container.go
+index 4d60cb3142..fd610cfc3f 100644
+--- a/pkg/specgen/generate/container.go
++++ b/pkg/specgen/generate/container.go
+@@ -123,6 +123,18 @@ func applyHealthCheckOverrides(s *specgen.SpecGenerator, healthCheckFromImage *m
+ 	return nil
+ }
+ 
++func ParseImageEnvs(imageEnvs []string) (map[string]string, error) {
++	envs := make(map[string]string, len(imageEnvs))
++	for _, env := range imageEnvs {
++		key, val, hasValue := strings.Cut(env, "=")
++		if !hasValue || key == "" {
++			return nil, fmt.Errorf("invalid image env variable %q", env)
++		}
++		envs[key] = val
++	}
++	return envs, nil
++}
++
+ // Fill any missing parts of the spec generator (e.g. from the image).
+ // Returns a set of warnings or any fatal error that occurred.
+ func CompleteSpec(ctx context.Context, r *libpod.Runtime, s *specgen.SpecGenerator) ([]string, error) {
+@@ -168,15 +180,14 @@ func CompleteSpec(ctx context.Context, r *libpod.Runtime, s *specgen.SpecGenerat
+ 	if err != nil {
+ 		return nil, fmt.Errorf("parsing fields in containers.conf: %w", err)
+ 	}
+-	var envs map[string]string
+ 
+ 	// Image Environment defaults
+ 	if inspectData != nil {
+ 		// Image envs from the image if they don't exist
+ 		// already, overriding the default environments
+-		envs, err = envLib.ParseSlice(inspectData.Config.Env)
++		envs, err := ParseImageEnvs(inspectData.Config.Env)
+ 		if err != nil {
+-			return nil, fmt.Errorf("env fields from image failed to parse: %w", err)
++			return nil, err
+ 		}
+ 		defaultEnvs = envLib.Join(envLib.DefaultEnvVariables(), envLib.Join(defaultEnvs, envs))
+ 	}
+diff --git a/pkg/specgen/generate/container_test.go b/pkg/specgen/generate/container_test.go
+new file mode 100644
+index 0000000000..22a64330b1
+--- /dev/null
++++ b/pkg/specgen/generate/container_test.go
+@@ -0,0 +1,66 @@
++//go:build !remote && (linux || freebsd)
++
++package generate
++
++import (
++	"testing"
++
++	"github.com/stretchr/testify/assert"
++	"github.com/stretchr/testify/require"
++)
++
++func TestParseImageEnvs(t *testing.T) {
++	tests := []struct {
++		name      string
++		imageEnvs []string
++		want      map[string]string
++		wantErr   bool
++	}{
++		{
++			name: "no env",
++			want: map[string]string{},
++		},
++		{
++			name:      "single env",
++			imageEnvs: []string{"TEST=1"},
++			want: map[string]string{
++				"TEST": "1",
++			},
++		},
++		{
++			name:      "multiple envs",
++			imageEnvs: []string{"TEST=1", "ABC=b", "PATH=/bin"},
++			want: map[string]string{
++				"TEST": "1",
++				"ABC":  "b",
++				"PATH": "/bin",
++			},
++		},
++		{
++			name:      "invalid env without value",
++			imageEnvs: []string{"HOST"},
++			wantErr:   true,
++		},
++		{
++			name:      "invalid env asterisk",
++			imageEnvs: []string{"*"},
++			wantErr:   true,
++		},
++		{
++			name:      "invalid env no key",
++			imageEnvs: []string{"=123"},
++			wantErr:   true,
++		},
++	}
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			got, err := ParseImageEnvs(tt.imageEnvs)
++			if tt.wantErr {
++				require.Error(t, err)
++				return
++			}
++
++			assert.Equal(t, tt.want, got)
++		})
++	}
++}
+diff --git a/pkg/specgen/generate/kube/kube.go b/pkg/specgen/generate/kube/kube.go
+index d820ce1d3e..0db1920c1b 100644
+--- a/pkg/specgen/generate/kube/kube.go
++++ b/pkg/specgen/generate/kube/kube.go
+@@ -479,10 +479,9 @@ func ToSpecGen(ctx context.Context, opts *CtrSpecGenOptions) (*specgen.SpecGener
+ 	s.Annotations[define.KubeHealthCheckAnnotation] = "true"
+ 
+ 	// Environment Variables
+-	envs := map[string]string{}
+-	for _, env := range imageData.Config.Env {
+-		key, val, _ := strings.Cut(env, "=")
+-		envs[key] = val
++	envs, err := generate.ParseImageEnvs(imageData.Config.Env)
++	if err != nil {
++		return nil, err
+ 	}
+ 
+ 	// Process envFrom first (lower precedence)
+diff --git a/test/system/030-run.bats b/test/system/030-run.bats
+index ed8f148c91..9b33a6fb1d 100644
+--- a/test/system/030-run.bats
++++ b/test/system/030-run.bats
+@@ -1911,4 +1911,56 @@ EOF
+     run_podman rmi $image
+ }
+ 
++@test "podman run host env leak" {
++    # We need to create a invalid image config env value without "="
++    skopeo copy containers-storage:$IMAGE dir:$PODMAN_TMPDIR
++    config_digest=$(jq -r .config.digest $PODMAN_TMPDIR/manifest.json)
++    plain_digest=${config_digest#*:}
++    newfile="$PODMAN_TMPDIR/newfile"
++    # Append bad env to existing image envs
++    jq  '.config.Env += ["HOST*"]' $PODMAN_TMPDIR/$plain_digest >$newfile
++    # Get new digest and size so we can update the manifest
++    newdigest="$(sha256sum $newfile | cut -d" " -f 1)"
++    size=$(stat -c %s $newfile)
++    mv $newfile $PODMAN_TMPDIR/$newdigest
++    jq ".config.digest = \"sha256:$newdigest\" | .config.size=$size" $PODMAN_TMPDIR/manifest.json > $PODMAN_TMPDIR/manifest.json.new
++    mv $PODMAN_TMPDIR/manifest.json.new $PODMAN_TMPDIR/manifest.json
++
++    image="localhost/envimage:123"
++    skopeo copy dir:$PODMAN_TMPDIR containers-storage:$image
++
++    run_podman image inspect $image --format '{{.Config.Env}}'
++    assert "$output" =~ "HOST\*" "invalid env in image"
++
++    HOSTENV=123 run_podman 125 run --rm $image printenv HOSTENV
++    assert "$output" =~ 'invalid image env variable "HOST\*"' "Host env leak from image env on podman run"
++
++    podname="p-$(safename)"
++    ctrname="c-$(safename)"
++
++    fname="$PODMAN_TMPDIR/kube_$(safename).yaml"
++    echo "
++apiVersion: v1
++kind: Pod
++metadata:
++  labels:
++    app: test
++  name: $podname
++spec:
++  restartPolicy: Never
++  containers:
++    - name: $ctrname
++      image: $image
++      command:
++      - printenv
++      - HOSTENV
++" > $fname
++
++    run_podman 125 kube play $fname
++    assert "$output" =~ 'invalid image env variable "HOST\*"' "Host env leak from image env on kube play"
++
++    run_podman pod rm $podname
++    run_podman rmi $image
++}
++
+ # vim: filetype=sh
+-- 
+2.51.0
diff --git a/recipes-containers/podman/podman_git.bb b/recipes-containers/podman/podman_git.bb
index 886d6e90..7dde3880 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -20,6 +20,7 @@ SRCREV = "88c5aaeec667af94c4fe3a5c2c7a42f8cf308b93"
 SRC_URI = " \
     git://github.com/containers/podman.git;branch=v5.8;protocol=https;destsuffix=${GO_SRCURI_DESTSUFFIX} \
     ${@bb.utils.contains('PACKAGECONFIG', 'rootless', 'file://50-podman-rootless.conf', '', d)} \
+    file://CVE-2026-57231.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.35.6


