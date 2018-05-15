Return-Path: <leimaohui@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2294DE007D4; Thu, 24 May 2018 18:48:32 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: *
X-Spam-Status: No, score=1.5 required=5.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [183.91.158.132 listed in list.dnswl.org]
	* 3.4 DATE_IN_PAST_96_XX Date: is 96 hours or more before Received:
	date * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from heian.cn.fujitsu.com (mail.cn.fujitsu.com [183.91.158.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7F851E006F1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 24 May 2018 18:48:30 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.43,368,1503331200"; d="scan'208";a="40347813"
Received: from localhost (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 25 May 2018 09:48:27 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id DE35C4D0EFFC
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 May 2018 09:48:23 +0800 (CST)
Received: from localhost.localdomain (10.167.225.27) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.399.0; Fri, 25 May 2018 09:48:24 +0800
From: Lei Maohui <leimaohui@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 15 May 2018 09:55:42 -0700
Message-ID: <1526403350-11091-1-git-send-email-leimaohui@cn.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.27]
X-yoursite-MailScanner-ID: DE35C4D0EFFC.A0A7D
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: leimaohui@cn.fujitsu.com
Subject: [oe-virtualization][meta-cloud-services][PATCH 0/8] Fix build error "distutils.errors.DistutilsError"
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
X-List-Received-Date: Fri, 25 May 2018 01:48:32 -0000
Content-Type: text/plain

Fix build error as following:

"distutils.errors.DistutilsError: Could not find suitable distribution for Requirement.parse('pbr>=2.0.0')"

Lei Maohui (8):
  python-osc-lib: Fix build error as following:
  python-os-client-config: Fix build error as following:
  python-oslo.messaging: Fix build error as following:
  python-oslo.service: Fix build error as following:
  python-oslo.middleware: Fix build error as following:
  python-sqlalchemy-migrate: Fix build error as following:
  python-tenacity: Fix build error as following:
  python-pycadf: Fix build error as following:

 .../recipes-devtools/python/python-os-client-config_git.bb         | 4 ++++
 meta-openstack/recipes-devtools/python/python-osc-lib_1.7.0.bb     | 5 +++++
 .../recipes-devtools/python/python-oslo.messaging_git.bb           | 5 +++++
 .../recipes-devtools/python/python-oslo.middleware_git.bb          | 5 +++++
 meta-openstack/recipes-devtools/python/python-oslo.service_git.bb  | 7 ++++++-
 meta-openstack/recipes-devtools/python/python-pycadf_git.bb        | 4 ++++
 .../recipes-devtools/python/python-sqlalchemy-migrate_0.11.0.bb    | 7 ++++++-
 meta-openstack/recipes-devtools/python/python-tenacity_4.5.0.bb    | 5 +++++
 8 files changed, 40 insertions(+), 2 deletions(-)

-- 
1.9.1




