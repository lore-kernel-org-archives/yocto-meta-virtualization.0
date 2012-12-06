Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2004EE01454
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:52 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008281eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=woI5LXd5KlxY28NhqMI86bZjJ2BzZvmkCRVg5Yo2CP4=;
	b=yWeEaSmaEvnBq2qjhx2WOcfzFRsPFoXgDGA1r22rv4Go3aXOAep4sovsHC9H3LZP6E
	DcZjNXJ8+32u40rcbvTXbKkmwnUuPLwNBkP/ZnYUI38k0+2mWZkotGlnbw2/3fw1IzAd
	zIw7VGfjIVqfb4OW7ZlOu8ZvTZtyHv8vYz63y9ezIdQMhp9R9HkD9Ackp3LHK76gVGiQ
	116hafJzsDiTkYZ66HGV/7truuVqPXbwFgdaHt4yOCI0BupoKPwjEZHm0jxpYIK45giL
	MYnNraiiEoGldB4D5E0PmM0+IXmCG4Ja8Zr5GdMmurWIG3MRMk0kK4rkNYoWf0gYzzzz
	r6cQ==
Received: by 10.14.203.8 with SMTP id e8mr5873436eeo.2.1354799632057;
	Thu, 06 Dec 2012 05:13:52 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id d3sm15837974eeo.13.2012.12.06.05.13.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:51 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 46D4E400C87; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:32 +0100
Message-Id: <1354799626-6911-2-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 01/14] Added protobuf-c criu dependency
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Thu, 06 Dec 2012 13:13:53 -0000

---
 recipes-containers/criu/files/disable_tests.patch |   19 +++++++++++++++++++
 recipes-containers/criu/protobuf-c_0.15.bb        |   20 ++++++++++++++++++++
 2 files changed, 39 insertions(+)
 create mode 100644 recipes-containers/criu/files/disable_tests.patch
 create mode 100644 recipes-containers/criu/protobuf-c_0.15.bb

diff --git a/recipes-containers/criu/files/disable_tests.patch b/recipes-containers/criu/files/disable_tests.patch
new file mode 100644
index 0000000..dac8942
--- /dev/null
+++ b/recipes-containers/criu/files/disable_tests.patch
@@ -0,0 +1,19 @@
+diff -Naur protobuf-c-0.15.old/src/Makefile.am protobuf-c-0.15/src/Makefile.am
+--- protobuf-c-0.15.old/src/Makefile.am	2012-11-28 14:59:57.845251943 +0100
++++ protobuf-c-0.15/src/Makefile.am	2012-11-28 15:00:23.549252632 +0100
+@@ -1,5 +1,5 @@
+ if BUILD_PROTOC_C
+-SUBDIRS = . test
++
+ bin_PROGRAMS = protoc-c
+ protoc_c_SOURCES = \
+ google/protobuf/compiler/c/c_service.cc \
+@@ -23,7 +23,7 @@
+ lib_LTLIBRARIES = libprotobuf-c.la
+ protobufcincludedir = $(includedir)/google/protobuf-c
+ 
+-EXTRA_DIST = CMakeLists.txt test/CMakeLists.txt
++EXTRA_DIST = CMakeLists.txt 
+ 
+ libprotobuf_c_la_SOURCES = \
+ google/protobuf-c/protobuf-c-dispatch.c \
diff --git a/recipes-containers/criu/protobuf-c_0.15.bb b/recipes-containers/criu/protobuf-c_0.15.bb
new file mode 100644
index 0000000..d9d4fd9
--- /dev/null
+++ b/recipes-containers/criu/protobuf-c_0.15.bb
@@ -0,0 +1,20 @@
+SUMMARY = "protobuf-c"
+DESCRIPTION = "This package provides a code generator and runtime libraries to use Protocol Buffers from pure C"
+HOMEPAGE = "http://code.google.com/p/protobuf-c/"
+SECTION = "console/tools"
+LICENSE = "Apache-2.0"
+
+LIC_FILES_CHKSUM = "file://src/google/protobuf-c/protobuf-c.c;endline=33;md5=333140fae7cf8a38dc5f980ddb63704b"
+
+PR = "r0"
+
+DEPENDS = "protobuf"
+
+SRC_URI[md5sum] = "73ff0c8df50d2eee75269ad8f8c07dc8"
+SRC_URI[sha256sum] = "8fcb538e13a5431c46168fc8f2e6ad2574e2db9b684c0c72b066e24f010a0036"
+SRC_URI = "http://protobuf-c.googlecode.com/files/protobuf-c-${PV}.tar.gz \
+	file://disable_tests.patch"
+
+inherit autotools
+
+BBCLASSEXTEND = "native nativesdk"
\ No newline at end of file
-- 
1.7.9.5


