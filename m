Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f49.google.com (mail-ee0-f49.google.com [74.125.83.49])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 32A09E01482
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:49 -0800 (PST)
Received: by mail-ee0-f49.google.com with SMTP id d4so3326194eek.36
	for <meta-virtualization@yoctoproject.org>;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=NFh3NhqyShohR6jPkKxs2rCdfQrHmPTqF0JHW7/V2/w=;
	b=XlHoTiLdACspTnWFCQ7tcUc6rCUXohNQtTUbFqp4wRvCbPQSNf8QhPbA3SeL7qOmPx
	UWoOEsLTOAoshswtK/6Fs06lx8geBQJNOeK726kxJGwhKtzHGYE3j9uruKEZNsYZZNLj
	oqN7H25lwEvq+B4CR2dazhd6Jhik6Yr0ATBwSs11VxnnZZZHofrY8pkAx/xRqdNKCbZQ
	GZiv64aOeioOJWeXxQQtAiNvRi9ZKVteYGph1TnhkeJl0iUAo30imMYZyj0SKXD7/oZl
	2dViA5qplpYVYoHzzXkDsfOYl80sq46yRUDLxRdnqDwPA+W1ZmoDYE74vjC7+zFIRJCL
	58FQ==
X-Received: by 10.14.213.134 with SMTP id a6mr72537564eep.45.1358858867690;
	Tue, 22 Jan 2013 04:47:47 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id q5sm11912069eeo.17.2013.01.22.04.47.46
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Jan 2013 04:47:46 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id E39AD400DEF; Tue, 22 Jan 2013 13:47:31 +0100 (CET)
From: "=?UTF-8?q?David=20Nystr=C3=B6m?=" <david.c.nystrom@gmail.com>
To: meta-virtualization@yoctoproject.org
Date: Tue, 22 Jan 2013 13:47:20 +0100
Message-Id: <1358858841-13339-6-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
References: <1358858841-13339-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: [PATCH 5/6] Moved bbappend to match updated master branch in oe-core
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
X-List-Received-Date: Tue, 22 Jan 2013 12:47:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: David Nyström <david.nystrom@enea.com>
---
 ..._1.4.15.bbappend => iptables_1.4.16.3.bbappend} |    0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-extended/iptables/{iptables_1.4.15.bbappend => iptables_1.4.16.3.bbappend} (100%)

diff --git a/recipes-extended/iptables/iptables_1.4.15.bbappend b/recipes-extended/iptables/iptables_1.4.16.3.bbappend
similarity index 100%
rename from recipes-extended/iptables/iptables_1.4.15.bbappend
rename to recipes-extended/iptables/iptables_1.4.16.3.bbappend
-- 
1.7.9.5


