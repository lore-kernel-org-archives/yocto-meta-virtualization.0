Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6D002E009C3; Tue, 14 Apr 2015 22:58:36 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4085FE0076B
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:32 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3F5wWpV022060
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:32 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 22:58:37 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 13:58:25 +0800
Message-ID: <b2e93984cfdb2eb9bc076dc393cafff4f1e73931.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1429074850.git.jackie.huang@windriver.com>
References: <cover.1429074850.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 02/14] rest-client: upgrade to 1.7.3
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
X-List-Received-Date: Wed, 15 Apr 2015 05:58:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/ruby/rest-client_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/ruby/rest-client_git.bb b/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
index 0b79cfe..24006ae 100644
--- a/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/rest-client_git.bb
@@ -7,13 +7,13 @@ Sinatra's microframework style of specifying actions: get, put, post, \
 delete."
 
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://README.rdoc;beginline=285;md5=f649e8be3b8f05776195b7aa04d974c6"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4c0cdd6bc54a36dbe54c0f2fa70797"
 
 PR = "r0"
 
-BPV = "1.6.7"
+BPV = "1.7.3"
 PV = "${BPV}"
-SRCREV = "d96be9d1dc8b1b4c04d90a62244b87ded8d86f0c"
+SRCREV = "988d5a81ff3081c1c6a3ab267e81a9fff94bd9e4"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


