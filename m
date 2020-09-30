Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web12.10621.1601453580530429331
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 30 Sep 2020 01:13:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=jEtTb64f;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=1515; q=dns/txt; s=axis-central1;
  t=1601453581; x=1632989581;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=RNTfOKNWuw45YfswpKS6O1n6BWzexi1shgIWKCto6e0=;
  b=jEtTb64f4ttTWoFRWWpB/m5qSLg031jKVsq3Y1TSWy9J5g0ejEj4kTs4
   1eF4SAW0FE4pEeeBsyzj4aTH/caI2aOfJDKcmIjO8HJP9mjWa1nNB98jC
   lU7Mxz91yr1r79henIbEFUU2MbWB1QuMEOw2e/OfeULyEPVw+ZC1YHPPV
   G3cQw74WBzS8oG0XiofKkNjDiNA+kuAi4LSTcq8sXacmjKj6I++n1/w+g
   V5UIg0WL4eWarSTuOka4D/9esGDRtcI/0xQWqjunK31jDJyLXBvgHFFro
   e4ZX48JRKPqS09SxTbmf9YCDKhogggRm5R7VUc4eW5vFbqBhuPskVuMeP
   w==;
IronPort-SDR: o2lBWz1p7eCeZJ1TWuj3iAqXExRR8EHOLSASEhJpb/ZfJgujjEuzE0+bCSBXflYEWVxiEQRC8E
 dpbT8VU2KDpO31D5Sk6QeNctAGbxX9jypcngh8PATBpkQUmS760KosV+mMFnQtfHXkrKyiimv0
 jw9pve0W3xEtoOE66m46DejbD9KAdgi35u8mYNa5StjxlAr7JvvQP7lYZUguBddkPOcMvvCj95
 d50jFXwVqUfLQ6uPrU9Fwt9TIPV1cWfQbB+v11j/00jbihcBpDH88/j4xAw43Foj1tQs5TZL4Q
 zuQ=
X-IronPort-AV: E=Sophos;i="5.77,321,1596492000"; 
   d="scan'208";a="13505602"
Subject: Re: [meta-virtualization][PATCH] Adding k3s recipe
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
References: <20200821205529.29901-1-erik.jansson@axis.com>
 <6adf1052-aa13-b890-606e-119d70eab618@axis.com>
 <CADkTA4Mkpo9S92Pfqd_eDYiyt+3zopP9p97JF3yct2TWuc3kNQ@mail.gmail.com>
 <c13a622a-5d4c-d87e-f901-673bec12fe33@axis.com>
 <CADkTA4MArixWsydAc1YdwCvyiPHx36nqcigpLf=j_Fw6NudnRQ@mail.gmail.com>
 <ae269803-37c4-d72a-d19e-097a093baa60@axis.com>
 <CADkTA4NbKfrK0CwQz7P5ecGCgL_d_0CZnuROoVTL=iLWJ6kvMw@mail.gmail.com>
 <8943d000-4ce1-164b-eb8e-2bedfaca2981@axis.com>
 <CADkTA4PNMnRJ3iZu0TvsK+8S_MMySNxx-=fk7rFuCCOStcRdWw@mail.gmail.com>
 <16380B0CA000AB98.28124@lists.yoctoproject.org>
 <c381ef59-ef51-840e-626e-ddb3e5706757@axis.com>
 <CADkTA4PMkHjKHmb0iwR1+xcu660xBGOBTQH0+exqfGL-VNhdAg@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <aa2bf1ba-c246-b510-7cb5-e00a5123a866@axis.com>
Date: Wed, 30 Sep 2020 10:12:57 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <CADkTA4PMkHjKHmb0iwR1+xcu660xBGOBTQH0+exqfGL-VNhdAg@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX03.axis.com (10.0.5.17) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-09-29 21:58, Bruce Ashfield wrote:
> Thanks for the updated series, see some comments inline.

Awesome, I am happy that you liked it!

> Thanks for the README. It's a good start and pretty much all we need
> for now.

I realized I had forgotten to run markdownlint for it, so a slightly
updated version is included in the upcoming patch update.

> I'll be doing some build and runtime testing and can do some tweaks
> as required.

Perfect!

> For these scripts, we have the license, but not a copyright. Which 
> should be ok, but are the scripts completely written by you (or
> someone at your company?), if so, it is a good idea to put a
> copyright header on the scripts, so we can know the origin.

I have added that now; I am quite sure that Erik is the author of those. 
By the look of the coding style, it sure seems like it. (I have sent a 
text to him just to verify and if I am wrong in my assumption here, I 
will update accordingly.)

> I'm going to abstract the networking configuration into a 
> kubernetes-networking package, so we can share it amongst the various
> recipes, and have a way to control whether or not this configuration
> is installed. That allows an easy way to both share and override the
> networking.

I like that!

> I'll also take care of getting ipset in a place where we don't have
> to add extra layer dependencies.

Perfect, thank you!

Following this reply, I will send the latest updates in a separate e-mail.

BR,

/Joakim
