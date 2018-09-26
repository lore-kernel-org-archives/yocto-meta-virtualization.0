Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49954E00A16; Tue, 25 Sep 2018 19:49:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5D0A4E00718
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:56 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8Q2mPFg006528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:45 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:48:36 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:27 +0800
Message-ID: <1537929391-32035-3-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 3/7] glusterfs: backport patch to fix a few CVEs
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
X-List-Received-Date: Wed, 26 Sep 2018 02:49:05 -0000
Content-Type: text/plain

Backport a patch to fix the following CVEs.

CVE: CVE-2018-10926
CVE: CVE-2018-10927
CVE: CVE-2018-10928
CVE: CVE-2018-10929
CVE: CVE-2018-10930

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...erver-protocol-don-t-allow-.-path-in-name.patch | 73 ++++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |  1 +
 2 files changed, 74 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch

diff --git a/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch b/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch
new file mode 100644
index 0000000..e6ef9e3
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0003-server-protocol-don-t-allow-.-path-in-name.patch
@@ -0,0 +1,73 @@
+From b89658672d137ef56bd0694457b9125bf7d45ba4 Mon Sep 17 00:00:00 2001
+From: Amar Tumballi <amarts@redhat.com>
+Date: Thu, 9 Aug 2018 13:00:01 +0530
+Subject: [PATCH 3/7] server-protocol: don't allow '../' path in 'name'
+
+This will prevent any arbitrary file creation through glusterfs
+by modifying the client bits.
+
+Also check for the similar flaw inside posix too, so we prevent any
+changes in layers in-between.
+
+Fixes: bz#1625095
+
+Signed-off-by: Amar Tumballi <amarts@redhat.com>
+Change-Id: Id9fe0ef6e86459e8ed85ab947d977f058c5ae06e
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10926
+Fix CVE-2018-10927
+Fix CVE-2018-10928
+Fix CVE-2018-10929
+Fix CVE-2018-10930
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ xlators/protocol/server/src/server-resolve.c | 12 ++++++++++++
+ xlators/storage/posix/src/posix-handle.h     |  6 ++++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/xlators/protocol/server/src/server-resolve.c b/xlators/protocol/server/src/server-resolve.c
+index d0126aa..aa35685 100644
+--- a/xlators/protocol/server/src/server-resolve.c
++++ b/xlators/protocol/server/src/server-resolve.c
+@@ -294,6 +294,18 @@ resolve_entry_simple (call_frame_t *frame)
+         /* expected @parent was found from the inode cache */
+         gf_uuid_copy (state->loc_now->pargfid, resolve->pargfid);
+         state->loc_now->parent = inode_ref (parent);
++
++        if (strstr (resolve->bname, "../")) {
++                /* Resolving outside the parent's tree is not allowed */
++                gf_msg (this->name, GF_LOG_ERROR, EPERM,
++                        PS_MSG_GFID_RESOLVE_FAILED,
++                        "%s: path sent by client not allowed",
++                        resolve->bname);
++                resolve->op_ret   = -1;
++                resolve->op_errno = EPERM;
++                ret = 1;
++                goto out;
++        }
+         state->loc_now->name = resolve->bname;
+ 
+         inode = inode_grep (state->itable, parent, resolve->bname);
+diff --git a/xlators/storage/posix/src/posix-handle.h b/xlators/storage/posix/src/posix-handle.h
+index 9af6a7a..6e7a8d2 100644
+--- a/xlators/storage/posix/src/posix-handle.h
++++ b/xlators/storage/posix/src/posix-handle.h
+@@ -217,6 +217,12 @@
+                 break;                                                  \
+         }                                                               \
+                                                                         \
++        if (strstr (loc->name, "../")) {                                \
++                gf_msg (this->name, GF_LOG_ERROR, 0, P_MSG_ENTRY_HANDLE_CREATE, \
++                        "'../' in name not allowed: (%s)", loc->name); \
++                op_ret = -1;                                            \
++                break;                                                  \
++        }                                                               \
+         if (LOC_HAS_ABSPATH (loc)) {                                    \
+                 MAKE_REAL_PATH (entp, this, loc->path);                 \
+                 __parp = strdupa (entp);                                \
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index e332872..9a92c30 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -25,6 +25,7 @@ SRC_URI += "file://glusterd.init \
             file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch \
             file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
             file://0002-posix-disable-open-read-write-on-special-files.patch \
+            file://0003-server-protocol-don-t-allow-.-path-in-name.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


