Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C869DE00843; Wed,  4 Apr 2018 13:01:37 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F8F2E006B4
	for <meta-virtualization@yoctoproject.org>;
	Wed,  4 Apr 2018 13:01:36 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w34K1WsL004205
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 4 Apr 2018 13:01:33 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 4 Apr 2018 13:01:32 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 4 Apr 2018 16:01:21 -0400
Message-ID: <1522872081-20782-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com
Subject: [m-c-s][PATCH] python-neutron: Don't start the neutron services until init is done
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
X-List-Received-Date: Wed, 04 Apr 2018 20:01:37 -0000
Content-Type: text/plain

Starting the various neutron services prior to completing the work as
part of neutron-init/neutron-init.service will only result in the
services spewing python errors. Disable the systemd services in the
recipe and have the neutron-init script enable these services for
subsequent boots.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 .../recipes-devtools/python/python-neutron/neutron-init   | 15 ++++++++++-----
 .../recipes-devtools/python/python-neutron_git.bb         |  7 +++++++
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-init b/meta-openstack/recipes-devtools/python/python-neutron/neutron-init
index fe98dcb..d0ae023 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-init
+++ b/meta-openstack/recipes-devtools/python/python-neutron/neutron-init
@@ -44,8 +44,13 @@ sudo -u ${NEUTRON_USER} neutron-db-manage --config-file /etc/neutron/neutron.con
 HOME=${ROOT_HOME} rabbitmqctl add_user openstack ${ADMIN_PASSWORD}
 HOME=${ROOT_HOME} rabbitmqctl set_permissions openstack ".*" ".*" ".*"
 
-#systemctl restart nova-api
-systemctl restart neutron-server
-systemctl restart neutron-linuxbridge-agent
-systemctl restart neutron-dhcp-agent
-systemctl restart neutron-metadata-agent
+# enable and start the various services
+systemctl enable neutron-server
+systemctl enable neutron-linuxbridge-agent
+systemctl enable neutron-dhcp-agent
+systemctl enable neutron-metadata-agent
+
+systemctl start neutron-server
+systemctl start neutron-linuxbridge-agent
+systemctl start neutron-dhcp-agent
+systemctl start neutron-metadata-agent
diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index edf9096..a054551 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -418,5 +418,12 @@ SYSTEMD_SERVICE_${SRCNAME}-linuxbridge-agent = "neutron-linuxbridge-agent.servic
 SYSTEMD_SERVICE_${SRCNAME}-metadata-agent = "neutron-metadata-agent.service"
 SYSTEMD_SERVICE_${SRCNAME}-setup = "neutron-init.service"
 
+# Disable unconfigured services
+SYSTEMD_AUTO_ENABLE_${SRCNAME}-server = "disable"
+SYSTEMD_AUTO_ENABLE_${SRCNAME}-dhcp-agent = "disable"
+SYSTEMD_AUTO_ENABLE_${SRCNAME}-linuxbridge-agent = "disable"
+SYSTEMD_AUTO_ENABLE_${SRCNAME}-metadata-agent = "disable"
+
+
 MONITOR_SERVICE_PACKAGES = "${SRCNAME}"
 MONITOR_SERVICE_${SRCNAME} = "neutron"
-- 
2.7.4


