Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AC06DE00CCB; Tue, 22 Nov 2016 10:56:20 -0800 (PST)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6A964E00CC0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:18 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAMIuHHa028181
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Nov 2016 10:56:17 -0800 (PST)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 10:56:16 -0800
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Tue, 22 Nov 2016 13:56:12 -0500
Message-ID: <1479840976-10540-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: [PATCH 0/4] improve ability to run multiple dnsmasq instances
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
X-List-Received-Date: Tue, 22 Nov 2016 18:56:20 -0000
Content-Type: text/plain

Bruce,

The following are changes to improve the ability to run multiple
instances of dnsmasq, for instance when lxc and libvirt are both
installed in an image.

The overall changes are fairly minimal despite the seemingly large
number of file touches. The biggest of these is moving from
bind-dynamic to bind-interfaces which is needed to remove some
ambiguity as to which dnsmasq instance would be responsible for
listenning on newly created interfaces. If people were making use of
the dnsmasq automatically listenning on newly created interfaces they
will potentially have to account for this change, none of the public
users of meta-virtualization that I know of expect this.

One of the biggest changes reflected in these commits is to avoid
having any settings in the system/default dnsmasq.conf file, instead
allowing dnsmasq to run with the default settings built into dnsmasq
directly. This should allow us to run dnsmasq as the upstream
community intends. This also allows for easier reuse of the config for
multiple instances of dnsmasq.

I am sending these changes out now to get feedback but these must only
be applied after two related changes are merged to meta-openembedded

[PATCH 1/2] dnsmasq: read the conf files found in dnsmasq.d
[PATCH 2/2] dnsmasq: allow for dnsmasq instances to reuse default dnsmasq.conf

I will also supply changes to meta-overc which will be required but I
will only make those changes once I know these are ready for merging.

Regards,
Mark

