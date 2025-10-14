Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9930BCCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 18:09:18 +0000 (UTC)
Received: from alln-iport-3.cisco.com (alln-iport-3.cisco.com [173.37.142.90])
 by mx.groups.io with SMTP id smtpd.web11.3100.1760465354410649350
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Oct 2025 11:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=OYdeh/XI;
 spf=pass (domain: cisco.com, ip: 173.37.142.90, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=6; q=dns/txt; s=iport01;
  t=1760465354; x=1761674954;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=7zPquDCtZyzOA5PY0kmGl8Aq5WV/QI7GoaYVVezsWQc=;
  b=OYdeh/XIrc4TEfaUcsdNEZ1O8D3dQBcF35j9Uu0KiZDmLSCbOi7fJF+M
   gb9IAELVocGiAoSAAxcba98vYgtQBSJHggltHm+FZB04c9h5Ki1zo7XyO
   D61CtzDpd9PttxrCNn8m+eeffPTNbp1CG4CbdgWWnu13aorK5DHHWmg/V
   Fk0uDBmQAaqEv/GwiRrhltqxr18dD3XLDOJNSwO+ukVWB+dsOz0ZL6YZt
   IPLSDBBnZm/q1F1CuXXqg4ZQIbX7Lt9pPSuKtjkCmWkvUwiAxvSBTFGmT
   ZmkrObEySoNzSHc7PCE+ED7o2bMIUoIz700ct4uEsCl12OG88qyztfwWe
   A==;
X-CSE-ConnectionGUID: JH5mJr8ERwKN1+fVXcKkzw==
X-CSE-MsgGUID: VMNZorCiSEivgmKeqILbxg==
X-IPAS-Result: =?us-ascii?q?A0COAACtkO5o/4r/Ja1aHQEBAQEJARIBBQUBgX4GAQsBg?=
 =?us-ascii?q?kaBWUKUb6A+gX8PAQEBD1EEAQGFBwKMSwImNgcOAQIEAQEBAQMCAwEBAQEBA?=
 =?us-ascii?q?QEBAQEBCwEBBQEBAQIBBwWBDhOGXIZbAgEDMgFWC0YrK4MbgnQCAbAkgiyBA?=
 =?us-ascii?q?YR82yqBSgGNTW8BhHgnGxuBcoQ/PoEFhAuFVSIEgiKBDh2GF5BVSAqBFANZL?=
 =?us-ascii?q?AFVEw0KCwcFgSBDAzUMCyoVI0sFLR2BJyIhHhNgVIQJGwZoDwaBExlJAgICB?=
 =?us-ascii?q?QJCOoFpIgYfEgIDAQICOho9DYF3AgIEgi6BEoIqD4UnAwsYDUgRLDcUGwY+b?=
 =?us-ascii?q?ge+TaEOCiiDdKFXGjODcQGmeQuYe6RYhGmBbgE1gVlwFYMjURkPjjgnwXMjg?=
 =?us-ascii?q?QoJk2cBAQ?=
IronPort-Data: A9a23:/T4nHKsXE8jNKesg562uAv9MmufnVAVfMUV32f8akzHdYApBsoF/q
 tZmKT2BOfuIY2f9LdEgPI2/9ktQvsWAz4BlTgJl+ClmQypBgMeUXt7xwmUckM+xwmwvaGo9s
 q3yv/GZdJhcokf0/0nrav666yEgiclkf5KkYMbcICd9WAR4fykojBNnioYRj5Vh6TSDK1vlV
 eja/YuGaTdJ5xYuajhJsvra9Es11BjPkGpwUmIWNKgjUGD2zxH5PLpHTYmtIn3xRJVjH+LSb
 47r0LGj82rFyAwmA9Wjn6yTWhVirmn6ZFXmZtJ+AsBOszAazsAA+v9T2Mk0NS+7vw60c+VZk
 72hg3AfpTABZcUgkMxFO/VR/roX0aduoNcrKlDn2SCfItGvn3bEm51T4E8K0YIw2MYqBENUp
 dEiNxMrN1ONudK947GpVbw57igjBJGD0II3oHpsy3TdSP0hW52GG/yM7t5D1zB2jcdLdRrcT
 5NGMnw0M1KaPkAJYwxHYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUoLSHZwEzxnF+
 woq+UzHJzcoM8a0yAGo82yjg8zChALfUpIdQejQGvlCxQf7KnYoIBgbSVL+v/ijllO3X9NNI
 lAV/SwGqakp6FftX972QxqgunmGsxUAHd1KHIUHBBql0KHY5UOdQ2MDVDMEMIVgv84tTjts3
 ViM9z/0OQFSXHSuYSr13t+pQfmaYED58Udqifc4cDY4
IronPort-HdrOrdr: A9a23:hVltHa5AjFF5XkQgEwPXwMnXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5gPW
 MKSdkZNDU2ZmIK6vrH3A==
X-Talos-CUID: =?us-ascii?q?9a23=3A6d/c4GiHFpDQlAXjetSDM1QMMjJuUF2AyVXKc2K?=
 =?us-ascii?q?CFkVPEf6bd2+b26B2jJ87?=
X-Talos-MUID: =?us-ascii?q?9a23=3A5egpVg1pQnc4wXcLmxtvIUaArTUj3YGIOkcXupQ?=
 =?us-ascii?q?9lsiaOilTNi68qD6nTdpy?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.19,228,1754956800"; 
   d="scan'208,209";a="600199755"
Received: from rcdn-l-core-01.cisco.com ([173.37.255.138])
  by alln-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 14 Oct 2025 18:09:13 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-01.cisco.com (Postfix) with ESMTPS id 8BEE4180001DB
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 18:09:13 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 30F58CE1C40; Tue, 14 Oct 2025 11:09:13 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [scarthgap] [PATCH v4] docker-moby 25.0.3: fix CVE-2024-36623
Date: Tue, 14 Oct 2025 11:09:11 -0700
Message-Id: <20251014180911.807508-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20250924175611.3927714-1-sudumbha@cisco.com>
References: <20250924175611.3927714-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: rcdn-l-core-01.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 18:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9418

ping

