Return-Path: <denis@eukrea.com>
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A223AE00784
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Dec 2013 09:49:31 -0800 (PST)
Received: from denis-N73SV.local.eukrea.com (unknown [88.170.243.169])
	by smtp6-g21.free.fr (Postfix) with ESMTP id 472BD823AB;
	Wed,  4 Dec 2013 18:49:23 +0100 (CET)
From: Denis Carikli <denis@eukrea.com>
To: meta-virtualization@yoctoproject.org
Date: Wed,  4 Dec 2013 18:49:01 +0100
Message-Id: <1386179341-19457-2-git-send-email-denis@eukrea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1386179341-19457-1-git-send-email-denis@eukrea.com>
References: <1386179341-19457-1-git-send-email-denis@eukrea.com>
Subject: [PATCH 2/2] python-babel: add native support.
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
X-List-Received-Date: Wed, 04 Dec 2013 17:49:33 -0000

Signed-off-by: Denis Carikli <denis@eukrea.com>
---
 .../recipes-devtools/python/python-babel_1.3.bb    |    1 +
 .../recipes-devtools/python/python-pytz_2013.8.bb  |    2 ++
 2 files changed, 3 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
index cf2b7a8..11b79d8 100644
--- a/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
+++ b/meta-openstack/recipes-devtools/python/python-babel_1.3.bb
@@ -18,3 +18,4 @@ S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools
 
+BBCLASSEXTEND = "native"
diff --git a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
index cee4fc2..c5c3fce 100644
--- a/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
+++ b/meta-openstack/recipes-devtools/python/python-pytz_2013.8.bb
@@ -16,3 +16,5 @@ SRC_URI[sha256sum] = "58552e870aa2c0a1fa3b4ef923f00fbf3e55afaa87f8d31244d44f188d
 S = "${WORKDIR}/${SRCNAME}-${PV}"
 
 inherit setuptools 
+
+BBCLASSEXTEND = "native"
-- 
1.7.9.5


