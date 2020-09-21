Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.37594.1600677513110071584
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 01:38:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=mLthanHO;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=236; q=dns/txt; s=axis-central1;
  t=1600677514; x=1632213514;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=B38MagOqc5ego2SsbEdYh0Ud4kLDfppBZLcNLL389cs=;
  b=mLthanHO2I8fJj5V8BtEpxR3PnLGCDJn9mUlvj6/YQxAn4Xby/feFclC
   XvPQRECHwp7+OHYtj34o8pCgQxUlCK42CuYVeqcdySeq+ZqbiTAxuqYxW
   0KhMJu/qwni5ydHvYxTGBulyHrCfrPRxGDKh22EJZk5+OSsVQDFYd4jHi
   a7sJkXOWGHpjZYaRz+F4NwZ6Svy+RWfDR7wJiakGK081YSRbuBcYTI16n
   6vN6PuXsXa0T7xOnUhJBM1CVyQUHR6Wf29ZbdEVhePHl0enadkxXj1A50
   sGd7ziSt4BidJbgJCzu5EBjxdUQS7nzAkUFAWBj0Q383BJ4Pup4KrHRDl
   w==;
IronPort-SDR: GNCka6BABzt+dE+H73WAwQ8T9Ia2XA2wIz5DJqDqkORIsR5Z0j3k9xztZlNpZcmFYH15bN6/RY
 +Es4tF4cfzJVOOVNaetLxVEgjUpDSCgYzCSBERsL5qmufVUpNnrlB1StuYdEQepaF/H8i/nIn8
 anewMfTvmhpfg0ZMmXGzShft/g1GoHw8GpmBmdFUCJXmhh6gOiDKAF/RMvoLZOTcEpbj/Ulbjl
 KuTUf0f1LDjdMLLfyDE5Aitl0g//LUXjuwcalbRdtSBwnxvFL9KwWU978JJssycEEmdQQAKN31
 w1U=
X-IronPort-AV: E=Sophos;i="5.77,286,1596492000"; 
   d="scan'208";a="12705535"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
Date: Mon, 21 Sep 2020 10:38:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200821205529.29901-1-erik.jansson@axis.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX04.axis.com (10.0.5.18) To XBOX02.axis.com (10.0.5.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-08-21 22:55, Erik Jansson wrote:
> Signed-off-by: Erik Jansson <erik.jansson@axis.com>

Bruce, what is the current status of the k3s activities? (I know you
were busy with some other things last month.)


BR,

/Joakim

