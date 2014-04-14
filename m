Return-Path: <misn@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D00ADE00BAA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 14 Apr 2014 06:26:28 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 14 Apr 2014 15:26:22 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4351)	id B058428841A;
	Mon, 14 Apr 2014 15:26:22 +0200 (CEST)
From: Mihaela Sendrea <mihaela.sendrea@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 14 Apr 2014 15:26:20 +0200
Message-ID: <1397481980-65447-3-git-send-email-mihaela.sendrea@enea.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
References: <1397481980-65447-1-git-send-email-mihaela.sendrea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: mihaela.sendrea@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 2/2] lxc: Update version to 1.0.1
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
X-List-Received-Date: Mon, 14 Apr 2014 13:26:29 -0000
Content-Type: text/plain

Signed-off-by: Mihaela Sendrea <mihaela.sendrea@enea.com>
---
 recipes-containers/lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename recipes-containers/lxc/{lxc_1.0.0.bb => lxc_1.0.1.bb} (94%)

diff --git a/recipes-containers/lxc/lxc_1.0.0.bb b/recipes-containers/lxc/lxc_1.0.1.bb
similarity index 94%
rename from recipes-containers/lxc/lxc_1.0.0.bb
rename to recipes-containers/lxc/lxc_1.0.1.bb
index 5a35177..b366116 100644
--- a/recipes-containers/lxc/lxc_1.0.0.bb
+++ b/recipes-containers/lxc/lxc_1.0.1.bb
@@ -30,8 +30,8 @@ SRC_URI = "http://linuxcontainers.org/downloads/${BPN}-${PV}.tar.gz \
 	file://runtest.patch \
 	file://run-ptest \
 	"
-SRC_URI[md5sum] = "87a9d168a6e55326303cce3b2cb7f82e"
-SRC_URI[sha256sum] = "0992212ddaad01dfe8c048e130566b73dd5f34191585f36bdac07a4f8a91f3bd"
+SRC_URI[md5sum] = "3c7379891e45713817ec873a167070b0"
+SRC_URI[sha256sum] = "17d8e5b575207b4fb57da0b8ba2d13f3e5ee20ce8ccd1259d6eae4bd5ca575b1"
 
 S = "${WORKDIR}/${BPN}-${PV}"
 
-- 
1.8.5.3


