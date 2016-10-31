Return-Path: <s.lengfeld@phytec.de>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5DBD9E009F0; Mon, 31 Oct 2016 07:03:40 -0700 (PDT)
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
Received: from root.phytec.de (mail.phytec.eu [217.6.246.34])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A4201E009CA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Oct 2016 07:03:37 -0700 (PDT)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id C022DA00216
	for <meta-virtualization@yoctoproject.org>;
	Mon, 31 Oct 2016 15:04:08 +0100 (CET)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP5 HF413)
	with ESMTP id 2016103115033507-8423 ;
	Mon, 31 Oct 2016 15:03:35 +0100 
From: Stefan Lengfeld <s.lengfeld@phytec.de>
To: meta-virtualization@yoctoproject.org
Date: Mon, 31 Oct 2016 15:03:35 +0100
Message-Id: <1477922615-3973-1-git-send-email-s.lengfeld@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP5
	HF413|March 21, 2016) at 31.10.2016 15:03:35,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP5 HF413|March 21,
	2016) at 31.10.2016 15:03:35,
	Serialize complete at 31.10.2016 15:03:35
X-TNEFEvaluated: 1
Subject: [PATCH] docker: install script config-check.sh
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
X-List-Received-Date: Mon, 31 Oct 2016 14:03:40 -0000

The script /usr/share/docker/config-check.sh is very useful to test all
kernel requirements for docker. A lot of embedded boards will use a
custom kernel config that does not have all kernel features enabled by
default. Install the script so kernel developer can easily enable the
missing features.

Signed-off-by: Stefan Lengfeld <s.lengfeld@phytec.de>
---
 recipes-containers/docker/docker_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index 4be5e47..39852ad 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -126,6 +126,7 @@ do_install() {
 
 	mkdir -p ${D}/usr/share/docker/
 	cp ${WORKDIR}/hi.Dockerfile ${D}/usr/share/docker/
+	install -m 0755 ${S}/contrib/check-config.sh ${D}/usr/share/docker/
 }
 
 inherit useradd
-- 
1.9.1


