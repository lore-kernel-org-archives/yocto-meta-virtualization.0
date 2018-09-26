Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CAAA6E00718; Tue, 25 Sep 2018 19:48:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 058DDE006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8Q2mPFe006528
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:48:35 -0700
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:48:14 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:26 +0800
Message-ID: <1537929391-32035-2-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/7] glusterfs: fix CVE-2018-10923
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
X-List-Received-Date: Wed, 26 Sep 2018 02:48:46 -0000
Content-Type: text/plain

Backport patch to fix the following CVE.

CVE: CVE-2018-10923

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 ...-disable-open-read-write-on-special-files.patch | 93 ++++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |  1 +
 2 files changed, 94 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch

diff --git a/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch b/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch
new file mode 100644
index 0000000..06cd06c
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0002-posix-disable-open-read-write-on-special-files.patch
@@ -0,0 +1,93 @@
+From 08dc006aac79ee1d1f6a5b7044fc973df7f00ed6 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Tue, 25 Sep 2018 14:02:01 +0800
+Subject: [PATCH 2/7] posix: disable open/read/write on special files
+
+In the file system, the responsibility w.r.to the block and char device
+files is related to only support for 'creating' them (using mknod(2)).
+
+Once the device files are created, the read/write syscalls for the specific
+devices are handled by the device driver registered for the specific major
+number, and depending on the minor number, it knows where to read from.
+Hence, we are at risk of reading contents from devices which are handled
+by the host kernel on server nodes.
+
+By disabling open/read/write on the device file, we would be safe with
+the bypass one can achieve from client side (using gfapi)
+
+Fixes: bz#1625096
+
+Change-Id: I48c776b0af1cbd2a5240862826d3d8918601e47f
+Signed-off-by: Amar Tumballi <amarts@redhat.com>
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10923
+Modified to suite the old version of glusterfs.
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ xlators/storage/posix/src/posix.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/xlators/storage/posix/src/posix.c b/xlators/storage/posix/src/posix.c
+index b1a529b..506ae91 100644
+--- a/xlators/storage/posix/src/posix.c
++++ b/xlators/storage/posix/src/posix.c
+@@ -3091,6 +3091,17 @@ posix_open (call_frame_t *frame, xlator_t *this,
+         priv = this->private;
+         VALIDATE_OR_GOTO (priv, out);
+ 
++        if (loc->inode &&
++            ((loc->inode->ia_type == IA_IFBLK) ||
++             (loc->inode->ia_type == IA_IFCHR))) {
++                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
++                        P_MSG_INVALID_ARGUMENT,
++                        "open received on a block/char file (%s)",
++                        uuid_utoa (loc->inode->gfid));
++                op_errno = EINVAL;
++                goto out;
++        }
++
+         MAKE_INODE_HANDLE (real_path, this, loc, &stbuf);
+         if (!real_path) {
+                 op_ret = -1;
+@@ -3180,6 +3191,17 @@ posix_readv (call_frame_t *frame, xlator_t *this,
+         priv = this->private;
+         VALIDATE_OR_GOTO (priv, out);
+ 
++        if (fd->inode &&
++            ((fd->inode->ia_type == IA_IFBLK) ||
++             (fd->inode->ia_type == IA_IFCHR))) {
++                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
++                        P_MSG_INVALID_ARGUMENT,
++                        "readv received on a block/char file (%s)",
++                        uuid_utoa (fd->inode->gfid));
++                op_errno = EINVAL;
++                goto out;
++        }
++
+         ret = posix_fd_ctx_get (fd, this, &pfd, &op_errno);
+         if (ret < 0) {
+                 gf_msg (this->name, GF_LOG_WARNING, op_errno, P_MSG_PFD_NULL,
+@@ -3415,6 +3437,17 @@ posix_writev (call_frame_t *frame, xlator_t *this, fd_t *fd,
+ 
+         VALIDATE_OR_GOTO (priv, out);
+ 
++        if (fd->inode &&
++            ((fd->inode->ia_type == IA_IFBLK) ||
++             (fd->inode->ia_type == IA_IFCHR))) {
++                gf_msg (this->name, GF_LOG_ERROR, EINVAL,
++                        P_MSG_INVALID_ARGUMENT,
++                        "writev received on a block/char file (%s)",
++                        uuid_utoa (fd->inode->gfid));
++                op_errno = EINVAL;
++                goto out;
++        }
++
+         ret = posix_fd_ctx_get (fd, this, &pfd, &op_errno);
+         if (ret < 0) {
+                 gf_msg (this->name, GF_LOG_WARNING, ret, P_MSG_PFD_NULL,
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index ea5f2b7..e332872 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -24,6 +24,7 @@ SRC_URI += "file://glusterd.init \
             file://0002-server-auth-add-option-for-strict-authentication.patch \
             file://0003-glusterfs-access-trusted-peer-group-via-remote-host-.patch \
             file://0001-dict-handle-negative-key-value-length-while-unserial.patch \
+            file://0002-posix-disable-open-read-write-on-special-files.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


