Return-Path: <Tudor.Florea@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6B469E002AC; Fri, 13 Feb 2015 13:59:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C819DE00288
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Feb 2015 13:59:09 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Feb 2015 22:59:04 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 972132800CB;
	Fri, 13 Feb 2015 22:59:04 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 13 Feb 2015 22:58:50 +0100
Message-ID: <1423864730-7582-1-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/1] tgt: Do not install the conflicting config files
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
X-List-Received-Date: Fri, 13 Feb 2015 21:59:11 -0000
Content-Type: text/plain

Do not install the (empty) config files as it will
conflict with the real config file installed by python-cinder package.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta-openstack/recipes-support/tgt/tgt_git.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/tgt/tgt_git.bb b/meta-openstack/recipes-support/tgt/tgt_git.bb
index 8be9fe4..b79cccc 100644
--- a/meta-openstack/recipes-support/tgt/tgt_git.bb
+++ b/meta-openstack/recipes-support/tgt/tgt_git.bb
@@ -22,7 +22,9 @@ do_compile() {
 }
 
 do_install() {
-    oe_runmake -e DESTDIR="${D}" install-programs install-conf install-scripts
+    #skip oe_runmake install-conf. The (empty) targets.conf file will confilct with
+    #the real file provided by python-cinder
+    oe_runmake -e DESTDIR="${D}" install-programs install-scripts
 
     if ${@base_contains('DISTRO_FEATURES', 'sysvinit', 'true', 'false', d)}; then
         install -d ${D}${sysconfdir}/init.d
-- 
1.9.1


