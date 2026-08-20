Return-Path: <hthakar@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 106E1C5DF82
	for <webhook@archiver.kernel.org>; Thu, 20 Aug 2026 06:40:46 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1370.1787208044478580561
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 19 Aug 2026 23:40:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=IT70GZbi;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: hthakar@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10308; q=dns/txt;
  s=iport01; t=1787208044; x=1788417644;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=wlqZ5JkY2Q2ncsLYWuvozDECVI2GEo+cw51Zo1QUOyg=;
  b=IT70GZbic/hIh323kKfFWHI+ECgDMqDZKDswnszjFeOj8qLMVYxE7iCG
   5sZe3FXgvtI9Yzl1GOYwj2GXz/7AACqczIDOoNQ6VfynJfBgL74P/e1qi
   vS0OJ0z3h5nbPl1M/4BQOwP9VUm4UoyFNFs8yfRUqqC1chDbh42HkFQMv
   1EaiNFifEEqfW1MQl/bvOqizsrU6D/l23y3A7ietnWft6pt8zEWtfnUC+
   bXakzomE8i1Dx/gcCM80kSkJEp8C+OZMAnvI5vzbnFw8mVN6Pq3Xcaizh
   p+lV0xcT5L2mAYVo11vuElwlh6GeNL1LZH4qLbnxFbzRcpwrPSJnVM7Sq
   w==;
X-CSE-ConnectionGUID: 9fvTIrpZSyi3D/sZ1dIQuA==
X-CSE-MsgGUID: Dx8H4FNSSuaIgKddwZkhLA==
X-IPAS-Result: =?us-ascii?q?A0BEAgC7n4Zq/4sQJK1aHgEBCxIMggULgld0XkNJlV5sk?=
 =?us-ascii?q?U2MUYF+DwEBAQ9EDQQBAYQ/Ro1tAiY0CQ4BAgQDAgMBAQEBAQEBAQEBAQsBA?=
 =?us-ascii?q?QUBAQECAQcFgQ4Thk8NhloBAgE1AUYsAwECWiMhgwIBgnQDEcI5giyBAYR92?=
 =?us-ascii?q?zABCxQBBYEzhT+IIl0YAYR8JxsbgXKBFYNpgQWBXAKBJ4Z+BIIigQyBWh5Qk?=
 =?us-ascii?q?QJIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQ0bBgWBHYEohDcjGTZ8g?=
 =?us-ascii?q?QlegSsqYQESF4EJggoCgnCCBgIBSUUOCRcLGA1IESw3FBkEPm4HjlEggkQHA?=
 =?us-ascii?q?XMHEwErgQUWPyp2kkMdkkiBNZ9aCiiDdowhlToaM4VbpRELmH2LN4JTlWcBG?=
 =?us-ascii?q?FCEaYFoPIFZcBWDIglKGQ+OKgQKC4NgzDknMgsyAQEHAgcOAwuBaJAAgX4BA?=
 =?us-ascii?q?Q?=
IronPort-Data: A9a23:1piDmKy6MMhgA3paEmJ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWn
 2dMWj2PPP7eYWb8edwjO9i28B4C75eHnIdhQVBqrVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 46aT/H3Ygf/hWYkazNMscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBA4I7E54P5FOnBPr
 tBfMwJUYjG6msvjldpXSsE07igiBMDvOIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JRfMGQpNU+RC/FMEg9/5JYWnPuoj3r2aRVTqUmeouw85G27IAlZgOG1YYWMKoDQLSlTtmqI9
 kKa0ULCOQwTFdO8xTaawHGsosaayEsXX6pXTtVU7MVChVCPzykNCQcKSFK/oOuwlk+5XfpbK
 lcI4Ww/qqMu81SxSdvwVAH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rEnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:yP2tbKGnmKdir5LkpLqExMeALOsnbusQ8zAXPo5KJiC9Ffbo8v
 xG88576faZslsssRIb6LK90de7IU80nKQdieJ6AV7IZmfbUQWTQL2KxLGSpwEIYxeOldJ15O
 NHb7V0DsH2ABxRiMb35xT9LvMbqeP3l5xBQYzlvg5QpcYAUdAH0ztE
X-Talos-CUID: =?us-ascii?q?9a23=3AqEGTU2veDYAxYgcXYEzkNKwx6It0fGPh7W3IEXS?=
 =?us-ascii?q?pCD1FD6anEFOxwb5Nxp8=3D?=
