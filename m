Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.41972.1600694118166239395
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Sep 2020 06:15:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=QC2Z1wdU;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=758; q=dns/txt; s=axis-central1;
  t=1600694119; x=1632230119;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=tiURjPzTboDydduLybJnehsTwNxGXph5NodxiiITwRE=;
  b=QC2Z1wdUbvvnkmbCI8m2rCOdfT3RJueYtkoQqlqFGXy02K6Zcb6lfOlp
   QXtBoKqmMpYiwdq2inh4lpAFjs2adBRq6Uxx6hbLnWwUjNTC2gJpGlMVA
   N9hq97be5e4oi3DiAzJQkVlAYGNo309wYNkrk5jTXk5eiEYYJGAA+IVmA
   ggmp4WYkckDq5PdAGI2yFmUqQDl51mvqCUsJDIEzVSh21ckYhkj49oJR3
   DB2STv/yb7ghTP9bOfGVVt5XkgX+ad1TZlRbtRA+P63YNVx+zWskV1A1U
   5GSQimhm20jrovFnBOk/8xwaQJmHGXt4Mv8jlF9vxMor1JzgXcdvY9hgy
   A==;
IronPort-SDR: AXQfHtewzqsoBm8yoTY4LYeZZm3dC8pYp+aSCibVV1+bNG/4bEfFdx/uVLuoboQhYrrRV43tKt
 EaE5WdsX/BZLZICCqxC0Lf3pLiAYs5AXWxMs30r2HY1Sk3IWyWVcfkL7yd0HEA3a2A1zJSe8Tf
 PqYPYMExmG13Khna+E4TAcStzi1MHZkENmtUDlCqYjgHkj4LxMLQGyhVOR3W34m/YHzNOQBoBc
 q0pvjxlXMGHHDpugyp1oYYxocUr2Lu2nPiOGBc/HMn9KbjkUN0ckXUXSK5O8J7Gx6lC50t8NRR
 CzY=
X-IronPort-AV: E=Sophos;i="5.77,286,1596492000"; 
   d="scan'208";a="12715591"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: <meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
Date: Mon, 21 Sep 2020 15:15:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX02.axis.com (10.0.5.16)
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 2020-09-21 13:11, Bruce Ashfield wrote:
> It is close. I had to abandon one approach, since it grew more
> complex than if I just let a chunk of functionality be duplicated.
> 
> I'm at this again this week

Excellent news!

> and if I can't sort it out, I'll merge the core recipes and start
> factoring in tree (I'm just worried about people assuming what
> appears in tree is the final version).

But with those words you have just informed eveybody on the list about
it, so that should make things clearer for the community!

BR,

/Joakim
-- 
Joakim Roubert
Senior Engineer

Axis Communications AB
Emdalavägen 14, SE-223 69 Lund, Sweden
Tel: +46 46 272 18 00, Tel (direct): +46 46 272 27 48
Fax: +46 46 13 61 30, www.axis.com

