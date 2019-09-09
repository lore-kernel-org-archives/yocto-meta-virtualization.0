Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5A066E0097C; Mon,  9 Sep 2019 02:43:01 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E0A65E008F2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Sep 2019 02:43:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x899gNUN032047
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 9 Sep 2019 02:42:33 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.468.0; Mon, 9 Sep 2019 02:42:12 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@gmail.com>
Date: Mon, 9 Sep 2019 17:42:10 +0800
Message-ID: <1568022130-15624-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568022130-15624-1-git-send-email-zhe.he@windriver.com>
References: <1568022130-15624-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services] [PATCH 2/2] consul: Not automatically start system service on boot
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
X-List-Received-Date: Mon, 09 Sep 2019 09:43:01 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

The systemd service needs to be tuned according to various use cases and cannot
be able to always start successfully for example when there is no network
interface named br0 by default.

Thus the default configuration is mainly used as an example. Let's not
automatically start it on boot.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 recipes-connectivity/consul/consul_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-connectivity/consul/consul_git.bb b/recipes-connectivity/consul/consul_git.bb
index f3e64e9..566fbc9 100644
--- a/recipes-connectivity/consul/consul_git.bb
+++ b/recipes-connectivity/consul/consul_git.bb
@@ -25,7 +25,7 @@ inherit systemd go
 COMPATIBLE_HOST_mipsarch = "null"
 
 SYSTEMD_SERVICE_${PN} = "consul.service"
-SYSTEMD_AUTO_ENABLE_${PN} = "enable"
+SYSTEMD_AUTO_ENABLE_${PN} = "disable"
 
 do_install_append() {
     install -d ${D}/${systemd_unitdir}/system
-- 
2.7.4


