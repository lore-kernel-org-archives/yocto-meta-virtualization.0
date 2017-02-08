Return-Path: <amarnath.valluri@intel.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7D1C2E009C2; Wed,  8 Feb 2017 05:49:55 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [134.134.136.100 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8FC67E009A7
	for <meta-virtualization@yoctoproject.org>;
	Wed,  8 Feb 2017 05:49:52 -0800 (PST)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga105.jf.intel.com with ESMTP; 08 Feb 2017 05:49:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,346,1477983600"; d="scan'208";a="818478628"
Received: from avallurigigabyte.fi.intel.com ([10.237.72.170])
	by FMSMGA003.fm.intel.com with ESMTP; 08 Feb 2017 05:49:51 -0800
From: Amarnath Valluri <amarnath.valluri@intel.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  8 Feb 2017 15:46:32 +0200
Message-Id: <1486561594-24053-2-git-send-email-amarnath.valluri@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
References: <1486561594-24053-1-git-send-email-amarnath.valluri@intel.com>
Subject: [PATCH 2/4] docker: Replace /usr/share with ${datadir}
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
X-List-Received-Date: Wed, 08 Feb 2017 13:49:55 -0000

Make use of bitbake variable where appropriate, this makes the recipe portable.

Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com>
---
 recipes-containers/docker/docker_git.bb | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 62a016a..c22b916 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -142,18 +142,18 @@ do_install() {
 		install -m 0755 ${WORKDIR}/docker.init ${D}${sysconfdir}/init.d/docker.init
 	fi
 
-	mkdir -p ${D}/usr/share/docker/
-	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
-	install -m 0755 ${S}/contrib/check-config.sh ${D}/usr/share/docker/
+	mkdir -p ${D}${datadir}/docker/
+	cp ${WORKDIR}/hi.Dockerfile ${D}${datadir}/docker/
+	install -m 0755 ${S}/contrib/check-config.sh ${D}${datadir}/docker/
 }
 
 inherit useradd
 USERADD_PACKAGES = "${PN}"
 GROUPADD_PARAM_${PN} = "-r docker"
 
-FILES_${PN} += "/lib/systemd/system/*"
+FILES_${PN} += "${systemd_unitdir}/system/*"
 
-FILES_${PN}-contrib += "/usr/share/docker/check-config.sh"
+FILES_${PN}-contrib += "${datadir}/docker/check-config.sh"
 RDEPENDS_${PN}-contrib += "bash"
 
 # DO NOT STRIP docker
-- 
2.7.4


