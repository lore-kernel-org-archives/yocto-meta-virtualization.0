Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-ee0-f48.google.com (mail-ee0-f48.google.com [74.125.83.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A0F11E006C0
	for <meta-virtualization@yoctoproject.org>;
	Thu,  6 Dec 2012 09:06:49 -0800 (PST)
Received: by mail-ee0-f48.google.com with SMTP id b57so4182794eek.35
	for <meta-virtualization@yoctoproject.org>;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	bh=5T8dPCbVFqp332DkVjzSlE5EorDNVECyeZeyqysoWFQ=;
	b=Kc0bIUn40/IcYgBe0YuFTVtjBSeweaGpWuUJcqlUD2tzFu144sYcHf8h+xxZxefTyT
	92ALXmSY0nHrJW8YYKkqOBusrwf9W/jlC/lOY7OUNs1/HVYQyUGO12tWmAAuVkvZBjXt
	5HGfULQqeGGT00PRqCKz0YhTWOeXSfLu6OiRYkeqVo9eMk6dNGw/xhIVjuRs3qYgdsWf
	XSl5mUIW1FvqGMKWvA/2cdgiS6eaOqXkdZZo2F8xa1nowfMj097m/3yvtcZRZ8Fr+Yj0
	FMPI708g2I3c4xFiaW49KzX2Cl8VlKg9nMc4MVan2ncvjZIoYR0Fe/nLsAvDB9EsPHjS
	ICzw==
Received: by 10.14.194.4 with SMTP id l4mr7413879een.42.1354813608831;
	Thu, 06 Dec 2012 09:06:48 -0800 (PST)
Received: from nysan (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id w3sm16963422eel.17.2012.12.06.09.06.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 06 Dec 2012 09:06:47 -0800 (PST)
Received: by nysan (Postfix, from userid 1000)
	id 42602400DF7; Thu,  6 Dec 2012 18:06:40 +0100 (CET)
From: david.c.nystrom@gmail.com
To: meta-virtualization@yoctoproject.org
Date: Thu,  6 Dec 2012 18:06:30 +0100
Message-Id: <1354813596-8233-10-git-send-email-david.nystrom@enea.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
References: <1354813596-8233-1-git-send-email-david.nystrom@enea.com>
MIME-Version: 1.0
Subject: =?UTF-8?B?W1BBVENIdjQgMDkvMTVdIENoYW5nZWQgRGF2aWQgTnlzdHLDtm1zIGVtYWlsIGluIFJFQURNRQ==?=
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
X-List-Received-Date: Thu, 06 Dec 2012 17:06:50 -0000
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


