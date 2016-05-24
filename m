Return-Path: <Rongqing.Li@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 516E2E00972; Mon, 23 May 2016 22:28:12 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 20338E00948
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 May 2016 22:28:08 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u4O5S7TP003851
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 23 May 2016 22:28:07 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 23 May 2016 22:28:06 -0700
From: <rongqing.li@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 24 May 2016 13:28:00 +0800
Message-ID: <1464067680-18093-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] libvirt-python: backport a patch to fix crash in getAllDomainStats
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
X-List-Received-Date: Tue, 24 May 2016 05:28:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 recipes-extended/libvirt/libvirt-python.inc        |  1 +
 .../0001-fix-crash-in-getAllDomainStats.patch      | 57 ++++++++++++++++++++++
 2 files changed, 58 insertions(+)
 create mode 100644 recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index c1dafe9..405d5f7 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -17,6 +17,7 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
+SRC_URI += "file://0001-fix-crash-in-getAllDomainStats.patch;patchdir=../libvirt-python-${PV}"
 
 SRC_URI[libvirt_python.md5sum] = "ed018c714d7ddbe93221c796dff283ed"
 SRC_URI[libvirt_python.sha256sum] = "6d35ae9e7801573393b9c92471f39e6700d479f10b641df81d041b469f160bf8"
diff --git a/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
new file mode 100644
index 0000000..0583a94
--- /dev/null
+++ b/recipes-extended/libvirt/libvirt/0001-fix-crash-in-getAllDomainStats.patch
@@ -0,0 +1,57 @@
+From e9c4e2abffef007a28112ebb40a9586b0128f10b Mon Sep 17 00:00:00 2001
+From: Pavel Hrdina <phrdina@redhat.com>
+Date: Mon, 18 Apr 2016 16:53:50 +0200
+Subject: [PATCH] fix crash in getAllDomainStats
+
+Upstream-Status: Backport
+
+Commits 1d39dbaf and 827ed9b4 broke the libvirt-python API by removing
+virDomainRef() and virDomainFree().  virDomainStatsRecordListFree() will
+free that domain pointer and later when virDomain (python object) call
+its destructor and tries to free that same pointer again.
+
+Resolves: https://bugzilla.redhat.com/show_bug.cgi?id=1326839
+
+Signed-off-by: Pavel Hrdina <phrdina@redhat.com>
+---
+ libvirt-override.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/libvirt-override.c b/libvirt-override.c
+index 4640ed5..2de95ce 100644
+--- a/libvirt-override.c
++++ b/libvirt-override.c
+@@ -8381,6 +8381,7 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *records,
+     PyObject *py_retval;
+     PyObject *py_record;
+     PyObject *py_record_stats = NULL;
++    virDomainPtr dom = NULL;
+     size_t i;
+ 
+     if (!(py_retval = PyList_New(nrecords)))
+@@ -8392,9 +8393,12 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *records,
+ 
+         VIR_PY_LIST_SET_GOTO(py_retval, i, py_record, error);
+ 
++        dom = records[i]->dom;
++        virDomainRef(dom);
+         VIR_PY_TUPLE_SET_GOTO(py_record, 0,
+-                              libvirt_virDomainPtrWrap(records[i]->dom),
++                              libvirt_virDomainPtrWrap(dom),
+                               error);
++        dom = NULL;
+ 
+         if (!(py_record_stats = getPyVirTypedParameter(records[i]->params,
+                                                        records[i]->nparams)))
+@@ -8406,6 +8410,8 @@ convertDomainStatsRecord(virDomainStatsRecordPtr *records,
+     return py_retval;
+ 
+  error:
++    if (dom)
++        virDomainFree(dom);
+     Py_XDECREF(py_retval);
+     return NULL;
+ }
+-- 
+2.8.1
+
-- 
2.8.1


