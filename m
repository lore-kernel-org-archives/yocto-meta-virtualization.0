Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AB7DE009DF; Wed, 22 Jul 2015 09:12:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6FAD4E00927
	for <meta-virtualization@yoctoproject.org>;
	Wed, 22 Jul 2015 09:12:49 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t6MGCmEE018876
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Wed, 22 Jul 2015 09:12:48 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.85)
	(envelope-from <amy.fong@windriver.com>)
	id 1ZHwdA-0008GH-3X; Wed, 22 Jul 2015 12:12:28 -0400
Date: Wed, 22 Jul 2015 12:12:28 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org, amy.fong@windriver.com
Message-ID: <20150722161227.GA31716@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] docker-registry invalid path on startup
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
X-List-Received-Date: Wed, 22 Jul 2015 16:12:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

From 383cba6388cf7a1a221a0b03b78d017b0f0fe299 Mon Sep 17 00:00:00 2001
From: Amy Fong <amy.fong@windriver.com>
Date: Wed, 22 Jul 2015 10:43:14 -0400
Subject: [PATCH] docker-registry invalid path on startup

Systemd throws the following warning at boot:
systemd[1]: [/lib/systemd/system/docker-registry.service:10]
	Not an absolute path, ignoring: #WORKDIR#

Fix WORKDIR in docker-registry's systemd from #WORKDIR# to
${PYTHON_SITEPACKAGES_DIR}/docker_registry

Signed-off-by: Amy Fong <amy.fong@windriver.com>
---
 recipes-containers/docker-registry/docker-registry_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker-registry/docker-registry_git.bb b/recipes-containers/docker-registry/docker-registry_git.bb
index 338cb69..fe766d2 100644
--- a/recipes-containers/docker-registry/docker-registry_git.bb
+++ b/recipes-containers/docker-registry/docker-registry_git.bb
@@ -83,6 +83,7 @@ do_install_append() {
 	if ${@base_contains('DISTRO_FEATURES','systemd','true','false',d)}; then
 		install -d ${D}${systemd_unitdir}/system
 		install -m 644 ${WORKDIR}/docker-registry.service ${D}/${systemd_unitdir}/system
+		sed -i "s|#WORKDIR#|${PYTHON_SITEPACKAGES_DIR}/docker_registry|" ${D}/${systemd_unitdir}/system/docker-registry.service
 	fi
 	# based on config_mirror.yml - uses /var/docker-registry instead of /tmp for files
 	install ${WORKDIR}/config.yml ${D}/etc/docker-registry.yml
-- 
2.1.4


