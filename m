Return-Path: <anselmo.melo@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8C105E00BB6; Mon, 19 Jun 2017 19:03:55 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [134.134.136.24 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5A5E5E00B05
	for <meta-virtualization@yoctoproject.org>;
	Mon, 19 Jun 2017 19:03:52 -0700 (PDT)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jun 2017 19:03:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,363,1493708400"; d="scan'208";a="116420260"
Received: from gwmcmull-mobl2.amr.corp.intel.com (HELO
	lacerdas-mobl.amr.corp.intel.com) ([10.254.74.203])
	by fmsmga005.fm.intel.com with ESMTP; 19 Jun 2017 19:03:52 -0700
From: "Anselmo L. S. Melo" <anselmo.melo@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon, 19 Jun 2017 19:02:51 -0700
Message-Id: <20170620020251.14885-1-anselmo.melo@intel.com>
X-Mailer: git-send-email 2.13.1
Subject: [PATCH] docker: Remove libtrust from dependencies
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
X-List-Received-Date: Tue, 20 Jun 2017 02:03:55 -0000

According to https://github.com/docker/libtrust, this repo is now deprecated
and the library was integrated in the docker-distribution repository.

Signed-off-by: Anselmo L. S. Melo <anselmo.melo@intel.com>
---
 recipes-containers/docker/docker_git.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 74170cb..c1b38dc 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -43,7 +43,6 @@ DEPENDS = " \
     go-context \
     go-mux \
     go-patricia \
-    go-libtrust \
     go-logrus \
     go-fsnotify \
     go-dbus \
-- 
2.13.1


