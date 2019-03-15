Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A5610E00D31; Fri, 15 Mar 2019 01:55:39 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 79A6CE00D28
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Mar 2019 01:55:38 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x2F8tYb2016659
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 01:55:34 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 01:55:33 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Mar 2019 01:55:31 -0700
Message-ID: <20190315085532.79535-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190315085532.79535-1-hongzhi.song@windriver.com>
References: <20190315085532.79535-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/2] nagios-nsca: uprev to v2.9.2
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
X-List-Received-Date: Fri, 15 Mar 2019 08:55:39 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 ...1-Fix-missing-argument-in-open-calls.patch | 52 -------------------
 ...ios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} |  9 ++--
 2 files changed, 4 insertions(+), 57 deletions(-)
 delete mode 100644 recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
 rename recipes-extended/nagios/{nagios-nsca_2.9.1.bb => nagios-nsca_2.9.2.bb} (88%)

diff --git a/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch b/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
deleted file mode 100644
index 6b39fec..0000000
--- a/recipes-extended/nagios/nagios-nsca/0001-Fix-missing-argument-in-open-calls.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From da37e6ce2a8cc315845440488cd2f8dab0a17bfe Mon Sep 17 00:00:00 2001
-From: "John C. Frickson" <jfrickson@nagios.com>
-Date: Wed, 7 Oct 2015 14:06:58 -0500
-Subject: [PATCH] Fix missing argument in open calls
-
-Commit b9f2c08dfdf31430f972a48781fc115c4af13cfe
-from https://github.com/NagiosEnterprises/nsca
-
-Fix for issue http://tracker.nagios.org/view.php?id=286
-
-Upstream-Status: Backport
-
-Singed-off-by: John C. Frickson <jfrickson@nagios.com>
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
-[MA: Context updated to allow application to older version]
-Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
----
- Changelog  | 4 ++++
- src/nsca.c | 2 +-
- 2 files changed, 5 insertions(+), 1 deletion(-)
-
-diff --git a/Changelog b/Changelog
-index 3a7edd4..00ea11e 100644
---- a/Changelog
-+++ b/Changelog
-@@ -2,6 +2,10 @@
- NSCA Changelog
- **************
- 
-+2.9.x - xx/xx/xxxx
-+------------------
-+- Fix missing argument in open calls (Xavier Bachelot / John Frickson)
-+
- 2.9.1 - 01/27/2012
- ------------------
- - Applied patch to allow packets arriving with a future time stamp (Daniel Wittenberg)
-diff --git a/src/nsca.c b/src/nsca.c
-index 6b0e436..0e70b8b 100644
---- a/src/nsca.c
-+++ b/src/nsca.c
-@@ -477,7 +477,7 @@ static int read_config_file(char *filename){
-                             int checkresult_test_fd=-1;
-                             char *checkresult_test=NULL;
-                             asprintf(&checkresult_test,"%s/nsca.test.%i",check_result_path,getpid());
--                            checkresult_test_fd=open(checkresult_test,O_WRONLY|O_CREAT);
-+                            checkresult_test_fd=open(checkresult_test,O_WRONLY|O_CREAT,S_IWUSR);
-                             if (checkresult_test_fd>0){
-                                     unlink(checkresult_test);
-                                     }
--- 
-2.11.0
-
diff --git a/recipes-extended/nagios/nagios-nsca_2.9.1.bb b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
similarity index 88%
rename from recipes-extended/nagios/nagios-nsca_2.9.1.bb
rename to recipes-extended/nagios/nagios-nsca_2.9.2.bb
index f53a47a..d342810 100644
--- a/recipes-extended/nagios/nagios-nsca_2.9.1.bb
+++ b/recipes-extended/nagios/nagios-nsca_2.9.2.bb
@@ -6,18 +6,17 @@ SECTION = "console/network"
 PRIORITY = "optional"
 LICENSE = "GPLv2"
 
-LIC_FILES_CHKSUM = "file://src/nsca.c;beginline=1;endline=16;md5=c1bd17485c5c1dd42f664fe8b3528674"
+LIC_FILES_CHKSUM = "file://src/nsca.c;beginline=1;endline=16;md5=dd7a195cc7d8a3ebcfabd65360d0cab4"
 
 SRCNAME = "nsca"
 
 SRC_URI = "http://prdownloads.sourceforge.net/sourceforge/nagios/${SRCNAME}-${PV}.tar.gz \
            file://init-script.in \
            file://nagios-nsca.service \
-           file://0001-Fix-missing-argument-in-open-calls.patch \
 "
 
-SRC_URI[md5sum] = "3fe2576a8cc5b252110a93f4c8d978c6"
-SRC_URI[sha256sum] = "fb12349e50838c37954fe896ba6a026c09eaeff2f9408508ad7ede53e9ea9580"
+SRC_URI[md5sum] = "43f638c51367a3170476ed106fbb4858"
+SRC_URI[sha256sum] = "96eb04ef695873ce462e3f8db08e8a49456ff9595d11acf70a3dd8a2c4af3b5e"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
@@ -26,7 +25,7 @@ inherit update-rc.d autotools-brokensep systemd dos2unix
 DEPENDS = "libmcrypt"
 
 EXTRA_OECONF += "--with-nsca-user=${NAGIOS_USER} \
-                 --with-nsca-group=${NAGIOS_GROUP} \
+                 --with-nsca-grp=${NAGIOS_GROUP} \
                  --with-libmcrypt-prefix=${STAGING_DIR_HOST} \
                  ac_cv_path_LIBMCRYPT_CONFIG=${STAGING_BINDIR_CROSS}/libmcrypt-config \
                  ac_cv_lib_wrap_main=no \
-- 
2.17.1


