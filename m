Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 71583E010E9; Fri,  9 Oct 2015 10:50:23 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 99536E00ADB
	for <meta-virtualization@yoctoproject.org>;
	Fri,  9 Oct 2015 10:50:20 -0700 (PDT)
Received: from sestofb11.enea.se (172.21.3.146) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Fri, 9 Oct 2015
	19:50:18 +0200
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Fri, 9 Oct 2015 19:50:17 +0200
Message-ID: <1444413018-15865-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido/kilo][PATCH] Remove recipes
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
X-List-Received-Date: Fri, 09 Oct 2015 17:50:23 -0000
Content-Type: text/plain

Some recipes are already provided by other layers that we depend
on, so no need to maintain them anymore. Indicated in the patch are
those that changed versions, otherwise they are the same.

openldap is already provided by meta-oe, but since I have not tried
openldap, I didn't remove it. The recipe in meta-oe has preference over
the one in this layer.

Josep Puigdemont (1):
  Remove recipes already provided by other layers

 .../recipes-devtools/python/python-boto_git.bb     | 20 ----------
 .../python/python-decorator_3.4.0.bb               | 17 ---------
 .../recipes-devtools/python/python-jinja2_2.7.3.bb | 31 ---------------
 .../python/python-markupsafe_0.18.bb               | 20 ----------
 .../recipes-devtools/python/python-mccabe_0.2.1.bb | 21 -----------
 .../recipes-devtools/python/python-mock_1.0.1.bb   | 24 ------------
 .../python/python-msgpack_0.4.5.bb                 | 17 ---------
 .../python/python-prettytable_0.7.2.bb             | 24 ------------
 .../python/python-pyflakes_0.7.3.bb                | 21 -----------
 .../python/python-pyparsing_2.0.1.bb               | 17 ---------
 .../python/python-pyudev_0.16.1.bb                 | 17 ---------
 .../recipes-devtools/ruby/bundler_git.bb           | 33 ----------------
 .../memcached/memcached/configure.patch            | 13 -------
 .../recipes-support/memcached/memcached_1.4.17.bb  | 44 ----------------------
 14 files changed, 319 deletions(-)
 delete mode 100644 meta-openstack/recipes-devtools/python/python-boto_git.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-decorator_3.4.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-jinja2_2.7.3.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-markupsafe_0.18.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mccabe_0.2.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-mock_1.0.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-msgpack_0.4.5.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-prettytable_0.7.2.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyflakes_0.7.3.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyparsing_2.0.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-pyudev_0.16.1.bb
 delete mode 100644 meta-openstack/recipes-devtools/ruby/bundler_git.bb
 delete mode 100644 meta-openstack/recipes-support/memcached/memcached/configure.patch
 delete mode 100644 meta-openstack/recipes-support/memcached/memcached_1.4.17.bb

-- 
1.9.1


