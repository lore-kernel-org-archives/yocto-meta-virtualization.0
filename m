Return-Path: <anders.roxell@linaro.org>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id A14C2E01538
	for <meta-virtualization@yoctoproject.org>;
	Tue, 11 Jun 2013 01:48:20 -0700 (PDT)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.2.318.1;
	Tue, 11 Jun 2013 10:48:14 +0200
Received: by sestofb10.enea.se (Postfix, from userid 3976)	id EAB6D287C49;
	Tue, 11 Jun 2013 10:48:13 +0200 (CEST)
From: Anders Roxell <anders.roxell@linaro.org>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 11 Jun 2013 10:48:10 +0200
Message-ID: <1370940490-41856-1-git-send-email-anders.roxell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: anders.roxell@linaro.org does not
	designate permitted sender hosts)
Subject: [PATCH] openvswitch: Checksum missmatch fix
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
X-List-Received-Date: Tue, 11 Jun 2013 08:48:22 -0000
Content-Type: text/plain

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 recipes-networking/openvswitch/openvswitch_1.10.0.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-networking/openvswitch/openvswitch_1.10.0.bb b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
index 2e89454..fe112f2 100644
--- a/recipes-networking/openvswitch/openvswitch_1.10.0.bb
+++ b/recipes-networking/openvswitch/openvswitch_1.10.0.bb
@@ -23,8 +23,8 @@ SRC_URI = "http://openvswitch.org/releases/openvswitch-${PV}.tar.gz \
 	file://openvswitch-controller-setup \
 	"
 
-SRC_URI[md5sum] = "e9004202b0e10c0de9870f19d2044f11"
-SRC_URI[sha256sum] = "825730db82c7b46a142f057a43345590c299e66704ef7a88d9ed4ffd0c3d6b64"
+SRC_URI[md5sum] = "fe8b49efe9f86b57abab00166b971106"
+SRC_URI[sha256sum] = "803966c89d6a5de6d710a2cb4ed73ac8d8111a2c44b12b846dcef8e91ffab167"
 LIC_FILES_CHKSUM = "file://COPYING;md5=49eeb5acb1f5e510f12c44f176c42253"
 
 # Don't compile kernel modules by default since it heavily depends on
-- 
1.7.10.4


