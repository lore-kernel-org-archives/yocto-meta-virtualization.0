Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5923DCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:07:25 +0000 (UTC)
Received: from aer-iport-5.cisco.com (aer-iport-5.cisco.com [173.38.203.67])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18339.1792145234880887211
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 03:07:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aSsrjt6p;
 spf=pass (domain: cisco.com, ip: 173.38.203.67, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=33185; q=dns/txt;
  s=iport01; t=1792145235; x=1793354835;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=68gPobw4IJLF34gu2PO8q1k+6HIcTdkBS2ZS+c6Aj8k=;
  b=aSsrjt6pcfI/5bYMtR7HdY8lszUq0w0jsyh8ZW4XFtOZZM91ngdTw5Ig
   nIn5DU9xueOkjnOvHLw5R5ybReLuk37my6tQuJwI/O2j3PlvwNvXhyyRc
   7BJXRKGYm6J+IeD83CqiZbKacqqdFvChM/+fJeA1KHaOj6NdQGKiF45GS
   nCASkH1nrX4BVxo7Z44cpfTOGaaJVwcdAX6qTBF2DV+ud9GxVer3+4Y+D
   QTPXiFMn5/8xap+sEbrHeYYVtfCiG4Gi9nfv0HtsxUsUzZVVPy7S7vhDa
   0sPVwPsYAAe01nzbcT3cSvaHe7r8l7MGmHccegwnGB96viGUN/lEKqlXD
   g==;
X-CSE-ConnectionGUID: EMujzUk8QKWJ+6+sgfRwOw==
X-CSE-MsgGUID: VvS5chIzS16UNPF9YbXhRQ==
X-IPAS-Result: =?us-ascii?q?A0BaAwCr9tFq/85K/pBaHgEBCxIMggULgld1YUJJA5Qmg?=
 =?us-ascii?q?iEDgROKUpJLgWoPAQEBD0QNBAEBghKCLUYCjhUCJjcGDgECBAMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBAQoBAQUBAQECAQcFgQ4Thk8NkBIBAgEDGgEXAVYcAwECLyALIwgRC?=
 =?us-ascii?q?AmCeQGCOgM3AxEGvTiCLIEBgmaCGNhLDYJaAQsUAYE4hUCCf4UkXRgBhHwnG?=
 =?us-ascii?q?xuBcoEVgTuBOHaBBYEaQgKBIwoKAYZtBIINFYEMgVqFDpA5SIEeA1ksAVUTD?=
 =?us-ascii?q?QoLBwWBaAM1EioVbjIdgSM+F4EHGwYFgR2BIIIWIxk2eoEJXoErKWEQF4EJg?=
 =?us-ascii?q?gcCglSCAAIBSUEOB0VTCSVDEkcmIggSCQETGjALgRs4PAkoQRcMcwwdBXIIA?=
 =?us-ascii?q?g0JBykYDUgRLDcVGQQ+bgeSFB6CUwIJBxYbDD4HDAEqAQUqHwEFMRYoQAEoD?=
 =?us-ascii?q?gGTJgOQHIIeoCFxCiiDdowijz6FfBozhVulFAuYfYs3glOECZFeaIRpgX4mg?=
 =?us-ascii?q?VlwFYMiCUoZD44uCwuDYIIJgwrJLzw1AgkDLwEBBwIHDgMLgWiQAAEDJIFWA?=
 =?us-ascii?q?QE?=
IronPort-Data: A9a23:uKHV8KMsdpopnnDvrR3zlsFynXyQoLVcMsEvi/4bfWQNrUojgTxVm
 2ZMUG+PM/eLMGKnL48gbYyz8E4A7JbUmtVrTnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeap1yFjmD9k/F3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVzlV
 e/a+ZWFZgb9gmAsawr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69hLEUMkAI5Iw8VIIyIQt
 ucXJgoSSQ/W0opawJrjIgVtrs0uNozveYgYoHwllWyfBvc9SpeFSKLPjTNa9G5s2oYUQKqYO
 JZfM2IxBPjDS0Un1lM/BJ8zhu60hn7XeDxDo1XTrq0yi4TW5FEhgOaxaIWJEjCMbftLpRuTp
 kPUxD2nPzciGo2uwwqFyEv504cjmgu+Aur+DoaQ8/N2iRiNx3YPFRQSVEmyvfi+jGa6WslDM
 AoF/SEyqrAo806mRcW7WAe3yENopTYVVsAVF6gx7xuAj/KJpQ2YHWMDCDVGbbTKqfMLeNDj7
 XfR9/uBONClmOT9pa61nltMkQ6PBA==
IronPort-HdrOrdr: A9a23:SGnzC6vfFUYbxjRxiqyptGCN7skDWtV00zEX/kB9WHVpm6uj5q
 STdZsguyMc5Ax9ZJhko6HiBEDiewK4yXcK2+gs1N6ZNWGM0ldAbrsSj7cKqAeOJ8SRzIJgPN
 9bE5RWOZnXEUVwi9r87U2TFtYtx8TCzYWT7N2uqEuEiWpRGthdB8ATMHf8LnFL
X-Talos-CUID: =?us-ascii?q?9a23=3AbtEJ3mgxzcnIRQiSLGynFsUeKjJuX1jAzmXtIB+?=
 =?us-ascii?q?BKllLC+PWUlCewrxDjJ87?=
X-Talos-MUID: 9a23:ozteZwX4ITXFL1fq/AHyv2xpNOZ62P3wNWY1v8Q3sfmEDxUlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="58864074"
Received: from aer-l-core-05.cisco.com ([144.254.74.206])
  by aer-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 10:07:12 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-05.cisco.com (Postfix) with ESMTPS id C3C3218000382
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:11 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 59BB0CC1295; Fri, 16 Oct 2026 15:37:10 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 5/5] containerd: Fix CVE-2026-53493
Date: Fri, 16 Oct 2026 15:36:41 +0530
Message-Id: <20261016100641.1628059-5-deeratho@cisco.com>
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
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10118

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for
CVE-2026-53493. It bounds Dispatch concurrency and references, then
bounds Walk references during image pull processing to prevent
uncontrolled descriptor-graph traversal and resource exhaustion.

