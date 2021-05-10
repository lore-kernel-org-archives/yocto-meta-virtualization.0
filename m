Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.219.1620665988126959871
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 May 2021 09:59:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=jYNPGn/r;
 spf=fail (domain: axis.com, ip: 198.145.29.25, mailfrom: joakim.roubert@axis.com)
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.yoctoproject.org (Postfix) with ESMTPS id CD2A238C1198
	for <meta-virtualization@yoctoproject.org>; Mon, 10 May 2021 16:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1620665987;
  x=1652201987;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=+MZiaexJvNsrv8SuW76fPHaiA2no5UvpyjT61U6D9Gc=;
  b=jYNPGn/rCcf+3y2rATqFL0vhmYO+le75/pufnRL0uX2tb5JfBYHwDXer
   dhCPRCuFVtw2zT9aiEVoPp68dvbfLG7cy5KGNbVPw2tHJEzHtGpPvUWha
   PmVo3clhv9jxiVvonboLRKYXzEee5DuZjoMHQ5jr8+1k1mUsx1gmCYTPi
   Z/V4OlUyOhUdfZqweT5l1sixFGfq2SVdFG4x82yPjp3ro5LcqQ+6OLlUM
   fRNoizWLqXs93zKk18TMj7bD5XeqxZrUQTAQvUwogoj09d+DxVJgqbk0g
   HP2dBHQ68uXiF0iRhVSJiOOXTfTVZTml6Lj/wgpsqdGqIYmkvOE/usXvC
   g==;
Subject: Re: [meta-virtualization] nerdctl
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
References: <d972d7f9cf36463185b2811362a7df11@XBOX03.axis.com>
 <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <5bf45976-11c1-1184-f51b-e886c8aa301e@axis.com>
Date: Mon, 10 May 2021 18:59:44 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4M0=xJ8Kt0k6ZHdT7Vy4CPQkZNsFHvCHMR=-4KM9hfcgQ@mail.gmail.com>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2021-05-10 14:10, Bruce Ashfield wrote:
> 
> I'm actually already working on it, and have been for about a month.

Awesome!!

> There's a few build issues remaining, but I expect to have it done in
> the not to distant future.

Great news, makes me think of that old movie title "Bruce Almighty".
Kudos!

BR,

/J
