Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30170C87FCB
	for <webhook@archiver.kernel.org>; Mon,  4 Aug 2025 12:54:55 +0000 (UTC)
Received: from aer-iport-8.cisco.com (aer-iport-8.cisco.com [173.38.203.70])
 by mx.groups.io with SMTP id smtpd.web11.16982.1754312087407903569
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 04 Aug 2025 05:54:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DtBB6aSg;
 spf=pass (domain: cisco.com, ip: 173.38.203.70, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=438; q=dns/txt;
  s=iport01; t=1754312087; x=1755521687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=YaE9gFDrhGkpnwtGqJDe0tyTDzZMR6KyPRPXnrqiV0c=;
  b=DtBB6aSgj1ARKW+WZBQNW/xK5TNXoIQpZkUALEARGRJ/iH3rSLNt9jft
   TFzZtnLf1ctLSy0NCVcsZFtfFg/Dzy/wlDWCOGHJZWnAh8GwlZTRyY56G
   fCiF/OAikcYP9J1Y+4pX+aAheeaD5ObZE2J9T2w7Is1qaDTr+3tIa6rSg
   wdiupFGUcMKpDUybsZUvSjFMJj27lZg4EJ3c1sg89G8iEQQZXu3DCKpvK
   PyEeeresIgBfeybWujRKlg+y+Dqj/MwGZYEYmu6LBdw1GVDRsX6KEeZj2
   I5AU7sZmUwXcXtSGx8XNArGfqYvRqyxoTYXy8NIcb6aLOEbXbRZtehl5k
   Q==;
X-CSE-ConnectionGUID: XrM1TZdNRzGTOXgBWCijQg==
X-CSE-MsgGUID: uuNKOE+FRn+92IQuVxtqgg==
X-IPAS-Result: =?us-ascii?q?A0CyAAA7rZBo/8tK/pBRCRsBAQEBAQEBAQUBAQESAQEBA?=
 =?us-ascii?q?wMBAQGCAQQBAQELAYJKeVpCSQMFAZY/nhoUgWsPAQEBD0QNBAEBhQcCjBkCJ?=
 =?us-ascii?q?jYHDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThXsNhlsCA?=
 =?us-ascii?q?QMyAUYQCxUxKyuDGwGCbgIBEQauBoIsgQGDbEFP2yMGgUkBjU1vAYR3Jxsbg?=
 =?us-ascii?q?XKEPz6BBYFcBIEpAQgKAW6FVSIEgiJEUoNjhFaIL4hwSAqBFANZLAFVEw0KC?=
 =?us-ascii?q?wcFgSBDAzUMCy4VI0sFLR2BJ32EG4QoK0+CInWBeVqEEh4GbQ8GgRUaHi0CA?=
 =?us-ascii?q?gIFAkNFgWAZBhpAAwsYDUgRLDcUGwY+bgeSX4QJVwKBaymmDKEOCiiDdIwel?=
 =?us-ascii?q?TkaM4NxpnoLmHuOCJZQhGmBbwMyaXBwFYMjURkPjjgniFW2LyM1Ag4sAgcLA?=
 =?us-ascii?q?QEDCZMdAQE?=
IronPort-Data: A9a23:sxBJjKqqoaYEOff4aayT4jrHuGZeBmJOZBIvgKrLsJaIsI4StFCzt
 garIBnSbqzea2ahet52a4rk8k0EvMLWyNBnSAVl+SszEXgS8+PIVI+TRqvS04x+DSFioGZPt
 Zh2hgzodZhsJpPkjk7zdOCn9z8ljPvgqoPUUIbsIjp2SRJvVBAvgBdin/9RqoNziLBVOSvV0
 T/Ji5OZYQDNNwJcaDpOtvrT8Eo35pwehRtB1rAATaET1LPhvyF94KI3fcmZM3b+S49IKe+2L
 86r5K255G7Q4yA2AdqjlLvhGmVSKlIFFVHT4pb+c/HKbilq/kTe4I5iXBYvQRs/ZwGyojxE4
 I4lWapc5useFvakdOw1C3G0GszlVEFM0OevzXOX6aR/w6BaGpfh660GMa04AWEX0tZtJDhyx
 /A+EiIiUjeziMiJ67O5c+Y506zPLOGzVG8eknht13TdSP0hW52GG/+M7t5D1zB2jcdLdRrcT
 5NFNXw1MUiGPEEJYA9MYH49tL/Aan3XaCBUtVefpaMf6GnIxws327/oWDbQUobVHJQFxR3Gz
 o7A13nkJDI9GZ+x8zzGoyiNv/LxjT/iV41HQdVU8dYv2jV/3Fc7DRAKXB6loOOll0e6WsBWN
 00T/AIqrLMu7wq6SdLhWAWip3yJtQJaXMBfe9DW8ymEx7CR50OSAXIJC2YbLtcnr8QxAzct0
 zdlgu/UONCmi5XNIVr1y1tehWna1fQ9RYPaWRI5cA==
IronPort-HdrOrdr: A9a23:M5c7kaMMQkO/scBcTsajsMiBIKoaSvp037Dk7S9MoHtuA6ulfq
 +V/cjzuSWYtN9VYgBDpTniAtjlfZq/z/5ICOAqVN/INjUO+lHYSb2KhrGN/9SPIUHDH5ZmpM
 Rdm2wUMqyIMbC85vyKhjWFLw==
X-Talos-CUID: 9a23:oamYcm1A9WyOb6XZQC026bxfKtoAK0HvwFHqMWCELlZmYoK+SF2p9/Yx
X-Talos-MUID: 9a23:/hI4RQUS/fwSdY3q/CLxohJFGYRG2aLtWRosqIg4q9WdOiMlbg==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.17,258,1747699200"; 
   d="scan'208";a="27198336"
Received: from aer-l-core-02.cisco.com ([144.254.74.203])
  by aer-iport-8.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Aug 2025 12:54:45 +0000
Received: from sjc-ads-12007.cisco.com (sjc-ads-12007.cisco.com [171.70.97.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by aer-l-core-02.cisco.com (Postfix) with ESMTPS id D8E9018000164;
	Mon,  4 Aug 2025 12:54:44 +0000 (GMT)
Received: by sjc-ads-12007.cisco.com (Postfix, from userid 1840713)
	id 6014CCCD994; Mon,  4 Aug 2025 05:54:43 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: vchavda@cisco.com,
	deeratho@cisco.com
Subject: Re: [meta-virtualization] [scarthgap] [PATCH] docker-moby 25.0.3: fix CVE-2024-36623
Date: Mon,  4 Aug 2025 05:54:27 -0700
Message-ID: <20250804125442.317323-1-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.1
In-Reply-To: <20250731213229.3438094-1-sudumbha@cisco.com>
References: <20250731213229.3438094-1-sudumbha@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 171.70.97.7, sjc-ads-12007.cisco.com
X-Outbound-Node: aer-l-core-02.cisco.com
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 04 Aug 2025 12:54:55 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9342

Thank you for the reference. I have reviewed the guidelines at
https://docs.yoctoproject.org/dev/contributor-guide/submit-changes.html#fixing-your-from-identity
and updated the sendemail.from field as recommended.

However, the "From:" header was not visible in the previous message, as it was dropped by the 
organization's email client.

Now resending the patch after properly configuring the field.

Thanks & Regards,
Sudhir

