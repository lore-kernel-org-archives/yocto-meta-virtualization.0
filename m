Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DBBCC55174
	for <webhook@archiver.kernel.org>; Wed,  5 Aug 2026 22:02:01 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6944.1785967313103518621
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Aug 2026 15:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=HPNAv65U;
 spf=pass (domain: gmail.com, ip: 209.85.219.50, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-9034b6b7674so10283256d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 15:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785967312; x=1786572112; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mbzsi9o3ulG4DjPUJbAli6fMV0zBezQo4LH+14nsNo8=;
        b=HPNAv65UwcD1gsKx+67JGj1o+Q87Y+91RCRnngx1Ux2bQCe2n4uI6eoOkbk7RcD7bL
         XCdTmjcfQWtecI9ePfhwShD80MPPVduQsXCigSOjuUIf0fc80+lsHzOFb3fAhDsNN/dd
         W0Sy6PX4LdtEWWnv788cg3zlYEzoDBlEPuLAy6H0hmjeXK8IFG7S+WvDN06eRn2tpCbZ
         8CO6MWqBCHoJmv4TZa2kQKJPZe4Og3PkDOyTVBtU1DwQhR/+1T1OI+Yc33oaLp9PPExN
         PmGM3QHOJd3+QqcGipW1LfCEm2MMk7SKzkBEkkVlnE/aCpqNlJuSfoHdrPkWth2ymH9q
         HAeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785967312; x=1786572112;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mbzsi9o3ulG4DjPUJbAli6fMV0zBezQo4LH+14nsNo8=;
        b=PCIKW9xz8T+yJVAv/w2Te7WMr/LI3vSz2R8xbcBXQb0678pGx1CVwlY21xtqSwPxsv
         3blIy0AdOLrMO5a/Irce+1JYDNTE4jOJ7mMNuxuOa1kmFZkeJ3ZBOGUvUT+qIKsr+1/e
         5p9ZoeZNstUp5HcxSuR3PIg/e9NR+xzky3QcVYPYfGAqwX5P5JpBl3JjWUAPZicBh9E5
         zTna0P8huFiUb88o3NOE4yHTMo/DGMORVnwZ8D8ilIPIecUGWhKrbqhMJ7Rofdkfy9Kg
         idcpuR/+i5F8k1ydCFZsg350GUfRCgVe5LMfgjuh1wySS6aBdYkLWo1DAyB4IFhadEBa
         wK5Q==
X-Gm-Message-State: AOJu0YxHnNU+xHlVlp6AOLdVWbjj1SUOdNf+AuuOsnMDaIun2WJcSEQO
	aDD0Z2j0Q3hml2GLb/drq0K5Sf8NXzTKPCl4FayHEqLafsHWJrGgH2Ovw4ul5QjL
X-Gm-Gg: AR+sD12pDPzpkTSeqT7n330vQ1RmYbrCPyb2iA5iA+ulgX7l3q7zUZ2FBJ0KdmqFwpB
	uvJu7iJ3GPTnxDhI/cW1Q7p1rpZfHvQG6AAZxCPp+6DC5D7+z1Kzrvi5Z1wpAdurKxy2WtLF9k9
	XN9Irxq7ppQ3weLOIv2wdysnHh6Oo/0sEPJOMn5gcer3XnwuWiD+1Cz8y+xDiA6rXV7yRRsK5TR
	jUwZuSx6QPJFXr509VLIU2fMbjyULQsb8tOeAlBXf42AnMFA4FAgiXZn8xnTSlznpjhX9ed93eW
	achvOLMOjCfmrNvruA5AuYe7j24Kq2rwux6PRfwB3b6EgTtUv3UBiPnR0tpbs2XYkwxvN1+jgGr
	qJOVqjE/iAwzR0yPCtrS4rSomSrc42Ceon8A99QQaQwLUoc5vLP1xm5fhC06EKhvNljP4IVgla6
	Mq1uGfA/BEkY63bZrvN2vZCEaiAb56QSrTm/GTe+3x4s/M87UlA4HAR/mcEd/pSkuTh9C4VkV7U
	zufdjyf/nKxNVSdc1dJhRSTpE83uOsjFjFwjIJ7C24TCp9fRDI+WUsLEnE2JJv8zo+4BRQ1s9sA
	aHIqs5lsotQXZslqFw1Nx36bg9sEFZ6NcjfFcIBblPp6MhlxqlFUwHIpwkZRCLum1vRqkDNB
X-Received: by 2002:a0c:f40d:0:b0:8ef:b23a:d741 with SMTP id 6a1803df08f44-9088137d90cmr131745236d6.28.1785967311974;
        Wed, 05 Aug 2026 15:01:51 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9087ffe0f93sm35711256d6.21.2026.08.05.15.01.51
        for <meta-virtualization@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 15:01:51 -0700 (PDT)
Message-ID: <6a73b2cf.4aa243c6.39d80e.52d7@mx.google.com>
Date: Wed, 05 Aug 2026 15:01:51 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: 
 Re: [meta-virtualization] [PATCH v2 5/5] docs: add container-yocto-builder.md
In-Reply-To: <20260730134126.1550803-2-tim.orling@konsulko.com>
References: <20260727000247.1623785-11-tim.orling@konsulko.com>
 <20260730134126.1550803-2-tim.orling@konsulko.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 05 Aug 2026 22:02:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10026

merged, but with a small tweak on my side.

v1 5/5 was already on master (efff29e4 "docs: add
container-yocto-builder.md"), so v2 5/5 as a new-file patch would
refuse to git am. I pulled out the one-line delta ("in order to
satisfy the dependencies in packagegroup-yocto-builder-extras")
and applied it as its own commit with your SoB preserved. Same
content result.

Bruce

