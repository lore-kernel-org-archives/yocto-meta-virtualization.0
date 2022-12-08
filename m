Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69DC9C63705
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 09:12:14 +0000 (UTC)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web11.9151.1670490727483399501
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 08 Dec 2022 01:12:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=O0+3TYWi;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1670490728;
  x=1702026728;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=5su31kObSyGvGWLDqOBipXQMeVjXUBIWLDALIo5OlZk=;
  b=O0+3TYWiD+yKE8Y7F/gDTMfudqW+/hwQFGDx0XPMpxj7ZMwO10SW1PG1
   YLX2YpseLFQiY5TZ1cmIs5F8bpJ8z+p8skhDgpeGRqG5UAfGk6eylqEVM
   1b9aCGqkdS77Az0OeR2bnCLoB5slbCpI+8JAs3NzSTs40GHV3pOh4Pks0
   gI5phHNS9W1FSGNdfRvdaTyxDZ6xr/KY15uFDgvnJHWMtsO8w+CaDTuln
   v/S50mWVsuRpK+v1rTwLXpwAg0luX0uVX1NuvNzrpEC8a7EzsnVR5urG5
   9B7iqUi9gwY4fOHtmfOXYVXUV3SeU8Nqg4nO82wl51SY+Hq97+JqXcwUJ
   w==;
Message-ID: <df0edf4a-92f4-d3e5-df0d-38386eed4884@axis.com>
Date: Thu, 8 Dec 2022 10:12:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org>
 <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <75e9b925-a236-0809-49f1-f2f3cca0e263@axis.com>
 <CADkTA4PB0ntC1xpOnEgHK7eFiuyDEvvx9MpM=y=T2dBDd6s7Sw@mail.gmail.com>
 <dd323bc1-d1ac-ef32-7923-3b8f67fb19b5@axis.com>
 <CADkTA4M9jb3VyZA9j9_g7KvEy68doER3MiNybQE5i3t+VG5=tA@mail.gmail.com>
Content-Language: en-US
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <CADkTA4M9jb3VyZA9j9_g7KvEy68doER3MiNybQE5i3t+VG5=tA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail04w.axis.com (10.20.40.10) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 08 Dec 2022 09:12:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7750

On 2022-12-07 22:52, Bruce Ashfield wrote:
> 
> I can do the cherry picks once I get master-next -> master ... which
> is hopefully very soon.

Excellent, thanks a lot!

BR,

/Joakim


