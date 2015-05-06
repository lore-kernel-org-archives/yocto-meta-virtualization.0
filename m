Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 26883E009E5; Tue,  5 May 2015 18:45:13 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CE390E007B6
	for <meta-virtualization@yoctoproject.org>;
	Tue,  5 May 2015 18:45:07 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t461j6vI028080
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 5 May 2015 18:45:06 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 5 May 2015 18:45:05 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 6 May 2015 09:44:58 +0800
Message-ID: <cover.1430817811.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/10] core: update to the kilo release
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
X-List-Received-Date: Wed, 06 May 2015 01:45:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

update to the kilo release and change to stable/kilo branch.

--
The following changes since commit 2ed930f23e4d5678ef943cef413d09cd10c78eb7:

  python-setuptools-git: upgrade to 1.1 (2015-04-29 12:29:42 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_up_openstack-kilo_150505-0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_up_openstack-kilo_150505-0

Jackie Huang (10):
  python-keystonemiddleware: upgrade to 1.6.1
  python-ceilometer: upgrade to 2015.1.0
  python-cinder: upgrade to 2015.1.0
  python-glance: upgrade to 2015.1.0
  python-heat: upgrade to 2015.1.0
  python-horizon: upgrade to 2015.1.0
  python-keystone: upgrade to 2015.1.0
  python-neutron: upgrade to 2015.1.0
  python-nova: upgrade to 2015.1.0
  python-barbican: upgrade to 2015.1.0

 meta-openstack/recipes-devtools/python/python-barbican_git.bb      | 6 +++---
 meta-openstack/recipes-devtools/python/python-ceilometer_git.bb    | 6 +++---
 meta-openstack/recipes-devtools/python/python-cinder_git.bb        | 6 +++---
 meta-openstack/recipes-devtools/python/python-glance_git.bb        | 6 +++---
 meta-openstack/recipes-devtools/python/python-heat_git.bb          | 6 +++---
 meta-openstack/recipes-devtools/python/python-horizon_git.bb       | 7 +++----
 meta-openstack/recipes-devtools/python/python-keystone_git.bb      | 7 +++----
 .../recipes-devtools/python/python-keystonemiddleware_git.bb       | 4 ++--
 meta-openstack/recipes-devtools/python/python-neutron_git.bb       | 7 +++----
 meta-openstack/recipes-devtools/python/python-nova_git.bb          | 7 +++----
 10 files changed, 29 insertions(+), 33 deletions(-)

-- 
1.9.1


