Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E5D8FE00D50; Tue,  3 Oct 2017 08:17:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BAECFE00CF6
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Oct 2017 08:17:51 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v93FHoCJ008838
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <meta-virtualization@yoctoproject.org>;
	Tue, 3 Oct 2017 08:17:50 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 3 Oct 2017 08:17:49 -0700
To: <meta-virtualization@yoctoproject.org>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <1fb178e8-d4cd-6125-8d69-7d65ef34e1e6@windriver.com>
Date: Tue, 3 Oct 2017 10:17:49 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.13; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
Subject: xen-guest-image-minimal.bb
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
X-List-Received-Date: Tue, 03 Oct 2017 15:17:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

I had a user report to me a problem with this recipe.  They received a parsing
error, which was due to effectively a recursion issue.

I looked at the recipe and noticed:

# When xf86-video-vesa is not present, add opengl and don't require wayland:
DISTRO_FEATURES_append = "${@bb.utils.contains('IMAGE_FEATURES', 'x11', \
                             bb.utils.contains('IMAGE_INSTALL',
'xf86-video-vesa', '', ' opengl', d), '', d)}"
DISTRO_FEATURES_remove = "${@bb.utils.contains('IMAGE_INSTALL',
'xf86-video-vesa', '', 'wayland', d)}"

The trigger for the fault the user sent me was this code..  But I question why
the code is even in the recipe.

DISTRO_FEATURE settings are global, while recipe context is local to that
recipe.  So those DISTRO_FEATURES (append and remove) are effectively a no-op to
the rest of the system and would only affect this particular recipe.  I believe
that is incorrect.

In addition changing the DISTRO_FEATURE based on the IMAGE_FEATURE is incorrect
-- as often the IMAGE_FEATURES are defined by referencing the DISTRO_FEATURES
(or MACHINE_FEATURES that reference DISTRO_FEATURES) which gets you into a
variable recursion problem.


The design of the DISTRO_FEATURES is that they must be set in a globally loaded
configuration file, so they are visible to all recipes/tasks -- otherwise they
really have no effect.

I'd offer a patch, but I don't understand what is being attempted here.

--Mark

