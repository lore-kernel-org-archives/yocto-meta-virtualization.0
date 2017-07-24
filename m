Return-Path: <Yi.Zhao@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3F74BE00BF3; Sun, 23 Jul 2017 22:14:06 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 94786E00BE8
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 22:14:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6O5E465028435
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Sun, 23 Jul 2017 22:14:04 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Sun, 23 Jul 2017 22:14:03 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <mark.asselstine@windriver.com>,
	<bruce.ashfield@windriver.com>
Date: Mon, 24 Jul 2017 13:14:21 +0800
Message-ID: <1500873264-24606-1-git-send-email-yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [meta-cloud-services][PATCH 0/3] glusterfs: upgrade to 3.11.1
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
X-List-Received-Date: Mon, 24 Jul 2017 05:14:06 -0000
Content-Type: text/plain

Upgrade glusterfs from 3.4.2 to 3.11.1
Add libiverbs and librdmacm recipes which is needed by glusterfs.

Yi Zhao (3):
  libibverbs: add new recpie
  librdmacm: add new recipe
  glusterfs: uprev to 3.11.1

 ...nt.glusterfs-not-accepting-version-argume.patch |  33 -----
 ...c-allow-PYTHON-values-to-be-passed-via-en.patch |  67 ++++++++++
 .../dependence-on-correct-header-file-path.patch   |  32 +++++
 .../files/glusterd-change-port-range.patch         |  39 ++++++
 .../files/{glusterd-ovp => glusterd.init}          |   6 +-
 recipes-extended/glusterfs/files/glusterd.service  |  12 ++
 ...fs-api-remove-unnecessary-library-options.patch |  31 +++++
 .../glusterfs-change-default-nfs-port-number.patch |  49 +++++++
 ...onfigure-automake-with-subdir-objects-for.patch |  37 ++++++
 ...glusterfs-disable-default-startup-scripts.patch |  24 +++-
 .../libglusterfs-Don-t-link-against-libfl.patch    |  46 +++++++
 ...python-work-around-host-and-target-python.patch |  81 ++++++++++++
 .../files/xlator-host-contamination-3.4.patch      |  34 +++--
 recipes-extended/glusterfs/glusterfs.inc           | 142 ++++++++++++++++-----
 recipes-extended/glusterfs/glusterfs_3.11.1.bb     |   6 +
 recipes-extended/glusterfs/glusterfs_3.4.2.bb      |  12 --
 recipes-extended/libibverbs/libibverbs_1.1.7.bb    |  27 ++++
 .../librdmacm/files/librdmacm-needs-libdl.patch    |  21 +++
 recipes-extended/librdmacm/librdmacm_1.0.17.bb     |  41 ++++++
 19 files changed, 639 insertions(+), 101 deletions(-)
 delete mode 100644 recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
 create mode 100644 recipes-extended/glusterfs/files/configure.ac-allow-PYTHON-values-to-be-passed-via-en.patch
 create mode 100644 recipes-extended/glusterfs/files/dependence-on-correct-header-file-path.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterd-change-port-range.patch
 rename recipes-extended/glusterfs/files/{glusterd-ovp => glusterd.init} (92%)
 create mode 100644 recipes-extended/glusterfs/files/glusterd.service
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-api-remove-unnecessary-library-options.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-change-default-nfs-port-number.patch
 create mode 100644 recipes-extended/glusterfs/files/glusterfs-configure-automake-with-subdir-objects-for.patch
 create mode 100644 recipes-extended/glusterfs/files/libglusterfs-Don-t-link-against-libfl.patch
 create mode 100644 recipes-extended/glusterfs/files/python-work-around-host-and-target-python.patch
 create mode 100644 recipes-extended/glusterfs/glusterfs_3.11.1.bb
 delete mode 100644 recipes-extended/glusterfs/glusterfs_3.4.2.bb
 create mode 100644 recipes-extended/libibverbs/libibverbs_1.1.7.bb
 create mode 100644 recipes-extended/librdmacm/files/librdmacm-needs-libdl.patch
 create mode 100644 recipes-extended/librdmacm/librdmacm_1.0.17.bb

-- 
2.7.4


