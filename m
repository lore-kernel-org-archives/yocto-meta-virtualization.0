Return-Path: <arnold.csorvasi@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BC275E00EAF; Tue, 29 Sep 2015 02:56:42 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [130.164.80.23 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 4722 seconds by postgrey-1.32 at yocto-www;
	Tue, 29 Sep 2015 02:56:40 PDT
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 10909E00A81
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 02:56:40 -0700 (PDT)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t8T8bwF6015334 for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Sep 2015 03:37:58 -0500
Received: from arnold-ro-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2015092903375815-693414 ;
	Tue, 29 Sep 2015 03:37:58 -0500 
From: Arnold Csorvasi <arnold.csorvasi@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 29 Sep 2015 11:37:56 +0300
Message-Id: <1443515876-3573-1-git-send-email-arnold.csorvasi@ni.com>
X-Mailer: git-send-email 2.1.4
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 09/29/2015 03:37:58 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 09/29/2015 03:37:58 AM,
	Serialize complete at 09/29/2015 03:37:58 AM
X-Proofpoint-Virus-Version: vendor=nai engine=5600 definitions=5800
	signatures=585085
Subject: [meta-cloud-services][fido-kilo][PATCH] qpid: inherit pkgconfig class
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
X-List-Received-Date: Tue, 29 Sep 2015 09:56:42 -0000

Also add -Wno-unused-function to prevent build from failing.

Signed-off-by: Arnold Csorvasi <arnold.csorvasi@ni.com>
---
 meta-openstack/recipes-extended/qpid/qpid_0.20.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
index a6f1c67..5e6ae2d 100644
--- a/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
+++ b/meta-openstack/recipes-extended/qpid/qpid_0.20.bb
@@ -17,7 +17,7 @@ SRC_URI[sha256sum] = "31b80ba3c4773d288b4e6245e3b2048438386331d460f7a7b0794cbd20
 
 S = "${WORKDIR}/${PN}c-${PV}"
 
-inherit autotools python-dir perlnative cpan-base update-rc.d
+inherit autotools python-dir perlnative cpan-base update-rc.d pkgconfig
 
 # Env var which tells perl if it should use host (no) or target (yes) settings
 export PERLCONFIGTARGET = "${@is_target(d)}"
@@ -27,6 +27,7 @@ export PERL_ARCHLIB = "${STAGING_LIBDIR}${PERL_OWN_DIR}/perl/${@get_perl_version
 export PERL="${STAGING_BINDIR}/perl"
 
 EXTRA_OECONF += " --without-help2man SASL_PASSWD=/usr/sbin/saslpasswd2"
+EXTRA_OEMAKE += " CPPFLAGS=-Wno-unused-function "
 
 do_install_append() {
      install -d ${D}${sysconfdir}/init.d
-- 
2.1.4


