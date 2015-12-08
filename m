Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC757E00C1E; Tue,  8 Dec 2015 09:34:53 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 074F0E00B9E
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:33 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:32 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:35 +0100
Message-ID: <1449596034-8308-24-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 23/42] keystone: the 'sql' section is deprecated
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:53 -0000
Content-Type: text/plain

From: Mark Asselstine <mark.asselstine@windriver.com>

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
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
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
2.5.0


