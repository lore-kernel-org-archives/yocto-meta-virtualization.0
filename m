Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 335F2E00FAE; Fri,  2 Oct 2015 06:51:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [192.36.1.252 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id BD263E00FA1
	for <meta-virtualization@yoctoproject.org>;
	Fri,  2 Oct 2015 06:51:01 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2; Fri, 2 Oct 2015
	15:50:57 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 2 Oct 2015 15:50:52 +0200
Message-ID: <1443793858-17763-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 0/6] Updated for fido-kilo
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
X-List-Received-Date: Fri, 02 Oct 2015 13:51:18 -0000
Content-Type: text/plain

Here are a few patches for fido-kilo.

A couple of them are cherry-picked from master. On those I have added
my own sign-off. I don't know if this is the proper procedure or
whether I should add acked-by only, or nothing at all.
Bruce, feel free to remove or change my sign-off as required.

I've also backported the oslo.vmware recipe from master. Unfortunately
I could not cherry pick the commit because the versions differ.

Jackie Huang (2):
  python-jsonpointer: inherit setuptools instead of distutils
  python-alembic: upgrade to 0.7.5.post2

Josep Puigdemont (4):
  python-oslo.vmware: add recipe
  python-glance,glancestore: require oslo.vmware
  python-nova: depends on psutil
  nova: build dependency on libvirt

 ...mbic_0.5.0.bb => python-alembic_0.7.5.post2.bb} |  7 +++---
 .../recipes-devtools/python/python-glance_git.bb   |  1 +
 .../python/python-glancestore_git.bb               |  1 +
 .../python/python-jsonpointer_1.7.bb               |  2 +-
 .../recipes-devtools/python/python-nova_git.bb     |  2 ++
 .../python/python-oslo.vmware_0.11.2.bb            | 25 ++++++++++++++++++++++
 6 files changed, 33 insertions(+), 5 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-alembic_0.5.0.bb => python-alembic_0.7.5.post2.bb} (61%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.vmware_0.11.2.bb

-- 
1.9.1


