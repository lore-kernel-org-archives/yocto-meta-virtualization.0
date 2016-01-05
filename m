Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBD1BE00805; Mon,  4 Jan 2016 18:01:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7519BE0079A
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 18:01:55 -0800 (PST)
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2212926"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 05 Jan 2016 10:01:43 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id 6440141887F4
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 Jan 2016 10:01:28 +0800 (CST)
Received: from localhost.localdomain (10.167.226.98) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Tue, 5 Jan 2016 10:05:00 +0800
From: Li Xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 5 Jan 2016 05:00:59 +0300
Message-ID: <1451959280-3349-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
References: <CAPuovEJA6me_M0qtm1EeN=WnzrcOZ-GwfNtHBsEym-gAKRkYng@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.98]
X-yoursite-MailScanner-ID: 6440141887F4.AD22B
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: lixin.fnst@cn.fujitsu.com
Subject: [m-c-s][PATCH 00/21] Error fix for recipes depend on python-pbr
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
X-List-Received-Date: Tue, 05 Jan 2016 02:02:00 -0000
Content-Type: text/plain

[PATCH 01/21] ~ [PATCH 21/21] are recipes depend on python-pbr.
And they will download pbr modules in the step of do_compile.
If your network is not very well,errors will occur as following:
  Download error on https://pypi.python.org/simple/pbr/:
  [Errno -5] No address associated with hostname -- Some packages may not be found!
  Couldn't find index page for 'pbr' (maybe misspelled?)
  No local packages or download links found for pbr
so add do_compile_prepend to fix it.

Li Xin (21):
  python-pbr: Error fix for recipes depend on python-pbr
  python-cliff: Error fix
  python-fixtures: Error fix
  python-glanceclient: Error fix
  python-heat: Error fix
  python-heatclient: Error fix
  python-keystoneclient: Error fix
  python-lockfile: Error fix
  python-mox3: Error fix
  python-oslo.config: Error fix
  python-oslo.context: Error fix
  python-oslo.i18n: Error fix
  python-oslo.log: Error fix
  python-oslo.serialization: Error fix
  python-oslo.utils: Error fix
  python-sqlalchemy-migrate: Error fix
  python-stevedore: Error fix
  python-swiftclient: Error fix
  python-testscenarios: Error fix
  python-testtools: Error fix
  python-wsme: Error fix

 meta-openstack/recipes-devtools/python/python-cliff_1.13.0.bb  |  7 +++++++
 .../recipes-devtools/python/python-fixtures_1.3.1.bb           |  6 ++++++
 .../recipes-devtools/python/python-glanceclient_git.bb         |  7 +++++++
 meta-openstack/recipes-devtools/python/python-heat_git.bb      |  7 +++++++
 .../recipes-devtools/python/python-heatclient_git.bb           |  7 +++++++
 .../recipes-devtools/python/python-keystoneclient_git.bb       |  7 +++++++
 .../recipes-devtools/python/python-lockfile_0.10.2.bb          |  6 ++++++
 meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb    |  6 ++++++
 .../recipes-devtools/python/python-oslo.config_1.14.0.bb       |  7 +++++++
 .../recipes-devtools/python/python-oslo.context_git.bb         |  6 ++++++
 .../recipes-devtools/python/python-oslo.i18n_1.6.0.bb          |  6 ++++++
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb  |  7 +++++++
 .../recipes-devtools/python/python-oslo.serialization_git.bb   |  6 ++++++
 .../recipes-devtools/python/python-oslo.utils_git.bb           |  6 ++++++
 meta-openstack/recipes-devtools/python/python-pbr_1.4.0.bb     | 10 ++++++++++
 .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb |  6 ++++++
 .../recipes-devtools/python/python-stevedore_1.6.0.bb          |  6 ++++++
 .../recipes-devtools/python/python-swiftclient_git.bb          |  7 +++++++
 .../recipes-devtools/python/python-testscenarios_0.5.0.bb      |  6 ++++++
 .../recipes-devtools/python/python-testtools_1.8.0.bb          |  7 +++++++
 meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb    |  6 ++++++
 21 files changed, 139 insertions(+)

-- 
1.8.4.2




