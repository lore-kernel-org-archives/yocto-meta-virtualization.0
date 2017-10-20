Return-Path: <Kai.Kang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0714BE00D46; Thu, 19 Oct 2017 18:36:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A1FB7E00CD1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 18:36:53 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v9K1arGP008337
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Oct 2017 18:36:53 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 19 Oct 2017 18:36:52 -0700
From: <kai.kang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 20 Oct 2017 09:21:26 +0800
Message-ID: <20171020012126.3575-2-kai.kang@windriver.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20171020012126.3575-1-kai.kang@windriver.com>
References: <20171020012126.3575-1-kai.kang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xterm: remove bbappend
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
X-List-Received-Date: Fri, 20 Oct 2017 01:36:54 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Add freetype-native to DEPENDS has been done by PACKAGECONFIG 'xft'.

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend | 1 -
 1 file changed, 1 deletion(-)
 delete mode 100644 meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend

diff --git a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend b/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
deleted file mode 100644
index bb8c310..0000000
--- a/meta-openstack/recipes-graphics/xorg-app/xterm_325.bbappend
+++ /dev/null
@@ -1 +0,0 @@
-DEPENDS += "freetype-native"
-- 
2.14.1


