Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28355.1793858652364154372
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:04:12 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=D08GNLL3;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=8958; q=dns/txt;
  s=iport01; t=1793858652; x=1795068252;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=Yd+ZWj8PtoO7+PoU8FXAnuXAyRkrPIg0QuTh3cOIjXk=;
  b=D08GNLL3DgekqUkTHRkra9h7/g3ibwNhslWlB44qOLfYn1APtIYUFDLr
   Ra8efld9z1jdL0A33dAmVKKcFgsDoJepfVveBVhOx/cZgpvUJL0PYFJlq
   a8zHVNBQbnNX5bDYjTO+YrIBLEEWhFiNYNISxfzzmy0q4xmN39juufm8x
   XNAXRc5KJxUJ0OKxlT0wb23ltw4M0hGcpgml1Lh6YLAse9Ko9LbKTOkzn
   vqa8QNVHeWoSWdvLWw4aA+o6eYcV4jsUN/m3aZxMnRHmR2bAWutXZu8jO
   O7w55SuhBuy4ZEgjJaHeLfG51DPhVwOPQzM7gAovXfyBOzyExU9VSOmiB
   g==;
X-CSE-ConnectionGUID: F4J0Noe3SbanuuaiHHjUJA==
X-CSE-MsgGUID: BQa+sqNYQBqSIORVOXIIaQ==
X-IPAS-Result: =?us-ascii?q?A0DMAgAbHOxq/5IQJK1aglmCV3VhQkkDlCeCIQOeIRSBE?=
 =?us-ascii?q?ANXDwEBAQ9EDQQBAYFxgk5GAo4dAiY1CA4BAgQDAgMBAQEBAQEBAQEBAQEKA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDZASAQIBAzIBVhwDAQIvKyMIEQiDAgGCdAMRvDWCL?=
 =?us-ascii?q?IEBgmaBAwJDUNszAQsUAYE4hUCII10YAYR9JxsbgXKEfoEFgVwCgScfhmAEg?=
 =?us-ascii?q?iKBDIFajBOBBQKBUoZxSIEeA1ksAVUTDQoLBwWBaAM1EioVbjIdgSM+F4EHG?=
 =?us-ascii?q?wYFgR2BHoESgQddgSsoXiGBCIF2AoJRggACAUlBDgdFUwklQxJHJCIIEgkBE?=
 =?us-ascii?q?xosCoEaNTwJJj8VDGQLGgVhCAINDHI5EDAeJC8FHCZAGwoYGA1IESw3FRkEP?=
 =?us-ascii?q?m4Hki+CREwBPVEBK4E0ORABLh4cFJJDHQmQHoIegTifXAoog3iMJJU6GjOFW?=
 =?us-ascii?q?6UWC5h9izeCU5ZRhGmBagI4OYEgcBWDIglKGQ9XjVQOC4NghRPJLjw1CwMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJAAAiYHgU8BAQ?=
IronPort-Data: A9a23:XnOAyKzHz+rHGkqxe616t+dnxyrEfRIJ4+MujC+fZmUNrF6WrkUAy
 mBKWmCCb/2MNmCkfYoiPI+1900DvMeBnYM3HQQ4/lhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCKa/lHyYuCJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4yaT/H3Ygf/hWctaj5MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJG9qH9U+/essOmtH8
 +EFITEtThK+pcvjldpXSsE07igiBMDvOIVavjRryivUSK53B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNUieC/FMEg9/5JYWkOqlnHDjczpwo1OOrq1x6G/WpOB0+Oi9YYSOKoLaFa25mG6yn
 2uF5H3fMygwLee+7gC71UKNp+b2yHaTtIU6UefQGuRRqFie2mVWFhwMSUaypfirg1K/XNR3L
 00P5jFovK856EuzVN7/Uhak5nmesXYht8F4Guk+7kSJj6HT+QvcXjlCRT9aY9tgv8gzLdA36
 mK0cxrSLWQHmNWopbi1rd94cRva1fApEFI/
