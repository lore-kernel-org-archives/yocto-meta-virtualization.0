Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1716E0146A
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 06:03:55 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4044022eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=5T8dPCbVFqp332DkVjzSlE5EorDNVECyeZeyqysoWFQ=;
	b=OYEVRx0OqqfLDJEqaV1p032rJWAudnClfEior3db/0PjlRi7+mpuYOZw/9gzveNrcs
	AhDsWvDIknjR0RhU1RaHYgX3WFjNR22NayoSCdikQSakoG4zI85p9Tq98IyxzbqKwE0P
	tfBYVFdo0goXb4dWR8K3M9GtD2E89X4o5yz6LHCJIEs9uByTbxcwjiJMrW//QyP/FRSe
	7KRe+ADKwjWl8xFrbDDEwtu3RcIGUsZkTS7WK60FfVsHAwjxvMeC6c7KUXKz3/S1dnOH
	aa3elBu3jk6WbuWI1mHlubwJMTMwXPjq7uCw0RkQZ5lUPShrsE6xQhVpFb6gQvVo8lm3
	7Ong==
Received: by 10.14.173.65 with SMTP id u41mr6153773eel.13.1354802635428;
	Thu, 06 Dec 2012 06:03:55 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id b2sm16085613eep.9.2012.12.06.06.03.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 06:03:54 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id B439D400DF7; Thu,  6 Dec 2012 15:03:48 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 15:03:17 +0100
Message-Id: <1354802601-10840-11-git-send-email-david.c.nystrom@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
References: <1354802601-10840-1-git-send-email-david.c.nystrom@gmail.com>
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIdjMgMTAvMTRdIENoYW5nZWQgRGF2aWQgTnlzdHLDtm1zIGVtYWlsIGluIFJFQURNRQ==?=
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
X-List-Received-Date: Thu, 06 Dec 2012 14:03:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: David Nyström <david.nystrom@enea.com>

---
 README |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/README b/README
index 1ab6411..0ee4047 100644
--- a/README
+++ b/README
@@ -26,7 +26,7 @@ Maintenance
 Send pull requests, patches, comments or questions to meta-virtualization@yoctoproject.org
 
 Maintainers: Raymond Danks <ray.danks@se-eng.com>
-             David Nyström <david.c.nystrom@gmail.com>
+             David Nyström <david.nystrom@enea.com>
              Bruce Ashfield <bruce.ashfield@gmail.com>
 
 When sending single patches, please using something like:
-- 
1.7.9.5


