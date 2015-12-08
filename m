Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 61CCBE00B46; Tue,  8 Dec 2015 09:34:00 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id CF217E00546
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:33:57 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:33:54 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:12 +0100
Message-ID: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 00/42] Updates for fido-kilo
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:00 -0000
Content-Type: text/plain

Hi,

A few comments on this patch series:

* It contains several cherry-picks from master that are also needed in
fido-kilo.

* I had to cherry-pick django-pyscss 2.0.2 from master, although Kilo's
requirements have a cap on this package (>=1.0.3,<2.0.0), but horizon
wouldn't work otherwise.

* There are also a few upgrades to Openstack Kilo 2015.1.2 that were missing
from the previous series (and a new recipe for oslo.versionedobjects).

* Various dependencies have been added, and NAT as well as TUN kernel modules
are added to the compute image too.

* The last pacth is the only one I think may be a bit controversial (because
it's rather ugly). Maybe you have some suggestions on how to solve the issue
described in the commit message. I have put everything in one patch so it is
easy to remove later, or to discard altogether. Without this patch the images
won't work out of the box, but it can be fixed by adding a simple sed command
to IMAGE_POSTPROCESS_COMMAND that does the same.


I have tested this using both the AIO image and comupte+controller images
on qemu. Only the AIO image has been tested on real HW.

I'm sorry for the large patch sets! I believe this is the last series for
fido-kilo I have. I hope I can work with master and Liberty pretty soon.

Thanks,

/Josep

Jackie Huang (8):
  python-pathlib: add new recipe
  python-django-pyscss: add missing rdepends on python-pathlib
  python-enum: add new recipe
  python-pyscss: add missing rdepends on python-enum
  python-repoze.lru: add new recipe
  python-routes: add rdepends on python-repoze.lru
  python-nova: add missing rdepends
  python-eventlet: upgrade 0.17.1 -> 0.17.4

Josep Puigdemont (12):
  python-sqlalchemy-migrate: depends on sqlparse
  python-cliff: Fix object has no attribute debug error
  python-nova: dependency on blkid
  yocto-kernel: enable NAT
  python-pbr: upgrade to 0.11
  python-novaclient: upgrade to 2.23.2
  python-ceilometer: upgrade to 2015.1.2
  python-oslo.versionedobjects: added recipe
  python-heat: update to 2015.1.2
  packagegroup-cloud-compute: add tun kernel module
  packagegroup-cloud-extras: include xterm only if x11 in
    DISTRO_FEATURES
  Remove argparse from requirements.txt of some modules

Lei Maohui (3):
  python-beautifulsoup4: upgrade 4.3.2 -> 4.4.0
  python-sqlalchemy-migrate: upgrade 0.9.6->0.9.7
  python-testtools: upgrade 0.9.33 -> 1.8.0

Li xin (10):
  python-setuptools-git: add native support
  python-httpretty: upgrade 0.8.7 -> 0.8.10
  python-jsonpatch: upgrade 1.9 -> 1.11
  python-jsonpointer: upgrade 1.7 -> 1.9
  python-msgpack: upgrade 0.4.5 -> 0.4.6
  python-pecan: upgrade 0.8.3 -> 0.9.0
  json: upgrade 1.8.1 -> 1.8.3
  ruby.bbclass: Error fix
  python-vcversioner: add new recipe
  python-jsonschema: upgrade 2.4.0 -> 2.5.1

Mark Asselstine (9):
  python-nova: add missing dependency on sqlparse
  meta-openstack: add wildcard to libvirt bbappend
  libvirt: remove sanlock from PACKAGECONFIG
  glance: add new dependencies
  keystone: the 'sql' section is deprecated
  python-testtools: fix build error
  keystone: add missing functools32 module
  django-pyscss: uprev to version 2.0.2
  openvswitch: add as RRECOMMENDS for compute and controller

 meta-openstack/classes/ruby.bbclass                |  1 +
 ...up4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} |  6 ++--
 .../python/python-ceilometer_git.bb                |  7 ++---
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-cinderclient_git.bb              |  3 +-
 ...1-Fix-object-has-no-attribute-debug-error.patch | 32 ++++++++++++++++++++++
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../recipes-devtools/python/python-cliff_1.10.0.bb |  6 ++--
 ...scss_1.0.6.bb => python-django-pyscss_2.0.2.bb} |  6 ++--
 .../recipes-devtools/python/python-enum_0.4.4.bb   | 25 +++++++++++++++++
 ...ventlet_0.17.1.bb => python-eventlet_0.17.4.bb} |  5 ++--
 .../python/python-functools32_3.2.3-2.bb           | 29 ++++++++++++++++++++
 .../recipes-devtools/python/python-glance_git.bb   |  3 ++
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-glanceclient_git.bb              |  1 +
 .../recipes-devtools/python/python-heat_git.bb     |  8 +++---
 ...tpretty_0.8.7.bb => python-httpretty_0.8.10.bb} |  4 +--
 ...n-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} |  4 +--
 ...sonpointer_1.7.bb => python-jsonpointer_1.9.bb} |  4 +--
 ...nschema_2.4.0.bb => python-jsonschema_2.5.1.bb} |  6 ++--
 .../python/python-keystone/keystone.conf           |  2 +-
 .../recipes-devtools/python/python-keystone_git.bb |  1 +
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-keystoneclient_git.bb            |  1 +
 ...on-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb} |  4 +--
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-neutronclient_git.bb             |  3 +-
 .../recipes-devtools/python/python-nova_git.bb     |  8 +++++-
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-novaclient_git.bb                |  9 +++---
 .../Remove-argparse-from-requirements.txt.patch    | 25 +++++++++++++++++
 .../python/python-oslo.config_1.9.3.bb             |  4 +--
 .../python/python-oslo.versionedobjects_0.1.1.bb   | 26 ++++++++++++++++++
 .../python/python-pathlib_1.0.1.bb                 | 29 ++++++++++++++++++++
 .../{python-pbr_0.10.8.bb => python-pbr_0.11.0.bb} |  8 ++----
 ...python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} |  4 +--
 .../recipes-devtools/python/python-pyscss_1.3.4.bb |  1 +
 .../python/python-repoze.lru_0.6.bb                | 20 ++++++++++++++
 .../python/python-routes_1.12.3.bb                 |  2 +-
 .../python/python-semantic-version_2.4.2.bb        | 27 ++++++++++++++++++
 .../python/python-setuptools-git_1.1.bb            |  1 +
 ...0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb} |  5 ++--
 .../python/python-sqlparse_0.1.16.bb               | 27 ++++++++++++++++++
 .../Remove-argparse-from-requirements.txt.patch    | 23 ++++++++++++++++
 .../python/python-stevedore_1.3.0.bb               |  2 ++
 ...sttools_0.9.33.bb => python-testtools_1.8.0.bb} |  8 ++++--
 .../python/python-vcversioner_2.14.0.0.bb          | 16 +++++++++++
 .../ruby/json/0001-Dont-compile-extensions.patch   | 20 --------------
 meta-openstack/recipes-devtools/ruby/json_git.bb   |  5 ++--
 ...ibvirt_1.2.12.bbappend => libvirt_1.%.bbappend} |  2 +-
 .../packagegroups/packagegroup-cloud-compute.bb    |  2 ++
 .../packagegroups/packagegroup-cloud-controller.bb |  1 +
 .../packagegroups/packagegroup-cloud-extras.bb     |  2 +-
 .../recipes-kernel/linux/linux-yocto/nf.cfg        |  1 +
 54 files changed, 510 insertions(+), 79 deletions(-)
 rename meta-openstack/recipes-devtools/python/{python-beautifulsoup4_4.3.2.bb => python-beautifulsoup4_4.4.0.bb} (71%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-cinderclient/Remove-argparse-from-requirements.txt.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff/0001-Fix-object-has-no-attribute-debug-error.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-cliff/Remove-argparse-from-requirements.txt.patch
 rename meta-openstack/recipes-devtools/python/{python-django-pyscss_1.0.6.bb => python-django-pyscss_2.0.2.bb} (77%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-enum_0.4.4.bb
 rename meta-openstack/recipes-devtools/python/{python-eventlet_0.17.1.bb => python-eventlet_0.17.4.bb} (71%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-functools32_3.2.3-2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-glanceclient/Remove-argparse-from-requirements.txt.patch
 rename meta-openstack/recipes-devtools/python/{python-httpretty_0.8.7.bb => python-httpretty_0.8.10.bb} (78%)
 rename meta-openstack/recipes-devtools/python/{python-jsonpatch_1.9.bb => python-jsonpatch_1.11.bb} (77%)
 rename meta-openstack/recipes-devtools/python/{python-jsonpointer_1.7.bb => python-jsonpointer_1.9.bb} (76%)
 rename meta-openstack/recipes-devtools/python/{python-jsonschema_2.4.0.bb => python-jsonschema_2.5.1.bb} (70%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-keystoneclient/Remove-argparse-from-requirements.txt.patch
 rename meta-openstack/recipes-devtools/python/{python-msgpack_0.4.5.bb => python-msgpack_0.4.6.bb} (74%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-neutronclient/Remove-argparse-from-requirements.txt.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-novaclient/Remove-argparse-from-requirements.txt.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.config/Remove-argparse-from-requirements.txt.patch
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.versionedobjects_0.1.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-pathlib_1.0.1.bb
 rename meta-openstack/recipes-devtools/python/{python-pbr_0.10.8.bb => python-pbr_0.11.0.bb} (73%)
 rename meta-openstack/recipes-devtools/python/{python-pecan_0.8.3.bb => python-pecan_0.9.0.bb} (80%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-repoze.lru_0.6.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-semantic-version_2.4.2.bb
 rename meta-openstack/recipes-devtools/python/{python-sqlalchemy-migrate_0.9.6.bb => python-sqlalchemy-migrate_0.9.7.bb} (78%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-sqlparse_0.1.16.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-stevedore/Remove-argparse-from-requirements.txt.patch
 rename meta-openstack/recipes-devtools/python/{python-testtools_0.9.33.bb => python-testtools_1.8.0.bb} (72%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-vcversioner_2.14.0.0.bb
 delete mode 100644 meta-openstack/recipes-devtools/ruby/json/0001-Dont-compile-extensions.patch
 rename meta-openstack/recipes-extended/libvirt/{libvirt_1.2.12.bbappend => libvirt_1.%.bbappend} (93%)

-- 
2.5.0


