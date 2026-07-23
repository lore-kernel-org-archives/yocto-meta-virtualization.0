Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7544FC531CF
	for <webhook@archiver.kernel.org>; Thu, 23 Jul 2026 13:42:41 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23792.1784814151354929172
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 23 Jul 2026 06:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gTUOaBaC;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8773; q=dns/txt;
  s=iport01; t=1784814151; x=1786023751;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wzCZ0pg4ynA8VKN9wKvIjJvSGB/RIGdonVZx2NswHzU=;
  b=gTUOaBaCyQzwOdR+EYirgKdC2wNzMNDiK7YxrRaf+K4nMQWs0huCLk/V
   yZ5UCB6FdtM7jGdYUe9tGOrcK3yejhIFhrBbQVBUWsx73zBkVpepVrreg
   c97xP5tHiHc5yqY1k564vSgCYuOsnuwmaNavE3NSivMAJCEddPsYEemN6
   FYHSqOqI5P0EVWXYE5zzEE+gKKVe53nHYpIkhaLwLLgrVczOdXs6vuirS
   lscBDxLxMWp4ANcibENsJMFqVHTJ4S5ThGhtJ9sEFrFsiwIYF9P6j0+ct
   QanSTGN3HBQplYOalklvE0NYNAxCsJMfie62+lOo0gBkIDTbGkpodbGPt
   A==;
X-CSE-ConnectionGUID: bK/FaV1dTiCM/YEUqpGjnw==
X-CSE-MsgGUID: 91ohGqMvSg6/1fH+dsM65A==
X-IPAS-Result: =?us-ascii?q?A0BEAgCwGWJq/5T/Ja1aH4I6gld0X0JJA5QmgiGBFp0Ig?=
 =?us-ascii?q?X4PAQEBD0QNBAEBhD+OIgImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBA?=
 =?us-ascii?q?gEHBYEOE4ZPDYZaATgBcgMBAlojGQiDAgGCdAMRwk2CLIEBgmaBAgEBQ1DbL?=
 =?us-ascii?q?gELFAGBOIU/iCBcGAGEfCcbG4FygRWCc3aBBYFcAoFKhlsEgiKBDIFaHpAkS?=
 =?us-ascii?q?IEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgR2BLHmEWyMfAzl/g?=
 =?us-ascii?q?TB1SnctahIXgSaDSQKBHQMLGA1IESw3FBkEPm4HjWQjgkAxShMBKwUSGCErI?=
 =?us-ascii?q?GgpIpMMQo9lgh6BOJ9aCiiDdYwhlToaM4QEgVelEQuYfYJZiF6CU5VzXYRpg?=
 =?us-ascii?q?Wg8gVlwFYMiCUoZD1aNYoNrhF02xUI8NQsDLwEBBwIHDgMLgWiQAYF9AQE?=
IronPort-Data: A9a23:vup5ZKJF2BFJy1NlFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS0TwCz
 GMcWz2BOqyMMDD2eo0gPtu2oU4F6sTQyIVmHVYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQvajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1kLwYYNLNB9tp2KkQJx
 NElMSgibBac0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSAVLAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2MESojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeG2bIGLKoDaLSlTthfBo
 WLp5kHnOR5Ec4WR6XmJ6Vfy28aayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPAXy4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:S/XqP6GrRQaRN7QKpLqE2MeALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhfo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL1K3M/F3yDqHTH4+6p20K
 dtdLU7NfjLZGIK6PoTJGKDYrEdKB7tytHNudvj
X-Talos-CUID: =?us-ascii?q?9a23=3AqUNlrGlAOfq7BMl4+gA07qR5WxPXOXf+i1nZHRa?=
 =?us-ascii?q?0NWdCbfqkZGKJ4IxmldU7zg=3D=3D?=
X-Talos-MUID: 9a23:7eBsSQtTtmDptVkYac2n1WhlNOhxxrqVBx5KyJsm+MWfEHItEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,180,1779148800"; 
   d="scan'208";a="513436848"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 23 Jul 2026 13:42:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id 2146518000162
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2026 13:42:30 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 45BE6CC037D; Thu, 23 Jul 2026 19:12:28 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][scarthgap][PATCH] podman: fix CVE-2026-57231
Date: Thu, 23 Jul 2026 19:12:21 +0530
Message-Id: <20260723134221.2504100-1-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 23 Jul 2026 13:42:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9978

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
index 00000000..696ab99d
--- /dev/null
+++ b/recipes-containers/podman/podman/CVE-2026-57231.patch
@@ -0,0 +1,219 @@
+From efe48c92c248c7cee352b51e7cd7e9875180b6e9 Mon Sep 17 00:00:00 2001
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
+index f224453da7..53346732d9 100644
+--- a/pkg/specgen/generate/container.go
++++ b/pkg/specgen/generate/container.go
+@@ -61,6 +61,18 @@ func getImageFromSpec(ctx context.Context, r *libpod.Runtime, s *specgen.SpecGen
+ 	return image, resolvedName, inspectData, err
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
+@@ -122,15 +134,14 @@ func CompleteSpec(ctx context.Context, r *libpod.Runtime, s *specgen.SpecGenerat
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
+index 25afd00f6d..0ba2ffa6d5 100644
+--- a/pkg/specgen/generate/kube/kube.go
++++ b/pkg/specgen/generate/kube/kube.go
+@@ -436,10 +436,9 @@ func ToSpecGen(ctx context.Context, opts *CtrSpecGenOptions) (*specgen.SpecGener
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
+ 	for _, env := range opts.Container.Env {
+diff --git a/test/system/030-run.bats b/test/system/030-run.bats
+index 56acf6c5e1..e59edd364a 100644
+--- a/test/system/030-run.bats
++++ b/test/system/030-run.bats
+@@ -1454,4 +1454,56 @@ search               | $IMAGE           |
+     is "$output" "Error.*: $expect" "podman emits useful diagnostic when no entrypoint is set"
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
index c714e73f..3eb5f426 100644
--- a/recipes-containers/podman/podman_git.bb
+++ b/recipes-containers/podman/podman_git.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://CVE-2024-9341.patch;patchdir=src/import \
     file://CVE-2026-55686-dependent.patch;patchdir=src/import \
     file://CVE-2026-55686.patch;patchdir=src/import \
+    file://CVE-2026-57231.patch;patchdir=src/import \
 "
 
 LICENSE = "Apache-2.0"
-- 
2.35.6


