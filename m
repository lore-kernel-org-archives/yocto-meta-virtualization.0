Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.38401.1795597246357891688
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 25 Nov 2026 01:00:46 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=SW904xPX;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5432; q=dns/txt;
  s=iport01; t=1795597246; x=1796806846;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Gywz0T3kl99hiTOYGW6Kyw9so/6bHS3X1YQs43ZTTvY=;
  b=SW904xPXUIMLzE/fucgUC/nWGXpmM/gjpVex+2K4CIZilwWFlgqtlpUK
   R8/N5u6H50xWOXRPy+qWsQqIDKqjev7HcQBYCJDPTnHFBSfBoLDCemqUZ
   Z/gF29MbQWvp7aU319taUTALvYmX8OXxgV18iM84YNDqcF7n3TZdMV5QZ
   en36GyNpY3kjk3Kh5EpUP+PguGMgGuCP0ru1qjJ0pE9IiuBMrEi2FU2OJ
   43c69bVlCtojNh4lLuRN9LXytWHlGroQObSeVJxuKpqn8tuBKt9ZA2YK8
   bR/88OJrOiRQ2fS1AMBS5WV325ITUNV9PmCvouvPub+k2XNbW6vgbCKCn
   A==;
X-CSE-ConnectionGUID: WsgpdSXVScGrUpglMrpEMQ==
X-CSE-MsgGUID: p4tDK1DoQ4CrYI8zmG7AcA==
X-IPAS-Result: =?us-ascii?q?A0BIAgBToQZr/9JK/pBRCYJZgld1YUJJA5QngiEDgROdF?=
 =?us-ascii?q?oF+DwEBAQ9EDQQBAYQ/RgKOIgImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMyAVYcAwECLysjCBmDAgGCdAIBEbhjgiyBA?=
 =?us-ascii?q?YR+2zMBCxQBgTiFQoglXRgBhH4nGxuBcoEVgnR2gQWBXAKBNIZQIgSCDRWBD?=
 =?us-ascii?q?IFUHox1AoFJiFJIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIzsXgQcbBgWBH?=
 =?us-ascii?q?IEegRKBA12BKyheIYEIgXUCglGCAAIBSUEOB0VTCSVDEkckIggSCQETGiwKg?=
 =?us-ascii?q?Ro1PAkmPxUMZwsaBWEIAg0MdDkQMBwkLwUZJjwbCoEMJx0eGQ4CKQYWIQs0G?=
 =?us-ascii?q?A1IESw3FRkEPm4HlBOCKXACexMBEBuBGAOBEZN9kXihEQoog3mMJJU6GjOFW?=
 =?us-ascii?q?6UYC5h9izeCU5YCUIRqgWg8OYEgcBWDIglKGQ+OOYNrhAeBDMlIIzULAy8BA?=
 =?us-ascii?q?QcCBw4DC4FohGONGwEB?=
IronPort-Data: A9a23:Z6qJL6429CNKd+eRVmG6yAxRtG7GchMFZxGqfqrLsTDasY5as4F+v
 jQXCDiBM6rZYWqhe94kPNm+/RhT75SGnd81QVNlqn1gZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa+1H1dOi78BGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/KUzBHf/g2QqaztOsPrZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eApYX4upMMV91/
 tMCFSgCajWZn8+T+efuIgVsrpxLwMjDNY4F/3UlxjbDALN+ENbIQr7B4plT2zJYasJmRKqCI
 ZBENXwwMFKaOkUn1lQ/UPrSmM+ki3TleiFYr3qepLE85C7YywkZPL3FboKJIofSGZs9ckCwv
 j7a00egLhYjaPeF+BvV4HeD2cbEtHauMG4VPPjinhJwu3WWy3AaTQMXT0emqP24mEeiWtVZA
 0gV4TY167k1/1CsVsP6XRCzvDiDpBF0ZjZLO+Q38kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rN94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:qvZkaKyINuiNieS6HizgKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: 9a23:ydN2oWHLy4nYNrFAqmJY70EMFvsVTEbW423tO0C8LHxxZZisHAo=
X-Talos-MUID: 9a23:hO1vCwow9x+FH1dG6G0ezyk+KOtLuoipMRwmi6Qn69uBGnNZMB7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,229,1787011200"; 
   d="scan'208";a="60403046"
