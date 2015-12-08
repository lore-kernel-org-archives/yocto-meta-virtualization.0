Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4E70E00BF7; Tue,  8 Dec 2015 09:34:34 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id ED437E00BB5
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:19 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:18 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:26 +0100
Message-ID: <1449596034-8308-15-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 14/42] python-httpretty: upgrade 0.8.7 -> 0.8.10
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:35 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 .../python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} (78%)

diff --git a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.7.bb b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
similarity index 78%
rename from meta-openstack/recipes-devtools/python/python-httpretty_0.8.7.bb
rename to meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
index 740c4ca..a6d622e 100644
--- a/meta-openstack/recipes-devtools/python/python-httpretty_0.8.7.bb
+++ b/meta-openstack/recipes-devtools/python/python-httpretty_0.8.10.bb
@@ -13,8 +13,8 @@ SRCNAME = "httpretty"
 SRC_URI = "https://pypi.python.org/packages/source/h/${SRCNAME}/${SRCNAME}-${PV}.tar.gz \
           "
 
-SRC_URI[md5sum] = "753b82f3bf632fbfc595816a0f6691f0"
-SRC_URI[sha256sum] = "bff5e3320fae20e3e7650bed216847ec32f3e85329014edb4d7ec2bc1b68cae2"
+SRC_URI[md5sum] = "9c130b16726cbf85159574ae5761bce7"
+SRC_URI[sha256sum] = "474a72722d66841f0e59cee285d837e1c6263be5be7bf2f8e824fc849a99adda"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.5.0


