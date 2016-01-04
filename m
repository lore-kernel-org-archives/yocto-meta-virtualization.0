Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 005B9E00CC2; Mon,  4 Jan 2016 07:23:44 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id D0D09E00A9C
	for <meta-virtualization@yoctoproject.org>;
	Mon,  4 Jan 2016 07:23:41 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.209)
	with Microsoft SMTP Server id 14.3.224.2;
	Mon, 4 Jan 2016 16:23:39 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 4 Jan 2016 16:23:34 +0100
Message-ID: <1451921019-16491-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 0/5] Updates for fido-kilo
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
X-List-Received-Date: Mon, 04 Jan 2016 15:23:45 -0000
Content-Type: text/plain

Upgrade some recipes to their latest Kilo version

Josep Puigdemont (5):
  python-taskflow: upgrade to 0.7.1 (kilo)
  python-glance: upgrade to 2015.1.2 (kilo)
  python-swift: upgrade to 2.3.0
  python-cinder: upgrade to 2015.1.2 (kilo)
  python-ceilometerclient: upgrade to 1.1.2

 .../recipes-devtools/python/python-ceilometerclient_git.bb     |  8 +++-----
 meta-openstack/recipes-devtools/python/python-cinder_git.bb    |  7 +++----
 meta-openstack/recipes-devtools/python/python-glance_git.bb    |  7 +++----
 meta-openstack/recipes-devtools/python/python-swift_git.bb     |  7 +++----
 meta-openstack/recipes-devtools/python/python-taskflow_git.bb  | 10 +++++-----
 5 files changed, 17 insertions(+), 22 deletions(-)

-- 
2.5.0


