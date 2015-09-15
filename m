Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6ADC9E00D49; Tue, 15 Sep 2015 06:45:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 62971E00D36
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:45:39 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8FDjchh000523
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 06:45:39 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Tue, 15 Sep 2015 06:45:38 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Tue, 15 Sep 2015 09:45:36 -0400
Message-ID: <1442324736-15011-3-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1442324736-15011-1-git-send-email-mark.asselstine@windriver.com>
References: <1442324736-15011-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 3/3] python-dateutil: move bbappend to the base layer
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
X-List-Received-Date: Tue, 15 Sep 2015 13:45:40 -0000
Content-Type: text/plain

This bbappend is not specific to openstack, any meta-cloud-services
'sub-layer' will require this change so moving it to the base layer
to make it apply even with non-openstack builds.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../python/python-dateutil_1.%.bbappend                                   | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename {meta-openstack/recipes-devtools => recipes-devtools}/python/python-dateutil_1.%.bbappend (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-dateutil_1.%.bbappend b/recipes-devtools/python/python-dateutil_1.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-dateutil_1.%.bbappend
rename to recipes-devtools/python/python-dateutil_1.%.bbappend
-- 
2.1.4