IronPort-HdrOrdr: A9a23:t3+rPay36iAGMLjLLTIyKrPwAL1zdoMgy1knxilNoHtuA6ilfq
 +V8sjzuSWYtN9VYgBCpTniAtjkfZqjz/9ICOAqVN/INjUO+lHYTr2KhrGM/9SPIUHDH5ZmtZ
 tIQuxZFMD6C0R8gILR5Qm1FMtl/fy8mZrY4ts3CxxWPHhXg2YK1XYeNjqm
X-Talos-CUID: =?us-ascii?q?9a23=3Airhtkmnwrhk0hz7lUFhMlgs3frfXOVOB7i/2JEL?=
 =?us-ascii?q?jMmxgTqCIQF6w2KFZseM7zg=3D=3D?=
X-Talos-MUID: 9a23:bFk2Mwo7ZgDNi7WgD6kezxtbPYRz+oKfMWoUqrQhgfejBQ1RMg7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="889638688"
Received: from alln-l-core-09.cisco.com ([173.36.16.146])
  by alln-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:04:11 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-09.cisco.com (Postfix) with ESMTPS id 2230B18000466
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:04:11 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 2DC14CC1295; Thu,  5 Nov 2026 11:34:09 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/2] containerd: Fix CVE-2026-95838
Date: Thu,  5 Nov 2026 11:33:54 +0530
Message-Id: <20261105060354.1290580-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105060354.1290580-1-deeratho@cisco.com>
References: <20261105060354.1290580-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-09.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:04:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10151
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 fix for
CVE-2026-95838. It prevents repeated directory walks when
containerd extracts layers with repeated opaque whiteouts. The
upstream fix is referenced in [1], and the Debian tracker entry that
records the fix commit is referenced in [2].

