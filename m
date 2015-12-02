Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 96E09E0083E; Wed,  2 Dec 2015 08:32:51 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 133ADE007B1
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:32:47 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:32:46 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:06 +0100
Message-ID: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 00/40] upgrade to Kilo 2015.1.2
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
X-List-Received-Date: Wed, 02 Dec 2015 16:32:51 -0000
Content-Type: text/plain

This series of patches are an upgrade to the latest Kilo release of
Openstack (2015.1.2).

python-wsme had the wrong license.

There are a couple of cherry-picks from master too.

layer.conf has been modified to select the required version of the
recipes python-six (1.9.0) and python-psutil (1.2.1).

Dependency on python-lockfile and python-lesscpy has been removed, as
Openstack is not using them anymore. The recipes have been removed too, but
this is put in a separate commit, in case you want to preserve them.

This is part of a larger patch set to bring fido-kilo to a more functional
state.

Jackie Huang (1):
  python-xstatic-angular-irdragndrop: add new recipe

Josep Puigdemont (38):
  python-tooz: updated to 0.13.3 (kilo latest)
  python-wsme: upgrade to 0.8.0, set proper license
  python-pycadf: upgrade to 0.8.0 (kilo)
  layer.conf: prefer python-six 1.9.0
  python-stevedore: upgrade to 1.3.0 (kilo)
  python-oslo.config: upgrade to 1.9.3 (kilo)
  python-oslo.i18n: upgrade to 1.5.0 (kilo)
  python-oslo.utils: update to 1.4.0, add dependencies
  python-oslo.concurrency: updated to 1.8.2 (kilo)
  python-oslo.context: upgrade to 0.2.0 (kilo)
  python-oslo.db: upgrade to 1.7.2 (kilo)
  python-wrapt: add recipe
  python-debtcollector: add recipe
  python-oslo.log: update to 1.0.0, add dependencies
  python-oslo.serialization: upgrade to 1.4.0
  python-oslo.middleware: upgrade to 1.0.0
  python-trollius: add recipe
  python-aioeventlet: add recipe
  python-oslo.messaging: upgrade to 1.8.3
  python-oslo.rootwrap: upgrade to 1.6.0
  python-psutil: add recipe
  layer.conf: prefer 1.2.1 version of python-psutil
  python-cinderclient: upgrade to 1.1.2
  python-glanceclient: upgrade to 0.17.3
  python-jsonrpclib: add recipe
  python-keystonemiddleware: upgrade to 1.5.2
  python-nova: upgrade to 2015.1.2
  python-neutron: upgrade to 2015.1.2
  neutron ml2 plugin: enable gre in [agent] section
  python-cryptography,-vectors: add 0.8.1
  python-oslo.policy: add new recipe
  python-keystone: upgrade to 2015.1.2
  python-keystoneclient: upgrade to 1.3.3
  python-horizon: upgrade to 2015.1.2
  python-horizon: remove dependency on lesscpy
  python-lesscpy: remove recipe
  Openstack doesn't depend on lockfile anymore
  python-lockfile: remove recipe