Received: from aer-l-core-09.cisco.com ([144.254.74.210])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 25 Nov 2026 09:00:43 +0000
Received: from sjc-ads-2449.cisco.com (sjc-ads-2449.cisco.com [171.70.63.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-09.cisco.com (Postfix) with ESMTPS id 79EC51800081A
	for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:43 +0000 (GMT)
Received: by sjc-ads-2449.cisco.com (Postfix, from userid 1795984)
	id 28DC8CC12A8; Wed, 25 Nov 2026 01:00:42 -0800 (PST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 3/3] docker-moby: fix CVE-2026-115539
Date: Wed, 25 Nov 2026 01:00:33 -0800
Message-Id: <20261125090033.2807645-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261125090033.2807645-1-deeratho@cisco.com>
References: <20261125090033.2807645-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;sjc-ads-2449.cisco.com [171.70.63.137];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.70.63.137, sjc-ads-2449.cisco.com
X-Outbound-Node: aer-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Wed, 25 Nov 2026 09:00:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10182
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream SwarmKit fix for CVE-2026-115539 into Moby's
vendored source. The fix preserves forwarded client identity across
manager hops and rejects requests that were already forwarded. The
upstream fix and public advisory are referenced in [1] and [2].

[1] https://github.com/moby/swarmkit/commit/277b683581ba7fdc38427ceed8d9e1934aa2c52c
[2] https://github.com/moby/swarmkit/security/advisories/GHSA-628g-hv7f-pgjc

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |  1 +
 .../docker/files/CVE-2026-115539.patch        | 89 +++++++++++++++++++
 2 files changed, 90 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-115539.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 3b1eb025..532f22ed 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -67,6 +67,7 @@ SRC_URI = "\
         file://CVE-2026-17106_p1.patch;patchdir=src/import \
         file://CVE-2026-17106_p2.patch;patchdir=src/import \
         file://CVE-2026-115538.patch;patchdir=src/import \
+        file://CVE-2026-115539.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-115539.patch b/recipes-containers/docker/files/CVE-2026-115539.patch
new file mode 100644
index 00000000..bca88100
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-115539.patch
@@ -0,0 +1,89 @@
+From cff5d3669fb33db891c6dd424922fed2d6a1f94b Mon Sep 17 00:00:00 2001
+From: Cory Snider <csnider@mirantis.com>
+Date: Mon, 16 Nov 2026 00:49:56 -0800
+Subject: [PATCH] ca: forward a request to the leader only once
+
+WithMetadataForwardTLSInfo built the outgoing metadata from the
+request's incoming metadata, then wrote the peer's certificate subject
+over the forwarded TLS keys. A manager which forwarded an
+already-forwarded request therefore presented the manager it came from
+as the client. The node which served the request treated a worker's RPC
+as a manager's.
+
+The raft proxies refuse to forward a request twice: each adds a
+"redirect" key to the outgoing metadata and refuses to forward a request
+which arrives with one. Rebuilding the metadata from the incoming
+context dropped that key on every proxy which forwards TLS information.
+The guard never reached the next hop on those proxies.
+
+Build the outgoing metadata from the outgoing context, and leave keys
+other than the TLS information alone. Managers running older versions
+still drop the "redirect" key. Refuse to forward a request which arrives
+already carrying forwarded TLS information as well.
+
+Also drop a stale remote address when there is no peer to describe so
+that a blank identity is never paired with another node's address.
+
+CVE: CVE-2026-115539
+Upstream-Status: Backport [https://github.com/moby/swarmkit/commit/277b683581ba7fdc38427ceed8d9e1934aa2c52c]
+
+Backport Changes:
+- Apply the fix to Moby's vendored SwarmKit source. Omit the upstream
+  ca/forward_test.go file because dependency tests are excluded from the
+  vendored module and the Docker Moby recipe does not run SwarmKit's
+  standalone test suite.
+
+Signed-off-by: Cory Snider <csnider@mirantis.com>
+Assisted-by: Claude Opus 5
+Assisted-by: Claude Opus 5.5
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ .../github.com/moby/swarmkit/v2/ca/forward.go  | 18 +++++++++++++++---
+ 1 file changed, 15 insertions(+), 3 deletions(-)
+
+diff --git a/vendor/github.com/moby/swarmkit/v2/ca/forward.go b/vendor/github.com/moby/swarmkit/v2/ca/forward.go
+index 7ad7c7dd..affed4fd 100644
+--- a/vendor/github.com/moby/swarmkit/v2/ca/forward.go
++++ b/vendor/github.com/moby/swarmkit/v2/ca/forward.go
+@@ -3,8 +3,10 @@ package ca
+ import (
+ 	"context"
+ 
++	"google.golang.org/grpc/codes"
+ 	"google.golang.org/grpc/metadata"
+ 	"google.golang.org/grpc/peer"
++	"google.golang.org/grpc/status"
+ )
+ 
+ const (
+@@ -40,10 +42,18 @@ func isForwardedRequest(ctx context.Context) bool {
+ 	return md[certForwardedKey][0] == "true"
+ }
+ 
+-// WithMetadataForwardTLSInfo reads certificate from context and returns context where
+-// ForwardCert is set based on original certificate.
++// WithMetadataForwardTLSInfo adds the client's TLS information to the outgoing
++// gRPC context, replacing any TLS information already there and leaving the
++// rest of the outgoing metadata alone.
++//
++// A request which arrived already forwarded is refused. Forwarding it again
++// would present the node which forwarded it as the client.
+ func WithMetadataForwardTLSInfo(ctx context.Context) (context.Context, error) {
+-	md, ok := metadata.FromIncomingContext(ctx)
++	if isForwardedRequest(ctx) {
++		return ctx, status.Errorf(codes.ResourceExhausted, "more than one redirect to leader: request was already forwarded")
++	}
++
++	md, ok := metadata.FromOutgoingContext(ctx)
+ 	if !ok {
+ 		md = metadata.MD{}
+ 	}
+@@ -72,6 +82,8 @@ func WithMetadataForwardTLSInfo(ctx context.Context) (context.Context, error) {
+ 	peer, ok := peer.FromContext(ctx)
+ 	if ok {
+ 		md[remoteAddrKey] = []string{peer.Addr.String()}
++	} else {
++		delete(md, remoteAddrKey)
+ 	}
+ 
+ 	return metadata.NewOutgoingContext(ctx, md), nil
-- 
2.35.6

