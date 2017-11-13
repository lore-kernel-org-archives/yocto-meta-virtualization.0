Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C09E7E00BEA; Mon, 13 Nov 2017 11:32:37 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	http://www.dnswl.org/, *      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 522B9E00BEA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:36 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id vADJWax0010400
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Mon, 13 Nov 2017 11:32:36 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 13 Nov 2017 11:32:36 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>
Date: Mon, 13 Nov 2017 14:32:21 -0500
Message-ID: <1510601551-32245-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
References: <1510601551-32245-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [m-c-s][PATCH 01/11] python-keystone: launch service via uwsgi
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
X-List-Received-Date: Mon, 13 Nov 2017 19:32:37 -0000
Content-Type: text/plain

The keystone-all has been removed upstream and all indication seem to
show that using uwsgi is the new approach to launching this service.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-keystone/keystone | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone b/meta-openstack/recipes-devtools/python/python-keystone/keystone
index 0d8a538..34cc3ad 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone/keystone
+++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone
@@ -11,7 +11,8 @@
 ### END INIT INFO
 
 DESC="keystone"
-DAEMON="/usr/bin/keystone-all"
+DAEMON="uwsgi"
+DAEMON_OPTIONS="--http 127.0.0.1:35357 --wsgi-file $(which keystone-wsgi-admin)"
 PIDFILE="/var/run/keystone-all.pid"
 
 start ()
@@ -34,7 +35,7 @@ start ()
 
     start-stop-daemon --start --quiet --background \
         --pidfile ${PIDFILE} --make-pidfile --exec ${DAEMON} \
-	-- --log-dir=/var/log/keystone
+	-- ${DAEMON_OPTIONS}
 
     if [ $? -eq 0 ]; then
         echo "done."
-- 
2.7.4


