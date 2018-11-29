Return-Path: <tyu@cisco.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7454AE00C72; Thu, 29 Nov 2018 12:15:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_HI, SPF_HELO_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [173.37.142.92 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM
	white-list
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
X-Greylist: delayed 62 seconds by postgrey-1.32 at yocto-www;
	Thu, 29 Nov 2018 12:15:07 PST
Received: from alln-iport-5.cisco.com (alln-iport-5.cisco.com [173.37.142.92])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 381B6E00901
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Nov 2018 12:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=cisco.com; i=@cisco.com; l=790; q=dns/txt; s=iport;
	t=1543522507; x=1544732107;
	h=from:to:cc:subject:date:message-id:mime-version:
	content-transfer-encoding;
	bh=YVUpAfLKtNacDilukVXhZ6AH3ExEHf0Le5GXhy5XiK0=;
	b=cMXjlppnJEk5pUUhQO/LMkiu86VLixnv3B3kdANSt+etNxyKGrsDwVgp
	dH/tK/iqOHCS8mP05d5xLQEcYFjkcFmWUTAxWcNl1v3ikJ9YmtGT6+b8e
	eBBNXJXYiFnstyxoAPTTXYK1o1lJPvqwAta3CGK1lwIX/VON3FLLmCI4a Y=;
X-IronPort-AV: E=Sophos;i="5.56,295,1539648000"; d="scan'208";a="205683639"
Received: from alln-core-10.cisco.com ([173.36.13.132])
	by alln-iport-5.cisco.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Nov 2018 20:14:04 +0000
Received: from sjc-ads-3167.cisco.com (sjc-ads-3167.cisco.com [171.68.248.120])
	by alln-core-10.cisco.com (8.15.2/8.15.2) with ESMTP id wATKE4BL010964; 
	Thu, 29 Nov 2018 20:14:04 GMT
Received: by sjc-ads-3167.cisco.com (Postfix, from userid 23091)
	id 1B89A914; Thu, 29 Nov 2018 12:14:04 -0800 (PST)
From: Ting Yu <tyu@cisco.com>
To: meta-virtualization@yoctoproject.org
Date: Thu, 29 Nov 2018 12:14:01 -0800
Message-Id: <20181129201401.25972-1-tyu@cisco.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
X-Outbound-SMTP-Client: 171.68.248.120, sjc-ads-3167.cisco.com
X-Outbound-Node: alln-core-10.cisco.com
Subject: [PATCH] Add pidfile flag to store dockerd PID in /var/run/dockerd.pid
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
X-List-Received-Date: Thu, 29 Nov 2018 20:15:10 -0000
Content-Transfer-Encoding: 8bit

---
 recipes-containers/docker/files/docker.init | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/docker/files/docker.init b/recipes-containers/docker/files/docker.init
index 0aea8d0..b37ddc9 100644
--- a/recipes-containers/docker/files/docker.init
+++ b/recipes-containers/docker/files/docker.init
@@ -28,7 +28,7 @@ exec="/usr/bin/$prog"
 pidfile="/var/run/$prog.pid"
 lockfile="/var/lock/subsys/$prog"
 logfile="/var/log/$prog"
-other_args="--registry-mirror=http://localhost:5000 --insecure-registry=http://localhost:5000 --raw-logs"
+other_args="--pidfile $pidfile --registry-mirror=http://localhost:5000 --insecure-registry=http://localhost:5000 --raw-logs"
 
 [ -e /etc/sysconfig/$prog ] && . /etc/sysconfig/$prog
 
-- 
2.19.1


