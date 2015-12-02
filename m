Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4DDE2E00B20; Wed,  2 Dec 2015 08:34:15 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id E99E3E00AB9
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 Dec 2015 08:33:33 -0800 (PST)
Received: from iapetus.enea.se (172.16.141.158) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2; Wed, 2 Dec 2015
	17:33:32 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 2 Dec 2015 17:32:35 +0100
Message-ID: <1449073966-29707-30-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
References: <1449073966-29707-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 29/40] neutron ml2 plugin: enable gre in [agent] section
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
X-List-Received-Date: Wed, 02 Dec 2015 16:34:15 -0000
Content-Type: text/plain

Signed-off-by: Josep Puigdemont <josep.puigdemont@enea.com>
Signed-off-by: Florin Dumitrascu <florin.dumitrascu@enea.com>
---
 meta-openstack/recipes-devtools/python/python-neutron_git.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-openstack/recipes-devtools/python/python-neutron_git.bb b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
index e665e5e..154d1cb 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron_git.bb
+++ b/meta-openstack/recipes-devtools/python/python-neutron_git.bb
@@ -79,6 +79,8 @@ do_install_append() {
     echo "local_ip = ${MY_IP}" >> ${NEUTRON_CONF_DIR}/plugins/ml2/ml2_conf.ini
     echo "tunnel_type = gre" >> ${NEUTRON_CONF_DIR}/plugins/ml2/ml2_conf.ini
     echo "enable_tunneling = True" >> ${NEUTRON_CONF_DIR}/plugins/ml2/ml2_conf.ini
+    echo "[agent]" >> ${NEUTRON_CONF_DIR}/plugins/ml2/ml2_conf.ini
+    echo "tunnel_types = gre" >> ${NEUTRON_CONF_DIR}/plugins/ml2/ml2_conf.ini
 
     PLUGIN=openvswitch
     ARGS="--config-file=${sysconfdir}/${SRCNAME}/neutron.conf --config-file=${sysconfdir}/${SRCNAME}/plugins/ml2/ml2_conf.ini"
-- 
2.1.0


