Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B0121E00A0A; Tue, 25 Sep 2018 19:49:12 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE252E00718
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:49:11 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8Q2nBii007034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 25 Sep 2018 19:49:11 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Tue, 25 Sep 2018 19:49:10 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Sep 2018 10:36:31 +0800
Message-ID: <1537929391-32035-7-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
References: <1537929391-32035-1-git-send-email-Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 7/7] glusterfs: fix CVE-2018-10907
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
X-List-Received-Date: Wed, 26 Sep 2018 02:49:12 -0000
Content-Type: text/plain

Backport a patch to fix the following CVE.

CVE: CVE-2018-10907

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 .../files/0007-protocol-don-t-use-alloca.patch     | 400 +++++++++++++++++++++
 recipes-extended/glusterfs/glusterfs.inc           |   1 +
 2 files changed, 401 insertions(+)
 create mode 100644 recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch

diff --git a/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch b/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch
new file mode 100644
index 0000000..bd45437
--- /dev/null
+++ b/recipes-extended/glusterfs/files/0007-protocol-don-t-use-alloca.patch
@@ -0,0 +1,400 @@
+From 7d8d9bd27f245739a6f297e4ecfc87b90c783987 Mon Sep 17 00:00:00 2001
+From: Chen Qi <Qi.Chen@windriver.com>
+Date: Wed, 26 Sep 2018 09:47:28 +0800
+Subject: [PATCH 7/7] protocol: don't use alloca
+
+current implementation of alloca can cause issues when strings larger
+than the allocated buffer is passed to the xdr. Hence it makes sense
+to allow XDR decode functions to deal with memory allocations, which
+we can free later.
+
+Fixes: bz#1625097
+
+Change-Id: I3a05553f5702de9575c244649ca0e5ac9abaac94
+Signed-off-by: Amar Tumballi <amarts@redhat.com>
+
+Upstream-Status: Backport
+
+Fix CVE-2018-10907
+
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ xlators/protocol/server/src/server-rpc-fops.c | 73 +++++++++++----------------
+ 1 file changed, 30 insertions(+), 43 deletions(-)
+
+diff --git a/xlators/protocol/server/src/server-rpc-fops.c b/xlators/protocol/server/src/server-rpc-fops.c
+index 0ba4ffa..d3a44fc 100644
+--- a/xlators/protocol/server/src/server-rpc-fops.c
++++ b/xlators/protocol/server/src/server-rpc-fops.c
+@@ -3983,8 +3983,6 @@ server3_3_create (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_create_req);
+         if (ret < 0) {
+@@ -4034,6 +4032,7 @@ server3_3_create (rpcsvc_request_t *req)
+ out:
+         /* memory allocated by libc, don't use GF_FREE */
+         free (args.xdata.xdata_val);
++        free (args.bname);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -4693,8 +4692,6 @@ server3_3_unlink (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_unlink_req);
+         if (ret < 0) {
+@@ -4734,6 +4731,7 @@ server3_3_unlink (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_unlink_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.bname);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -4755,8 +4753,6 @@ server3_3_setxattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.dict.dict_val = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_setxattr_req);
+         if (ret < 0) {
+@@ -4809,6 +4805,7 @@ server3_3_setxattr (rpcsvc_request_t *req)
+ 
+ out:
+         free (args.xdata.xdata_val);
++        free (args.dict.dict_val);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -4834,7 +4831,6 @@ server3_3_fsetxattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.dict.dict_val = alloca (req->msg[0].iov_len);
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_fsetxattr_req);
+         if (ret < 0) {
+@@ -4885,6 +4881,7 @@ server3_3_fsetxattr (rpcsvc_request_t *req)
+ 
+ out:
+         free (args.xdata.xdata_val);
++        free (args.dict.dict_val);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -4910,7 +4907,6 @@ server3_3_fxattrop (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.dict.dict_val = alloca (req->msg[0].iov_len);
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_fxattrop_req);
+         if (ret < 0) {
+@@ -4961,6 +4957,7 @@ server3_3_fxattrop (rpcsvc_request_t *req)
+ 
+ out:
+         free (args.xdata.xdata_val);
++        free (args.dict.dict_val);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -4986,8 +4983,6 @@ server3_3_xattrop (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.dict.dict_val = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_xattrop_req);
+         if (ret < 0) {
+@@ -5037,6 +5032,7 @@ server3_3_xattrop (rpcsvc_request_t *req)
+ 
+ out:
+         free (args.xdata.xdata_val);
++        free (args.dict.dict_val);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5060,8 +5056,6 @@ server3_3_getxattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.name = alloca (256);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_getxattr_req);
+         if (ret < 0) {
+@@ -5104,6 +5098,7 @@ server3_3_getxattr (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_getxattr_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5124,7 +5119,6 @@ server3_3_fgetxattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.name = alloca (256);
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_fgetxattr_req);
+         if (ret < 0) {
+@@ -5165,6 +5159,7 @@ server3_3_fgetxattr (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_fgetxattr_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5186,8 +5181,6 @@ server3_3_removexattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.name = alloca (256);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_removexattr_req);
+         if (ret < 0) {
+@@ -5225,6 +5218,7 @@ server3_3_removexattr (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_removexattr_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5244,8 +5238,6 @@ server3_3_fremovexattr (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.name = alloca (4096);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_fremovexattr_req);
+         if (ret < 0) {
+@@ -5284,6 +5276,7 @@ server3_3_fremovexattr (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_fremovexattr_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5561,8 +5554,6 @@ server3_3_mknod (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_mknod_req);
+         if (ret < 0) {
+@@ -5609,6 +5600,7 @@ out:
+ 
+         /* memory allocated by libc, don't use GF_FREE */
+         free (args.xdata.xdata_val);
++        free (args.bname);
+ 
+         return ret;
+ 
+@@ -5627,8 +5619,6 @@ server3_3_mkdir (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_mkdir_req);
+         if (ret < 0) {
+@@ -5674,6 +5664,7 @@ out:
+                 SERVER_REQ_SET_ERROR (req, ret);
+ 
+         free (args.xdata.xdata_val);
++        free (args.bname);
+ 
+         return ret;
+ }
+@@ -5691,8 +5682,6 @@ server3_3_rmdir (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_rmdir_req);
+         if (ret < 0) {
+@@ -5732,6 +5721,7 @@ server3_3_rmdir (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_rmdir_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.bname);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5754,8 +5744,6 @@ server3_3_inodelk (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.volume = alloca (256);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_inodelk_req);
+         if (ret < 0) {
+@@ -5822,6 +5810,7 @@ server3_3_inodelk (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_inodelk_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.volume);
+ 
+         free (args.flock.lk_owner.lk_owner_val);
+ 
+@@ -5843,7 +5832,6 @@ server3_3_finodelk (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.volume = alloca (256);
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_finodelk_req);
+         if (ret < 0) {
+@@ -5911,6 +5899,7 @@ server3_3_finodelk (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_finodelk_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.volume);
+ 
+         free (args.flock.lk_owner.lk_owner_val);
+ 
+@@ -5933,9 +5922,6 @@ server3_3_entrylk (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.volume = alloca (256);
+-        args.name   = alloca (256);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_entrylk_req);
+         if (ret < 0) {
+@@ -5979,6 +5965,8 @@ server3_3_entrylk (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_entrylk_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.volume);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -5998,9 +5986,6 @@ server3_3_fentrylk (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.name   = alloca (256);
+-        args.volume = alloca (256);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_fentrylk_req);
+         if (ret < 0) {
+@@ -6044,6 +6029,8 @@ server3_3_fentrylk (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_fentrylk_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.volume);
++        free (args.name);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -6121,9 +6108,6 @@ server3_3_symlink (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.bname    = alloca (req->msg[0].iov_len);
+-        args.linkname = alloca (4096);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_symlink_req);
+         if (ret < 0) {
+@@ -6168,6 +6152,8 @@ out:
+ 
+         /* memory allocated by libc, don't use GF_FREE */
+         free (args.xdata.xdata_val);
++        free (args.linkname);
++        free (args.bname);
+ 
+         return ret;
+ }
+@@ -6186,8 +6172,6 @@ server3_3_link (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.newbname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args, (xdrproc_t)xdr_gfs3_link_req);
+         if (ret < 0) {
+                 //failed to decode msg;
+@@ -6227,6 +6211,7 @@ server3_3_link (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_link_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.newbname);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -6247,9 +6232,6 @@ server3_3_rename (rpcsvc_request_t *req)
+         if (!req)
+                 return ret;
+ 
+-        args.oldbname = alloca (req->msg[0].iov_len);
+-        args.newbname = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_rename_req);
+         if (ret < 0) {
+@@ -6291,6 +6273,8 @@ server3_3_rename (rpcsvc_request_t *req)
+         resolve_and_resume (frame, server_rename_resume);
+ out:
+         free (args.xdata.xdata_val);
++        free (args.newbname);
++        free (args.oldbname);
+ 
+         if (op_errno)
+                 SERVER_REQ_SET_ERROR (req, ret);
+@@ -6537,9 +6521,6 @@ server3_3_lookup (rpcsvc_request_t *req)
+ 
+         GF_VALIDATE_OR_GOTO ("server", req, err);
+ 
+-        args.bname           = alloca (req->msg[0].iov_len);
+-        args.xdata.xdata_val = alloca (req->msg[0].iov_len);
+-
+         ret = xdr_to_generic (req->msg[0], &args,
+                               (xdrproc_t)xdr_gfs3_lookup_req);
+         if (ret < 0) {
+@@ -6585,8 +6566,14 @@ server3_3_lookup (rpcsvc_request_t *req)
+         ret = 0;
+         resolve_and_resume (frame, server_lookup_resume);
+ 
++        free (args.bname);
++        free (args.xdata.xdata_val);
++
+         return ret;
+ out:
++        free (args.bname);
++        free (args.xdata.xdata_val);
++
+         server_lookup_cbk (frame, NULL, frame->this, -1, EINVAL, NULL, NULL,
+                            NULL, NULL);
+ 	ret = 0;
+-- 
+2.7.4
+
diff --git a/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
index 525b905..8243f28 100644
--- a/recipes-extended/glusterfs/glusterfs.inc
+++ b/recipes-extended/glusterfs/glusterfs.inc
@@ -29,6 +29,7 @@ SRC_URI += "file://glusterd.init \
             file://0004-io-stats-dump-io-stats-info-in-var-run-gluster.patch \
             file://0005-cluster-afr-Fix-dict-leak-in-pre-op.patch \
             file://0006-posix-remove-not-supported-get-set-content.patch \
+            file://0007-protocol-don-t-use-alloca.patch \
            "
 
 LICENSE = "(LGPLv3+ | GPLv2) & GPLv3+ & LGPLv3+ & GPLv2+ & LGPLv2+ & LGPLv2.1+ & Apache-2.0"
-- 
2.7.4