[1] https://github.com/containerd/containerd/commit/45166eb828c9f8605db44299836a87b78bda701b
[2] https://security-tracker.debian.org/tracker/CVE-2026-95838

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-95838.patch           | 231 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-95838.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-95838.patch b/recipes-containers/containerd/containerd/CVE-2026-95838.patch
new file mode 100644
index 00000000..d46f803f
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-95838.patch
@@ -0,0 +1,231 @@
+From 2a2aed4580fb148baa2a7944d0e491a0383b0906 Mon Sep 17 00:00:00 2001
+From: Samuel Karp <samuelkarp@google.com>
+Date: Tue, 25 Aug 2026 05:50:31 +0000
+Subject: [PATCH] archive: skip redundant opaque whiteout walks
+
+When unpacking a layer changeset in applyNaive, encountering an opaque
+whiteout (.wh..wh..opq) triggers a directory walk to remove files
+belonging to lower layers. Since files unpacked earlier in the current
+layer are recorded in unpackedPaths and preserved, interleaved files and
+opaque whiteouts in the same directory cause repeated walks over the
+same growing directory, leading to superlinear execution time.
+
+Once a directory has been purged of lower-layer files by an opaque
+whiteout, all existing and subsequent entries in that directory are
+guaranteed to be in unpackedPaths. Tracking directories that have
+already processed an opaque whiteout allows subsequent opaque whiteouts
+for the same directory to return early, restoring linear unpack time.
+
+Benchmark results (n=1,000):
+
+| Metric | Pre-change | Post-change | Delta |
+| :--- | :--- | :--- | :--- |
+| Execution Time | 2,578.8 ms/op | 135.3 ms/op | ~19.1x faster (94.8% reduction) |
+| Allocated Memory | 200.5 MB/op | 2.3 MB/op | ~86.9x less memory (98.8% reduction) |
+| Allocs / op | 2,068,820 allocs/op | 48,060 allocs/op | ~43.0x fewer allocs (97.7% reduction) |
+
+CVE: CVE-2026-95838
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/45166eb828c9f8605db44299836a87b78bda701b]
+
+Assisted-by: Antigravity
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit e6ca378dcfa610d06589a3ac96aa992de866e4f0)
+Signed-off-by: Samuel Karp <samuelkarp@google.com>
+(cherry picked from commit 45166eb828c9f8605db44299836a87b78bda701b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/archive/tar.go      |  15 ++++-
+ pkg/archive/tar_test.go | 136 ++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 150 insertions(+), 1 deletion(-)
+
+diff --git a/pkg/archive/tar.go b/pkg/archive/tar.go
+index 286a46c05..5c11f1d7f 100644
+--- a/pkg/archive/tar.go
++++ b/pkg/archive/tar.go
+@@ -169,6 +169,9 @@ func applyNaive(ctx context.Context, root string, r io.Reader, options ApplyOpti
+ 		// Used for handling opaque directory markers which
+ 		// may occur out of order
+ 		unpackedPaths = make(map[string]struct{})
++		// Used for tracking directories that have already processed an
++		// opaque directory marker to avoid redundant directory walks
++		opaqueDirs = make(map[string]struct{})
+ 
+ 		convertWhiteout = options.ConvertWhiteout
+ 	)
+@@ -179,6 +182,11 @@ func applyNaive(ctx context.Context, root string, r io.Reader, options ApplyOpti
+ 			base := filepath.Base(path)
+ 			dir := filepath.Dir(path)
+ 			if base == whiteoutOpaqueDir {
++				if _, ok := opaqueDirs[dir]; ok {
++					return false, nil
++				}
++				opaqueDirs[dir] = struct{}{}
++
+ 				_, err := os.Lstat(dir)
+ 				if err != nil {
+ 					return false, err
+@@ -195,7 +203,12 @@ func applyNaive(ctx context.Context, root string, r io.Reader, options ApplyOpti
+ 					}
+ 					if _, exists := unpackedPaths[path]; !exists {
+ 						err := os.RemoveAll(path)
+-						return err
++						if err != nil {
++							return err
++						}
++						if info.IsDir() {
++							return filepath.SkipDir
++						}
+ 					}
+ 					return nil
+ 				})
+diff --git a/pkg/archive/tar_test.go b/pkg/archive/tar_test.go
+index 62f03146d..1289af2b8 100644
+--- a/pkg/archive/tar_test.go
++++ b/pkg/archive/tar_test.go
+@@ -715,6 +715,38 @@ func TestBreakouts(t *testing.T) {
+ 			// resolution ends up just removing etc
+ 			validator: fileNotExists("etc/passwd"),
+ 		},
++		{
++			name: "WhiteoutOpaque",
++			apply: fstest.Apply(
++				fstest.CreateDir("/etc/", 0755),
++				fstest.CreateFile("/etc/passwd", []byte("all users"), 0644),
++				fstest.CreateFile("/etc/shadow", []byte("root:secret"), 0600),
++			),
++			w: tartest.TarAll(
++				tc.File("etc/.wh..wh..opq", []byte{}, 0600),
++				tc.File("etc/group", []byte("all groups"), 0644),
++			),
++			validator: all(
++				fileNotExists("etc/passwd"),
++				fileNotExists("etc/shadow"),
++				fileValue("etc/group", []byte("all groups")),
++			),
++		},
++		{
++			name: "WhiteoutOpaqueOutOfOrder",
++			apply: fstest.Apply(
++				fstest.CreateDir("/etc/", 0755),
++				fstest.CreateFile("/etc/passwd", []byte("all users"), 0644),
++			),
++			w: tartest.TarAll(
++				tc.File("etc/group", []byte("all groups"), 0644),
++				tc.File("etc/.wh..wh..opq", []byte{}, 0600),
++			),
++			validator: all(
++				fileNotExists("etc/passwd"),
++				fileValue("etc/group", []byte("all groups")),
++			),
++		},
+ 		{
+ 			name: "SymlinkOverridePath",
+ 			w: tartest.TarAll(
+@@ -1464,3 +1496,107 @@ func requireTar(t *testing.T) {
+ 		t.Skipf("%s not found, skipping", tarCmd)
+ 	}
+ }
++
++func TestRepeatedOpaqueWhiteout(t *testing.T) {
++	ctx := t.Context()
++	td := t.TempDir()
++
++	// Create base directory with lower-layer file
++	if err := os.WriteFile(filepath.Join(td, "oldfile"), []byte("lower"), 0644); err != nil {
++		t.Fatal(err)
++	}
++
++	// Create a tar with interleaved files and opaque whiteouts
++	var buf bytes.Buffer
++	tw := tar.NewWriter(&buf)
++
++	const n = 500
++	for i := 0; i < n; i++ {
++		name := fmt.Sprintf("f%04d", i)
++		if err := tw.WriteHeader(&tar.Header{
++			Name:     name,
++			Mode:     0644,
++			Size:     1,
++			Typeflag: tar.TypeReg,
++		}); err != nil {
++			t.Fatal(err)
++		}
++		if _, err := tw.Write([]byte("x")); err != nil {
++			t.Fatal(err)
++		}
++		if err := tw.WriteHeader(&tar.Header{
++			Name:     whiteoutOpaqueDir,
++			Mode:     0600,
++			Size:     0,
++			Typeflag: tar.TypeReg,
++		}); err != nil {
++			t.Fatal(err)
++		}
++	}
++	if err := tw.Close(); err != nil {
++		t.Fatal(err)
++	}
++
++	if _, err := Apply(ctx, td, &buf, WithNoSameOwner()); err != nil {
++		t.Fatalf("failed to apply tar: %v", err)
++	}
++
++	// Verify oldfile was removed by opaque whiteout
++	if _, err := os.Lstat(filepath.Join(td, "oldfile")); !os.IsNotExist(err) {
++		t.Errorf("expected oldfile to be removed, err: %v", err)
++	}
++
++	// Verify all unpacked files exist
++	for i := 0; i < n; i++ {
++		p := filepath.Join(td, fmt.Sprintf("f%04d", i))
++		if _, err := os.Lstat(p); err != nil {
++			t.Errorf("expected %s to exist, err: %v", p, err)
++		}
++	}
++}
++
++func BenchmarkRepeatedOpaqueWhiteout(b *testing.B) {
++	ctx := b.Context()
++
++	// Build tar payload with interleaved files and opaque whiteouts
++	var buf bytes.Buffer
++	tw := tar.NewWriter(&buf)
++
++	const n = 1000
++	for i := 0; i < n; i++ {
++		name := fmt.Sprintf("f%04d", i)
++		if err := tw.WriteHeader(&tar.Header{
++			Name:     name,
++			Mode:     0644,
++			Size:     1,
++			Typeflag: tar.TypeReg,
++		}); err != nil {
++			b.Fatal(err)
++		}
++		if _, err := tw.Write([]byte("x")); err != nil {
++			b.Fatal(err)
++		}
++		if err := tw.WriteHeader(&tar.Header{
++			Name:     whiteoutOpaqueDir,
++			Mode:     0600,
++			Size:     0,
++			Typeflag: tar.TypeReg,
++		}); err != nil {
++			b.Fatal(err)
++		}
++	}
++	if err := tw.Close(); err != nil {
++		b.Fatal(err)
++	}
++
++	payload := buf.Bytes()
++	b.ReportAllocs()
++	b.ResetTimer()
++
++	for i := 0; i < b.N; i++ {
++		td := b.TempDir()
++		if _, err := Apply(ctx, td, bytes.NewReader(payload), WithNoSameOwner()); err != nil {
++			b.Fatalf("failed to apply tar: %v", err)
++		}
++	}
++}
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index 176bdc7e..a388a2b7 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://CVE-2026-53493_p1.patch \
            file://CVE-2026-53493_p2.patch \
            file://CVE-2026-95837.patch \
+           file://CVE-2026-95838.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6

