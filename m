Received: from alln-iport-7.cisco.com (alln-iport-7.cisco.com [173.37.142.94])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28131.1793858448383547932
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 04 Nov 2026 22:00:48 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=O4zlVBOt;
 spf=pass (domain: cisco.com, ip: 173.37.142.94, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=134922; q=dns/txt;
  s=iport01; t=1793858448; x=1795068048;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=xT9wc2FoWilI+SrqA1a7xQrj9NWp4WmwNT3isXb5hYo=;
  b=O4zlVBOtueZMWpNU2v4rhYygBvi+JCsVZArF+g+e0ED1M1NTFKVZ4ueH
   GPQGz8PCaFeuZVI2e6Ysb3GxC6gWGMXZL0XBkvfN6W4bQehemPejPgt/R
   cfaCZYzwXI8AUKyRSZWrqKlv2IE4jVJhpvqWlSzcTOG6XMMNBHUgxE7dB
   arwXdA+Z9sh3LZGh7KNGsJMMcLv2QBIHA71WKEv5/MAb0T8ihfzUSe7yu
   1fTpjcArbOYS+r2Je7Zbt6xr8kAnsYKqijF5s27/DGGJXtUW9V4Lc0nhU
   txUSkv/YNWSZkL1imyj6OgacbkdEgi2PgWHcDLtQCAQD9JNK0gnXjtyRn
   A==;
X-CSE-ConnectionGUID: PrcIGCPRREGHBY0vIzEjJg==
X-CSE-MsgGUID: EXYlTRJiQQWf7F8efMhuFg==
X-IPAS-Result: =?us-ascii?q?A0BQAgDvGuxq/4wQJK1aHgEBCxIMggULgld1YRkpSYRXj?=
 =?us-ascii?q?1OCIQOBE5A5jFUUgWoPAQEBD0QJBAQBAYISgi1GAo4dAiY0CQ4BAgQDAgMBA?=
 =?us-ascii?q?QEBAQEBAQEBAQEKAQEFAQEBAgEHBYEOE4ZPDZASAQIBAxoBCAQLAVYcAwECA?=
 =?us-ascii?q?wImAgIrHQEFCBEICYJ5AYJ0AxEGvC96fzOBAYNtAT8BUNszAQsUAYEKLoVAg?=
 =?us-ascii?q?x8BhQNdGAGEfScbG4FygRWCc3aBBYFcAgKBIRQPg3aCSCIEgg0VgQyBWh5gB?=
 =?us-ascii?q?YIigxuGWAKBUoZxSIECHANZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPhcvWBsGB?=
 =?us-ascii?q?YEdgR6BEoEHXYErKF4hgQiBdgKCUYIAAgFJQQ4HRVMJJUMSRyQiCBIJARMaL?=
 =?us-ascii?q?AqBGjU8CSY/FQxkCxoFYQgCDQxyORAwHiQvBRwmQBsKGBgNSBEsNxUZBD0Bb?=
 =?us-ascii?q?geSL4JECiMOCwcBLAQMJAMGCAIHBwwBBwMfAQEEARIJDxkGAQEQJQwHAgEFD?=
 =?us-ascii?q?xQCCAcGEwsFBgEEGAwPAgIJAgQYDwIDkkMdBwEBATkKAo9Ygh6BOJ4egT4KK?=
 =?us-ascii?q?IN4jCSVOhozhASBV5JCklQLlhqCY4JZiF6CU5U1CSsZAhY3hGmBaDyBKBwCD?=
 =?us-ascii?q?AdwFTuCZwlKGQ+OKwMEBwuDYIJpgWdDyS48NQIBCDIBAQcCBwIMAwuBaIRhi?=
 =?us-ascii?q?x8scmABAQ?=
IronPort-Data: A9a23:4b0iLK0BEKP+ZbY78PbD5YNwkn2cJEfYwER7XKvMYLTBsI5bpzwGx
 2FNXTiDP6nfMDCgKNB2Pdy0p04Av8eAx9IwSFBo3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yEzmE4Ej9atANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXX5
 rsen+WFYAX7gmcsbjpOg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGNFs9HKIzwtxNLE5u3
 81ANhEfQxKhiLfjqF67YrEEasULJc3vOsYb/3pn1zycVa1gSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEyojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZgOi9aIKNJ4baLSlTtmuol
 2b6xUb4OyglOoOxmTeL13KxqOCayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rGnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:/MZ29qCU0waaMunlHemO55DYdb4zR+YMi2TDsHoBLiC9E/bo8/
 xG88506faZslsssTQb6LO90cq7MBbhHOBOgLX5VI3KNGKNhILrFvAB0WKI+VLd8kPFmtK1rZ
 0BT4FOTPvtEFN9kcH2pCO8E9om3Z271ZrAv5a585+oJjsaE52JKGxCe3+mLnE=
X-Talos-CUID: =?us-ascii?q?9a23=3AnXWrN2pPqT0MH2encScSCl3mUfg/eVzy50/qGWK?=
 =?us-ascii?q?XKUxYEKO0W3KS2qwxxg=3D=3D?=
X-Talos-MUID: 9a23:SumqDgusccE0G22Qbc2nqQFTMPtSwaWXMX8DzrtWtsehNTFeNGLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,196,1787011200"; 
   d="scan'208";a="888000528"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-7.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 05 Nov 2026 06:00:30 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 165321800040D
	for <meta-virtualization@lists.yoctoproject.org>; Thu,  5 Nov 2026 06:00:29 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id 13327CC1600; Thu,  5 Nov 2026 11:30:27 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: [meta-virtualization][wrynose][PATCH 3/5] docker-moby: Fix CVE-2026-17106
Date: Thu,  5 Nov 2026 11:30:04 +0530
Message-Id: <20261105060006.1286469-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261105060006.1286469-1-deeratho@cisco.com>
References: <20261105060006.1286469-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Thu, 05 Nov 2026 06:00:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10149
Content-Type: text/plain; charset="utf-8"

From: Deepak Rathore <deeratho@cisco.com>

Backport the go-archive extraction fix while keeping Moby's module
version at v0.2.0. The three prerequisites supply source needed by the
fix: [1] provides the vendored archive baseline and helper interfaces;
[2] adds root-confined path handling for archive entries and links;
[3] adds error unwrapping and platform time helpers used by the later
source changes. Commit [4] adds the CVE fix that rejects archive
extraction escaping its destination. Follow-up [6] restores valid
absolute in-root hardlinks and device-node permission handling regressed
by the v0.3.0 source changes. Dependency metadata is omitted.

[1] Prerequisite: https://github.com/moby/moby/commit/931d6127da01734df36ce7496655b4bfd612e61b
[2] Prerequisite: https://github.com/moby/moby/commit/5b3408829f3ceb487c74e74fa6ba89d87ed6a708
[3] Prerequisite: https://github.com/moby/moby/commit/07ad2750f6f6b905e2d07f6e5fb1e9111fe1c37f
[4] CVE fix: https://github.com/moby/moby/commit/3704c55f55081896f1c0fcd90d46dd3a9f620518
[5] Advisory: https://github.com/advisories/GHSA-hfg8-hc9c-6c3h
[6] Follow-up: https://github.com/moby/moby/commit/2a3ab8fcc0c5e4b9bfce4577e7baddc842032298

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 recipes-containers/docker/docker-moby_git.bb  |    5 +
 .../files/CVE-2026-17106-dependent_p1.patch   | 1121 ++++++++++++++
 .../files/CVE-2026-17106-dependent_p2.patch   | 1287 +++++++++++++++++
 .../files/CVE-2026-17106-dependent_p3.patch   |  121 ++
 .../files/CVE-2026-17106-regression.patch     |  423 ++++++
 .../docker/files/CVE-2026-17106.patch         |  306 ++++
 6 files changed, 3263 insertions(+)
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106-dependent_p1.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106-dependent_p2.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106-dependent_p3.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106-regression.patch
 create mode 100644 recipes-containers/docker/files/CVE-2026-17106.patch

diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
index 831f7aa6..9c5e807c 100644
--- a/recipes-containers/docker/docker-moby_git.bb
+++ b/recipes-containers/docker/docker-moby_git.bb
@@ -60,6 +60,11 @@ SRC_URI = "\
         file://CVE-2026-34040_p1.patch;patchdir=src/import \
         file://CVE-2026-34040_p2.patch;patchdir=src/import \
         file://CVE-2026-33997.patch;patchdir=src/import \
+        file://CVE-2026-17106-dependent_p1.patch;patchdir=src/import \
+        file://CVE-2026-17106-dependent_p2.patch;patchdir=src/import \
+        file://CVE-2026-17106-dependent_p3.patch;patchdir=src/import \
+        file://CVE-2026-17106.patch;patchdir=src/import \
+        file://CVE-2026-17106-regression.patch;patchdir=src/import \
 	"
 
 DOCKER_COMMIT = "${SRCREV_moby}"
diff --git a/recipes-containers/docker/files/CVE-2026-17106-dependent_p1.patch b/recipes-containers/docker/files/CVE-2026-17106-dependent_p1.patch
new file mode 100644
index 00000000..5b9f50b9
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106-dependent_p1.patch
@@ -0,0 +1,1121 @@
+From 931d6127da01734df36ce7496655b4bfd612e61b Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Fri, 17 Jul 2026 11:49:41 +0200
+Subject: [PATCH] vendor: github.com/moby/go-archive v0.2.1
+
+full diff: https://github.com/moby/go-archive/compare/v0.2.0...v0.2.1
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/931d6127da01734df36ce7496655b4bfd612e61b]
+
+Backport Changes:
+- Keep go.mod, go.sum, and vendor/modules.txt at go-archive v0.2.0.
+- Carry archive.go, diff.go, and copy.go for the shared archive, layer
+  unpack, and copy paths changed by the later hardening patches.
+- Carry archive_linux.go, archive_unix.go, archive_windows.go, and
+  dev_unix.go for platform-specific helpers and signatures used by those
+  shared changes, including whiteout, file metadata, and device handling.
+- Omit .golangci.yml, changes.go, changes_linux.go, changes_other.go,
+  chrootarchive/archive.go, chrootarchive/archive_unix_nolinux.go,
+  chrootarchive/diff_unix.go, compression/compression.go,
+  tarheader/tarheader.go, tarheader/tarheader_unix.go, and
+  xattr_supported.go; these v0.2.1 package-wide changes are outside the
+  extraction paths used by the hardening and CVE patches.
+
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 931d6127da01734df36ce7496655b4bfd612e61b)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ vendor/github.com/moby/go-archive/archive.go  | 214 ++++++++++--------
+ .../moby/go-archive/archive_linux.go          |  98 ++++----
+ .../moby/go-archive/archive_unix.go           |  35 ++-
+ .../moby/go-archive/archive_windows.go        |  10 +-
+ vendor/github.com/moby/go-archive/copy.go     |  27 +--
+ vendor/github.com/moby/go-archive/dev_unix.go |   2 +-
+ vendor/github.com/moby/go-archive/diff.go     |  27 +--
+ 7 files changed, 232 insertions(+), 181 deletions(-)
+
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index 8dce2e6e2a..e59cfbb89d 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -46,9 +46,18 @@
+ 
+ 	// TarOptions wraps the tar options.
+ 	TarOptions struct {
+-		IncludeFiles     []string
+-		ExcludePatterns  []string
+-		Compression      compression.Compression
++		// IncludeFiles lists archive-relative paths to include.
++		// Paths use POSIX ('/') separators.
++		IncludeFiles []string
++
++		// ExcludePatterns lists archive-relative exclude patterns.
++		// Patterns use POSIX ('/') separators, matching patternmatcher semantics.
++		ExcludePatterns []string
++		Compression     compression.Compression
++		// NoLchown disables applying ownership from the archive to extracted files
++		// and directories. Despite its historical name, it applies to all ownership
++		// changes, leaving extracted filesystem objects owned by the user performing
++		// the extraction.
+ 		NoLchown         bool
+ 		IDMap            user.IdentityMapping
+ 		ChownOpts        *ChownOpts
+@@ -86,10 +95,14 @@ func NewDefaultArchiver() *Archiver {
+ 	return &Archiver{Untar: Untar}
+ }
+ 
+-// breakoutError is used to differentiate errors related to breaking out
+-// When testing archive breakout in the unit tests, this error is expected
+-// in order for the test to pass.
+-type breakoutError error
++// breakoutErr marks errors caused by archive breakout attempts.
++// Unit tests use it to distinguish expected breakout failures from other
++// errors.
++type breakoutErr struct{ error }
++
++func breakoutError(err error) error {
++	return &breakoutErr{error: err}
++}
+ 
+ const (
+ 	AUFSWhiteoutFormat    WhiteoutFormat = 0 // AUFSWhiteoutFormat is the default format for whiteouts
+@@ -98,17 +111,17 @@ func NewDefaultArchiver() *Archiver {
+ 
+ // IsArchivePath checks if the (possibly compressed) file at the given path
+ // starts with a tar file header.
+-func IsArchivePath(path string) bool {
+-	file, err := os.Open(path)
++func IsArchivePath(filePath string) bool {
++	file, err := os.Open(filePath)
+ 	if err != nil {
+ 		return false
+ 	}
+-	defer file.Close()
++	defer func() { _ = file.Close() }()
+ 	rdr, err := compression.DecompressStream(file)
+ 	if err != nil {
+ 		return false
+ 	}
+-	defer rdr.Close()
++	defer func() { _ = rdr.Close() }()
+ 	r := tar.NewReader(rdr)
+ 	_, err = r.Next()
+ 	return err == nil
+@@ -129,8 +142,10 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 	go func() {
+ 		tarReader := tar.NewReader(inputTarStream)
+ 		tarWriter := tar.NewWriter(pipeWriter)
+-		defer inputTarStream.Close()
+-		defer tarWriter.Close()
++		defer func() {
++			_ = tarWriter.Close()
++			_ = inputTarStream.Close()
++		}()
+ 
+ 		modify := func(name string, original *tar.Header, modifier TarModifierFunc, tarReader io.Reader) error {
+ 			header, data, err := modifier(name, original, tarReader)
+@@ -164,7 +179,7 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 				break
+ 			}
+ 			if err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -172,11 +187,11 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 			if !ok {
+ 				// No modifiers for this file, copy the header and data
+ 				if err := tarWriter.WriteHeader(originalHeader); err != nil {
+-					pipeWriter.CloseWithError(err)
++					_ = pipeWriter.CloseWithError(err)
+ 					return
+ 				}
+ 				if err := copyWithBuffer(tarWriter, tarReader); err != nil {
+-					pipeWriter.CloseWithError(err)
++					_ = pipeWriter.CloseWithError(err)
+ 					return
+ 				}
+ 				continue
+@@ -184,7 +199,7 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 			delete(mods, originalHeader.Name)
+ 
+ 			if err := modify(originalHeader.Name, originalHeader, modifier, tarReader); err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+@@ -192,12 +207,12 @@ func ReplaceFileTarWrapper(inputTarStream io.ReadCloser, mods map[string]TarModi
+ 		// Apply the modifiers that haven't matched any files in the archive
+ 		for name, modifier := range mods {
+ 			if err := modify(name, nil, modifier, nil); err != nil {
+-				pipeWriter.CloseWithError(err)
++				_ = pipeWriter.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+ 
+-		pipeWriter.Close()
++		_ = pipeWriter.Close()
+ 	}()
+ 	return pipeReader
+ }
+@@ -218,7 +233,7 @@ func FileInfoHeader(name string, fi os.FileInfo, link string) (*tar.Header, erro
+ 	hdr.ModTime = hdr.ModTime.Truncate(time.Second)
+ 	hdr.AccessTime = time.Time{}
+ 	hdr.ChangeTime = time.Time{}
+-	hdr.Mode = int64(chmodTarEntry(os.FileMode(hdr.Mode)))
++	hdr.Mode = chmodTarEntry(hdr.Mode)
+ 	hdr.Name = canonicalTarName(name, fi.IsDir())
+ 	return hdr, nil
+ }
+@@ -227,7 +242,7 @@ func FileInfoHeader(name string, fi os.FileInfo, link string) (*tar.Header, erro
+ 
+ // ReadSecurityXattrToTarHeader reads security.capability xattr from filesystem
+ // to a tar header
+-func ReadSecurityXattrToTarHeader(path string, hdr *tar.Header) error {
++func ReadSecurityXattrToTarHeader(filePath string, hdr *tar.Header) error {
+ 	const (
+ 		// Values based on linux/include/uapi/linux/capability.h
+ 		xattrCapsSz2    = 20
+@@ -235,7 +250,7 @@ func ReadSecurityXattrToTarHeader(path string, hdr *tar.Header) error {
+ 		vfsCapRevision2 = 2
+ 		vfsCapRevision3 = 3
+ 	)
+-	capability, _ := lgetxattr(path, "security.capability")
++	capability, _ := lgetxattr(filePath, "security.capability")
+ 	if capability != nil {
+ 		if capability[versionOffset] == vfsCapRevision3 {
+ 			// Convert VFS_CAP_REVISION_3 to VFS_CAP_REVISION_2 as root UID makes no
+@@ -292,9 +307,10 @@ func canonicalTarName(name string, isDir bool) string {
+ 	return name
+ }
+ 
+-// addTarFile adds to the tar archive a file from `path` as `name`
+-func (ta *tarAppender) addTarFile(path, name string) error {
+-	fi, err := os.Lstat(path)
++// addTarFile adds to the tar archive a file from `srcPath` as `name`
++func (ta *tarAppender) addTarFile(srcPath, archivePath string) error {
++	archivePath = filepath.ToSlash(archivePath)
++	fi, err := os.Lstat(srcPath)
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -302,17 +318,17 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	var link string
+ 	if fi.Mode()&os.ModeSymlink != 0 {
+ 		var err error
+-		link, err = os.Readlink(path)
++		link, err = os.Readlink(srcPath)
+ 		if err != nil {
+ 			return err
+ 		}
+ 	}
+ 
+-	hdr, err := FileInfoHeader(name, fi, link)
++	hdr, err := FileInfoHeader(archivePath, fi, link)
+ 	if err != nil {
+ 		return err
+ 	}
+-	if err := ReadSecurityXattrToTarHeader(path, hdr); err != nil {
++	if err := ReadSecurityXattrToTarHeader(srcPath, hdr); err != nil {
+ 		return err
+ 	}
+ 
+@@ -321,7 +337,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	if !fi.IsDir() && hasHardlinks(fi) {
+ 		inode, err := getInodeFromStat(fi.Sys())
+ 		if err != nil {
+-			return err
++			return fmt.Errorf("unexpected file info for %q: %w", srcPath, err)
+ 		}
+ 		// a link should have a name that it links too
+ 		// and that linked name should be first in the tar archive
+@@ -330,7 +346,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 			hdr.Linkname = oldpath
+ 			hdr.Size = 0 // This Must be here for the writer math to add up!
+ 		} else {
+-			ta.SeenFiles[inode] = name
++			ta.SeenFiles[inode] = hdr.Name
+ 		}
+ 	}
+ 
+@@ -359,7 +375,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	}
+ 
+ 	if ta.WhiteoutConverter != nil {
+-		wo, err := ta.WhiteoutConverter.ConvertWrite(hdr, path, fi)
++		wo, err := ta.WhiteoutConverter.ConvertWrite(hdr, srcPath, fi)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -370,12 +386,12 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 		// hdr may have been updated to be a whiteout with returning
+ 		// a whiteout header
+ 		if wo != nil {
++			if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
++				return fmt.Errorf("tar: cannot use whiteout for non-empty file %q", hdr.Name)
++			}
+ 			if err := ta.TarWriter.WriteHeader(hdr); err != nil {
+ 				return err
+ 			}
+-			if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
+-				return fmt.Errorf("tar: cannot use whiteout for non-empty file")
+-			}
+ 			hdr = wo
+ 		}
+ 	}
+@@ -387,13 +403,13 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	if hdr.Typeflag == tar.TypeReg && hdr.Size > 0 {
+ 		// We use sequential file access to avoid depleting the standby list on
+ 		// Windows. On Linux, this equates to a regular os.Open.
+-		file, err := sequential.Open(path)
++		file, err := sequential.Open(srcPath)
+ 		if err != nil {
+ 			return err
+ 		}
+ 
+ 		err = copyWithBuffer(ta.TarWriter, file)
+-		file.Close()
++		_ = file.Close()
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -402,7 +418,7 @@ func (ta *tarAppender) addTarFile(path, name string) error {
+ 	return nil
+ }
+ 
+-func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
++func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
+ 	var (
+ 		Lchown                     = true
+ 		inUserns, bestEffortXattrs bool
+@@ -426,8 +442,8 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 	case tar.TypeDir:
+ 		// Create directory unless it exists as a directory already.
+ 		// In that case we just want to merge the two
+-		if fi, err := os.Lstat(path); err != nil || !fi.IsDir() {
+-			if err := os.Mkdir(path, hdrInfo.Mode()); err != nil {
++		if fi, err := os.Lstat(dstPath); err != nil || !fi.IsDir() {
++			if err := os.Mkdir(dstPath, hdrInfo.Mode()); err != nil {
+ 				return err
+ 			}
+ 		}
+@@ -435,7 +451,7 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 	case tar.TypeReg:
+ 		// Source is regular file. We use sequential file access to avoid depleting
+ 		// the standby list on Windows. On Linux, this equates to a regular os.OpenFile.
+-		file, err := sequential.OpenFile(path, os.O_CREATE|os.O_WRONLY, hdrInfo.Mode())
++		file, err := sequential.OpenFile(dstPath, os.O_CREATE|os.O_WRONLY, hdrInfo.Mode())
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -447,20 +463,20 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 
+ 	case tar.TypeBlock, tar.TypeChar:
+ 		if inUserns { // cannot create devices in a userns
+-			log.G(context.TODO()).WithFields(log.Fields{"path": path, "type": hdr.Typeflag}).Debug("skipping device nodes in a userns")
++			log.G(context.TODO()).WithFields(log.Fields{"path": dstPath, "type": hdr.Typeflag}).Debug("skipping device nodes in a userns")
+ 			return nil
+ 		}
+ 		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, path); err != nil {
++		if err := handleTarTypeBlockCharFifo(hdr, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeFifo:
+ 		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, path); err != nil {
++		if err := handleTarTypeBlockCharFifo(hdr, dstPath); err != nil {
+ 			if inUserns && errors.Is(err, syscall.EPERM) {
+ 				// In most cases, cannot create a fifo if running in user namespace
+-				log.G(context.TODO()).WithFields(log.Fields{"error": err, "path": path, "type": hdr.Typeflag}).Debug("creating fifo node in a userns")
++				log.G(context.TODO()).WithFields(log.Fields{"error": err, "path": dstPath, "type": hdr.Typeflag}).Debug("creating fifo node in a userns")
+ 				return nil
+ 			}
+ 			return err
+@@ -468,26 +484,26 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 
+ 	case tar.TypeLink:
+ 		// #nosec G305 -- The target path is checked for path traversal.
+-		targetPath := filepath.Join(extractDir, hdr.Linkname)
++		linkTarget := filepath.Join(extractDir, hdr.Linkname)
+ 		// check for hardlink breakout
+-		if !strings.HasPrefix(targetPath, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid hardlink %q -> %q", targetPath, hdr.Linkname))
++		if !strings.HasPrefix(linkTarget, extractDir) {
++			return breakoutError(fmt.Errorf("invalid hardlink %q -> %q", linkTarget, hdr.Linkname))
+ 		}
+-		if err := os.Link(targetPath, path); err != nil {
++		if err := os.Link(linkTarget, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeSymlink:
+ 		// 	path 				-> hdr.Linkname = targetPath
+ 		// e.g. /extractDir/path/to/symlink 	-> ../2/file	= /extractDir/path/2/file
+-		targetPath := filepath.Join(filepath.Dir(path), hdr.Linkname) // #nosec G305 -- The target path is checked for path traversal.
++		targetPath := filepath.Join(filepath.Dir(dstPath), hdr.Linkname) // #nosec G305 -- The target path is checked for path traversal.
+ 
+ 		// the reason we don't need to check symlinks in the path (with FollowSymlinkInScope) is because
+ 		// that symlink would first have to be created, which would be caught earlier, at this very check:
+ 		if !strings.HasPrefix(targetPath, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid symlink %q -> %q", path, hdr.Linkname))
++			return breakoutError(fmt.Errorf("invalid symlink %q -> %q", dstPath, hdr.Linkname))
+ 		}
+-		if err := os.Symlink(hdr.Linkname, path); err != nil {
++		if err := os.Symlink(hdr.Linkname, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+@@ -504,12 +520,12 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 		if chownOpts == nil {
+ 			chownOpts = &ChownOpts{UID: hdr.Uid, GID: hdr.Gid}
+ 		}
+-		if err := os.Lchown(path, chownOpts.UID, chownOpts.GID); err != nil {
++		if err := os.Lchown(dstPath, chownOpts.UID, chownOpts.GID); err != nil {
+ 			var msg string
+ 			if inUserns && errors.Is(err, syscall.EINVAL) {
+ 				msg = " (try increasing the number of subordinate IDs in /etc/subuid and /etc/subgid)"
+ 			}
+-			return fmt.Errorf("failed to Lchown %q for UID %d, GID %d%s: %w", path, hdr.Uid, hdr.Gid, msg, err)
++			return fmt.Errorf("failed to Lchown %q for UID %d, GID %d%s: %w", dstPath, hdr.Uid, hdr.Gid, msg, err)
+ 		}
+ 	}
+ 
+@@ -519,7 +535,7 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 		if !ok {
+ 			continue
+ 		}
+-		if err := lsetxattr(path, xattr, []byte(value), 0); err != nil {
++		if err := lsetxattr(dstPath, xattr, []byte(value), 0); err != nil {
+ 			if bestEffortXattrs && errors.Is(err, syscall.ENOTSUP) || errors.Is(err, syscall.EPERM) {
+ 				// EPERM occurs if modifying xattrs is not allowed. This can
+ 				// happen when running in userns with restrictions (ChromeOS).
+@@ -538,39 +554,43 @@ func createTarFile(path, extractDir string, hdr *tar.Header, reader io.Reader, o
+ 
+ 	// There is no LChmod, so ignore mode for symlink. Also, this
+ 	// must happen after chown, as that can modify the file mode
+-	if err := handleLChmod(hdr, path, hdrInfo); err != nil {
++	if err := handleLChmod(hdr, dstPath, hdrInfo); err != nil {
+ 		return err
+ 	}
+ 
+ 	aTime := boundTime(latestTime(hdr.AccessTime, hdr.ModTime))
+ 	mTime := boundTime(hdr.ModTime)
+ 
+-	// chtimes doesn't support a NOFOLLOW flag atm
+-	if hdr.Typeflag == tar.TypeLink {
+-		if fi, err := os.Lstat(hdr.Linkname); err == nil && (fi.Mode()&os.ModeSymlink == 0) {
+-			if err := chtimes(path, aTime, mTime); err != nil {
++	switch hdr.Typeflag {
++	case tar.TypeSymlink:
++		// Apply timestamps to the symlink itself (AT_SYMLINK_NOFOLLOW).
++		if err := lchtimes(dstPath, aTime, mTime); err != nil {
++			return err
++		}
++	case tar.TypeLink:
++		// Follow the hardlink only when its target is not itself a symlink.
++		fi, err := os.Lstat(hdr.Linkname)
++		if err == nil && fi.Mode()&os.ModeSymlink == 0 {
++			if err := chtimes(dstPath, aTime, mTime); err != nil {
+ 				return err
+ 			}
+ 		}
+-	} else if hdr.Typeflag != tar.TypeSymlink {
+-		if err := chtimes(path, aTime, mTime); err != nil {
+-			return err
+-		}
+-	} else {
+-		if err := lchtimes(path, aTime, mTime); err != nil {
++	default:
++		// All other file types follow symlinks.
++		if err := chtimes(dstPath, aTime, mTime); err != nil {
+ 			return err
+ 		}
+ 	}
+ 	return nil
+ }
+ 
+-// Tar creates an archive from the directory at `path`, and returns it as a
++// Tar creates an archive from the directory at `srcPath`, and returns it as a
+ // stream of bytes.
+-func Tar(path string, comp compression.Compression) (io.ReadCloser, error) {
+-	return TarWithOptions(path, &TarOptions{Compression: comp})
++func Tar(srcPath string, comp compression.Compression) (io.ReadCloser, error) {
++	return TarWithOptions(srcPath, &TarOptions{Compression: comp})
+ }
+ 
+-// TarWithOptions creates an archive from the directory at `path`, only including files whose relative
++// TarWithOptions creates an archive from the directory at `srcPath`, only including files whose relative
+ // paths are included in `options.IncludeFiles` (if non-nil) or not in `options.ExcludePatterns`.
+ func TarWithOptions(srcPath string, options *TarOptions) (io.ReadCloser, error) {
+ 	tb, err := NewTarballer(srcPath, options)
+@@ -805,6 +825,9 @@ func (t *Tarballer) Do() {
+ 
+ // Unpack unpacks the decompressedArchive to dest with options.
+ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) error {
++	if options == nil {
++		options = &TarOptions{}
++	}
+ 	tr := tar.NewReader(decompressedArchive)
+ 
+ 	var dirs []*tar.Header
+@@ -846,8 +869,8 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 		}
+ 
+ 		// #nosec G305 -- The joined path is checked for path traversal.
+-		path := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, path)
++		dstPath := filepath.Join(dest, hdr.Name)
++		rel, err := filepath.Rel(dest, dstPath)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -855,21 +878,21 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			return breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
+ 		}
+ 
+-		// If path exits we almost always just want to remove and replace it
++		// If dstPath exists we almost always just want to remove and replace it.
+ 		// The only exception is when it is a directory *and* the file from
+ 		// the layer is also a directory. Then we want to merge them (i.e.
+ 		// just apply the metadata from the layer).
+-		if fi, err := os.Lstat(path); err == nil {
++		if fi, err := os.Lstat(dstPath); err == nil {
+ 			if options.NoOverwriteDirNonDir && fi.IsDir() && hdr.Typeflag != tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing directory with a non-directory from the archive.
+-				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", path, dest)
++				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", dstPath, dest)
+ 			}
+ 
+ 			if options.NoOverwriteDirNonDir && !fi.IsDir() && hdr.Typeflag == tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing non-directory with a directory from the archive.
+-				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", path, dest)
++				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", dstPath, dest)
+ 			}
+ 
+ 			if fi.IsDir() && hdr.Name == "." {
+@@ -877,7 +900,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 
+ 			if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-				if err := os.RemoveAll(path); err != nil {
++				if err := os.RemoveAll(dstPath); err != nil {
+ 					return err
+ 				}
+ 			}
+@@ -888,7 +911,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 		}
+ 
+ 		if whiteoutConverter != nil {
+-			writeFile, err := whiteoutConverter.ConvertRead(hdr, path)
++			writeFile, err := whiteoutConverter.ConvertRead(hdr, dstPath)
+ 			if err != nil {
+ 				return err
+ 			}
+@@ -897,7 +920,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 		}
+ 
+-		if err := createTarFile(path, dest, hdr, tr, options); err != nil {
++		if err := createTarFile(dstPath, dest, hdr, tr, options); err != nil {
+ 			return err
+ 		}
+ 
+@@ -910,9 +933,8 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 
+ 	for _, hdr := range dirs {
+ 		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		path := filepath.Join(dest, hdr.Name)
+-
+-		if err := chtimes(path, boundTime(latestTime(hdr.AccessTime, hdr.ModTime)), boundTime(hdr.ModTime)); err != nil {
++		dstPath := filepath.Join(dest, hdr.Name)
++		if err := chtimes(dstPath, boundTime(latestTime(hdr.AccessTime, hdr.ModTime)), boundTime(hdr.ModTime)); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -923,16 +945,15 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ // not already exist. This is possible as the tar format supports 'implicit' directories, where their existence is
+ // defined by the paths of files in the tar, but there are no header entries for the directories themselves, and thus
+ // we most both create them and choose metadata like permissions.
+-//
+-// The caller should have performed filepath.Clean(hdr.Name), so hdr.Name will now be in the filepath format for the OS
+-// on which the daemon is running. This precondition is required because this function assumes a OS-specific path
+-// separator when checking that a path is not the root.
+ func createImpliedDirectories(dest string, hdr *tar.Header, options *TarOptions) error {
+-	// Not the root directory, ensure that the parent directory exists
+-	if !strings.HasSuffix(hdr.Name, string(os.PathSeparator)) {
++	// For non-directory entries, ensure that the parent directory exists.
++	if hdr.Typeflag != tar.TypeDir {
+ 		parent := filepath.Dir(hdr.Name)
+ 		parentPath := filepath.Join(dest, parent)
+ 		if _, err := os.Lstat(parentPath); err != nil && os.IsNotExist(err) {
++			if options.NoLchown {
++				return os.MkdirAll(parentPath, ImpliedDirectoryMode)
++			}
+ 			// RootPair() is confined inside this loop as most cases will not require a call, so we can spend some
+ 			// unneeded function calls in the uncommon case to encapsulate logic -- implied directories are a niche
+ 			// usage that reduces the portability of an image.
+@@ -974,9 +995,6 @@ func untarHandler(tarArchive io.Reader, dest string, options *TarOptions, decomp
+ 	if options == nil {
+ 		options = &TarOptions{}
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 
+ 	r := tarArchive
+ 	if decompress {
+@@ -984,7 +1002,7 @@ func untarHandler(tarArchive io.Reader, dest string, options *TarOptions, decomp
+ 		if err != nil {
+ 			return err
+ 		}
+-		defer decompressedArchive.Close()
++		defer func() { _ = decompressedArchive.Close() }()
+ 		r = decompressedArchive
+ 	}
+ 
+@@ -998,7 +1016,7 @@ func (archiver *Archiver) TarUntar(src, dst string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer archive.Close()
++	defer func() { _ = archive.Close() }()
+ 	return archiver.Untar(archive, dst, &TarOptions{
+ 		IDMap: archiver.IDMapping,
+ 	})
+@@ -1010,7 +1028,7 @@ func (archiver *Archiver) UntarPath(src, dst string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer archive.Close()
++	defer func() { _ = archive.Close() }()
+ 	return archiver.Untar(archive, dst, &TarOptions{
+ 		IDMap: archiver.IDMapping,
+ 	})
+@@ -1070,13 +1088,13 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 		defer close(errC)
+ 
+ 		errC <- func() error {
+-			defer w.Close()
++			defer func() { _ = w.Close() }()
+ 
+ 			srcF, err := os.Open(src)
+ 			if err != nil {
+ 				return err
+ 			}
+-			defer srcF.Close()
++			defer func() { _ = srcF.Close() }()
+ 
+ 			hdr, err := tarheader.FileInfoHeaderNoLookups(srcSt, "")
+ 			if err != nil {
+@@ -1087,14 +1105,14 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 			hdr.AccessTime = time.Time{}
+ 			hdr.ChangeTime = time.Time{}
+ 			hdr.Name = filepath.Base(dst)
+-			hdr.Mode = int64(chmodTarEntry(os.FileMode(hdr.Mode)))
++			hdr.Mode = chmodTarEntry(hdr.Mode)
+ 
+ 			if err := remapIDs(archiver.IDMapping, hdr); err != nil {
+ 				return err
+ 			}
+ 
+ 			tw := tar.NewWriter(w)
+-			defer tw.Close()
++			defer func() { _ = tw.Close() }()
+ 			if err := tw.WriteHeader(hdr); err != nil {
+ 				return err
+ 			}
+@@ -1112,7 +1130,7 @@ func (archiver *Archiver) CopyFileWithTar(src, dst string) (err error) {
+ 
+ 	err = archiver.Untar(r, filepath.Dir(dst), nil)
+ 	if err != nil {
+-		r.CloseWithError(err)
++		_ = r.CloseWithError(err)
+ 	}
+ 	return err
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_linux.go b/vendor/github.com/moby/go-archive/archive_linux.go
+index 7b6c3e02b6..bddef788cc 100644
+--- a/vendor/github.com/moby/go-archive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/archive_linux.go
+@@ -4,6 +4,7 @@
+ 	"archive/tar"
+ 	"fmt"
+ 	"os"
++	"path"
+ 	"path/filepath"
+ 	"strings"
+ 
+@@ -13,36 +14,43 @@
+ 
+ func getWhiteoutConverter(format WhiteoutFormat) tarWhiteoutConverter {
+ 	if format == OverlayWhiteoutFormat {
+-		return overlayWhiteoutConverter{}
++		return newOverlayWhiteoutConverter()
+ 	}
+ 	return nil
+ }
+ 
+-type overlayWhiteoutConverter struct{}
++type overlayWhiteoutConverter struct {
++	opaqueXattr string
++}
++
++func newOverlayWhiteoutConverter() overlayWhiteoutConverter {
++	opaqueXattr := "trusted.overlay.opaque"
++	if userns.RunningInUserNS() {
++		opaqueXattr = "user.overlay.opaque"
++	}
++	return overlayWhiteoutConverter{
++		opaqueXattr: opaqueXattr,
++	}
++}
+ 
+-func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os.FileInfo) (wo *tar.Header, _ error) {
++func (c overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, filePath string, fi os.FileInfo) (wo *tar.Header, _ error) {
+ 	// convert whiteouts to AUFS format
+ 	if fi.Mode()&os.ModeCharDevice != 0 && hdr.Devmajor == 0 && hdr.Devminor == 0 {
+ 		// we just rename the file and make it normal
+-		dir, filename := filepath.Split(hdr.Name)
+-		hdr.Name = filepath.Join(dir, WhiteoutPrefix+filename)
++		dir, filename := path.Split(hdr.Name)
++		hdr.Name = path.Join(dir, WhiteoutPrefix+filename)
+ 		hdr.Mode = 0o600
+ 		hdr.Typeflag = tar.TypeReg
+ 		hdr.Size = 0
+ 	}
+ 
+-	if fi.Mode()&os.ModeDir == 0 {
++	if !fi.IsDir() {
+ 		// FIXME(thaJeztah): return a sentinel error instead of nil, nil
+ 		return nil, nil
+ 	}
+ 
+-	opaqueXattrName := "trusted.overlay.opaque"
+-	if userns.RunningInUserNS() {
+-		opaqueXattrName = "user.overlay.opaque"
+-	}
+-
+ 	// convert opaque dirs to AUFS format by writing an empty file with the prefix
+-	opaque, err := lgetxattr(path, opaqueXattrName)
++	opaque, err := lgetxattr(filePath, c.opaqueXattr)
+ 	if err != nil {
+ 		return nil, err
+ 	}
+@@ -50,14 +58,14 @@ func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os
+ 		// FIXME(thaJeztah): return a sentinel error instead of nil, nil
+ 		return nil, nil
+ 	}
+-	delete(hdr.PAXRecords, paxSchilyXattr+opaqueXattrName)
++	delete(hdr.PAXRecords, paxSchilyXattr+c.opaqueXattr)
+ 
+ 	// create a header for the whiteout file
+ 	// it should inherit some properties from the parent, but be a regular file
+ 	return &tar.Header{
+ 		Typeflag:   tar.TypeReg,
+ 		Mode:       hdr.Mode & int64(os.ModePerm),
+-		Name:       filepath.Join(hdr.Name, WhiteoutOpaqueDir), // #nosec G305 -- An archive is being created, not extracted.
++		Name:       path.Join(hdr.Name, WhiteoutOpaqueDir), // #nosec G305 -- An archive is being created, not extracted.
+ 		Size:       0,
+ 		Uid:        hdr.Uid,
+ 		Uname:      hdr.Uname,
+@@ -68,40 +76,54 @@ func (overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, path string, fi os
+ 	}, nil
+ }
+ 
+-func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, path string) (bool, error) {
+-	base := filepath.Base(path)
+-	dir := filepath.Dir(path)
++func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, filePath string) (bool, error) {
++	base := filepath.Base(filePath)
++	dir := filepath.Dir(filePath)
+ 
+-	// if a directory is marked as opaque by the AUFS special file, we need to translate that to overlay
+-	if base == WhiteoutOpaqueDir {
+-		opaqueXattrName := "trusted.overlay.opaque"
+-		if userns.RunningInUserNS() {
+-			opaqueXattrName = "user.overlay.opaque"
+-		}
++	switch base {
++	case WhiteoutPrefix, WhiteoutPrefix + ".", WhiteoutPrefix + "..":
++		return false, fmt.Errorf("invalid whiteout entry %q", hdr.Name)
+ 
+-		err := unix.Setxattr(dir, opaqueXattrName, []byte{'y'}, 0)
+-		if err != nil {
+-			return false, fmt.Errorf("setxattr('%s', %s=y): %w", dir, opaqueXattrName, err)
++	case WhiteoutOpaqueDir:
++		// If a directory is marked as opaque by the AUFS special file, we need to translate that to overlay.
++		if err := unix.Setxattr(dir, c.opaqueXattr, []byte{'y'}, 0); err != nil {
++			return false, fmt.Errorf("setxattr('%s', %s=y): %w", dir, c.opaqueXattr, err)
+ 		}
+-		// don't write the file itself
+-		return false, err
+-	}
++		// Don't write the whiteout file itself.
++		return false, nil
+ 
+-	// if a file was deleted and we are using overlay, we need to create a character device
+-	if strings.HasPrefix(base, WhiteoutPrefix) {
+-		originalBase := base[len(WhiteoutPrefix):]
++	default:
++		originalBase, ok := strings.CutPrefix(base, WhiteoutPrefix)
++		if !ok {
++			// Regular file.
++			return true, nil
++		}
++		// If a file was deleted, and we are using overlay, we need to create a character device.
+ 		originalPath := filepath.Join(dir, originalBase)
+-
+ 		if err := unix.Mknod(originalPath, unix.S_IFCHR, 0); err != nil {
+ 			return false, fmt.Errorf("failed to mknod('%s', S_IFCHR, 0): %w", originalPath, err)
+ 		}
+-		if err := os.Chown(originalPath, hdr.Uid, hdr.Gid); err != nil {
+-			return false, err
++
++		// Header IDs have already been remapped. Optimize the common non-remapped
++		// root-owned (0:0) case by assuming the created whiteout has the expected
++		// ownership, rather than comparing against the effective UID/GID or stat'ing
++		// the created node to verify it.
++		if hdr.Uid != 0 || hdr.Gid != 0 {
++			// TODO(thaJeztah): Revisit whether whiteout ownership needs to be preserved.
++			//
++			// This was added in the original overlay whiteout implementation:
++			// https://github.com/moby/moby/pull/18560 / https://github.com/moby/moby/pull/22126
++			//
++			// OverlayFS documents whiteouts in terms of a character device with device
++			// number 0:0, not ownership: https://docs.kernel.org/filesystems/overlayfs.html#whiteouts-and-opaque-directories
++			//
++			// If ownership is not required, this Lchown can be removed to avoid the remaining TOCTOU window.
++			if err := os.Lchown(originalPath, hdr.Uid, hdr.Gid); err != nil {
++				return false, err
++			}
+ 		}
+ 
+-		// don't write the file itself
++		// Don't write the whiteout file itself.
+ 		return false, nil
+ 	}
+-
+-	return true, nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_unix.go b/vendor/github.com/moby/go-archive/archive_unix.go
+index 3a9f5b0b58..b8b4cadab2 100644
+--- a/vendor/github.com/moby/go-archive/archive_unix.go
++++ b/vendor/github.com/moby/go-archive/archive_unix.go
+@@ -5,6 +5,8 @@
+ import (
+ 	"archive/tar"
+ 	"errors"
++	"fmt"
++	"math"
+ 	"os"
+ 	"path/filepath"
+ 	"strings"
+@@ -13,6 +15,8 @@
+ 	"golang.org/x/sys/unix"
+ )
+ 
++var errInvalidArchive = errors.New("invalid archive")
++
+ // addLongPathPrefix adds the Windows long path prefix to the path provided if
+ // it does not already have it. It is a no-op on platforms other than Windows.
+ func addLongPathPrefix(srcPath string) string {
+@@ -29,20 +33,19 @@ func getWalkRoot(srcPath string, include string) string {
+ 
+ // chmodTarEntry is used to adjust the file permissions used in tar header based
+ // on the platform the archival is done.
+-func chmodTarEntry(perm os.FileMode) os.FileMode {
+-	return perm // noop for unix as golang APIs provide perm bits correctly
++func chmodTarEntry(mode int64) int64 {
++	return mode // noop for unix as golang APIs provide perm bits correctly
+ }
+ 
+-func getInodeFromStat(stat interface{}) (uint64, error) {
++func getInodeFromStat(stat any) (uint64, error) {
+ 	s, ok := stat.(*syscall.Stat_t)
+ 	if !ok {
+-		// FIXME(thaJeztah): this should likely return an error; see https://github.com/moby/moby/pull/49493#discussion_r1979152897
+-		return 0, nil
++		return 0, fmt.Errorf("unexpected stat type %T", stat)
+ 	}
+ 	return s.Ino, nil
+ }
+ 
+-func getFileUIDGID(stat interface{}) (int, int, error) {
++func getFileUIDGID(stat any) (int, int, error) {
+ 	s, ok := stat.(*syscall.Stat_t)
+ 
+ 	if !ok {
+@@ -56,7 +59,7 @@ func getFileUIDGID(stat interface{}) (int, int, error) {
+ //
+ // Creating device nodes is not supported when running in a user namespace,
+ // produces a [syscall.EPERM] in most cases.
+-func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
++func handleTarTypeBlockCharFifo(hdr *tar.Header, dstPath string) error {
+ 	mode := uint32(hdr.Mode & 0o7777)
+ 	switch hdr.Typeflag {
+ 	case tar.TypeBlock:
+@@ -67,18 +70,28 @@ func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
+ 		mode |= unix.S_IFIFO
+ 	}
+ 
+-	return mknod(path, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
++	// Devmajor and Devminor come straight from the (untrusted) tar header as
++	// int64, but Mkdev only takes uint32. Casting a value that does not fit
++	// silently truncates it, so the node created on disk would carry a
++	// different major/minor than the header declares. Reject those instead of
++	// creating a mismatched device.
++	if hdr.Devmajor < 0 || hdr.Devmajor > math.MaxUint32 ||
++		hdr.Devminor < 0 || hdr.Devminor > math.MaxUint32 {
++		return fmt.Errorf("device number %d:%d for %q out of range: %w", hdr.Devmajor, hdr.Devminor, hdr.Name, errInvalidArchive)
++	}
++
++	return mknod(dstPath, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
+ }
+ 
+-func handleLChmod(hdr *tar.Header, path string, hdrInfo os.FileInfo) error {
++func handleLChmod(hdr *tar.Header, dstPath string, hdrInfo os.FileInfo) error {
+ 	if hdr.Typeflag == tar.TypeLink {
+ 		if fi, err := os.Lstat(hdr.Linkname); err == nil && (fi.Mode()&os.ModeSymlink == 0) {
+-			if err := os.Chmod(path, hdrInfo.Mode()); err != nil {
++			if err := os.Chmod(dstPath, hdrInfo.Mode()); err != nil {
+ 				return err
+ 			}
+ 		}
+ 	} else if hdr.Typeflag != tar.TypeSymlink {
+-		if err := os.Chmod(path, hdrInfo.Mode()); err != nil {
++		if err := os.Chmod(dstPath, hdrInfo.Mode()); err != nil {
+ 			return err
+ 		}
+ 	}
+diff --git a/vendor/github.com/moby/go-archive/archive_windows.go b/vendor/github.com/moby/go-archive/archive_windows.go
+index 0e3e316afc..ee8dbd6830 100644
+--- a/vendor/github.com/moby/go-archive/archive_windows.go
++++ b/vendor/github.com/moby/go-archive/archive_windows.go
+@@ -33,15 +33,15 @@ func getWalkRoot(srcPath string, include string) string {
+ 
+ // chmodTarEntry is used to adjust the file permissions used in tar header based
+ // on the platform the archival is done.
+-func chmodTarEntry(perm os.FileMode) os.FileMode {
++func chmodTarEntry(mode int64) int64 {
+ 	// Remove group- and world-writable bits.
+-	perm &= 0o755
++	mode &= 0o755
+ 
+ 	// Add the x bit: make everything +x on Windows
+-	return perm | 0o111
++	return mode | 0o111
+ }
+ 
+-func getInodeFromStat(stat interface{}) (uint64, error) {
++func getInodeFromStat(stat any) (uint64, error) {
+ 	// do nothing. no notion of Inode in stat on Windows
+ 	return 0, nil
+ }
+@@ -56,7 +56,7 @@ func handleLChmod(hdr *tar.Header, path string, hdrInfo os.FileInfo) error {
+ 	return nil
+ }
+ 
+-func getFileUIDGID(stat interface{}) (int, int, error) {
++func getFileUIDGID(stat any) (int, int, error) {
+ 	// no notion of file ownership mapping yet on Windows
+ 	return 0, 0, nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/copy.go b/vendor/github.com/moby/go-archive/copy.go
+index 77d038c423..b4ee74ef47 100644
+--- a/vendor/github.com/moby/go-archive/copy.go
++++ b/vendor/github.com/moby/go-archive/copy.go
+@@ -22,7 +22,7 @@
+ )
+ 
+ var copyPool = sync.Pool{
+-	New: func() interface{} { s := make([]byte, 32*1024); return &s },
++	New: func() any { s := make([]byte, 32*1024); return &s },
+ }
+ 
+ func copyWithBuffer(dst io.Writer, src io.Reader) error {
+@@ -319,7 +319,10 @@ func PrepareArchiveCopy(srcContent io.Reader, srcInfo, dstInfo CopyInfo) (dstDir
+ // RebaseArchiveEntries rewrites the given srcContent archive replacing
+ // an occurrence of oldBase with newBase at the beginning of entry names.
+ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.ReadCloser {
+-	if oldBase == string(os.PathSeparator) {
++	oldBase = filepath.ToSlash(oldBase)
++	newBase = filepath.ToSlash(newBase)
++
++	if oldBase == "/" {
+ 		// If oldBase specifies the root directory, use an empty string as
+ 		// oldBase instead so that newBase doesn't replace the path separator
+ 		// that all paths will start with.
+@@ -336,12 +339,12 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			hdr, err := srcTar.Next()
+ 			if errors.Is(err, io.EOF) {
+ 				// Signals end of archive.
+-				rebasedTar.Close()
+-				w.Close()
++				_ = rebasedTar.Close()
++				_ = w.Close()
+ 				return
+ 			}
+ 			if err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -359,7 +362,7 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			}
+ 
+ 			if err = rebasedTar.WriteHeader(hdr); err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 
+@@ -374,7 +377,7 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			// not be vulnerable to this code consuming memory.
+ 			//nolint:gosec // G110: Potential DoS vulnerability via decompression bomb (gosec)
+ 			if _, err = io.Copy(rebasedTar, srcTar); err != nil {
+-				w.CloseWithError(err)
++				_ = w.CloseWithError(err)
+ 				return
+ 			}
+ 		}
+@@ -408,7 +411,7 @@ func CopyResource(srcPath, dstPath string, followLink bool) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer content.Close()
++	defer func() { _ = content.Close() }()
+ 
+ 	return CopyTo(content, srcInfo, dstPath)
+ }
+@@ -427,14 +430,12 @@ func CopyTo(content io.Reader, srcInfo CopyInfo, dstPath string) error {
+ 	if err != nil {
+ 		return err
+ 	}
+-	defer copyArchive.Close()
++	defer func() { _ = copyArchive.Close() }()
+ 
+-	options := &TarOptions{
++	return Untar(copyArchive, dstDir, &TarOptions{
+ 		NoLchown:             true,
+ 		NoOverwriteDirNonDir: true,
+-	}
+-
+-	return Untar(copyArchive, dstDir, options)
++	})
+ }
+ 
+ // ResolveHostSourcePath decides real path need to be copied with parameters such as
+diff --git a/vendor/github.com/moby/go-archive/dev_unix.go b/vendor/github.com/moby/go-archive/dev_unix.go
+index dffc596f93..2f9833b85b 100644
+--- a/vendor/github.com/moby/go-archive/dev_unix.go
++++ b/vendor/github.com/moby/go-archive/dev_unix.go
+@@ -5,5 +5,5 @@
+ import "golang.org/x/sys/unix"
+ 
+ func mknod(path string, mode uint32, dev uint64) error {
+-	return unix.Mknod(path, mode, int(dev))
++	return unix.Mknod(path, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
+ }
+diff --git a/vendor/github.com/moby/go-archive/diff.go b/vendor/github.com/moby/go-archive/diff.go
+index 96db972d13..b2fdf770a6 100644
+--- a/vendor/github.com/moby/go-archive/diff.go
++++ b/vendor/github.com/moby/go-archive/diff.go
+@@ -28,9 +28,6 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 	if options == nil {
+ 		options = &TarOptions{}
+ 	}
+-	if options.ExcludePatterns == nil {
+-		options.ExcludePatterns = []string{}
+-	}
+ 
+ 	aufsTempdir := ""
+ 	aufsHardlinks := make(map[string]*tar.Header)
+@@ -102,8 +99,8 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			}
+ 		}
+ 		// #nosec G305 -- The joined path is guarded against path traversal.
+-		path := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, path)
++		dstPath := filepath.Join(dest, hdr.Name)
++		rel, err := filepath.Rel(dest, dstPath)
+ 		if err != nil {
+ 			return 0, err
+ 		}
+@@ -112,10 +109,10 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 		if strings.HasPrefix(rel, ".."+string(os.PathSeparator)) {
+ 			return 0, breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
+ 		}
+-		base := filepath.Base(path)
++		base := filepath.Base(dstPath)
+ 
+ 		if strings.HasPrefix(base, WhiteoutPrefix) {
+-			dir := filepath.Dir(path)
++			dir := filepath.Dir(dstPath)
+ 			if base == WhiteoutOpaqueDir {
+ 				_, err := os.Lstat(dir)
+ 				if err != nil {
+@@ -132,7 +129,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 						return nil
+ 					}
+ 					if _, exists := unpackedPaths[path]; !exists {
+-						return os.RemoveAll(path)
++						return os.RemoveAll(path) // #nosec G122 -- FIXME: consider root-scoped APIs (e.g. os.Root) to prevent symlink TOCTOU traversal
+ 					}
+ 					return nil
+ 				})
+@@ -147,13 +144,13 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 				}
+ 			}
+ 		} else {
+-			// If path exits we almost always just want to remove and replace it.
++			// If dstPath exists we almost always just want to remove and replace it.
+ 			// The only exception is when it is a directory *and* the file from
+ 			// the layer is also a directory. Then we want to merge them (i.e.
+ 			// just apply the metadata from the layer).
+-			if fi, err := os.Lstat(path); err == nil {
++			if fi, err := os.Lstat(dstPath); err == nil {
+ 				if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-					if err := os.RemoveAll(path); err != nil {
++					if err := os.RemoveAll(dstPath); err != nil {
+ 						return 0, err
+ 					}
+ 				}
+@@ -182,7 +179,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 				return 0, err
+ 			}
+ 
+-			if err := createTarFile(path, dest, srcHdr, srcData, options); err != nil {
++			if err := createTarFile(dstPath, dest, srcHdr, srcData, options); err != nil {
+ 				return 0, err
+ 			}
+ 
+@@ -191,14 +188,14 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			if hdr.Typeflag == tar.TypeDir {
+ 				dirs = append(dirs, hdr)
+ 			}
+-			unpackedPaths[path] = struct{}{}
++			unpackedPaths[dstPath] = struct{}{}
+ 		}
+ 	}
+ 
+ 	for _, hdr := range dirs {
+ 		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		path := filepath.Join(dest, hdr.Name)
+-		if err := chtimes(path, hdr.AccessTime, hdr.ModTime); err != nil {
++		dstPath := filepath.Join(dest, hdr.Name)
++		if err := chtimes(dstPath, hdr.AccessTime, hdr.ModTime); err != nil {
+ 			return 0, err
+ 		}
+ 	}
+-- 
+2.35.6
+
diff --git a/recipes-containers/docker/files/CVE-2026-17106-dependent_p2.patch b/recipes-containers/docker/files/CVE-2026-17106-dependent_p2.patch
new file mode 100644
index 00000000..f4439083
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106-dependent_p2.patch
@@ -0,0 +1,1287 @@
+From 5b3408829f3ceb487c74e74fa6ba89d87ed6a708 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Fri, 17 Jul 2026 11:54:50 +0200
+Subject: [PATCH] vendor: github.com/moby/go-archive with hardening
+
+full diff: https://github.com/moby/go-archive/compare/v0.2.1...2ff9bfb8b2ee857dc7f2f619ee39758e3d112fbc
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/5b3408829f3ceb487c74e74fa6ba89d87ed6a708]
+
+Backport Changes:
+- Omit go.mod, go.sum, and vendor/modules.txt dependency updates to keep
+  go-archive at v0.2.0. Retain the source changes that contain archive
+  paths beneath the extraction root and are used by the CVE fix.
+
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 5b3408829f3ceb487c74e74fa6ba89d87ed6a708)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ vendor/github.com/moby/go-archive/archive.go  | 292 +++++++++++++-----
+ .../moby/go-archive/archive_linux.go          |  27 +-
+ .../moby/go-archive/archive_unix.go           |  85 ++++-
+ .../moby/go-archive/archive_windows.go        |   5 +-
+ .../github.com/moby/go-archive/dev_darwin.go  |  21 ++
+ .../github.com/moby/go-archive/dev_freebsd.go |  17 +-
+ vendor/github.com/moby/go-archive/dev_unix.go |  19 +-
+ vendor/github.com/moby/go-archive/diff.go     | 130 ++++----
+ vendor/github.com/moby/go-archive/rootpath.go | 112 +++++++
+ .../moby/go-archive/sequential_other.go       |   6 +
+ .../go-archive/sequential_windows_go126.go    |   9 +
+ .../go-archive/sequential_windows_pre126.go   |   6 +
+ .../moby/go-archive/time_nonwindows.go        |  34 +-
+ .../moby/go-archive/time_windows.go           |   2 +-
+ 14 files changed, 600 insertions(+), 165 deletions(-)
+ create mode 100644 vendor/github.com/moby/go-archive/dev_darwin.go
+ create mode 100644 vendor/github.com/moby/go-archive/rootpath.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_other.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_windows_go126.go
+ create mode 100644 vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index e59cfbb89d..1654a07333 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -8,9 +8,11 @@
+ 	"fmt"
+ 	"io"
+ 	"os"
++	"path"
+ 	"path/filepath"
+ 	"runtime"
+ 	"strings"
++	"sync"
+ 	"syscall"
+ 	"time"
+ 
+@@ -95,6 +97,23 @@ func NewDefaultArchiver() *Archiver {
+ 	return &Archiver{Untar: Untar}
+ }
+ 
++// isPathEscapes reports whether err is os.Root's path-containment error.
++//
++// os.Root currently returns an unexported errPathEscapes sentinel, so callers
++// cannot detect it with errors.Is. Keep the string comparison isolated here
++// until Go exports the error; see https://go.dev/issue/74640.
++func isPathEscapes(err error) bool {
++	// https://github.com/golang/go/blob/go1.26.5/src/os/file.go#L421
++	const errPathEscapes = "path escapes from parent"
++	for err != nil {
++		if errors.Unwrap(err) == nil {
++			return err.Error() == errPathEscapes
++		}
++		err = errors.Unwrap(err)
++	}
++	return false
++}
++
+ // breakoutErr marks errors caused by archive breakout attempts.
+ // Unit tests use it to distinguish expected breakout failures from other
+ // errors.
+@@ -268,7 +287,7 @@ func ReadSecurityXattrToTarHeader(filePath string, hdr *tar.Header) error {
+ 
+ type tarWhiteoutConverter interface {
+ 	ConvertWrite(*tar.Header, string, os.FileInfo) (*tar.Header, error)
+-	ConvertRead(*tar.Header, string) (bool, error)
++	ConvertRead(*os.Root, *tar.Header, string) (bool, error)
+ }
+ 
+ type tarAppender struct {
+@@ -357,7 +376,7 @@ func (ta *tarAppender) addTarFile(srcPath, archivePath string) error {
+ 	// handle re-mapping container ID mappings back to host ID mappings before
+ 	// writing tar headers/files. We skip whiteout files because they were written
+ 	// by the kernel and already have proper ownership relative to the host
+-	if !isOverlayWhiteout && !strings.HasPrefix(filepath.Base(hdr.Name), WhiteoutPrefix) && !ta.IdentityMapping.Empty() {
++	if !isOverlayWhiteout && !strings.HasPrefix(path.Base(hdr.Name), WhiteoutPrefix) && !ta.IdentityMapping.Empty() {
+ 		uid, gid, err := getFileUIDGID(fi.Sys())
+ 		if err != nil {
+ 			return err
+@@ -418,7 +437,10 @@ func (ta *tarAppender) addTarFile(srcPath, archivePath string) error {
+ 	return nil
+ }
+ 
+-func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
++// createTarFile extracts a single tar entry into the given root. dstPath is the
++// root-relative path of the entry being extracted, in native (host-separator)
++// form so it can be passed directly to os.Root methods and fsRootPath.
++func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Reader, opts *TarOptions) error {
+ 	var (
+ 		Lchown                     = true
+ 		inUserns, bestEffortXattrs bool
+@@ -440,18 +462,24 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 
+ 	switch hdr.Typeflag {
+ 	case tar.TypeDir:
+-		// Create directory unless it exists as a directory already.
+-		// In that case we just want to merge the two
+-		if fi, err := os.Lstat(dstPath); err != nil || !fi.IsDir() {
+-			if err := os.Mkdir(dstPath, hdrInfo.Mode()); err != nil {
++		// Create directory unless it already exists as one; merge in that case.
++		// os.Root.Mkdir only accepts the nine least-significant permission
++		// bits; special bits (setuid, setgid, sticky) are applied afterward
++		// by handleLChmod via root.Chmod.
++		if fi, err := root.Lstat(dstPath); err != nil || !fi.IsDir() {
++			if err := root.Mkdir(dstPath, hdrInfo.Mode()&0o777); err != nil {
+ 				return err
+ 			}
+ 		}
+ 
+ 	case tar.TypeReg:
+-		// Source is regular file. We use sequential file access to avoid depleting
+-		// the standby list on Windows. On Linux, this equates to a regular os.OpenFile.
+-		file, err := sequential.OpenFile(dstPath, os.O_CREATE|os.O_WRONLY, hdrInfo.Mode())
++		// Source is a regular file. Use os.Root.OpenFile so that all
++		// path resolution is bounded within root using openat(2) semantics.
++		// os.Root.OpenFile only accepts the nine least-significant permission
++		// bits; special bits are applied afterward by handleLChmod.
++		// We use sequential file access to avoid depleting the standby list
++		// on Windows (go1.26). On Linux, this equates to a regular os.OpenFile.
++		file, err := root.OpenFile(dstPath, os.O_CREATE|os.O_WRONLY|os.O_TRUNC|windows_O_FILE_FLAG_SEQUENTIAL_SCAN, hdrInfo.Mode()&0o777)
+ 		if err != nil {
+ 			return err
+ 		}
+@@ -466,14 +494,12 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 			log.G(context.TODO()).WithFields(log.Fields{"path": dstPath, "type": hdr.Typeflag}).Debug("skipping device nodes in a userns")
+ 			return nil
+ 		}
+-		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, dstPath); err != nil {
++		if err := handleTarTypeBlockCharFifo(root, hdr, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeFifo:
+-		// Handle this is an OS-specific way
+-		if err := handleTarTypeBlockCharFifo(hdr, dstPath); err != nil {
++		if err := handleTarTypeBlockCharFifo(root, hdr, dstPath); err != nil {
+ 			if inUserns && errors.Is(err, syscall.EPERM) {
+ 				// In most cases, cannot create a fifo if running in user namespace
+ 				log.G(context.TODO()).WithFields(log.Fields{"error": err, "path": dstPath, "type": hdr.Typeflag}).Debug("creating fifo node in a userns")
+@@ -483,27 +509,29 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 		}
+ 
+ 	case tar.TypeLink:
+-		// #nosec G305 -- The target path is checked for path traversal.
+-		linkTarget := filepath.Join(extractDir, hdr.Linkname)
+-		// check for hardlink breakout
+-		if !strings.HasPrefix(linkTarget, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid hardlink %q -> %q", linkTarget, hdr.Linkname))
++		// Defence in depth: root.Link's containment is limited when
++		// dest is a volume root.
++		linkname := path.Clean(hdr.Linkname)
++		if linkname == "." || !filepath.IsLocal(linkname) {
++			return breakoutError(fmt.Errorf("invalid hardlink target %q", hdr.Linkname))
+ 		}
+-		if err := os.Link(linkTarget, dstPath); err != nil {
++		if err := root.Link(filepath.FromSlash(linkname), dstPath); err != nil {
+ 			return err
+ 		}
+ 
+ 	case tar.TypeSymlink:
+-		// 	path 				-> hdr.Linkname = targetPath
+-		// e.g. /extractDir/path/to/symlink 	-> ../2/file	= /extractDir/path/2/file
+-		targetPath := filepath.Join(filepath.Dir(dstPath), hdr.Linkname) // #nosec G305 -- The target path is checked for path traversal.
+-
+-		// the reason we don't need to check symlinks in the path (with FollowSymlinkInScope) is because
+-		// that symlink would first have to be created, which would be caught earlier, at this very check:
+-		if !strings.HasPrefix(targetPath, extractDir) {
+-			return breakoutError(fmt.Errorf("invalid symlink %q -> %q", dstPath, hdr.Linkname))
+-		}
+-		if err := os.Symlink(hdr.Linkname, dstPath); err != nil {
++		// Symlink targets are archive data, not filesystem paths. Preserve the
++		// target verbatim rather than cleaning or converting it (filepath.FromSlash).
++		linkTarget := hdr.Linkname
++
++		// os.Root.Symlink contains the symlink's location (newname) within
++		// root but stores the target (oldname) verbatim, so absolute targets
++		// such as /usr/lib -- common and legitimate in container images -- are
++		// preserved rather than rejected. The symlink node is therefore always
++		// created within root via openat(2) semantics, without resolving to an
++		// absolute path; containment applies when the symlink is followed, not
++		// at creation.
++		if err := root.Symlink(linkTarget, dstPath); err != nil {
+ 			return err
+ 		}
+ 
+@@ -520,7 +548,7 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 		if chownOpts == nil {
+ 			chownOpts = &ChownOpts{UID: hdr.Uid, GID: hdr.Gid}
+ 		}
+-		if err := os.Lchown(dstPath, chownOpts.UID, chownOpts.GID); err != nil {
++		if err := root.Lchown(dstPath, chownOpts.UID, chownOpts.GID); err != nil {
+ 			var msg string
+ 			if inUserns && errors.Is(err, syscall.EINVAL) {
+ 				msg = " (try increasing the number of subordinate IDs in /etc/subuid and /etc/subgid)"
+@@ -530,12 +558,21 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 	}
+ 
+ 	var xattrErrs []string
++	absPath := sync.OnceValues(func() (string, error) {
++		return fsRootPath(root.Name(), dstPath)
++	})
+ 	for key, value := range hdr.PAXRecords {
+ 		xattr, ok := strings.CutPrefix(key, paxSchilyXattr)
+ 		if !ok {
+ 			continue
+ 		}
+-		if err := lsetxattr(dstPath, xattr, []byte(value), 0); err != nil {
++		// os.Root has no xattr support; use the absolute path derived from
++		// the root so the path remains bounded.
++		ap, err := absPath()
++		if err != nil {
++			return err
++		}
++		if err := lsetxattr(ap, xattr, []byte(value), 0); err != nil {
+ 			if bestEffortXattrs && errors.Is(err, syscall.ENOTSUP) || errors.Is(err, syscall.EPERM) {
+ 				// EPERM occurs if modifying xattrs is not allowed. This can
+ 				// happen when running in userns with restrictions (ChromeOS).
+@@ -554,7 +591,7 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 
+ 	// There is no LChmod, so ignore mode for symlink. Also, this
+ 	// must happen after chown, as that can modify the file mode
+-	if err := handleLChmod(hdr, dstPath, hdrInfo); err != nil {
++	if err := handleLChmod(root, dstPath, hdr, hdrInfo); err != nil {
+ 		return err
+ 	}
+ 
+@@ -564,20 +601,20 @@ func createTarFile(dstPath, extractDir string, hdr *tar.Header, reader io.Reader
+ 	switch hdr.Typeflag {
+ 	case tar.TypeSymlink:
+ 		// Apply timestamps to the symlink itself (AT_SYMLINK_NOFOLLOW).
+-		if err := lchtimes(dstPath, aTime, mTime); err != nil {
++		if err := lchtimes(root, dstPath, aTime, mTime); err != nil {
+ 			return err
+ 		}
+ 	case tar.TypeLink:
+ 		// Follow the hardlink only when its target is not itself a symlink.
+-		fi, err := os.Lstat(hdr.Linkname)
++		fi, err := root.Lstat(filepath.FromSlash(path.Clean(hdr.Linkname)))
+ 		if err == nil && fi.Mode()&os.ModeSymlink == 0 {
+-			if err := chtimes(dstPath, aTime, mTime); err != nil {
++			if err := root.Chtimes(dstPath, aTime, mTime); err != nil {
+ 				return err
+ 			}
+ 		}
+ 	default:
+ 		// All other file types follow symlinks.
+-		if err := chtimes(dstPath, aTime, mTime); err != nil {
++		if err := root.Chtimes(dstPath, aTime, mTime); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -823,14 +860,28 @@ func (t *Tarballer) Do() {
+ 	}
+ }
+ 
++// unpackedDir records a directory whose mtime must be restored after all
++// entries are extracted, along with the root-relative entry name used during
++// extraction.
++type unpackedDir struct {
++	hdr  *tar.Header
++	name string // root-relative entry name
++}
++
+ // Unpack unpacks the decompressedArchive to dest with options.
+ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) error {
+ 	if options == nil {
+ 		options = &TarOptions{}
+ 	}
++	root, err := os.OpenRoot(dest)
++	if err != nil {
++		return err
++	}
++	defer func() { _ = root.Close() }()
++
+ 	tr := tar.NewReader(decompressedArchive)
+ 
+-	var dirs []*tar.Header
++	var dirs []unpackedDir
+ 	whiteoutConverter := getWhiteoutConverter(options.WhiteoutFormat)
+ 
+ 	// Iterate through the files in the archive.
+@@ -851,48 +902,50 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			continue
+ 		}
+ 
+-		// Normalize name, for safety and for a simple is-root check
+-		// This keeps "../" as-is, but normalizes "/../" to "/". Or Windows:
+-		// This keeps "..\" as-is, but normalizes "\..\" to "\".
+-		hdr.Name = filepath.Clean(hdr.Name)
+-
++		// Strip a leading "/" so absolute entries stay root-relative, and
++		// normalize the POSIX tar path. Skip entries referring to the extraction
++		// root and reject paths that escape it.
++		name := path.Clean(strings.TrimLeft(hdr.Name, "/"))
++		if name == "." {
++			continue
++		}
++		if !filepath.IsLocal(name) {
++			return breakoutError(fmt.Errorf("invalid entry name %q", hdr.Name))
++		}
+ 		for _, exclude := range options.ExcludePatterns {
+-			if strings.HasPrefix(hdr.Name, exclude) {
++			if strings.HasPrefix(name, exclude) {
+ 				continue loop
+ 			}
+ 		}
+ 
+-		// Ensure that the parent directory exists.
+-		err = createImpliedDirectories(dest, hdr, options)
+-		if err != nil {
+-			return err
+-		}
++		hdr.Name = name
+ 
+-		// #nosec G305 -- The joined path is checked for path traversal.
+-		dstPath := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, dstPath)
+-		if err != nil {
+-			return err
+-		}
+-		if strings.HasPrefix(rel, ".."+string(os.PathSeparator)) {
+-			return breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
++		// Skip entries whose name (or hardlink target) Windows cannot represent.
++		if err := unrepresentableOnWindows(hdr); err != nil {
++			log.G(context.TODO()).Warnf("Windows: ignoring entry: %v", err)
++			continue loop
+ 		}
+ 
++		// dstPath is the native (host-separator) form of the entry name,
++		// used at all filesystem boundaries (os.Root methods, fsRootPath).
++		// hdr.Name stays POSIX (forward-slash) for logical string checks.
++		dstPath := filepath.FromSlash(hdr.Name)
++
+ 		// If dstPath exists we almost always just want to remove and replace it.
+ 		// The only exception is when it is a directory *and* the file from
+ 		// the layer is also a directory. Then we want to merge them (i.e.
+ 		// just apply the metadata from the layer).
+-		if fi, err := os.Lstat(dstPath); err == nil {
++		if fi, err := root.Lstat(dstPath); err == nil {
+ 			if options.NoOverwriteDirNonDir && fi.IsDir() && hdr.Typeflag != tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing directory with a non-directory from the archive.
+-				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", dstPath, dest)
++				return fmt.Errorf("cannot overwrite directory %q with non-directory %q", hdr.Name, dest)
+ 			}
+ 
+ 			if options.NoOverwriteDirNonDir && !fi.IsDir() && hdr.Typeflag == tar.TypeDir {
+ 				// If NoOverwriteDirNonDir is true then we cannot replace
+ 				// an existing non-directory with a directory from the archive.
+-				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", dstPath, dest)
++				return fmt.Errorf("cannot overwrite non-directory %q with directory %q", hdr.Name, dest)
+ 			}
+ 
+ 			if fi.IsDir() && hdr.Name == "." {
+@@ -900,7 +953,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 
+ 			if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-				if err := os.RemoveAll(dstPath); err != nil {
++				if err := root.RemoveAll(dstPath); err != nil {
+ 					return err
+ 				}
+ 			}
+@@ -910,8 +963,16 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			return err
+ 		}
+ 
++		// Ensure that the parent directory exists.
++		//
++		// This must be done before whiteoutConverter.ConvertRead, which
++		// may set xattrs on the directory or create whiteout files.
++		if err := createImpliedDirectories(root, hdr, options); err != nil {
++			return err
++		}
++
+ 		if whiteoutConverter != nil {
+-			writeFile, err := whiteoutConverter.ConvertRead(hdr, dstPath)
++			writeFile, err := whiteoutConverter.ConvertRead(root, hdr, dstPath)
+ 			if err != nil {
+ 				return err
+ 			}
+@@ -920,49 +981,122 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 			}
+ 		}
+ 
+-		if err := createTarFile(dstPath, dest, hdr, tr, options); err != nil {
++		if err := createTarFile(root, dstPath, hdr, tr, options); err != nil {
+ 			return err
+ 		}
+ 
+ 		// Directory mtimes must be handled at the end to avoid further
+ 		// file creation in them to modify the directory mtime
+ 		if hdr.Typeflag == tar.TypeDir {
+-			dirs = append(dirs, hdr)
++			dirs = append(dirs, unpackedDir{hdr: hdr, name: dstPath})
+ 		}
+ 	}
+ 
+-	for _, hdr := range dirs {
+-		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		dstPath := filepath.Join(dest, hdr.Name)
+-		if err := chtimes(dstPath, boundTime(latestTime(hdr.AccessTime, hdr.ModTime)), boundTime(hdr.ModTime)); err != nil {
++	for _, d := range dirs {
++		aTime := boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime))
++		if err := root.Chtimes(d.name, aTime, boundTime(d.hdr.ModTime)); err != nil {
+ 			return err
+ 		}
+ 	}
+ 	return nil
+ }
+ 
++// unrepresentableOnWindows returns an error describing why a tar entry cannot
++// be faithfully created on Windows, or nil if it can (always on non-Windows).
++// On Windows ":" is illegal in a filename and "\" is a path separator, so a tar
++// name or hardlink target containing them (they use POSIX semantics) would be
++// misinterpreted by os.Root (e.g. "a\b" resolved as two components). Symlink
++// targets are stored verbatim (not resolved at creation), so they are exempt.
++func unrepresentableOnWindows(hdr *tar.Header) error {
++	if runtime.GOOS != "windows" {
++		return nil
++	}
++	if strings.ContainsAny(hdr.Name, `:\`) {
++		return fmt.Errorf("entry name %q contains a character Windows cannot represent in a path", hdr.Name)
++	}
++	// A hardlink target is resolved within the root by os.Root.Link; a symlink
++	// target is stored verbatim, so only hardlinks need the target checked.
++	if hdr.Typeflag == tar.TypeLink && strings.ContainsAny(hdr.Linkname, `:\`) {
++		return fmt.Errorf("hardlink target %q contains a character Windows cannot represent in a path", hdr.Linkname)
++	}
++	return nil
++}
++
+ // createImpliedDirectories will create all parent directories of the current path with default permissions, if they do
+ // not already exist. This is possible as the tar format supports 'implicit' directories, where their existence is
+ // defined by the paths of files in the tar, but there are no header entries for the directories themselves, and thus
+ // we most both create them and choose metadata like permissions.
+-func createImpliedDirectories(dest string, hdr *tar.Header, options *TarOptions) error {
++//
++// The caller must have normalized hdr.Name (no leading ".." components).
++// All directory creation is performed via root so it is bounded within the
++// destination at the OS level (openat(2) semantics), preventing escape via
++// symlinks in the destination tree.
++func createImpliedDirectories(root *os.Root, hdr *tar.Header, options *TarOptions) error {
+ 	// For non-directory entries, ensure that the parent directory exists.
+ 	if hdr.Typeflag != tar.TypeDir {
+-		parent := filepath.Dir(hdr.Name)
+-		parentPath := filepath.Join(dest, parent)
+-		if _, err := os.Lstat(parentPath); err != nil && os.IsNotExist(err) {
+-			if options.NoLchown {
+-				return os.MkdirAll(parentPath, ImpliedDirectoryMode)
++		parent := filepath.FromSlash(path.Dir(strings.TrimSuffix(hdr.Name, "/")))
++		// Skip when the parent is the root itself; nothing to create.
++		if parent == "." || parent == "" {
++			return nil
++		}
++		if _, err := root.Lstat(parent); err == nil {
++			return nil
++		} else if !os.IsNotExist(err) {
++			return err
++		}
++		// RootPair() is confined inside this loop as most cases will not require a call, so we can spend some
++		// unneeded function calls in the uncommon case to encapsulate logic -- implied directories are a niche
++		// usage that reduces the portability of an image.
++		uid, gid := options.IDMap.RootPair()
++
++		// Similar to [user.MkdirAllAndChown]
++		//
++		// [user.MkdirAllAndChown]: https://pkg.go.dev/github.com/moby/sys/user#MkdirAllAndChown
++		var cur string
++		for c := range strings.SplitSeq(parent, string(os.PathSeparator)) {
++			if c == "" {
++				continue
+ 			}
+-			// RootPair() is confined inside this loop as most cases will not require a call, so we can spend some
+-			// unneeded function calls in the uncommon case to encapsulate logic -- implied directories are a niche
+-			// usage that reduces the portability of an image.
+-			uid, gid := options.IDMap.RootPair()
++			cur = filepath.Join(cur, c)
++			if err := root.Mkdir(cur, ImpliedDirectoryMode); err != nil {
++				if !errors.Is(err, os.ErrExist) {
++					return err
++				}
+ 
+-			err = user.MkdirAllAndChown(parentPath, ImpliedDirectoryMode, uid, gid, user.WithOnlyNew)
++				fi, err := root.Stat(cur)
++				if err != nil {
++					return err
++				}
++				if fi.IsDir() {
++					continue
++				}
++				return &os.PathError{Op: "mkdir", Path: cur, Err: syscall.ENOTDIR}
++			}
++			if options.NoLchown {
++				continue
++			}
++			// Only the successful Mkdir case is newly-created.
++			dir, err := root.Open(cur)
+ 			if err != nil {
+ 				return err
+ 			}
++			if uid != 0 || gid != 0 {
++				if err := dir.Chown(uid, gid); err != nil {
++					_ = dir.Close()
++					return err
++				}
++			}
++			// root.Mkdir applies the mode subject to the process umask, so
++			// re-apply it with Chmod to guarantee ImpliedDirectoryMode
++			// independent of umask, matching the previous MkdirAllAndChown
++			// behavior.
++			if err := dir.Chmod(ImpliedDirectoryMode); err != nil {
++				_ = dir.Close()
++				return err
++			}
++			if err := dir.Close(); err != nil {
++				return err
++			}
+ 		}
+ 	}
+ 
+diff --git a/vendor/github.com/moby/go-archive/archive_linux.go b/vendor/github.com/moby/go-archive/archive_linux.go
+index bddef788cc..9341bc5997 100644
+--- a/vendor/github.com/moby/go-archive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/archive_linux.go
+@@ -76,7 +76,7 @@ func (c overlayWhiteoutConverter) ConvertWrite(hdr *tar.Header, filePath string,
+ 	}, nil
+ }
+ 
+-func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, filePath string) (bool, error) {
++func (c overlayWhiteoutConverter) ConvertRead(root *os.Root, hdr *tar.Header, filePath string) (bool, error) {
+ 	base := filepath.Base(filePath)
+ 	dir := filepath.Dir(filePath)
+ 
+@@ -85,9 +85,15 @@ func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, filePath string)
+ 		return false, fmt.Errorf("invalid whiteout entry %q", hdr.Name)
+ 
+ 	case WhiteoutOpaqueDir:
++		parent, err := root.Open(dir)
++		if err != nil {
++			return false, err
++		}
++		defer parent.Close()
++
+ 		// If a directory is marked as opaque by the AUFS special file, we need to translate that to overlay.
+-		if err := unix.Setxattr(dir, c.opaqueXattr, []byte{'y'}, 0); err != nil {
+-			return false, fmt.Errorf("setxattr('%s', %s=y): %w", dir, c.opaqueXattr, err)
++		if err := unix.Fsetxattr(int(parent.Fd()), c.opaqueXattr, []byte{'y'}, 0); err != nil {
++			return false, fmt.Errorf("fsetxattr('%s', %s=y): %w", dir, c.opaqueXattr, err)
+ 		}
+ 		// Don't write the whiteout file itself.
+ 		return false, nil
+@@ -98,9 +104,16 @@ func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, filePath string)
+ 			// Regular file.
+ 			return true, nil
+ 		}
++
++		parent, err := root.Open(dir)
++		if err != nil {
++			return false, err
++		}
++		defer parent.Close()
++
+ 		// If a file was deleted, and we are using overlay, we need to create a character device.
+ 		originalPath := filepath.Join(dir, originalBase)
+-		if err := unix.Mknod(originalPath, unix.S_IFCHR, 0); err != nil {
++		if err := unix.Mknodat(int(parent.Fd()), originalBase, unix.S_IFCHR, 0); err != nil {
+ 			return false, fmt.Errorf("failed to mknod('%s', S_IFCHR, 0): %w", originalPath, err)
+ 		}
+ 
+@@ -117,9 +130,9 @@ func (c overlayWhiteoutConverter) ConvertRead(hdr *tar.Header, filePath string)
+ 			// OverlayFS documents whiteouts in terms of a character device with device
+ 			// number 0:0, not ownership: https://docs.kernel.org/filesystems/overlayfs.html#whiteouts-and-opaque-directories
+ 			//
+-			// If ownership is not required, this Lchown can be removed to avoid the remaining TOCTOU window.
+-			if err := os.Lchown(originalPath, hdr.Uid, hdr.Gid); err != nil {
+-				return false, err
++			// If ownership is not required, this Fchownat can be removed to avoid the remaining TOCTOU window.
++			if err := unix.Fchownat(int(parent.Fd()), originalBase, hdr.Uid, hdr.Gid, unix.AT_SYMLINK_NOFOLLOW); err != nil {
++				return false, &os.PathError{Op: "lchown", Path: originalPath, Err: err}
+ 			}
+ 		}
+ 
+diff --git a/vendor/github.com/moby/go-archive/archive_unix.go b/vendor/github.com/moby/go-archive/archive_unix.go
+index b8b4cadab2..e2dcc4290f 100644
+--- a/vendor/github.com/moby/go-archive/archive_unix.go
++++ b/vendor/github.com/moby/go-archive/archive_unix.go
+@@ -8,6 +8,7 @@
+ 	"fmt"
+ 	"math"
+ 	"os"
++	"path"
+ 	"path/filepath"
+ 	"strings"
+ 	"syscall"
+@@ -59,7 +60,7 @@ func getFileUIDGID(stat any) (int, int, error) {
+ //
+ // Creating device nodes is not supported when running in a user namespace,
+ // produces a [syscall.EPERM] in most cases.
+-func handleTarTypeBlockCharFifo(hdr *tar.Header, dstPath string) error {
++func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, dstPath string) error {
+ 	mode := uint32(hdr.Mode & 0o7777)
+ 	switch hdr.Typeflag {
+ 	case tar.TypeBlock:
+@@ -80,20 +81,80 @@ func handleTarTypeBlockCharFifo(hdr *tar.Header, dstPath string) error {
+ 		return fmt.Errorf("device number %d:%d for %q out of range: %w", hdr.Devmajor, hdr.Devminor, hdr.Name, errInvalidArchive)
+ 	}
+ 
+-	return mknod(dstPath, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
++	// Prefer mknodat; fall back to a bounded path where unavailable.
++	return mknodInRoot(root, dstPath, mode, unix.Mkdev(uint32(hdr.Devmajor), uint32(hdr.Devminor)))
+ }
+ 
+-func handleLChmod(hdr *tar.Header, dstPath string, hdrInfo os.FileInfo) error {
+-	if hdr.Typeflag == tar.TypeLink {
+-		if fi, err := os.Lstat(hdr.Linkname); err == nil && (fi.Mode()&os.ModeSymlink == 0) {
+-			if err := os.Chmod(dstPath, hdrInfo.Mode()); err != nil {
+-				return err
+-			}
+-		}
+-	} else if hdr.Typeflag != tar.TypeSymlink {
+-		if err := os.Chmod(dstPath, hdrInfo.Mode()); err != nil {
+-			return err
++// handleLChmod applies the mode from hdrInfo to dstPath within root, skipping
++// symlinks (there is no lchmod). For hardlinks, the mode is applied only when
++// the link target is itself not a symlink.
++func handleLChmod(root *os.Root, dstPath string, hdr *tar.Header, hdrInfo os.FileInfo) error {
++	switch hdr.Typeflag {
++	case tar.TypeSymlink:
++		return nil
++
++	case tar.TypeLink:
++		// If the target is a symlink, there is no way to chmod the hardlink
++		// without following it.
++		fi, err := root.Lstat(filepath.FromSlash(path.Clean(hdr.Linkname)))
++		if err != nil || fi.Mode()&os.ModeSymlink != 0 {
++			return nil
+ 		}
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode())
++
++	default:
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode())
++	}
++}
++
++// chmodNoSymlink applies mode to a non-symlink entry.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlink(root *os.Root, name string, mode os.FileMode) error {
++	parent, err := root.OpenFile(filepath.Dir(name), os.O_RDONLY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	base := filepath.Base(name)
++	perm := fileModeToPerm(mode)
++	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
++	if err := unix.Fchmodat(int(parent.Fd()), base, perm, unix.AT_SYMLINK_NOFOLLOW); err == nil {
++		return nil
++	} else if !errors.Is(err, syscall.EOPNOTSUPP) {
++		return &os.PathError{Op: "fchmodat2", Path: name, Err: err}
++	}
++
++	// Fallback for systems that cannot perform fchmodat with AT_SYMLINK_NOFOLLOW.
++	// Open the entry without following symlinks and apply the mode through the
++	// resulting file descriptor.
++	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
++	fd, err := unix.Openat(int(parent.Fd()), base, unix.O_RDONLY|unix.O_NOFOLLOW|unix.O_NONBLOCK, 0)
++	if err != nil {
++		return &os.PathError{Op: "openat", Path: name, Err: err}
++	}
++	defer unix.Close(fd)
++
++	if err := unix.Fchmod(fd, perm); err != nil {
++		return &os.PathError{Op: "fchmod", Path: name, Err: err}
+ 	}
+ 	return nil
+ }
++
++// fileModeToPerm returns the subset of an os.FileMode that can be applied
++// by chmod.
++func fileModeToPerm(mode os.FileMode) uint32 {
++	perm := uint32(mode.Perm())
++
++	if mode&os.ModeSetuid != 0 {
++		perm |= unix.S_ISUID
++	}
++	if mode&os.ModeSetgid != 0 {
++		perm |= unix.S_ISGID
++	}
++	if mode&os.ModeSticky != 0 {
++		perm |= unix.S_ISVTX
++	}
++	return perm
++}
+diff --git a/vendor/github.com/moby/go-archive/archive_windows.go b/vendor/github.com/moby/go-archive/archive_windows.go
+index ee8dbd6830..ffe00a44d0 100644
+--- a/vendor/github.com/moby/go-archive/archive_windows.go
++++ b/vendor/github.com/moby/go-archive/archive_windows.go
+@@ -48,11 +48,12 @@ func getInodeFromStat(stat any) (uint64, error) {
+ 
+ // handleTarTypeBlockCharFifo is an OS-specific helper function used by
+ // createTarFile to handle the following types of header: Block; Char; Fifo
+-func handleTarTypeBlockCharFifo(hdr *tar.Header, path string) error {
++func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, path string) error {
+ 	return nil
+ }
+ 
+-func handleLChmod(hdr *tar.Header, path string, hdrInfo os.FileInfo) error {
++// handleLChmod is a no-op on Windows because chmod is not supported.
++func handleLChmod(root *os.Root, path string, hdr *tar.Header, hdrInfo os.FileInfo) error {
+ 	return nil
+ }
+ 
+diff --git a/vendor/github.com/moby/go-archive/dev_darwin.go b/vendor/github.com/moby/go-archive/dev_darwin.go
+new file mode 100644
+index 0000000000..fcfe730ce0
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/dev_darwin.go
+@@ -0,0 +1,21 @@
++//go:build darwin
++
++package archive
++
++import (
++	"os"
++
++	"golang.org/x/sys/unix"
++)
++
++func mknod(path string, mode uint32, dev uint64) error {
++	return unix.Mknod(path, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	abs, err := fsRootPath(root.Name(), path)
++	if err != nil {
++		return err
++	}
++	return unix.Mknod(abs, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
+diff --git a/vendor/github.com/moby/go-archive/dev_freebsd.go b/vendor/github.com/moby/go-archive/dev_freebsd.go
+index b3068fce91..d18e829b05 100644
+--- a/vendor/github.com/moby/go-archive/dev_freebsd.go
++++ b/vendor/github.com/moby/go-archive/dev_freebsd.go
+@@ -2,8 +2,23 @@
+ 
+ package archive
+ 
+-import "golang.org/x/sys/unix"
++import (
++	"os"
++	"path/filepath"
++
++	"golang.org/x/sys/unix"
++)
+ 
+ func mknod(path string, mode uint32, dev uint64) error {
+ 	return unix.Mknod(path, mode, dev)
+ }
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	parent, err := root.OpenFile(filepath.Dir(path), os.O_RDONLY|unix.O_DIRECTORY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	return unix.Mknodat(int(parent.Fd()), filepath.Base(path), mode, dev)
++}
+diff --git a/vendor/github.com/moby/go-archive/dev_unix.go b/vendor/github.com/moby/go-archive/dev_unix.go
+index 2f9833b85b..0eb8b6da5c 100644
+--- a/vendor/github.com/moby/go-archive/dev_unix.go
++++ b/vendor/github.com/moby/go-archive/dev_unix.go
+@@ -1,9 +1,24 @@
+-//go:build !windows && !freebsd
++//go:build !darwin && !freebsd && !windows
+ 
+ package archive
+ 
+-import "golang.org/x/sys/unix"
++import (
++	"os"
++	"path/filepath"
++
++	"golang.org/x/sys/unix"
++)
+ 
+ func mknod(path string, mode uint32, dev uint64) error {
+ 	return unix.Mknod(path, mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
+ }
++
++func mknodInRoot(root *os.Root, path string, mode uint32, dev uint64) error {
++	parent, err := root.OpenFile(filepath.Dir(path), os.O_RDONLY|unix.O_DIRECTORY, 0)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
++	return unix.Mknodat(int(parent.Fd()), filepath.Base(path), mode, int(dev)) // #nosec G115 -- Required conversion for the platform-specific Mknod API.
++}
+diff --git a/vendor/github.com/moby/go-archive/diff.go b/vendor/github.com/moby/go-archive/diff.go
+index b2fdf770a6..75b84f97ca 100644
+--- a/vendor/github.com/moby/go-archive/diff.go
++++ b/vendor/github.com/moby/go-archive/diff.go
+@@ -7,8 +7,8 @@
+ 	"fmt"
+ 	"io"
+ 	"os"
++	"path"
+ 	"path/filepath"
+-	"runtime"
+ 	"strings"
+ 
+ 	"github.com/containerd/log"
+@@ -20,9 +20,17 @@
+ // compressed or uncompressed.
+ // Returns the size in bytes of the contents of the layer.
+ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64, err error) {
++	root, err := os.OpenRoot(dest)
++	if err != nil {
++		return 0, err
++	}
++	defer root.Close()
++
+ 	tr := tar.NewReader(layer)
+ 
+-	var dirs []*tar.Header
++	var dirs []unpackedDir
++	// unpackedPaths tracks root-relative paths already written in this layer
++	// so that the AUFS opaque-whiteout walk knows which paths to preserve.
+ 	unpackedPaths := make(map[string]struct{})
+ 
+ 	if options == nil {
+@@ -45,32 +53,26 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 
+ 		size += hdr.Size
+ 
+-		// Normalize name, for safety and for a simple is-root check
+-		hdr.Name = filepath.Clean(hdr.Name)
+-
+-		// Windows does not support filenames with colons in them. Ignore
+-		// these files. This is not a problem though (although it might
+-		// appear that it is). Let's suppose a client is running docker pull.
+-		// The daemon it points to is Windows. Would it make sense for the
+-		// client to be doing a docker pull Ubuntu for example (which has files
+-		// with colons in the name under /usr/share/man/man3)? No, absolutely
+-		// not as it would really only make sense that they were pulling a
+-		// Windows image. However, for development, it is necessary to be able
+-		// to pull Linux images which are in the repository.
+-		//
+-		// TODO Windows. Once the registry is aware of what images are Windows-
+-		// specific or Linux-specific, this warning should be changed to an error
+-		// to cater for the situation where someone does manage to upload a Linux
+-		// image but have it tagged as Windows inadvertently.
+-		if runtime.GOOS == "windows" {
+-			if strings.Contains(hdr.Name, ":") {
+-				log.G(context.TODO()).Warnf("Windows: Ignoring %s (is this a Linux image?)", hdr.Name)
+-				continue
+-			}
++		// Strip a leading "/" so absolute entries stay root-relative, and
++		// normalize the POSIX tar path. Skip entries referring to the extraction
++		// root and reject paths that escape it.
++		name := path.Clean(strings.TrimLeft(hdr.Name, "/"))
++		if name == "." {
++			continue
++		}
++		if !filepath.IsLocal(name) {
++			return 0, breakoutError(fmt.Errorf("invalid entry name %q", hdr.Name))
++		}
++		hdr.Name = name
++
++		// Skip entries whose name (or hardlink target) Windows cannot represent.
++		if err := unrepresentableOnWindows(hdr); err != nil {
++			log.G(context.TODO()).Warnf("Windows: ignoring entry: %v", err)
++			continue
+ 		}
+ 
+ 		// Ensure that the parent directory exists.
+-		err = createImpliedDirectories(dest, hdr, options)
++		err = createImpliedDirectories(root, hdr, options)
+ 		if err != nil {
+ 			return 0, err
+ 		}
+@@ -81,7 +83,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			// We don't want this directory, but we need the files in them so that
+ 			// such hardlinks can be resolved.
+ 			if strings.HasPrefix(hdr.Name, WhiteoutLinkDir) && hdr.Typeflag == tar.TypeReg {
+-				basename := filepath.Base(hdr.Name)
++				basename := path.Base(hdr.Name)
+ 				aufsHardlinks[basename] = hdr
+ 				if aufsTempdir == "" {
+ 					if aufsTempdir, err = os.MkdirTemp(dest, "dockerplnk"); err != nil {
+@@ -89,47 +91,63 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 					}
+ 					defer os.RemoveAll(aufsTempdir)
+ 				}
+-				if err := createTarFile(filepath.Join(aufsTempdir, basename), dest, hdr, tr, options); err != nil {
++				aufsRoot, err := os.OpenRoot(aufsTempdir)
++				if err != nil {
+ 					return 0, err
+ 				}
++				cerr := createTarFile(aufsRoot, basename, hdr, tr, options)
++				_ = aufsRoot.Close()
++				if cerr != nil {
++					return 0, cerr
++				}
+ 			}
+ 
+ 			if hdr.Name != WhiteoutOpaqueDir {
+ 				continue
+ 			}
+ 		}
+-		// #nosec G305 -- The joined path is guarded against path traversal.
+-		dstPath := filepath.Join(dest, hdr.Name)
+-		rel, err := filepath.Rel(dest, dstPath)
+-		if err != nil {
+-			return 0, err
+-		}
+-
+-		// Note as these operations are platform specific, so must the slash be.
+-		if strings.HasPrefix(rel, ".."+string(os.PathSeparator)) {
+-			return 0, breakoutError(fmt.Errorf("%q is outside of %q", hdr.Name, dest))
+-		}
++		// dstPath is the native (host-separator) form of the entry name,
++		// used at all filesystem boundaries (os.Root methods, fsRootPath).
++		// The tar-header name (hdr.Name) is POSIX, so convert it here.
++		dstPath := filepath.FromSlash(hdr.Name)
+ 		base := filepath.Base(dstPath)
+ 
+ 		if strings.HasPrefix(base, WhiteoutPrefix) {
+ 			dir := filepath.Dir(dstPath)
+ 			if base == WhiteoutOpaqueDir {
+-				_, err := os.Lstat(dir)
++				_, err := root.Lstat(dir)
+ 				if err != nil {
+ 					return 0, err
+ 				}
+-				err = filepath.WalkDir(dir, func(path string, info os.DirEntry, err error) error {
++				// Walk the absolute directory so we can call os.RemoveAll on
++				// paths outside the walk callback's reach, then convert each
++				// walked path back to a root-relative name for the
++				// unpackedPaths check.
++				// fsRootPath walks each path component and bounds any symlinks
++				// within the root to prevent TOCTOU symlink attacks.
++				absDir, err := fsRootPath(root.Name(), dir)
++				if err != nil {
++					return 0, err
++				}
++				err = filepath.WalkDir(absDir, func(p string, info os.DirEntry, err error) error {
+ 					if err != nil {
+ 						if os.IsNotExist(err) {
+-							err = nil // parent was deleted
++							return nil // parent was deleted
+ 						}
+ 						return err
+ 					}
+-					if path == dir {
++					if p == absDir {
+ 						return nil
+ 					}
+-					if _, exists := unpackedPaths[path]; !exists {
+-						return os.RemoveAll(path) // #nosec G122 -- FIXME: consider root-scoped APIs (e.g. os.Root) to prevent symlink TOCTOU traversal
++					rel, err := filepath.Rel(root.Name(), p)
++					if err != nil {
++						return err
++					}
++
++					// unpackedPaths is keyed by root-relative slash paths; convert
++					// filepath.WalkDir's native path before looking it up.
++					if _, exists := unpackedPaths[filepath.ToSlash(rel)]; !exists {
++						return root.RemoveAll(rel)
+ 					}
+ 					return nil
+ 				})
+@@ -139,7 +157,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			} else {
+ 				originalBase := base[len(WhiteoutPrefix):]
+ 				originalPath := filepath.Join(dir, originalBase)
+-				if err := os.RemoveAll(originalPath); err != nil {
++				if err := root.RemoveAll(originalPath); err != nil {
+ 					return 0, err
+ 				}
+ 			}
+@@ -148,9 +166,9 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 			// The only exception is when it is a directory *and* the file from
+ 			// the layer is also a directory. Then we want to merge them (i.e.
+ 			// just apply the metadata from the layer).
+-			if fi, err := os.Lstat(dstPath); err == nil {
++			if fi, err := root.Lstat(dstPath); err == nil {
+ 				if !fi.IsDir() || hdr.Typeflag != tar.TypeDir {
+-					if err := os.RemoveAll(dstPath); err != nil {
++					if err := root.RemoveAll(dstPath); err != nil {
+ 						return 0, err
+ 					}
+ 				}
+@@ -161,8 +179,8 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 
+ 			// Hard links into /.wh..wh.plnk don't work, as we don't extract that directory, so
+ 			// we manually retarget these into the temporary files we extracted them into
+-			if hdr.Typeflag == tar.TypeLink && strings.HasPrefix(filepath.Clean(hdr.Linkname), WhiteoutLinkDir) {
+-				linkBasename := filepath.Base(hdr.Linkname)
++			if hdr.Typeflag == tar.TypeLink && strings.HasPrefix(path.Clean(hdr.Linkname), WhiteoutLinkDir) {
++				linkBasename := path.Base(hdr.Linkname)
+ 				srcHdr = aufsHardlinks[linkBasename]
+ 				if srcHdr == nil {
+ 					return 0, errors.New("invalid aufs hardlink")
+@@ -179,23 +197,23 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 				return 0, err
+ 			}
+ 
+-			if err := createTarFile(dstPath, dest, srcHdr, srcData, options); err != nil {
++			if err := createTarFile(root, dstPath, srcHdr, srcData, options); err != nil {
+ 				return 0, err
+ 			}
+ 
+ 			// Directory mtimes must be handled at the end to avoid further
+ 			// file creation in them to modify the directory mtime
+ 			if hdr.Typeflag == tar.TypeDir {
+-				dirs = append(dirs, hdr)
++				dirs = append(dirs, unpackedDir{hdr: hdr, name: dstPath})
+ 			}
+-			unpackedPaths[dstPath] = struct{}{}
++			// unpackedPaths is keyed by the POSIX (forward-slash) name so it
++			// matches the ToSlash'd lookup in the opaque-whiteout walk above.
++			unpackedPaths[hdr.Name] = struct{}{}
+ 		}
+ 	}
+ 
+-	for _, hdr := range dirs {
+-		// #nosec G305 -- The header was checked for path traversal before it was appended to the dirs slice.
+-		dstPath := filepath.Join(dest, hdr.Name)
+-		if err := chtimes(dstPath, hdr.AccessTime, hdr.ModTime); err != nil {
++	for _, d := range dirs {
++		if err := root.Chtimes(d.name, boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime)), boundTime(d.hdr.ModTime)); err != nil {
+ 			return 0, err
+ 		}
+ 	}
+diff --git a/vendor/github.com/moby/go-archive/rootpath.go b/vendor/github.com/moby/go-archive/rootpath.go
+new file mode 100644
+index 0000000000..3834af2c4d
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/rootpath.go
+@@ -0,0 +1,112 @@
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
++package archive
++
++import (
++	"errors"
++	"os"
++	"path/filepath"
++)
++
++var errTooManyLinks = errors.New("too many links")
++
++// fsRootPath joins a path with a root, evaluating and bounding any
++// symlink to the root directory.
++func fsRootPath(root, path string) (string, error) {
++	if path == "" {
++		return root, nil
++	}
++	var linksWalked int // to protect against cycles
++	for {
++		i := linksWalked
++		newpath, err := walkLinks(root, path, &linksWalked)
++		if err != nil {
++			return "", err
++		}
++		path = newpath
++		if i == linksWalked {
++			newpath = filepath.Join(string(os.PathSeparator), newpath)
++			if path == newpath {
++				return filepath.Join(root, newpath), nil
++			}
++			path = newpath
++		}
++	}
++}
++
++func walkLink(root, path string, linksWalked *int) (newpath string, islink bool, err error) {
++	if *linksWalked > 255 {
++		return "", false, errTooManyLinks
++	}
++
++	path = filepath.Join(string(os.PathSeparator), path)
++	if path == string(os.PathSeparator) {
++		return path, false, nil
++	}
++	realPath := filepath.Join(root, path)
++
++	fi, err := os.Lstat(realPath)
++	if err != nil {
++		// If path does not yet exist, treat as non-symlink
++		if os.IsNotExist(err) {
++			return path, false, nil
++		}
++		return "", false, err
++	}
++	if fi.Mode()&os.ModeSymlink == 0 {
++		return path, false, nil
++	}
++	newpath, err = os.Readlink(realPath)
++	if err != nil {
++		return "", false, err
++	}
++	*linksWalked++
++	return newpath, true, nil
++}
++
++func walkLinks(root, path string, linksWalked *int) (string, error) {
++	switch dir, file := filepath.Split(path); {
++	case dir == "":
++		newpath, _, err := walkLink(root, file, linksWalked)
++		return newpath, err
++	case file == "":
++		if os.IsPathSeparator(dir[len(dir)-1]) {
++			if dir == string(os.PathSeparator) {
++				return dir, nil
++			}
++			return walkLinks(root, dir[:len(dir)-1], linksWalked)
++		}
++		newpath, _, err := walkLink(root, dir, linksWalked)
++		return newpath, err
++	default:
++		newdir, err := walkLinks(root, dir, linksWalked)
++		if err != nil {
++			return "", err
++		}
++		newpath, islink, err := walkLink(root, filepath.Join(newdir, file), linksWalked)
++		if err != nil {
++			return "", err
++		}
++		if !islink {
++			return newpath, nil
++		}
++		if filepath.IsAbs(newpath) {
++			return newpath, nil
++		}
++		return filepath.Join(newdir, newpath), nil
++	}
++}
+diff --git a/vendor/github.com/moby/go-archive/sequential_other.go b/vendor/github.com/moby/go-archive/sequential_other.go
+new file mode 100644
+index 0000000000..90edb13933
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_other.go
+@@ -0,0 +1,6 @@
++//go:build !windows
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN is not supported on go < 1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0
+diff --git a/vendor/github.com/moby/go-archive/sequential_windows_go126.go b/vendor/github.com/moby/go-archive/sequential_windows_go126.go
+new file mode 100644
+index 0000000000..1e80d11b73
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_windows_go126.go
+@@ -0,0 +1,9 @@
++//go:build windows && go1.26
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN matches [golang.org/x/sys/windows.O_FILE_FLAG_SEQUENTIAL_SCAN].
++// Starting in Go 1.26, os.OpenFile supports passing this flag through.
++//
++// TODO(thaJeztah): use windows.O_FILE_FLAG_SEQUENTIAL_SCAN once we drop Go <1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0x08000000
+diff --git a/vendor/github.com/moby/go-archive/sequential_windows_pre126.go b/vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+new file mode 100644
+index 0000000000..2b281741ae
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/sequential_windows_pre126.go
+@@ -0,0 +1,6 @@
++//go:build windows && !go1.26
++
++package archive
++
++// windows_O_FILE_FLAG_SEQUENTIAL_SCAN is not supported on go < 1.26.
++const windows_O_FILE_FLAG_SEQUENTIAL_SCAN = 0
+diff --git a/vendor/github.com/moby/go-archive/time_nonwindows.go b/vendor/github.com/moby/go-archive/time_nonwindows.go
+index 5bfdfa2f17..f959b9009a 100644
+--- a/vendor/github.com/moby/go-archive/time_nonwindows.go
++++ b/vendor/github.com/moby/go-archive/time_nonwindows.go
+@@ -3,7 +3,12 @@
+ package archive
+ 
+ import (
++	"errors"
+ 	"os"
++	"path"
++	"path/filepath"
++	"strings"
++	"syscall"
+ 	"time"
+ 
+ 	"golang.org/x/sys/unix"
+@@ -28,14 +33,33 @@ func timeToTimespec(time time.Time) unix.Timespec {
+ 	return unix.NsecToTimespec(time.UnixNano())
+ }
+ 
+-func lchtimes(name string, atime time.Time, mtime time.Time) error {
++func lchtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	dir, base := path.Split(filepath.ToSlash(name))
++	if base == "" {
++		return &os.PathError{Op: "lchtimes", Path: name, Err: syscall.EINVAL}
++	}
++
++	dir = strings.TrimSuffix(dir, "/")
++	if dir == "" {
++		dir = "."
++	}
++
++	parent, err := root.Open(dir)
++	if err != nil {
++		return err
++	}
++	defer parent.Close()
++
+ 	utimes := [2]unix.Timespec{
+ 		timeToTimespec(atime),
+ 		timeToTimespec(mtime),
+ 	}
+-	err := unix.UtimesNanoAt(unix.AT_FDCWD, name, utimes[0:], unix.AT_SYMLINK_NOFOLLOW)
+-	if err != nil && err != unix.ENOSYS {
+-		return err
++	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
++	if err := unix.UtimesNanoAt(int(parent.Fd()), base, utimes[:], unix.AT_SYMLINK_NOFOLLOW); err != nil {
++		if errors.Is(err, unix.ENOSYS) {
++			return nil
++		}
++		return &os.PathError{Op: "lchtimes", Path: name, Err: err}
+ 	}
+-	return err
++	return nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/time_windows.go b/vendor/github.com/moby/go-archive/time_windows.go
+index af1f7c8f3a..c4a007fb7a 100644
+--- a/vendor/github.com/moby/go-archive/time_windows.go
++++ b/vendor/github.com/moby/go-archive/time_windows.go
+@@ -27,6 +27,6 @@ func chtimes(name string, atime time.Time, mtime time.Time) error {
+ 	return windows.SetFileTime(h, &c, nil, nil)
+ }
+ 
+-func lchtimes(name string, atime time.Time, mtime time.Time) error {
++func lchtimes(root *os.Root, name string, atime time.Time, mtime time.Time) error {
+ 	return nil
+ }
+-- 
+2.35.6
+
diff --git a/recipes-containers/docker/files/CVE-2026-17106-dependent_p3.patch b/recipes-containers/docker/files/CVE-2026-17106-dependent_p3.patch
new file mode 100644
index 00000000..60aafa18
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106-dependent_p3.patch
@@ -0,0 +1,121 @@
+From 07ad2750f6f6b905e2d07f6e5fb1e9111fe1c37f Mon Sep 17 00:00:00 2001
+From: Mend Renovate <bot@renovateapp.com>
+Date: Wed, 29 Jul 2026 10:39:27 +0000
+Subject: [PATCH] fix(deps): update github.com/moby/go-archive digest to
+ a11565d
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/07ad2750f6f6b905e2d07f6e5fb1e9111fe1c37f]
+
+Backport Changes:
+- Omit go.mod, go.sum, and vendor/modules.txt updates, including the
+  pseudo-version digest, to keep go-archive at v0.2.0. Retain the archive
+  and time source changes required by the following CVE patch.
+
+Signed-off-by: Mend Renovate <bot@renovateapp.com>
+(cherry picked from commit 07ad2750f6f6b905e2d07f6e5fb1e9111fe1c37f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ vendor/github.com/moby/go-archive/archive.go  |  2 ++
+ vendor/github.com/moby/go-archive/time.go     |  4 +++
+ .../moby/go-archive/time_nonwindows.go        | 31 ++++++++++---------
+ .../moby/go-archive/time_windows.go           |  5 +++
+ 4 files changed, 27 insertions(+), 15 deletions(-)
+
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index 1654a07333..4a247c5f50 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -123,6 +123,8 @@ func breakoutError(err error) error {
+ 	return &breakoutErr{error: err}
+ }
+ 
++func (e *breakoutErr) Unwrap() error { return e.error }
++
+ const (
+ 	AUFSWhiteoutFormat    WhiteoutFormat = 0 // AUFSWhiteoutFormat is the default format for whiteouts
+ 	OverlayWhiteoutFormat WhiteoutFormat = 1 // OverlayWhiteoutFormat formats whiteout according to the overlay standard.
+diff --git a/vendor/github.com/moby/go-archive/time.go b/vendor/github.com/moby/go-archive/time.go
+index 4e9ae95084..fb8c0299b9 100644
+--- a/vendor/github.com/moby/go-archive/time.go
++++ b/vendor/github.com/moby/go-archive/time.go
+@@ -22,6 +22,10 @@ func init() {
+ 	}
+ }
+ 
++// boundTime returns t if it falls within the range supported by os.Chtimes.
++// Times before the Unix epoch (minTime) or after the end of Unix time
++// (maxTime) are replaced with minTime, as os.Chtimes has undefined behavior
++// outside that range.
+ func boundTime(t time.Time) time.Time {
+ 	if t.Before(minTime) || t.After(maxTime) {
+ 		return minTime
+diff --git a/vendor/github.com/moby/go-archive/time_nonwindows.go b/vendor/github.com/moby/go-archive/time_nonwindows.go
+index f959b9009a..5fa042ec27 100644
+--- a/vendor/github.com/moby/go-archive/time_nonwindows.go
++++ b/vendor/github.com/moby/go-archive/time_nonwindows.go
+@@ -14,25 +14,15 @@
+ 	"golang.org/x/sys/unix"
+ )
+ 
+-// chtimes changes the access time and modified time of a file at the given path.
+-// If the modified time is prior to the Unix Epoch (unixMinTime), or after the
+-// end of Unix Time (unixEpochTime), os.Chtimes has undefined behavior. In this
+-// case, Chtimes defaults to Unix Epoch, just in case.
++// chtimes changes the access and modification time of a file at the given
++// path.
++//
++// Callers must use boundTime to ensure timestamps are within the range
++// supported by os.Chtimes.
+ func chtimes(name string, atime time.Time, mtime time.Time) error {
+ 	return os.Chtimes(name, atime, mtime)
+ }
+ 
+-func timeToTimespec(time time.Time) unix.Timespec {
+-	if time.IsZero() {
+-		// Return UTIME_OMIT special value
+-		return unix.Timespec{
+-			Sec:  0,
+-			Nsec: (1 << 30) - 2,
+-		}
+-	}
+-	return unix.NsecToTimespec(time.UnixNano())
+-}
+-
+ func lchtimes(root *os.Root, name string, atime, mtime time.Time) error {
+ 	dir, base := path.Split(filepath.ToSlash(name))
+ 	if base == "" {
+@@ -63,3 +53,14 @@ func lchtimes(root *os.Root, name string, atime, mtime time.Time) error {
+ 	}
+ 	return nil
+ }
++
++func timeToTimespec(time time.Time) unix.Timespec {
++	if time.IsZero() {
++		// Return UTIME_OMIT special value
++		return unix.Timespec{
++			Sec:  0,
++			Nsec: (1 << 30) - 2,
++		}
++	}
++	return unix.NsecToTimespec(time.UnixNano())
++}
+diff --git a/vendor/github.com/moby/go-archive/time_windows.go b/vendor/github.com/moby/go-archive/time_windows.go
+index c4a007fb7a..aaa3399f73 100644
+--- a/vendor/github.com/moby/go-archive/time_windows.go
++++ b/vendor/github.com/moby/go-archive/time_windows.go
+@@ -7,6 +7,11 @@
+ 	"golang.org/x/sys/windows"
+ )
+ 
++// chtimes changes the access and modification time of a file at the given
++// path.
++//
++// Callers must use boundTime to ensure timestamps are within the range
++// supported by os.Chtimes.
+ func chtimes(name string, atime time.Time, mtime time.Time) error {
+ 	if err := os.Chtimes(name, atime, mtime); err != nil {
+ 		return err
+-- 
+2.35.6
+
diff --git a/recipes-containers/docker/files/CVE-2026-17106-regression.patch b/recipes-containers/docker/files/CVE-2026-17106-regression.patch
new file mode 100644
index 00000000..a2a687e8
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106-regression.patch
@@ -0,0 +1,423 @@
+From 2a3ab8fcc0c5e4b9bfce4577e7baddc842032298 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Tue, 4 Aug 2026 21:07:17 +0200
+Subject: [PATCH] vendor: github.com/moby/go-archive v0.3.3
+
+- Fix a regression introduced in v0.3.0 that caused archive extraction
+  to reject hardlinks with absolute targets, as produced by some image
+  builders. Absolute hardlink targets are now resolved relative to the
+  extraction root, while paths that escape the root remain rejected.
+- Fix a regression introduced in v0.3.0 that caused archive extraction
+  to fail when applying permissions to device nodes, including nodes on
+  `nodev` filesystems and `dev/ptmx`. Device nodes are now referenced
+  without opening the underlying device before applying their mode.
+- Set close-on-exec on file descriptors used by the Linux permission
+  fallback to prevent them from leaking into child processes.
+
+full diff: https://github.com/moby/go-archive/compare/v0.3.2...v0.3.3
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/2a3ab8fcc0c5e4b9bfce4577e7baddc842032298]
+
+Backport Changes:
+- Adapted the upstream hunks to the v29.3.0 source, which has inline
+  hardlink handling and older chmod helper signatures. The original
+  v0.3.3 hunks did not apply to this source.
+- Keep go-archive module metadata at v0.2.0; omit the upstream go.mod
+  and go.sum version changes. Add only the vendored internal package
+  entry needed by the copied source.
+
+Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
+(cherry picked from commit 2a3ab8fcc0c5e4b9bfce4577e7baddc842032298)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+diff --git a/daemon/archive_unix.go b/daemon/archive_unix.go
+index cc6264f..99937b6 100644
+--- a/daemon/archive_unix.go
++++ b/daemon/archive_unix.go
+@@ -107,6 +107,12 @@ func (daemon *Daemon) containerExtractToDir(container *container.Container, path
+ 	}
+ 	defer cfs.Close()
+ 
++	options, cleanup, err := archive.WithProcSelfFD(daemon.defaultTarCopyOptions(allowOverwriteDirWithFile))
++	if err != nil {
++		return err
++	}
++	defer cleanup()
++
+ 	err = cfs.RunInFS(context.TODO(), func() error {
+ 		// The destination path needs to be resolved with all symbolic links
+ 		// followed. Note that we need to also evaluate the last path element if
+@@ -131,16 +137,16 @@ func (daemon *Daemon) containerExtractToDir(container *container.Container, path
+ 			return err
+ 		}
+ 
+-		options := daemon.defaultTarCopyOptions(allowOverwriteDirWithFile)
+-
+ 		if copyUIDGID {
+-			var err error
+-			// tarCopyOptions will appropriately pull in the right uid/gid for the
+-			// user/group and will set the options.
+-			options, err = daemon.tarCopyOptions(container, allowOverwriteDirWithFile)
++			// Resolve the container's configured user in the container filesystem,
++			// then preserve the pre-opened proc fd while copying the options.
++			copyOptions, err := daemon.tarCopyOptions(container, allowOverwriteDirWithFile)
+ 			if err != nil {
+ 				return err
+ 			}
++			options.NoOverwriteDirNonDir = copyOptions.NoOverwriteDirNonDir
++			options.IDMap = copyOptions.IDMap
++			options.ChownOpts = copyOptions.ChownOpts
+ 		}
+ 
+ 		return archive.Untar(content, absPath, options)
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index 4d9e87d..508ac39 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -17,6 +17,7 @@
+ 	"time"
+ 
+ 	"github.com/containerd/log"
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"github.com/moby/patternmatcher"
+ 	"github.com/moby/sys/sequential"
+ 	"github.com/moby/sys/user"
+@@ -81,9 +82,22 @@
+ 		// were probably in the archive for a reason, so set this option at
+ 		// your own peril.
+ 		BestEffortXattrs bool
++
++		// internalOptions contains options for use by packages within this module.
++		internalOptions *archiveoptions.Options
+ 	}
+ )
+ 
++// WithProcSelfFD returns a copy of opts prepared for extraction in a
++// filesystem context where /proc/self/fd may not be accessible by path.
++//
++// The caller must invoke the returned cleanup function after extraction
++// completes. On platforms that do not use /proc/self/fd for extraction,
++// the returned cleanup function is a no-op.
++func WithProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	return withProcSelfFD(opts)
++}
++
+ // Archiver implements the Archiver interface and allows the reuse of most utility functions of
+ // this package with a pluggable Untar function. Also, to facilitate the passing of specific id
+ // mappings for untar, an Archiver can be created with maps which will then be passed to Untar operations.
+@@ -447,6 +461,7 @@ func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Rea
+ 		Lchown                     = true
+ 		inUserns, bestEffortXattrs bool
+ 		chownOpts                  *ChownOpts
++		internalOpts               *archiveoptions.Options
+ 	)
+ 
+ 	// TODO(thaJeztah): make opts a required argument.
+@@ -455,6 +470,7 @@ func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Rea
+ 		inUserns = opts.InUserNS // TODO(thaJeztah): consider deprecating opts.InUserNS and detect locally.
+ 		chownOpts = opts.ChownOpts
+ 		bestEffortXattrs = opts.BestEffortXattrs
++		internalOpts = opts.internalOptions
+ 	}
+ 
+ 	// hdr.Mode is in linux format, which we can use for sycalls,
+@@ -514,6 +530,13 @@ func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Rea
+ 		// Defence in depth: root.Link's containment is limited when
+ 		// dest is a volume root.
+ 		linkname := path.Clean(hdr.Linkname)
++		if strings.HasPrefix(linkname, "/") {
++			// Some image builders (e.g. kaniko) write hardlink targets as absolute
++			// paths. Resolve those relative to the extraction root, with chroot-like
++			// semantics matching absolute symlink targets. Strip the root from the
++			// original linkname so that ".." components are rejected below.
++			linkname = path.Clean(strings.TrimLeft(hdr.Linkname, "/"))
++		}
+ 		if linkname == "." || !filepath.IsLocal(linkname) {
+ 			return breakoutError(fmt.Errorf("invalid hardlink target %q", hdr.Linkname))
+ 		}
+@@ -593,7 +616,7 @@ func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Rea
+ 
+ 	// There is no LChmod, so ignore mode for symlink. Also, this
+ 	// must happen after chown, as that can modify the file mode
+-	if err := handleLChmod(root, dstPath, hdr, hdrInfo); err != nil {
++	if err := handleLChmod(root, dstPath, hdr, hdrInfo, internalOpts); err != nil {
+ 		return err
+ 	}
+ 
+diff --git a/vendor/github.com/moby/go-archive/archive_linux.go b/vendor/github.com/moby/go-archive/archive_linux.go
+index 9341bc5..92cb2a8 100644
+--- a/vendor/github.com/moby/go-archive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/archive_linux.go
+@@ -8,10 +8,24 @@
+ 	"path/filepath"
+ 	"strings"
+ 
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"github.com/moby/sys/userns"
+ 	"golang.org/x/sys/unix"
+ )
+ 
++func withProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	procSelfFD, err := os.Open("/proc/self/fd")
++	if err != nil {
++		return nil, nil, err
++	}
++	var prepared TarOptions
++	if opts != nil {
++		prepared = *opts
++	}
++	prepared.internalOptions = &archiveoptions.Options{ProcSelfFD: procSelfFD}
++	return &prepared, func() { _ = procSelfFD.Close() }, nil
++}
++
+ func getWhiteoutConverter(format WhiteoutFormat) tarWhiteoutConverter {
+ 	if format == OverlayWhiteoutFormat {
+ 		return newOverlayWhiteoutConverter()
+diff --git a/vendor/github.com/moby/go-archive/archive_other.go b/vendor/github.com/moby/go-archive/archive_other.go
+index 6495549..c8fe043 100644
+--- a/vendor/github.com/moby/go-archive/archive_other.go
++++ b/vendor/github.com/moby/go-archive/archive_other.go
+@@ -2,6 +2,14 @@
+ 
+ package archive
+ 
++func withProcSelfFD(opts *TarOptions) (*TarOptions, func(), error) {
++	var prepared TarOptions
++	if opts != nil {
++		prepared = *opts
++	}
++	return &prepared, func() {}, nil
++}
++
+ func getWhiteoutConverter(format WhiteoutFormat) tarWhiteoutConverter {
+ 	return nil
+ }
+diff --git a/vendor/github.com/moby/go-archive/archive_unix.go b/vendor/github.com/moby/go-archive/archive_unix.go
+index e2dcc42..046ef97 100644
+--- a/vendor/github.com/moby/go-archive/archive_unix.go
++++ b/vendor/github.com/moby/go-archive/archive_unix.go
+@@ -13,6 +13,7 @@
+ 	"strings"
+ 	"syscall"
+ 
++	"github.com/moby/go-archive/internal/archiveoptions"
+ 	"golang.org/x/sys/unix"
+ )
+ 
+@@ -88,7 +89,7 @@ func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, dstPath string)
+ // handleLChmod applies the mode from hdrInfo to dstPath within root, skipping
+ // symlinks (there is no lchmod). For hardlinks, the mode is applied only when
+ // the link target is itself not a symlink.
+-func handleLChmod(root *os.Root, dstPath string, hdr *tar.Header, hdrInfo os.FileInfo) error {
++func handleLChmod(root *os.Root, dstPath string, hdr *tar.Header, hdrInfo os.FileInfo, opts *archiveoptions.Options) error {
+ 	switch hdr.Typeflag {
+ 	case tar.TypeSymlink:
+ 		return nil
+@@ -100,17 +101,17 @@ func handleLChmod(root *os.Root, dstPath string, hdr *tar.Header, hdrInfo os.Fil
+ 		if err != nil || fi.Mode()&os.ModeSymlink != 0 {
+ 			return nil
+ 		}
+-		return chmodNoSymlink(root, dstPath, hdrInfo.Mode())
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode(), opts)
+ 
+ 	default:
+-		return chmodNoSymlink(root, dstPath, hdrInfo.Mode())
++		return chmodNoSymlink(root, dstPath, hdrInfo.Mode(), opts)
+ 	}
+ }
+ 
+ // chmodNoSymlink applies mode to a non-symlink entry.
+ //
+ // Callers must have already excluded symlink entries.
+-func chmodNoSymlink(root *os.Root, name string, mode os.FileMode) error {
++func chmodNoSymlink(root *os.Root, name string, mode os.FileMode, opts *archiveoptions.Options) error {
+ 	parent, err := root.OpenFile(filepath.Dir(name), os.O_RDONLY, 0)
+ 	if err != nil {
+ 		return err
+@@ -127,19 +128,7 @@ func chmodNoSymlink(root *os.Root, name string, mode os.FileMode) error {
+ 	}
+ 
+ 	// Fallback for systems that cannot perform fchmodat with AT_SYMLINK_NOFOLLOW.
+-	// Open the entry without following symlinks and apply the mode through the
+-	// resulting file descriptor.
+-	// #nosec G115 -- ignore integer overflow conversion for parent.Fd
+-	fd, err := unix.Openat(int(parent.Fd()), base, unix.O_RDONLY|unix.O_NOFOLLOW|unix.O_NONBLOCK, 0)
+-	if err != nil {
+-		return &os.PathError{Op: "openat", Path: name, Err: err}
+-	}
+-	defer unix.Close(fd)
+-
+-	if err := unix.Fchmod(fd, perm); err != nil {
+-		return &os.PathError{Op: "fchmod", Path: name, Err: err}
+-	}
+-	return nil
++	return chmodNoSymlinkFallback(int(parent.Fd()), base, name, perm, opts) // #nosec G115 -- ignore integer overflow conversion for parent.Fd
+ }
+ 
+ // fileModeToPerm returns the subset of an os.FileMode that can be applied
+diff --git a/vendor/github.com/moby/go-archive/archive_windows.go b/vendor/github.com/moby/go-archive/archive_windows.go
+index ffe00a4..9eeb08a 100644
+--- a/vendor/github.com/moby/go-archive/archive_windows.go
++++ b/vendor/github.com/moby/go-archive/archive_windows.go
+@@ -53,7 +53,7 @@ func handleTarTypeBlockCharFifo(root *os.Root, hdr *tar.Header, path string) err
+ }
+ 
+ // handleLChmod is a no-op on Windows because chmod is not supported.
+-func handleLChmod(root *os.Root, path string, hdr *tar.Header, hdrInfo os.FileInfo) error {
++func handleLChmod(root *os.Root, path string, hdr *tar.Header, hdrInfo os.FileInfo, opts any) error {
+ 	return nil
+ }
+ 
+diff --git a/vendor/github.com/moby/go-archive/chmod_linux.go b/vendor/github.com/moby/go-archive/chmod_linux.go
+new file mode 100644
+index 0000000..995d1dc
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/chmod_linux.go
+@@ -0,0 +1,38 @@
++package archive
++
++import (
++	"fmt"
++	"os"
++	"runtime"
++	"strconv"
++
++	"github.com/moby/go-archive/internal/archiveoptions"
++	"golang.org/x/sys/unix"
++)
++
++// chmodNoSymlinkFallback applies mode without following the final path
++// component on systems without fchmodat2 support.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlinkFallback(parentFD int, base, name string, perm uint32, opts *archiveoptions.Options) error {
++	fd, err := unix.Openat(parentFD, base, unix.O_PATH|unix.O_NOFOLLOW|unix.O_CLOEXEC, 0)
++	if err != nil {
++		return &os.PathError{Op: "openat", Path: name, Err: err}
++	}
++	defer unix.Close(fd)
++
++	if opts != nil && opts.ProcSelfFD != nil {
++		err := unix.Fchmodat(int(opts.ProcSelfFD.Fd()), strconv.Itoa(fd), perm, 0)
++		// Keep the os.File alive until fchmodat has finished using its descriptor.
++		runtime.KeepAlive(opts.ProcSelfFD)
++		if err != nil {
++			return &os.PathError{Op: "fchmodat", Path: name, Err: fmt.Errorf("via pre-opened /proc/self/fd/%d: %w", fd, err)}
++		}
++	} else {
++		procPath := "/proc/self/fd/" + strconv.Itoa(fd)
++		if err := unix.Chmod(procPath, perm); err != nil {
++			return &os.PathError{Op: "chmod", Path: name, Err: fmt.Errorf("via %s: %w", procPath, err)}
++		}
++	}
++	return nil
++}
+diff --git a/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go b/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go
+new file mode 100644
+index 0000000..0acddb1
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/chmod_unix_nolinux.go
+@@ -0,0 +1,27 @@
++//go:build !linux && !windows
++
++package archive
++
++import (
++	"os"
++
++	"github.com/moby/go-archive/internal/archiveoptions"
++	"golang.org/x/sys/unix"
++)
++
++// chmodNoSymlinkFallback applies mode without following the final path
++// component on systems without fchmodat2 support.
++//
++// Callers must have already excluded symlink entries.
++func chmodNoSymlinkFallback(parentFD int, base, name string, perm uint32, _ *archiveoptions.Options) error {
++	fd, err := unix.Openat(parentFD, base, unix.O_RDONLY|unix.O_NOFOLLOW|unix.O_NONBLOCK|unix.O_CLOEXEC, 0)
++	if err != nil {
++		return &os.PathError{Op: "openat", Path: name, Err: err}
++	}
++	defer unix.Close(fd)
++
++	if err := unix.Fchmod(fd, perm); err != nil {
++		return &os.PathError{Op: "fchmod", Path: name, Err: err}
++	}
++	return nil
++}
+diff --git a/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go b/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
+index a3b7367..de7b16a 100644
+--- a/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
++++ b/vendor/github.com/moby/go-archive/chrootarchive/archive_linux.go
+@@ -9,9 +9,15 @@
+ 	"github.com/moby/go-archive"
+ )
+ 
+-func doUnpack(decompressedArchive io.Reader, relDest, root string, options *archive.TarOptions) error {
++func doUnpack(decompressedArchive io.Reader, relDest, root string, opts *archive.TarOptions) error {
++	options, closeOptions, err := archive.WithProcSelfFD(opts)
++	if err != nil {
++		return err
++	}
++	defer closeOptions()
++
+ 	done := make(chan error)
+-	err := goInChroot(root, func() { done <- archive.Unpack(decompressedArchive, relDest, options) })
++	err = goInChroot(root, func() { done <- archive.Unpack(decompressedArchive, relDest, options) })
+ 	if err != nil {
+ 		return err
+ 	}
+@@ -30,14 +36,20 @@ func doPack(relSrc, root string, options *archive.TarOptions) (io.ReadCloser, er
+ 	return tb.Reader(), nil
+ }
+ 
+-func doUnpackLayer(root string, layer io.Reader, options *archive.TarOptions) (int64, error) {
++func doUnpackLayer(root string, layer io.Reader, opts *archive.TarOptions) (int64, error) {
++	options, closeOptions, err := archive.WithProcSelfFD(opts)
++	if err != nil {
++		return 0, err
++	}
++	defer closeOptions()
++
+ 	type result struct {
+ 		layerSize int64
+ 		err       error
+ 	}
+ 	done := make(chan result)
+ 
+-	err := goInChroot(root, func() {
++	err = goInChroot(root, func() {
+ 		// We need to be able to set any perms
+ 		_ = unix.Umask(0)
+ 
+diff --git a/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go b/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go
+new file mode 100644
+index 0000000..201eb91
+--- /dev/null
++++ b/vendor/github.com/moby/go-archive/internal/archiveoptions/options.go
+@@ -0,0 +1,12 @@
++// Package archiveoptions defines internal options shared between archive and
++// chrootarchive.
++package archiveoptions
++
++import "os"
++
++// Options contains extraction resources supplied by internal callers.
++type Options struct {
++	// ProcSelfFD references /proc/self/fd as opened before entering a chroot.
++	// The caller retains ownership of the file.
++	ProcSelfFD *os.File
++}
+diff --git a/vendor/modules.txt b/vendor/modules.txt
+index efe00e3..5fb6f18 100644
+--- a/vendor/modules.txt
++++ b/vendor/modules.txt
+@@ -1157,6 +1157,7 @@ github.com/moby/docker-image-spec/specs-go/v1
+ github.com/moby/go-archive
+ github.com/moby/go-archive/chrootarchive
+ github.com/moby/go-archive/compression
++github.com/moby/go-archive/internal/archiveoptions
+ github.com/moby/go-archive/internal/mounttree
+ github.com/moby/go-archive/internal/unshare
+ github.com/moby/go-archive/tarheader
diff --git a/recipes-containers/docker/files/CVE-2026-17106.patch b/recipes-containers/docker/files/CVE-2026-17106.patch
new file mode 100644
index 00000000..dbf46f0c
--- /dev/null
+++ b/recipes-containers/docker/files/CVE-2026-17106.patch
@@ -0,0 +1,306 @@
+From 3704c55f55081896f1c0fcd90d46dd3a9f620518 Mon Sep 17 00:00:00 2001
+From: Sebastiaan van Stijn <github@gone.nl>
+Date: Thu, 30 Jul 2026 19:11:59 +0200
+Subject: [PATCH] vendor: github.com/moby/go-archive v0.3.0
+
+full diff: https://github.com/moby/go-archive/compare/v0.2.1...v0.3.0
+
+v0.3.0
+
+This release fixes CVE-2026-17106 / GHSA-hfg8-hc9c-6c3h, where a crafted
+tar archive could use links to cause extraction operations to create or
+overwrite files outside the intended destination directory.
+
+The issue affected Unpack, UnpackLayer, Untar, UntarUncompressed, and the
+ApplyLayer helpers. Users should upgrade and avoid extracting untrusted
+archives with earlier versions.
+
+What's Changed
+
+* archive: harden tar extraction against path traversal
+* archive: do not follow reparse points in chtimes
+* archive: fix creation time updates on Windows
+* archive: minor cleanups and godoc touch-up
+* archive: RebaseArchiveEntries: fix archive path rebasing
+
+CVE: CVE-2026-17106
+Upstream-Status: Backport [https://github.com/moby/moby/commit/3704c55f55081896f1c0fcd90d46dd3a9f620518]
+
+Backport Changes:
+- Omit go.mod, go.sum, and vendor/modules.txt version/checksum updates to
+  keep go-archive at v0.2.0. Backport the archive source changes that
+  prevent crafted tar links from escaping the extraction root.
+
+Signed-off-by: Sebastiaan van Stijn <github@gone.nl>
+(cherry picked from commit 3704c55f55081896f1c0fcd90d46dd3a9f620518)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ vendor/github.com/moby/go-archive/archive.go  |   6 +-
+ vendor/github.com/moby/go-archive/copy.go     |  45 +++++---
+ vendor/github.com/moby/go-archive/diff.go     |   2 +-
+ .../moby/go-archive/time_nonwindows.go        |   6 +-
+ .../moby/go-archive/time_windows.go           | 102 +++++++++++++++---
+ 5 files changed, 128 insertions(+), 33 deletions(-)
+
+diff --git a/vendor/github.com/moby/go-archive/archive.go b/vendor/github.com/moby/go-archive/archive.go
+index 4a247c5f50..4d9e87d204 100644
+--- a/vendor/github.com/moby/go-archive/archive.go
++++ b/vendor/github.com/moby/go-archive/archive.go
+@@ -610,13 +610,13 @@ func createTarFile(root *os.Root, dstPath string, hdr *tar.Header, reader io.Rea
+ 		// Follow the hardlink only when its target is not itself a symlink.
+ 		fi, err := root.Lstat(filepath.FromSlash(path.Clean(hdr.Linkname)))
+ 		if err == nil && fi.Mode()&os.ModeSymlink == 0 {
+-			if err := root.Chtimes(dstPath, aTime, mTime); err != nil {
++			if err := chtimes(root, dstPath, aTime, mTime); err != nil {
+ 				return err
+ 			}
+ 		}
+ 	default:
+ 		// All other file types follow symlinks.
+-		if err := root.Chtimes(dstPath, aTime, mTime); err != nil {
++		if err := chtimes(root, dstPath, aTime, mTime); err != nil {
+ 			return err
+ 		}
+ 	}
+@@ -996,7 +996,7 @@ func Unpack(decompressedArchive io.Reader, dest string, options *TarOptions) err
+ 
+ 	for _, d := range dirs {
+ 		aTime := boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime))
+-		if err := root.Chtimes(d.name, aTime, boundTime(d.hdr.ModTime)); err != nil {
++		if err := chtimes(root, d.name, aTime, boundTime(d.hdr.ModTime)); err != nil {
+ 			return err
+ 		}
+ 	}
+diff --git a/vendor/github.com/moby/go-archive/copy.go b/vendor/github.com/moby/go-archive/copy.go
+index b4ee74ef47..7447e8bd10 100644
+--- a/vendor/github.com/moby/go-archive/copy.go
++++ b/vendor/github.com/moby/go-archive/copy.go
+@@ -316,19 +316,40 @@ func PrepareArchiveCopy(srcContent io.Reader, srcInfo, dstInfo CopyInfo) (dstDir
+ 	}
+ }
+ 
++// newNameRebaser returns a function that replaces oldBase with newBase at the
++// beginning of POSIX-style archive entry names. It converts oldBase and newBase
++// to forward-slash form and trims trailing slashes.
++//
++// When rebasing from the archive root, the returned function removes all
++// leading slashes from names. It otherwise preserves the remainder verbatim
++// and does not clean or canonicalize paths.
++func newNameRebaser(oldBase, newBase string) func(string) string {
++	oldBase = strings.TrimRight(filepath.ToSlash(oldBase), "/")
++	newBase = strings.TrimRight(filepath.ToSlash(newBase), "/")
++
++	if oldBase == "" {
++		return func(name string) string {
++			name = strings.TrimLeft(name, "/")
++			if newBase == "" {
++				return name
++			}
++			return newBase + "/" + name
++		}
++	}
++
++	return func(name string) string {
++		suffix, ok := strings.CutPrefix(name, oldBase)
++		if !ok || suffix != "" && !strings.HasPrefix(suffix, "/") {
++			return name
++		}
++		return newBase + suffix
++	}
++}
++
+ // RebaseArchiveEntries rewrites the given srcContent archive replacing
+ // an occurrence of oldBase with newBase at the beginning of entry names.
+ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.ReadCloser {
+-	oldBase = filepath.ToSlash(oldBase)
+-	newBase = filepath.ToSlash(newBase)
+-
+-	if oldBase == "/" {
+-		// If oldBase specifies the root directory, use an empty string as
+-		// oldBase instead so that newBase doesn't replace the path separator
+-		// that all paths will start with.
+-		oldBase = ""
+-	}
+-
++	rebase := newNameRebaser(oldBase, newBase)
+ 	rebased, w := io.Pipe()
+ 
+ 	go func() {
+@@ -356,9 +377,9 @@ func RebaseArchiveEntries(srcContent io.Reader, oldBase, newBase string) io.Read
+ 			//
+ 			// To fix, set the format to PAX here. See docker/for-linux issue #484.
+ 			hdr.Format = tar.FormatPAX
+-			hdr.Name = strings.Replace(hdr.Name, oldBase, newBase, 1)
++			hdr.Name = rebase(hdr.Name)
+ 			if hdr.Typeflag == tar.TypeLink {
+-				hdr.Linkname = strings.Replace(hdr.Linkname, oldBase, newBase, 1)
++				hdr.Linkname = rebase(hdr.Linkname)
+ 			}
+ 
+ 			if err = rebasedTar.WriteHeader(hdr); err != nil {
+diff --git a/vendor/github.com/moby/go-archive/diff.go b/vendor/github.com/moby/go-archive/diff.go
+index 75b84f97ca..055f3c11ee 100644
+--- a/vendor/github.com/moby/go-archive/diff.go
++++ b/vendor/github.com/moby/go-archive/diff.go
+@@ -213,7 +213,7 @@ func UnpackLayer(dest string, layer io.Reader, options *TarOptions) (size int64,
+ 	}
+ 
+ 	for _, d := range dirs {
+-		if err := root.Chtimes(d.name, boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime)), boundTime(d.hdr.ModTime)); err != nil {
++		if err := chtimes(root, d.name, boundTime(latestTime(d.hdr.AccessTime, d.hdr.ModTime)), boundTime(d.hdr.ModTime)); err != nil {
+ 			return 0, err
+ 		}
+ 	}
+diff --git a/vendor/github.com/moby/go-archive/time_nonwindows.go b/vendor/github.com/moby/go-archive/time_nonwindows.go
+index 5fa042ec27..418bc887a9 100644
+--- a/vendor/github.com/moby/go-archive/time_nonwindows.go
++++ b/vendor/github.com/moby/go-archive/time_nonwindows.go
+@@ -15,12 +15,12 @@
+ )
+ 
+ // chtimes changes the access and modification time of a file at the given
+-// path.
++// path relative to root.
+ //
+ // Callers must use boundTime to ensure timestamps are within the range
+ // supported by os.Chtimes.
+-func chtimes(name string, atime time.Time, mtime time.Time) error {
+-	return os.Chtimes(name, atime, mtime)
++func chtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	return root.Chtimes(name, atime, mtime)
+ }
+ 
+ func lchtimes(root *os.Root, name string, atime, mtime time.Time) error {
+diff --git a/vendor/github.com/moby/go-archive/time_windows.go b/vendor/github.com/moby/go-archive/time_windows.go
+index aaa3399f73..66173c58bb 100644
+--- a/vendor/github.com/moby/go-archive/time_windows.go
++++ b/vendor/github.com/moby/go-archive/time_windows.go
+@@ -1,37 +1,111 @@
+ package archive
+ 
+ import (
++	"errors"
+ 	"os"
++	"path/filepath"
+ 	"time"
++	"unsafe"
+ 
+ 	"golang.org/x/sys/windows"
+ )
+ 
+ // chtimes changes the access and modification time of a file at the given
+-// path.
++// path relative to root.
++//
++// Symlink entries are handled separately through lchtimes. The final path
++// component is expected not to be a reparse point; if one is encountered,
++// chtimes returns an error.
+ //
+ // Callers must use boundTime to ensure timestamps are within the range
+ // supported by os.Chtimes.
+-func chtimes(name string, atime time.Time, mtime time.Time) error {
+-	if err := os.Chtimes(name, atime, mtime); err != nil {
++func chtimes(root *os.Root, name string, atime, mtime time.Time) error {
++	parent, err := root.OpenFile(filepath.Dir(name), os.O_RDONLY, 0)
++	if err != nil {
+ 		return err
+ 	}
++	defer parent.Close()
++
++	// Symlink entries are handled by lchtimes. The destination for all
++	// chtimes callers is therefore expected not to be a reparse point.
++	//
++	// Do not follow the final component: if it was concurrently replaced
++	// with a reparse point, fail instead of updating its target.
++	return chtimesAt(parent, filepath.Base(name), atime, mtime, true)
++}
+ 
+-	pathp, err := windows.UTF16PtrFromString(name)
++func lchtimes(root *os.Root, name string, atime time.Time, mtime time.Time) error {
++	return nil
++}
++
++func chtimesAt(parent *os.File, name string, atime, mtime time.Time, noFollow bool) error {
++	h, err := openForWriteAttributesAt(windows.Handle(parent.Fd()), name, noFollow)
+ 	if err != nil {
++		if noFollow && errors.Is(err, windows.STATUS_REPARSE_POINT_ENCOUNTERED) {
++			// Encountering a reparse point when noFollow is requested is unexpected.
++			// Treat it as a potential breakout to fail extraction safely.
++			return breakoutError(err)
++		}
+ 		return err
+ 	}
+-	h, err := windows.CreateFile(pathp,
+-		windows.FILE_WRITE_ATTRIBUTES, windows.FILE_SHARE_WRITE, nil,
+-		windows.OPEN_EXISTING, windows.FILE_FLAG_BACKUP_SEMANTICS, 0)
++	defer func() { _ = windows.Close(h) }()
++
++	var (
++		creationTime     = windows.NsecToFiletime(mtime.UnixNano())
++		accessTime       = windows.NsecToFiletime(atime.UnixNano())
++		modificationTime = windows.NsecToFiletime(mtime.UnixNano())
++	)
++	return windows.SetFileTime(h, &creationTime, &accessTime, &modificationTime)
++}
++
++// openForWriteAttributesAt opens name relative to parent with permission to
++// modify its file attributes. If noFollow is true, it does not follow reparse
++// points.
++//
++// This implementation is based on Go's internal Windows Openat support:
++//
++//	https://github.com/golang/go/blob/go1.26.0/src/internal/syscall/windows/at_windows.go
++//
++// It is used by os.Root's Windows implementation for root-relative filesystem
++// operations:
++//
++//	https://github.com/golang/go/blob/go1.26.0/src/os/root_windows.go
++//
++// Keep this implementation aligned with the upstream code until an equivalent
++// operation is available from golang.org/x/sys/windows.
++func openForWriteAttributesAt(parent windows.Handle, name string, noFollow bool) (windows.Handle, error) {
++	name16, err := windows.UTF16FromString(name)
+ 	if err != nil {
+-		return err
++		return windows.InvalidHandle, err
+ 	}
+-	defer windows.Close(h)
+-	c := windows.NsecToFiletime(mtime.UnixNano())
+-	return windows.SetFileTime(h, &c, nil, nil)
+-}
+ 
+-func lchtimes(root *os.Root, name string, atime time.Time, mtime time.Time) error {
+-	return nil
++	attrs := uint32(windows.OBJ_CASE_INSENSITIVE)
++	if noFollow {
++		attrs |= windows.OBJ_DONT_REPARSE
++	}
++
++	var handle windows.Handle
++	err = windows.NtCreateFile(
++		&handle,
++		windows.SYNCHRONIZE|windows.FILE_WRITE_ATTRIBUTES,
++		&windows.OBJECT_ATTRIBUTES{
++			Length:        uint32(unsafe.Sizeof(windows.OBJECT_ATTRIBUTES{})),
++			RootDirectory: parent,
++			ObjectName: &windows.NTUnicodeString{
++				Length:        uint16((len(name16) - 1) * 2), // #nosec G115 -- Length is USHORT by definition. A Windows path component cannot exceed uint16 bytes.
++				MaximumLength: uint16(len(name16) * 2),       // #nosec G115 -- MaximumLength is USHORT by definition. A Windows path component cannot exceed uint16 bytes.
++				Buffer:        &name16[0],
++			},
++			Attributes: attrs,
++		},
++		&windows.IO_STATUS_BLOCK{},
++		nil,
++		windows.FILE_ATTRIBUTE_NORMAL,
++		windows.FILE_SHARE_READ|windows.FILE_SHARE_WRITE|windows.FILE_SHARE_DELETE,
++		windows.FILE_OPEN,
++		windows.FILE_OPEN_FOR_BACKUP_INTENT|windows.FILE_SYNCHRONOUS_IO_NONALERT,
++		0, // EA buffer
++		0, // EA length
++	)
++	return handle, err
+ }
+-- 
+2.35.6
+
-- 
2.35.6

