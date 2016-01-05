Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 10A9CE00D7F; Mon,  4 Jan 2016 18:02:02 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CFB7CE00CE7
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 18:01:59 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2212941"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 10:01:53 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id E732941890FA
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 10:01:41 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 10:05:13 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Jan 2016 05:01:06 +0300
Message-ID: <1451959280-3349-8-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
	<1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: E732941890FA.AEC9D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
Subject: [m-c-s][PATCH 07/21] python-keystoneclient: Error fix
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
X-List-Received-Date: Tue, 05 Jan 2016 02:02:02 -0000
Content-Type: text/plain

python-keystoneclient depends on python-pbr, and will download pbr modules
in the step of do_compile.
If your network is not very well,errors will occur as following:
  Download error on https://pypi.python.org/simple/pbr/:
  [Errno -5] No address associated with hostname -- Some packages may not be found!
  Couldn't find index page for 'pbr' (maybe misspelled?)
  No local packages or download links found for pbr

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 .../recipes-devtools/python/python-keystoneclient_git.bb           | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
index f4810e5..f1516d8 100644
--- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
@@ -39,6 +39,13 @@ RDEPENDS_${PN} += " \
 PACKAGECONFIG ?= "bash-completion"
 PACKAGECONFIG[bash-completion] = ",,bash-completion,bash-completion ${BPN}-bash-completion"
 
+do_compile_prepend() {
+    install -d ${S}/.eggs
+    if [ -f ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pbr*.egg ]; then
+        cp ${STAGING_DIR_HOST}/${PYTHON_SITEPACKAGES_DIR}/pbr*.egg ${S}/.eggs/
+    fi
+}
+
 do_install_append() {
 	install -d ${D}/${sysconfdir}/bash_completion.d
 	install -m 664 ${S}/tools/keystone.bash_completion ${D}/${sysconfdir}/bash_completion.d
-- 
1.8.4.2




