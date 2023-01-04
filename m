Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 708C1C4332F
	for <webhook@archiver.kernel.org>; Wed,  4 Jan 2023 07:44:50 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.6995.1672818286335752434
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 03 Jan 2023 23:44:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=Uv4I8iQY;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1672818286;
  x=1704354286;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=95S0UiYIRGJlvc7/N/LsDcrE5bVXDiKdriBFbSaXH5M=;
  b=Uv4I8iQYOnHOUjNibQweKspblJfFmE4Vy4zIYM/qNK6W8sYbFNQmJ5Sy
   Cr6Ebbkd3ogshqgqlUtsU9xPv/bzxpQIv+1kNvCxxeW0teLU3R1/GeUbd
   JGyPgrRTxx8bjDYriLPBxIkL/tfaK0mc/BjzJVvgrqwQl5Nx5xNp76nDN
   8cFBq+YX7Z/ey2b0aGGPVYQvIFHMj2fZWn0R/PIbXjV6RuONOnVs6UqpM
   y20+17PHLsE2L/3x63/PMKW2lEWXyk5XwfUVEJWbqq+B+CGkofmjAcTQM
   P/qnTPPVbgCSyUjNvLkVsJvOi40iHfEcMOFji2z0THRQAb+fF1sWGmJUr
   A==;
Message-ID: <746b36a0-3a58-7afd-2e36-374eefb5d05b@axis.com>
Date: Wed, 4 Jan 2023 08:44:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [meta-virtualization] Using Docker containers on Yocto with
 RISC-V architecture #meta-virtualization #yocto
To: <meta-virtualization@lists.yoctoproject.org>
References: <18637.1672450270968941245@lists.yoctoproject.org>
 <18637.1672451402981246871@lists.yoctoproject.org>
Content-Language: en-US
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <18637.1672451402981246871@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 04 Jan 2023 07:44:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7788

On 2022-12-31 02:50, jmoreno@tierralunaengineering.com wrote:
>
> I include some screenshots of the error.

To me, it seems like you need to add some additional kernel 
configurations for your build, enabling e.g. overlayfs support in your 
kernel.

BR,

/Joakim