Mark Asselstine (1):
  horizon: add missing dependencies to address startup errors

 meta-openstack/conf/layer.conf                     |  2 +
 .../python/python-aioeventlet_0.4.bb               | 14 +++++++
 .../python/python-ceilometer_git.bb                |  1 -
 .../recipes-devtools/python/python-cinder_git.bb   |  1 -
 .../python/python-cinderclient_git.bb              |  7 ++--
 .../python/python-cryptography-vectors_0.8.1.bb    | 14 +++++++
 .../python/python-cryptography/run-ptest           |  2 +
 .../python/python-cryptography_0.8.1.bb            | 46 ++++++++++++++++++++++
 .../python/python-debtcollector_0.3.0.bb           | 22 +++++++++++
 .../python/python-glanceclient_git.bb              | 18 ++++-----
 .../recipes-devtools/python/python-heat_git.bb     |  1 -
 .../recipes-devtools/python/python-horizon_git.bb  | 13 +++---
 .../python/python-jsonrpclib_0.1.6.bb              | 11 ++++++
 .../recipes-devtools/python/python-keystone_git.bb |  9 +++--
 .../python/python-keystoneclient_git.bb            |  8 ++--
 .../python/python-keystonemiddleware_git.bb        |  7 ++--
 .../0001-lesscpy-remove-explicit-python3.patch     | 23 -----------
 ...02-Description-Fixup-for-python3.3-compat.patch | 31 ---------------
 .../recipes-devtools/python/python-lesscpy_0.9j.bb | 28 -------------
 .../python/python-lockfile_0.9.1.bb                | 17 --------
 .../recipes-devtools/python/python-neutron_git.bb  | 13 +++---
 .../recipes-devtools/python/python-nova_git.bb     |  9 +++--
 ...y_1.5.0.bb => python-oslo.concurrency_1.8.2.bb} | 14 +++++--
 ...config_1.6.1.bb => python-oslo.config_1.9.3.bb} |  4 +-
 .../python/python-oslo.context_git.bb              |  9 ++---
 ...on-oslo.db_1.5.0.bb => python-oslo.db_1.7.2.bb} |  7 +---
 ...slo.i18n_1.4.0.bb => python-oslo.i18n_1.5.0.bb} |  5 ++-
 .../recipes-devtools/python/python-oslo.log_git.bb | 11 +++---
 .../python/python-oslo.messaging_git.bb            | 23 +++++++----
 ...re_0.4.0.bb => python-oslo.middleware_1.0.0.bb} | 16 ++++----
 .../python/python-oslo.policy_0.3.2.bb             | 29 ++++++++++++++
 ...wrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} |  7 ++--
 .../python/python-oslo.serialization_git.bb        | 11 ++++--
 .../python/python-oslo.utils_git.bb                | 12 ++++--
 .../recipes-devtools/python/python-psutil_1.2.1.bb | 16 ++++++++
 ...thon-pycadf_0.6.0.bb => python-pycadf_0.8.0.bb} |  6 +--
 ...tevedore_1.2.0.bb => python-stevedore_1.3.0.bb} | 13 ++----
 .../{python-tooz_0.4.bb => python-tooz_0.13.3.bb}  |  6 +--
 .../recipes-devtools/python/python-trollius_2.0.bb | 10 +++++
 .../recipes-devtools/python/python-wrapt_1.10.5.bb | 11 ++++++
 .../{python-wsme_0.6.bb => python-wsme_0.8.0.bb}   | 14 ++++---
 .../python-xstatic-angular-irdragndrop_1.0.2.2.bb  | 22 +++++++++++
 .../python-xstatic-angular-lrdragndrop_1.0.2.2.bb  | 22 +++++++++++
 .../python/python-xstatic-magic-search_0.2.5.1.bb  | 21 ++++++++++
 44 files changed, 366 insertions(+), 220 deletions(-)
 create mode 100644 meta-openstack/recipes-devtools/python/python-aioeventlet_0.4.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography-vectors_0.8.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography/run-ptest
 create mode 100644 meta-openstack/recipes-devtools/python/python-cryptography_0.8.1.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-debtcollector_0.3.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-jsonrpclib_0.1.6.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0001-lesscpy-remove-explicit-python3.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy/0002-Description-Fixup-for-python3.3-compat.patch
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lesscpy_0.9j.bb
 delete mode 100644 meta-openstack/recipes-devtools/python/python-lockfile_0.9.1.bb
 rename meta-openstack/recipes-devtools/python/{python-oslo.concurrency_1.5.0.bb => python-oslo.concurrency_1.8.2.bb} (61%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.config_1.6.1.bb => python-oslo.config_1.9.3.bb} (79%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.db_1.5.0.bb => python-oslo.db_1.7.2.bb} (78%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.i18n_1.4.0.bb => python-oslo.i18n_1.5.0.bb} (77%)
 rename meta-openstack/recipes-devtools/python/{python-oslo.middleware_0.4.0.bb => python-oslo.middleware_1.0.0.bb} (60%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-oslo.policy_0.3.2.bb
 rename meta-openstack/recipes-devtools/python/{python-oslo.rootwrap_1.5.0.bb => python-oslo.rootwrap_1.6.0.bb} (76%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-psutil_1.2.1.bb
 rename meta-openstack/recipes-devtools/python/{python-pycadf_0.6.0.bb => python-pycadf_0.8.0.bb} (81%)
 rename meta-openstack/recipes-devtools/python/{python-stevedore_1.2.0.bb => python-stevedore_1.3.0.bb} (53%)
 rename meta-openstack/recipes-devtools/python/{python-tooz_0.4.bb => python-tooz_0.13.3.bb} (81%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-trollius_2.0.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-wrapt_1.10.5.bb
 rename meta-openstack/recipes-devtools/python/{python-wsme_0.6.bb => python-wsme_0.8.0.bb} (56%)
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-irdragndrop_1.0.2.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-angular-lrdragndrop_1.0.2.2.bb
 create mode 100644 meta-openstack/recipes-devtools/python/python-xstatic-magic-search_0.2.5.1.bb

-- 
2.1.0


