Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B7D6C43458
	for <webhook@archiver.kernel.org>; Fri, 10 Jul 2026 12:27:19 +0000 (UTC)
Received: from rcdn-iport-6.cisco.com (rcdn-iport-6.cisco.com [173.37.86.77])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11453.1783686432180084416
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 10 Jul 2026 05:27:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=I7kppRh2;
 spf=pass (domain: cisco.com, ip: 173.37.86.77, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10650; q=dns/txt;
  s=iport01; t=1783686432; x=1784896032;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bXfkD3ueSdPg5QLKxxYpdTm3PziOYgkJqp41ay+SSGc=;
  b=I7kppRh2qQnOZq2I7+O9jSinqpxiMxasQDLg21hU7kZvhlZ7QbBcSVVh
   CaCh5YsFqG70SA5Zz2A4mbUAAFvKvGJ9jElsa+HNboZNcVbq6tZdhSjPT
   gVAYcaPELv7e3EvSgcAdD+gg4OaY9JueGcqQB7JZm2n1jPJ1iOftXh+aR
   4ZFyISwphyK5tPlLtehbVxQfNQAm6PNNTwzHRNGBir4IaN+oB2HnYG3g1
   PgRgqRS9CqbODCIWndmMiQGCYsL/Ie06azbattM0LRUtSeSc6m8391EH+
   CLh2CdIJ202U1bplJ55e8ZbOYmd56kuFYTebdI+8uyyZJMNftrgkiaoQ9
   A==;
X-CSE-ConnectionGUID: IwSkq0cIRV+tgOZfXsc0mw==
X-CSE-MsgGUID: eJJHG1XMT9Slk1eDVQMOMQ==
X-IPAS-Result: =?us-ascii?q?A0AIAAAi5FBq/4v/Ja1aGwEBAQEBAQEBBQEBARIBAQEDA?=
 =?us-ascii?q?wEBAYF8BgEBAQsBglZ0X0JJA4xvhzeCIQOBE4pRkjcUgWoPAQEBD0QNBAEBg?=
 =?us-ascii?q?hKCLUYCjU0CJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBBQEBAQIBBwWBDhOGT?=
 =?us-ascii?q?w2GWgECAQMnCwFWHAMBAi8gCyMIEQgJgnkBgjoDNgMRBro9gXkzgQGCZoIX2?=
 =?us-ascii?q?EkNglgBCxQBgTgBhT6CfIUjWxgBhHwnGxuBcoEVgnN2gQWBGkICgSOHAgSCI?=
 =?us-ascii?q?oEMgVqQEEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBDBsHBYEdgVmBA?=
 =?us-ascii?q?oR5Ix8DOX+BMHVKeS1zEh4KgVKCFlQDCxgNSBEsNxQbBD5uB40+Fw+Be0MBM?=
 =?us-ascii?q?EoHDAEqAS8fQwcDaQQkHKM5gh6gIXEKKIN1jCGPPoV8GjOEBIFXkkCSUQuYf?=
 =?us-ascii?q?Ys3glOECYRvjHBohGmBaDxGgRNwFYMiCUoZD44qDguDYIRQQ8kvPDUCCQMvA?=
 =?us-ascii?q?QEHAgcOAwuBaJACLYFPAQE?=
IronPort-Data: A9a23:0N2ih6Kmby0qG2vAFE+RgpQlxSXFcZb7ZxGr2PjKsXjdYENS1jUGz
 WdLWGqFbqrfM2Cjftt3YNiwpBxVvZHVmoRnSQcd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGYkajt8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1PE3o1JNUT29xJQn1B0
 s4WGCsGNhWc0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBV7AtQIvIROPB4towMDUY358VW62BI
 ZBENHw2N0Wojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjeCyb4CFIYTULSlTtku6h
 ELpplTcPkAhMN/GxBa7y1eLo9aayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rHnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:VSk5Pq4Zs034DThSDQPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: 9a23:p1zdWW6NiNdz1E+Vqdss1VEvGdl9eVzn8jTMLGiKB1ZyQ+WQVgrF
X-Talos-MUID: 9a23:UR5m9gnADj7tqicbbV+YdnpvFuVIzP2eLXxcqpEF4sSoCxVVHBKk2WE=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,154,1779148800"; 
   d="scan'208";a="507728306"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by rcdn-iport-6.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 10 Jul 2026 12:27:11 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id BA1FC1800036A
	for <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:10 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id DEF3ACC037D; Fri, 10 Jul 2026 17:57:08 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 2/3] containerd: fix CVE-2026-47262
