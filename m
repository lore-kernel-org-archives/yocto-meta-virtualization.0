Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36903C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:27:39 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11370.1783686451155873239
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 05:27:31 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I0vUVKkb;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14897; q=dns/txt;
  s=iport01; t=1783686451; x=1784896051;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=2GIDmxOHLOtc0lMA6gttktLbiw807hyqgwagypQlvEw=;
  b=I0vUVKkb6c58ocWbxW9/ivWdXORIgrIDBxXK16C4Dxu8Khl7j5IYmsES
   HP8ZRuO7ijQP5/1dvISEXkMQ/THdzwfncwn77q/TCEPNJcuEMdzsqud/D
   PJHKHMX6dbYo8GQSek6YFAjDTtRfVZ8zKzgO1K2YBYnKKLOz8kBhtn/jD
   r+bJhzgR875DUKUtwsSVxTIrnsmrMDRPbqz8oQEgkyQLKKfNc5lOWXmoP
   iKPG7CAbn6WRmXi/yarVXDfwVl8w85USnkopuwEfzWHzFxFlcLWGigksc
   SKHzQ1Yc3mwS83EIGu/gPs7oLqFtvHl/G2G1g44ywvA4KjX/4td1fY2nO
   A==;
X-CSE-ConnectionGUID: dn0xsJL/T52t7sFDhM7kfg==
X-CSE-MsgGUID: EclffO41TUKRf1w+fdM3nw==
X-IPAS-Result: =?us-ascii?q?A0AaAACb5FBq/4//Ja1RCRwBAQEBAQEHAQESAQEEBAEBg?=
 =?us-ascii?q?XwHAQELAYJWdF9CSQOMb4c3giEDgROdCBSBEANXDwEBAQ9EDQQBAYISgi1GA?=
 =?us-ascii?q?o1NAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBA?=
 =?us-ascii?q?gEDMgE0IhwDAQIvKyMIEQgJgnkBgnMDEQa6M4IsgQGEfdsuAQsUAYE4AYU+i?=
 =?us-ascii?q?B9bGAGEfCcbG4FygRWBO4E4doEFgVwCgSMRhnEEgiKBDIFakBBIgR4DWSwBV?=
 =?us-ascii?q?RMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYFZgQKEeSMfAzl/gTB1Snktc?=
 =?us-ascii?q?xIeCoFSghZUAwsYDUgRLDcUGwQ+bgeNPhcPgj4BLARKBwwBKgEFKhcISgMYU?=
 =?us-ascii?q?AEoMqVBn1SBPgoog3WMIZU6GjOFW6URC5h9izeCU5YAGTeEaYFoPDmBIHAVg?=
 =?us-ascii?q?yIJShkPjjiDa4Jkgi+BfccyPDUCCQMvAQEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:X5jdpatd2zpCmgzZh7P5srIv3efnVAVfMUV32f8akzHdYApBsoF/q
 tZmKTzVbPqPMWLyf4gnaIu38kwGvsWEytNkTgForX82RiIVgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuFZTdJ5xYuajhKs/3b+Es21BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw9uAvEXps0
 bskdWoRMQutq+KTn7G1Rbw57igjBJGD0II3oHpsy3TdSP0hW52GG/uM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwtMYH49tL/Aan3XfzBVsluJpa0f6GnIxws327/oWDbQUoHSFZ8IxhzI+
 Aoq+UzUCRUUOvvDkAa40Uii3/CMky/eA4QNQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIJgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:cT/kkKiQMjeErHtZB+nBni0MbXBQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:6NMIa29KtFqSpljyutqVv0ISQtA+UFma8CqKPxCjJ0ppbeKWR1DFrQ==
