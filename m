Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D9DA6E00DB6; Wed, 27 Dec 2017 22:43:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [192.103.53.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C0CF2E00D84
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Dec 2017 22:43:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBS6hvRl021974
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Dec 2017 22:43:57 -0800
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 27 Dec 2017 22:43:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 28 Dec 2017 14:41:48 +0800
Message-ID: <20171228064148.16987-1-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Subject: [PATCH] criu: set CLEANBROKEN to 1
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
X-List-Received-Date: Thu, 28 Dec 2017 06:43:59 -0000
Content-Type: text/plain

Rebuilding criu would cause the following error.

  | make: .gitid: Command not found
  | make: *** [Makefile:260: clean-top] Error 127

Fix this problem by setting CLEANBROKEN to "1".

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-containers/criu/criu_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/recipes-containers/criu/criu_git.bb b/recipes-containers/criu/criu_git.bb
index 3a02103..083609f 100644
--- a/recipes-containers/criu/criu_git.bb
+++ b/recipes-containers/criu/criu_git.bb
@@ -57,6 +57,8 @@ inherit setuptools
 PACKAGECONFIG ??= ""
 PACKAGECONFIG[selinux] = ",,libselinux"
 
+CLEANBROKEN = "1"
+
 do_compile_prepend() {
     rm -rf ${S}/images/google/protobuf/descriptor.proto
     ln -s  ${PKG_CONFIG_SYSROOT_DIR}/usr/include/google/protobuf/descriptor.proto ${S}/images/google/protobuf/descriptor.proto
-- 
2.11.0


