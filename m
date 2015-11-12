Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9B51BE008D2; Wed, 11 Nov 2015 18:50:37 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 59D3DE006F3
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:34 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC2oYwp016704
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 11 Nov 2015 18:50:34 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 11 Nov 2015 18:50:33 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>, <meta-virtualization@yoctoproject.org>
Date: Wed, 11 Nov 2015 21:50:27 -0500
Message-ID: <1447296631-16483-2-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
References: <1447296631-16483-1-git-send-email-mark.asselstine@windriver.com>
MIME-Version: 1.0
Subject: [meta-cloud-services][PATCH 2/6] init: no need to close (non-existing) ps file descriptors
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
X-List-Received-Date: Thu, 12 Nov 2015 02:50:37 -0000
Content-Type: text/plain

Attempting to get the status of various daemons which are part of the
compute image results in an error:

ps: write error: Bad file descriptor

Switch to using the more standard io redirection techniques to avoid
this error.

Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
---
 meta-openstack/recipes-devtools/python/python-barbican/barbican.init    | 2 +-
 .../recipes-devtools/python/python-ceilometer/ceilometer.init           | 2 +-
 meta-openstack/recipes-devtools/python/python-cinder/cinder-volume      | 2 +-
 meta-openstack/recipes-devtools/python/python-cinder/cinder.init        | 2 +-
 meta-openstack/recipes-devtools/python/python-glance/glance.init        | 2 +-
 meta-openstack/recipes-devtools/python/python-heat/heat.init            | 2 +-
 meta-openstack/recipes-devtools/python/python-horizon/horizon.init      | 2 +-
 meta-openstack/recipes-devtools/python/python-keystone/keystone         | 2 +-
 .../recipes-devtools/python/python-neutron/neutron-agent.init           | 2 +-
 .../recipes-devtools/python/python-neutron/neutron-server.init          | 2 +-
 meta-openstack/recipes-devtools/python/python-nova/nova-all             | 2 +-
 meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth     | 2 +-
 meta-openstack/recipes-devtools/python/python-nova/nova.init            | 2 +-
 meta-openstack/recipes-devtools/python/python-rally/rally.init          | 2 +-
 meta-openstack/recipes-devtools/python/python-trove/trove-init          | 2 +-
 15 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/meta-openstack/recipes-devtools/python/python-barbican/barbican.init b/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
index 5b353e1..a23a493 100644
--- a/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
+++ b/meta-openstack/recipes-devtools/python/python-barbican/barbican.init
@@ -71,7 +71,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init b/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
index ba0f426..80fdff5 100644
--- a/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
+++ b/meta-openstack/recipes-devtools/python/python-ceilometer/ceilometer.init
@@ -62,7 +62,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume b/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
index f753810..7d0aa14 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
+++ b/meta-openstack/recipes-devtools/python/python-cinder/cinder-volume
@@ -61,7 +61,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-cinder/cinder.init b/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
index f130ac8..4c97962 100644
--- a/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
+++ b/meta-openstack/recipes-devtools/python/python-cinder/cinder.init
@@ -63,7 +63,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-glance/glance.init b/meta-openstack/recipes-devtools/python/python-glance/glance.init
index 5b1bf74..cbcfb0a 100644
--- a/meta-openstack/recipes-devtools/python/python-glance/glance.init
+++ b/meta-openstack/recipes-devtools/python/python-glance/glance.init
@@ -62,7 +62,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-heat/heat.init b/meta-openstack/recipes-devtools/python/python-heat/heat.init
index 5e0719f..794ac6a 100644
--- a/meta-openstack/recipes-devtools/python/python-heat/heat.init
+++ b/meta-openstack/recipes-devtools/python/python-heat/heat.init
@@ -68,7 +68,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-horizon/horizon.init b/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
index 994fbec..be79353 100644
--- a/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
+++ b/meta-openstack/recipes-devtools/python/python-horizon/horizon.init
@@ -58,7 +58,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-keystone/keystone b/meta-openstack/recipes-devtools/python/python-keystone/keystone
index 8953da8..0d8a538 100644
--- a/meta-openstack/recipes-devtools/python/python-keystone/keystone
+++ b/meta-openstack/recipes-devtools/python/python-keystone/keystone
@@ -59,7 +59,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init b/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
index 8b11a27..c9d8d72 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
+++ b/meta-openstack/recipes-devtools/python/python-neutron/neutron-agent.init
@@ -60,7 +60,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init b/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
index 0c78de6..77f8f01 100644
--- a/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
+++ b/meta-openstack/recipes-devtools/python/python-neutron/neutron-server.init
@@ -63,7 +63,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova-all b/meta-openstack/recipes-devtools/python/python-nova/nova-all
index c1d537d..914b714 100644
--- a/meta-openstack/recipes-devtools/python/python-nova/nova-all
+++ b/meta-openstack/recipes-devtools/python/python-nova/nova-all
@@ -62,7 +62,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth b/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
index 99f04d5..9a74107 100644
--- a/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
+++ b/meta-openstack/recipes-devtools/python/python-nova/nova-consoleauth
@@ -48,7 +48,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-nova/nova.init b/meta-openstack/recipes-devtools/python/python-nova/nova.init
index 46b28d3..607b6de 100644
--- a/meta-openstack/recipes-devtools/python/python-nova/nova.init
+++ b/meta-openstack/recipes-devtools/python/python-nova/nova.init
@@ -78,7 +78,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-rally/rally.init b/meta-openstack/recipes-devtools/python/python-rally/rally.init
index e834547..6128e48 100644
--- a/meta-openstack/recipes-devtools/python/python-rally/rally.init
+++ b/meta-openstack/recipes-devtools/python/python-rally/rally.init
@@ -63,7 +63,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
diff --git a/meta-openstack/recipes-devtools/python/python-trove/trove-init b/meta-openstack/recipes-devtools/python/python-trove/trove-init
index 584bf77..ee0bd21 100644
--- a/meta-openstack/recipes-devtools/python/python-trove/trove-init
+++ b/meta-openstack/recipes-devtools/python/python-trove/trove-init
@@ -73,7 +73,7 @@ status()
 {
     pid=`cat $PIDFILE 2>/dev/null`
     if [ -n "$pid" ]; then
-        if ps -p $pid >&- ; then
+        if ps -p $pid > /dev/null 2>&1 ; then
             echo "$DESC is running"
             return
         fi
-- 
2.1.4


