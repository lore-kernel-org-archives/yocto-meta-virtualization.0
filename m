Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DE2EE009C5; Mon, 21 Sep 2015 07:57:54 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id AF6F4E00349
	for <meta-virtualization@yoctoproject.org>;
	Mon, 21 Sep 2015 07:57:49 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 21 Sep 2015 16:57:44 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Mon, 21 Sep 2015 16:57:43 +0200
Message-ID: <1442847464-38235-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH] Dependency on pbr
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
X-List-Received-Date: Mon, 21 Sep 2015 14:57:54 -0000
Content-Type: text/plain

I've been hitting build issues every now and then due to python
packages that depend on python-pbr but have not properly declared
this dependency in their respective recipes. I have fixed some of
them as soon as they popped up, but that wouldn't catch all
packages missing this dependency.
In order to fix this, I looked att the packages that declare a
dependency on "pbr" in their setup.py file, and made it a
dependency also in their respective recipe.

I hope this is the proper way to solve this.

Josep Puigdemont (1):
  python packages: add build dependency on python-pbr

 meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 4 ++++
 .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb         | 8 ++++++++
 meta-openstack/recipes-devtools/python/python-mox3_0.7.0.bb       | 4 ++++
 .../recipes-devtools/python/python-openstackclient_1.0.3.bb       | 8 ++++++++
 .../recipes-devtools/python/python-oslo.concurrency_1.5.0.bb      | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.db_1.5.0.bb    | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.i18n_1.4.0.bb  | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 1 +
 .../recipes-devtools/python/python-oslo.messaging_git.bb          | 2 ++
 .../recipes-devtools/python/python-oslo.middleware_0.4.0.bb       | 2 ++
 .../recipes-devtools/python/python-oslo.rootwrap_1.5.0.bb         | 2 ++
 .../recipes-devtools/python/python-oslo.serialization_git.bb      | 2 ++
 meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 2 ++
 meta-openstack/recipes-devtools/python/python-oslotest_1.4.0.bb   | 5 +++++
 meta-openstack/recipes-devtools/python/python-osprofiler_0.3.0.bb | 2 ++
 meta-openstack/recipes-devtools/python/python-pycadf_0.6.0.bb     | 2 ++
 meta-openstack/recipes-devtools/python/python-tooz_0.4.bb         | 2 ++
 18 files changed, 54 insertions(+)

-- 
1.9.1


