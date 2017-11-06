Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 740F3E00D33; Mon,  6 Nov 2017 09:02:32 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00973E00CC2
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Nov 2017 09:02:30 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vA6H2Tt5008653
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 6 Nov 2017 09:02:30 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 6 Nov 2017 09:02:28 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Mon, 6 Nov 2017 12:02:17 -0500
Message-ID: <1509987740-20453-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
References: <1509987740-20453-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/4] meta-openstack/README: drop meta-ruby
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
X-List-Received-Date: Mon, 06 Nov 2017 17:02:32 -0000
Content-Type: text/plain

meta-openembedded commit 6E7C9636D276 [meta-ruby: remove this now
pretty empty layer] removed the meta-ruby layer from existence. We can
therefor drop this layer dependency. Builds continue to work as the
various ruby recipes exist, they have just been moved out of the
'language layer'.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/README | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-openstack/README b/meta-openstack/README
index 1b136fa..9d240e4 100644
--- a/meta-openstack/README
+++ b/meta-openstack/README
@@ -19,7 +19,6 @@ URI: git://git.openembedded.org/meta-openembedded
 revision: HEAD
 layers: meta-oe
 	meta-networking
-        meta-ruby
         meta-filesystems
         meta-webserver
         meta-python
-- 
2.7.4


