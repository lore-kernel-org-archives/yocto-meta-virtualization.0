Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BFF84E0086F; Fri, 30 Jan 2015 09:35:59 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 411E7E002F9
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:35:49 -0800 (PST)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id t0UHZlxB014006
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NO)
	for <meta-virtualization@yoctoproject.org>;
	Fri, 30 Jan 2015 09:35:48 -0800 (PST)
Received: from afong by yow-dellw-af with local (Exim 4.84)
	(envelope-from <amy.fong@windriver.com>) id 1YHFTl-0002Pv-LH
	for meta-virtualization@yoctoproject.org;
	Fri, 30 Jan 2015 12:35:37 -0500
Date: Fri, 30 Jan 2015 12:35:37 -0500
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150130173537.GA9113@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH 0/2] Uprev openvswitch
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
X-List-Received-Date: Fri, 30 Jan 2015 17:35:59 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following two patches uprevs openvswitch to a version in git (2.3.90, 
1667bb34988358aaf1c92d0d21fad4b1c8698780). This version also enables configuring
with dpdk in PACKAGECONFIG, and it builds the kernel module included in ovs.

The second patch restructures the openvswitch recipes into a openvswitch.inc file
and the associated bb recipe files, removing the shared code from the bb files.

Amy


