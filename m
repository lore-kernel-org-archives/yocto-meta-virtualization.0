Return-Path: <okaya@kernel.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CA0D1E00B92; Fri, 12 Oct 2018 09:56:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.145.29.99 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4BE96E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 09:56:31 -0700 (PDT)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.117.89.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id D58812064E;
	Fri, 12 Oct 2018 16:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1539363391;
	bh=XnO1eZw+ab/EX/6F94Ehs/gUtChdmy9rG8UyFLsWcjU=;
	h=From:To:Cc:Subject:Date:From;
	b=oZ0VdhnIX0KyOfOxJKqAK3ljlXd6A1fSAYafrrGWadqSkb6B452ElXznXZpkKHWwv
	O/7+CTWEAJVzMnc4EnZB6+wIsUZXJfq0PZuHpXzn8/gH4kC7kiMf1nciZ6Jz74tzt3
	Q4/AB+XQoUWvdL3hJxljKE2D/EkGhBUInlDN+j3I=
From: Sinan Kaya <okaya@kernel.org>
To: meta-virtualization@yoctoproject.org
Date: Fri, 12 Oct 2018 16:56:24 +0000
Message-Id: <20181012165625.23124-1-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
MIME-Version: 1.0
Subject: [sumo] [PATCH v1] lxc: make error report compatible with ptest
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
X-List-Received-Date: Fri, 12 Oct 2018 16:56:31 -0000
Content-Transfer-Encoding: 8bit

ptest puts the test status at the beginning of the test. Follow
the style.

BEGIN: /usr/lib/lxc/ptest
 ### Starting LXC ptest ###
SKIPPED: lxc-test-apparmor
FAIL: lxc-test-attach
PASS: lxc-test-automount
FAIL: lxc-test-autostart
PASS: lxc-test-cgpath
PASS: lxc-test-cloneconfig
PASS: lxc-test-clonetest
PASS: lxc-test-concurrent
FAIL: lxc-test-console
PASS: lxc-test-containertests
PASS: lxc-test-createconfig
FAIL: lxc-test-createtest
FAIL: lxc-test-destroytest
PASS: lxc-test-device-add-remove
PASS: lxc-test-get_item
PASS: lxc-test-getkeys
PASS: lxc-test-list
PASS: lxc-test-locktests
PASS: lxc-test-lxcpath
PASS: lxc-test-may-control
PASS: lxc-test-reboot
PASS: lxc-test-saveconfig
SKIPPED: lxc-test-shutdowntest
PASS: lxc-test-snapshot
PASS: lxc-test-startone
PASS: lxc-test-utils

Results:
    PASSED = 19
    FAILED = 5
    SKIPPED = 2
(for details check individual test log in ./logs directory)

 ### LXC ptest complete ###
END: /usr/lib/lxc/ptest

Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 recipes-containers/lxc/files/run-ptest | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
index e98554497..3f3a75f25 100644
--- a/recipes-containers/lxc/files/run-ptest
+++ b/recipes-containers/lxc/files/run-ptest
@@ -29,17 +29,17 @@ do
     then
 	$test >logs/$(basename $test).log 2>&1
     else
-	echo "$test SKIPPED"
+	echo "SKIPPED: $(basename $test)"
 	skipped=$((skipped+1))
 	continue
     fi
 
     if [ $? -eq 0 ]
     then
-	echo "$test PASS"
+	echo "PASS: $(basename $test)"
 	passed=$((passed+1))
     else
-	echo "$test FAIL"
+	echo "FAIL: $(basename $test)"
 	failed=$((failed+1))
     fi
 done
-- 
2.19.0


