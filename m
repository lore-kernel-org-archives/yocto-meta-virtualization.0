Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
 by mx.groups.io with SMTP id smtpd.web11.3180.1591124070093811817
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 02 Jun 2020 11:54:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.1.11, mailfrom: bsarashk@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 052IsSO5014870
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL);
	Tue, 2 Jun 2020 11:54:28 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
 (147.11.189.50) with Microsoft SMTP Server id 14.3.487.0; Tue, 2 Jun 2020
 11:54:27 -0700
Received: by ala-lpggp2.wrs.com (Postfix, from userid 16552)	id 97348C60112;
 Tue,  2 Jun 2020 11:54:27 -0700 (PDT)
From: "Babak Sarashki" <babak.sarashki@windriver.com>
To: <meta-virtualization@lists.yoctoproject.org>
CC: <zbsarashki@gmail.com>, Babak Sarashki <Babak.SarAshki@windriver.com>
Subject: [meta-virtualization][m-c-s][PATCH 00/34] satisfy setup.py setup_requires
Date: Tue, 2 Jun 2020 11:53:53 -0700
Message-ID: <20200602185427.36627-1-Babak.SarAshki@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

I need these patches on warrior. Let me know to redo against warrior if not relevant in master any longer.

*** BLURB HERE ***

Babak Sarashki (34):
  python-automaton: satisfy setup.py setup_requires
  python-barbican: satisfy setup.py setup_requires
  pythin-castellan: satisfy setup.py setup_requires
  python-ceilometer: satisfy setup.py setup_requires
  python-cinder: satisfy setup.py setup_requires
  python-cursive: satisfy setup.py setup_requires
  python-glance-store: satisfy setup.py setup_requires
  python-glance: satisfy setup.py setup_requires
  python-glacnestore: satisfy setup.py setup_requires
  python-heat-cfntools: satisfy setup.py setup_requires
  python-horizon: satisfy setup.py setup_requires
  python-jsonpath-rw-ext: satisfy setup.py setup_requires
  python-microversion-parse: satisfy setup.py setup_requires
  python-neutron-lib: satisfy setup.py setup_requires
  python-neutron: satisfy setup.py setup_requires
  python-nova: satisfy setup.py setup_requires
  python-openstackclient: satisfy setup.py setup_requires
  python-openstacksdk: satisfy setup.py setup_requires
  python-os-brick: satisfy setup.py setup_requires
  python-os-traits: satisfy setup.py setup_requires
  python-os-vif: satisfy setup.py setup_requires
  python-os-win: satisfy setup.py setup_requires
  python-os-xenapi: satisfy setup.py setup_requires
  python-oslo.privsep: satisfy setup.py setup_requires
  python-oslo.rootwrap: satisfy setup.py setup_requires
  python-oslo.vmware: satisfy setup.py setup_requires
  python-oslotest: satisfy setup.py setup_requires
  python-pypowervm: satisfy setup.py setup_requires
  python-rally: satisfy setup.py setup_requires
  python-ryu: satisfy setup.py setup_requires
  python-swift: satisfy setup.py setup_requires
  python-taskflow: satisfy setup.py setup_requires
  python-tooz: satisfy setup.py setup_requires
  python-trove: satisfy setup.py setup_requires

 .../recipes-devtools/python/python-automaton_0.8.0.bb      | 5 +++++
 .../recipes-devtools/python/python-barbican_git.bb         | 5 +++++
 .../recipes-devtools/python/python-castellan_git.bb        | 5 +++++
 .../recipes-devtools/python/python-ceilometer_git.bb       | 5 +++++
 .../recipes-devtools/python/python-cinder_git.bb           | 5 +++++
 .../recipes-devtools/python/python-cursive_git.bb          | 5 +++++
 .../recipes-devtools/python/python-glance-store_git.bb     | 5 +++++
 .../recipes-devtools/python/python-glance_git.bb           | 5 +++++
 .../recipes-devtools/python/python-glancestore_git.bb      | 5 +++++
 .../recipes-devtools/python/python-heat-cfntools_1.2.8.bb  | 5 +++++
 .../recipes-devtools/python/python-horizon_git.bb          | 5 +++++
 .../recipes-devtools/python/python-jsonpath-rw-ext_git.bb  | 5 +++++
 .../python/python-microversion-parse_git.bb                | 7 ++++++-
 .../recipes-devtools/python/python-neutron-lib_git.bb      | 5 +++++
 .../recipes-devtools/python/python-neutron_git.bb          | 5 +++++
 meta-openstack/recipes-devtools/python/python-nova_git.bb  | 5 +++++
 .../recipes-devtools/python/python-openstackclient_git.bb  | 5 +++++
 .../recipes-devtools/python/python-openstacksdk_git.bb     | 5 +++++
 .../recipes-devtools/python/python-os-brick_git.bb         | 5 +++++
 .../recipes-devtools/python/python-os-traits_git.bb        | 5 +++++
 .../recipes-devtools/python/python-os-vif_git.bb           | 7 ++++++-
 .../recipes-devtools/python/python-os-win_git.bb           | 5 +++++
 .../recipes-devtools/python/python-os-xenapi_git.bb        | 5 +++++
 .../recipes-devtools/python/python-oslo.privsep_git.bb     | 5 +++++
 .../recipes-devtools/python/python-oslo.rootwrap_git.bb    | 5 +++++
 .../recipes-devtools/python/python-oslo.vmware_git.bb      | 5 +++++
 .../recipes-devtools/python/python-oslotest_git.bb         | 7 ++++++-
 .../recipes-devtools/python/python-pypowervm_1.1.10.bb     | 5 +++++
 meta-openstack/recipes-devtools/python/python-rally_git.bb | 5 +++++
 meta-openstack/recipes-devtools/python/python-ryu_git.bb   | 5 +++++
 meta-openstack/recipes-devtools/python/python-swift_git.bb | 5 +++++
 .../recipes-devtools/python/python-taskflow_git.bb         | 7 ++++++-
 .../recipes-devtools/python/python-tooz_1.48.0.bb          | 5 +++++
 meta-openstack/recipes-devtools/python/python-trove_git.bb | 5 +++++
 34 files changed, 174 insertions(+), 4 deletions(-)

-- 
2.23.0

