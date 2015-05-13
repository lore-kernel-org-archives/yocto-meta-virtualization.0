Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 79988E008DC; Wed, 13 May 2015 00:24:40 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 92B20E005B9
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:36 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4D7OZWX008795
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 00:24:35 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 13 May 2015 00:24:35 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 13 May 2015 15:24:23 +0800
Message-ID: <cover.1431501591.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/11] meta-openstack: add required packages and missing dependencies
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
X-List-Received-Date: Wed, 13 May 2015 07:24:40 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit dd04ca6db2993404284679ea04a80d9071f90c2b:

  python-cinder: upgrade to 2015.1.0 (2015-05-07 14:13:37 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/t_add-new-pkgs_150513_0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/t_add-new-pkgs_150513_0

Jackie Huang (11):
  python-repoze.lru: add new recipe
  python-routes: add rdepends on python-repoze.lru
  python-oslo.policy: add new recipe
  python-keystone: add missing rdepends on python-oslo.policy
  python-django: inherit setuptools instead of distutils
  python-xstatic-angular-irdragndrop: add new recipe
  python-horizon: add rdepends on python-xstatic-angular-irdragndrop
  python-enum: add new recipe
  python-pyscss: add missing rdepends on python-enum
  python-pathlib: add new recipe
  python-django-pyscss: add missing rdepends on python-pathlib

 .../python/python-django-pyscss_2.0.1.bb           |  1 +
 .../recipes-devtools/python/python-django_1.7.5.bb |  2 +-
 .../recipes-devtools/python/python-enum_0.4.4.bb   | 25 +++++++++++++++++++
 .../recipes-devtools/python/python-horizon_git.bb  |  1 +
 .../recipes-devtools/python/python-keystone_git.bb |  1 +
 .../python/python-oslo.policy_0.4.0.bb             | 27 ++++++++++++++++++++
 .../python/python-pathlib_1.0.1.bb                 | 29 ++++++++++++++++++++++
 .../recipes-devtools/python/python-pyscss_1.3.4.bb |  1 +
 .../python/python-repoze.lru_0.6.bb                | 20 +++++++++++++++
 .../recipes-devtools/python/python-routes_2.1.bb   |  2 +-
 .../python-xstatic-angular-irdragndrop_1.0.2.2.bb  | 22 ++++++++++++++++
 11 files changed, 129 insertions(+), 2 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.policy_0.4.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb

-- 
1.9.1


