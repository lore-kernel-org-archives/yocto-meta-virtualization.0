Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D7BEE00BC8; Wed, 28 Jun 2017 02:00:01 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 43E31E00B83
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Jun 2017 01:59:59 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v5S8xwgg008089
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Jun 2017 01:59:58 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Jun 2017 01:59:57 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Jun 2017 16:52:47 +0800
Message-ID: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] python-pyparsing: Move from meta-openstack to meta-cloud-services
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
X-List-Received-Date: Wed, 28 Jun 2017 09:00:01 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

It's not an openstack specific package.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../python/python-pyparsing_2.0.1.bb                                      | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-openstack/recipes-devtools => recipes-devtools}/python/python-pyparsing_2.0.1.bb (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb b/recipes-devtools/python/python-pyparsing_2.0.1.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
rename to recipes-devtools/python/python-pyparsing_2.0.1.bb
-- 
2.8.1


