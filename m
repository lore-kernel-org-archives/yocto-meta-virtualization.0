Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4D51BE00529
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Jan 2014 06:10:20 -0800 (PST)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 06 Jan 2014 06:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,613,1384329600"; d="scan'208";a="462306396"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.119])
	by orsmga002.jf.intel.com with ESMTP; 06 Jan 2014 06:10:18 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: meta-virtualization@yoctoproject.org
Date: Mon,  6 Jan 2014 14:09:44 +0000
Message-Id: <cover.1389006438.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [meta-openstack][PATCH 0/9] Python web recipe fixes
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
X-List-Received-Date: Mon, 06 Jan 2014 14:10:21 -0000

I made use of these recipes outside of the context of OpenStack; here
are some patches for issues I noticed.


The following changes since commit 93d2434e1ae3d7d0fc568005c2ec82846e31cba0:

  Revert "horizon: update to 2013.2.2" (2013-12-20 11:25:59 -0500)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/mcs-python-fixes
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/mcs-python-fixes

Paul Eggleton (9):
  python-flask: correct LICENSE
  python-itsdangerous: correct LICENSE
  python-jinja2: correct LICENSE
  python-markupsafe: make LICENSE more accurate
  python-werkzeug: correct LICENSE
  python-itsdangerous: add missing python module dependencies
  python-jinja2: add missing python module dependencies
  python-markupsafe: add missing python module dependencies
  python-werkzeug: add missing python module dependencies

 meta-openstack/recipes-devtools/python/python-flask_0.10.1.bb      | 2 +-
 meta-openstack/recipes-devtools/python/python-itsdangerous_0.23.bb | 5 ++++-
 meta-openstack/recipes-devtools/python/python-jinja2_2.7.1.bb      | 4 +++-
 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb   | 5 ++++-
 meta-openstack/recipes-devtools/python/python-werkzeug_0.9.4.bb    | 5 ++++-
 5 files changed, 16 insertions(+), 5 deletions(-)

-- 
1.8.1.2


