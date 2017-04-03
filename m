Return-Path: <Adrian.Calianu@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B1DDEE00AD5; Mon,  3 Apr 2017 00:38:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [185.38.181.43 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 143 seconds by postgrey-1.32 at yocto-www;
	Mon, 03 Apr 2017 00:38:46 PDT
Received: from smtp-out11.electric.net (smtp-out11.electric.net
	[185.38.181.43])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 63971E00AA5
	for <meta-virtualization@yoctoproject.org>;
	Mon,  3 Apr 2017 00:38:46 -0700 (PDT)
Received: from 1cuwZZ-0000fg-V9 by out11a.electric.net with emc1-ok (Exim 4.87)
	(envelope-from <Adrian.Calianu@enea.com>)
	id 1cuwZZ-0000gK-W0; Mon, 03 Apr 2017 00:38:45 -0700
Received: by emcmailer; Mon, 03 Apr 2017 00:38:45 -0700
Received: from [192.36.1.72] (helo=mx-3.enea.com)
	by out11a.electric.net with esmtps (TLSv1:ECDHE-RSA-AES256-SHA:256)
	(Exim 4.87) (envelope-from <Adrian.Calianu@enea.com>)
	id 1cuwZZ-0000fg-V9; Mon, 03 Apr 2017 00:38:45 -0700
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.319.2; Mon, 3 Apr 2017
	09:38:45 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4191)	id 7372228FE28;
	Mon,  3 Apr 2017 09:38:45 +0200 (CEST)
From: Adrian Calianu <adrian.calianu@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 3 Apr 2017 09:38:45 +0200
Message-ID: <1491205125-45147-1-git-send-email-adrian.calianu@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: adrian.calianu@enea.com does not
	designate permitted sender hosts)
X-Outbound-IP: 192.36.1.72
X-Env-From: Adrian.Calianu@enea.com
X-Proto: esmtps
X-Revdns: mx-3.enea.com
X-HELO: mx-3.enea.com
X-TLS: TLSv1:ECDHE-RSA-AES256-SHA:256
X-Authenticated_ID: 
X-PolicySMART: 6551647
X-Virus-Status: Scanned by VirusSMART (c)
X-Virus-Status: Scanned by VirusSMART (s)
Subject: [PATCHv1 1/1] docker: fix dependency issues with deb packaging
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
X-List-Received-Date: Mon, 03 Apr 2017 07:38:50 -0000
Content-Type: text/plain

dpkg-deb does not accept RDEPENDS += "virtual/xxxx"

'Provides' field, invalid package name 'virtual/containerd': character
'/' not allowed (only letters, digits and characters '-+._')

Signed-off-by: Adrian Calianu <adrian.calianu@enea.com>
---
 recipes-containers/containerd/containerd-docker_git.bb | 1 -
 recipes-containers/docker/docker_git.bb                | 2 +-
 recipes-containers/runc/runc-docker_git.bb             | 1 -
 3 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/recipes-containers/containerd/containerd-docker_git.bb b/recipes-containers/containerd/containerd-docker_git.bb
index f6dcaec..604ada3 100644
--- a/recipes-containers/containerd/containerd-docker_git.bb
+++ b/recipes-containers/containerd/containerd-docker_git.bb
@@ -7,4 +7,3 @@ SRC_URI = "\
 CONTAINERD_VERSION = "0.2.3"
 
 PROVIDES += "virtual/containerd"
-RPROVIDES_${PN} = "virtual/containerd"
diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 6b73cf3..16d1dad 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -64,7 +64,7 @@ DEPENDS_append_class-target = " lvm2"
 RDEPENDS_${PN} = "curl aufs-util git util-linux iptables \
                   ${@bb.utils.contains('DISTRO_FEATURES','systemd','','cgroup-lite',d)} \
                  "
-RDEPENDS_${PN} += "virtual/containerd virtual/runc"
+RDEPENDS_${PN} += "containerd-docker runc-docker"
 
 RRECOMMENDS_${PN} = "kernel-module-dm-thin-pool kernel-module-nf-nat"
 RSUGGESTS_${PN} = "lxc rt-tests"
diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
index 96d48ca..bf32953 100644
--- a/recipes-containers/runc/runc-docker_git.bb
+++ b/recipes-containers/runc/runc-docker_git.bb
@@ -8,4 +8,3 @@ SRC_URI = "git://github.com/docker/runc.git;nobranch=1 \
 
 RUNC_VERSION = "1.0.0-rc2"
 PROVIDES += "virtual/runc"
-RPROVIDES_${PN} = "virtual/runc"
-- 
1.9.1


