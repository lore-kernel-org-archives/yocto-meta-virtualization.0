Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C546EE009B3; Thu,  6 Aug 2015 01:12:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=5.0 tests=BAYES_00,RDNS_NONE
	autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.8 RDNS_NONE Delivered to internal network by a host with no rDNS
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 27FC1E00349
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Aug 2015 01:12:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.15,520,1432569600"; d="scan'208";a="99335455"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 06 Aug 2015 16:15:45 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t768ANQF006904
	for <meta-virtualization@yoctoproject.org>;
	Thu, 6 Aug 2015 16:10:23 +0800
Received: from localhost.localdomain (10.167.226.92) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 6 Aug 2015 16:12:17 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 6 Aug 2015 16:11:54 +0800
Message-ID: <1438848725-1643-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.92]
Subject: [meta-cloud-services][PATCH 00/11] upgrade recipes
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
X-List-Received-Date: Thu, 06 Aug 2015 08:12:27 -0000
Content-Type: text/plain

Li xin (11):
  python-fixtures: upgrade 1.0.0 -> 1.3.1
  python-glanceclient: upgrade 0.17.0 -> 0.19.0
  python-httpretty: upgrade 0.8.7 -> 0.8.10
  python-jsonpatch: upgrade 1.9 -> 1.11
  python-jsonpointer: upgrade 1.7 -> 1.9
  python-keystoneclient: upgrade 1.3.0 -> 1.6.0
  python-msgpack: upgrade 0.4.5 -> 0.4.6
  python-oslo.config: upgrade 1.11.0 -> 1.14.0
  python-paste: upgrade 2.0.1 -> 2.0.2
  python-pecan: upgrade 0.8.3 -> 0.9.0
  python-pymongo: upgrade 3.0.1 -> 3.0.3

 .../python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb}    | 4 ++--
 meta-openstack/recipes-devtools/python/python-glanceclient_git.bb    | 5 +++--
 .../python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} | 4 ++--
 .../python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb}     | 4 ++--
 .../python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb}  | 4 ++--
 meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb  | 4 ++--
 .../python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb}      | 4 ++--
 .../{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb}   | 4 ++--
 .../python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb}          | 4 ++--
 .../python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb}          | 4 ++--
 .../python/{python-pymongo_3.0.1.bb => python-pymongo_3.0.3.bb}      | 4 ++--
 11 files changed, 23 insertions(+), 22 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb} (81%)
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} (78%)
 rename meta-openstack/recipes-devtools/python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} (77%)
 rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb} (76%)
 rename meta-openstack/recipes-devtools/python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb} (74%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.11.0.bb => python-oslo.config_1.14.0.bb} (79%)
 rename meta-openstack/recipes-devtools/python/{python-paste_2.0.1.bb => python-paste_2.0.2.bb} (73%)
 rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} (80%)
 rename meta-openstack/recipes-devtools/python/{python-pymongo_3.0.1.bb => python-pymongo_3.0.3.bb} (72%)

-- 
1.8.4.2


