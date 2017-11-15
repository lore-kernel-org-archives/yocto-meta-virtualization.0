Return-Path: <zhengrq.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1E580E00D20; Tue, 14 Nov 2017 23:11:06 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_00, DATE_IN_FUTURE_06_12
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 1.9 DATE_IN_FUTURE_06_12 Date: is 6 to 12 hours after
	Received: date
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B39EBE00C11
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Nov 2017 23:11:04 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="30192551"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 15 Nov 2017 15:11:03 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id D60BF41860D7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 Nov 2017 15:10:58 +0800 (CST)
Received: from localhost.localdomain (10.167.225.116) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.361.1; Wed, 15 Nov 2017 15:10:57 +0800
From: zhengrq <zhengrq.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 16 Nov 2017 00:07:43 +0800
Message-ID: <1510762063-47522-1-git-send-email-zhengrq.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.116]
X-yoursite-MailScanner-ID: D60BF41860D7.A6DCB
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: zhengrq.fnst@cn.fujitsu.com
Subject: [meta-cloud-services][PATCH]python-jsonschema: rename to 2.6.0
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
X-List-Received-Date: Wed, 15 Nov 2017 07:11:06 -0000
Content-Type: text/plain

Rename python-jsonschema from 2.5.1 to 2.6.0 as it has been upgraded but not renamed.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
---
 .../python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb}     | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.5.1.bb => python-jsonschema_2.6.0.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb b/meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-jsonschema_2.5.1.bb
rename to meta-openstack/recipes-devtools/python/python-jsonschema_2.6.0.bb
-- 
2.7.4




