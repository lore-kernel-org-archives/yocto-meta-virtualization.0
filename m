Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6A993E00AF2; Thu, 19 Jan 2017 11:33:23 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7AB9CE00A1F
	for <meta-virtualization@yoctoproject.org>;
	Thu, 19 Jan 2017 11:33:20 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v0JJX7wO031429
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 19 Jan 2017 11:33:08 -0800
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 19 Jan 2017 11:33:07 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <meta-virtualization@yoctoproject.org>, <bruce.ashfield@windriver.com>,
	<huangqy.fnst@cn.fujitsu.com>
Date: Thu, 19 Jan 2017 14:33:04 -0500
Message-ID: <1484854386-3400-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [0/2] python-sqlalchemy uprev / new version
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
X-List-Received-Date: Thu, 19 Jan 2017 19:33:23 -0000
Content-Type: text/plain

There are two distinct active release series of the python sqlalchemy
package (1.0.x and 1.1.x). For some packages, like docker-registry
there appears to be no incompatibility issues when using the 1.0.x vs
the 1.1.x series, however, there are openstack packages which are only
compatible with the 1.0.x series. As such we can add the recipes to
build the 1.1.x series but for now we will leave the 1.0.x series in
place for those packages which require it.

Huang Qiyu's original uprev to 1.1.5 has been modified to leave 1.0.9
in place and I have included a second commit to uprev to the latest
stable release in the 1.0.x series.

Huang Qiyu please have a look and agree to these changes, since I left
your signoff in place I don't want Bruce to merge this until you are
comfortable with my changes.

Regards,
Mark

