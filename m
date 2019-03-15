Return-Path: <Hongzhi.Song@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4F99E00D28; Fri, 15 Mar 2019 01:56:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64E60E0096F
	for <meta-virtualization@yoctoproject.org>;
	Fri, 15 Mar 2019 01:56:21 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2F8tiRP004252
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 15 Mar 2019 01:55:55 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.439.0;
	Fri, 15 Mar 2019 01:55:34 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <bruce.ashfield@gmail.com>, <meta-virtualization@yoctoproject.org>
Date: Fri, 15 Mar 2019 01:55:32 -0700
Message-ID: <20190315085532.79535-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190315085532.79535-1-hongzhi.song@windriver.com>
References: <20190315085532.79535-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nagios-core: uprev to v4.4.3
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
X-List-Received-Date: Fri, 15 Mar 2019 08:56:21 -0000
Content-Type: text/plain

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 .../nagios/{nagios-core_4.4.2.bb => nagios-core_4.4.3.bb}     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-extended/nagios/{nagios-core_4.4.2.bb => nagios-core_4.4.3.bb} (97%)

diff --git a/recipes-extended/nagios/nagios-core_4.4.2.bb b/recipes-extended/nagios/nagios-core_4.4.3.bb
similarity index 97%
rename from recipes-extended/nagios/nagios-core_4.4.2.bb
rename to recipes-extended/nagios/nagios-core_4.4.3.bb
index b2196eb..cf37924 100644
--- a/recipes-extended/nagios/nagios-core_4.4.2.bb
+++ b/recipes-extended/nagios/nagios-core_4.4.3.bb
@@ -20,8 +20,8 @@ SRC_URI = "http://prdownloads.sourceforge.net/sourceforge/${SRCNAME}/${SRCNAME}-
            file://nagios-core-systemd-volatile.conf \
            "
 
-SRC_URI[md5sum] = "7a9736281d4e2ebe4f4569a782f733c5"
-SRC_URI[sha256sum] = "3418923f326aa86dc8c84cfd0df788fa495a90d772f8071acf40fdbef0736853"
+SRC_URI[md5sum] = "8beb253b1236ee1407f698b5d2a2d894"
+SRC_URI[sha256sum] = "bba8f0e8dc8cf72f7a7ae4e8ce9c60f5bd315629421b9ec34818a28b8da49f67"
 
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
-- 
2.17.1


