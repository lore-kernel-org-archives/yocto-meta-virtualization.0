Return-Path: <Zibo.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9856FE007DB; Wed, 27 Aug 2014 09:06:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F7FDE007B9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 09:06:27 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s7RG6PwM027181
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 27 Aug 2014 09:06:25 -0700 (PDT)
Received: from ovp-zzhao2.wrs.com (128.224.56.212) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 27 Aug 2014 09:06:25 -0700
From: Zibo Zhao <Zibo.Zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 27 Aug 2014 12:06:07 -0400
Message-ID: <1409155567-13758-1-git-send-email-Zibo.Zhao@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] protobuf: fix ptest compile errors
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
X-List-Received-Date: Wed, 27 Aug 2014 16:06:35 -0000
Content-Type: text/plain

While buiding protobuf ptest on Centos 6.4, the build
failed with errors:

...libprotobuf.so: undefined reference to `memcpy@GLIBC_2.14'

This is due to protobuf.pc still contains /usr/lib64
as libdir which are not good for cross compiling.
Replace it with proper sysroot path.

Signed-off-by: Zibo Zhao <Zibo.Zhao@windriver.com>
---
 recipes-containers/criu/protobuf_2.5.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/criu/protobuf_2.5.0.bb b/recipes-containers/criu/protobuf_2.5.0.bb
index 5c7454b..c4b7d18 100644
--- a/recipes-containers/criu/protobuf_2.5.0.bb
+++ b/recipes-containers/criu/protobuf_2.5.0.bb
@@ -37,6 +37,7 @@ do_compile_ptest() {
 	# Add the location of the cross-compiled header and library files
 	# which haven't been installed yet.
 	cp "${S}/protobuf.pc" "${S}/${TEST_SRC_DIR}/protobuf.pc"
+	sed -e 's|libdir=|libdir=${PKG_CONFIG_SYSROOT_DIR}|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Cflags:|Cflags: -I${S}/src|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
 	sed -e 's|Libs:|Libs: -L${S}/src/.libs|' -i "${S}/${TEST_SRC_DIR}/protobuf.pc"
 	export PKG_CONFIG_PATH="${S}/${TEST_SRC_DIR}"
-- 
1.9.1


