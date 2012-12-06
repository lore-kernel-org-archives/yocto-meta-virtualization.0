Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 151F8E01462
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 05:13:54 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4008290eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=Y5/RvvvdTgssrhzqUUhsRtJvYqFSMJQmgEzQXINxxpE=;
	b=E55MMIbCDd78p7+v5jHv9torqoYgirey5taNQNgN4pzJeyzesKXBfoCVIF5tejjxU4
	llX2+Mrta8CV/Tm3VS6QJnge2f7D3h6ftN8wQ/j3yvprgqfhac4ECUseGKZI6Y6Midq2
	9jiTRn8pJA8hRFx4/HLQJzUf46FTzhLlqIUs+2wUgeBoIlerYaqdMNgC/dywYp3iWh8T
	kdZjaKXgEuHQr5drbp6BJtJMSSvV+LCefotSyijj3udChVbY9lLywh1W62jx6b0Ar3xt
	QVdC9Ii6Ny6/dN3KDP1M2YleWzEqUhSiKhSlybgWebU5kW91TvkHnIPd6TAPwO7FYure
	yHwQ==
Received: by 10.14.178.196 with SMTP id f44mr5761290eem.14.1354799634795;
	Thu, 06 Dec 2012 05:13:54 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id 44sm15879833eek.0.2012.12.06.05.13.53
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 05:13:53 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 65776400DC1; Thu,  6 Dec 2012 14:13:49 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 14:13:40 +0100
Message-Id: <1354799626-6911-10-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
References: <1354799626-6911-1-git-send-email-david.nystrom@enea.com>
Subject: [PATCH 09/14] Added .gitignore file
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
X-List-Received-Date: Thu, 06 Dec 2012 13:13:55 -0000

---
 .gitignore |    6 ++++++
 1 file changed, 6 insertions(+)
 create mode 100644 .gitignore

diff --git a/.gitignore b/.gitignore
new file mode 100644
index 0000000..65feb82
--- /dev/null
+++ b/.gitignore
@@ -0,0 +1,6 @@
+build*/
+pyshtables.py
+*.swp
+*.orig
+*.rej
+*~
-- 
1.7.9.5


