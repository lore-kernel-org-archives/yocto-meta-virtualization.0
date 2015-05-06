Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BCEDAE009E7; Tue,  5 May 2015 18:45:28 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7BEECE009AA
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 May 2015 18:45:18 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t461jIxP025967
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 May 2015 18:45:18 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 18:45:17 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 6 May 2015 09:45:08 +0800
Message-ID: <f29092b0a68af7c1971eb13593d971557317bbde.1430817811.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1430817811.git.jackie.huang@windriver.com>
References: <cover.1430817811.git.jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 10/10] python-barbican: upgrade to 2015.1.0
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
X-List-Received-Date: Wed, 06 May 2015 01:45:28 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-barbican_git.bb | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
index 24557ad..15459f1 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
@@ -8,15 +8,15 @@ PR = "r0"
 SRCNAME = "barbican"
 BARBICAN_MAX_PACKET_SIZE ?= "65535"
 
-SRC_URI = "git://github.com/openstack/barbican.git;branch=master \
+SRC_URI = "git://github.com/openstack/barbican.git;branch=stable/kilo \
            file://barbican.init \
            file://barbican-increase-buffer-size-to-support-PKI-tokens.patch \
            file://barbican-fix-path-to-find-configuration-files.patch \
            file://barbican-handle-white-space-in-date-strings.patch \
           "
 
-SRCREV = "12966ea7ad40622e4189d832d13f4d9bfb9f3ada"
-PV = "2015.1.0b3+git${SRCPV}"
+SRCREV = "e6f05febbe18a86e4e6b05acc5f4868fa3beb291"
+PV = "2015.1.0+git${SRCPV}"
 S = "${WORKDIR}/git"
 
 inherit update-rc.d setuptools identity hosts useradd default_configs openstackchef monitor
-- 
1.9.1


