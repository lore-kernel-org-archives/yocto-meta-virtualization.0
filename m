Return-Path: <hongl.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A65B4E00BAF; Tue, 29 May 2018 04:01:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1B8CE00C50
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 04:01:29 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40529800"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 29 May 2018 19:01:27 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id A8C784B40405
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 May 2018 19:01:22 +0800 (CST)
Received: from localhost.localdomain (10.167.226.122) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Tue, 29 May 2018 19:01:26 +0800
From: Hong Liu <hongl.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 29 May 2018 19:00:32 +0800
Message-ID: <20180529110036.32285-3-hongl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
References: <20180529110036.32285-1-hongl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.122]
X-yoursite-MailScanner-ID: A8C784B40405.AC5D3
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: hongl.fnst@cn.fujitsu.com
Subject: [PATCH] [meta-cloud-services][PATCH] python-oslo.config: 4.11.1 -> 6.2.1
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
X-List-Received-Date: Tue, 29 May 2018 11:01:30 -0000
Content-Type: text/plain

Upgrade python-oslo.config from 4.11.1 to 6.2.1

Signed-off-by: Hong Liu <hongl.fnst@cn.fujitsu.com>
---
 meta-openstack/recipes-devtools/python/python-oslo.config_git.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
index 0ccc66e..db37536 100644
--- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
@@ -4,11 +4,11 @@ SECTION = "devel/python"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c46f31914956e4579f9b488e71415ac8"
 
-PV = "4.11.1+git${SRCPV}"
-SRCREV = "fb0738974824af6e1bc7d9fdf32a7c1d3ebf65fb"
+PV = "6.2.1+git${SRCPV}"
+SRCREV = "3e7eecc9f43e4b326018c09d6976489ba5b0d098"
 
 SRCNAME = "oslo.config"
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/pike"
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master"
 
 S = "${WORKDIR}/git"
 
@@ -34,4 +34,4 @@ RDEPENDS_${PN} += " \
     python-rfc3986 \
     python-pyyaml \
     "
-	
\ No newline at end of file
+	
-- 
2.7.4




