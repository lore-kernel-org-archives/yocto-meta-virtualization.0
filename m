Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DE30CE00D53; Wed,  7 Oct 2015 08:38:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 6A6CBE00B5A
	for <meta-virtualization@yoctoproject.org>;
	Wed,  7 Oct 2015 08:38:48 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 7 Oct 2015
	17:38:45 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 7 Oct 2015 17:38:42 +0200
Message-ID: <1444232325-22859-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido/kilo][PATCH 0/3] openstack client
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
X-List-Received-Date: Wed, 07 Oct 2015 15:38:52 -0000
Content-Type: text/plain

The openstack client depends on cliff-tablib:
  # openstack token issue
  ERROR: openstackclient.shell Exception raised: cliff-tablib>=1.0

I've added the necessary recipes to satisfy this dependency, and
updated openstackclient to a newer minor version.

Josep Puigdemont (3):
  python-tablib: added recipe
  python-cliff-tablib: add recipe
  openstackcclient: New version and updated dependencies

 .../python/python-cliff-tablib_git.bb              | 23 ++++++++++++++++++++++
 ...nt_1.0.3.bb => python-openstackclient_1.0.4.bb} | 15 ++++++++++++++
 .../python/python-tablib_0.10.0.bb                 | 18 +++++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff-tablib_git.bb
 rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.3.bb => python-openstackclient_1.0.4.bb} (63%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-tablib_0.10.0.bb

-- 
1.9.1


