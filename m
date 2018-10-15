Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3FD79E00901; Mon, 15 Oct 2018 00:28:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CD5CE008D7
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Oct 2018 00:28:21 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9F7SLdk017120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 15 Oct 2018 00:28:21 -0700 (PDT)
Received: from pek-hostel-deb01.wrs.com (128.224.153.151) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Mon, 15 Oct 2018 00:28:21 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 15 Oct 2018 15:15:20 +0800
Message-ID: <1539587720-29268-1-git-send-email-Qi.Chen@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] libvirt: do not defer postinstall to first boot when not necessary
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
X-List-Received-Date: Mon, 15 Oct 2018 07:28:23 -0000
Content-Type: text/plain

The postinstall in libvirt has already got a check against $D to
tell whether it's running on target or not, we do not need to use
pkg_postinstall_ontarget. Otherwise, we get unnecessary postinstall
deferred to first boot, which is not what we want.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 recipes-extended/libvirt/libvirt_4.7.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-extended/libvirt/libvirt_4.7.0.bb b/recipes-extended/libvirt/libvirt_4.7.0.bb
index 47275ae..ecccfee 100644
--- a/recipes-extended/libvirt/libvirt_4.7.0.bb
+++ b/recipes-extended/libvirt/libvirt_4.7.0.bb
@@ -311,7 +311,7 @@ do_install_ptest() {
 	done
 }
 
-pkg_postinst_ontarget_${PN}() {
+pkg_postinst_${PN}() {
         if [ -z "$D" ] && [ -e /etc/init.d/populate-volatile.sh ] ; then
                 /etc/init.d/populate-volatile.sh update
         fi
-- 
2.7.4


