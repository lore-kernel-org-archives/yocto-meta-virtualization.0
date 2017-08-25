Return-Path: <tiniuc.alexandru@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC583E00CAE; Fri, 25 Aug 2017 05:28:23 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (tiniuc.alexandru[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.82.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 030C6E00C1A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 05:28:22 -0700 (PDT)
Received: by mail-wm0-f67.google.com with SMTP id e67so2451628wmd.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 25 Aug 2017 05:28:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=zTQFMBnUXDFpCWpA56qQvTqrP90aHCaGWb7YITHcJlU=;
	b=WZFOj32IQDySOUDdXJzk2Kk15+8xj6BH/95tqqY4nOsRv5yXqlZ80QMIl9rxI4Qnyx
	PX5tm5dKkJf/7E1IUDeDFofAhrNblVbNbP9dIP2vRHIh9ioHK4vBS6uJIOz/QjesSw3b
	ev0tXQmYGbz/RB4OqcamE04xzRFyMAKCfcMPVEZIFZrK1pbPj95imbd4urVbPyLo4oNr
	+FwnsP01u73sjL3DDhjufk/rqnAs1BS7pKV16xWnK+IU+Fwi5M3uMp6lDBCWkXBROleV
	ZxhQQDfaHGAI8h63ru7dTJ0W3HZmMM0/Igb2K+m1e5V5RrC3jJzm+qPXjhdBYQYR90+y
	T5Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=zTQFMBnUXDFpCWpA56qQvTqrP90aHCaGWb7YITHcJlU=;
	b=ft1AWmjjInHW5K/QQ2F5MIytE//3pzS3KPp1fsUFO3+aeNLH08VCpK15ox79zprrMk
	LAjLZkyoLh2n3+MjDbMYJ8L2P3A2NpaO56m7TCK2YGibFvwxvYERDsT8hY4334FD3a/M
	Q83k4NvAKhnsUQbys8h39O37Ih9cXnGf+AWQNpHnXXFrIqCNVYvH16xij9fHRDgglKq7
	zAGViopiFFDFyw3TwtNHubFg0sBnVJgFBg2xSf9HnZnj5wdlVpZcgLQVFdkllgG3STCQ
	PQJRwbfgdFj0XnCowTEpowLHuJNGi5Wg/SEEIsxukVYqjL3qUClPTeRSWBLqjYvfwgO+
	RFJQ==
X-Gm-Message-State: AHYfb5gHxLigr1SIp+zezvJO2qK4HoMnqYtKkyHj76xHtv19hlpS2V8F
	qQbvL5JXPo0G60eGan4=
X-Received: by 10.28.71.219 with SMTP id m88mr1150412wmi.190.1503664101722;
	Fri, 25 Aug 2017 05:28:21 -0700 (PDT)
Received: from localhost.localdomain (boldrewood.soton.ac.uk. [152.78.0.15])
	by smtp.gmail.com with ESMTPSA id
	l131sm1864254wmb.5.2017.08.25.05.28.20
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 Aug 2017 05:28:21 -0700 (PDT)
From: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Fri, 25 Aug 2017 13:27:02 +0100
Message-Id: <1503664040-6908-2-git-send-email-tiniuc.alexandru@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1503664040-6908-1-git-send-email-tiniuc.alexandru@gmail.com>
References: <CADkTA4NW1JvB2uW6qbGRSwcNYS6WCFNKazvwwN5URTSOG22iUw@mail.gmail.com>
	<1503664040-6908-1-git-send-email-tiniuc.alexandru@gmail.com>
Subject: [PATCH v2 2/2] Added README file
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
X-List-Received-Date: Fri, 25 Aug 2017 12:28:23 -0000

Signed-off-by: Alexandru Tiniuc <tiniuc.alexandru@gmail.com>
---
 recipes-containers/singularity/README | 46 +++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 recipes-containers/singularity/README

diff --git a/recipes-containers/singularity/README b/recipes-containers/singularity/README
new file mode 100644
index 0000000..582480f
--- /dev/null
+++ b/recipes-containers/singularity/README
@@ -0,0 +1,46 @@
+Singularity is a container platform based on the principle of mobility of 
+compute, and it is designed for use within HPC clusters. For more info see
+singularity.lbl.gov.  
+
+To test whether the software functions correctly, you can use `singularity
+selftest`. This is what you would expect to see:
+
+~# singularity selftest
+ + sh -c test -f /etc/singularity/singularity.conf                                     (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/action-suid                                    (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/create-suid                                    (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/expand-suid                                    (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/export-suid                                    (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/import-suid                                    (retval=0) OK
+ + test -u /usr/libexec/singularity/bin/mount-suid                                     (retval=0) OK
+
+You can also pull a container from Docker Hub to prove full functionality
+(Test was performed on a Raspberry Pi 3, hence the arm32v7 part of the Docker
+link. Make sure you pull an image which is compatible with your hardware.) 
+For instance:
+
+~# singularity pull docker://arm32v7/debian:latest
+Initializing Singularity image subsystem
+Opening image file: debian-latest.img
+Creating 200MiB image
+Binding image to loop
+Creating file system within image
+Image is done: debian-latest.img
+Docker image path: index.docker.io/arm32v7/debian:latest
+Cache folder set to /home/root/.singularity/docker
+[1/1] |===================================| 100.0% 
+Importing: base Singularity environment
+Importing: /home/root/.singularity/docker/sha256:ed4f1f0d0a0457e7f76ffb25a8d6a193007709dd312b7647cb44fc6979ec4a53.tar.gz
+Importing: /home/root/.singularity/metadata/sha256:89997b2c16b29c5a3a316e314172ef21b36f67cc3200b1c4d95927f716dbee83.tar.gz
+Done. Container is at: debian-latest.img
+~# singularity shell debian-latest.img 
+Singularity: Invoking an interactive shell within container...
+
+Singularity debian-latest.img:~> echo "Hello from within the container!"
+Hello from within the container!
+Singularity debian-latest.img:~> ls /
+bin   dev  home  lost+found  mnt  proc	run   singularity  sys	usr
+boot  etc  lib	 media	     opt  root	sbin  srv	   tmp	var
+Singularity debian-latest.img:~> exit
+exit
+~# 
-- 
2.1.4


