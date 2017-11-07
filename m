Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E32D1E00D3E; Tue,  7 Nov 2017 12:27:25 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 256A7E00C82
	for <meta-virtualization@yoctoproject.org>;
	Tue,  7 Nov 2017 12:27:22 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vA7KRM1g017052
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 7 Nov 2017 12:27:22 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 7 Nov 2017 12:27:21 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Tue, 7 Nov 2017 15:27:15 -0500
Message-ID: <1510086435-19586-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510086435-19586-1-git-send-email-mark.asselstine@windriver.com>
References: <1510086435-19586-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 2/2] python-xstatic-jquery-quicksearch: rename to python-xstatic-jquery.quicksearch
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
X-List-Received-Date: Tue, 07 Nov 2017 20:27:25 -0000
Content-Type: text/plain

Rename to match upstream name as well as match name used in
requirements.txt to allow easier automation of dependency checks.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 ...uicksearch_2.0.3.1.bb => python-xstatic-jquery.quicksearch_2.0.3.1.bb} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jquery-quicksearch_2.0.3.1.bb => python-xstatic-jquery.quicksearch_2.0.3.1.bb} (100%)

diff --git a/meta-openstack/recipes-devtools/python/python-xstatic-jquery-quicksearch_2.0.3.1.bb b/meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb
similarity index 100%
rename from meta-openstack/recipes-devtools/python/python-xstatic-jquery-quicksearch_2.0.3.1.bb
rename to meta-openstack/recipes-devtools/python/python-xstatic-jquery.quicksearch_2.0.3.1.bb
-- 
2.7.4


