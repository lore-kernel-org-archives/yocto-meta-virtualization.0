Return-Path: <jori@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by yocto-www.yoctoproject.org (Postfix) with SMTP id 1117BE007DC
	for <meta-virtualization@yoctoproject.org>;
	Wed, 26 Feb 2014 02:08:14 -0800 (PST)
Received: from sestows930 (172.16.140.35) by smtp.enea.com (172.21.1.209) with
	Microsoft SMTP Server id 14.3.158.1; Wed, 26 Feb 2014 11:08:05 +0100
Received: from jori by sestows930 with local (Exim 4.80)	(envelope-from
	<jori@sestows930>)	id 1WIbPK-0004YH-9d; Wed, 26 Feb 2014 11:08:06 +0100
From: Jonas Eriksson <jonas.eriksson@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Wed, 26 Feb 2014 11:07:53 +0100
Message-ID: <1393409277-17451-2-git-send-email-jonas.eriksson@enea.com>
X-Mailer: git-send-email 1.9.rc1
In-Reply-To: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
References: <1393409277-17451-1-git-send-email-jonas.eriksson@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: jonas.eriksson@enea.com does not
	designate permitted sender hosts)
Subject: [PATCH 1/5] libvirt: Change license to LGPLv2.1+
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
X-List-Received-Date: Wed, 26 Feb 2014 10:08:15 -0000
Content-Type: text/plain

libvirt is to a large extent licensed under LGPLv2.1 (or later) rather
than GPLv2. From my investigations, there are only some tests and a
couple of files under tools are licensed as GPL. Other than that, files
are generally licensed as LGPL. My recommendation is therefore to set
the default license to LGPLv2.1+, and to add a LICENSE_${PN}-ptest that
is set to LGPLv2.1+ & GPLv2+ if a ptest package is added. This is
preferred to avoid having to specify explicit licenses for every other
package, such as the auto generated libvirt-locale-XX packages.

Signed-off-by: Jonas Eriksson <jonas.eriksson@enea.com>
---
 recipes-extended/libvirt/libvirt_1.2.1.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes-extended/libvirt/libvirt_1.2.1.bb b/recipes-extended/libvirt/libvirt_1.2.1.bb
index 3b95486..d30f09d 100644
--- a/recipes-extended/libvirt/libvirt_1.2.1.bb
+++ b/recipes-extended/libvirt/libvirt_1.2.1.bb
@@ -1,7 +1,8 @@
 DESCRIPTION = "A toolkit to interact with the virtualization capabilities of recent versions of Linux." 
 HOMEPAGE = "http://libvirt.org"
-LICENSE = "GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
+LICENSE = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://COPYING.LESSER;md5=4fbd65380cdd255951079008b364516c"
 SECTION = "console/tools"
 PR = "r1"
 
-- 
1.9.rc1


