Return-Path: <josep.puigdemont@enea.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D4F10E00C19; Tue,  8 Dec 2015 09:34:46 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with SMTP id C5A14E00B8B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  8 Dec 2015 09:34:30 -0800 (PST)
Received: from iapetus.enea.se (172.16.140.26) by smtp.enea.com (172.21.1.208)
	with Microsoft SMTP Server id 14.3.224.2;
	Tue, 8 Dec 2015 18:34:29 +0100
From: Josep Puigdemont <josep.puigdemont@enea.com>
To: <meta-virtualization@yoctoproject.org>
Date: Tue, 8 Dec 2015 18:33:33 +0100
Message-ID: <1449596034-8308-22-git-send-email-josep.puigdemont@enea.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
References: <1449596034-8308-1-git-send-email-josep.puigdemont@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: josep.puigdemont@enea.com does not
	designate permitted sender hosts)
Subject: [meta-cloud-services][fido-kilo][PATCH 21/42] ruby.bbclass: Error fix
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
X-List-Received-Date: Tue, 08 Dec 2015 17:34:46 -0000
Content-Type: text/plain

From: Li xin <lixin.fnst@cn.fujitsu.com>

When build the recipes which inherit ruby,ERROR will occur as following:
ERROR: QA Issue: non debug package contains .debug directory: json
path /work/core2-64-oe-linux/json/1.8.3-r0/packages-split/json/usr/lib/ruby/
gems/2.2.0/extensions/x86_64-linux/2.2.0/json-1.8.3/json/ext/.debug/generator.so [debug-files]
So modify ruby.bbclass.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta-openstack/classes/ruby.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-openstack/classes/ruby.bbclass b/meta-openstack/classes/ruby.bbclass
index 957abf7..0c842d5 100644
--- a/meta-openstack/classes/ruby.bbclass
+++ b/meta-openstack/classes/ruby.bbclass
@@ -114,6 +114,7 @@ FILES_${PN}-dbg += " \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/.debug \
         ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/gems/*/*/*/*/*/.debug \
+        ${libdir}/ruby/gems/${RUBY_GEM_VERSION}/extensions/*/*/*/*/*/.debug \
         "
 
 FILES_${PN} += " \
-- 
2.5.0


