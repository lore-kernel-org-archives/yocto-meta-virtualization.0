Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8D063E00BE9; Thu, 26 Nov 2015 07:47:36 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id EED30E00AF6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 26 Nov 2015 07:47:29 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 26 Nov 2015 16:47:26 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 26 Nov 2015 16:47:13 +0100
Message-ID: <1448552846-24382-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 00/13] cherry picks from master
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
X-List-Received-Date: Thu, 26 Nov 2015 15:47:36 -0000
Content-Type: text/plain

Hi,
this is a collection of cherry-picks from master to fido-kilo (commit short
hash in parantheses)
This is part of a more complete patch set to bring fido-kilo to a more
functional state.

Thanks!

Jackie Huang (11):
  python-glancestore: upgrade to 0.4.0 (6c67500)
  python-amqp: upgrade to 1.4.6 (3dd57fd)
  python-flake8: upgrade to 2.4.0 (d7a24ec)
  python-rtslib-fb: upgrade to 2.1.51 (03fdfce)
  python-sqlalchemy-migrate: upgrade to 0.9.6 (20b75e3)
  python-subunit: upgrade to 1.1.0 (806fea3)
  python-warlock: upgrade to 1.1.0 (a0c2225)
  python-xstatic-font-awesome: upgrade to 4.3.0.0 (ea84785)
  python-xstatic-jasmine: upgrade to 2.1.2.0 (af07c0f)
  python-setuptools-git: upgrade to 1.1 (2ed930f)
  python-pyscss: upgrade to 1.3.4 (87cf034)

Li xin (1):
  python-fixtures: upgrade 1.0.0 -> 1.3.1 (540c2e4)

wruser (1):
  cloud-init: fix 64bit libraries (67f97ec)

 .../python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb}        | 5 ++---
 .../{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb}       | 4 ++--
 .../python/{python-flake8_2.3.0.bb => python-flake8_2.4.0.bb}    | 5 ++---
 meta-openstack/recipes-devtools/python/python-glancestore_git.bb | 4 ++--
 .../python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb}    | 5 ++---
 .../{python-rtslib-fb_2.1.32.bb => python-rtslib-fb_2.1.51.bb}   | 7 +++----
 ...python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} | 9 ++++-----
 ...chemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb} | 5 ++---
 .../python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb} | 7 +++----
 .../python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb}  | 5 ++---
 ...awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} | 7 +++----
 ...atic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} | 7 +++----
 meta-openstack/recipes-extended/cloud-init/cloud-init_0.7.6.bb   | 2 +-
 13 files changed, 31 insertions(+), 41 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-amqp_1.3.2.bb => python-amqp_1.4.6.bb} (71%)
 rename meta-openstack/recipes-devtools/python/{python-fixtures_1.0.0.bb => python-fixtures_1.3.1.bb} (82%)
 rename meta-openstack/recipes-devtools/python/{python-flake8_2.3.0.bb => python-flake8_2.4.0.bb} (79%)
 rename meta-openstack/recipes-devtools/python/{python-pyscss_1.2.1.bb => python-pyscss_1.3.4.bb} (78%)
 rename meta-openstack/recipes-devtools/python/{python-rtslib-fb_2.1.32.bb => python-rtslib-fb_2.1.51.bb} (66%)
 rename meta-openstack/recipes-devtools/python/{python-setuptools-git_1.0.bb => python-setuptools-git_1.1.bb} (68%)
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.9.1.bb => python-sqlalchemy-migrate_0.9.6.bb} (80%)
 rename meta-openstack/recipes-devtools/python/{python-subunit_0.0.15.bb => python-subunit_1.1.0.bb} (61%)
 rename meta-openstack/recipes-devtools/python/{python-warlock_1.0.1.bb => python-warlock_1.1.0.bb} (77%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-font-awesome_4.1.0.0.bb => python-xstatic-font-awesome_4.3.0.0.bb} (69%)
 rename meta-openstack/recipes-devtools/python/{python-xstatic-jasmine_1.3.1.1.bb => python-xstatic-jasmine_2.1.2.0.bb} (67%)

-- 
2.1.0


