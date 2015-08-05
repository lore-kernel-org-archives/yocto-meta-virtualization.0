Return-Path: <Mark.Asselstine@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1399E009B3; Wed,  5 Aug 2015 13:29:58 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 93F2BE009B3
	for <meta-virtualization@yoctoproject.org>;
	Wed,  5 Aug 2015 13:29:53 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t75KTrnu010608
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <meta-virtualization@yoctoproject.org>;
	Wed, 5 Aug 2015 13:29:53 -0700 (PDT)
Received: from yow-dellw-ma.wrs.com (128.224.56.18) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Wed, 5 Aug 2015 13:29:53 -0700
From: Mark Asselstine <mark.asselstine@windriver.com>
To: <bruce.ashfield@windriver.com>
Date: Wed, 5 Aug 2015 16:29:41 -0400
Message-ID: <1438806592-32745-1-git-send-email-mark.asselstine@windriver.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: meta-virtualization@yoctoproject.org, mark.asselstine@windriver.com
Subject: [m-c-s][PATCH 00/11] fixup danglers
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
X-List-Received-Date: Wed, 05 Aug 2015 20:29:58 -0000
Content-Type: text/plain

The primary goal of this patch series was to address the numerous
dangling bbappends that exist on the the 'master' branch (I suspect
the other branches have danglers too but master is what I have been
building lately and my goal is to get these on to master where they
can then be propagated to any applicable branches).

The first set of patches therefor address the danglers. Through
inspection some of the danglers can be deemed no longer needed and
have been removed. Others appear to still be relevant and thus were
re-attached (using wildcards when possible). I tried to capture
details in the commit logs as I looked at each dangler, for some of
the obvious ones I did do some grouping to avoid multiple repetitive
commits. For most of the re-attached danglers no changes were needed
but again details of any required changes were captured in the
associated commit logs.

The series grew a bit beyond just addressing the danglers as the main
images - openstack-image-compute and openstack-image-controller - were
not build-able. So some of this series introduces changes that were
required to get these images build-able again. Once I had build-able
images I was able to poke around to ensure that my dangler
removal/re-attachments didn't cause any immediate runtime issues. I
was able to do some validation but due to issues with the openstack
dashboard I wasn't able to perform the minimal openstack tests
(spinning up an instance, interacting with the dashboard...).

Obviously I would like to be able to validate with the base usecase
but the series has already grown beyond the initial goal. With the
images previously being unbuild-able I can only assume the issues with
the dashboard etc. were preexisting. I will continue to work on
getting 'master' to a working state but please consider merging this
series so that the changes can be available to anyone else who would
like to work on 'master' but currently can't even build it.

Regards,
Mark


P.S. The "[m-c-s]" in the subject line is obviously for
'meta-cloud-services'. I had to use the abbreviation as git was
truncating things otherwise. Looking at the mailing list it seems I am
the first one to send more than a single patch and thus the first to
run in to the truncation.

