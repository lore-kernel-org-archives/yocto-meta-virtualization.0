Return-Path: <Jackie.Huang@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 80E03E009C2; Tue, 14 Apr 2015 22:58:36 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6F082E0079F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:33 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t3F5wTbX022057
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 14 Apr 2015 22:58:29 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.224.2; Tue, 14 Apr 2015 22:58:35 -0700
From: <jackie.huang@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 15 Apr 2015 13:58:23 +0800
Message-ID: <cover.1429074850.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 00/14] clients: version upgrades and add a helper meta data
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
X-List-Received-Date: Wed, 15 Apr 2015 05:58:36 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Tested with:
1) git clone git://git.yoctoproject.org/auto-upgrade-helper

2) Add maintainers.inc
$ cat conf/maintainers.inc 
RECIPE_MAINTAINER = "Jackie Huang <jackie.huang@windriver.com>"

3) Add upgrade-helper.conf
$ cat upgrade-helper.conf
[maintainer_override]

[settings]
smtp=smtp-na.wrs.com
from=upgrade.helper@wrs.com
status_recipients=jackie.huang@windriver.com
clean_sstate=yes
clean_tmp=yes
drop_previous_commits=yes
machines=qemux86 qemux86-64 qemuarm qemumips qemuppc

4) Add the following into local.conf:
INHERIT =+ "distrodata"
require conf/distro/include/recipe_color.inc
require conf/distro/include/distro_alias.inc
require conf/maintainers.inc
require conf/distro/include/upstream_tracking.inc
require conf/distro/include/package_regex_openstack.inc

5) run the script upgradehelper.py:
$ for i in `cat all_client.txt`; do echo "== $i =="; \
  /path/to/upgradehelper.py -a -c upgrade-helper.conf $i; \
done
--
The following changes since commit 274cf835e275e8ec2f1a4260bd4437b5cdcaed92:

  python-oslotest: correct the SRC_URI and add bash to rdepends (2015-04-08 10:36:55 -0400)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_update_op_clients_150415_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_update_op_clients_150415_2

Jackie Huang (14):
  Add helper meta data to find upstream versions correctly
  rest-client: upgrade to 1.7.3
  python-barbicanclient: upgrade to 3.0.3
  python-ceilometerclient: fix the version to 1.0.13
  python-cephclient: upgrade to 0.1.0.5
  python-glanceclient: upgrade to 0.17.0
  python-heatclient: upgrade to 0.4.0
  python-keystoneclient: upgrade to 1.3.0
  python-novaclient: upgrade to 2.23.0
  python-neutronclient: upgrade to 2.4.0
  python-openstackclient: upgrade to 1.0.3
  python-saharaclient: upgrade to 0.8.0
  python-swiftclient: upgrade to 2.4.0
  python-troveclient: upgrade to 1.0.9

 .../distro/include/package_regex_openstack.inc     | 42 ++++++++++++++++++++++
 .../python/python-barbicanclient_git.bb            |  4 +--
 .../python/python-ceilometerclient_git.bb          |  4 +--
 ...ent_0.1.0.4.bb => python-cephclient_0.1.0.5.bb} |  6 ++--
 .../python/python-glanceclient_git.bb              |  4 +--
 .../python/python-heatclient_git.bb                |  4 +--
 .../python/python-keystoneclient_git.bb            |  4 +--
 .../python/python-neutronclient_git.bb             |  4 +--
 .../python/python-novaclient_git.bb                |  4 +--
 ...nt_1.0.2.bb => python-openstackclient_1.0.3.bb} |  5 ++-
 .../python/python-saharaclient_git.bb              |  4 +--
 .../python/python-swiftclient_git.bb               |  4 +--
 .../python/python-troveclient_git.bb               |  4 +--
 .../recipes-devtools/ruby/rest-client_git.bb       |  6 ++--
 14 files changed, 70 insertions(+), 29 deletions(-)
 create mode 100644 meta-openstack/conf/distro/include/package_regex_openstack.inc
 rename meta-openstack/recipes-devtools/python/{python-cephclient_0.1.0.4.bb => python-cephclient_0.1.0.5.bb} (78%)
 rename meta-openstack/recipes-devtools/python/{python-openstackclient_1.0.2.bb => python-openstackclient_1.0.3.bb} (73%)

-- 
1.9.1


