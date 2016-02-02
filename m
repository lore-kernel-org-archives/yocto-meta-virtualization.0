Return-Path: <adrian.ratiu@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A9024E00B45; Tue,  2 Feb 2016 04:02:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 1251 seconds by postgrey-1.32 at yocto-www;
	Tue, 02 Feb 2016 04:02:07 PST
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6C5CCE00AAB
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Feb 2016 04:02:06 -0800 (PST)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u12C24Nx025223 for <meta-virtualization@yoctoproject.org>;
	Tue, 2 Feb 2016 06:02:06 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016020206020481-550594 ;
	Tue, 2 Feb 2016 06:02:04 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 2 Feb 2016 14:01:45 +0200
Message-Id: <1454414505-10399-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 02/02/2016 06:02:04 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 02/02/2016 06:02:06 AM,
	Serialize complete at 02/02/2016 06:02:06 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-02-02_08:, , signatures=0
Cc: Josh Cartwright <joshc@ni.com>
Subject: [meta-cloud-services][PATCH 1/1] salt: add python-futures to RRECOMMENDS for salt-common
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
X-List-Received-Date: Tue, 02 Feb 2016 12:02:10 -0000

From: Josh Cartwright <joshc@ni.com>

The TCP transport mechanism has a dependency on the python-futures
module.  Document this in the form of an RRECOMMENDS.

Signed-off-by: Josh Cartwright <joshc@ni.com>
Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-openstack/recipes-support/salt/salt_2015.8.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb b/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
index 16c86ea..b22b827 100644
--- a/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
+++ b/meta-openstack/recipes-support/salt/salt_2015.8.0.bb
@@ -89,7 +89,7 @@ SUMMARY_${PN}-common = "shared libraries that salt requires for all packages"
 DESCRIPTION_${PN}-common ="${DESCRIPTION_COMMON} This particular package provides shared libraries that \
 salt-master, salt-minion, and salt-syndic require to function."
 RDEPENDS_${PN}-common = "python (>= 2.7.5-5) python (< 2.8) python-dateutil python-jinja2 python-pyyaml python-requests (>= 1.0.0) python-tornado (>= 4.2.1)"
-RRECOMMENDS_${PN}-common = "lsb"
+RRECOMMENDS_${PN}-common = "lsb python-futures"
 RSUGGESTS_${PN}-common = "python-mako python-git"
 RCONFLICTS_${PN}-common = "python-mako (< 0.7.0)"
 CONFFILES_${PN}-common="${sysconfdir}/logrotate.d/${PN}-common"
-- 
2.7.0


