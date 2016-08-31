Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EF93DE007A2; Wed, 31 Aug 2016 11:19:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 99BBEE006C6
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 11:19:45 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u7VIJidY010706
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 31 Aug 2016 11:19:45 -0700
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 31 Aug 2016 11:19:44 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 31 Aug 2016 14:19:42 -0400
Message-ID: <1472667583-9767-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 1/2] docker: cgroup-lite is not required with systemd
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
X-List-Received-Date: Wed, 31 Aug 2016 18:19:47 -0000
Content-Type: text/plain

Systemd takes care of setting up the various cgroup mounts at boot,
and likewise the tearing down of these at shutdown. It is therefor a
useless dependency when we are using systemd.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 recipes-containers/docker/docker_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index f3c940d..4f85193 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -53,7 +53,9 @@ DEPENDS = "go-cross \
     "
 
 DEPENDS_append_class-target = "lvm2"
-RDEPENDS_${PN} = "curl aufs-util git cgroup-lite util-linux iptables"
+RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
+                  ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
+                 "
 RDEPENDS_${PN} += "containerd runc"
 RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
 RRECOMMENDS_${PN} += " kernel-module-dm-thin-pool kernel-module-nf-nat"
-- 
2.1.4


