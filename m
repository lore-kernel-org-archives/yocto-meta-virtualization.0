Return-Path: <amy.fong@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 4E8BDE00D63; Tue, 15 Sep 2015 21:16:16 -0700 (PDT)
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
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 26286E00B7A
	for <meta-virtualization@yoctoproject.org>;
	Tue, 15 Sep 2015 21:16:12 -0700 (PDT)
Received: from yow-dellw-af (yow-dellw-af.wrs.com [128.224.56.22])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t8G4GAfd012276
	(version=TLSv1.2 cipher=AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 15 Sep 2015 21:16:11 -0700 (PDT)
Received: from afong by yow-dellw-af with local (Exim 4.86)
	(envelope-from <amy.fong@windriver.com>)
	id 1Zc48M-00074l-FI; Wed, 16 Sep 2015 00:15:50 -0400
Date: Wed, 16 Sep 2015 00:15:50 -0400
From: Amy Fong <amy.fong@windriver.com>
To: meta-virtualization@yoctoproject.org
Message-ID: <20150916041550.GA27159@windriver.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.23 (2014-03-12)
Subject: [PATCH] docker: update SRC_URI
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
X-List-Received-Date: Wed, 16 Sep 2015 04:16:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Author: Amy Fong <amy.fong@windriver.com>
Date:   Wed Sep 16 00:12:10 2015 -0400

    docker: update SRC_URI
    
    branch=release is no longer valid in the git tree,
    updating the branch to v1.6.2
    
    Signed-off-by: Amy Fong <amy.fong@windriver.com>

diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
index aa125a3..46714fe 100644
--- a/recipes-containers/docker/docker_git.bb
+++ b/recipes-containers/docker/docker_git.bb
@@ -19,8 +19,9 @@ DESCRIPTION = "Linux container runtime \
  "
 
 SRCREV = "7c8fca2ddb58c8d2c4fb4df31c242886df7dd257"
+SRCBRANCH = "v1.6.2"
 SRC_URI = "\
-       git://github.com/docker/docker.git;branch=release \
+       git://github.com/docker/docker.git;branch=${SRCBRANCH};nobranch=1 \
        file://docker.service \
        file://docker.init \
        file://hi.Dockerfile \


