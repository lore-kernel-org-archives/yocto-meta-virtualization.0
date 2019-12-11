Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web09.1568.1576030695901816936
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 10 Dec 2019 18:18:16 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 140.211.169.56, mailfrom: timothy.t.orling@linux.intel.com)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 646C8E011EE; Tue, 10 Dec 2019 18:18:15 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: 
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at https://www.dnswl.org/, high
	*      trust
	*      [134.134.136.24 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E55C0E01146
	for <meta-virtualization@yoctoproject.org>; Tue, 10 Dec 2019 18:18:14 -0800 (PST)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 18:18:13 -0800
X-IronPort-AV: E=Sophos;i="5.69,301,1571727600"; 
   d="scan'208";a="215630124"
Received: from ttorling-mac05.jf.intel.com ([10.24.8.190])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 Dec 2019 18:18:13 -0800
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Hashicorp serf and go-crypto: which layer(s)?
Message-Id: <63726798-32ED-4DA0-A82B-8D753AAAB55E@linux.intel.com>
Date: Tue, 10 Dec 2019 18:18:13 -0800
To: meta-virtualization@yoctoproject.org
X-Mailer: Apple Mail (2.3445.104.11)
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

I have a recipe for Hashicorp serf (latest release 0.8.5) which requires =
go-crypto. I=E2=80=99m currently planning to add go-crypto to =
meta-virtualization, but serf makes sense next to consul in =
meta-cloud-services. Currently, the README of m-c-s says its only layer =
dependency is oe-core.

What is the consensus? Should I add recipes-devtools/go/go-crypto_git.bb =
to m-c-s and keep serf next to consul, or should I add =
recipes-connectivity/serf/hashicorp-serf_0.8.5.bb to meta-virtualizaton =
and keep go-crypto with the other go source only packages?

Also, devtool picked up all the licenses from vendor/, so I am adding a =
vendor-licenses.inc file to help keep the serf bb file shorter. Other =
recipes in meta-virtualization, such as kubernetes, would also have a =
lot of vendor code=E2=80=A6has anybody been concerned about licenses =
from vendor/ ?

Cheers,

=E2=80=94Tim=
