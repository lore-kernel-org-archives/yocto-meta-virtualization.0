Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 12D77E00848; Fri, 17 Aug 2018 13:43:38 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00500E00848
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Aug 2018 13:43:36 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7HKhaX8019198
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 17 Aug 2018 13:43:36 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.399.0;
	Fri, 17 Aug 2018 13:43:35 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Fri, 17 Aug 2018 16:43:28 -0400
Message-ID: <1534538608-15231-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534538608-15231-1-git-send-email-mark.asselstine@windriver.com>
References: <1534538608-15231-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] libvirt: uprev to v4.5.0
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
X-List-Received-Date: Fri, 17 Aug 2018 20:43:38 -0000
Content-Type: text/plain

Although v4.6.0 was just recently released we do not want to jump to
it due to:

https://bugzilla.redhat.com/show_bug.cgi?id=1614569

Unfortunately the mess around the above defect basically renders that
release useless. We will need to keep an eye for either a v4.7.0 or
grab updates off of the 'v4.5-maint' over the coming weeks.

As usual I have tested using qemu and lxc usecases (define, boot and
'virsh console' onto a guest). The ptests results match those of
v4.3.0:

  ======================================
  Testsuite summary for libvirt 4.5.0
  ======================================
  # TOTAL: 119
  # PASS:  114
  # SKIP:  0
  # XFAIL: 0
  # FAIL:  5
  # XPASS: 0
  # ERROR: 0

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---

NOTE: I was seeing an odd behavior while testing that I don't
believe was libvirt but rather related to other packages on
the system. Basically libvirtd would fail to fully start until
I would perform a 'find / -name "*sock*"' on the system. I was
not seeing this originally and it only manifested after I pulled
updates for other layers.


 recipes-extended/libvirt/libvirt-python.inc                     | 4 ++--
 recipes-extended/libvirt/{libvirt_4.3.0.bb => libvirt_4.5.0.bb} | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename recipes-extended/libvirt/{libvirt_4.3.0.bb => libvirt_4.5.0.bb} (98%)

diff --git a/recipes-extended/libvirt/libvirt-python.inc b/recipes-extended/libvirt/libvirt-python.inc
index 79beb95..cdc5719 100644
--- a/recipes-extended/libvirt/libvirt-python.inc
+++ b/recipes-extended/libvirt/libvirt-python.inc
@@ -18,8 +18,8 @@ FILES_${PN}-python = "${bindir}/* ${libdir}/* ${libdir}/${PYTHON_DIR}/*"
 SRC_URI += "http://libvirt.org/sources/python/libvirt-python-${PV}.tar.gz;name=libvirt_python"
 SRC_URI += "file://libvirt_api_xml_path.patch;patchdir=../libvirt-python-${PV}"
 
-SRC_URI[libvirt_python.md5sum] = "2ea5f1871358e6a5788b52c2e1a0b809"
-SRC_URI[libvirt_python.sha256sum] = "efe384479a0bf74b1b83bba208887b263cc0061fd4f87759cf3067a403618ea9"
+SRC_URI[libvirt_python.md5sum] = "0c1b66a8878d6436b036565060707f73"
+SRC_URI[libvirt_python.sha256sum] = "ef35ed6bc24d76563b1ba9b068ef5a048016726dba62a9d057fe6dfbea6b0f60"
 
 export LIBVIRT_API_PATH = "${S}/docs/libvirt-api.xml"
 export LIBVIRT_CFLAGS = "-I${S}/include"
diff --git a/recipes-extended/libvirt/libvirt_4.3.0.bb b/recipes-extended/libvirt/libvirt_4.5.0.bb
similarity index 98%
rename from recipes-extended/libvirt/libvirt_4.3.0.bb
rename to recipes-extended/libvirt/libvirt_4.5.0.bb
index bb4a256..9cfa74a 100644
--- a/recipes-extended/libvirt/libvirt_4.3.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.5.0.bb
@@ -37,8 +37,8 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
            file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
           "
 
-SRC_URI[libvirt.md5sum] = "946cfa2558401612c4fcbc934ef9077b"
-SRC_URI[libvirt.sha256sum] = "a531e22c8b985ecb2d1223b913fd6ec0f1800e3ebe02351924274885db20c2b7"
+SRC_URI[libvirt.md5sum] = "692b2d00907438ed08a68813d3177cd3"
+SRC_URI[libvirt.sha256sum] = "e7e95edc0ca553046761ed55a8d01a06a3a3a4238bbeaedb3ba34680a277ab09"
 
 inherit autotools gettext update-rc.d pkgconfig ptest systemd
 
-- 
2.7.4