X-Talos-MUID: 9a23:pYifygZKoBzWC+BTmy+8pG1MEvxT/q2PB2MBnYo0uMmgHHkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,232,1779148800"; 
   d="scan'208";a="810971842"
Received: from alln-l-core-02.cisco.com ([173.36.16.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Aug 2026 06:40:43 +0000
Received: from sjc-ads-5471.cisco.com (sjc-ads-5471.cisco.com [10.28.23.235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-02.cisco.com (Postfix) with ESMTPS id 5557B180001AE;
	Thu, 20 Aug 2026 06:40:43 +0000 (GMT)
Received: by sjc-ads-5471.cisco.com (Postfix, from userid 1887505)
	id DFCEBCC12A6; Wed, 19 Aug 2026 23:40:42 -0700 (PDT)
From: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: xe-linux-external@cisco.com,
	Hetvi Thakar <hthakar@cisco.com>
Subject: [meta-virtualization][scarthgap][PATCH] go-logrus: Fix CVE-2025-65637
Date: Wed, 19 Aug 2026 23:40:33 -0700
Message-Id: <20260820064033.13677-1-hthakar@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5471.cisco.com [10.28.23.235];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.23.235, sjc-ads-5471.cisco.com
X-Outbound-Node: alln-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 20 Aug 2026 06:40:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10049

From: Hetvi Thakar <hthakar@cisco.com>

The upstream fix cited by [3] was reverted and later reapplied in [1].
Apply its required correction [2] to avoid a Writer panic.

[1] https://github.com/sirupsen/logrus/commit/f9291a534cac1466d26414fd9e326381cd64ecef
[2] https://github.com/sirupsen/logrus/commit/d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd
[3] https://github.com/advisories/GHSA-4f99-4q7p-p3gh

Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
---
 .../go/go-logrus/CVE-2025-65637_p1.patch      |  97 ++++++++++++
 .../go/go-logrus/CVE-2025-65637_p2.patch      | 148 ++++++++++++++++++
 recipes-devtools/go/go-logrus_git.bb          |   5 +-
 3 files changed, 249 insertions(+), 1 deletion(-)
 create mode 100644 recipes-devtools/go/go-logrus/CVE-2025-65637_p1.patch
 create mode 100644 recipes-devtools/go/go-logrus/CVE-2025-65637_p2.patch

diff --git a/recipes-devtools/go/go-logrus/CVE-2025-65637_p1.patch b/recipes-devtools/go/go-logrus/CVE-2025-65637_p1.patch
new file mode 100644
index 00000000..309f6420
--- /dev/null
+++ b/recipes-devtools/go/go-logrus/CVE-2025-65637_p1.patch
@@ -0,0 +1,97 @@
+From 2d0e297057a0ade6c17e0e84a9927840bd2b6d7f Mon Sep 17 00:00:00 2001
+From: Simon Eskildsen <sirup@sirupsen.com>
+Date: Sun, 21 May 2023 08:59:03 -0400
+Subject: [PATCH 1/2] Revert "Revert "Merge pull request #1376 from
+ ozfive/master""
+
+This reverts commit 352781de903c9dc639752a3ac08148132746e180.
+
+CVE: CVE-2025-65637
+Upstream-Status: Backport [https://github.com/sirupsen/logrus/commit/f9291a534cac1466d26414fd9e326381cd64ecef]
+
+Backport Changes:
+- Applied the WriterLevel and writerScanner changes to the Logger receiver
+  because Logrus 0.11.0 does not provide the corresponding Entry APIs.
+- Omitted comments for the absent Entry.Writer and Entry.WriterLevel methods.
+
+(cherry picked from commit f9291a534cac1466d26414fd9e326381cd64ecef)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ writer.go | 32 +++++++++++++++++++++++++++++++-
+ 1 file changed, 31 insertions(+), 1 deletion(-)
+
+diff --git a/writer.go b/writer.go
+index f74d2aa..6f7cefd 100644
+--- a/writer.go
++++ b/writer.go
+@@ -4,6 +4,7 @@ import (
+ 	"bufio"
+ 	"io"
+ 	"runtime"
++	"strings"
+ )
+ 
+ func (logger *Logger) Writer() *io.PipeWriter {
+@@ -14,6 +15,7 @@ func (logger *Logger) WriterLevel(level Level) *io.PipeWriter {
+ 	reader, writer := io.Pipe()
+ 
+ 	var printFunc func(args ...interface{})
++	// Determine which log function to use based on the specified log level
+ 	switch level {
+ 	case DebugLevel:
+ 		printFunc = logger.Debug
+@@ -31,23 +33,51 @@ func (logger *Logger) WriterLevel(level Level) *io.PipeWriter {
+ 		printFunc = logger.Print
+ 	}
+ 
++	// Start a new goroutine to scan the input and write it to the logger using the specified print function.
++	// It splits the input into chunks of up to 64KB to avoid buffer overflows.
+ 	go logger.writerScanner(reader, printFunc)
++
++	// Set a finalizer function to close the writer when it is garbage collected
+ 	runtime.SetFinalizer(writer, writerFinalizer)
+ 
+ 	return writer
+ }
+ 
++// writerScanner scans the input from the reader and writes it to the logger
+ func (logger *Logger) writerScanner(reader *io.PipeReader, printFunc func(args ...interface{})) {
+ 	scanner := bufio.NewScanner(reader)
++
++	// Set the buffer size to the maximum token size to avoid buffer overflows
++	scanner.Buffer(make([]byte, bufio.MaxScanTokenSize), bufio.MaxScanTokenSize)
++
++	// Define a split function to split the input into chunks of up to 64KB
++	chunkSize := 64 * 1024 // 64KB
++	splitFunc := func(data []byte, atEOF bool) (int, []byte, error) {
++		if len(data) > chunkSize {
++			return chunkSize, data[:chunkSize], nil
++		}
++
++		return len(data), data, nil
++	}
++
++	//Use the custom split function to split the input
++	scanner.Split(splitFunc)
++
++	// Scan the input and write it to the logger using the specified print function
+ 	for scanner.Scan() {
+-		printFunc(scanner.Text())
++		printFunc(strings.TrimRight(scanner.Text(), "\r\n"))
+ 	}
++
++	// If there was an error while scanning the input, log an error
+ 	if err := scanner.Err(); err != nil {
+ 		logger.Errorf("Error while reading from Writer: %s", err)
+ 	}
++
++	// Close the reader when we are done
+ 	reader.Close()
+ }
+ 
++// WriterFinalizer is a finalizer function that closes then given writer when it is garbage collected
+ func writerFinalizer(writer *io.PipeWriter) {
+ 	writer.Close()
+ }
+-- 
+2.35.6
diff --git a/recipes-devtools/go/go-logrus/CVE-2025-65637_p2.patch b/recipes-devtools/go/go-logrus/CVE-2025-65637_p2.patch
new file mode 100644
index 00000000..c43172aa
--- /dev/null
+++ b/recipes-devtools/go/go-logrus/CVE-2025-65637_p2.patch
@@ -0,0 +1,148 @@
+From e381b4e9cc266f5d8fe6bc9b0557ba372f42ec9d Mon Sep 17 00:00:00 2001
+From: Paul Holzinger <pholzing@redhat.com>
+Date: Wed, 17 May 2023 15:39:49 +0200
+Subject: [PATCH 2/2] fix panic in Writer
+
+Commit 766cfece introduced this bug by defining an incorrect split
+function. First it breaks the old behavior because it never splits at
+newlines now. Second, it causes a panic because it never tells the
+scanner to stop. See the bufio.ScanLines function, something like:
+```
+if atEOF && len(data) == 0 {
+	return 0, nil, nil
+}
+```
+is needed to do that.
+
+This commit fixes it by restoring the old behavior and calling
+bufio.ScanLines but also keep the 64KB check in place to avoid buffering
+for to long.
+
+Two tests are added to ensure it is working as expected.
+
+Fixes #1383
+
+Signed-off-by: Paul Holzinger <pholzing@redhat.com>
+
+CVE: CVE-2025-65637
+Upstream-Status: Backport [https://github.com/sirupsen/logrus/commit/d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd]
+
+Backport Changes:
+- Adapted the writerScanner receiver from Entry to the Logger API used by
+  Logrus 0.11.0.
+- Created writer_test.go because it is absent in Logrus 0.11.0, adding only
+  the package/import scaffolding needed by the two upstream regression tests.
+- Adapted the tests from Logger.SetOutput to the Logger.Out field provided
+  by Logrus 0.11.0.
+
+(cherry picked from commit d40e25cd45ed9c6b2b66e6b97573a0413e4c23bd)
+Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
+---
+ writer.go      |  8 +++---
+ writer_test.go | 70 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 2 files changed, 74 insertions(+), 4 deletions(-)
+ create mode 100644 writer_test.go
+
+diff --git a/writer.go b/writer.go
+index 6f7cefd..61d13f0 100644
+--- a/writer.go
++++ b/writer.go
+@@ -51,16 +51,16 @@ func (logger *Logger) writerScanner(reader *io.PipeReader, printFunc func(args .
+ 	scanner.Buffer(make([]byte, bufio.MaxScanTokenSize), bufio.MaxScanTokenSize)
+ 
+ 	// Define a split function to split the input into chunks of up to 64KB
+-	chunkSize := 64 * 1024 // 64KB
++	chunkSize := bufio.MaxScanTokenSize // 64KB
+ 	splitFunc := func(data []byte, atEOF bool) (int, []byte, error) {
+-		if len(data) > chunkSize {
++		if len(data) >= chunkSize {
+ 			return chunkSize, data[:chunkSize], nil
+ 		}
+ 
+-		return len(data), data, nil
++		return bufio.ScanLines(data, atEOF)
+ 	}
+ 
+-	//Use the custom split function to split the input
++	// Use the custom split function to split the input
+ 	scanner.Split(splitFunc)
+ 
+ 	// Scan the input and write it to the logger using the specified print function
+diff --git a/writer_test.go b/writer_test.go
+new file mode 100644
+index 0000000..0fe80f9
+--- /dev/null
++++ b/writer_test.go
+@@ -0,0 +1,70 @@
++package logrus_test
++
++import (
++	"bufio"
++	"bytes"
++	"strings"
++	"testing"
++	"time"
++
++	"github.com/sirupsen/logrus"
++	"github.com/stretchr/testify/assert"
++)
++
++func TestWriterSplitNewlines(t *testing.T) {
++	buf := bytes.NewBuffer(nil)
++	logger := logrus.New()
++	logger.Formatter = &logrus.TextFormatter{
++		DisableColors:    true,
++		DisableTimestamp: true,
++	}
++	logger.Out = buf
++	writer := logger.Writer()
++
++	const logNum = 10
++
++	for i := 0; i < logNum; i++ {
++		_, err := writer.Write([]byte("bar\nfoo\n"))
++		assert.NoError(t, err, "writer.Write failed")
++	}
++	writer.Close()
++	// Test is flaky because it writes in another goroutine,
++	// we need to make sure to wait a bit so all write are done.
++	time.Sleep(500 * time.Millisecond)
++
++	lines := strings.Split(strings.TrimRight(buf.String(), "\n"), "\n")
++	assert.Len(t, lines, logNum*2, "logger printed incorrect number of lines")
++}
++
++func TestWriterSplitsMax64KB(t *testing.T) {
++	buf := bytes.NewBuffer(nil)
++	logger := logrus.New()
++	logger.Formatter = &logrus.TextFormatter{
++		DisableColors:    true,
++		DisableTimestamp: true,
++	}
++	logger.Out = buf
++	writer := logger.Writer()
++
++	// write more than 64KB
++	const bigWriteLen = bufio.MaxScanTokenSize + 100
++	output := make([]byte, bigWriteLen)
++	// lets not write zero bytes
++	for i := 0; i < bigWriteLen; i++ {
++		output[i] = 'A'
++	}
++
++	for i := 0; i < 3; i++ {
++		len, err := writer.Write(output)
++		assert.NoError(t, err, "writer.Write failed")
++		assert.Equal(t, bigWriteLen, len, "bytes written")
++	}
++	writer.Close()
++	// Test is flaky because it writes in another goroutine,
++	// we need to make sure to wait a bit so all write are done.
++	time.Sleep(500 * time.Millisecond)
++
++	lines := strings.Split(strings.TrimRight(buf.String(), "\n"), "\n")
++	// we should have 4 lines because we wrote more than 64 KB each time
++	assert.Len(t, lines, 4, "logger printed incorrect number of lines")
++}
+-- 
+2.35.6
diff --git a/recipes-devtools/go/go-logrus_git.bb b/recipes-devtools/go/go-logrus_git.bb
index 1826b893..35ed35dd 100644
--- a/recipes-devtools/go/go-logrus_git.bb
+++ b/recipes-devtools/go/go-logrus_git.bb
@@ -7,7 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=8dadfef729c08ec4e631c4f6fc5d43a0"
 SRCNAME = "logrus"
 
 PKG_NAME = "github.com/sirupsen/${SRCNAME}"
-SRC_URI = "git://${PKG_NAME};branch=master;protocol=https"
+SRC_URI = "git://${PKG_NAME};branch=master;protocol=https \
+           file://CVE-2025-65637_p1.patch \
+           file://CVE-2025-65637_p2.patch \
+          "
 
 SRCREV = "d26492970760ca5d33129d2d799e34be5c4782eb"
 PV = "0.11.0+git"
-- 
2.35.6


