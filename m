Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.web11.6203.1582714632473400984
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 26 Feb 2020 02:57:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=SdLz7Gbg;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: olkuroch@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4370; q=dns/txt; s=iport;
  t=1582714632; x=1583924232;
  h=from:to:cc:subject:date:message-id;
  bh=53+sdMFUqBUY/1MgK7w0n3ktMuit8OmLKeUVOG7ZdmU=;
  b=SdLz7Gbg1fzP77FeCtGuGD6GLrNXQGSy6fDkDj+j8hwti7GZVZyYE+vc
   QaRstu+Ud23hGGmxXb/NVG856F6QU3t39kMayDBJ5k+1gGMqoYnXgd2HJ
   ozygEI06S2GMeobbF298RAOKeT5sKohGWeujKmvum1fF5rpmv92XeCG6H
   k=;
X-IronPort-AV: E=Sophos;i="5.70,487,1574121600"; 
   d="scan'208";a="451097574"
Received: from alln-core-9.cisco.com ([173.36.13.129])
  by alln-iport-2.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 26 Feb 2020 10:57:11 +0000
Received: from sjc-ads-6800.cisco.com (sjc-ads-6800.cisco.com [10.30.217.115])
	by alln-core-9.cisco.com (8.15.2/8.15.2) with ESMTP id 01QAvBpi015880;
	Wed, 26 Feb 2020 10:57:11 GMT
Received: by sjc-ads-6800.cisco.com (Postfix, from userid 588222)
	id 257B21415; Wed, 26 Feb 2020 02:57:11 -0800 (PST)
From: olkuroch@cisco.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Oleksii Kurochko <olkuroch@cisco.com>
Subject: [meta-virtualization][PATCH] lxc: Backport patch that renames memfd_create() function
Date: Wed, 26 Feb 2020 10:53:49 +0000
Message-Id: <20200226105349.21715-1-olkuroch@cisco.com>
X-Mailer: git-send-email 2.18.1
X-Outbound-SMTP-Client: 10.30.217.115, sjc-ads-6800.cisco.com
X-Outbound-Node: alln-core-9.cisco.com

When Autotools makes configuration of LXC, the check of
the memfd_create() function fails because __stub_memfd_create and
__stub___memfd_create (The GNU C library defines this for functions
which it implements to always fail with ENOSYS) are defined in Glibc,
which leads to the fact that the macro HAVE_MEMFD_CREATE is not
defined and LXC provides defintion of the memfd_create() function as
static inline which in turn conflicts with a definition from
the <bits/mman-shared.h> file and causes an error:
| In file included from ../../../lxc-3.2.1/src/lxc/conf.c:79:
| <src_path>//lxc/syscall_wrappers.h:77:19: error: static declaration
| of 'memfd_create' follows non-static declaration
| | static inline int memfd_create(const char *name, unsigned int flags) {
| |                   ^~~~~~~~~~~~
| In file included from /usr/include/bits/mman-linux.h:111,
|                  from /usr/include/bits/mman.h:34,
|                  from /usr/include/sys/mman.h:41,
|                  from <src_path>/lxc-3.2.1/src/lxc/conf.c:42:
| /usr/include/bits/mman-shared.h:50:5: note: previous declaration
|  of 'memfd_create' was here
| | int memfd_create (const char *__name, unsigned int __flags) __THROW;
| |     ^~~~~~~~~~~~

Upstream PR: https://github.com/lxc/lxc/pull/3168 (merged)

Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
---
 ...-rename-internal-memfd_create-to-mem.patch | 42 +++++++++++++++++++
 recipes-containers/lxc/lxc_3.2.1.bb           |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch

diff --git a/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
new file mode 100644
index 000000000000..3defd57466b2
--- /dev/null
+++ b/recipes-containers/lxc/files/0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch
@@ -0,0 +1,42 @@
+From aec33b485fedf1c5644836c660e2e420baa2fae4 Mon Sep 17 00:00:00 2001
+From: Patrick Havelange <patrick.havelange@essensium.com>
+Date: Tue, 22 Oct 2019 12:29:54 +0200
+Subject: [PATCH] syscall_wrappers: rename internal memfd_create to
+ memfd_create_lxc
+
+In case the internal memfd_create has to be used, make sure we don't
+clash with the already existing memfd_create function from glibc.
+
+This can happen if this glibc function is a stub. In this case, at
+./configure time, the test for this function will return false, however
+the declaration of that function is still available. This leads to
+compilation errors.
+
+Signed-off-by: Patrick Havelange <patrick.havelange@essensium.com>
+(cherry picked from commit 40b06c78773dfd5e12e568a576b1abb133f61b71)
+Signed-off-by: Oleksii Kurochko <olkuroch@cisco.com>
+---
+ src/lxc/syscall_wrappers.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/src/lxc/syscall_wrappers.h b/src/lxc/syscall_wrappers.h
+index ce67da5b5308..b7edba63f5d7 100644
+--- a/src/lxc/syscall_wrappers.h
++++ b/src/lxc/syscall_wrappers.h
+@@ -74,7 +74,7 @@ static inline long __keyctl(int cmd, unsigned long arg2, unsigned long arg3,
+ #endif
+ 
+ #ifndef HAVE_MEMFD_CREATE
+-static inline int memfd_create(const char *name, unsigned int flags) {
++static inline int memfd_create_lxc(const char *name, unsigned int flags) {
+ 	#ifndef __NR_memfd_create
+ 		#if defined __i386__
+ 			#define __NR_memfd_create 356
+@@ -113,6 +113,7 @@ static inline int memfd_create(const char *name, unsigned int flags) {
+ 	return -1;
+ 	#endif
+ }
++#define memfd_create memfd_create_lxc
+ #else
+ extern int memfd_create(const char *name, unsigned int flags);
+ #endif
diff --git a/recipes-containers/lxc/lxc_3.2.1.bb b/recipes-containers/lxc/lxc_3.2.1.bb
index bedcf13723d2..9592dd9b4e68 100644
--- a/recipes-containers/lxc/lxc_3.2.1.bb
+++ b/recipes-containers/lxc/lxc_3.2.1.bb
@@ -49,6 +49,7 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
         file://0002-container.conf-Add-option-to-disable-session-keyring.patch \
 	file://dnsmasq.conf \
 	file://lxc-net \
+	file://0001-syscall_wrappers-rename-internal-memfd_create-to-mem.patch \
 	"
 
 SRC_URI[md5sum] = "4886c8d1c8e221fe526eefcb47857b85"
-- 
2.18.1