Date: Fri, 10 Jul 2026 17:56:51 +0530
Message-Id: <20260710122652.3004381-2-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260710122652.3004381-1-deeratho@cisco.com>
References: <20260710122652.3004381-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 10 Jul 2026 12:27:19 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9950

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream release/2.2 backport for
CVE-2026-47262. The upstream fix commit is referenced in [1],
and the public CVE advisory is referenced in [2].

[1] https://github.com/containerd/containerd/commit/30708e8d1142287e9c6bb839f1b3f84c71ca4485
[2] https://github.com/containerd/containerd/security/advisories/GHSA-jpcc-p29g-p8mq

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../containerd/CVE-2026-47262.patch           | 276 ++++++++++++++++++
 .../containerd/containerd_git.bb              |   1 +
 2 files changed, 277 insertions(+)
 create mode 100644 recipes-containers/containerd/containerd/CVE-2026-47262.patch

diff --git a/recipes-containers/containerd/containerd/CVE-2026-47262.patch b/recipes-containers/containerd/containerd/CVE-2026-47262.patch
new file mode 100644
index 00000000..47f8a594
--- /dev/null
+++ b/recipes-containers/containerd/containerd/CVE-2026-47262.patch
@@ -0,0 +1,276 @@
+From 35162bac80f7801b1f99e0b86d0fa3f198470999 Mon Sep 17 00:00:00 2001
+From: Chris Henzie <chrishenzie@gmail.com>
+Date: Fri, 15 May 2026 22:19:37 +0000
+Subject: [PATCH 2/3] Bound user-database file reads in openUserFile
+
+openUserFile now stats the opened file, refuses anything that is not a
+regular file, and wraps the returned fs.File so reads are capped at
+maxUserFileBytes (10 MiB). All callers of openUserFile read either
+etc/passwd or etc/group; both are regular files on real systems, well
+under the cap.
+
+The cap and the regular-file check together bound parser memory use
+when reading user-database files of unexpected shape or size.
+
+Adds tests for the cap and for the non-regular file rejection. The cap
+test covers three boundary points: a small pad (trailing entry parsed),
+a pad placing the entry's last byte exactly on the cap (still parsed),
+and a pad past the cap (read returns an "exceeds" error).
+
+CVE: CVE-2026-47262
+Upstream-Status: Backport [https://github.com/containerd/containerd/commit/30708e8d1142287e9c6bb839f1b3f84c71ca4485]
+
+Assisted-by: Antigravity
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit 7b05ec421d0a07b33964c74145b6bf5dff58f476)
+Signed-off-by: Chris Henzie <chrishenzie@gmail.com>
+(cherry picked from commit 30708e8d1142287e9c6bb839f1b3f84c71ca4485)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ pkg/oci/spec_opts.go                  |  56 +++++++++-
+ pkg/oci/spec_opts_user_bounds_test.go | 146 ++++++++++++++++++++++++++
+ 2 files changed, 200 insertions(+), 2 deletions(-)
+ create mode 100644 pkg/oci/spec_opts_user_bounds_test.go
+
+diff --git a/pkg/oci/spec_opts.go b/pkg/oci/spec_opts.go
+index 5cc7187d7..7e695fda1 100644
+--- a/pkg/oci/spec_opts.go
++++ b/pkg/oci/spec_opts.go
+@@ -24,6 +24,7 @@ import (
+ 	"encoding/json"
+ 	"errors"
+ 	"fmt"
++	"io"
+ 	"io/fs"
+ 	"math"
+ 	"os"
+@@ -1821,10 +1822,13 @@ type readLinker interface {
+ // openUserFile attempts to open a file within the root fs.
+ // It handles cases where the file is an absolute symlink (e.g., NixOS /etc/passwd -> /nix/store/...),
+ // which triggers "path escapes from parent" errors in Go 1.24+ due to stricter os.DirFS validation.
++//
++// The returned file rejects non-regular sources and returns an error if more
++// than maxUserFileBytes are read from it.
+ func openUserFile(root fs.FS, name string) (fs.File, error) {
+ 	f, err := root.Open(name)
+ 	if err == nil {
+-		return f, nil
++		return wrapUserFile(f, name)
+ 	}
+ 
+ 	// Check if the FS implements our local ReadLink interface.
+@@ -1841,7 +1845,11 @@ func openUserFile(root fs.FS, name string) (fs.File, error) {
+ 				if rerr == nil {
+ 					// filepath.Rel might return OS-specific separators (backslashes on Windows).
+ 					// fs.Open strictly expects forward slashes, so we convert it.
+-					return root.Open(filepath.ToSlash(rel))
++					f, oerr := root.Open(filepath.ToSlash(rel))
++					if oerr != nil {
++						return nil, oerr
++					}
++					return wrapUserFile(f, name)
+ 				}
+ 			}
+ 		}
+@@ -1850,3 +1858,47 @@ func openUserFile(root fs.FS, name string) (fs.File, error) {
+ 	// Return the original error if we couldn't resolve it
+ 	return nil, err
+ }
++
++// maxUserFileBytes caps how much data is read from any user-database file
++// opened via openUserFile. Real systems keep these files well under 1 MiB;
++// 10 MiB is generous headroom while keeping peak memory during
++// user.ParsePasswd/ParseGroup bounded to single-digit MiB.
++const maxUserFileBytes = 10 << 20
++
++// wrapUserFile rejects non-regular sources and returns an fs.File that
++// errors out if more than maxUserFileBytes are read from it.
++func wrapUserFile(f fs.File, name string) (fs.File, error) {
++	info, err := f.Stat()
++	if err != nil {
++		f.Close()
++		return nil, fmt.Errorf("stat %s: %w", name, err)
++	}
++	if !info.Mode().IsRegular() {
++		f.Close()
++		return nil, fmt.Errorf("%s is not a regular file", name)
++	}
++	return &limitedFile{
++		File: f,
++		// Allow one byte past the cap so an overflow surfaces as an
++		// error rather than a silent EOF that the parser would treat as
++		// a clean end-of-file (and miss any entries past the cap).
++		r:    &io.LimitedReader{R: f, N: maxUserFileBytes + 1},
++		name: name,
++	}, nil
++}
++
++// limitedFile is an fs.File whose Read returns an error once more than
++// maxUserFileBytes have been read.
++type limitedFile struct {
++	fs.File
++	r    *io.LimitedReader
++	name string
++}
++
++func (l *limitedFile) Read(p []byte) (int, error) {
++	n, err := l.r.Read(p)
++	if l.r.N == 0 {
++		return n, fmt.Errorf("%q exceeds %d bytes", l.name, maxUserFileBytes)
++	}
++	return n, err
++}
+diff --git a/pkg/oci/spec_opts_user_bounds_test.go b/pkg/oci/spec_opts_user_bounds_test.go
+new file mode 100644
+index 000000000..54384f79a
+--- /dev/null
++++ b/pkg/oci/spec_opts_user_bounds_test.go
+@@ -0,0 +1,146 @@
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
++package oci
++
++import (
++	"bytes"
++	"errors"
++	"io/fs"
++	"testing"
++	"testing/fstest"
++	"time"
++
++	"github.com/moby/sys/user"
++	"github.com/stretchr/testify/assert"
++)
++
++// TestOpenUserFileCapsReads asserts the boundary behavior of the read cap:
++// well below, ending exactly at, and past maxUserFileBytes.
++func TestOpenUserFileCapsReads(t *testing.T) {
++	t.Parallel()
++
++	beyond := []byte("\nbeyond:x:42:\n")
++
++	for _, tc := range []struct {
++		name     string
++		padBytes int
++		wantGids []uint32
++		wantErr  bool
++	}{
++		{
++			name:     "pad below cap, beyond is parsed",
++			padBytes: 100,
++			wantGids: []uint32{42},
++		},
++		{
++			name:     "beyond ends exactly at cap, is parsed",
++			padBytes: maxUserFileBytes - len(beyond),
++			wantGids: []uint32{42},
++		},
++		{
++			name:     "pad past cap, read errors out",
++			padBytes: maxUserFileBytes,
++			wantErr:  true,
++		},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			t.Parallel()
++
++			data := append(bytes.Repeat([]byte{0}, tc.padBytes), beyond...)
++			fsys := fstest.MapFS{
++				"etc/group": &fstest.MapFile{Data: data, Mode: 0o644},
++			}
++
++			gids, err := getSupplementalGroupsFromFS(fsys, func(g user.Group) bool {
++				return g.Name == "beyond"
++			})
++			if tc.wantErr {
++				assert.ErrorContains(t, err, "exceeds")
++				return
++			}
++			assert.NoError(t, err)
++			assert.Equal(t, tc.wantGids, gids)
++		})
++	}
++}
++
++// TestOpenUserFileRejectsNonRegularFiles verifies that non-regular files
++// are refused before any byte is read from them.
++func TestOpenUserFileRejectsNonRegularFiles(t *testing.T) {
++	t.Parallel()
++
++	for _, tc := range []struct {
++		name string
++		mode fs.FileMode
++	}{
++		{name: "char device", mode: fs.ModeDevice | fs.ModeCharDevice | 0o666},
++		{name: "socket", mode: fs.ModeSocket | 0o666},
++	} {
++		t.Run(tc.name, func(t *testing.T) {
++			t.Parallel()
++
++			f := &nonRegularFile{mode: tc.mode}
++			rootFS := singleFileFS{name: "etc/group", file: f}
++
++			_, err := getSupplementalGroupsFromFS(rootFS, nil)
++			assert.Error(t, err)
++			assert.False(t, f.readCalled, "Read should not be called on non-regular file")
++		})
++	}
++}
++
++// nonRegularFile implements fs.File and reports a configurable non-regular
++// mode via Stat.
++type nonRegularFile struct {
++	mode       fs.FileMode
++	readCalled bool
++}
++
++func (f *nonRegularFile) Read([]byte) (int, error) {
++	f.readCalled = true
++	return 0, errors.New("read should not be called on non-regular file")
++}
++
++func (f *nonRegularFile) Stat() (fs.FileInfo, error) {
++	return nonRegularFileInfo{mode: f.mode}, nil
++}
++func (f *nonRegularFile) Close() error { return nil }
++
++type nonRegularFileInfo struct {
++	mode fs.FileMode
++}
++
++func (nonRegularFileInfo) Name() string        { return "group" }
++func (nonRegularFileInfo) Size() int64         { return 0 }
++func (i nonRegularFileInfo) Mode() fs.FileMode { return i.mode }
++func (nonRegularFileInfo) ModTime() time.Time  { return time.Time{} }
++func (nonRegularFileInfo) IsDir() bool         { return false }
++func (nonRegularFileInfo) Sys() any            { return nil }
++
++// singleFileFS routes a single name to a single fs.File and returns
++// fs.ErrNotExist for everything else.
++type singleFileFS struct {
++	name string
++	file fs.File
++}
++
++func (s singleFileFS) Open(name string) (fs.File, error) {
++	if name == s.name {
++		return s.file, nil
++	}
++	return nil, fs.ErrNotExist
++}
+-- 
+2.35.6
diff --git a/recipes-containers/containerd/containerd_git.bb b/recipes-containers/containerd/containerd_git.bb
index ad41f248..43891c2f 100644
--- a/recipes-containers/containerd/containerd_git.bb
+++ b/recipes-containers/containerd/containerd_git.bb
@@ -11,6 +11,7 @@ SRC_URI = "git://github.com/containerd/containerd;branch=release/2.2;protocol=ht
            file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
            file://cni-containerd-net.conflist \
            file://CVE-2026-46680.patch \
+           file://CVE-2026-47262.patch \
           "
 
 # Apache-2.0 for containerd
-- 
2.35.6


