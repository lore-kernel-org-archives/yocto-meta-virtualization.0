Return-Path: <Tudor.Florea@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9AB27E00964; Fri, 13 Feb 2015 02:35:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 0C12EE008BC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 13 Feb 2015 02:35:18 -0800 (PST)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 13 Feb 2015 11:35:16 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 6DFF32800CA;
	Fri, 13 Feb 2015 11:35:16 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 13 Feb 2015 11:35:11 +0100
Message-ID: <1423823713-57878-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
References: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/3] json: make the previous patch really apply
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
X-List-Received-Date: Fri, 13 Feb 2015 10:35:25 -0000
Content-Type: text/plain

Change to get the patch 0001-Dont-compile-extensions.patch applied.

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 meta-openstack/recipes-devtools/ruby/json_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/ruby/json_git.bb b/meta-openstack/recipes-devtools/ruby/json_git.bb
index a852500..f738ece 100644
--- a/meta-openstack/recipes-devtools/ruby/json_git.bb
+++ b/meta-openstack/recipes-devtools/ruby/json_git.bb
@@ -17,9 +17,9 @@ S = "${WORKDIR}/git"
 
 SRC_URI = " \
     git://github.com/flori/json.git \
+    file://0001-Dont-compile-extensions.patch \
     "
 
 inherit ruby
 
 BBCLASSEXTEND = "native"
-    file://0001-Dont-compile-extensions.patch \
-- 
1.9.1


