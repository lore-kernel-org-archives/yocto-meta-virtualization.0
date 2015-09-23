Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BBFD4E00A8C; Wed, 23 Sep 2015 09:46:02 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 48655E00A8C
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Sep 2015 09:45:56 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 23 Sep 2015 18:45:51 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 23 Sep 2015 18:45:51 +0200
Message-ID: <1443026751-57424-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH] python-glancestore: requires python module enum
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
X-List-Received-Date: Wed, 23 Sep 2015 16:46:02 -0000
Content-Type: text/plain

In capabilities, glance store imports enum, which is available
since python 3.4. For earlier versions of python we can use
the backported package python-enum34 from meta-python.

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
---
 meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
index b3aa2f3..43707ee 100644
--- a/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-glancestore_git.bb
@@ -22,6 +22,7 @@ DEPENDS += " \
         "
 
 RDEPENDS_${PN} = " \
+   python-enum34 \
    python-eventlet \
    python-iso8601 \
    python-six \
-- 
1.9.1


