Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 49DA6E00927; Wed, 12 Aug 2015 12:48:07 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3FF71E00758
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 12:48:05 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7CJm5R1018081
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 12 Aug 2015 12:48:05 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 12 Aug 2015 12:48:04 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 12 Aug 2015 15:47:59 -0400
Message-ID: <1439408879-8203-4-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
References: <1439408879-8203-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 3/3] keystone: the 'sql' section is deprecated
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
X-List-Received-Date: Wed, 12 Aug 2015 19:48:07 -0000
Content-Type: text/plain

Attempting to use commands such as 'glance image-list' or 'keystone
tenant-list' was resulting in various errors including 'error
500'. Examining the logs it was found that keystone was throwing the
following warning:

  WARNING oslo_config.cfg [-] Option "connection" from group "sql" is
  deprecated. Use option "connection" from group "database".

Examining the database I found that the keystone database existed but
was empty. This indicates that some of the install scripts were
failing, possibly due to issues connecting to the database due to a
bad configuration. So taking the WARNING to heed I swapped the 'sql'
section header for 'database' and now the database is properly created
and keystone commands can be successfully executed.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-keystone/keystone.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone.conf b/meta-openstack/recipes-devtools/python/python-keystone/keystone.conf
index 0ab1c3f..cdeb156 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone/keystone.conf
+++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone.conf
@@ -73,7 +73,7 @@ admin_token=%SERVICE_TOKEN%
 # or a module with notify() method:
 # onready = keystone.common.systemd
 
-[sql]
+[database]
 # The SQLAlchemy connection string used to connect to the database
 connection = postgresql://%DB_USER%:%DB_PASSWORD%@localhost/keystone
 
-- 
2.1.4


