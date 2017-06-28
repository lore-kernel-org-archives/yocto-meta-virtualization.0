Return-Path: <Zhe.He@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49090E00BC8; Wed, 28 Jun 2017 02:00:03 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 121BEE00BB1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Jun 2017 02:00:00 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v5S9005b011894
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 28 Jun 2017 02:00:00 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Wed, 28 Jun 2017 01:59:59 -0700
From: <zhe.he@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 28 Jun 2017 16:52:48 +0800
Message-ID: <1498639968-17391-2-git-send-email-zhe.he@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
References: <1498639968-17391-1-git-send-email-zhe.he@windriver.com>
MIME-Version: 1.0
Subject: [PATCH] glusterfs: Move from meta-openstack to meta-cloud-services
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
X-List-Received-Date: Wed, 28 Jun 2017 09:00:03 -0000
Content-Type: text/plain

From: He Zhe <zhe.he@windriver.com>

It's not an openstack specific package.

Signed-off-by: He Zhe <zhe.he@windriver.com>
---
 .../files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch | 0
 .../recipes-extended => recipes-extended}/glusterfs/files/glusterd-ovp    | 0
 .../glusterfs/files/glusterfs-disable-default-startup-scripts.patch       | 0
 .../glusterfs/files/xlator-host-contamination-3.4.patch                   | 0
 .../recipes-extended => recipes-extended}/glusterfs/glusterfs.inc         | 0
 .../recipes-extended => recipes-extended}/glusterfs/glusterfs_3.4.2.bb    | 0
 6 files changed, 0 insertions(+), 0 deletions(-)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch (100%)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/files/glusterd-ovp (100%)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/files/glusterfs-disable-default-startup-scripts.patch (100%)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/files/xlator-host-contamination-3.4.patch (100%)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/glusterfs.inc (100%)
 rename {meta-openstack/recipes-extended => recipes-extended}/glusterfs/glusterfs_3.4.2.bb (100%)

diff --git a/meta-openstack/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch b/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
rename to recipes-extended/glusterfs/files/0001-Fix-for-mount.glusterfs-not-accepting-version-argume.patch
diff --git a/meta-openstack/recipes-extended/glusterfs/files/glusterd-ovp b/recipes-extended/glusterfs/files/glusterd-ovp
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/files/glusterd-ovp
rename to recipes-extended/glusterfs/files/glusterd-ovp
diff --git a/meta-openstack/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch b/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
rename to recipes-extended/glusterfs/files/glusterfs-disable-default-startup-scripts.patch
diff --git a/meta-openstack/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch b/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
rename to recipes-extended/glusterfs/files/xlator-host-contamination-3.4.patch
diff --git a/meta-openstack/recipes-extended/glusterfs/glusterfs.inc b/recipes-extended/glusterfs/glusterfs.inc
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/glusterfs.inc
rename to recipes-extended/glusterfs/glusterfs.inc
diff --git a/meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bb b/recipes-extended/glusterfs/glusterfs_3.4.2.bb
similarity index 100%
rename from meta-openstack/recipes-extended/glusterfs/glusterfs_3.4.2.bb
rename to recipes-extended/glusterfs/glusterfs_3.4.2.bb
-- 
2.8.1


