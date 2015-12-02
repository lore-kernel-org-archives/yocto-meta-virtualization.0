Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 86981E00B85; Wed,  2 Dec 2015 08:34:12 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id E9CD8E00956
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:30 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:29 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:33 +0100
Message-ID: <1449073966-29707-28-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 27/40] python-nova: upgrade to 2015.1.2
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:12 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-nova_git.bb | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-nova_git.bb b/meta-openstack/recipes-devtools/python/python-nova_git.bb
index d7a585e..79fad92 100644
--- a/meta-openstack/recipes-devtools/python/python-nova_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-nova_git.bb
@@ -11,11 +11,11 @@ SRCNAME = "nova"
 
 FILESEXTRAPATHS_append := "${THISDIR}/${PN}"
 
-SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=master \
+SRC_URI = "git://github.com/openstack/${SRCNAME}.git;branch=stable/kilo \
            file://nova-add-migrate.cfg-to-the-MANIFEST.patch \
-           file://neutron-api-set-default-binding-vnic_type.patch \
            "
 # restore post stable/juno:
+#           file://neutron-api-set-default-binding-vnic_type.patch \
 #           file://websocketproxy-allow-empty-schemes-at-python-2.7.3.patch
 #           file://nova-convert-path-from-relative-to-absolute.patch 
 #           file://nova-fix-location-to-doc-directory.patch
@@ -27,8 +27,9 @@ SRC_URI += "file://nova-all \
             file://nova.conf \
             file://openrc \
            "
-SRCREV="b6e11261a97bf96d5f9866f277d8ecc3be7891e5"
-PV="2015.1.0b2+git${SRCPV}"
+SRCREV="24c6b904f75b6a544edc9d34ca0163df7d164a1a"
+# 2015.1.2 is 24c6b904f75b6a544edc9d34ca0163df7d164a1a
+PV="2015.1.2+git${SRCPV}"
 
 S = "${WORKDIR}/git"
 
-- 
2.1.0


