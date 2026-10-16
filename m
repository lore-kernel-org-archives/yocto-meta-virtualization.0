Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5284ECCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 10:07:15 +0000 (UTC)
Received: from aer-iport-2.cisco.com (aer-iport-2.cisco.com [173.38.203.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18338.1792145232145474219
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 16 Oct 2026 03:07:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=Ua7v3ooR;
 spf=pass (domain: cisco.com, ip: 173.38.203.52, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5502; q=dns/txt;
  s=iport01; t=1792145232; x=1793354832;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=JZPIfjFuKtNUt85jjJXZdZ+3W3BlVRrV3oRAP94VZLA=;
  b=Ua7v3ooRYbdSWboaWQ98ymZKA9H0zl9YVXboVo1ABeAzlsmWNZG128w9
   xpqxgmZUViYqlWI7kveT920AgfGpeSIMZKdVufARnRhsXNswvKF/zoerE
   XIkg+Gx+c8/E94srgfmoBsioMiBFSfTMMzZwHPseJsxhT66SVLt80iLJs
   G0jkZpRWpW37NYySXQk4kwQkT/tYJxR/y8AGsb5yLCeVy14vCXHx+Tj8m
   qXhuReqIY5hNo2h6BekNSd3DjAUIMQj4MexUbORtjRZRO/soPKdwqY6tD
   vNbt+nfH5baNzdeXOPB9Tl7NAFWOsOPBF6nW9shbwOydkdjgh8rOivH0O
   Q==;
X-CSE-ConnectionGUID: zo5vcSFBQqWV1HnZgSEAaQ==
X-CSE-MsgGUID: OlgEvxheR0KYoFXy2nbvHg==
X-IPAS-Result: =?us-ascii?q?A0DjAgAs9tFq/9NK/pBaglmCV3VhQkmUKYIhA4tlkjeBJ?=
 =?us-ascii?q?ANXDwEBAQ9EDQQBAYQ/RgKOFQImNQgOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMyAVYcAwECLyALIwgRCIMCAYI6AzcDEb07g?=
 =?us-ascii?q?iyBAYNpAkNQ2EsNgloBCxQBgTiFQIJ/hSRdGAGEfCcbG4FyhH6BBYEaQgEBg?=
 =?us-ascii?q?Schhl0EgiKBDIFalUdIgR4DWSwBVRMNCgsHBYFoAzUSKhVuMh2BIz4XgQcbB?=
 =?us-ascii?q?gWBHYEgghYjGTZ6gQlegSspYRAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiC?=
 =?us-ascii?q?BIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoJVC?=
 =?us-ascii?q?QdKMRMBK4EYNR+TbpAmgh6BOJ5pcQoog3aMIo8+hXwaM4VbpRQLmH2LN4JTh?=
 =?us-ascii?q?AmRWG6EaYFqAjg5gQ4LB3AVgyIJShkPji4LC4NggX/MQzw1CzIBAQcCBw4DC?=
 =?us-ascii?q?4FokAAEgXoBAQ?=
IronPort-Data: A9a23:8mUVDqKN3U1kVM2BFE+Rh5QlxSXFcZb7ZxGr2PjKsXjdYENSgjIAz
 GEaWWiDP/uJZWCjcognOozip0pVsZDRmN9iTFAd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZpCCea+Uf1WlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnS0
 T/Oi5eHYgH8g2cqajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN18CxwoNrY20N9uPl8X1
 foqJwsgRxm60rfeLLKTEoGAh+wqIdOuOMYUvWttiGiBS/0nWpvEBa7N4Le03h9p2pwIR6uCI
 ZVFL2A2NXwsYDUXUrsTIJ4zkf2hmnn4WzZZs1mS46Ew5gA/ySQvieSwbYOIJ7RmQ+1ymkm1u
 HLG8l6hISAdGuyOkzyP7FKj07qncSTTHdh6+KeD3vtnnFTW2G0JFAAfUVqpqOW4jUiWX9NEN
 1dS6y0lsa8q7kupQ9LhGRqirxa5UgU0UtdKVul/4waXx++Nu0CSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:ytGlZa7yekZpcNJFVAPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:KhsTI2OMFyk3V+5DSi466kUvNOoca0LjlVfWEUCDJE9gcejA
X-Talos-MUID: 9a23:u3xwvgSSms5l4hi7RXTLgD5PKtdo7p72K3EKv6UX4c+OKwx/bmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="61455155"
Received: from aer-l-core-10.cisco.com ([144.254.74.211])
  by aer-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 10:07:09 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by aer-l-core-10.cisco.com (Postfix) with ESMTPS id 22801180001EF
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:09 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id ACAB1CC1295; Fri, 16 Oct 2026 15:37:07 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 4/5] containerd: Fix CVE-2026-53495
Date: Fri, 16 Oct 2026 15:36:40 +0530
Message-Id: <20261016100641.1628059-4-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261016100641.1628059-1-deeratho@cisco.com>
References: <20261016100641.1628059-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: aer-l-core-10.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 16 Oct 2026 10:07:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10117

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for CVE-2026-53495.
The upstream fix commit is referenced in [1], and the public CVE record
is referenced in [2].

[1] https://github.com/containerd/containerd/commit/22ccf4314d1fe0834f8e28f10d37d5305ef9880c
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-53495

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-53495.patch           | 108 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 109 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-53495.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-53495.patch b/recipes-containers/containerd/containerd/CVE-2026-53495.patch
new file mode 100644
index 00000000..c22a39ca
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-53495.patch
@@ -0,0 +1,108 @@
+From dd4821d9a9995c3a1fd17ae82b3484357f5424d2 Mon Sep 17 00:00:00 2001
+From: XlabAI <xlabai@tencent.com>
+Date: Tue, 9 Jun 2026 12:17:23 +0800
+Subject: [PATCH 4/4] cri: cancel ExecSync IO drain on context cancellation
+
+When drain_exec_sync_io_timeout is 0 and a child process holds the
+pipe, drainExecSyncIO blocks forever even after the client disconnects.
+Add ctx.Done() to the select to allow cancellation, and use a deferred
+context for Process.Delete cleanup when the original context is already
+canceled.
+
+CVE: CVE-2026-53495
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/22ccf4314d1fe0834f8e28f10d37d5305ef9880c]
+
+Signed-off-by: Guannan Wang <wgnbuaa@gmail.com>
+(cherry picked from commit ff39a972369e2f12fae561a58d658bbf8f2bc318)
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 22ccf4314d1fe0834f8e28f10d37d5305ef9880c)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ internal/cri/server/container_execsync.go     | 13 ++++++-
+ .../cri/server/container_execsync_test.go     | 34 +++++++++++++++++++
+ 2 files changed, 46 insertions(+), 1 deletion(-)
+
+diff --git a/internal/cri/server/container_execsync.go b/internal/cri/server/container_execsync.go
+index d86b4f677..190cd92c7 100644
+--- a/internal/cri/server/container_execsync.go
++++ b/internal/cri/server/container_execsync.go
+@@ -311,19 +311,30 @@ func drainExecSyncIO(ctx context.Context, execProcess containerd.Process, drainE
+ 
+ 	select {
+ 	case <-timerCh:
++	case <-ctx.Done():
+ 	case <-attachDone:
+ 		log.G(ctx).Tracef("Stream pipe for exec process %q done", execProcess.ID())
+ 		return nil
+ 	}
+ 
+ 	log.G(ctx).Debugf("Exec process %q exits but the io is still held by other processes. Trying to delete exec process to release io", execProcess.ID())
+-	_, err := execProcess.Delete(ctx, containerd.WithProcessKill)
++	deleteCtx := ctx
++	if ctx.Err() != nil {
++		var cancel context.CancelFunc
++		deleteCtx, cancel = util.DeferContext()
++		defer cancel()
++	}
++	_, err := execProcess.Delete(deleteCtx, containerd.WithProcessKill)
+ 	if err != nil {
+ 		if !errdefs.IsNotFound(err) {
+ 			return fmt.Errorf("failed to release exec io by deleting exec process %q: %w",
+ 				execProcess.ID(), err)
+ 		}
+ 	}
++	if err := ctx.Err(); err != nil {
++		return fmt.Errorf("failed to drain exec process %q io before context cancellation: %w",
++			execProcess.ID(), err)
++	}
+ 	return fmt.Errorf("failed to drain exec process %q io in %s because io is still held by other processes",
+ 		execProcess.ID(), drainExecIOTimeout)
+ }
+diff --git a/internal/cri/server/container_execsync_test.go b/internal/cri/server/container_execsync_test.go
+index 0ef5f1c1b..51467638f 100644
+--- a/internal/cri/server/container_execsync_test.go
++++ b/internal/cri/server/container_execsync_test.go
+@@ -83,6 +83,40 @@ func TestDrainExecSyncIO(t *testing.T) {
+ 		assert.Error(t, drainExecSyncIO(ctx, ep, 3*time.Second, attachDoneCh))
+ 		assert.Equal(t, []string{"Delete"}, ep.actionEvents)
+ 	})
++
++	t.Run("CanceledNoTimeout", func(t *testing.T) {
++		ctx, cancel := context.WithCancel(ctx)
++		cancel()
++
++		ep := &fakeExecProcess{
++			id:  t.Name(),
++			pid: uint32(os.Getpid()),
++		}
++
++		attachDoneCh := make(chan struct{})
++		assert.ErrorIs(t, drainExecSyncIO(ctx, ep, 0, attachDoneCh), context.Canceled)
++		assert.Equal(t, []string{"Delete"}, ep.actionEvents)
++	})
++
++	t.Run("CancelWhileDraining", func(t *testing.T) {
++		ctx, cancel := context.WithCancel(ctx)
++
++		ep := &fakeExecProcess{
++			id:  t.Name(),
++			pid: uint32(os.Getpid()),
++		}
++
++		attachDoneCh := make(chan struct{})
++		errCh := make(chan error, 1)
++		go func() {
++			errCh <- drainExecSyncIO(ctx, ep, 0, attachDoneCh)
++		}()
++
++		time.AfterFunc(100*time.Millisecond, cancel)
++
++		assert.ErrorIs(t, <-errCh, context.Canceled)
++		assert.Equal(t, []string{"Delete"}, ep.actionEvents)
++	})
+ }
+ 
+ type fakeExecProcess struct {
+-- 
+2.35.6
+
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index af756ba8..2b037110 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-50195.patch \
            file://CVE-2026-53492.patch \
            file://CVE-2026-53489.patch \
+           file://CVE-2026-53495.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