The individual upstream backport commits are referenced in [1] and [2].
The public CVE advisory is referenced in [3].

[1] https://github.com/containerd/containerd/commit/efd11fc9c2935f1a7ce6626b348d1461bac34acf
[2] https://github.com/containerd/containerd/commit/053c0cc412f2a36c77a973d0b62ff4fa4815a9bb
[3] https://github.com/containerd/containerd/security/advisories/GHSA-pg57-6jwg-q645

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-53493_p1.patch        | 646 ++++++++++++++++++
 .../containerd/CVE-2026-53493_p2.patch        | 329 +++++++++
 .../containerd/containerd_git.bb              |   2 +
 3 files changed, 977 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53493_p1.patch
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53493_p2.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-53493_p1.patch b/recipes-containers/containerd/containerd/CVE-2026-53493_p1.patch
new file mode 100644
index 00000000..b4fd6ded
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53493_p1.patch
@@ -0,0 +1,646 @@
+From 95d5ef2d8204a639c8f452d8457b82406802a540 Mon Sep 17 00:00:00 2001
+From: Chris Henzie <chrishenzie@gmail.com>
+Date: Tue, 28 Jul 2026 14:09:57 -0700
+Subject: [PATCH 1/2] Bound Dispatch concurrency and references
+
+Traverse breadth-first, one level at a time. Acquire the limiter before
+starting each handler goroutine. Default to 32 concurrent handlers when
+no limiter is provided. Children wait until every handler in the current
+level finishes.
+
+Preserve duplicate visits and return an error wrapping
+ErrResourceExhausted when the traversal exceeds 10,000 references.
+Count children as handlers return them to bound the descriptors retained
+for the next level.
+
+CVE: CVE-2026-53493
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/efd11fc9c2935f1a7ce6626b348d1461bac34acf]
+
+Assisted-by: Claude Code
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit 94e83c14c8aac963e24e28105dab9c9af812a2a8)
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit efd11fc9c2935f1a7ce6626b348d1461bac34acf)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ core/images/handlers.go      | 101 ++++++--
+ core/images/handlers_test.go | 469 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 543 insertions(+), 27 deletions(-)
+ create mode 100644 core/images/handlers_test.go
+
+diff --git a/core/images/handlers.go b/core/images/handlers.go
+index 245b9ac43..a60835f97 100644
+--- a/core/images/handlers.go
++++ b/core/images/handlers.go
+@@ -23,6 +23,7 @@ import (
+ 	"slices"
+ 	"sort"
+ 	"strings"
++	"sync"
+ 
+ 	"github.com/containerd/containerd/v2/core/content"
+ 	"github.com/containerd/errdefs"
+@@ -32,6 +33,16 @@ import (
+ 	"golang.org/x/sync/semaphore"
+ )
+ 
++const (
++	// defaultMaxConcurrency bounds the number of concurrent handler
++	// goroutines when Dispatch is called with a nil limiter.
++	defaultMaxConcurrency = 32
++
++	// maxReferences caps the references a single Dispatch admits, duplicates
++	// included.
++	maxReferences = 10_000
++)
++
+ var (
+ 	// ErrSkipDesc is used to skip processing of a descriptor and
+ 	// its descendants.
+@@ -146,45 +157,81 @@ func WalkNotEmpty(ctx context.Context, handler Handler, descs ...ocispec.Descrip
+ // handler may return `ErrSkipDesc` to signal to the dispatcher to not traverse
+ // any children.
+ //
+-// A concurrency limiter can be passed in to limit the number of concurrent
+-// handlers running. When limiter is nil, there is no limit.
++// The limiter bounds concurrent handlers. When limiter is nil,
++// the limit is 32.
+ //
+ // Typically, this function will be used with `FetchHandler`, often composed
+ // with other handlers.
+ //
+ // If any handler returns an error, the dispatch session will be canceled.
++//
++// Each call is limited to 10,000 references, including duplicates.
++// Exceeding this limit returns an error wrapping
++// [errdefs.ErrResourceExhausted].
+ func Dispatch(ctx context.Context, handler Handler, limiter *semaphore.Weighted, descs ...ocispec.Descriptor) error {
+-	eg, ctx2 := errgroup.WithContext(ctx)
+-	for _, desc := range descs {
+-		if limiter != nil {
+-			if err := limiter.Acquire(ctx, 1); err != nil {
+-				return err
+-			}
++	if len(descs) == 0 {
++		return nil
++	}
++	if err := ctx.Err(); err != nil {
++		return err
++	}
++
++	if limiter == nil {
++		limiter = semaphore.NewWeighted(defaultMaxConcurrency)
++	}
++
++	var (
++		mu             sync.Mutex
++		next           []ocispec.Descriptor
++		referenceCount int
++	)
++
++	admit := func(descs []ocispec.Descriptor) error {
++		mu.Lock()
++		defer mu.Unlock()
++		if referenceCount+len(descs) > maxReferences {
++			return fmt.Errorf("too many descriptors (limit %d): %w", maxReferences, errdefs.ErrResourceExhausted)
+ 		}
++		referenceCount += len(descs)
++		next = append(next, descs...)
++		return nil
++	}
++
++	if err := admit(descs); err != nil {
++		return err
++	}
+ 
+-		eg.Go(func() error {
+-			desc := desc
++	for len(next) > 0 {
++		level := next
++		next = nil
+ 
+-			children, err := handler.Handle(ctx2, desc)
+-			if limiter != nil {
+-				limiter.Release(1)
++		eg, egCtx := errgroup.WithContext(ctx)
++		for _, desc := range level {
++			// Acquire here to bound the number of handler goroutines.
++			if err := limiter.Acquire(egCtx, 1); err != nil {
++				break
+ 			}
+-			if err != nil {
+-				if errors.Is(err, ErrSkipDesc) {
+-					return nil // don't traverse the children.
++			eg.Go(func() error {
++				defer limiter.Release(1)
++				children, err := handler.Handle(egCtx, desc)
++				if err != nil {
++					if errors.Is(err, ErrSkipDesc) {
++						return nil // don't traverse the children.
++					}
++					return err
+ 				}
+-				return err
+-			}
+-
+-			if len(children) > 0 {
+-				return Dispatch(ctx2, handler, limiter, children...)
+-			}
+-
+-			return nil
+-		})
++				return admit(children)
++			})
++		}
++		if err := eg.Wait(); err != nil {
++			return err
++		}
++		// Acquire can fail on cancellation even if every handler returns nil.
++		if err := ctx.Err(); err != nil {
++			return err
++		}
+ 	}
+-
+-	return eg.Wait()
++	return nil
+ }
+ 
+ // ChildrenHandler decodes well-known manifest types and returns their children.
+diff --git a/core/images/handlers_test.go b/core/images/handlers_test.go
+new file mode 100644
+index 000000000..5c4e54e86
+--- /dev/null
++++ b/core/images/handlers_test.go
+@@ -0,0 +1,469 @@
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
++package images
++
++import (
++	"context"
++	"errors"
++	"fmt"
++	"sync"
++	"sync/atomic"
++	"testing"
++	"time"
++
++	"github.com/containerd/errdefs"
++	digest "github.com/opencontainers/go-digest"
++	ocispec "github.com/opencontainers/image-spec/specs-go/v1"
++	"github.com/stretchr/testify/assert"
++	"github.com/stretchr/testify/require"
++	"golang.org/x/sync/errgroup"
++	"golang.org/x/sync/semaphore"
++)
++
++func newDesc(id string) ocispec.Descriptor {
++	return ocispec.Descriptor{
++		Digest:    digest.FromString(id),
++		MediaType: ocispec.MediaTypeImageLayer,
++		Size:      1,
++	}
++}
++
++func digestSet(digests []digest.Digest) map[digest.Digest]struct{} {
++	set := make(map[digest.Digest]struct{}, len(digests))
++	for _, d := range digests {
++		set[d] = struct{}{}
++	}
++	return set
++}
++
++func TestDispatchTreeTraversal(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++	grandchild1 := newDesc("grandchild1")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {child1, child2},
++		child1.Digest: {grandchild1},
++	}
++
++	var visited []digest.Digest
++	var mu sync.Mutex
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		mu.Lock()
++		visited = append(visited, desc.Digest)
++		mu.Unlock()
++		return graph[desc.Digest], nil
++	})
++
++	err := Dispatch(context.Background(), handler, nil, root)
++	require.NoError(t, err)
++
++	set := digestSet(visited)
++	assert.Contains(t, set, root.Digest)
++	assert.Contains(t, set, child1.Digest)
++	assert.Contains(t, set, child2.Digest)
++	assert.Contains(t, set, grandchild1.Digest)
++	assert.Len(t, visited, 4)
++}
++
++func TestDispatchRepeatedReferences(t *testing.T) {
++	root := newDesc("root")
++	childA := newDesc("A")
++	childB := newDesc("B")
++	shared := newDesc("shared")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {childA, childB},
++		childA.Digest: {shared},
++		childB.Digest: {shared},
++	}
++
++	tests := []struct {
++		name            string
++		dispatch        func(context.Context, Handler, *semaphore.Weighted, ...ocispec.Descriptor) error
++		wantTotalCalls  int32
++		wantSharedCalls int32
++	}{
++		{
++			name:            "Dispatch visits every reference",
++			dispatch:        Dispatch,
++			wantTotalCalls:  5,
++			wantSharedCalls: 2,
++		},
++	}
++
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var totalCalls atomic.Int32
++			var sharedCalls atomic.Int32
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				totalCalls.Add(1)
++				if desc.Digest == shared.Digest {
++					sharedCalls.Add(1)
++				}
++				return graph[desc.Digest], nil
++			})
++
++			err := tt.dispatch(context.Background(), handler, nil, root)
++			require.NoError(t, err)
++			assert.Equal(t, tt.wantTotalCalls, totalCalls.Load())
++			assert.Equal(t, tt.wantSharedCalls, sharedCalls.Load())
++		})
++	}
++}
++
++func TestDispatchErrSkipDesc(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++	grandchild := newDesc("grandchild")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {child1, child2},
++		child1.Digest: {grandchild},
++	}
++
++	var visited []digest.Digest
++	var mu sync.Mutex
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		mu.Lock()
++		visited = append(visited, desc.Digest)
++		mu.Unlock()
++		if desc.Digest == child1.Digest {
++			return graph[desc.Digest], ErrSkipDesc
++		}
++		return graph[desc.Digest], nil
++	})
++
++	err := Dispatch(context.Background(), handler, nil, root)
++	require.NoError(t, err)
++
++	set := digestSet(visited)
++	assert.Contains(t, set, root.Digest)
++	assert.Contains(t, set, child1.Digest)
++	assert.Contains(t, set, child2.Digest)
++	assert.NotContains(t, set, grandchild.Digest, "grandchild must not be visited when its parent returns ErrSkipDesc")
++}
++
++func TestDispatchConcurrencyLimit(t *testing.T) {
++	tests := []struct {
++		name           string
++		limiter        *semaphore.Weighted
++		maxConcurrency int32
++		numChildren    int
++	}{
++		{
++			name:           "With explicit limiter",
++			limiter:        semaphore.NewWeighted(3),
++			maxConcurrency: 3,
++			numChildren:    3 * 5,
++		},
++		{
++			name:           "With default limiter",
++			limiter:        nil,
++			maxConcurrency: defaultMaxConcurrency,
++			numChildren:    defaultMaxConcurrency * 5,
++		},
++	}
++
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			root := newDesc("root")
++			children := make([]ocispec.Descriptor, tt.numChildren)
++			for i := range tt.numChildren {
++				children[i] = newDesc(fmt.Sprintf("child-%d", i))
++			}
++
++			graph := map[digest.Digest][]ocispec.Descriptor{
++				root.Digest: children,
++			}
++
++			var concurrent, peak atomic.Int32
++			var exceeded atomic.Bool
++
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				n := concurrent.Add(1)
++				if n > tt.maxConcurrency {
++					exceeded.Store(true)
++				}
++				for {
++					old := peak.Load()
++					if n <= old || peak.CompareAndSwap(old, n) {
++						break
++					}
++				}
++				defer concurrent.Add(-1)
++
++				// Keep handlers running long enough to overlap.
++				time.Sleep(10 * time.Millisecond)
++				return graph[desc.Digest], nil
++			})
++
++			err := Dispatch(context.Background(), handler, tt.limiter, root)
++			require.NoError(t, err)
++
++			assert.False(t, exceeded.Load(), "concurrent handlers must not exceed capacity")
++			assert.Equal(t, tt.maxConcurrency, peak.Load(),
++				"concurrent handlers must reach the capacity the caller asked for")
++		})
++	}
++}
++
++func TestDispatchSharedLimiter(t *testing.T) {
++	const (
++		weight  = 4
++		callers = 4
++		perTree = 12
++	)
++
++	limiter := semaphore.NewWeighted(weight)
++
++	var concurrent atomic.Int32
++	var exceeded atomic.Bool
++	visited := make([]atomic.Int32, callers)
++
++	var eg errgroup.Group
++	for c := range callers {
++		eg.Go(func() error {
++			root := newDesc(fmt.Sprintf("root-%d", c))
++			children := make([]ocispec.Descriptor, perTree)
++			for i := range perTree {
++				children[i] = newDesc(fmt.Sprintf("caller-%d-child-%d", c, i))
++			}
++			graph := map[digest.Digest][]ocispec.Descriptor{root.Digest: children}
++
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				if concurrent.Add(1) > weight {
++					exceeded.Store(true)
++				}
++				defer concurrent.Add(-1)
++				visited[c].Add(1)
++
++				time.Sleep(2 * time.Millisecond)
++				return graph[desc.Digest], nil
++			})
++
++			return Dispatch(context.Background(), handler, limiter, root)
++		})
++	}
++
++	done := make(chan error, 1)
++	go func() { done <- eg.Wait() }()
++
++	select {
++	case err := <-done:
++		require.NoError(t, err)
++	case <-time.After(30 * time.Second):
++		t.Fatal("shared-limiter traversals did not complete; a caller is starved or deadlocked")
++	}
++
++	assert.False(t, exceeded.Load(), "combined concurrent handlers must not exceed the shared limiter weight")
++	for c := range callers {
++		assert.Equal(t, int32(perTree+1), visited[c].Load(),
++			"caller %d must visit every descriptor in its own graph", c)
++	}
++}
++
++func TestDispatchReferenceLimit(t *testing.T) {
++	// Each root is below the cap on its own; their combined references exceed it.
++	rootA := newDesc("root-a")
++	rootB := newDesc("root-b")
++
++	childrenA := make([]ocispec.Descriptor, maxReferences/2)
++	childrenB := make([]ocispec.Descriptor, maxReferences/2)
++	for i := range childrenA {
++		childrenA[i] = newDesc(fmt.Sprintf("a-%d", i))
++		childrenB[i] = newDesc(fmt.Sprintf("b-%d", i))
++	}
++
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		switch desc.Digest {
++		case rootA.Digest:
++			return childrenA, nil
++		case rootB.Digest:
++			return childrenB, nil
++		}
++		return nil, nil
++	})
++
++	require.ErrorIs(t, Dispatch(context.Background(), handler, nil, rootA, rootB), errdefs.ErrResourceExhausted)
++
++	acceptRoot := newDesc("accept-root")
++	exact := make([]ocispec.Descriptor, maxReferences-1)
++	for i := range exact {
++		exact[i] = newDesc(fmt.Sprintf("accept-%d", i))
++	}
++	acceptHandler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == acceptRoot.Digest {
++			return exact, nil
++		}
++		return nil, nil
++	})
++	require.NoError(t, Dispatch(context.Background(), acceptHandler, nil, acceptRoot))
++}
++
++func TestDispatchRejectsChildrenBeforeVisiting(t *testing.T) {
++	root := newDesc("root")
++	children := make([]ocispec.Descriptor, maxReferences)
++	for i := range children {
++		children[i] = newDesc(fmt.Sprintf("node-%d", i))
++	}
++	var childVisits atomic.Int32
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == root.Digest {
++			return children, nil
++		}
++		childVisits.Add(1)
++		return nil, nil
++	})
++
++	require.ErrorIs(t, Dispatch(context.Background(), handler, nil, root), errdefs.ErrResourceExhausted)
++	assert.Equal(t, int32(0), childVisits.Load(), "children of an over-limit slice must not be visited")
++}
++
++func TestDispatchDuplicateRoots(t *testing.T) {
++	root := newDesc("root")
++
++	tests := []struct {
++		name      string
++		dispatch  func(context.Context, Handler, *semaphore.Weighted, ...ocispec.Descriptor) error
++		wantCalls int32
++	}{
++		{"Dispatch visits each root", Dispatch, 2},
++	}
++
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var calls atomic.Int32
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				calls.Add(1)
++				return nil, nil
++			})
++			require.NoError(t, tt.dispatch(context.Background(), handler, nil, root, root))
++			assert.Equal(t, tt.wantCalls, calls.Load())
++		})
++	}
++}
++
++func TestDispatchCountsDuplicateReferences(t *testing.T) {
++	root := newDesc("root")
++	dup := newDesc("dup")
++	children := make([]ocispec.Descriptor, maxReferences+1)
++	for i := range children {
++		children[i] = dup
++	}
++	fanout := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == root.Digest {
++			return children, nil
++		}
++		return nil, nil
++	})
++	require.ErrorIs(t, Dispatch(context.Background(), fanout, nil, root), errdefs.ErrResourceExhausted)
++
++	a, b := newDesc("a"), newDesc("b")
++	cycle := map[digest.Digest][]ocispec.Descriptor{a.Digest: {b}, b.Digest: {a}}
++	cyclic := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		return cycle[desc.Digest], nil
++	})
++	require.ErrorIs(t, Dispatch(context.Background(), cyclic, nil, a), errdefs.ErrResourceExhausted)
++}
++
++func TestDispatchErrorPropagation(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest: {child1, child2},
++	}
++
++	errTest := errors.New("handler error")
++
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == child1.Digest {
++			return nil, errTest
++		}
++		return graph[desc.Digest], nil
++	})
++
++	err := Dispatch(context.Background(), handler, nil, root)
++	require.ErrorIs(t, err, errTest)
++}
++
++func TestDispatchContextCancellation(t *testing.T) {
++	ctx, cancel := context.WithCancel(context.Background())
++	cancel()
++
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		return nil, nil
++	})
++
++	err := Dispatch(ctx, handler, nil, newDesc("root"))
++	require.ErrorIs(t, err, context.Canceled)
++}
++
++func TestDispatchContextCancellationMidFlight(t *testing.T) {
++	// Use more descriptors than the limiter admits so cancellation also covers
++	// handlers waiting to start.
++	const n = defaultMaxConcurrency * 4
++	descs := make([]ocispec.Descriptor, n)
++	for i := range n {
++		descs[i] = newDesc(fmt.Sprintf("cancel-%d", i))
++	}
++
++	ctx, cancel := context.WithCancel(context.Background())
++	defer cancel()
++
++	started := make(chan struct{}, n)
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		started <- struct{}{}
++		<-ctx.Done()
++		return nil, ctx.Err()
++	})
++
++	go func() {
++		for range defaultMaxConcurrency {
++			<-started
++		}
++		cancel()
++	}()
++
++	err := Dispatch(ctx, handler, nil, descs...)
++	require.ErrorIs(t, err, context.Canceled)
++}
++
++func TestDispatchCancellationWithNoHandlerError(t *testing.T) {
++	const n = defaultMaxConcurrency * 4
++	descs := make([]ocispec.Descriptor, n)
++	for i := range n {
++		descs[i] = newDesc(fmt.Sprintf("cancel-queued-%d", i))
++	}
++
++	ctx, cancel := context.WithCancel(context.Background())
++	defer cancel()
++
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == descs[0].Digest {
++			cancel()
++		}
++		return nil, nil
++	})
++
++	err := Dispatch(ctx, handler, nil, descs...)
++	require.ErrorIs(t, err, context.Canceled)
++}
+-- 
+2.53.0
+
diff --git a/recipes-containers/containerd/containerd/CVE-2026-53493_p2.patch b/recipes-containers/containerd/containerd/CVE-2026-53493_p2.patch
new file mode 100644
index 00000000..d76cfb2e
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53493_p2.patch
@@ -0,0 +1,329 @@
+From 77f0eab284656ca3b609ad347a83bb6adb9d6833 Mon Sep 17 00:00:00 2001
+From: Chris Henzie <chrishenzie@gmail.com>
+Date: Tue, 28 Jul 2026 14:18:32 -0700
+Subject: [PATCH 2/2] Bound Walk references
+
+Return an error wrapping ErrResourceExhausted when the walk exceeds
+10,000 references. Preserve duplicate visits and count every reference
+toward the limit across recursive calls and roots.
+
+CVE: CVE-2026-53493
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/053c0cc412f2a36c77a973d0b62ff4fa4815a9bb]
+
+Assisted-by: Claude Code
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit 4f5f32636d47f051751065cf824a10da70c619fe)
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit 053c0cc412f2a36c77a973d0b62ff4fa4815a9bb)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ core/images/handlers.go      |  25 +++-
+ core/images/handlers_test.go | 240 +++++++++++++++++++++++++++++++++++
+ 2 files changed, 261 insertions(+), 4 deletions(-)
+
+diff --git a/core/images/handlers.go b/core/images/handlers.go
+index a60835f97..7d1ec35cb 100644
+--- a/core/images/handlers.go
++++ b/core/images/handlers.go
+@@ -38,8 +38,8 @@ const (
+ 	// goroutines when Dispatch is called with a nil limiter.
+ 	defaultMaxConcurrency = 32
+ 
+-	// maxReferences caps the references a single Dispatch admits, duplicates
+-	// included.
++	// maxReferences caps the references in a single Dispatch or Walk.
++	// Duplicate references count toward this limit.
+ 	maxReferences = 10_000
+ )
+ 
+@@ -99,9 +99,26 @@ func Handlers(handlers ...Handler) HandlerFunc {
+ //
+ // This differs from dispatch in that each sibling resource is considered
+ // synchronously.
++//
++// Each call is limited to 10,000 references, including duplicates.
++// Exceeding this limit returns an error wrapping
++// [errdefs.ErrResourceExhausted].
+ func Walk(ctx context.Context, handler Handler, descs ...ocispec.Descriptor) error {
+-	for _, desc := range descs {
++	w := &walker{}
++	return w.walk(ctx, handler, descs...)
++}
+ 
++type walker struct {
++	referenceCount int
++}
++
++func (w *walker) walk(ctx context.Context, handler Handler, descs ...ocispec.Descriptor) error {
++	if w.referenceCount+len(descs) > maxReferences {
++		return fmt.Errorf("too many descriptors (limit %d): %w", maxReferences, errdefs.ErrResourceExhausted)
++	}
++	w.referenceCount += len(descs)
++
++	for _, desc := range descs {
+ 		children, err := handler.Handle(ctx, desc)
+ 		if err != nil {
+ 			if errors.Is(err, ErrSkipDesc) {
+@@ -111,7 +128,7 @@ func Walk(ctx context.Context, handler Handler, descs ...ocispec.Descriptor) err
+ 		}
+ 
+ 		if len(children) > 0 {
+-			if err := Walk(ctx, handler, children...); err != nil {
++			if err := w.walk(ctx, handler, children...); err != nil {
+ 				return err
+ 			}
+ 		}
+diff --git a/core/images/handlers_test.go b/core/images/handlers_test.go
+index 5c4e54e86..acad816d7 100644
+--- a/core/images/handlers_test.go
++++ b/core/images/handlers_test.go
+@@ -50,6 +50,246 @@ func digestSet(digests []digest.Digest) map[digest.Digest]struct{} {
+ 	return set
+ }
+ 
++func TestWalkTreeTraversal(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++	grandchild1 := newDesc("grandchild1")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {child1, child2},
++		child1.Digest: {grandchild1},
++	}
++
++	var visited []digest.Digest
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		visited = append(visited, desc.Digest)
++		return graph[desc.Digest], nil
++	})
++
++	err := Walk(context.Background(), handler, root)
++	require.NoError(t, err)
++
++	want := []digest.Digest{root.Digest, child1.Digest, grandchild1.Digest, child2.Digest}
++	assert.Equal(t, want, visited)
++}
++
++func TestWalkRepeatedReferences(t *testing.T) {
++	root := newDesc("root")
++	childA := newDesc("A")
++	childB := newDesc("B")
++	shared := newDesc("shared")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {childA, childB},
++		childA.Digest: {shared},
++		childB.Digest: {shared},
++	}
++
++	tests := []struct {
++		name            string
++		walk            func(context.Context, Handler, ...ocispec.Descriptor) error
++		wantTotalCalls  int
++		wantSharedCalls int
++	}{
++		{
++			name:            "Walk visits every reference",
++			walk:            Walk,
++			wantTotalCalls:  5,
++			wantSharedCalls: 2,
++		},
++	}
++
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var totalCalls, sharedCalls int
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				totalCalls++
++				if desc.Digest == shared.Digest {
++					sharedCalls++
++				}
++				return graph[desc.Digest], nil
++			})
++
++			err := tt.walk(context.Background(), handler, root)
++			require.NoError(t, err)
++			assert.Equal(t, tt.wantTotalCalls, totalCalls)
++			assert.Equal(t, tt.wantSharedCalls, sharedCalls)
++		})
++	}
++}
++
++func TestWalkErrSkipDesc(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++	grandchild := newDesc("grandchild")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest:   {child1, child2},
++		child1.Digest: {grandchild},
++	}
++
++	var visited []digest.Digest
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		visited = append(visited, desc.Digest)
++		if desc.Digest == child1.Digest {
++			return graph[desc.Digest], ErrSkipDesc
++		}
++		return graph[desc.Digest], nil
++	})
++
++	err := Walk(context.Background(), handler, root)
++	require.NoError(t, err)
++
++	set := digestSet(visited)
++	assert.Contains(t, set, root.Digest)
++	assert.Contains(t, set, child1.Digest)
++	assert.Contains(t, set, child2.Digest)
++	assert.NotContains(t, set, grandchild.Digest, "grandchild must not be visited when its parent returns ErrSkipDesc")
++}
++
++func TestWalkReferenceLimit(t *testing.T) {
++	root := newDesc("root")
++	handlerReturning := func(childCount int) Handler {
++		children := make([]ocispec.Descriptor, childCount)
++		for i := range children {
++			children[i] = newDesc(fmt.Sprintf("node-%d", i))
++		}
++		return HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++			if desc.Digest == root.Digest {
++				return children, nil
++			}
++			return nil, nil
++		})
++	}
++
++	require.NoError(t, Walk(context.Background(), handlerReturning(maxReferences-1), root))
++	require.ErrorIs(t, Walk(context.Background(), handlerReturning(maxReferences), root), errdefs.ErrResourceExhausted)
++}
++
++func TestWalkRejectsChildrenBeforeVisiting(t *testing.T) {
++	root := newDesc("root")
++	children := make([]ocispec.Descriptor, maxReferences)
++	for i := range children {
++		children[i] = newDesc(fmt.Sprintf("node-%d", i))
++	}
++	var childVisits int
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == root.Digest {
++			return children, nil
++		}
++		childVisits++
++		return nil, nil
++	})
++
++	require.ErrorIs(t, Walk(context.Background(), handler, root), errdefs.ErrResourceExhausted)
++	assert.Equal(t, 0, childVisits, "children of an over-limit slice must not be visited")
++}
++
++func TestWalkErrorPropagation(t *testing.T) {
++	root := newDesc("root")
++	child1 := newDesc("child1")
++	child2 := newDesc("child2")
++
++	graph := map[digest.Digest][]ocispec.Descriptor{
++		root.Digest: {child1, child2},
++	}
++
++	errTest := errors.New("handler error")
++
++	handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == child1.Digest {
++			return nil, errTest
++		}
++		return graph[desc.Digest], nil
++	})
++
++	err := Walk(context.Background(), handler, root)
++	require.ErrorIs(t, err, errTest)
++}
++
++func TestWalkDuplicateRoots(t *testing.T) {
++	root := newDesc("root")
++
++	tests := []struct {
++		name      string
++		walk      func(context.Context, Handler, ...ocispec.Descriptor) error
++		wantCalls int
++	}{
++		{"Walk visits each root", Walk, 2},
++	}
++
++	for _, tt := range tests {
++		t.Run(tt.name, func(t *testing.T) {
++			var calls int
++			handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++				calls++
++				return nil, nil
++			})
++			require.NoError(t, tt.walk(context.Background(), handler, root, root))
++			assert.Equal(t, tt.wantCalls, calls)
++		})
++	}
++}
++
++func TestWalkCountsDuplicateReferences(t *testing.T) {
++	root := newDesc("root")
++	dup := newDesc("dup")
++	children := make([]ocispec.Descriptor, maxReferences+1)
++	for i := range children {
++		children[i] = dup
++	}
++	fanout := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		if desc.Digest == root.Digest {
++			return children, nil
++		}
++		return nil, nil
++	})
++	require.ErrorIs(t, Walk(context.Background(), fanout, root), errdefs.ErrResourceExhausted)
++
++	a, b := newDesc("a"), newDesc("b")
++	cycle := map[digest.Digest][]ocispec.Descriptor{a.Digest: {b}, b.Digest: {a}}
++	cyclic := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++		return cycle[desc.Digest], nil
++	})
++	require.ErrorIs(t, Walk(context.Background(), cyclic, a), errdefs.ErrResourceExhausted)
++}
++
++func TestWalkNotEmpty(t *testing.T) {
++	root := newDesc("root")
++	child := newDesc("child")
++
++	t.Run("returns nil when a handler produces children", func(t *testing.T) {
++		graph := map[digest.Digest][]ocispec.Descriptor{root.Digest: {child}}
++		handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++			return graph[desc.Digest], nil
++		})
++		require.NoError(t, WalkNotEmpty(context.Background(), handler, root))
++	})
++
++	t.Run("returns ErrEmptyWalk when everything is filtered out", func(t *testing.T) {
++		handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++			return nil, nil
++		})
++		require.ErrorIs(t, WalkNotEmpty(context.Background(), handler, root), ErrEmptyWalk)
++	})
++
++	t.Run("propagates the reference-cap error", func(t *testing.T) {
++		children := make([]ocispec.Descriptor, maxReferences+1)
++		for i := range children {
++			children[i] = newDesc(fmt.Sprintf("node-%d", i))
++		}
++		handler := HandlerFunc(func(ctx context.Context, desc ocispec.Descriptor) ([]ocispec.Descriptor, error) {
++			if desc.Digest == root.Digest {
++				return children, nil
++			}
++			return nil, nil
++		})
++		require.ErrorIs(t, WalkNotEmpty(context.Background(), handler, root), errdefs.ErrResourceExhausted)
++	})
++}
++
+ func TestDispatchTreeTraversal(t *testing.T) {
+ 	root := newDesc("root")
+ 	child1 := newDesc("child1")
+-- 
+2.53.0
+
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 2b037110..48d41dbc 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -17,6 +17,8 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-53492.patch \
            file://CVE-2026-53489.patch \
            file://CVE-2026-53495.patch \
+           file://CVE-2026-53493_p1.patch \
+           file://CVE-2026-53493_p2.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


