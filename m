Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E1069E00D24; Mon,  6 Nov 2017 09:02:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F0619E00D24
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 09:02:31 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA6H2UtX014305
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Nov 2017 09:02:31 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 09:02:30 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 6 Nov 2017 12:02:18 -0500
Message-ID: <1509987740-20453-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
References: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/4] rabbitmq-server: add missing depends on coreutils-native
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
X-List-Received-Date: Mon, 06 Nov 2017 17:02:33 -0000
Content-Type: text/plain

With the move to RSS this missing dependency became a build issue,
previously hidden by some other package fullfilling the dependency
before this package was built. With RSS we need to ensure all first
level dependencies are listed to avoid build failures. The build
requires the 'fold' command which is provided by coreutils-native.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb        | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
index 8e4be5f..7f003fd 100644
--- a/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
+++ b/meta-openstack/recipes-extended/rabbitmq/rabbitmq-server_3.2.4.bb
@@ -3,7 +3,6 @@ HOMEPAGE = "http://www.rabbitmq.com/"
 LICENSE = "MPL-1.1"
 LIC_FILES_CHKSUM = "file://LICENSE-MPL-RabbitMQ;md5=b651d0a6feaaf2bf5eb9d36b2495c510"
 SECTION = "network"
-DEPENDS = "erlang-native libxslt python-simplejson zip-native unzip-native libxslt-native"
 PR = "r2"
 
 SRC_URI = "http://www.rabbitmq.com/releases/rabbitmq-server/v${PV}/${PN}-${PV}.tar.gz \
@@ -17,6 +16,16 @@ SRC_URI = "http://www.rabbitmq.com/releases/rabbitmq-server/v${PV}/${PN}-${PV}.t
 SRC_URI[md5sum] = "09d1af64c005bc680d6790b90655d021"
 SRC_URI[sha256sum] = "a930f92b362df2f292ec5f0281aa2011eb0c668faf6e24c4653a9fc53ec43b9f"
 
+DEPENDS = " \
+    erlang-native \
+    libxslt \
+    python-simplejson \
+    zip-native \
+    unzip-native \
+    libxslt-native \
+    coreutils-native\
+"
+
 RDEPENDS_${PN} = "erlang erlang-modules"
 
 do_compile() {
-- 
2.7.4


