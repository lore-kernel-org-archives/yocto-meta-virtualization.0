Return-Path: <s.lengfeld@phytec.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 90A1FE00C1A; Thu,  3 Nov 2016 03:01:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [217.6.246.34 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from root.phytec.de (mail.phytec.de [217.6.246.34])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3BB6AE00C17
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Nov 2016 03:01:23 -0700 (PDT)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 6DC05A00216
	for <meta-virtualization@yoctoproject.org>;
	Thu,  3 Nov 2016 11:01:56 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016110311012210-22042 ;
	Thu, 3 Nov 2016 11:01:22 +0100 
From: Stefan Lengfeld <s.lengfeld@phytec.de>
To: meta-virtualization@yoctoproject.org
Date: Thu, 3 Nov 2016 11:01:22 +0100
Message-Id: <1478167282-13037-1-git-send-email-s.lengfeld@phytec.de>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <CADkTA4PZsYZ3yGzqN6ZJe80k28eCKRfSZNWAtBro1bYpcqiraQ@mail.gmail.com>
References: <CADkTA4PZsYZ3yGzqN6ZJe80k28eCKRfSZNWAtBro1bYpcqiraQ@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 03.11.2016 11:01:22,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 03.11.2016 11:01:22,
	Serialize complete at 03.11.2016 11:01:22
X-TNEFEvaluated: 1
Subject: [PATCH v2] docker: install script config-check.sh
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
X-List-Received-Date: Thu, 03 Nov 2016 10:01:28 -0000

The script /usr/share/docker/config-check.sh is very useful to test all
kernel requirements for docker. A lot of embedded boards will use a
custom kernel config that does not have all kernel features enabled by
default. Install the script so kernel developer can easily enable the
missing features.

Signed-off-by: Stefan Lengfeld <s.lengfeld@phytec.de>
---
v2: put script into additional package 'docker-contrib'
v2: add package dependency to bash
---
 recipes-containers/docker/docker_git.bb | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 42a336e..cd9a69a 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -54,6 +54,8 @@ DEPENDS = "go-cross \
     go-distribution-digest \
     "
 
+PACKAGES =+ "${PN}-contrib"
+
 DEPENDS_append_class-target = "lvm2"
 RDEPENDS_${PN} = "curl aufs-util git cgroup-lite util-linux iptables"
 RRECOMMENDS_${PN} = "lxc docker-registry rt-tests"
@@ -125,6 +127,7 @@ do_install() {
 
 	mkdir -p ${D}/usr/share/docker/
 	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
+	install -m 0755 ${S}/contrib/check-config.sh ${D}/usr/share/docker/
 }
 
 inherit useradd
@@ -133,6 +136,9 @@ GROUPADD_PARAM_${PN} = "-r docker"
 
 FILES_${PN} += "/lib/systemd/system/*"
 
+FILES_${PN}-contrib += "/usr/share/docker/check-config.sh"
+RDEPENDS_${PN}-contrib += "bash"
+
 # DO NOT STRIP docker and dockerinit!!!
 #
 # Reason:
-- 
1.9.1