X-Talos-MUID: 9a23:SGCzGArxnApWPToHAAQezxxpMMlmxPj3NH0uq5tfpIqKOQkrPSjI2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="508250286"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 12:27:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id 897811800025A
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:29 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id ACD22CC037D; Fri, 10 Jul 2026 17:57:27 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 3/3] containerd: fix CVE-2026-53488
Date: Fri, 10 Jul 2026 17:56:52 +0530
Message-Id: <20260710122652.3004381-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260710122652.3004381-1-deeratho@cisco.com>
References: <20260710122652.3004381-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9951

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for
CVE-2026-53488. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/containerd/containerd/commit/b6072a49f8d3f6efc5ac9895efbb1852b16a2602
[2] https://github.com/containerd/containerd/security/advisories/GHSA-xhf5-7wjv-pqxp

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-53488.patch           | 340 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 341 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53488.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-53488.patch b/recipes-containers/containerd/containerd/CVE-2026-53488.patch
new file mode 100644
index 00000000..502bec74
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53488.patch
@@ -0,0 +1,340 @@
+From 3262711688ed9b4e3cb7b9b0c8ed9f218fb3023f Mon Sep 17 00:00:00 2001
+From: Ben Cressey <ben@cressey.org>
+Date: Fri, 29 May 2026 21:33:28 +0000
+Subject: [PATCH 3/3] Do not propagate reserved labels from image configs
+
+Image config labels are copied onto the container by both the CRI
+plugin (BuildLabels) and the client's WithImageConfigLabels option
+used by `ctr run`. Labels in the containerd.io/* namespace are
+interpreted by containerd itself and labels in the io.cri-containerd*
+namespace are interpreted by the CRI plugin. An image config is not a
+trusted source for labels in either namespace.
+
+Skip labels in both reserved namespaces when copying labels from an
+image config to a container, and warn about each label skipped: an
+image that tries to set them may be attempting to alter containerd
+behavior. Oversized image labels are already skipped this way by
+the CRI plugin.
+
+Labels set explicitly by clients, for example via `ctr run --label`
+or in the CRI request, are unaffected.
+
+Verified with the CRI plugin and with `ctr run` against an image
+whose config carries labels like these: the labels are no longer
+present on the created container and a warning is logged for each.
+
+CVE: CVE-2026-53488
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/b6072a49f8d3f6efc5ac9895efbb1852b16a2602]
+
+Assisted-by: Claude Code
+Signed-off-by: Ben Cressey <ben@cressey.org>
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 0ec1af4cae1256d18719ca892bf66340499e8050)
+Signed-off-by: Akihiro Suda <akihiro.suda.cz@hco.ntt.co.jp>
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit b6072a49f8d3f6efc5ac9895efbb1852b16a2602)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ client/container_opts.go       | 17 ++++++++
+ client/container_opts_test.go  | 75 ++++++++++++++++++++++++++++++++++
+ internal/cri/labels/labels.go  |  6 ++-
+ internal/cri/util/util.go      | 12 +++++-
+ internal/cri/util/util_test.go | 16 ++++++--
+ pkg/labels/labels.go           | 12 ++++++
+ pkg/labels/validate.go         |  9 ++++
+ pkg/labels/validate_test.go    | 17 ++++++++
+ 8 files changed, 158 insertions(+), 6 deletions(-)
+ create mode 100644 client/container_opts_test.go
+
+diff --git a/client/container_opts.go b/client/container_opts.go
+index 04f2a9062..762dcb4b9 100644
+--- a/client/container_opts.go
++++ b/client/container_opts.go
+@@ -21,14 +21,17 @@ import (
+ 	"encoding/json"
+ 	"errors"
+ 	"fmt"
++	"maps"
+ 
+ 	"github.com/containerd/containerd/v2/core/containers"
+ 	"github.com/containerd/containerd/v2/core/content"
+ 	"github.com/containerd/containerd/v2/core/images"
+ 	"github.com/containerd/containerd/v2/core/snapshots"
++	"github.com/containerd/containerd/v2/pkg/labels"
+ 	"github.com/containerd/containerd/v2/pkg/namespaces"
+ 	"github.com/containerd/containerd/v2/pkg/oci"
+ 	"github.com/containerd/errdefs"
++	"github.com/containerd/log"
+ 	"github.com/containerd/typeurl/v2"
+ 	"github.com/opencontainers/image-spec/identity"
+ 	v1 "github.com/opencontainers/image-spec/specs-go/v1"
+@@ -113,6 +116,10 @@ func WithContainerLabels(labels map[string]string) NewContainerOpts {
+ // The existing labels are cleared as this is expected to be the first
+ // operation in setting up a container's labels. Use WithAdditionalContainerLabels
+ // to add/overwrite the existing image config labels.
++//
++// Image config labels in the namespaces reserved for containerd
++// (containerd.io/) and the CRI plugin (io.cri-containerd) are not copied
++// to the container.
+ func WithImageConfigLabels(image Image) NewContainerOpts {
+ 	return func(ctx context.Context, _ *Client, c *containers.Container) error {
+ 		ic, err := image.Config(ctx)
+@@ -138,6 +145,16 @@ func WithImageConfigLabels(image Image) NewContainerOpts {
+ 		config = ociimage.Config
+ 
+ 		c.Labels = config.Labels
++		// Labels in the containerd.io/* namespace are interpreted by containerd
++		// itself, and labels in the io.cri-containerd.* namespace are interpreted
++		// by the CRI plugin, so they are not copied from untrusted image configs.
++		maps.DeleteFunc(c.Labels, func(k, _ string) bool {
++			if labels.IsReserved(k) {
++				log.G(ctx).Warnf("skipping image label %q: the label namespace is reserved for containerd; possible malicious image attempting to alter containerd behavior", k)
++				return true
++			}
++			return false
++		})
+ 		return nil
+ 	}
+ }
+diff --git a/client/container_opts_test.go b/client/container_opts_test.go
+new file mode 100644
+index 000000000..fb01e6a33
+--- /dev/null
++++ b/client/container_opts_test.go
+@@ -0,0 +1,75 @@
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
++package client
++
++import (
++	"context"
++	"encoding/json"
++	"testing"
++
++	"github.com/containerd/containerd/v2/core/containers"
++	"github.com/containerd/containerd/v2/core/content"
++	"github.com/opencontainers/go-digest"
++	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
++	"github.com/stretchr/testify/assert"
++	"github.com/stretchr/testify/require"
++)
++
++// fakeImage implements the subset of Image used by WithImageConfigLabels:
++// Config returns a descriptor with the config blob inlined in Data, so the
++// content store is never consulted.
++type fakeImage struct {
++	Image
++	config ocispec.Descriptor
++}
++
++func (i fakeImage) Config(context.Context) (ocispec.Descriptor, error) {
++	return i.config, nil
++}
++
++func (i fakeImage) ContentStore() content.Store {
++	return nil
++}
++
++func TestWithImageConfigLabels(t *testing.T) {
++	blob, err := json.Marshal(ocispec.Image{
++		Config: ocispec.ImageConfig{
++			Labels: map[string]string{
++				"foo":                          "bar",
++				"containerd.io/restart.policy": "always",
++				"io.cri-containerd.kind":       "sandbox",
++			},
++		},
++	})
++	require.NoError(t, err)
++
++	img := fakeImage{
++		config: ocispec.Descriptor{
++			MediaType: ocispec.MediaTypeImageConfig,
++			Digest:    digest.FromBytes(blob),
++			Size:      int64(len(blob)),
++			Data:      blob,
++		},
++	}
++
++	var c containers.Container
++	require.NoError(t, WithImageConfigLabels(img)(t.Context(), nil, &c))
++
++	// labels in the namespaces reserved for containerd and the CRI plugin
++	// are not copied from the image config
++	assert.Equal(t, map[string]string{"foo": "bar"}, c.Labels)
++}
+diff --git a/internal/cri/labels/labels.go b/internal/cri/labels/labels.go
+index c92b9e863..d76bb1409 100644
+--- a/internal/cri/labels/labels.go
++++ b/internal/cri/labels/labels.go
+@@ -16,9 +16,13 @@
+ 
+ package labels
+ 
++import (
++	clabels "github.com/containerd/containerd/v2/pkg/labels"
++)
++
+ const (
+ 	// criContainerdPrefix is common prefix for cri-containerd
+-	criContainerdPrefix = "io.cri-containerd"
++	criContainerdPrefix = clabels.CRIContainerdPrefix
+ 	// ImageLabelKey is the label key indicating the image is managed by cri plugin.
+ 	ImageLabelKey = criContainerdPrefix + ".image"
+ 	// ImageLabelValue is the label value indicating the image is managed by cri plugin.
+diff --git a/internal/cri/util/util.go b/internal/cri/util/util.go
+index dbacd138a..fec4b3bfd 100644
+--- a/internal/cri/util/util.go
++++ b/internal/cri/util/util.go
+@@ -81,11 +81,21 @@ func GetPassthroughAnnotations(podAnnotations map[string]string,
+ 	return passthroughAnnotations
+ }
+ 
+-// BuildLabels builds the labels from config to be passed to containerd
++// BuildLabels builds the labels from config to be passed to containerd.
++// Image config labels in the namespaces reserved for containerd
++// (containerd.io/) and the CRI plugin (io.cri-containerd) are not copied
++// to the container.
+ func BuildLabels(configLabels, imageConfigLabels map[string]string, containerType string) map[string]string {
+ 	labels := make(map[string]string)
+ 
+ 	for k, v := range imageConfigLabels {
++		// Labels in the containerd.io/* namespace are interpreted by containerd
++		// itself, and labels in the io.cri-containerd.* namespace are interpreted
++		// by the CRI plugin, so they are not copied from untrusted image configs.
++		if clabels.IsReserved(k) {
++			log.L.Warnf("skipping image label %q: the label namespace is reserved for containerd; possible malicious image attempting to alter containerd behavior", k)
++			continue
++		}
+ 		if err := clabels.Validate(k, v); err == nil {
+ 			labels[k] = v
+ 		} else {
+diff --git a/internal/cri/util/util_test.go b/internal/cri/util/util_test.go
+index 3974920f2..1664feb63 100644
+--- a/internal/cri/util/util_test.go
++++ b/internal/cri/util/util_test.go
+@@ -145,21 +145,29 @@ func TestPassThroughAnnotationsFilter(t *testing.T) {
+ 
+ func TestBuildLabels(t *testing.T) {
+ 	imageConfigLabels := map[string]string{
+-		"a":          "z",
+-		"d":          "y",
+-		"long-label": strings.Repeat("example", 10000),
++		"a":                            "z",
++		"d":                            "y",
++		"long-label":                   strings.Repeat("example", 10000),
++		"containerd.io/restart.policy": "always",
++		"io.cri-containerd.image":      "managed",
+ 	}
+ 	configLabels := map[string]string{
+ 		"a": "b",
+ 		"c": "d",
++		// reserved namespaces are only filtered for image config labels, not
++		// for labels from the CRI request
++		"containerd.io/restart.status": "stopped",
+ 	}
+ 	newLabels := BuildLabels(configLabels, imageConfigLabels, crilabels.ContainerKindSandbox)
+-	assert.Len(t, newLabels, 4)
++	assert.Len(t, newLabels, 5)
+ 	assert.Equal(t, "b", newLabels["a"])
+ 	assert.Equal(t, "d", newLabels["c"])
+ 	assert.Equal(t, "y", newLabels["d"])
++	assert.Equal(t, "stopped", newLabels["containerd.io/restart.status"])
+ 	assert.Equal(t, crilabels.ContainerKindSandbox, newLabels[crilabels.ContainerKindLabel])
+ 	assert.NotContains(t, newLabels, "long-label")
++	assert.NotContains(t, newLabels, "containerd.io/restart.policy")
++	assert.NotContains(t, newLabels, "io.cri-containerd.image")
+ 
+ 	newLabels["a"] = "e"
+ 	assert.Empty(t, configLabels[crilabels.ContainerKindLabel], "should not add new labels into original label")
+diff --git a/pkg/labels/labels.go b/pkg/labels/labels.go
+index 0f9bab5c5..ba4c245e4 100644
+--- a/pkg/labels/labels.go
++++ b/pkg/labels/labels.go
+@@ -16,6 +16,18 @@
+ 
+ package labels
+ 
++// ReservedPrefix is the prefix of the label namespace reserved for labels
++// defined and consumed by containerd itself. Labels in this namespace must
++// not be copied from untrusted sources such as image config labels. Use
++// IsReserved to check for such labels.
++const ReservedPrefix = "containerd.io/"
++
++// CRIContainerdPrefix is the prefix of the label namespace reserved for
++// labels defined and consumed by containerd's CRI plugin. Labels in this
++// namespace must not be copied from untrusted sources such as image config
++// labels. Use IsReserved to check for such labels.
++const CRIContainerdPrefix = "io.cri-containerd"
++
+ // LabelUncompressed is added to compressed layer contents.
+ // The value is digest of the uncompressed content.
+ const LabelUncompressed = "containerd.io/uncompressed"
+diff --git a/pkg/labels/validate.go b/pkg/labels/validate.go
+index 6f23cdd7c..495427bb4 100644
+--- a/pkg/labels/validate.go
++++ b/pkg/labels/validate.go
+@@ -18,6 +18,7 @@ package labels
+ 
+ import (
+ 	"fmt"
++	"strings"
+ 
+ 	"github.com/containerd/errdefs"
+ )
+@@ -39,3 +40,11 @@ func Validate(k, v string) error {
+ 	}
+ 	return nil
+ }
++
++// IsReserved returns true if the label key is in a namespace reserved for
++// containerd (ReservedPrefix) or its CRI plugin (CRIContainerdPrefix).
++// Reserved labels are interpreted by containerd and must not be copied from
++// untrusted sources such as image config labels.
++func IsReserved(k string) bool {
++	return strings.HasPrefix(k, ReservedPrefix) || strings.HasPrefix(k, CRIContainerdPrefix)
++}
+diff --git a/pkg/labels/validate_test.go b/pkg/labels/validate_test.go
+index 16be11df3..fb97e5b69 100644
+--- a/pkg/labels/validate_test.go
++++ b/pkg/labels/validate_test.go
+@@ -53,6 +53,23 @@ func TestInvalidLabels(t *testing.T) {
+ 	}
+ }
+ 
++func TestIsReserved(t *testing.T) {
++	for key, reserved := range map[string]bool{
++		"containerd.io/":               true,
++		"containerd.io/restart.status": true,
++		"containerd.io/gc.ref.content": true,
++		"io.cri-containerd":            true,
++		"io.cri-containerd.kind":       true,
++		"io.cri-containerd.image":      true,
++		"io.cri-containerdfoo":         true,
++		"containerd.io":                false,
++		"io.containerd.something":      false,
++		"com.example.app":              false,
++	} {
++		assert.Equal(t, reserved, IsReserved(key), "IsReserved(%q)", key)
++	}
++}
++
+ func TestLongKey(t *testing.T) {
+ 	key := strings.Repeat("s", keyMaxLen+1)
+ 	value := strings.Repeat("v", maxSize-len(key))
+-- 
+2.35.6
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 43891c2f..3cf088f0 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -12,6 +12,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://cni-containerd-net.conflist \
            file://CVE-2026-46680.patch \
            file://CVE-2026-47262.patch \
+           file://CVE-2026-53488.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


