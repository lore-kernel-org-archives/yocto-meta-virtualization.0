Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web12.10100.1602762020162396946
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 15 Oct 2020 04:40:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@axis.com header.s=axis-central1 header.b=c7+f8yUm;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=203; q=dns/txt; s=axis-central1;
  t=1602762020; x=1634298020;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=XvBrgjcpMJbcpgjQP3xyQy+UF0kbIbqLOxCr2AY+0Ac=;
  b=c7+f8yUmWgLG429qDpra8Ki3X6SGhGGSI3ozK7c67Rtszi1zydn02uUL
   43+H0zK8pSli3V4VYGE8kDpdDMFfXKgtCDHK59pOAuKSfuiyznKsyc8UY
   Dq1VDpajdedc61MTVNIPtEoRLA6pAVnCvQCRvc/rO9EUTuukWaqn4sCKT
   9+RZUVE49Y5f7KqRLL5c/7aohnM5NHMBdf4ck3HWh99lpzGIQUTRb1KoD
   SIAPzdkw2xNIzpnG2ZR/kMzgy9CCjyTiSvuNPX8uCbS72TVPWM+WCY7av
   GlXRvKliov30DFvx4051Q0LtPeV43aLMqN/CVo7u1WO1YlLDtMF7qgRXc
   g==;
IronPort-SDR: GudfEw1SGvgoa3FgUPdyHvsTLfmV7c50B5ntQurBDrJkbjY4LCi2o9mnfq+IBaqqyP6kZog8Gj
 k5BCyOgOwsnpU/4hIbu2EGHQsyur5+ffma4iLpTo8vVpk7HY0MdEOnXWBnGxDdQ1k4C3tFOksq
 U2ITDctRvFBnay9zKPfVU7FFBKa85jjS9rIX5Fiu3aSQhQ8nCSPHAlbdQp1+BN7UCn52Xkm4ok
 ZZyOs63XI2gDO0/4Xd3cD3GSnlCaHyowGxNbi3Wt86JP2GxXfCRwgKQitrRsvTRj9inonMsfbh
 jfw=
X-IronPort-AV: E=Sophos;i="5.77,378,1596492000"; 
   d="scan'208";a="13541996"
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
 <1639818C3E50A226.8589@lists.yoctoproject.org>
 <1639D7B9311FC65C.18704@lists.yoctoproject.org>
 <cb7cddae-6fbc-1307-618a-0c99e88f8070@axis.com>
 <CADkTA4On-SF-80JAPQ0-Q=uAi2xZ7=BqHhVupaaXNEtCdP9rcw@mail.gmail.com>
From: "Joakim Roubert" <joakim.roubert@axis.com>
Message-ID: <600dff8c-a015-c9c0-1212-cc456a02efc6@axis.com>
Date: Thu, 15 Oct 2020 13:40:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <CADkTA4On-SF-80JAPQ0-Q=uAi2xZ7=BqHhVupaaXNEtCdP9rcw@mail.gmail.com>
Return-Path: joakim.roubert@axis.com
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: XBOX02.axis.com (10.0.5.16) To XBOX03.axis.com (10.0.5.17)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2020-10-14 18:38, Bruce Ashfield wrote:
> 
> Can you re-send it with a "v4" in the subject ? That will hopefully
> let it escape gmail's conversation filter.

Sure! No problem.

BR,

/Joakim
