Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B4759E0090A; Thu, 29 Mar 2018 12:29:24 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4950E008D3
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:23 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w2TJTMUc018165
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Mar 2018 12:29:23 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 29 Mar 2018 12:29:22 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Thu, 29 Mar 2018 15:29:11 -0400
Message-ID: <1522351753-22380-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [m-c-s][PATCH 1/3] postgresql: follow move to recipes-dbs done in meta-openembedded
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
X-List-Received-Date: Thu, 29 Mar 2018 19:29:24 -0000
Content-Type: text/plain

Commit 742404cc8ab0 [postgres: move to recipes-dbs] in
meta-openembedded moved the postgresql recipe to recipes-dbs. We
usually try to match the bbappend's path with that of the bb so
complete a matching move here.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql     | 0
 .../postgresql/postgresql/postgresql-init                                 | 0
 .../postgresql/postgresql/postgresql-init.service                         | 0
 .../{recipes-support => recipes-dbs}/postgresql/postgresql_9.%.bbappend   | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql (100%)
 rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql-init (100%)
 rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql/postgresql-init.service (100%)
 rename meta-openstack/{recipes-support => recipes-dbs}/postgresql/postgresql_9.%.bbappend (100%)

diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql
similarity index 100%
rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql
rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql
diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
similarity index 100%
rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql-init
rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init
diff --git a/meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service b/meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init.service
similarity index 100%
rename from meta-openstack/recipes-support/postgresql/postgresql/postgresql-init.service
rename to meta-openstack/recipes-dbs/postgresql/postgresql/postgresql-init.service
diff --git a/meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend b/meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
similarity index 100%
rename from meta-openstack/recipes-support/postgresql/postgresql_9.%.bbappend
rename to meta-openstack/recipes-dbs/postgresql/postgresql_9.%.bbappend
-- 
2.7.4


