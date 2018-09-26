Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E2458E00BA3; Tue, 25 Sep 2018 19:48:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E3BDDE00A9A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8Q2mmx2026400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:48 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:48:48 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:29 +0800
Message-ID: <1537929391-32035-5-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 5/7] glusterfs: fix CVE-2018-10924
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
X-List-Received-Date: Wed, 26 Sep 2018 02:48:53 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-10924

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../0005-cluster-afr-Fix-dict-leak-in-pre-op.patch | 135 +++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0005-cluster-afr-Fix-dict-leak-in-pre-op.patch

diff --git a/recipes-extended/glusterfs/files/0005-cluster-afr-Fix-dict-leak-in-pre-op.patch b/recipes-extended/glusterfs/files/0005-cluster-afr-Fix-dict-leak-in-pre-op.patch
new file mode 100644
index 0000000..d218a22
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0005-cluster-afr-Fix-dict-leak-in-pre-op.patch
@@ -0,0 +1,135 @@
+From f4dddd7727988b8077b2da577e195621d5bac9c7 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 25 Sep 2018 15:23:10 +0800
+Subject: [PATCH 5/7] cluster/afr: Fix dict-leak in pre-op
+
+At the time of pre-op, pre_op_xdata is populted with the xattrs we get from the
+disk and at the time of post-op it gets over-written without unreffing the
+previous value stored leading to a leak.
+This is a regression we missed in
+https://review.gluster.org/#/q/ba149bac92d169ae2256dbc75202dc9e5d06538e
+
+BUG: 1550078
+Change-Id: I0456f9ad6f77ce6248b747964a037193af3a3da7
+Signed-off-by: Pranith Kumar K <pkarampu@redhat.com>
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10924
+
+Modified for this old glusterfs version.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ xlators/cluster/afr/src/afr-common.c      | 14 +++++++-------
+ xlators/cluster/afr/src/afr-transaction.c | 20 ++++++++++----------
+ xlators/cluster/afr/src/afr.h             |  4 ++--
+ 3 files changed, 19 insertions(+), 19 deletions(-)
+
+diff --git a/xlators/cluster/afr/src/afr-common.c b/xlators/cluster/afr/src/afr-common.c
+index 0643204..85150a0 100644
+--- a/xlators/cluster/afr/src/afr-common.c
++++ b/xlators/cluster/afr/src/afr-common.c
+@@ -1673,13 +1673,13 @@ afr_local_transaction_cleanup (afr_local_t *local, xlator_t *this)
+         GF_FREE (local->transaction.pre_op);
+ 
+         GF_FREE (local->transaction.pre_op_sources);
+-        if (local->transaction.pre_op_xdata) {
++        if (local->transaction.changelog_xdata) {
+                 for (i = 0; i < priv->child_count; i++) {
+-                        if (!local->transaction.pre_op_xdata[i])
++                        if (!local->transaction.changelog_xdata[i])
+                                 continue;
+-                        dict_unref (local->transaction.pre_op_xdata[i]);
++                        dict_unref (local->transaction.changelog_xdata[i]);
+                 }
+-                GF_FREE (local->transaction.pre_op_xdata);
++                GF_FREE (local->transaction.changelog_xdata);
+         }
+ 
+         GF_FREE (local->transaction.eager_lock);
+@@ -5396,10 +5396,10 @@ afr_transaction_local_init (afr_local_t *local, xlator_t *this)
+                 goto out;
+ 
+         if (priv->arbiter_count == 1) {
+-                local->transaction.pre_op_xdata =
+-                        GF_CALLOC (sizeof (*local->transaction.pre_op_xdata),
++                local->transaction.changelog_xdata =
++                        GF_CALLOC (sizeof (*local->transaction.changelog_xdata),
+                                    priv->child_count, gf_afr_mt_dict_t);
+-                if (!local->transaction.pre_op_xdata)
++                if (!local->transaction.changelog_xdata)
+                         goto out;
+ 
+                 local->transaction.pre_op_sources =
+diff --git a/xlators/cluster/afr/src/afr-transaction.c b/xlators/cluster/afr/src/afr-transaction.c
+index 35621d9..c9a4474 100644
+--- a/xlators/cluster/afr/src/afr-transaction.c
++++ b/xlators/cluster/afr/src/afr-transaction.c
+@@ -276,9 +276,9 @@ afr_compute_pre_op_sources (call_frame_t *frame, xlator_t *this)
+         matrix = ALLOC_MATRIX (priv->child_count, int);
+ 
+         for (i = 0; i < priv->child_count; i++) {
+-                if (!local->transaction.pre_op_xdata[i])
++                if (!local->transaction.changelog_xdata[i])
+                         continue;
+-                xdata = local->transaction.pre_op_xdata[i];
++                xdata = local->transaction.changelog_xdata[i];
+                 afr_selfheal_fill_matrix (this, matrix, i, idx, xdata);
+         }
+ 
+@@ -295,13 +295,6 @@ afr_compute_pre_op_sources (call_frame_t *frame, xlator_t *this)
+                 for (j = 0; j < priv->child_count; j++)
+                         if (matrix[i][j] != 0)
+                                 local->transaction.pre_op_sources[j] = 0;
+-
+-        /*We don't need the xattrs any more. */
+-        for (i = 0; i < priv->child_count; i++)
+-                if (local->transaction.pre_op_xdata[i]) {
+-                        dict_unref (local->transaction.pre_op_xdata[i]);
+-                        local->transaction.pre_op_xdata[i] = NULL;
+-                }
+ }
+ 
+ gf_boolean_t
+@@ -1175,7 +1168,7 @@ afr_changelog_cbk (call_frame_t *frame, void *cookie, xlator_t *this,
+ 
+         if (priv->arbiter_count == 1 && !op_ret) {
+                 if (xattr)
+-                        local->transaction.pre_op_xdata[child_index] =
++                        local->transaction.changelog_xdata[child_index] =
+                                                                dict_ref (xattr);
+         }
+ 
+@@ -1608,6 +1601,13 @@ afr_changelog_do (call_frame_t *frame, xlator_t *this, dict_t *xattr,
+ 	local = frame->local;
+ 	priv = this->private;
+ 
++        for (i = 0; i < priv->child_count; i++) {
++                if (local->transaction.changelog_xdata[i]) {
++                        dict_unref (local->transaction.changelog_xdata[i]);
++                        local->transaction.changelog_xdata[i] = NULL;
++                }
++        }
++
+         ret = afr_changelog_prepare (this, frame, &call_count, changelog_resume,
+                                      op, &xdata, &newloc_xdata);
+ 
+diff --git a/xlators/cluster/afr/src/afr.h b/xlators/cluster/afr/src/afr.h
+index cf736ed..2854153 100644
+--- a/xlators/cluster/afr/src/afr.h
++++ b/xlators/cluster/afr/src/afr.h
+@@ -737,8 +737,8 @@ typedef struct _afr_local {
+ 
+                 unsigned char   *pre_op;
+ 
+-                /* For arbiter configuration only. */
+-                dict_t **pre_op_xdata;
++                /* Changelog xattr dict for [f]xattrop*/
++                dict_t **changelog_xdata;
+                 unsigned char *pre_op_sources;
+ 
+ 		/* @failed_subvols: subvolumes on which a pre-op or a
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index ce18fed..0ce2acd 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -27,6 +27,7 @@ SRC_URI += "file://glusterd.init \
             file://0002-posix-disable-open-read-write-on-special-files.patch \
             file://0003-server-protocol-don-t-allow-.-path-in-name.patch \
             file://0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch \
+            file://0005-cluster-afr-Fix-dict-leak-in-pre-op.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


